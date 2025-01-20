@interface UIImage
- (id)safari_decodedImageIfPossible;
@end

@implementation UIImage

- (id)safari_decodedImageIfPossible
{
  v29[5] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = [v1 CGImage];
    if (v2)
    {
      v3 = (CGImage *)v2;
      if (CGImageGetImageProvider())
      {
        double Width = (double)CGImageGetWidth(v3);
        double Height = (double)CGImageGetHeight(v3);
        uint64_t v6 = *MEMORY[0x1E4F1DD30];
        uint64_t v7 = *MEMORY[0x1E4F1DD48];
        v28[0] = *MEMORY[0x1E4F1DD38];
        v28[1] = v7;
        v29[0] = v6;
        v29[1] = MEMORY[0x1E4F1CC38];
        uint64_t v8 = *MEMORY[0x1E4F1DD18];
        v28[2] = *MEMORY[0x1E4F1DD40];
        v28[3] = v8;
        v29[2] = MEMORY[0x1E4F1CC38];
        v29[3] = &unk_1F3C73C08;
        v28[4] = *MEMORY[0x1E4F1DD20];
        v29[4] = &unk_1F3C73C08;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
        uint64_t v9 = CGImageProviderCopyImageBlockSetWithOptions();
        if (v9)
        {
          v10 = (void *)v9;
          CGImageBlockSetGetRect();
          v32.origin.x = 0.0;
          v32.origin.y = 0.0;
          v32.size.width = Width;
          v32.size.height = Height;
          if (CGRectEqualToRect(v31, v32)
            && CGImageBlockSetGetCount() == 1
            && CGImageBlockSetGetImageBlock()
            && (CGImageBlockGetRect(),
                double v12 = v11,
                size_t v14 = (unint64_t)v13,
                Data = (const void *)CGImageBlockGetData(),
                uint64_t v16 = CGImageBlockGetBytesPerRow(),
                (CGDataProviderRef v17 = CGDataProviderCreateWithData(v10, Data, v16 * v14, (CGDataProviderReleaseDataCallback)releaseBlockSet)) != 0))
          {
            v18 = v17;
            size_t BytesPerRow = CGImageBlockGetBytesPerRow();
            ColorSpace = CGImageGetColorSpace(v3);
            if (CGImageHasAlpha()) {
              CGBitmapInfo v21 = 8194;
            }
            else {
              CGBitmapInfo v21 = 8198;
            }
            decode = CGImageGetDecode(v3);
            BOOL shouldInterpolate = CGImageGetShouldInterpolate(v3);
            CGColorRenderingIntent intent = CGImageGetRenderingIntent(v3);
            v25 = CGImageCreate((unint64_t)v12, v14, 8uLL, 0x20uLL, BytesPerRow, ColorSpace, v21, v18, decode, shouldInterpolate, intent);
            CGDataProviderRelease(v18);
            if (v25)
            {
              id v26 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "sf_initWithCGImage:tabSnapshotEffectsVersion:", v25, objc_msgSend(v1, "sf_tabSnapshotEffectsVersion"));
              CGImageRelease(v25);
              goto LABEL_16;
            }
          }
          else
          {
            CGImageBlockSetRelease();
          }
        }
      }
    }
    id v26 = v1;
  }
  else
  {
    id v26 = 0;
  }
LABEL_16:
  return v26;
}

@end