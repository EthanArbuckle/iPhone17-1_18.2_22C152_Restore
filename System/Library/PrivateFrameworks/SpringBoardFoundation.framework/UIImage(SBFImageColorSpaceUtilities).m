@interface UIImage(SBFImageColorSpaceUtilities)
- (CGImage)sbf_colorSpace;
- (id)sbf_ATXSafeCGImageBackedImage;
- (id)sbf_imageByConvertingToColorSpace:()SBFImageColorSpaceUtilities type:;
- (id)sbf_imageByManipulatingInDeviceColorSpaceWithBlock:()SBFImageColorSpaceUtilities;
- (uint64_t)sbf_imageUsingContextType:()SBFImageColorSpaceUtilities;
@end

@implementation UIImage(SBFImageColorSpaceUtilities)

- (CGImage)sbf_colorSpace
{
  result = (CGImage *)[a1 CGImage];
  if (result)
  {
    return CGImageGetColorSpace(result);
  }
  return result;
}

- (id)sbf_imageByManipulatingInDeviceColorSpaceWithBlock:()SBFImageColorSpaceUtilities
{
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x18C132FE0]();
    v6 = CGColorSpaceRetain((CGColorSpaceRef)objc_msgSend(a1, "sbf_colorSpace"));
    if (v6)
    {
      __sbfImageByApplyingColorSpace(a1, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = a1;
    }
    v9 = v7;
    v10 = v4[2](v4, v7);
    v11 = v10;
    if (v10)
    {
      __sbfImageByApplyingColorSpace(v10, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
    CGColorSpaceRelease(v6);
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

- (uint64_t)sbf_imageUsingContextType:()SBFImageColorSpaceUtilities
{
  return objc_msgSend(a1, "sbf_imageByConvertingToColorSpace:type:", 0, a3);
}

- (id)sbf_imageByConvertingToColorSpace:()SBFImageColorSpaceUtilities type:
{
  [a1 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [a1 scale];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__UIImage_SBFImageColorSpaceUtilities__sbf_imageByConvertingToColorSpace_type___block_invoke;
  v14[3] = &unk_1E548CA88;
  v14[4] = a1;
  v12 = (void *)_SBFCGBitmapImageCreate(a4, a3, 0, v14, 0, v8, v10, v11);
  return v12;
}

- (id)sbf_ATXSafeCGImageBackedImage
{
  v1 = objc_msgSend(a1, "sbf_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", 8, 0);
  v2 = (CGColorSpace *)objc_msgSend(v1, "sbf_colorSpace");
  if (v2)
  {
    unsigned int Type = CGColorSpaceGetType();
    if (Type <= 5 && ((1 << Type) & 0x27) != 0) {
      goto LABEL_19;
    }
  }
  CFStringRef v5 = CGColorSpaceCopyName(v2);
  CFStringRef v6 = v5;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1DC98];
  if (v5)
  {
    if (CFEqual(v5, (CFStringRef)*MEMORY[0x1E4F1DC98])
      || (CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1DBE8],
          CFEqual(v6, (CFStringRef)*MEMORY[0x1E4F1DBE8]))
      || (CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1DB90],
          CFEqual(v6, (CFStringRef)*MEMORY[0x1E4F1DB90])))
    {
LABEL_18:
      CFRelease(v6);
      goto LABEL_19;
    }
  }
  else
  {
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1DBE8];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1DB90];
  }
  CGFloat v10 = CGColorSpaceCreateWithName(v7);
  CGFloat v11 = CGColorSpaceCreateWithName(v8);
  v12 = CGColorSpaceCreateWithName(v9);
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0
    && (CGColorSpaceEqualToColorSpace() & 1) == 0
    && (CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(v1, "sbf_imageByConvertingToColorSpace:type:", v11, 0);

    v1 = (void *)v13;
  }
  CGColorSpaceRelease(v10);
  CGColorSpaceRelease(v11);
  CGColorSpaceRelease(v12);
  if (v6) {
    goto LABEL_18;
  }
LABEL_19:
  return v1;
}

@end