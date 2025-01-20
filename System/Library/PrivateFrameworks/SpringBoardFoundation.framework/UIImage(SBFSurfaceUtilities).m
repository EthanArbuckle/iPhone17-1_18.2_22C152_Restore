@interface UIImage(SBFSurfaceUtilities)
+ (id)sbf_imageWithIOSurface:()SBFSurfaceUtilities scale:orientation:;
@end

@implementation UIImage(SBFSurfaceUtilities)

+ (id)sbf_imageWithIOSurface:()SBFSurfaceUtilities scale:orientation:
{
  id v8 = a4;
  if ([v8 pixelFormat] == 1380411457)
  {
    id v9 = v8;
    [v9 lockWithOptions:1 seed:0];
    id v10 = v9;
    v11 = (const void *)[v10 baseAddress];
    size_t v12 = [v10 bytesPerRow];
    size_t v13 = [v10 width];
    size_t v14 = [v10 height];
    size_t v15 = [v10 allocationSize];
    id v16 = v10;
    v17 = CGDataProviderCreateWithData(v16, v11, v15, (CGDataProviderReleaseDataCallback)releaseIOSurface);
    [v16 incrementUseCount];
    CFTypeRef v18 = IOSurfaceCopyValue((IOSurfaceRef)v16, (CFStringRef)*MEMORY[0x1E4F2F068]);
    if (!v18 || (v19 = v18, v20 = CGColorSpaceCreateWithPropertyList(v18), CFRelease(v19), !v20)) {
      v20 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    }
    v21 = CGImageCreate(v13, v14, 0x10uLL, 0x40uLL, v12, v20, 0x1101u, v17, 0, 1, kCGRenderingIntentDefault);
    CGImageSetProperty();
    CGDataProviderRelease(v17);
    CGColorSpaceRelease(v20);
    if (v21)
    {
      v22 = [MEMORY[0x1E4F42A80] imageWithCGImage:v21 scale:a5 orientation:a2];
    }
    else
    {
      v22 = 0;
    }
    CGImageRelease(v21);
  }
  else
  {
    v22 = (void *)[[a1 alloc] _initWithIOSurface:v8 scale:a5 orientation:a2];
  }

  return v22;
}

@end