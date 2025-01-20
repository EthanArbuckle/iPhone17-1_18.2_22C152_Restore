@interface MFPTextureBrush
- (MFPTextureBrush)initWithImage:(id)a3 wrapMode:(int)a4 transform:(CGAffineTransform *)a5;
@end

@implementation MFPTextureBrush

- (MFPTextureBrush)initWithImage:(id)a3 wrapMode:(int)a4 transform:(CGAffineTransform *)a5
{
  id v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v8 phoneImage],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v8 pixelSize],
          double v12 = v11,
          v9))
    {
      double tx = a5->tx;
      float d = a5->d;
      double ty = a5->ty;
      float a = a5->a;
      v19 = (void *)MEMORY[0x23EC9A170](v10);
      double v20 = a;
      v21 = (double *)MEMORY[0x263F00148];
      p_cache = (void **)(OITSUAtomicLRUCache + 16);
      if ((a4 - 1) >= 3 && fabs(v20 + -1.0) <= 0.001 && fabs(d + -1.0) <= 0.001)
      {
        v35 = v9;
      }
      else
      {
        if ((a4 & 0xFFFFFFFE) == 2) {
          int v23 = 2;
        }
        else {
          int v23 = 1;
        }
        if ((a4 & 0xFFFFFFFD) == 1) {
          int v24 = 2;
        }
        else {
          int v24 = 1;
        }
        double v25 = v12 * v20;
        v26 = TCBitmapContextCreate(v12 * v20 * (double)v24);
        double v57 = ty;
        [v9 size];
        int v27 = 0;
        float v28 = v25;
        do
        {
          int v29 = 0;
          if (v27) {
            int v30 = -1;
          }
          else {
            int v30 = 1;
          }
          double v31 = (double)v30;
          do
          {
            if (v29) {
              int v32 = -1;
            }
            else {
              int v32 = 1;
            }
            objc_msgSend(v9, "drawInRect:fromRect:isFlipped:", 1, NSScaleRect2((double)(2 * (v29++ != 0)), (double)(2 * (v27 != 0)), (double)v32, v31, v28));
          }
          while (v24 != v29);
          ++v27;
        }
        while (v27 != v23);
        CGImageRef Image = CGBitmapContextCreateImage(v26);
        p_cache = OITSUAtomicLRUCache.cache;
        v21 = (double *)MEMORY[0x263F00148];
        double ty = v57;
        v34 = Image;
        v35 = +[OITSUImage imageWithCGImage:Image];

        CGImageRelease(v34);
        CGContextRelease(v26);
      }
      float v36 = tx;
      float v37 = ty;
      if (v36 == 0.0 && v37 == 0.0)
      {
        v13 = v35;
      }
      else
      {
        [v35 size];
        double v39 = v38;
        double v41 = v40;
        double v42 = *v21;
        double v43 = v21[1];
        v44 = TCBitmapContextCreate(v38);
        float v45 = v36 - (floor(v36 / v39) + 1.0) * v39;
        float v46 = v37 - (floor(v37 / v41) + 1.0) * v41;
        double v47 = v45;
        double v48 = v46;
        double v49 = 0.0;
        char v50 = 1;
        do
        {
          char v51 = v50;
          double v52 = v48 + v49 * v41;
          char v53 = 1;
          double v49 = 0.0;
          do
          {
            char v54 = v53;
            objc_msgSend(v35, "drawInRect:fromRect:isFlipped:", 1, v47 + v49 * v39, v52, v39, v41, v42, v43, v39, v41);
            char v53 = 0;
            double v49 = 1.0;
          }
          while ((v54 & 1) != 0);
          char v50 = 0;
        }
        while ((v51 & 1) != 0);
        v55 = CGBitmapContextCreateImage(v44);
        v13 = [p_cache + 98 imageWithCGImage:v55];

        CGImageRelease(v55);
        CGContextRelease(v44);
      }
      v58.receiver = self;
      v58.super_class = (Class)MFPTextureBrush;
      self = [(MFPImageBrush *)&v58 initWithPhoneImage:v13];
    }
    else
    {
      v13 = 0;
    }
    self = self;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end