@interface PLThumbFileManager
- (BOOL)_writeImage:(id)a3 forThumbIdentifier:(id)a4;
- (BOOL)setImageForEntry:(id)a3 withIdentifier:(id)a4 orIndex:(unint64_t)a5 photoUUID:(id)a6 options:(id)a7;
- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4;
@end

@implementation PLThumbFileManager

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    v7 = (void *)MEMORY[0x1E4F1C9B8];
    v8 = [(PLThumbFileManagerCore *)self thumbnailPathForThumbIdentifier:v6];
    CFDataRef v9 = [v7 dataWithContentsOfFile:v8];

    if ([(__CFData *)v9 length])
    {
      v10 = +[PLJPEGThumbnailDecode decodeSessionOptions];
      int CGImageFromImageData = PFFigCreateCGImageFromImageData();

      v12 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = NSStringFromSelector(a2);
        uint64_t v14 = CGImageFromImageData;
        v15 = [(PLThumbFileManagerCore *)self thumbnailPathForThumbIdentifier:v6];
        *(_DWORD *)buf = 138412802;
        v21 = v13;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "PFFigCreateCGImageFromImageData %@ returned %ld for %@.", buf, 0x20u);
      }
      v16 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(PLThumbFileManagerCore *)self thumbnailPathForThumbIdentifier:v6];
        *(_DWORD *)buf = 138412290;
        v21 = v17;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Fall back to software decoding for %@", buf, 0xCu);
      }
      CGImageFromJPEGData = CreateCGImageFromJPEGData(v9);
    }
    else
    {
      CGImageFromJPEGData = 0;
    }
  }
  else
  {
    CGImageFromJPEGData = 0;
  }

  return CGImageFromJPEGData;
}

- (BOOL)_writeImage:(id)a3 forThumbIdentifier:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 length])
  {
    char v15 = 0;
    goto LABEL_20;
  }
  v8 = [(PLThumbFileManagerCore *)self thumbnailPathForThumbIdentifier:v7];
  CFDataRef v9 = [v6 uniformTypeIdentifier];
  v10 = [v6 data];
  v11 = v10;
  if (v10 && v9)
  {
    v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v9];
    int v13 = [v12 conformsToType:*MEMORY[0x1E4F44410]];

    if (v13)
    {
      id v14 = [v6 data];
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v14 = 0;
LABEL_9:
  uint64_t v16 = *MEMORY[0x1E4F56158];
  v28[0] = &unk_1EEBEFE40;
  uint64_t v17 = *MEMORY[0x1E4F56150];
  v27[0] = v16;
  v27[1] = v17;
  uint64_t v25 = *MEMORY[0x1E4F56358];
  uint64_t v26 = &unk_1EEBF2AF8;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v28[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  if (!v14)
  {
    if (([v6 hasAuxiliaryImages] & 1) != 0
      || ![v6 ioSurface]
      || ([v6 ioSurface], PFFigJPEGDataFromImage(), (id v14 = 0) == 0))
    {
      if ([v6 CGImage])
      {
        v20 = (CGImage *)[v6 CGImage];
        v21 = [v6 auxiliaryImageRecords];
        PLJPEGDataFromImage(v20, 1, v21, 0.899999976);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = 0;
      }
    }
  }
  if ([v14 length])
  {
    __int16 v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v23 = [v8 stringByDeletingLastPathComponent];
    [v22 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:0];

    char v15 = [v14 writeToFile:v8 options:1073741825 error:0];
  }
  else
  {
    char v15 = 0;
  }

LABEL_20:
  return v15;
}

- (BOOL)setImageForEntry:(id)a3 withIdentifier:(id)a4 orIndex:(unint64_t)a5 photoUUID:(id)a6 options:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_onceToken != -1) {
    dispatch_once(&setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_onceToken, &__block_literal_global_93786);
  }
  BOOL v15 = [(PLThumbFileManagerCore *)self isReadOnly];
  LOBYTE(v16) = 0;
  if (v11 && !v15)
  {
    [v11 pixelSize];
    [v11 pixelSize];
    uint64_t v17 = PLSizeMake();
    v18 = (void *)MEMORY[0x1E4F8B9F0];
    v19 = [(PLThumbFileManagerCore *)self format];
    uint64_t v20 = [v18 maxMasterSizeFromSourceImageSize:v17 format:v19];

    if ((int)v17 <= (int)v20 && SHIDWORD(v17) <= SHIDWORD(v20))
    {
      __int16 v24 = (PLImageContainer *)v11;
    }
    else
    {
      __int16 v22 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v44 = 2048;
        id v45 = (id)(int)v17;
        __int16 v46 = 2048;
        uint64_t v47 = v17 >> 32;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "Attempting to set a file backed thumbnail for asset (%@) with larger allowed size (%lu, %lu), attempting downscale", buf, 0x20u);
      }

      if (![v11 ioSurface]
        || (*(void *)buf = 0,
            !PLCreateDownscaledIOSurfaceFromIOSurface((IOSurfaceRef)[v11 ioSurface], v20, (IOSurfaceRef *)buf))|| (uint64_t v23 = [PLImageContainer alloc], v24 = -[PLImageContainer initWithIOSurface:](v23, "initWithIOSurface:", *(void *)buf), CFRelease(*(CFTypeRef *)buf), !v24))
      {
        uint64_t v25 = [v11 data];

        if (v25)
        {
          v40 = @"kPLCreateThumbnailFromImageAlways";
          v41 = @"kPLOptimalSourcePixelSizeKey";
          v42[0] = MEMORY[0x1E4F1CC38];
          uint64_t v26 = DCIM_NSValueFromCGSize();
          v42[1] = v26;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v40 count:2];

          v28 = objc_msgSend(v11, "data", v40, v41, v42[0]);
          v29 = [v11 uniformTypeIdentifier];
          v30 = (void *)PLCreateImageFromDataWithFormat(v28, 0, 0, v29, 0, 0, v27);

          __int16 v24 = [[PLImageContainer alloc] initWithCGImage:DCIM_CGImageRefFromPLImage()];
        }
        else if ([v11 CGImage])
        {
          v37 = CGBitmapContextCreate(0, (int)v20, v20 >> 32, 8uLL, 4 * (int)v20, (CGColorSpaceRef)setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_P3ColorSpace, 2u);
          v38 = (CGImage *)[v11 CGImage];
          v49.origin.x = 0.0;
          v49.origin.y = 0.0;
          v49.size.width = (double)(int)v20;
          v49.size.height = (double)SHIDWORD(v20);
          CGContextDrawImage(v37, v49, v38);
          Image = CGBitmapContextCreateImage(v37);
          CGContextRelease(v37);
          __int16 v24 = [[PLImageContainer alloc] initWithCGImage:Image];
          CGImageRelease(Image);
        }
        else
        {
          __int16 v24 = 0;
        }
      }
    }
    BOOL v16 = [(PLThumbFileManager *)self _writeImage:v24 forThumbIdentifier:v12];
    v31 = PLThumbnailsGetLog();
    v32 = v31;
    if (v16)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v44 = 2112;
        id v45 = v12;
        v33 = "Saved file backed thumbnail for asset (%@) thumb identifier (%@)";
        v34 = v32;
        os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
LABEL_22:
        _os_log_impl(&dword_19B3C7000, v34, v35, v33, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v44 = 2112;
      id v45 = v12;
      v33 = "Failed to write file backed thumbnail for asset (%@) thumb identifier (%@)";
      v34 = v32;
      os_log_type_t v35 = OS_LOG_TYPE_ERROR;
      goto LABEL_22;
    }
  }
  return v16;
}

CGColorSpaceRef __80__PLThumbFileManager_setImageForEntry_withIdentifier_orIndex_photoUUID_options___block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_P3ColorSpace = (uint64_t)result;
  return result;
}

@end