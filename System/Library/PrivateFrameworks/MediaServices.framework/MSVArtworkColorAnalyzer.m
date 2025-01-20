@interface MSVArtworkColorAnalyzer
+ (BOOL)isLightColor:(CGColor *)a3;
- (CGImage)sourceImage;
- (CGSize)preferredImageSize;
- (MSVArtworkColorAnalyzer)initWithSourceImage:(CGImage *)a3;
- (id)analyze;
- (int64_t)algorithm;
- (void)analyzeWithCompletionHandler:(id)a3;
- (void)setAlgorithm:(int64_t)a3;
- (void)setPreferredImageSize:(CGSize)a3;
- (void)setSourceImage:(CGImage *)a3;
@end

@implementation MSVArtworkColorAnalyzer

+ (BOOL)isLightColor:(CGColor *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t *)CGColorGetComponents(a3);
  long long v23 = xmmword_1A312BAD0;
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
  *((void *)&v6 + 1) = 0x3FF0000000000000;
  switch(NumberOfComponents)
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      *((void *)&v6 + 1) = v4[1];
LABEL_3:
      *(void *)&long long v6 = *v4;
      int64x2_t v7 = vdupq_lane_s64(*v4, 0);
      goto LABEL_7;
    case 3uLL:
      goto LABEL_6;
    case 4uLL:
      *((void *)&v6 + 1) = v4[3];
LABEL_6:
      int64x2_t v7 = *(int64x2_t *)v4;
      *(void *)&long long v6 = v4[2];
LABEL_7:
      long long v23 = v6;
      int64x2_t v24 = v7;
      break;
    default:
      int64x2_t v24 = 0u;
      break;
  }
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a3);
  v10 = ColorSpace;
  int data = 0;
  if (!ColorSpace || !v8 || !CFEqual(ColorSpace, v8))
  {
    *(int64x2_t *)components = v24;
    long long v28 = v23;
    v12 = CGColorCreate(v10, components);
    *(void *)&long long v23 = 0;
    if (v12)
    {
      v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, v8, 0x4002u);
      v14 = v13;
      if (v13)
      {
        CGContextSetFillColorWithColor(v13, v12);
        v30.origin.x = 0.0;
        v30.origin.y = 0.0;
        v30.size.width = 1.0;
        v30.size.height = 1.0;
        CGContextFillRect(v14, v30);
        LOBYTE(v15) = BYTE1(data);
        double v16 = (double)v15 / 255.0;
        *(double *)v24.i64 = v16;
        LOBYTE(v16) = BYTE2(data);
        *(double *)&unint64_t v17 = (double)*(unint64_t *)&v16 / 255.0;
        unint64_t v22 = v17;
        LOBYTE(v17) = HIBYTE(data);
        *(double *)&long long v23 = (double)v17 / 255.0;
LABEL_17:
        CGColorRelease(v12);
        CGContextRelease(v14);
        unint64_t v11 = v22;
        goto LABEL_18;
      }
    }
    else
    {
      v14 = 0;
    }
    unint64_t v22 = 0;
    v24.i64[0] = 0;
    goto LABEL_17;
  }
  unint64_t v11 = v24.u64[1];
LABEL_18:
  v18.n128_u64[0] = v24.i64[0];
  v18.n128_u64[1] = v11;
  __n128 v25 = v18;
  CGColorSpaceRelease(v8);
  ITColor::GetLuminance(v19, v25, *(double *)&v23);
  return v20 >= 0.180000007;
}

- (void).cxx_destruct
{
}

- (void)setAlgorithm:(int64_t)a3
{
  self->_algorithm = a3;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void)setPreferredImageSize:(CGSize)a3
{
  self->_preferredImageSize = a3;
}

- (CGSize)preferredImageSize
{
  double width = self->_preferredImageSize.width;
  double height = self->_preferredImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSourceImage:(CGImage *)a3
{
}

- (CGImage)sourceImage
{
  return self->_sourceImage;
}

- (void)analyzeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MSVArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5ADAA50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__MSVArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [v2 analyze];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (id)analyze
{
  id v3 = objc_alloc_init(MSVMutableArtworkColorAnalysis);
  [(MSVArtworkColorAnalysis *)v3 setBackgroundColorHex:@"#000000"];
  [(MSVMutableArtworkColorAnalysis *)v3 setBackgroundColorLight:0];
  [(MSVArtworkColorAnalysis *)v3 setPrimaryTextColorHex:@"#FFFFFF"];
  [(MSVMutableArtworkColorAnalysis *)v3 setPrimaryTextColorLight:0];
  [(MSVArtworkColorAnalysis *)v3 setSecondaryTextColorHex:@"#63666A"];
  [(MSVMutableArtworkColorAnalysis *)v3 setSecondaryTextColorLight:0];
  [(MSVArtworkColorAnalysis *)v3 setTertiaryTextColorHex:@"#63666A"];
  [(MSVMutableArtworkColorAnalysis *)v3 setTertiaryTextColorLight:0];
  id v4 = [(MSVArtworkColorAnalyzer *)self sourceImage];
  size_t Width = CGImageGetWidth(v4);
  size_t Height = CGImageGetHeight(v4);
  if (Width && Height)
  {
    if (CGColorSpaceGetSRGB(void)::sOnceToken != -1) {
      dispatch_once(&CGColorSpaceGetSRGB(void)::sOnceToken, &__block_literal_global_1260);
    }
    int64x2_t v7 = (CGColorSpace *)CGColorSpaceGetSRGB(void)::sSpace;
    if (CGColorSpaceGetSRGB(void)::sSpace)
    {
      CopyWithCGColorSpaceRef ColorSpace = CGImageCreateCopyWithColorSpace(v4, (CGColorSpaceRef)CGColorSpaceGetSRGB(void)::sSpace);
      v9 = CopyWithColorSpace;
      if (CopyWithColorSpace) {
        v10 = CopyWithColorSpace;
      }
      else {
        v10 = v4;
      }
    }
    else
    {
      v9 = 0;
      v10 = v4;
    }
    v12 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0x58uLL, v7, 0x2002u);
    unint64_t v11 = v12;
    if (v12)
    {
      v20.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
      v20.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
      v20.size.double width = 22.0;
      v20.size.double height = 22.0;
      CGContextDrawImage(v12, v20, v10);
    }
    if (v9) {
      CGImageRelease(v9);
    }

    if (v11)
    {
      memset(&v18, 0, 24);
      v18.var0.var3 = 1.0;
      memset(&v18.var1, 0, 24);
      v18.var1.var3 = 1.0;
      memset(&v18.var2, 0, 24);
      v18.var2.var3 = 1.0;
      memset(&v18.var3, 0, 24);
      v18.var3.var3 = 1.0;
      memset(&v18.var4, 0, 24);
      v18.var4.var3 = 1.0;
      memset(&v18.var5, 0, 24);
      v18.var5.var3 = 1.0;
      memset(&v18.var6, 0, 24);
      v18.var6.var3 = 1.0;
      memset(&v18.var7, 0, 24);
      v18.var7.var3 = 1.0;
      memset(&v18.var8, 0, 24);
      v18.var8.var3 = 1.0;
      *(double *)((char *)&v18.var9 + 5) = 0.0;
      v18.var9 = 0.0;
      AnalyzeImagePlease(v11, &v18);
      if (v18.var10)
      {
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", (int)(v18.var0.var0 * 255.0), (int)(v18.var0.var1 * 255.0), (int)(v18.var0.var2 * 255.0));
        [(MSVArtworkColorAnalysis *)v3 setBackgroundColorHex:v13];

        [(MSVMutableArtworkColorAnalysis *)v3 setBackgroundColorLight:v18.var11];
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", (int)(v18.var1.var0 * 255.0), (int)(v18.var1.var1 * 255.0), (int)(v18.var1.var2 * 255.0));
        [(MSVArtworkColorAnalysis *)v3 setPrimaryTextColorHex:v14];

        [(MSVMutableArtworkColorAnalysis *)v3 setPrimaryTextColorLight:v18.var12];
        unint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", (int)(v18.var2.var0 * 255.0), (int)(v18.var2.var1 * 255.0), (int)(v18.var2.var2 * 255.0));
        [(MSVArtworkColorAnalysis *)v3 setSecondaryTextColorHex:v15];

        [(MSVMutableArtworkColorAnalysis *)v3 setSecondaryTextColorLight:v18.var13];
        double v16 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", (int)(v18.var3.var0 * 255.0), (int)(v18.var3.var1 * 255.0), (int)(v18.var3.var2 * 255.0));
        [(MSVArtworkColorAnalysis *)v3 setTertiaryTextColorHex:v16];
      }
    }
  }
  else
  {

    unint64_t v11 = 0;
  }
  CGContextRelease(v11);
  return v3;
}

- (MSVArtworkColorAnalyzer)initWithSourceImage:(CGImage *)a3
{
  id v4 = [(MSVArtworkColorAnalyzer *)self init];
  v5 = v4;
  if (v4) {
    [(MSVArtworkColorAnalyzer *)v4 setSourceImage:a3];
  }
  return v5;
}

@end