@interface VUICoreUtilities
+ (BOOL)canHandleDecodingOnRenderThread;
+ (BOOL)radiiIsZero:(_VUICornerRadii)a3;
+ (BOOL)runningAnInternalBuild;
+ (BOOL)runningUiTest;
+ (CGPath)createPathForRadii:(_VUICornerRadii)a3 inRect:(CGRect)a4 isContinuous:(BOOL)a5;
+ (CGPath)shadowPathWithCornerRadii:(_VUICornerRadii)a3 andScaledSize:(CGSize)a4;
+ (CGRect)centerRect:(CGRect)result inRect:(CGRect)a4;
+ (_VUICornerRadii)radiiFromRadius:(double)a3;
+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4;
+ (double)radiusFromCornerRadii:(_VUICornerRadii)a3;
+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4;
+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4 maximumContentSizeCategory:(unint64_t)a5;
+ (id)TVUIKitBundle;
+ (id)URLForResource:(id)a3;
+ (id)VideosUIBundle;
+ (id)VideosUICoreBundle;
+ (id)_URLForResource:(id)a3 inBundle:(id)a4;
+ (id)_getImageFromURLorBundle:(id)a3;
+ (id)_imageForResource:(id)a3;
+ (id)_vuiCoreResourceMap;
+ (id)defaultPlaceholderImageForUserInterfaceStyle:(unint64_t)a3;
+ (id)imageForResource:(id)a3 accessibilityDescription:(id)a4;
+ (id)mobileGestaltStringForKey:(__CFString *)a3;
+ (id)randomColor;
+ (id)uiContentSizeCategoryFor:(unint64_t)a3;
+ (unint64_t)vuiContentSizeCategoryFor:(id)a3;
+ (unint64_t)vuiUserInterfaceStyleForInterfaceStyle:(int64_t)a3;
+ (void)image:(id)a3 didCompleteLoadingForCache:(int64_t)a4 requestRecord:(id)a5;
+ (void)vuiColor:(id)a3 getRed:(double *)a4 green:(double *)a5 blue:(double *)a6 alpha:(double *)a7;
@end

@implementation VUICoreUtilities

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4
{
  id v5 = a4;
  [(id)objc_opt_class() scaleContentSizeValue:v5 forTraitCollection:0 maximumContentSizeCategory:a3];
  double v7 = v6;

  return v7;
}

+ (CGPath)shadowPathWithCornerRadii:(_VUICornerRadii)a3 andScaledSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double bottomRight = a3.bottomRight;
  double bottomLeft = a3.bottomLeft;
  double topRight = a3.topRight;
  double topLeft = a3.topLeft;
  v10 = [NSString stringWithFormat:@"{%.1lf, %.1lf}[%.1f %.1f %.1f %.1f]", *(void *)&a4.width, *(void *)&a4.height, *(void *)&a3.topLeft, *(void *)&a3.topRight, *(void *)&a3.bottomRight, *(void *)&a3.bottomLeft];
  Mutable = [(id)shadowPathWithCornerRadii_andScaledSize__pathsByShape objectForKeyedSubscript:v10];

  if (!Mutable)
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint((CGMutablePathRef)Mutable, 0, topLeft, height);
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, width - (topLeft + topRight), height);
    if (topRight > 0.0) {
      CGPathAddArc((CGMutablePathRef)Mutable, 0, width - topRight, height - topRight, topRight, 1.57079633, 0.0, 1);
    }
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, width, bottomRight);
    if (bottomRight > 0.0) {
      CGPathAddArc((CGMutablePathRef)Mutable, 0, width - bottomRight, bottomRight, bottomRight, 0.0, -1.57079633, 1);
    }
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, bottomLeft, 0.0);
    if (bottomLeft > 0.0) {
      CGPathAddArc((CGMutablePathRef)Mutable, 0, bottomLeft, bottomLeft, bottomLeft, -1.57079633, -3.14159265, 1);
    }
    double v12 = height - topLeft;
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, 0.0, v12);
    if (topLeft > 0.0) {
      CGPathAddArc((CGMutablePathRef)Mutable, 0, topLeft, v12, topLeft, 3.14159265, 1.57079633, 1);
    }
    v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    if (!shadowPathWithCornerRadii_andScaledSize__pathsByShape)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      v15 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
      shadowPathWithCornerRadii_andScaledSize__pathsByShape = v14;

      v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    }
    [v13 setObject:Mutable forKeyedSubscript:v10];
  }
  return (CGPath *)Mutable;
}

+ (double)radiusFromCornerRadii:(_VUICornerRadii)a3
{
  return fmax(fmax(a3.topLeft, a3.topRight), fmax(a3.bottomLeft, a3.bottomRight));
}

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4 maximumContentSizeCategory:(unint64_t)a5
{
  id v7 = a4;
  if (scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken != -1) {
    dispatch_once(&scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken, &__block_literal_global_72);
  }
  unint64_t v8 = [v7 vuiPreferredContentSizeCategory];
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F42D90] mainScreen];
    v10 = [v9 vuiTraitCollection];
    unint64_t v8 = [v10 vuiPreferredContentSizeCategory];
  }
  if (v8 <= a5 || a5 == 0) {
    unint64_t v12 = v8;
  }
  else {
    unint64_t v12 = a5;
  }
  v13 = (void *)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale;
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];
  v16 = (void *)v15;
  v17 = &unk_1F3DFD6F8;
  if (v15) {
    v17 = (void *)v15;
  }
  id v18 = v17;

  [v18 floatValue];
  float v20 = v19;

  return ceil(v20 * a3);
}

+ (id)uiContentSizeCategoryFor:(unint64_t)a3
{
  if (uiContentSizeCategoryFor__onceToken != -1) {
    dispatch_once(&uiContentSizeCategoryFor__onceToken, &__block_literal_global_69);
  }
  v4 = (void *)uiContentSizeCategoryFor__sVuiContentSizeCategory;
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

+ (unint64_t)vuiContentSizeCategoryFor:(id)a3
{
  uint64_t v3 = vuiContentSizeCategoryFor__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&vuiContentSizeCategoryFor__onceToken, &__block_literal_global_41);
  }
  id v5 = [(id)vuiContentSizeCategoryFor__sContentSizeCategoryVui objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

+ (id)imageForResource:(id)a3 accessibilityDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[VUICoreUtilities _imageForResource:v5];
  if (!v7)
  {
    id v7 = +[VUICoreUtilities _getImageFromURLorBundle:v5];
    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F42A80] systemImageNamed:v5];
    }
  }
  if (v6) {
    [v7 setAccessibilityLabel:v6];
  }

  return v7;
}

+ (id)_imageForResource:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = +[VUICoreUtilities VideosUIBundle];
    id v5 = [MEMORY[0x1E4F42A80] vuiImageNamed:v3 inBundle:v4];
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v5 = [MEMORY[0x1E4F42A80] vuiImageNamed:v3 inBundle:v6];

      if (!v5)
      {
        id v5 = [MEMORY[0x1E4F42A80] vuiSystemImageNamed:v3 withConfiguration:0 accessibilityDescription:0];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)VideosUIBundle
{
  if (VideosUIBundle_onceToken != -1) {
    dispatch_once(&VideosUIBundle_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)VideosUIBundle_bundle;
  return v2;
}

+ (void)image:(id)a3 didCompleteLoadingForCache:(int64_t)a4 requestRecord:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a3;
    v9 = [v8 uiImage];
    v10 = [v8 imageType];

    v11 = (__CFString *)UTTypeCopyPreferredTagWithClass(v10, (CFStringRef)*MEMORY[0x1E4F22500]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke;
    v15[3] = &unk_1E6DDCFA0;
    v16 = v10;
    id v17 = v9;
    id v18 = v11;
    unint64_t v12 = v11;
    id v13 = v9;
    uint64_t v14 = v10;
    [v7 didCompleteLoadingFromCache:a4 withResponseBodyBlock:v15];
  }
}

+ (BOOL)canHandleDecodingOnRenderThread
{
  return 0;
}

void __88__VUICoreUtilities_scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory___block_invoke()
{
  id v2 = (id)objc_opt_new();
  [v2 setObject:&unk_1F3DFD6C8 forKeyedSubscript:&unk_1F3DFD500];
  [v2 setObject:&unk_1F3DFD6D8 forKeyedSubscript:&unk_1F3DFD518];
  [v2 setObject:&unk_1F3DFD6E8 forKeyedSubscript:&unk_1F3DFD530];
  [v2 setObject:&unk_1F3DFD6F8 forKeyedSubscript:&unk_1F3DFD548];
  [v2 setObject:&unk_1F3DFD708 forKeyedSubscript:&unk_1F3DFD560];
  [v2 setObject:&unk_1F3DFD718 forKeyedSubscript:&unk_1F3DFD578];
  [v2 setObject:&unk_1F3DFD728 forKeyedSubscript:&unk_1F3DFD590];
  [v2 setObject:&unk_1F3DFD738 forKeyedSubscript:&unk_1F3DFD5A8];
  [v2 setObject:&unk_1F3DFD748 forKeyedSubscript:&unk_1F3DFD5C0];
  [v2 setObject:&unk_1F3DFD758 forKeyedSubscript:&unk_1F3DFD5D8];
  [v2 setObject:&unk_1F3DFD768 forKeyedSubscript:&unk_1F3DFD5F0];
  [v2 setObject:&unk_1F3DFD778 forKeyedSubscript:&unk_1F3DFD608];
  uint64_t v0 = [v2 copy];
  v1 = (void *)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale;
  scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale = v0;
}

+ (BOOL)radiiIsZero:(_VUICornerRadii)a3
{
  return a3.topLeft < 2.22044605e-16
      && a3.topRight < 2.22044605e-16
      && a3.bottomLeft < 2.22044605e-16
      && a3.bottomRight < 2.22044605e-16;
}

uint64_t __34__VUICoreUtilities_VideosUIBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.VideosUI"];
  uint64_t v1 = VideosUIBundle_bundle;
  VideosUIBundle_bundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __42__VUICoreUtilities_runningAnInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  runningAnInternalBuild_internalBuild = result;
  return result;
}

+ (BOOL)runningAnInternalBuild
{
  if (runningAnInternalBuild_onceToken != -1) {
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_475);
  }
  return runningAnInternalBuild_internalBuild;
}

void __46__VUICoreUtilities_vuiContentSizeCategoryFor___block_invoke()
{
  v9[13] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F437A8];
  v8[0] = *MEMORY[0x1E4F437D0];
  v8[1] = v0;
  v9[0] = &unk_1F3DFD4E8;
  v9[1] = &unk_1F3DFD500;
  uint64_t v1 = *MEMORY[0x1E4F437B8];
  v8[2] = *MEMORY[0x1E4F437C8];
  v8[3] = v1;
  v9[2] = &unk_1F3DFD518;
  v9[3] = &unk_1F3DFD530;
  uint64_t v2 = *MEMORY[0x1E4F437A0];
  v8[4] = *MEMORY[0x1E4F437B0];
  v8[5] = v2;
  v9[4] = &unk_1F3DFD548;
  v9[5] = &unk_1F3DFD560;
  uint64_t v3 = *MEMORY[0x1E4F43790];
  v8[6] = *MEMORY[0x1E4F43798];
  v8[7] = v3;
  v9[6] = &unk_1F3DFD578;
  v9[7] = &unk_1F3DFD590;
  uint64_t v4 = *MEMORY[0x1E4F43778];
  v8[8] = *MEMORY[0x1E4F43780];
  v8[9] = v4;
  v9[8] = &unk_1F3DFD5A8;
  v9[9] = &unk_1F3DFD5C0;
  uint64_t v5 = *MEMORY[0x1E4F43768];
  v8[10] = *MEMORY[0x1E4F43770];
  v8[11] = v5;
  v9[10] = &unk_1F3DFD5D8;
  v9[11] = &unk_1F3DFD5F0;
  v8[12] = *MEMORY[0x1E4F43760];
  v9[12] = &unk_1F3DFD608;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:13];
  id v7 = (void *)vuiContentSizeCategoryFor__sContentSizeCategoryVui;
  vuiContentSizeCategoryFor__sContentSizeCategoryVui = v6;
}

void __45__VUICoreUtilities_uiContentSizeCategoryFor___block_invoke()
{
  v15[13] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F437D0];
  v14[0] = &unk_1F3DFD4E8;
  v14[1] = &unk_1F3DFD500;
  uint64_t v1 = *MEMORY[0x1E4F437A8];
  v15[0] = v0;
  v15[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F437C8];
  v14[2] = &unk_1F3DFD518;
  v14[3] = &unk_1F3DFD530;
  uint64_t v3 = *MEMORY[0x1E4F437B8];
  v15[2] = v2;
  v15[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F437B0];
  v14[4] = &unk_1F3DFD548;
  v14[5] = &unk_1F3DFD560;
  uint64_t v5 = *MEMORY[0x1E4F437A0];
  void v15[4] = v4;
  v15[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F43798];
  v14[6] = &unk_1F3DFD578;
  v14[7] = &unk_1F3DFD590;
  uint64_t v7 = *MEMORY[0x1E4F43790];
  v15[6] = v6;
  v15[7] = v7;
  uint64_t v8 = *MEMORY[0x1E4F43780];
  v14[8] = &unk_1F3DFD5A8;
  v14[9] = &unk_1F3DFD5C0;
  uint64_t v9 = *MEMORY[0x1E4F43778];
  v15[8] = v8;
  v15[9] = v9;
  uint64_t v10 = *MEMORY[0x1E4F43770];
  v14[10] = &unk_1F3DFD5D8;
  v14[11] = &unk_1F3DFD5F0;
  uint64_t v11 = *MEMORY[0x1E4F43768];
  v15[10] = v10;
  v15[11] = v11;
  v14[12] = &unk_1F3DFD608;
  v15[12] = *MEMORY[0x1E4F43760];
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:13];
  id v13 = (void *)uiContentSizeCategoryFor__sVuiContentSizeCategory;
  uiContentSizeCategoryFor__sVuiContentSizeCategory = v12;
}

+ (id)mobileGestaltStringForKey:(__CFString *)a3
{
  uint64_t v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      uint64_t v6 = [NSString stringWithString:v4];
    }
    else
    {
      uint64_t v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

void __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2;
  v6[3] = &unk_1E6DDCF78;
  id v7 = a1[4];
  id v8 = a1[5];
  id v10 = v3;
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4E602B0]();
  id v3 = (void *)*MEMORY[0x1E4F22610];
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F22610]])
  {

LABEL_4:
    uint64_t v6 = [*(id *)(a1 + 40) vuiJPEGRepresentation];
    goto LABEL_6;
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4F22618];
  char v5 = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F22618]];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [*(id *)(a1 + 40) vuiPNGRepresentation];
LABEL_6:
  id v7 = (void *)v6;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4
{
  double width = a3.width;
  BOOL v5 = a3.width < 180.0;
  double result = 70.0;
  if (v5) {
    double result = 60.0;
  }
  if (a4 > 1.0) {
    return result + floor(fmax(width, a3.height) * (a4 + -1.0));
  }
  return result;
}

+ (CGPath)createPathForRadii:(_VUICornerRadii)a3 inRect:(CGRect)a4 isContinuous:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double radius = a3.bottomRight;
  double bottomLeft = a3.bottomLeft;
  double topRight = a3.topRight;
  double topLeft = a3.topLeft;
  double MinX = CGRectGetMinX(a4);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v25);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "radiusFromCornerRadii:", topLeft, topRight, bottomLeft, radius);
    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", MinX, MinY, MaxX - MinX, MaxY - MinY, v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    id v17 = (CGPath *)MEMORY[0x1E4E5FDD0]([v16 CGPath]);

    return v17;
  }
  else
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, topLeft + MinX, MinY);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, topRight + MinY, topRight);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MaxX - radius, MaxY, radius);
    CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MaxY - bottomLeft, bottomLeft);
    CGPathAddArcToPoint(Mutable, 0, MinX, MinY, topLeft + MinX, MinY, topLeft);
    return Mutable;
  }
}

+ (_VUICornerRadii)radiiFromRadius:(double)a3
{
  result.double bottomRight = a3;
  result.double bottomLeft = a3;
  result.double topRight = a3;
  result.double topLeft = a3;
  return result;
}

+ (id)URLForResource:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    uint64_t v6 = [a1 _URLForResource:v4 inBundle:v5];
    if (!v6)
    {
      id v7 = +[VUICoreUtilities VideosUICoreBundle];
      uint64_t v6 = [a1 _URLForResource:v4 inBundle:v7];

      if (!v6)
      {
        id v8 = +[VUICoreUtilities TVUIKitBundle];
        uint64_t v6 = [a1 _URLForResource:v4 inBundle:v8];

        if (!v6)
        {
          id v9 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v6 = [a1 _URLForResource:v4 inBundle:v9];
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)VideosUICoreBundle
{
  if (VideosUICoreBundle_onceToken != -1) {
    dispatch_once(&VideosUICoreBundle_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)VideosUICoreBundle_bundle;
  return v2;
}

uint64_t __38__VUICoreUtilities_VideosUICoreBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.VideosUICore"];
  uint64_t v1 = VideosUICoreBundle_bundle;
  VideosUICoreBundle_bundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)TVUIKitBundle
{
  if (TVUIKitBundle_onceToken != -1) {
    dispatch_once(&TVUIKitBundle_onceToken, &__block_literal_global_30);
  }
  uint64_t v2 = (void *)TVUIKitBundle_bundle;
  return v2;
}

uint64_t __33__VUICoreUtilities_TVUIKitBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.TVUIKit"];
  uint64_t v1 = TVUIKitBundle_bundle;
  TVUIKitBundle_bundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (unint64_t)vuiUserInterfaceStyleForInterfaceStyle:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (id)defaultPlaceholderImageForUserInterfaceStyle:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (defaultPlaceholderImageForUserInterfaceStyle____once != -1) {
      dispatch_once(&defaultPlaceholderImageForUserInterfaceStyle____once, &__block_literal_global_35);
    }
    id v3 = &defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  }
  else
  {
    if (defaultPlaceholderImageForUserInterfaceStyle____once_37 != -1) {
      dispatch_once(&defaultPlaceholderImageForUserInterfaceStyle____once_37, &__block_literal_global_39);
    }
    id v3 = &defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  }
  id v4 = (void *)*v3;
  return v4;
}

void __65__VUICoreUtilities_defaultPlaceholderImageForUserInterfaceStyle___block_invoke()
{
  v4.CGFloat width = 1.0;
  v4.CGFloat height = 1.0;
  UIGraphicsBeginImageContext(v4);
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.11372549 green:0.11372549 blue:0.11372549 alpha:1.0];
  [v0 setFill];

  v5.origin.CGFloat x = 0.0;
  v5.origin.CGFloat y = 0.0;
  v5.size.CGFloat width = 1.0;
  v5.size.CGFloat height = 1.0;
  UIRectFillUsingBlendMode(v5, kCGBlendModeCopy);
  uint64_t v1 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v2 = (void *)defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

void __65__VUICoreUtilities_defaultPlaceholderImageForUserInterfaceStyle___block_invoke_2()
{
  v4.CGFloat width = 1.0;
  v4.CGFloat height = 1.0;
  UIGraphicsBeginImageContext(v4);
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.921568627 green:0.921568627 blue:0.921568627 alpha:1.0];
  [v0 setFill];

  v5.origin.CGFloat x = 0.0;
  v5.origin.CGFloat y = 0.0;
  v5.size.CGFloat width = 1.0;
  v5.size.CGFloat height = 1.0;
  UIRectFillUsingBlendMode(v5, kCGBlendModeCopy);
  uint64_t v1 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v2 = (void *)defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

+ (CGRect)centerRect:(CGRect)result inRect:(CGRect)a4
{
  double v4 = round(a4.origin.x + (a4.size.width - result.size.width) * 0.5);
  double v5 = round(a4.origin.y + (a4.size.height - result.size.height) * 0.5);
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

+ (id)_vuiCoreResourceMap
{
  if (_vuiCoreResourceMap_onceToken != -1) {
    dispatch_once(&_vuiCoreResourceMap_onceToken, &__block_literal_global_97);
  }
  uint64_t v2 = (void *)_vuiCoreResourceMap_sDict;
  return v2;
}

uint64_t __39__VUICoreUtilities__vuiCoreResourceMap__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = (void *)_vuiCoreResourceMap_sDict;
  _vuiCoreResourceMap_sDict = (uint64_t)v0;

  [(id)_vuiCoreResourceMap_sDict setObject:@"button-cloud" forKeyedSubscript:@"button-cloud"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-play" forKeyedSubscript:@"button-play"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-preview" forKeyedSubscript:@"button-preview"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-add" forKeyedSubscript:@"button-add"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-remove" forKeyedSubscript:@"button-remove"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-add-alt" forKeyedSubscript:@"button-add-alt"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-artist" forKeyedSubscript:@"button-artist"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-curator" forKeyedSubscript:@"button-curator"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-follow" forKeyedSubscript:@"button-follow"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-checkmark" forKeyedSubscript:@"button-checkmark"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-more" forKeyedSubscript:@"button-more"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-rate" forKeyedSubscript:@"button-rate"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-rated" forKeyedSubscript:@"button-rated"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-radio" forKeyedSubscript:@"button-radio"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-shuffle" forKeyedSubscript:@"button-shuffle"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"icon_dropdown" forKeyedSubscript:@"button-dropdown"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"button-open" forKeyedSubscript:@"button-open"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_logo_white" forKeyedSubscript:@"common-sense-logo-white"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_logo_black" forKeyedSubscript:@"common-sense-logo-black"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_badge_white_l" forKeyedSubscript:@"common-sense-badge-white-l"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_badge_white_m" forKeyedSubscript:@"common-sense-badge-white-m"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_badge_white_s" forKeyedSubscript:@"common-sense-badge-white-s"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_badge_black_s" forKeyedSubscript:@"common-sense-badge-black-s"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_badge_black_m" forKeyedSubscript:@"common-sense-badge-black-m"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cs_badge_black_l" forKeyedSubscript:@"common-sense-badge-black-l"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"icon_chevron" forKeyedSubscript:@"chevron"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"list-chevron" forKeyedSubscript:@"list-chevron"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"game_center" forKeyedSubscript:@"game_center"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"game_controller" forKeyedSubscript:@"game_controller"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"bluetooth_accessory_mask" forKeyedSubscript:@"bluetooth_accessory"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"watched-checkmark" forKeyedSubscript:@"overlay-checkmark"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"icon_radio_small_mask" forKeyedSubscript:@"radio-s"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"icon_cloud_mask" forKeyedSubscript:@"cloud-s"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"extras_lockup_badge" forKeyedSubscript:@"extras-lockup-badge"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"extras_preview_stamp" forKeyedSubscript:@"extras-preview-stamp"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"extras_lockup_badge_zh" forKeyedSubscript:@"extras-lockup-badge_zh"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"extras_preview_stamp_zh" forKeyedSubscript:@"extras-preview-stamp_zh"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ghost_episode_light" forKeyedSubscript:@"episode-placeholder-light"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ghost_episode_dark" forKeyedSubscript:@"episode-placeholder-dark"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"content-gradient-brick" forKeyedSubscript:@"content-gradient-brick"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"content-gradient-flowcase" forKeyedSubscript:@"content-gradient-flowcase"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"content-gradient-genre-brick" forKeyedSubscript:@"content-gradient-genre-brick"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"content-gradient-genre-brick-4" forKeyedSubscript:@"content-gradient-genre-brick-4"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"content-gradient-list-keyframe" forKeyedSubscript:@"content-gradient-list-keyframe"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cc_mask" forKeyedSubscript:@"cc"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"hd_mask" forKeyedSubscript:@"hd"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"RTRotten" forKeyedSubscript:@"tomato-splat"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"RTFresh" forKeyedSubscript:@"tomato-fresh"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"RTCertified" forKeyedSubscript:@"tomato-certified"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"RTLargeRotten" forKeyedSubscript:@"tomato-splat-m"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"RTLargeFresh" forKeyedSubscript:@"tomato-fresh-m"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"RTLargeCertified" forKeyedSubscript:@"tomato-certified-m"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"confirmation-checkmark" forKeyedSubscript:@"confirmation-checkmark"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"cloud-download-icon" forKeyedSubscript:@"cloud-download-icon"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"download-checkmark" forKeyedSubscript:@"download-checkmark"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"popover-add" forKeyedSubscript:@"popover-add"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"popover-chevron-up" forKeyedSubscript:@"popover-chevron-up"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"popover-chevron-down" forKeyedSubscript:@"popover-chevron-down"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"popover-share" forKeyedSubscript:@"popover-share"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"popover-more" forKeyedSubscript:@"popover-more"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-Add" forKeyedSubscript:@"ActionMenu-Add"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-circleMask" forKeyedSubscript:@"ActionMenu-circleMask"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-ClearHistory" forKeyedSubscript:@"ActionMenu-ClearHistory"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-ClearPlayHistory" forKeyedSubscript:@"ActionMenu-ClearPlayHistory"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-Mark" forKeyedSubscript:@"ActionMenu-Mark"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-MarkAll" forKeyedSubscript:@"ActionMenu-MarkAll"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-Play" forKeyedSubscript:@"ActionMenu-Play"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-Remove" forKeyedSubscript:@"ActionMenu-Remove"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-RemoveFromUpNext" forKeyedSubscript:@"ActionMenu-RemoveFromUpNext"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"ActionMenu-Share" forKeyedSubscript:@"ActionMenu-Share"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"Actions_CheckGlyph" forKeyedSubscript:@"Actions-Check"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"Actions_AddGlyph" forKeyedSubscript:@"Actions-Add"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"itunes-extras-badge" forKeyedSubscript:@"extras-badge"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"guided-tour-play" forKeyedSubscript:@"guided-tour-play"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"OnboardingPlayLarge" forKeyedSubscript:@"onboarding-play-large"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"OnboardingPlaySmall" forKeyedSubscript:@"onboarding-play-small"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"onboarding-hero" forKeyedSubscript:@"onboarding-hero"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"onboarding-appicon" forKeyedSubscript:@"onboarding-appicon"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"library-dropdown" forKeyedSubscript:@"library-dropdown"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"metadata-ad" forKeyedSubscript:@"metadata-ad"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"metadata-sdh" forKeyedSubscript:@"metadata-sdh"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"hdr_mask" forKeyedSubscript:@"hdr"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"hdr10+_mask" forKeyedSubscript:@"hdr10+"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"4k_mask" forKeyedSubscript:@"4k"];
  [(id)_vuiCoreResourceMap_sDict setObject:@"dolbyvision_mask" forKeyedSubscript:@"dolby-vision"];
  uint64_t v2 = (void *)_vuiCoreResourceMap_sDict;
  return [v2 setObject:@"dolbyatmos_mask" forKeyedSubscript:@"dolby-atmos"];
}

+ (id)_getImageFromURLorBundle:(id)a3
{
  id v4 = a3;
  double v5 = +[VUICoreUtilities _vuiCoreResourceMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  id v10 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v11 = +[VUICoreUtilities VideosUIBundle];
  uint64_t v12 = [v10 vuiImageNamed:v9 inBundle:v11];

  if (!v12)
  {
    id v13 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v14 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v12 = [v13 vuiImageNamed:v4 inBundle:v14];
  }
  double v15 = [a1 URLForResource:v4];
  id v16 = v15;
  if (v15 && [v15 isFileURL])
  {
    id v17 = (void *)MEMORY[0x1E4F42A80];
    id v18 = [v16 path];
    uint64_t v19 = [v17 imageWithContentsOfFile:v18];

    uint64_t v12 = (void *)v19;
  }
  if (!v12)
  {
    float v20 = VUICDefaultLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[VUICoreUtilities _getImageFromURLorBundle:]((uint64_t)v4, v20);
    }
  }
  return v12;
}

+ (id)_URLForResource:(id)a3 inBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 pathForResource:v5 ofType:@"png"];
  if (!v7)
  {
    id v7 = [v6 pathForResource:v5 ofType:@"jpeg"];
  }
  if ([v7 length])
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)runningUiTest
{
  if (runningUiTest_onceToken != -1) {
    dispatch_once(&runningUiTest_onceToken, &__block_literal_global_477);
  }
  return runningUiTest_isRunningUiTest;
}

void __33__VUICoreUtilities_runningUiTest__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [v0 arguments];
  runningUiTest_isRunningUiTest = [v1 containsObject:@"-RunningUITest"];

  if (runningUiTest_isRunningUiTest)
  {
    uint64_t v2 = VUICImageLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1E29E1000, v2, OS_LOG_TYPE_DEFAULT, "TV app is running via a UITest", v3, 2u);
    }
  }
}

+ (id)randomColor
{
  double v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v4 = (double)arc4random_uniform(0xFFu) / 255.0;
  id v5 = (void *)MEMORY[0x1E4F428B8];
  return (id)[v5 colorWithRed:v2 green:v3 blue:v4 alpha:0.400000006];
}

+ (void)vuiColor:(id)a3 getRed:(double *)a4 green:(double *)a5 blue:(double *)a6 alpha:(double *)a7
{
}

+ (void)_getImageFromURLorBundle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E29E1000, a2, OS_LOG_TYPE_ERROR, "resource not found: %@", (uint8_t *)&v2, 0xCu);
}

@end