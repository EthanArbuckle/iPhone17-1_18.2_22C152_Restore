@interface SKUIImageColorAnalyzer
+ (CGContext)_createContextForImage:(id)a3;
+ (id)_colorFromITColor:(ITColor)a3;
+ (id)analyzeImage:(id)a3;
@end

@implementation SKUIImageColorAnalyzer

+ (id)analyzeImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIImageColorAnalyzer analyzeImage:]();
  }
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = (CGContext *)[a1 _createContextForImage:v4];
    if (!v6) {
      goto LABEL_10;
    }
    AnalyzedImageColors::AnalyzedImageColors((AnalyzedImageColors *)v17);
    BOOL v7 = AnalyzeImagePlease((BOOL)v6, (uint64_t)v17);
    BOOL v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(a1, "_colorFromITColor:", v17[0], v17[1], v17[2], v17[3]);
      [v5 setBackgroundColor:v9];

      v10 = objc_msgSend(a1, "_colorFromITColor:", v17[4], v17[5], v17[6], v17[7]);
      [v5 setTextPrimaryColor:v10];

      v11 = objc_msgSend(a1, "_colorFromITColor:", v17[8], v17[9], v17[10], v17[11]);
      [v5 setTextSecondaryColor:v11];

      [v5 setIsBackgroundLight:v18];
    }
    CGContextRelease(v6);
    if (!v8)
    {
LABEL_10:
      v12 = [MEMORY[0x1E4FB1618] whiteColor];
      [v5 setBackgroundColor:v12];

      v13 = [MEMORY[0x1E4FB1618] blackColor];
      [v5 setTextPrimaryColor:v13];

      v14 = [MEMORY[0x1E4FB1618] darkGrayColor];
      [v5 setTextSecondaryColor:v14];

      [v5 setIsBackgroundLight:1];
    }
    id v15 = v5;
  }

  return v5;
}

+ (id)_colorFromITColor:(ITColor)a3
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:a3.var0 green:a3.var1 blue:a3.var2 alpha:a3.var3];
}

+ (CGContext)_createContextForImage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (id v5 = v3, [v5 CGImage]))
  {
    v6 = (CGImage *)[v5 CGImage];
    size_t Width = CGImageGetWidth(v6);
    size_t Height = CGImageGetHeight(v6);
    v9 = 0;
    if (Width && Height)
    {
      SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
      if (SRGB)
      {
        CGImageRef CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v6, SRGB);
        v12 = CopyWithColorSpace;
        if (CopyWithColorSpace) {
          v6 = CopyWithColorSpace;
        }
      }
      else
      {
        v12 = 0;
      }
      v14 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0x58uLL, SRGB, 0x2002u);
      v9 = v14;
      if (v14)
      {
        v15.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
        v15.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
        v15.size.width = 22.0;
        v15.size.height = 22.0;
        CGContextDrawImage(v14, v15, v6);
      }
      if (v12) {
        CGImageRelease(v12);
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)analyzeImage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIImageColorAnalyzer analyzeImage:]";
}

@end