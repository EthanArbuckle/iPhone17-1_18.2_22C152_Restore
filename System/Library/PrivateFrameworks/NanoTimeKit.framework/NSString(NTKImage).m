@interface NSString(NTKImage)
- (id)imageWithFont:()NTKImage border:color:cropped:;
- (id)imageWithFont:()NTKImage border:cropped:;
- (uint64_t)imageWithFont:()NTKImage;
@end

@implementation NSString(NTKImage)

- (uint64_t)imageWithFont:()NTKImage
{
  return [a1 imageWithFont:a3 border:4 cropped:1];
}

- (id)imageWithFont:()NTKImage border:cropped:
{
  v7 = (void *)MEMORY[0x1E4FB1618];
  id v8 = a3;
  v9 = [v7 colorWithWhite:1.0 alpha:1.0];
  v10 = [a1 imageWithFont:v8 border:4 color:v9 cropped:a5];

  return v10;
}

- (id)imageWithFont:()NTKImage border:color:cropped:
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = *MEMORY[0x1E4FB0700];
  v59[0] = *MEMORY[0x1E4FB06F8];
  v59[1] = v12;
  v60[0] = v10;
  v60[1] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
  v14 = +[CLKRenderingContext sharedRenderingContext];
  v15 = [v14 device];

  [a1 sizeWithAttributes:v13];
  CLKCeilForDevice();
  double v17 = v16;
  CLKCeilForDevice();
  double v18 = (double)a4;
  CGFloat v19 = v17 + (double)a4;
  CGFloat v21 = v20 + (double)a4;
  [v15 screenScale];
  CGFloat v23 = v22;
  v62.width = v19;
  v62.height = v21;
  UIGraphicsBeginImageContextWithOptions(v62, 0, v23);
  double v24 = (double)(a4 >> 1);
  objc_msgSend(a1, "drawAtPoint:withAttributes:", v13, v24, v24);
  v25 = UIGraphicsGetImageFromCurrentImageContext();
  v26 = [v25 _imageThatSuppressesAccessibilityHairlineThickening];

  UIGraphicsEndImageContext();
  if (a6)
  {
    id v58 = v10;
    id v57 = v26;
    v27 = (CGImage *)[v57 CGImage];
    size_t Width = CGImageGetWidth(v27);
    size_t Height = CGImageGetHeight(v27);
    DataProvider = CGImageGetDataProvider(v27);
    CFDataRef v31 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v31);
    int BytesPerRow = CGImageGetBytesPerRow(v27);
    if (Height)
    {
      uint64_t v34 = 0;
      uint64_t v35 = BytesPerRow;
      v36 = BytePtr + 2;
      int v37 = 0x7FFFFFFF;
      int v38 = 0x80000000;
      int v39 = 0x80000000;
      int v40 = 0x7FFFFFFF;
      do
      {
        if (Width)
        {
          uint64_t v41 = 0;
          v42 = v36;
          do
          {
            int v43 = *(v42 - 2);
            int v44 = *(v42 - 1);
            int v46 = *v42;
            v42 += 4;
            int v45 = v46;
            int v47 = v44 + v43;
            if ((int)v41 >= v40) {
              int v48 = v40;
            }
            else {
              int v48 = v41;
            }
            if ((int)v41 <= v39) {
              int v49 = v39;
            }
            else {
              int v49 = v41;
            }
            if ((int)v34 >= v37) {
              int v50 = v37;
            }
            else {
              int v50 = v34;
            }
            if ((int)v34 <= v38) {
              int v51 = v38;
            }
            else {
              int v51 = v34;
            }
            if (v47 + v45)
            {
              int v40 = v48;
              int v39 = v49;
              int v37 = v50;
              int v38 = v51;
            }
            ++v41;
          }
          while (Width != v41);
        }
        ++v34;
        v36 += v35;
      }
      while (v34 != Height);
    }
    else
    {
      int v39 = 0x80000000;
      int v40 = 0x7FFFFFFF;
      int v37 = 0x7FFFFFFF;
      int v38 = 0x80000000;
    }
    CFRelease(v31);
    CGFloat v52 = v18 + (double)(int)((v39 - v40 + 1) & 0xFFFFFFFE);
    id v53 = v57;
    v54 = (CGImage *)[v53 CGImage];
    v63.origin.x = (double)v40 - v24;
    v63.origin.y = (double)v37 - v24;
    v63.size.width = v52;
    v63.size.height = v18 + (double)(int)((v38 - v37 + 1) & 0xFFFFFFFE);
    v55 = CGImageCreateWithImageInRect(v54, v63);
    v26 = [MEMORY[0x1E4FB1818] imageWithCGImage:v55];

    CGImageRelease(v55);
    id v10 = v58;
  }

  return v26;
}

@end