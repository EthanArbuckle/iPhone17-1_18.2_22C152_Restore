@interface ImageAnalyzerImageColor
+ (CGColor)_colorFromITColor:(ITColor)a3;
+ (CGContext)createContextForImage:(CGImage *)a3;
+ (ImageAnalyzerImageColor)defaultColors;
+ (ImageAnalyzerImageColor)imageColorWithAnalyzedImageColors:(const AnalyzedImageColors *)a3;
+ (ImageAnalyzerImageColor)imageColorWithImageAnalyzer:(const void *)a3;
+ (id)analyzeImage:(CGImage *)a3 error:(id *)a4;
+ (id)determineColors:(CGImage *)a3 error:(id *)a4;
- (BOOL)isBackgroundLight;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImageColor:(id)a3;
- (BOOL)isPrimaryColorLight;
- (BOOL)isSecondaryColorLight;
- (CGColor)backgroundColor;
- (CGColor)primaryDropShadowColor;
- (CGColor)primaryTextColor;
- (CGColor)quarnaryDropShadowColor;
- (CGColor)quaternaryTextColor;
- (CGColor)secondaryDropShadowColor;
- (CGColor)secondaryTextColor;
- (CGColor)tertiaryDropShadowColor;
- (CGColor)tertiaryTextColor;
- (ImageAnalyzerImageColor)initWithAnalyzedImageColors:(const AnalyzedImageColors *)a3;
- (ImageAnalyzerImageColor)initWithImageAnalyzer:(const void *)a3;
- (id)colorString:(CGColor *)a3;
- (id)description;
- (void)dealloc;
@end

@implementation ImageAnalyzerImageColor

- (BOOL)isSecondaryColorLight
{
  return self->_isSecondaryColorLight;
}

- (BOOL)isPrimaryColorLight
{
  return self->_isPrimaryColorLight;
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (CGColor)quarnaryDropShadowColor
{
  return self->_quarnaryDropShadowColor;
}

- (CGColor)tertiaryDropShadowColor
{
  return self->_tertiaryDropShadowColor;
}

- (CGColor)secondaryDropShadowColor
{
  return self->_secondaryDropShadowColor;
}

- (CGColor)primaryDropShadowColor
{
  return self->_primaryDropShadowColor;
}

- (CGColor)quaternaryTextColor
{
  return self->_quaternaryTextColor;
}

- (CGColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (CGColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (CGColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)isEqualToImageColor:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && CGColorEqualToColor(-[ImageAnalyzerImageColor backgroundColor](self, "backgroundColor"), (CGColorRef)[v4 backgroundColor])&& CGColorEqualToColor(-[ImageAnalyzerImageColor primaryTextColor](self, "primaryTextColor"), (CGColorRef)objc_msgSend(v4, "primaryTextColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor tertiaryTextColor](self, "tertiaryTextColor"), (CGColorRef)objc_msgSend(v4, "tertiaryTextColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor quaternaryTextColor](self, "quaternaryTextColor"), (CGColorRef)objc_msgSend(v4, "quaternaryTextColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor primaryDropShadowColor](self, "primaryDropShadowColor"), (CGColorRef)objc_msgSend(v4, "primaryDropShadowColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor secondaryDropShadowColor](self, "secondaryDropShadowColor"), (CGColorRef)objc_msgSend(v4, "secondaryDropShadowColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor tertiaryDropShadowColor](self, "tertiaryDropShadowColor"),
         (CGColorRef)[v4 tertiaryDropShadowColor])
    && CGColorEqualToColor(-[ImageAnalyzerImageColor quarnaryDropShadowColor](self, "quarnaryDropShadowColor"), (CGColorRef)[v4 quarnaryDropShadowColor]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(ImageAnalyzerImageColor *)self isEqualToImageColor:v4];

  return v5;
}

- (ImageAnalyzerImageColor)initWithAnalyzedImageColors:(const AnalyzedImageColors *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)ImageAnalyzerImageColor;
  id v4 = [(ImageAnalyzerImageColor *)&v33 init];
  if (v4)
  {
    long long v5 = *(_OWORD *)&a3->var0.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var0.var0;
    long long v35 = v5;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CGColorRef v7 = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v4->_backgroundColor = v7;
    long long v8 = *(_OWORD *)&a3->var1.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var1.var0;
    long long v35 = v8;
    v9 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v10 = CGColorCreate(v9, components);
    CGColorSpaceRelease(v9);
    v4->_primaryTextColor = v10;
    long long v11 = *(_OWORD *)&a3->var2.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var2.var0;
    long long v35 = v11;
    v12 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v13 = CGColorCreate(v12, components);
    CGColorSpaceRelease(v12);
    v4->_secondaryTextColor = v13;
    long long v14 = *(_OWORD *)&a3->var3.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var3.var0;
    long long v35 = v14;
    v15 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v16 = CGColorCreate(v15, components);
    CGColorSpaceRelease(v15);
    v4->_tertiaryTextColor = v16;
    long long v17 = *(_OWORD *)&a3->var4.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var4.var0;
    long long v35 = v17;
    v18 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v19 = CGColorCreate(v18, components);
    CGColorSpaceRelease(v18);
    v4->_quaternaryTextColor = v19;
    long long v20 = *(_OWORD *)&a3->var5.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var5.var0;
    long long v35 = v20;
    v21 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v22 = CGColorCreate(v21, components);
    CGColorSpaceRelease(v21);
    v4->_primaryDropShadowColor = v22;
    long long v23 = *(_OWORD *)&a3->var7.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var7.var0;
    long long v35 = v23;
    v24 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v25 = CGColorCreate(v24, components);
    CGColorSpaceRelease(v24);
    v4->_tertiaryDropShadowColor = v25;
    long long v26 = *(_OWORD *)&a3->var6.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var6.var0;
    long long v35 = v26;
    v27 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v28 = CGColorCreate(v27, components);
    CGColorSpaceRelease(v27);
    v4->_secondaryDropShadowColor = v28;
    long long v29 = *(_OWORD *)&a3->var8.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var8.var0;
    long long v35 = v29;
    v30 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v31 = CGColorCreate(v30, components);
    CGColorSpaceRelease(v30);
    v4->_quarnaryDropShadowColor = v31;
    v4->_isBackgroundLight = a3->var11;
    v4->_isPrimaryColorLight = a3->var12;
    v4->_isSecondaryColorLight = a3->var13;
  }
  return v4;
}

- (void)dealloc
{
  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_primaryTextColor);
  CGColorRelease(self->_secondaryTextColor);
  CGColorRelease(self->_tertiaryTextColor);
  CGColorRelease(self->_quaternaryTextColor);
  CGColorRelease(self->_primaryDropShadowColor);
  CGColorRelease(self->_tertiaryDropShadowColor);
  CGColorRelease(self->_secondaryDropShadowColor);
  CGColorRelease(self->_quarnaryDropShadowColor);
  v3.receiver = self;
  v3.super_class = (Class)ImageAnalyzerImageColor;
  [(ImageAnalyzerImageColor *)&v3 dealloc];
}

- (ImageAnalyzerImageColor)initWithImageAnalyzer:(const void *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)ImageAnalyzerImageColor;
  id v4 = [(ImageAnalyzerImageColor *)&v39 init];
  if (v4)
  {
    long long v5 = *((_OWORD *)a3 + 3);
    *(_OWORD *)components = *((_OWORD *)a3 + 2);
    long long v41 = v5;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CGColorRef v7 = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v4->_backgroundColor = v7;
    long long v8 = *((_OWORD *)a3 + 5);
    *(_OWORD *)components = *((_OWORD *)a3 + 4);
    long long v41 = v8;
    v9 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v10 = CGColorCreate(v9, components);
    CGColorSpaceRelease(v9);
    v4->_primaryTextColor = v10;
    long long v11 = *((_OWORD *)a3 + 7);
    *(_OWORD *)components = *((_OWORD *)a3 + 6);
    long long v41 = v11;
    v12 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v13 = CGColorCreate(v12, components);
    CGColorSpaceRelease(v12);
    v4->_secondaryTextColor = v13;
    long long v14 = *((_OWORD *)a3 + 9);
    *(_OWORD *)components = *((_OWORD *)a3 + 8);
    long long v41 = v14;
    v15 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v16 = CGColorCreate(v15, components);
    CGColorSpaceRelease(v15);
    v4->_tertiaryTextColor = v16;
    long long v17 = *((_OWORD *)a3 + 11);
    *(_OWORD *)components = *((_OWORD *)a3 + 10);
    long long v41 = v17;
    v18 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v19 = CGColorCreate(v18, components);
    CGColorSpaceRelease(v18);
    v4->_quaternaryTextColor = v19;
    long long v20 = *((_OWORD *)a3 + 13);
    *(_OWORD *)components = *((_OWORD *)a3 + 12);
    long long v41 = v20;
    v21 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v22 = CGColorCreate(v21, components);
    CGColorSpaceRelease(v21);
    v4->_primaryDropShadowColor = v22;
    long long v23 = *((_OWORD *)a3 + 15);
    *(_OWORD *)components = *((_OWORD *)a3 + 14);
    long long v41 = v23;
    v24 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v25 = CGColorCreate(v24, components);
    CGColorSpaceRelease(v24);
    v4->_tertiaryDropShadowColor = v25;
    long long v26 = *((_OWORD *)a3 + 17);
    *(_OWORD *)components = *((_OWORD *)a3 + 16);
    long long v41 = v26;
    v27 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v28 = CGColorCreate(v27, components);
    CGColorSpaceRelease(v27);
    v4->_secondaryDropShadowColor = v28;
    long long v29 = *((_OWORD *)a3 + 19);
    *(_OWORD *)components = *((_OWORD *)a3 + 18);
    long long v41 = v29;
    v30 = CGColorSpaceCreateDeviceRGB();
    CGColorRef v31 = CGColorCreate(v30, components);
    CGColorSpaceRelease(v30);
    v4->_quarnaryDropShadowColor = v31;
    ITColor::GetLuminance(v32, *((__n128 *)a3 + 2), *((double *)a3 + 6));
    v4->_isBackgroundLight = v33 >= 0.180000007;
    ITColor::GetLuminance(v34, *((__n128 *)a3 + 4), *((double *)a3 + 10));
    v4->_isPrimaryColorLight = v35 >= 0.180000007;
    ITColor::GetLuminance(v36, *((__n128 *)a3 + 6), *((double *)a3 + 14));
    v4->_isSecondaryColorLight = v37 >= 0.180000007;
  }
  return v4;
}

- (id)colorString:(CGColor *)a3
{
  Components = CGColorGetComponents(a3);
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
  double v6 = 1.0;
  switch(NumberOfComponents)
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      double v6 = Components[1];
LABEL_3:
      uint64_t v7 = *(void *)Components;
      uint64_t v8 = *(void *)Components;
      uint64_t v9 = *(void *)Components;
      return (id)[NSString stringWithFormat:@"red: %f, green: %f, blue: %f, alpha: %f", v7, v8, v9, *(void *)&v6];
    case 3uLL:
      goto LABEL_6;
    case 4uLL:
      double v6 = Components[3];
LABEL_6:
      uint64_t v7 = *(void *)Components;
      uint64_t v8 = *((void *)Components + 1);
      uint64_t v9 = *((void *)Components + 2);
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      break;
  }
  return (id)[NSString stringWithFormat:@"red: %f, green: %f, blue: %f, alpha: %f", v7, v8, v9, *(void *)&v6];
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = [(ImageAnalyzerImageColor *)self colorString:[(ImageAnalyzerImageColor *)self backgroundColor]];
  long long v5 = [(ImageAnalyzerImageColor *)self colorString:[(ImageAnalyzerImageColor *)self primaryTextColor]];
  double v6 = [(ImageAnalyzerImageColor *)self colorString:[(ImageAnalyzerImageColor *)self secondaryTextColor]];
  uint64_t v7 = [(ImageAnalyzerImageColor *)self colorString:[(ImageAnalyzerImageColor *)self tertiaryTextColor]];
  uint64_t v8 = [(ImageAnalyzerImageColor *)self colorString:[(ImageAnalyzerImageColor *)self quaternaryTextColor]];
  uint64_t v9 = [v3 stringWithFormat:@"backgroundColor:{%@}, textPrimaryColor:{%@}, secondaryTextColor:{%@}, tertiaryTextColor:{%@}, quaternaryTextColor:{%@}", v4, v5, v6, v7, v8];

  return v9;
}

+ (CGContext)createContextForImage:(CGImage *)a3
{
  if (!a3) {
    return 0;
  }
  objc_super v3 = a3;
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(v3);
  double v6 = 0;
  if (Width && Height)
  {
    if (CGColorSpaceGetSRGB(void)::sOnceToken != -1) {
      dispatch_once(&CGColorSpaceGetSRGB(void)::sOnceToken, &__block_literal_global_1260);
    }
    uint64_t v7 = (CGColorSpace *)CGColorSpaceGetSRGB(void)::sSpace;
    if (CGColorSpaceGetSRGB(void)::sSpace)
    {
      CGImageRef CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v3, (CGColorSpaceRef)CGColorSpaceGetSRGB(void)::sSpace);
      uint64_t v9 = CopyWithColorSpace;
      if (CopyWithColorSpace) {
        objc_super v3 = CopyWithColorSpace;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    CGColorRef v10 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0x58uLL, v7, 0x2002u);
    double v6 = v10;
    if (v10)
    {
      v12.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
      v12.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
      v12.size.width = 22.0;
      v12.size.height = 22.0;
      CGContextDrawImage(v10, v12, v3);
    }
    if (v9) {
      CGImageRelease(v9);
    }
  }
  return v6;
}

+ (CGColor)_colorFromITColor:(ITColor)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = var0;
  components[1] = var1;
  CGFloat components[2] = var2;
  components[3] = var3;
  CGColorRef v8 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  CFAutorelease(v8);
  return v8;
}

+ (id)analyzeImage:(CGImage *)a3 error:(id *)a4
{
  id v4 = (CGContext *)[a1 createContextForImage:a3];
  long long v5 = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 2, "+[ImageColor analyzeImage:error:] - failed to create CGContext.", v9, v10, v11, v12, v13, v14);
  }
  memset(&v15, 0, 24);
  v15.var0.double var3 = 1.0;
  memset(&v15.var1, 0, 24);
  v15.var1.double var3 = 1.0;
  memset(&v15.var2, 0, 24);
  v15.var2.double var3 = 1.0;
  memset(&v15.var3, 0, 24);
  v15.var3.double var3 = 1.0;
  memset(&v15.var4, 0, 24);
  v15.var4.double var3 = 1.0;
  memset(&v15.var5, 0, 24);
  v15.var5.double var3 = 1.0;
  memset(&v15.var6, 0, 24);
  v15.var6.double var3 = 1.0;
  memset(&v15.var7, 0, 24);
  v15.var7.double var3 = 1.0;
  memset(&v15.var8, 0, 24);
  v15.var8.double var3 = 1.0;
  *(double *)((char *)&v15.var9 + 5) = 0.0;
  v15.var9 = 0.0;
  AnalyzeImagePlease(v4, &v15);
  double v6 = +[ImageAnalyzerImageColor imageColorWithAnalyzedImageColors:&v15];
  CGContextRelease(v5);
  return v6;
}

+ (id)determineColors:(CGImage *)a3 error:(id *)a4
{
  memset(&v98[4], 0, 24);
  v98[7] = 0x3FF0000000000000;
  memset(&v98[8], 0, 24);
  v98[11] = 0x3FF0000000000000;
  memset(&v98[12], 0, 24);
  v98[15] = 0x3FF0000000000000;
  memset(&v98[16], 0, 24);
  v98[19] = 0x3FF0000000000000;
  memset(&v98[20], 0, 24);
  v98[23] = 0x3FF0000000000000;
  memset(&v98[24], 0, 24);
  v98[27] = 0x3FF0000000000000;
  memset(&v98[28], 0, 24);
  v98[31] = 0x3FF0000000000000;
  memset(&v98[32], 0, 24);
  v98[35] = 0x3FF0000000000000;
  memset(&v98[36], 0, 24);
  v98[39] = 0x3FF0000000000000;
  v98[0] = 0;
  v98[1] = 0;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  if (!a3)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ImageAnalyzer::AnalyzeImage() - CGImageRef parameter is nil.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E5AD94D8, MEMORY[0x1E4FBA1E8]);
  }
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  int v6 = AlphaInfo;
  if (AlphaInfo)
  {
    if (AlphaInfo == kCGImageAlphaLast)
    {
      int v6 = 1;
    }
    else if (AlphaInfo == kCGImageAlphaFirst)
    {
      int v6 = 2;
    }
  }
  else
  {
    int v6 = 5;
  }
  ColorSpace = CGImageGetColorSpace(a3);
  CGColorRef v8 = ColorSpace;
  if (ColorSpace)
  {
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    BOOL v10 = CGColorSpaceSupportsOutput(v8);
    if (Model != kCGColorSpaceModelRGB || !v10)
    {
      if (CGColorSpaceGetSRGB(void)::sOnceToken != -1) {
        dispatch_once(&CGColorSpaceGetSRGB(void)::sOnceToken, &__block_literal_global_1260);
      }
      CGColorRef v8 = (CGColorSpace *)CGColorSpaceGetSRGB(void)::sSpace;
    }
  }
  uint64_t v12 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0, v8, 1u);
  uint64_t v13 = v12;
  if (!v12)
  {
    v59 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v59, 2, "ImageAnalyzer::GenerateColorMaps() - Failed to create CG Context", v60, v61, v62, v63, v64, v88);
  }
  v108 = v12;
  char v109 = 1;
  v112.origin.x = 0.0;
  v112.origin.y = 0.0;
  v112.size.vImagePixelCount width = 22.0;
  v112.size.vImagePixelCount height = 22.0;
  CGContextDrawImage(v12, v112, a3);
  Image = CGBitmapContextCreateImage(v13);
  AnalyzedImageColors v15 = Image;
  if (!Image)
  {
    v65 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v65, 3, "ImageAnalyzer::GenerateColorMaps() - Failed to create CG Image", v66, v67, v68, v69, v70, v88);
  }
  v106 = Image;
  char v107 = 1;
  __int16 BitmapInfo = CGImageGetBitmapInfo(Image);
  memset(&dest, 0, sizeof(dest));
  uint64_t v104 = 0;
  memset(v103, 0, sizeof(v103));
  uint64_t v17 = MEMORY[0x1A6242F40](&dest, v103, 0, v15, 256);
  char v18 = v17;
  if (v17)
  {
    v71 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v71, 4, "ImageAnalyzer::GenerateColorMaps() - Failed to create vImageBuffer from CGImage (%zd)", v72, v73, v74, v75, v76, v18);
  }
  if (v6 == 1)
  {
    vImage_Error v19 = vImageUnpremultiplyData_RGBA8888(&dest, &dest, 0x100u);
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_24;
    }
    vImage_Error v19 = vImageUnpremultiplyData_ARGB8888(&dest, &dest, 0x100u);
  }
  char v20 = v19;
  if (v19)
  {
    v77 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v77, 4, "ImageAnalyzer::GenerateColorMaps() - vImage error un-premultiplying image data. (%zd)", v83, v84, v85, v86, v87, v20);
LABEL_59:
  }
LABEL_24:
  vImagePixelCount height = dest.height;
  vImagePixelCount width = dest.width;
  size_t rowBytes = dest.rowBytes;
  data = (char *)dest.data;
  v89 = malloc_type_calloc(dest.height * dest.width, 0x28uLL, 0x10000400A747E1EuLL);
  if (!v89)
  {
    v77 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v77, 1, "ImageAnalyzer::getHSVMap() - Failed to allocate memory for imageHSVMap.", v78, v79, v80, v81, v82, v88);
    goto LABEL_59;
  }
  vImagePixelCount v25 = height - 1;
  if (height - 1 >= 2)
  {
    int v26 = 0;
    unsigned int v27 = v6 & 0xFFFFFFFB;
    unint64_t v28 = width - 1;
    BOOL v29 = (BitmapInfo & 0x3000) != 0;
    BOOL v30 = (BitmapInfo & 0x3000) == 0 || (v6 & 0xFFFFFFFB) == 2;
    BOOL v31 = v27 == 2 && v29;
    char v32 = v27 == 2 || v29;
    vImagePixelCount v90 = width - 2;
    uint64_t v33 = 1;
    unint64_t v91 = width - 1;
    vImagePixelCount v92 = v25;
    do
    {
      if (v28 >= 2)
      {
        v34 = &data[v33 * rowBytes];
        double v35 = v34 + 7;
        vImagePixelCount v36 = v90;
        uint64_t v37 = (uint64_t)v89 + 40 * v26 + 16;
        v26 += v90;
        do
        {
          v38 = v34;
          v34 += 4;
          if (v30)
          {
            if (v31)
            {
              objc_super v39 = v35 - 1;
              v40 = v35 - 2;
              long long v41 = v34;
              uint64_t v42 = v35;
            }
            else if (v32)
            {
              uint64_t v42 = v38 + 5;
              objc_super v39 = v38 + 6;
              v40 = v38 + 7;
              long long v41 = v34;
            }
            else
            {
              objc_super v39 = v38 + 5;
              v40 = v38 + 6;
              long long v41 = v35;
              uint64_t v42 = v34;
            }
          }
          else
          {
            long long v41 = v38 + 7;
            uint64_t v42 = v38 + 6;
            objc_super v39 = v38 + 5;
            v40 = v34;
          }
          LOBYTE(v23) = *v42;
          *(double *)&unint64_t v43 = (double)*(unint64_t *)&v23;
          v44.n128_f64[0] = *(double *)&v43 / 255.0;
          LOBYTE(v43) = *v39;
          LOBYTE(v24) = *v40;
          *(double *)&long long v24 = (double)(unint64_t)v24;
          double v45 = *(double *)&v24 / 255.0;
          LOBYTE(v24) = *v41;
          v44.n128_f64[1] = (double)v43 / 255.0;
          __n128 v95 = v44;
          double v96 = v45;
          *(double *)&long long v24 = (double)(unint64_t)v24;
          long long v97 = v24;
          *(double *)&long long v46 = v45;
          *((void *)&v46 + 1) = v24;
          *(__n128 *)&v110.double var0 = v44;
          *(_OWORD *)&v110.double var2 = v46;
          double HSVColor = ITColor::GetHSVColor(&v110);
          uint64_t v49 = v48;
          uint64_t v51 = v50;
          ITColor::GetLuminance(v52, v95, v96);
          *(double *)(v37 - 16) = HSVColor;
          *(void *)(v37 - 8) = v49;
          *(void *)uint64_t v37 = v51;
          *(double *)(v37 + 8) = v53;
          *((void *)&v24 + 1) = *((void *)&v97 + 1);
          *(void *)(v37 + 16) = v97;
          *(void *)&long long v24 = *((void *)&v102 + 1);
          double v23 = v53 + *((double *)&v102 + 1);
          *((double *)&v102 + 1) = v23;
          v35 += 4;
          v37 += 40;
          --v36;
        }
        while (v36);
        unint64_t v28 = v91;
        vImagePixelCount v25 = v92;
      }
      ++v33;
    }
    while (v33 != v25);
  }
  *((double *)&v102 + 1) = *((double *)&v102 + 1) / 400.0;
  v98[0] = v89;
  if (dest.data) {
    free(dest.data);
  }
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_1>::~final_act((uint64_t)&v106);
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_0>::~final_act((uint64_t)&v108);
  ImageAnalyzer::QuantizeColorMaps((ImageAnalyzer *)v98);
  ImageAnalyzer::PickBackgroundColor((ImageAnalyzer *)v98);
  ImageAnalyzer::PickTextColors((ImageAnalyzer *)v98);
  ImageAnalyzer::DoPostImageAnalysis((ImageAnalyzer *)v98, v54, v55);
  v56 = +[ImageAnalyzerImageColor imageColorWithImageAnalyzer:v98];
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v98);
  return v56;
}

+ (ImageAnalyzerImageColor)imageColorWithAnalyzedImageColors:(const AnalyzedImageColors *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithAnalyzedImageColors:a3];
  return (ImageAnalyzerImageColor *)v3;
}

+ (ImageAnalyzerImageColor)imageColorWithImageAnalyzer:(const void *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithImageAnalyzer:a3];
  return (ImageAnalyzerImageColor *)v3;
}

+ (ImageAnalyzerImageColor)defaultColors
{
  if (+[ImageAnalyzerImageColor defaultColors]::onceToken != -1) {
    dispatch_once(&+[ImageAnalyzerImageColor defaultColors]::onceToken, &__block_literal_global);
  }
  v2 = (void *)+[ImageAnalyzerImageColor defaultColors]::_defaultColors;
  return (ImageAnalyzerImageColor *)v2;
}

CGColorRef __40__ImageAnalyzerImageColor_defaultColors__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)+[ImageAnalyzerImageColor defaultColors]::_defaultColors;
  +[ImageAnalyzerImageColor defaultColors]::_defaultColors = v0;

  *(void *)(+[ImageAnalyzerImageColor defaultColors];
  *(void *)(+[ImageAnalyzerImageColor defaultColors];
  CGColorRef result = CGColorCreateGenericRGB(0.333, 0.333, 0.333, 1.0);
  uint64_t v3 = +[ImageAnalyzerImageColor defaultColors]::_defaultColors;
  *(void *)(+[ImageAnalyzerImageColor defaultColors]::_defaultColors + 32) = result;
  *(unsigned char *)(v3 + 8) = 1;
  return result;
}

@end