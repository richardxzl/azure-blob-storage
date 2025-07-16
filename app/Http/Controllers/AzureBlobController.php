<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AzureBlobController extends Controller
{
    public function upload(Request $request)
    {
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $path = Storage::disk('azure')->putFile('uploads', $file);
            return response()->json(['url' => $path], 200);
        }
        return response()->json(['error' => 'No file uploaded.'], 400);
    }
}
