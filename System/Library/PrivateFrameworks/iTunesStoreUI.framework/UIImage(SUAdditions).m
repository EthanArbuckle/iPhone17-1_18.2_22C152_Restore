@interface UIImage(SUAdditions)
- (uint64_t)stretchableImageWithLeftCapWidth:()SUAdditions rightCapWidth:;
@end

@implementation UIImage(SUAdditions)

- (uint64_t)stretchableImageWithLeftCapWidth:()SUAdditions rightCapWidth:
{
  if (a3 == a4)
  {
    return objc_msgSend(a1, "stretchableImageWithLeftCapWidth:topCapHeight:");
  }
  else
  {
    [a1 size];
    double v9 = v8;
    if (a3 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      uint64_t v10 = a3;
    }
    double v11 = (float)((float)((float)v10 * 2.0) + 1.0);
    [a1 scale];
    CGFloat v13 = v12;
    float v14 = v12 * v11;
    double v15 = ceilf(v14);
    float v16 = v9 * v12;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v19 = CGBitmapContextCreate(0, vcvtps_u32_f32(v14), vcvtps_u32_f32(v16), 8uLL, (unint64_t)(double)(unint64_t)AlignedBytesPerRow, DeviceRGB, 0x2002u);
    if (v19)
    {
      v20 = v19;
      v42.size.height = ceilf(v16);
      v42.origin.x = 0.0;
      v42.origin.y = 0.0;
      v42.size.width = v15;
      CGContextClearRect(v19, v42);
      CGContextScaleCTM(v20, v13, v13);
      CGAffineTransformMakeScale(&v40, v13, v13);
      CGContextSetBaseCTM();
      [a1 size];
      *(float *)&double v21 = v13 * v21;
      double v22 = ceilf(*(float *)&v21);
      [a1 size];
      float v24 = v13 * v23;
      CGFloat v25 = ceilf(v24);
      double v39 = v11;
      CGFloat v26 = v13 * (double)a3;
      CGFloat v27 = (double)a4;
      CGFloat v28 = v13 * (double)a4;
      CGFloat v29 = v22 - v28 - v26;
      v30 = (CGImage *)[a1 CGImage];
      v43.origin.x = 0.0;
      v43.origin.y = 0.0;
      v43.size.width = v26;
      v43.size.height = v25;
      v31 = CGImageCreateWithImageInRect(v30, v43);
      v44.origin.x = 0.0;
      v44.origin.y = 0.0;
      v44.size.width = (double)a3;
      v44.size.height = v9;
      CGContextDrawImage(v20, v44, v31);
      CGImageRelease(v31);
      v32 = (CGImage *)[a1 CGImage];
      v45.origin.x = v26 + v29;
      v45.origin.y = 0.0;
      v45.size.width = v28;
      v45.size.height = v25;
      v33 = CGImageCreateWithImageInRect(v32, v45);
      v46.origin.x = v39 - v27;
      v46.origin.y = 0.0;
      v46.size.width = v27;
      v46.size.height = v9;
      CGContextDrawImage(v20, v46, v33);
      CGImageRelease(v33);
      v34 = (CGImage *)[a1 CGImage];
      v47.origin.y = 0.0;
      v47.origin.x = v26;
      v47.size.width = v29;
      v47.size.height = v25;
      v35 = CGImageCreateWithImageInRect(v34, v47);
      v48.size.width = v39 - (double)a3 - v27;
      v48.origin.y = 0.0;
      v48.origin.x = (double)a3;
      v48.size.height = v9;
      CGContextDrawImage(v20, v48, v35);
      CGImageRelease(v35);
      CGImageRef Image = CGBitmapContextCreateImage(v20);
      if (Image)
      {
        v37 = Image;
        uint64_t v38 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", Image, 0, v13), "stretchableImageWithLeftCapWidth:topCapHeight:", a3, 0);
        CGImageRelease(v37);
      }
      else
      {
        uint64_t v38 = 0;
      }
      CFRelease(v20);
    }
    else
    {
      uint64_t v38 = 0;
    }
    CGColorSpaceRelease(DeviceRGB);
    return v38;
  }
}

@end