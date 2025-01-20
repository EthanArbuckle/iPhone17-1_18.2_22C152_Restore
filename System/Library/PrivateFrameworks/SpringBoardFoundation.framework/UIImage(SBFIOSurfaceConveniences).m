@interface UIImage(SBFIOSurfaceConveniences)
- (id)sbf_CGImageBackedImageWithMaximumBitsPerComponent:()SBFIOSurfaceConveniences skipCIF10FitsInSRGBCheck:;
- (uint64_t)sbf_CGImageBackedImage;
- (uint64_t)sbf_CGImageBackedImageWithMaximumBitsPerComponent:()SBFIOSurfaceConveniences;
@end

@implementation UIImage(SBFIOSurfaceConveniences)

- (uint64_t)sbf_CGImageBackedImage
{
  return objc_msgSend(a1, "sbf_CGImageBackedImageWithMaximumBitsPerComponent:", -1);
}

- (uint64_t)sbf_CGImageBackedImageWithMaximumBitsPerComponent:()SBFIOSurfaceConveniences
{
  return objc_msgSend(a1, "sbf_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", a3, 0);
}

- (id)sbf_CGImageBackedImageWithMaximumBitsPerComponent:()SBFIOSurfaceConveniences skipCIF10FitsInSRGBCheck:
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  if ([v6 CGImage])
  {
    id v7 = v6;
  }
  else
  {
    v8 = [v6 ioSurface];
    v9 = v8;
    if (v8)
    {
      int v10 = [v8 pixelFormat];
      if (a3 <= 8 && v10 == 1999843442)
      {
        uint64_t v11 = *MEMORY[0x1E4F2F4B0];
        v18[0] = *MEMORY[0x1E4F2F400];
        v18[1] = v11;
        v19[0] = &unk_1ED89E698;
        v19[1] = &unk_1ED89E6B0;
        v18[2] = *MEMORY[0x1E4F2FDE0];
        v12 = [NSNumber numberWithBool:a4];
        v19[2] = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

        v14 = (CGImage *)CGImageCreateFromIOSurface();
      }
      else
      {
        v14 = (CGImage *)UICreateCGImageFromIOSurface();
      }
      id v15 = objc_alloc(MEMORY[0x1E4F42A80]);
      [v6 scale];
      id v7 = (id)objc_msgSend(v15, "initWithCGImage:scale:orientation:", v14, objc_msgSend(v6, "imageOrientation"), v16);
      CGImageRelease(v14);
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

@end