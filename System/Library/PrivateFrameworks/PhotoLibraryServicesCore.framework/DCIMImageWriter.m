@interface DCIMImageWriter
+ (BOOL)isLivePhotoFilteredVideoPath:(id)a3;
+ (id)defaultFileExtensionForAssetType:(signed __int16)a3;
+ (id)filteredVideoPathForRecordedLivePhotoVideoPath:(id)a3;
+ (id)incomingDirectoryPath;
+ (id)incomingDirectoryPathForPhotoStream;
+ (id)preferredFileExtensionForType:(id)a3;
+ (id)recordedVideoPathForFilteredLivePhotoVideoPath:(id)a3;
+ (id)sharedDCIMWriter;
+ (id)uniqueIncomingPathForAssetWithUUID:(id)a3 andExtension:(id)a4 isPhotoStream:(BOOL)a5;
+ (signed)savedAssetTypeForCameraCapturedAsset;
+ (signed)savedAssetTypeForPhotoBoothAsset;
+ (void)writeableDataForImage:(id)a3 previewImage:(id)a4 imageData:(id)a5 imageUTIType:(id)a6 imageSource:(CGImageSource *)a7 primaryImageProperties:(id)a8 imageOrientation:(int64_t)a9 thumbnailDataOut:(id *)a10 imageUTITypeOut:(id *)a11 primaryImagePropertiesOut:(id *)a12 isJPEGOut:(BOOL *)a13 imageDataOut:(id *)a14;
+ (void)writeableDataForImageData:(id)a3 imageUTIType:(id)a4 imageSource:(CGImageSource *)a5 thumbnailDataOut:(id *)a6 imageUTITypeOut:(id *)a7 primaryImagePropertiesOut:(id *)a8 imageDataOut:(id *)a9;
- (BOOL)_writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6 duringBurst:(BOOL)a7;
- (BOOL)saveImageJobToDisk:(id)a3;
- (BOOL)writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6;
- (id)_cameraAssetExtensionForType:(signed __int16)a3;
@end

@implementation DCIMImageWriter

- (BOOL)_writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6 duringBurst:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = CFWriteStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFURLRef)a3);
  if (v14)
  {
    v15 = v14;
    if (CFWriteStreamOpen(v14))
    {
      CFDataRef v16 = (const __CFData *)CFWriteStreamCopyProperty(v15, @"_kCFStreamPropertyFileNativeHandle");
      if (v16)
      {
        CFDataRef v17 = v16;
        *(_DWORD *)buffer = 0;
        v21.location = 0;
        v21.length = 4;
        CFDataGetBytes(v16, v21, buffer);
        fcntl(*(int *)buffer, 48, 1);
        fcntl(*(int *)buffer, 62, 1);
        if (v7) {
          fcntl(*(int *)buffer, 82, 1);
        }
        CFRelease(v17);
      }
      char v18 = CGImageWriteEXIFJPEGWithMetadata();
      CFWriteStreamClose(v15);
    }
    else
    {
      char v18 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (BOOL)writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6
{
  return [(DCIMImageWriter *)self _writeJPEGToURL:a3 withData:a4 thumbnail:a5 properties:a6 duringBurst:0];
}

- (id)_cameraAssetExtensionForType:(signed __int16)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E589EDF0[(unsigned __int16)a3];
  }
}

- (BOOL)saveImageJobToDisk:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"AssetPathFromType"];

  v76 = self;
  if (v5)
  {
    v6 = [v4 objectForKey:@"AssetPathFromType"];
    __int16 v7 = [v6 intValue];

    v8 = [(DCIMImageWriter *)self _cameraAssetExtensionForType:v7];
  }
  else
  {
    v9 = [v4 objectForKey:@"PhotoDestinationPath"];
    v10 = v9;
    if (v9)
    {
      v8 = [v9 pathExtension];
    }
    else
    {
      v8 = 0;
    }
  }
  id v11 = [v4 objectForKey:@"DestinationAssetUUID"];
  uint64_t v12 = +[DCIMImageWriter uniqueIncomingPathForAssetWithUUID:v11 andExtension:v8 isPhotoStream:0];

  v86 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
  id v13 = [v86 path];

  if (!v13)
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v101 = incomingDirectoryPath_homeDirectory;
      _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_ERROR, "saveImageJobToDisk incomingDirectoryPath_homeDirectory %@", buf, 0xCu);
    }

    v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v101 = incomingDirectoryPath;
      _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, "saveImageJobToDisk incomingDirectoryPath %@", buf, 0xCu);
    }

    CFDataRef v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      CFDataRef v17 = [v4 objectForKey:@"DestinationAssetUUID"];
      *(_DWORD *)buf = 138412290;
      uint64_t v101 = (uint64_t)v17;
      _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, "saveImageJobToDisk [job objectForKey:kPLImageWriterDestinationAssetUUID] %@", buf, 0xCu);
    }
    char v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v101 = (uint64_t)v8;
      _os_log_impl(&dword_19BCFB000, v18, OS_LOG_TYPE_ERROR, "saveImageJobToDisk extension %@", buf, 0xCu);
    }

    v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v101 = v12;
      _os_log_impl(&dword_19BCFB000, v19, OS_LOG_TYPE_ERROR, "saveImageJobToDisk photoFilePath %@", buf, 0xCu);
    }

    v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v101 = (uint64_t)v86;
      _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_ERROR, "saveImageJobToDisk photoFileURL %@", buf, 0xCu);
    }
  }
  unsigned int v21 = +[PLValidatedSavedAssetType maskForPhotoBoothAsset];
  v22 = [v4 objectForKey:@"kPLImageWriterSavedAssetTypeKey"];
  int v77 = PLValidatedSavedAssetTypeApplies(v21, (__int16)[v22 integerValue]);

  v23 = [v4 objectForKey:@"EXIFProperties"];
  uint64_t v79 = *MEMORY[0x1E4F2FC20];
  v80 = objc_msgSend(v23, "objectForKeyedSubscript:");
  uint64_t v78 = *MEMORY[0x1E4F15538];
  v85 = objc_msgSend(v80, "objectForKey:");
  CFDataRef v24 = [v4 objectForKey:@"ImageData"];
  v25 = [v4 objectForKey:@"ImageOrientation"];
  if (!v25)
  {
    v26 = [v23 objectForKey:*MEMORY[0x1E4F2FCA0]];

    if (v26)
    {
      v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:PLImageOrientationFromImageProperties(v23)];
    }
    else
    {
      v25 = 0;
    }
  }
  v89 = v4;
  uint64_t v27 = [v4 objectForKey:@"PreviewImageRef"];
  v93 = 0;
  if (v27 && v25)
  {
    v93 = [NSClassFromString((NSString *)@"UIImage") imageWithCGImage:v27 scale:0 orientation:1.0];
  }
  v92 = 0;
  if (v24 && v25)
  {
    uint64_t v28 = (int)[v25 intValue];
    v29 = CGImageSourceCreateWithData(v24, 0);
    if (v29)
    {
      v30 = v29;
      if (CGImageSourceGetCount(v29)) {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v30, 0, 0);
      }
      else {
        ImageAtIndex = 0;
      }
      CFRelease(v30);
    }
    else
    {
      ImageAtIndex = 0;
    }
    v92 = [NSClassFromString((NSString *)@"UIImage") imageWithCGImage:ImageAtIndex scale:v28 orientation:1.0];
    CGImageRelease(ImageAtIndex);
  }
  v90 = v23;
  buf[0] = 0;
  uint64_t v32 = [v4 objectForKeyedSubscript:@"Type"];
  v33 = (void *)v32;
  if (v32)
  {
    uint64_t v98 = *MEMORY[0x1E4F2FF78];
    uint64_t v99 = v32;
    CFDictionaryRef v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
  }
  else
  {
    CFDictionaryRef v34 = 0;
  }
  CFDictionaryRef v82 = v34;
  CGImageSourceRef v35 = CGImageSourceCreateWithData(v24, v34);
  id v96 = 0;
  id v97 = 0;
  id v94 = 0;
  id v95 = 0;
  +[DCIMImageWriter writeableDataForImage:previewImage:imageData:imageUTIType:imageSource:primaryImageProperties:imageOrientation:thumbnailDataOut:imageUTITypeOut:primaryImagePropertiesOut:isJPEGOut:imageDataOut:](DCIMImageWriter, "writeableDataForImage:previewImage:imageData:imageUTIType:imageSource:primaryImageProperties:imageOrientation:thumbnailDataOut:imageUTITypeOut:primaryImagePropertiesOut:isJPEGOut:imageDataOut:", v92, v93, v24, v33, v35, v23, (int)[v25 intValue], &v97, &v96, &v95, buf, &v94);
  id v84 = v97;
  id v91 = v96;
  id v88 = v95;
  id v36 = v94;
  if (v35) {
    CFRelease(v35);
  }
  v83 = (void *)v12;
  v81 = v25;
  if ([v36 length] && v91)
  {
    if (buf[0])
    {
      if (v77)
      {
        id v37 = v88;
        v38 = (void *)MEMORY[0x19F38F510]();
        v39 = (void *)[v37 mutableCopy];
        if (!v39)
        {
          v39 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        id v88 = v39;
        v40 = [v39 objectForKey:@"{IPTC}"];
        v41 = (void *)[v40 mutableCopy];

        if (!v41)
        {
          v41 = [MEMORY[0x1E4F1CA60] dictionary];
          [v88 setObject:v41 forKey:@"{IPTC}"];
        }
        v42 = [v41 objectForKey:@"Keywords"];
        v43 = (void *)[v42 mutableCopy];

        if (!v43)
        {
          v43 = [MEMORY[0x1E4F1CA48] array];
          [v41 setObject:v43 forKey:@"Keywords"];
        }
        v44 = v8;
        if (([v43 containsObject:@"Photo Booth"] & 1) == 0) {
          [v43 addObject:@"Photo Booth"];
        }
      }
      else
      {
        v44 = v8;
      }
      v54 = v86;
      -[DCIMImageWriter _writeJPEGToURL:withData:thumbnail:properties:duringBurst:](v76, "_writeJPEGToURL:withData:thumbnail:properties:duringBurst:", v86, v36, v84);
    }
    else
    {
      uint64_t v56 = +[DCIMImageWriter preferredFileExtensionForType:v91];

      v54 = v86;
      v57 = [v86 pathExtension];
      char v58 = [v57 isEqualToString:v56];

      if ((v58 & 1) == 0)
      {
        v59 = [v86 URLByDeletingPathExtension];
        uint64_t v60 = [v59 URLByAppendingPathExtension:v56];

        v54 = (void *)v60;
      }
      [v36 writeToURL:v54 atomically:0];
      v44 = (void *)v56;
    }
    v45 = +[PLFileSystemPersistence filesystemPersistenceBatchItemForFileAtURL:v54];
    v47 = v89;
    if (v45)
    {
      v61 = [v89 objectForKey:@"AssetWriterID"];

      if (v61)
      {
        v62 = [v89 objectForKey:@"AssetWriterID"];
        [v45 setString:v62 forKey:@"com.apple.assetsd.creatorBundleID"];
      }
      v63 = [v89 objectForKey:@"AssetWriterDisplayName"];

      if (v63)
      {
        v64 = [v89 objectForKey:@"AssetWriterDisplayName"];
        [v45 setString:v64 forKey:@"com.apple.assetsd.importedByDisplayName"];
      }
      v65 = [v89 objectForKey:@"OriginalAssetUUID"];

      if (v65)
      {
        v66 = [v89 objectForKey:@"OriginalAssetUUID"];
        [v45 setUUIDString:v66 forKey:@"com.apple.assetsd.originalAssetUUID"];
      }
      v67 = v44;
      v68 = [v90 objectForKeyedSubscript:v79];
      v69 = [v68 objectForKey:v78];
      if (v69) {
        [v45 setUUIDString:v69 forKey:@"com.apple.assetsd.avalanche.UUID"];
      }
      v70 = [v89 objectForKey:@"kPLImageWriterCameraAdjustmentData"];
      if (v70) {
        [v45 setData:v70 forKey:@"com.apple.assetsd.inProgress.cameraAdjustmentsData"];
      }
      [v45 persist];

      v44 = v67;
    }
    id v87 = v36;
    v71 = v33;
    CFDataRef v72 = v24;
    v50 = [v89 objectForKey:@"Date"];
    if (v50) {
      [v54 setResourceValue:v50 forKey:*MEMORY[0x1E4F1C540] error:0];
    }
    v73 = [v89 objectForKey:@"callStack"];

    if (v73) {
      NSLog((NSString *)@"##### SAVE to %@, uti %@, extension %@", v54, v91, v44);
    }
    v8 = v44;
    v74 = [v54 path];
    [v89 setObject:v74 forKey:@"PhotoSourcePath"];

    [v89 setObject:v91 forKey:@"Type"];
    v55 = v88;
    if (v88) {
      [v89 setObject:v88 forKey:@"EXIFProperties"];
    }
    v52 = v80;
    CFDataRef v53 = v72;
    v33 = v71;
    id v36 = v87;
  }
  else
  {
    v45 = PLServicesLocalizedFrameworkString(@"ENCODING_FAILED");
    v46 = (objc_class *)MEMORY[0x1E4F1C9E8];
    v47 = v89;
    id v48 = v89;
    id v49 = [v46 alloc];
    v50 = objc_msgSend(v49, "initWithObjectsAndKeys:", v45, *MEMORY[0x1E4F28568], 0);
    v51 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos" code:12 userInfo:v50];
    [v48 setObject:v51 forKey:@"DCIMWriter Error"];

    v52 = v80;
    CFDataRef v53 = v24;
    v54 = v86;
    v55 = v88;
  }

  return 1;
}

+ (id)defaultFileExtensionForAssetType:(signed __int16)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E589EDD8[(unsigned __int16)a3];
  }
}

+ (id)preferredFileExtensionForType:(id)a3
{
  v3 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:a3];
  if ([v3 isEqual:*MEMORY[0x1E4F444E0]])
  {
    id v4 = @"TIF";
  }
  else if ([v3 isEqual:*MEMORY[0x1E4F44460]])
  {
    id v4 = @"PNG";
  }
  else if ([v3 isEqual:*MEMORY[0x1E4F443D0]])
  {
    id v4 = @"GIF";
  }
  else if ([v3 isEqual:*MEMORY[0x1E4F44410]])
  {
    id v4 = @"JPG";
  }
  else
  {
    v5 = [v3 preferredFilenameExtension];
    v6 = v5;
    if (v5)
    {
      id v4 = [v5 uppercaseString];
    }
    else
    {
      id v4 = @"JPG";
    }
  }
  return v4;
}

+ (BOOL)isLivePhotoFilteredVideoPath:(id)a3
{
  v3 = [a3 stringByDeletingPathExtension];
  id v4 = [v3 pathExtension];

  LOBYTE(v3) = [v4 isEqualToString:@"FILTERED"];
  return (char)v3;
}

+ (id)recordedVideoPathForFilteredLivePhotoVideoPath:(id)a3
{
  id v4 = a3;
  if ([a1 isLivePhotoFilteredVideoPath:v4])
  {
    v5 = [v4 pathExtension];
    v6 = [v4 stringByDeletingPathExtension];
    __int16 v7 = [v6 stringByDeletingPathExtension];

    v8 = [v7 stringByAppendingPathExtension:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)filteredVideoPathForRecordedLivePhotoVideoPath:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stringByDeletingPathExtension];
  v5 = [v3 pathExtension];

  v6 = [v4 stringByAppendingPathExtension:@"FILTERED"];
  __int16 v7 = [v6 stringByAppendingPathExtension:v5];

  return v7;
}

+ (id)uniqueIncomingPathForAssetWithUUID:(id)a3 andExtension:(id)a4 isPhotoStream:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    uint64_t v9 = +[PLUUIDString string];

    id v7 = (id)v9;
  }
  if (a5) {
    +[DCIMImageWriter incomingDirectoryPathForPhotoStream];
  }
  else {
  v10 = +[DCIMImageWriter incomingDirectoryPath];
  }
  id v11 = [NSString stringWithFormat:@"%.f%@%@", CFAbsoluteTimeGetCurrent() * 100.0, @"__", v7];
  uint64_t v12 = [v10 stringByAppendingPathComponent:v11];

  if (v8)
  {
    uint64_t v13 = [v12 stringByAppendingPathExtension:v8];

    uint64_t v12 = (void *)v13;
  }

  return v12;
}

+ (id)incomingDirectoryPathForPhotoStream
{
  pl_dispatch_once(&incomingDirectoryPathForPhotoStream_onceToken, &__block_literal_global_31);
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 createDirectoryAtPath:incomingDirectoryPathForPhotoStream_incomingDirectory withIntermediateDirectories:1 attributes:0 error:0];

  id v3 = (void *)incomingDirectoryPathForPhotoStream_incomingDirectory;
  return v3;
}

void __54__DCIMImageWriter_incomingDirectoryPathForPhotoStream__block_invoke()
{
  NSHomeDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v3 stringByAppendingPathComponent:@"Media/PhotoStreamsData/.MISC/Incoming"];
  uint64_t v1 = [v0 copy];
  v2 = (void *)incomingDirectoryPathForPhotoStream_incomingDirectory;
  incomingDirectoryPathForPhotoStream_incomingDirectory = v1;
}

+ (id)incomingDirectoryPath
{
  pl_dispatch_once(&incomingDirectoryPath_onceToken, &__block_literal_global_25);
  v2 = (void *)incomingDirectoryPath;
  return v2;
}

void __40__DCIMImageWriter_incomingDirectoryPath__block_invoke()
{
  v0 = NSHomeDirectory();
  uint64_t v1 = [v0 copy];
  v2 = (void *)incomingDirectoryPath_homeDirectory;
  incomingDirectoryPath_homeDirectory = v1;

  id v3 = [(id)incomingDirectoryPath_homeDirectory stringByAppendingPathComponent:@"Media/DCIM/.MISC/Incoming"];
  uint64_t v4 = [v3 copy];
  v5 = (void *)incomingDirectoryPath;
  incomingDirectoryPath = v4;

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:incomingDirectoryPath];

  if ((v7 & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtPath:incomingDirectoryPath withIntermediateDirectories:1 attributes:0 error:0];
  }
}

+ (signed)savedAssetTypeForPhotoBoothAsset
{
  return +[PLValidatedSavedAssetType savedAssetTypeForPhotoBoothAsset];
}

+ (signed)savedAssetTypeForCameraCapturedAsset
{
  return +[PLValidatedSavedAssetType savedAssetTypeForCameraAsset];
}

+ (void)writeableDataForImage:(id)a3 previewImage:(id)a4 imageData:(id)a5 imageUTIType:(id)a6 imageSource:(CGImageSource *)a7 primaryImageProperties:(id)a8 imageOrientation:(int64_t)a9 thumbnailDataOut:(id *)a10 imageUTITypeOut:(id *)a11 primaryImagePropertiesOut:(id *)a12 isJPEGOut:(BOOL *)a13 imageDataOut:(id *)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a8;
  if (v20) {
    CFDataRef v24 = v20;
  }
  else {
    CFDataRef v24 = v19;
  }
  ImageAtIndex = (CGImage *)[v24 CGImage];
  *(void *)valuePtr = 0;
  if (v19) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v21 == 0;
  }
  int v27 = !v26;
  id v90 = v19;
  if (v26)
  {
    if (!v19)
    {
      unsigned int v28 = 1;
      goto LABEL_22;
    }
    uint64_t v30 = [v19 imageOrientation];
    if ((unint64_t)(v30 - 1) > 2)
    {
      unsigned int v28 = 3;
      if (v22) {
        goto LABEL_22;
      }
    }
    else
    {
      unsigned int v28 = dword_19BDC6FDC[v30 - 1];
      if (v22) {
        goto LABEL_22;
      }
    }
    uint64_t v29 = CGImageGetUTType((CGImageRef)[v19 CGImage]);
  }
  else
  {
    unsigned int v28 = 1;
    if (v22 || !a7) {
      goto LABEL_22;
    }
    uint64_t v29 = CGImageSourceGetType(a7);
  }
  id v22 = (id)v29;
LABEL_22:
  unsigned int v87 = v28;
  id v91 = v21;
  v89 = v22;
  v31 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v22];
  uint64_t v32 = (id *)MEMORY[0x1E4F44410];
  if (v31)
  {
    v33 = v31;
    int v34 = [v31 isEqual:*MEMORY[0x1E4F44450]];
    id v35 = *v32;
  }
  else
  {
    id v35 = (id)*MEMORY[0x1E4F44410];
    int v34 = 0;
    v33 = v35;
  }
  char v88 = [v33 isEqual:v35];
  BOOL v36 = 0;
  if (ImageAtIndex) {
    int v37 = 0;
  }
  else {
    int v37 = v27;
  }
  if (!a7 || !v37)
  {
    id v49 = v91;
    goto LABEL_68;
  }
  id v38 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  CFDictionaryRef v39 = (const __CFDictionary *)objc_msgSend(v38, "initWithObjectsAndKeys:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F2FDF8], 0);
  size_t index = CGImageSourceGetPrimaryImageIndex(a7);
  CFDictionaryRef v40 = CGImageSourceCopyPropertiesAtIndex(a7, index, v39);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v42 = v41;
  if (v40)
  {
    CFDictionaryRef v82 = v39;
    id v83 = v41;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v40, (const void *)*MEMORY[0x1E4F2FD00]);
    CFNumberRef v44 = (const __CFNumber *)CFDictionaryGetValue(v40, (const void *)*MEMORY[0x1E4F2FCE8]);
    if (!v23)
    {
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v40];
    }
    v45 = [v23 objectForKey:*MEMORY[0x1E4F2F800]];
    v46 = [v45 objectForKey:*MEMORY[0x1E4F2FEA0]];
    int v81 = [v46 intValue];

    v47 = [v45 objectForKey:*MEMORY[0x1E4F2FEA8]];
    int v85 = [v47 intValue];

    if (Value && v44)
    {
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr[1]);
      CFNumberGetValue(v44, kCFNumberIntType, valuePtr);
    }
    pl_dispatch_once(&PLPhysicalDeviceIsIPad___onceToken, &__block_literal_global);
    if (PLPhysicalDeviceIsIPad___isIPad) {
      int64_t v48 = +[PLAssetFormatsCore wildcatStackFormat];
    }
    else {
      int64_t v48 = 3039;
    }
    int v52 = valuePtr[0];
    int v51 = valuePtr[1];
    +[PLAssetFormatsCore sizeForFormat:v48];
    if (v52 <= v51) {
      int v55 = v51;
    }
    else {
      int v55 = v52;
    }
    if (v53 < v54) {
      double v53 = v54;
    }
    float v56 = floor(log2((double)(int)((double)v55 / v53)));
    int v57 = (int)exp2f(v56);
    if (v57 >= 32) {
      int v57 = 32;
    }
    if (v57 <= 1) {
      uint64_t v50 = 1;
    }
    else {
      uint64_t v50 = v57;
    }
    CFRelease(v40);

    CFDictionaryRef v39 = v82;
    v42 = v83;
    LODWORD(v40) = v81;
    if (v34) {
      goto LABEL_53;
    }
  }
  else
  {
    int v85 = 0;
    uint64_t v50 = 1;
    if (v34)
    {
LABEL_53:
      char v58 = [MEMORY[0x1E4F28ED0] numberWithInt:72];
      [v42 setObject:v58 forKey:*MEMORY[0x1E4F2FEC0]];
    }
  }
  if (v50 != 1)
  {
    v59 = [MEMORY[0x1E4F28ED0] numberWithInt:v50];
    [v42 setObject:v59 forKey:*MEMORY[0x1E4F2FF58]];
  }
  id v49 = v91;
  if (!a14 && (int)v40 >= 1 && v85 >= 1)
  {
    pl_dispatch_once(&PLPhysicalDeviceIsIPad___onceToken, &__block_literal_global);
    if (!PLPhysicalDeviceIsIPad___isIPad)
    {
      id v84 = v42;
      CFDictionaryRef v60 = v39;
      objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v91, "bytes") + v40, v85, 0);
      CFDataRef v61 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v62 = CGImageSourceCreateWithData(v61, 0);
      if (v62)
      {
        v63 = v62;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v62, 0, 0);
        CFRelease(v63);
        if (ImageAtIndex)
        {
          CGImageRef ImageByRemovingBlackBarsFromPreviewImage = createImageByRemovingBlackBarsFromPreviewImage(ImageAtIndex, valuePtr[1], valuePtr[0]);
          if (ImageByRemovingBlackBarsFromPreviewImage)
          {
            v65 = ImageByRemovingBlackBarsFromPreviewImage;
            CGImageRelease(ImageAtIndex);
            ImageAtIndex = v65;
          }

          CFDictionaryRef v39 = v60;
          v66 = v84;
          goto LABEL_67;
        }
      }

      CFDictionaryRef v39 = v60;
      v42 = v84;
    }
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a7, index, (CFDictionaryRef)v42);
  v66 = v42;
LABEL_67:
  BOOL v36 = ImageAtIndex != 0;

LABEL_68:
  if (a14)
  {
    if (v49)
    {
      v67 = v49;
    }
    else
    {
      v67 = [MEMORY[0x1E4F1CA58] data];
      v68 = [v33 identifier];
      v69 = CGImageDestinationCreateWithData(v67, v68, 1uLL, 0);

      if (v69)
      {
        CGImageDestinationAddImage(v69, ImageAtIndex, 0);
        if (!CGImageDestinationFinalize(v69))
        {

          v67 = 0;
        }
        CFRelease(v69);
      }
    }
    v70 = v67;
    *a14 = v70;
  }
  if (!v23)
  {
    id v71 = objc_alloc(MEMORY[0x1E4F28ED0]);
    if (v87 - 2 > 2) {
      uint64_t v72 = 6;
    }
    else {
      uint64_t v72 = dword_19BDC7004[v87 - 2];
    }
    v73 = (void *)[v71 initWithInt:v72];
    v74 = [MEMORY[0x1E4F1CA60] dictionary];
    PLAddTIFFDPIPropertiesToDictionary(v74);
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v73, *MEMORY[0x1E4F2FCA0], v74, *MEMORY[0x1E4F2FD40], 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a10)
  {
    uint64_t v75 = (uint64_t)ImageAtIndex;
    if (!v36)
    {
      v76 = v20;
      if (!v20) {
        v76 = v90;
      }
      uint64_t v75 = [v76 CGImage];
    }
    if ((unint64_t)(a9 - 1) > 6) {
      uint64_t v77 = 0;
    }
    else {
      uint64_t v77 = qword_19BDC70F0[a9 - 1];
    }
    uint64_t v78 = (void *)[objc_alloc(NSClassFromString((NSString *)@"UIImage")) initWithCGImage:v75 scale:v77 orientation:1.0];
    id v79 = PLCreateImageWithFormatFromImage(v78, 0, 3039, 0, 0);
    *a10 = (id)DCIM_newJPEGRepresentationWithPLImage(v79, 0.899999976);
  }
  if (a11)
  {
    *a11 = [v33 identifier];
  }
  if (a12) {
    *a12 = v23;
  }
  if (a13) {
    *a13 = v88;
  }
  if (ImageAtIndex) {
    BOOL v80 = v36;
  }
  else {
    BOOL v80 = 0;
  }
  if (v80) {
    CFAutorelease(ImageAtIndex);
  }
}

+ (void)writeableDataForImageData:(id)a3 imageUTIType:(id)a4 imageSource:(CGImageSource *)a5 thumbnailDataOut:(id *)a6 imageUTITypeOut:(id *)a7 primaryImagePropertiesOut:(id *)a8 imageDataOut:(id *)a9
{
}

+ (id)sharedDCIMWriter
{
  pl_dispatch_once(&sharedDCIMWriter_onceToken, &__block_literal_global_111);
  v2 = (void *)sharedDCIMWriter_sharedDCIMWriter;
  return v2;
}

uint64_t __35__DCIMImageWriter_sharedDCIMWriter__block_invoke()
{
  sharedDCIMWriter_sharedDCIMWriter = objc_alloc_init(DCIMImageWriter);
  return MEMORY[0x1F41817F8]();
}

@end