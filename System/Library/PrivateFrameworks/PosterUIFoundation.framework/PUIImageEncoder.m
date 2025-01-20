@interface PUIImageEncoder
+ (BOOL)setSnapshotDeviceOrientation:(int64_t)a3 forURL:(id)a4;
+ (BOOL)setSnapshotInterfaceOrientation:(int64_t)a3 forURL:(id)a4;
+ (BOOL)setSnapshotScale:(double)a3 forURL:(id)a4;
+ (BOOL)setSnapshotVersionForURL:(id)a3;
+ (double)snapshotScaleForURL:(id)a3;
+ (int64_t)snapshotDeviceOrientationForURL:(id)a3;
+ (int64_t)snapshotInterfaceOrientationForURL:(id)a3;
+ (unsigned)snapshotVersionForURL:(id)a3;
+ (void)decorateSurface:(id)a3 interfaceOrientation:(int64_t)a4 deviceOrientation:(int64_t)a5 scale:(double)a6;
- (NSURL)url;
- (PUIImageEncoder)initWithURL:(id)a3 format:(id)a4;
- (PUIImageOnDiskFormat)format;
- (id)createUIImageWithError:(id *)a3;
- (id)createUIImageWithOrientation:(int64_t)a3 scale:(double)a4 error:(id *)a5;
- (id)saveImage:(CGImage *)a3 error:(id *)a4;
- (id)saveUIImage:(id)a3 error:(id *)a4;
- (id)writeThenReadBackImage:(id)a3 error:(id *)a4;
- (void)currentSnapshotInterfaceOrientation:(int64_t *)a3 outDeviceOrientation:(int64_t *)a4;
- (void)setFormat:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation PUIImageEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)currentSnapshotInterfaceOrientation:(int64_t *)a3 outDeviceOrientation:(int64_t *)a4
{
  if (a3) {
    *a3 = [(id)objc_opt_class() snapshotInterfaceOrientationForURL:self->_url];
  }
  if (a4) {
    *a4 = [(id)objc_opt_class() snapshotDeviceOrientationForURL:self->_url];
  }
}

+ (int64_t)snapshotDeviceOrientationForURL:(id)a3
{
  int64_t value = 0;
  v3 = (const char *)[a3 fileSystemRepresentation];
  if (getxattr(v3, (const char *)[kPaperboardIOSurfaceDeviceOrientationPropertiesKey UTF8String], &value, 8uLL, 0, 0) == -1)return 0; {
  else
  }
    return value;
}

+ (int64_t)snapshotInterfaceOrientationForURL:(id)a3
{
  int64_t value = 0;
  v3 = (const char *)[a3 fileSystemRepresentation];
  if (getxattr(v3, (const char *)[kPaperboardIOSurfaceInterfaceOrientationPropertiesKey UTF8String], &value, 8uLL, 0, 0) == -1)return 0; {
  else
  }
    return value;
}

- (PUIImageEncoder)initWithURL:(id)a3 format:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"url != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIImageEncoder initWithURL:format:](a2);
    }
LABEL_11:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0B1FA0);
  }
  v9 = v8;
  if (!v8)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"format != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIImageEncoder initWithURL:format:](a2);
    }
    goto LABEL_11;
  }
  v18.receiver = self;
  v18.super_class = (Class)PUIImageEncoder;
  v10 = [(PUIImageEncoder *)&v18 init];
  if (v10)
  {
    v11 = [v7 absoluteURL];
    uint64_t v12 = [v11 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v12;

    uint64_t v14 = [v9 copy];
    format = v10->_format;
    v10->_format = (PUIImageOnDiskFormat *)v14;
  }
  return v10;
}

- (id)writeThenReadBackImage:(id)a3 error:(id *)a4
{
  v6 = -[PUIImageEncoder saveUIImage:error:](self, "saveUIImage:error:", a3);

  if (v6)
  {
    id v7 = [(PUIImageEncoder *)self createUIImageWithError:a4];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)createUIImageWithError:(id *)a3
{
  [(id)objc_opt_class() snapshotInterfaceOrientationForURL:self->_url];
  [(id)objc_opt_class() snapshotDeviceOrientationForURL:self->_url];
  [(id)objc_opt_class() snapshotScaleForURL:self->_url];
  if (v5 == 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = v5;
  }
  uint64_t v7 = PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation();
  return [(PUIImageEncoder *)self createUIImageWithOrientation:v7 scale:a3 error:v6];
}

+ (void)decorateSurface:(id)a3 interfaceOrientation:(int64_t)a4 deviceOrientation:(int64_t)a5 scale:(double)a6
{
  id v12 = a3;
  if (BSInterfaceOrientationIsValid())
  {
    v9 = [NSNumber numberWithInteger:a4];
    [v12 setAttachment:v9 forKey:kPaperboardIOSurfaceInterfaceOrientationPropertiesKey];
  }
  if (BSInterfaceOrientationIsValid())
  {
    v10 = [NSNumber numberWithInteger:a5];
    [v12 setAttachment:v10 forKey:kPaperboardIOSurfaceDeviceOrientationPropertiesKey];
  }
  if (a6 > 0.0)
  {
    v11 = [NSNumber numberWithDouble:a6];
    [v12 setAttachment:v11 forKey:kPaperboardIOSurfaceDeviceScalePropertiesKey];
  }
}

- (id)createUIImageWithOrientation:(int64_t)a3 scale:(double)a4 error:(id *)a5
{
  v50[4] = *MEMORY[0x263EF8340];
  url = self->_url;
  id v42 = 0;
  BOOL v10 = [(NSURL *)url checkResourceIsReachableAndReturnError:&v42];
  id v11 = v42;
  id v12 = v11;
  if (!v10)
  {
    if (a5)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08348];
      v49[0] = *MEMORY[0x263F08320];
      v49[1] = v22;
      v50[0] = @"Image cannot be created from URL.";
      v50[1] = @"Ensure the path is reachable by this process.";
      uint64_t v23 = *MEMORY[0x263F08590];
      v49[2] = *MEMORY[0x263F08608];
      v49[3] = v23;
      v24 = self->_url;
      v50[2] = v11;
      v50[3] = v24;
      v17 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
      [v21 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:4 userInfo:v17];
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_10:
    v20 = 0;
    goto LABEL_30;
  }
  unsigned int v13 = [(id)objc_opt_class() snapshotVersionForURL:self->_url];
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = -1;
  }
  if (v14 > 12)
  {
    v25 = self->_url;
    id v41 = 0;
    v26 = objc_msgSend(MEMORY[0x263EFF8F8], "pui_loadImageDataFromFileURL:error:", v25, &v41);
    id v27 = v41;
    v17 = v27;
    if (!v26 || v27)
    {
      if (!a5)
      {
        v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08348];
      v45[0] = *MEMORY[0x263F08320];
      v45[1] = v34;
      v46[0] = @"Image cannot be created from URL.";
      v46[1] = @"Ensure the path is readable by this process.";
      uint64_t v35 = *MEMORY[0x263F08590];
      v45[2] = *MEMORY[0x263F08608];
      v45[3] = v35;
      v36 = self->_url;
      v46[2] = v27;
      v46[3] = v36;
      id v32 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];
      [v33 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:4 userInfo:v32];
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = CGImageSourceCreateWithData((CFDataRef)v26, 0);
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v28, 0, 0);
      id v30 = objc_alloc(MEMORY[0x263F1C6B0]);
      double v31 = 1.0;
      if (a4 != 0.0) {
        double v31 = a4;
      }
      id v32 = (id)[v30 initWithCGImage:ImageAtIndex scale:a3 orientation:v31];
      if (ImageAtIndex) {
        CGImageRelease(ImageAtIndex);
      }
      if (v28) {
        CFRelease(v28);
      }
      if (v32)
      {
        id v32 = v32;
        v20 = v32;
      }
      else
      {
        if (a5)
        {
          v37 = (void *)MEMORY[0x263F087E8];
          uint64_t v38 = *MEMORY[0x263F08348];
          v43[0] = *MEMORY[0x263F08320];
          v43[1] = v38;
          v44[0] = @"Image cannot be created from URL.";
          v44[1] = @"Ensure the data is an actual image.";
          v43[2] = *MEMORY[0x263F08590];
          v44[2] = self->_url;
          v39 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
          *a5 = [v37 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:4 userInfo:v39];
        }
        v20 = 0;
      }
    }

    goto LABEL_28;
  }
  if (!a5) {
    goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = *MEMORY[0x263F08320];
  v48[0] = @"Image cannot be created from URL; using an out-of-date version.";
  v47[0] = v16;
  v47[1] = @"version";
  v17 = objc_msgSend(NSNumber, "numberWithInteger:");
  v47[2] = *MEMORY[0x263F08590];
  objc_super v18 = self->_url;
  v48[1] = v17;
  v48[2] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
  *a5 = [v15 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:3 userInfo:v19];

  v20 = 0;
LABEL_29:

LABEL_30:
  return v20;
}

- (id)saveUIImage:(id)a3 error:(id *)a4
{
  v59[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    uint64_t CGImageRepresentation = [v9 CGImage];
    if (!CGImageRepresentation)
    {
      id v11 = objc_msgSend(v9, "pui_wrappedIOSurface");

      if (!v11) {
        goto LABEL_6;
      }
      id v12 = objc_msgSend(v9, "pui_wrappedIOSurface");
      id v13 = [v12 CGImageBuilder];

      uint64_t v14 = (const void *)[v13 buildCGImage];
      if (!v14)
      {
        if (a4)
        {
          v48 = (void *)MEMORY[0x263F087E8];
          uint64_t v49 = *MEMORY[0x263F08348];
          v56[0] = *MEMORY[0x263F08320];
          v56[1] = v49;
          v57[0] = @"underlying CGImage cannot be saved URL by encoder";
          v57[1] = @"Ensure the image is an actual image.";
          v56[2] = *MEMORY[0x263F08590];
          v57[2] = self->_url;
          v50 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];
          *a4 = [v48 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:4 userInfo:v50];
        }
        v15 = 0;
        goto LABEL_48;
      }
      uint64_t CGImageRepresentation = (uint64_t)CFAutorelease(v14);

      if (!CGImageRepresentation)
      {
LABEL_6:
        uint64_t CGImageRepresentation = _UIImageGetCGImageRepresentation();
        if (!CGImageRepresentation)
        {
          v52 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"cgImage != ((void *)0)"];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[PUIImageEncoder saveUIImage:error:](a2);
          }
          [v52 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x25A0FA588);
        }
      }
    }
    v15 = [(PUIImageEncoder *)self saveImage:CGImageRepresentation error:a4];
    if (!v15) {
      goto LABEL_49;
    }
    uint64_t v16 = objc_msgSend(v9, "pui_wrappedIOSurface");
    v17 = [v16 attachmentForKey:kPaperboardIOSurfaceInterfaceOrientationPropertiesKey];
    uint64_t v18 = [v17 unsignedIntegerValue];

    v19 = objc_msgSend(v9, "pui_wrappedIOSurface");
    v20 = [v19 attachmentForKey:kPaperboardIOSurfaceDeviceOrientationPropertiesKey];
    uint64_t v21 = [v20 unsignedIntegerValue];

    if (v18 | v21)
    {
      if (!v18)
      {
LABEL_19:
        if (v21)
        {
          char v28 = [(id)objc_opt_class() setSnapshotDeviceOrientation:v21 forURL:v15];
          if (a4)
          {
            if ((v28 & 1) == 0)
            {
              v29 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"Failed to write snapshot orientation xattr" forKey:*MEMORY[0x263F08328]];
              [v29 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08590]];
              __error();
              id v30 = _NSErrorWithFilePathAndErrno();
              if (v30) {
                [v29 setObject:v30 forKeyedSubscript:*MEMORY[0x263F08608]];
              }
              *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:6 userInfo:v29];
            }
          }
        }
LABEL_25:
        double v31 = objc_msgSend(v9, "pui_wrappedIOSurface");
        id v32 = [v31 attachmentForKey:kPaperboardIOSurfaceDeviceScalePropertiesKey];
        [v32 doubleValue];
        double v34 = v33;
        if (v33 == 0.0)
        {
          [v9 scale];
          double v34 = v35;
        }

        int v36 = [(id)objc_opt_class() setSnapshotScale:v15 forURL:v34];
        if (a4 && !v36)
        {
          v37 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"Failed to write snapshot orientation xattr" forKey:*MEMORY[0x263F08328]];
          [v37 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08590]];
          __error();
          uint64_t v38 = _NSErrorWithFilePathAndErrno();
          if (v38) {
            [v37 setObject:v38 forKeyedSubscript:*MEMORY[0x263F08608]];
          }
          *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:6 userInfo:v37];
        }
        int v39 = [(id)objc_opt_class() setSnapshotVersionForURL:v15];
        if (a4 && !v39)
        {
          v40 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"Failed to write snapshot version xattr" forKey:*MEMORY[0x263F08328]];
          [v40 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08590]];
          __error();
          id v41 = _NSErrorWithFilePathAndErrno();
          if (v41) {
            [v40 setObject:v41 forKeyedSubscript:*MEMORY[0x263F08608]];
          }
          *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:5 userInfo:v40];
        }
        uint64_t v42 = *MEMORY[0x263EFF650];
        v54[0] = *MEMORY[0x263EFF6B0];
        v54[1] = v42;
        uint64_t v43 = *MEMORY[0x263EFF658];
        v55[0] = MEMORY[0x263EFFA88];
        v55[1] = v43;
        v44 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
        id v53 = 0;
        int v45 = [v15 setResourceValues:v44 error:&v53];
        id v13 = v53;

        if (!a4 || v45) {
          goto LABEL_48;
        }
        v46 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"Failed to tag snapshot as excluded from backup" forKey:*MEMORY[0x263F08328]];
        [v46 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08590]];
        if (v13)
        {
          id v47 = v13;
        }
        else
        {
          __error();
          _NSErrorWithFilePathAndErrno();
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          if (!v47)
          {
LABEL_44:
            *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:5 userInfo:v46];

            goto LABEL_48;
          }
        }
        [v46 setObject:v47 forKeyedSubscript:*MEMORY[0x263F08608]];
        goto LABEL_44;
      }
    }
    else
    {
      unint64_t v22 = [v9 imageOrientation];
      if (v22 >= 4) {
        goto LABEL_25;
      }
      uint64_t v21 = v22 + 1;
      uint64_t v18 = 1;
    }
    char v25 = [(id)objc_opt_class() setSnapshotInterfaceOrientation:v18 forURL:v15];
    if (a4 && (v25 & 1) == 0)
    {
      v26 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"Failed to write snapshot orientation xattr" forKey:*MEMORY[0x263F08328]];
      [v26 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08590]];
      __error();
      id v27 = _NSErrorWithFilePathAndErrno();
      if (v27) {
        [v26 setObject:v27 forKeyedSubscript:*MEMORY[0x263F08608]];
      }
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:7 userInfo:v26];
    }
    goto LABEL_19;
  }
  if (!a4)
  {
    v15 = 0;
    goto LABEL_49;
  }
  uint64_t v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = *MEMORY[0x263F08348];
  v58[0] = *MEMORY[0x263F08320];
  v58[1] = v24;
  v59[0] = @"Image cannot be saved URL.";
  v59[1] = @"Ensure the image is an actual image.";
  v58[2] = *MEMORY[0x263F08590];
  v59[2] = self->_url;
  id v13 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];
  [v23 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:4 userInfo:v13];
  v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

LABEL_49:
  return v15;
}

- (id)saveImage:(CGImage *)a3 error:(id *)a4
{
  v42[3] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    char v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", a4, @"image != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIImageEncoder saveImage:error:](a2);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0FA94CLL);
  }
  double v5 = (NSURL *)a4;
  id v7 = self->_format;
  CFDictionaryRef v8 = [(PUIImageOnDiskFormat *)v7 resolveDestinationOptionsForImage:a3];
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x2020000000;
  CGImageDestinationRef v38 = 0;
  CGImageDestinationRef v38 = CGImageDestinationCreateWithURL((CFURLRef)self->_url, (CFStringRef)[(PUIImageOnDiskFormat *)self->_format typeIdentifier], 1uLL, v8);
  if (v36[3])
  {
    id v9 = [(PUIImageOnDiskFormat *)v7 resolveAddImageOptionsForImage:a3];
    uint64_t v31 = 0;
    id v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    BOOL v10 = [MEMORY[0x263F5F418] sharedASTCProcessingTransactionQueue];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __35__PUIImageEncoder_saveImage_error___block_invoke;
    v26[3] = &unk_265471E50;
    char v28 = &v35;
    id v30 = a3;
    id v11 = v9;
    id v27 = v11;
    v29 = &v31;
    [v10 dispatchSync:v26];

    if (*((unsigned char *)v32 + 24))
    {
      double v5 = self->_url;
    }
    else if (v5)
    {
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08590];
      v39[0] = *MEMORY[0x263F08320];
      v39[1] = v20;
      url = self->_url;
      v40[0] = @"Image final encoding failed for unknown reasons in CoreGraphics.";
      v40[1] = url;
      unint64_t v22 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
      v5->super.isa = [v19 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:2 userInfo:v22];

      double v5 = 0;
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    if (!v5) {
      goto LABEL_11;
    }
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v42[0] = @"Image destination failed to be created from URL.";
    uint64_t v14 = *MEMORY[0x263F08348];
    v41[0] = v13;
    v41[1] = v14;
    v15 = NSString;
    id v11 = [(PUIImageOnDiskFormat *)self->_format typeIdentifier];
    uint64_t v16 = [v15 stringWithFormat:@"Ensure the path is reachable, and that the device supports the type identifier", v11];
    v41[2] = *MEMORY[0x263F08590];
    v17 = self->_url;
    v42[1] = v16;
    v42[2] = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
    v5->super.isa = [v12 errorWithDomain:@"com.apple.PosterBoard.PosterUIFoundation.ImageEncoding" code:1 userInfo:v18];

    double v5 = 0;
  }

LABEL_11:
  _Block_object_dispose(&v35, 8);

  return v5;
}

void __35__PUIImageEncoder_saveImage_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGImageDestinationFinalize(*(CGImageDestinationRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

+ (unsigned)snapshotVersionForURL:(id)a3
{
  char value = -1;
  v3 = (const char *)[a3 fileSystemRepresentation];
  ssize_t v4 = getxattr(v3, (const char *)[kPaperboardIOSurfaceSnapshotVersionPropertiesKey UTF8String], &value, 1uLL, 0, 0);
  unsigned __int8 v5 = value;
  if (v4 == -1) {
    return -1;
  }
  return v5;
}

+ (BOOL)setSnapshotVersionForURL:(id)a3
{
  char value = 13;
  v3 = (const char *)[a3 fileSystemRepresentation];
  return setxattr(v3, (const char *)[kPaperboardIOSurfaceSnapshotVersionPropertiesKey UTF8String], &value, 1uLL, 0, 0) == 0;
}

+ (BOOL)setSnapshotScale:(double)a3 forURL:(id)a4
{
  double value = a3;
  ssize_t v4 = (const char *)[a4 fileSystemRepresentation];
  return setxattr(v4, (const char *)[kPaperboardIOSurfaceDeviceScalePropertiesKey UTF8String], &value, 8uLL, 0, 0) == 0;
}

+ (double)snapshotScaleForURL:(id)a3
{
  double value = 1.0;
  v3 = (const char *)[a3 fileSystemRepresentation];
  ssize_t v4 = getxattr(v3, (const char *)[kPaperboardIOSurfaceDeviceScalePropertiesKey UTF8String], &value, 8uLL, 0, 0);
  double result = value;
  if (v4 == -1) {
    return 1.0;
  }
  return result;
}

+ (BOOL)setSnapshotInterfaceOrientation:(int64_t)a3 forURL:(id)a4
{
  int64_t value = a3;
  ssize_t v4 = (const char *)[a4 fileSystemRepresentation];
  return setxattr(v4, (const char *)[kPaperboardIOSurfaceInterfaceOrientationPropertiesKey UTF8String], &value, 8uLL, 0, 0) == 0;
}

+ (BOOL)setSnapshotDeviceOrientation:(int64_t)a3 forURL:(id)a4
{
  int64_t value = a3;
  ssize_t v4 = (const char *)[a4 fileSystemRepresentation];
  return setxattr(v4, (const char *)[kPaperboardIOSurfaceDeviceOrientationPropertiesKey UTF8String], &value, 8uLL, 0, 0) == 0;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (PUIImageOnDiskFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (void)initWithURL:(const char *)a1 format:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:(const char *)a1 format:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)saveUIImage:(const char *)a1 error:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)saveImage:(const char *)a1 error:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end