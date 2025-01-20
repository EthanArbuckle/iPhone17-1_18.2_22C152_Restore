@interface UIImage(SSImageSurface)
+ (id)ss_cgImageBackedImageFromImageSurface:()SSImageSurface;
+ (id)ss_imageFromImageSurface:()SSImageSurface;
- (SSImageSurface)ss_imageSurfaceFromImage;
- (void)ss_imageSurfaceFromImage;
@end

@implementation UIImage(SSImageSurface)

+ (id)ss_imageFromImageSurface:()SSImageSurface
{
  v3 = (objc_class *)MEMORY[0x263F1C6B0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 backingSurface];
  [v4 scale];
  double v8 = v7;
  uint64_t v9 = [v4 orientation];

  v10 = (void *)[v5 _initWithIOSurface:v6 scale:v9 orientation:v8];
  return v10;
}

- (SSImageSurface)ss_imageSurfaceFromImage
{
  v2 = objc_alloc_init(SSImageSurface);
  uint64_t v3 = [a1 ioSurface];
  if (v3)
  {
    [(SSImageSurface *)v2 setBackingSurface:v3];
  }
  else
  {
    id v4 = (const void *)[a1 _copyIOSurface];
    [(SSImageSurface *)v2 setBackingSurface:v4];
    if (v4)
    {
      CFRelease(v4);
    }
    else
    {
      id v5 = os_log_create("com.apple.screenshotservices", "Image");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        [(UIImage(SSImageSurface) *)(uint64_t)a1 ss_imageSurfaceFromImage];
      }
    }
  }
  [a1 scale];
  -[SSImageSurface setScale:](v2, "setScale:");
  -[SSImageSurface setOrientation:](v2, "setOrientation:", [a1 imageOrientation]);
  return v2;
}

+ (id)ss_cgImageBackedImageFromImageSurface:()SSImageSurface
{
  id v3 = a3;
  [v3 backingSurface];
  id v4 = (CGImage *)_UICreateCGImageFromIOSurfaceWithOptions();
  id v5 = (void *)MEMORY[0x263F1C6B0];
  [v3 scale];
  double v7 = v6;
  uint64_t v8 = [v3 orientation];

  uint64_t v9 = [v5 imageWithCGImage:v4 scale:v8 orientation:v7];
  CGImageRelease(v4);
  return v9;
}

- (void)ss_imageSurfaceFromImage
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 1;
  _os_log_fault_impl(&dword_21ECED000, a2, OS_LOG_TYPE_FAULT, "unexpected NULL backing surface for image %@ (copied:%d)", (uint8_t *)&v2, 0x12u);
}

@end