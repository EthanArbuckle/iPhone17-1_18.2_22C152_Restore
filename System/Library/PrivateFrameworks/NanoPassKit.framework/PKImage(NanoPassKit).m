@interface PKImage(NanoPassKit)
- (id)_npkMemoryMappedImageWithPath:()NanoPassKit;
- (id)npkImageByMemoryMappingDataWithTemporaryFilePrefix:()NanoPassKit;
- (id)resizedImageWithSize:()NanoPassKit shouldCover:;
- (uint64_t)resizedImageToCover:()NanoPassKit;
- (uint64_t)resizedImageToFit:()NanoPassKit;
@end

@implementation PKImage(NanoPassKit)

- (id)npkImageByMemoryMappingDataWithTemporaryFilePrefix:()NanoPassKit
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 imageHash];
  v6 = [v5 fileSafeBase64Encoding];

  v7 = [NSString stringWithFormat:@"%@-%@", v4, v6];

  v8 = NSTemporaryDirectory();
  v9 = [v8 stringByAppendingPathComponent:v7];

  v10 = [MEMORY[0x263F08850] defaultManager];
  int v11 = [v10 fileExistsAtPath:v9];

  v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (!v11)
  {
    if (v13)
    {
      v16 = pk_General_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: couldn't find existing CPBitmap image on disk at %@", buf, 0xCu);
      }
    }
LABEL_12:
    id v17 = a1;
    v18 = (void *)[v17 imageRef];
    if (!v18)
    {
LABEL_21:
      v24 = pk_Payment_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        v26 = pk_Payment_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v9;
          _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Failed to generate mapped image at:%@", buf, 0xCu);
        }
      }
      id v15 = v17;
      goto LABEL_26;
    }
    values[0] = v18;
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFArrayRef v20 = CFArrayCreate(Default, (const void **)values, 1, MEMORY[0x263EFFF70]);
    if (CPBitmapWriteImagesToPath())
    {
      v21 = pk_General_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        v23 = pk_General_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v9;
          _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Successfully wrote CPBitmap to %@", buf, 0xCu);
        }
      }
      id v15 = [v17 _npkMemoryMappedImageWithPath:v9];
      if (v20) {
LABEL_19:
      }
        CFRelease(v20);
    }
    else
    {
      v28 = pk_Payment_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        v30 = pk_Payment_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v9;
          __int16 v33 = 2112;
          uint64_t v34 = 0;
          _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Unable to write CPBitmap to %@: %@", buf, 0x16u);
        }
      }
      id v15 = 0;
      if (v20) {
        goto LABEL_19;
      }
    }
    if (v15) {
      goto LABEL_26;
    }
    goto LABEL_21;
  }
  if (v13)
  {
    v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Found existing CPBitmap image on disk at %@", buf, 0xCu);
    }
  }
  id v15 = [a1 _npkMemoryMappedImageWithPath:v9];
  if (!v15) {
    goto LABEL_12;
  }
LABEL_26:

  return v15;
}

- (id)_npkMemoryMappedImageWithPath:()NanoPassKit
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFArrayRef ImagesFromPath = (const __CFArray *)CPBitmapCreateImagesFromPath();
  if (ImagesFromPath)
  {
    CFArrayRef v6 = ImagesFromPath;
    if (CFArrayGetCount(ImagesFromPath) == 1)
    {
      v7 = pk_General_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        v9 = pk_General_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v4;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Successfully read CPBitmap from %@", buf, 0xCu);
        }
      }
      ValueAtIndex = CFArrayGetValueAtIndex(v6, 0);
      id v11 = objc_alloc(MEMORY[0x263F5BED8]);
      [a1 scale];
      BOOL v13 = objc_msgSend(v11, "initWithCGImage:scale:orientation:", ValueAtIndex, objc_msgSend(a1, "orientation"), v12);
    }
    else
    {
      id v17 = pk_Payment_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        v19 = pk_Payment_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v4;
          _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Array of bitmaps read from %@ is not of size 1", buf, 0xCu);
        }
      }
      BOOL v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v14 = pk_Payment_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Unable to read CPBitmap from %@: %@", buf, 0x16u);
      }
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (uint64_t)resizedImageToCover:()NanoPassKit
{
  return objc_msgSend(a1, "resizedImageWithSize:shouldCover:", 1);
}

- (uint64_t)resizedImageToFit:()NanoPassKit
{
  return objc_msgSend(a1, "resizedImageWithSize:shouldCover:", 0);
}

- (id)resizedImageWithSize:()NanoPassKit shouldCover:
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v9 = (void *)MEMORY[0x223C37110]();
  [a1 size];
  if (a5) {
    PKSizeAspectFitToCover();
  }
  else {
    PKSizeAspectFit();
  }
  double v12 = v10;
  double v13 = v11;
  [a1 size];
  if (v12 >= v14 || ([a1 size], v13 >= v15))
  {
    uint64_t v24 = pk_General_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      v26 = pk_General_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        [a1 size];
        uint64_t v28 = v27;
        [a1 size];
        int v31 = 138413314;
        v32 = a1;
        __int16 v33 = 2048;
        uint64_t v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = v29;
        __int16 v37 = 2048;
        double v38 = a2;
        __int16 v39 = 2048;
        double v40 = a3;
        _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Resizing image %@ from %f x %f to fit/cover %f x %f would upscale, ignoring", (uint8_t *)&v31, 0x34u);
      }
    }
    id v23 = a1;
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x263F5BEE0], "constraintsWithMaxSize:", v12, v13);
    id v17 = pk_General_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v19 = pk_General_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [a1 size];
        uint64_t v21 = v20;
        [a1 size];
        int v31 = 138413826;
        v32 = a1;
        __int16 v33 = 2048;
        uint64_t v34 = v21;
        __int16 v35 = 2048;
        uint64_t v36 = v22;
        __int16 v37 = 2048;
        double v38 = v12;
        __int16 v39 = 2048;
        double v40 = v13;
        __int16 v41 = 2048;
        double v42 = a2;
        __int16 v43 = 2048;
        double v44 = a3;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Resizing image %@ from %f x %f to %f x %f to fit/cover %f x %f", (uint8_t *)&v31, 0x48u);
      }
    }
    id v23 = [v16 resizedImage:a1];
  }
  return v23;
}

@end