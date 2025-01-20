@interface TVMLUtilities
+ (BOOL)_cornerRadiiFromElement:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5;
+ (BOOL)_cornerRadiiFromImageLayout:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5;
+ (BOOL)_cornerRadiiFromImgTreatmentValue:(id)a3 width:(double)a4 cornerRadii:(TVCornerRadii *)a5 circle:(BOOL *)a6;
+ (BOOL)_cornerRadiiWithBorderRadius:(id)a3 cornerRadii:(TVCornerRadii *)a4 imageWidth:(double)a5 imageTreatmentValue:(id)a6 circle:(BOOL *)a7;
+ (BOOL)canHandleDecodingOnRenderThread;
+ (BOOL)cornerRadiiFromElement:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5;
+ (BOOL)isAXLargeEnabled:(id)a3;
+ (BOOL)isAXSmallEnabled:(id)a3;
+ (BOOL)isFlowcaseAtTopOfStackFromElement:(id)a3;
+ (BOOL)mainBundleSupportsSFSymbols;
+ (CGPath)shadowPathWithCornerRadii:(TVCornerRadii)a3 andScaledSize:(CGSize)a4;
+ (CGRect)centerRect:(CGRect)result inRect:(CGRect)a4;
+ (double)_headerFadeForShowcaseFactor:(double)a3;
+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4;
+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4 useInSearchPartial:(BOOL)a5;
+ (double)uiFontWeightFromCSSFontWeight:(id)a3;
+ (id)TVKitBundle;
+ (id)TVMLKitBundle;
+ (id)TVUIKitBundle;
+ (id)_bgImageElementForProductTemplate:(id)a3;
+ (id)_defaultPlaceholderImageForUserInterfaceStyle:(int64_t)a3;
+ (id)_defaultPlaceholderImageForUserInterfaceStyle:(int64_t)a3 withCornerRadii:(TVCornerRadii)a4 andSize:(CGSize)a5;
+ (id)_mobileGestaltStringForKey:(__CFString *)a3;
+ (id)_placeholderImageForValue:(id)a3 userInterfaceStyle:(int64_t)a4;
+ (id)_placeholderImageForValue:(id)a3 userInterfaceStyle:(int64_t)a4 withCornerRadii:(TVCornerRadii)a5 andScaledSize:(CGSize)a6;
+ (id)_placeholderImageForViewElement:(id)a3;
+ (id)_placeholderImageForViewElement:(id)a3 imageLayout:(id)a4;
+ (id)_placeholderImageForViewElement:(id)a3 withCornerRadii:(TVCornerRadii)a4 andScaledSize:(CGSize)a5;
+ (id)_placeholderImageForViewElement:(id)a3 withImageLayout:(id)a4 cornerRadii:(TVCornerRadii)a5 andScaledSize:(CGSize)a6;
+ (id)fontFromStyle:(id)a3;
+ (id)fontFromTextStyle:(id)a3 fontWeight:(id)a4 fontSize:(double)a5 symbolicTraits:(unsigned int)a6;
+ (id)imageWithRadialGradientOverlayFromImage:(id)a3;
+ (id)indexPathForFirstItemAttributeValue:(id)a3;
+ (id)placeholderImageForViewElement:(id)a3;
+ (id)placeholderImageForViewElement:(id)a3 withCornerRadii:(TVCornerRadii)a4 andScaledSize:(CGSize)a5;
+ (id)randomColor;
+ (id)rowSpacingMetricsForRowMetrics:(id)a3;
+ (id)rowSpacingMetricsForRowMetrics:(id)a3 forShowcase:(BOOL)a4;
+ (int64_t)_interfaceStyleForElement:(id)a3;
+ (int64_t)_overrideInterfaceStyleForElement:(id)a3;
+ (int64_t)contentModeForPosition:(int64_t)a3 defaultMode:(int64_t)a4;
+ (int64_t)semanticAlignmentForAlignment:(int64_t)a3 semanticContentAttribute:(int64_t)a4;
+ (int64_t)semanticContentAttributeForTemplateElement:(id)a3;
+ (int64_t)semanticPositionForPosition:(int64_t)a3 semanticContentAttribute:(int64_t)a4;
+ (void)disassociateIKViewElementsRecursivelyFromView:(id)a3;
+ (void)getValuesFromTransform:(CGAffineTransform *)a3 translation:(CGPoint *)a4 rotation:(CGPoint *)a5;
@end

@implementation TVMLUtilities

+ (id)TVMLKitBundle
{
  if (TVMLKitBundle_onceToken != -1) {
    dispatch_once(&TVMLKitBundle_onceToken, &__block_literal_global);
  }
  v2 = (void *)TVMLKitBundle_bundle;
  return v2;
}

uint64_t __30__TVMLUtilities_TVMLKitBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.TVMLKit"];
  uint64_t v1 = TVMLKitBundle_bundle;
  TVMLKitBundle_bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)TVUIKitBundle
{
  if (TVUIKitBundle_onceToken != -1) {
    dispatch_once(&TVUIKitBundle_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)TVUIKitBundle_bundle;
  return v2;
}

uint64_t __30__TVMLUtilities_TVUIKitBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.TVUIKit"];
  uint64_t v1 = TVUIKitBundle_bundle;
  TVUIKitBundle_bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)TVKitBundle
{
  if (TVKitBundle_onceToken != -1) {
    dispatch_once(&TVKitBundle_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)TVKitBundle_bundle;
  return v2;
}

uint64_t __28__TVMLUtilities_TVKitBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.TVKit"];
  uint64_t v1 = TVKitBundle_bundle;
  TVKitBundle_bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (BOOL)mainBundleSupportsSFSymbols
{
  if (mainBundleSupportsSFSymbols_onceToken != -1) {
    dispatch_once(&mainBundleSupportsSFSymbols_onceToken, &__block_literal_global_31);
  }
  return mainBundleSupportsSFSymbols_supportsSFSymbols;
}

void __44__TVMLUtilities_mainBundleSupportsSFSymbols__block_invoke()
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v2 infoDictionary];
  uint64_t v1 = [v0 objectForKey:@"TVSupportsSFSymbols"];
  mainBundleSupportsSFSymbols_supportsSFSymbols = [v1 BOOLValue];
}

+ (double)uiFontWeightFromCSSFontWeight:(id)a3
{
  id v3 = a3;
  if (uiFontWeightFromCSSFontWeight__onceToken != -1) {
    dispatch_once(&uiFontWeightFromCSSFontWeight__onceToken, &__block_literal_global_33);
  }
  if ([v3 length]
    && (v4 = (void *)uiFontWeightFromCSSFontWeight__sFontWeightMap,
        [v3 lowercaseString],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:v5],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = *MEMORY[0x263F1D338];
  }

  return v8;
}

void __47__TVMLUtilities_uiFontWeightFromCSSFontWeight___block_invoke()
{
  v12[9] = *MEMORY[0x263EF8340];
  v11[0] = @"ultralight";
  uint64_t v0 = [NSNumber numberWithDouble:*MEMORY[0x263F1D358]];
  v12[0] = v0;
  v11[1] = @"thin";
  uint64_t v1 = [NSNumber numberWithDouble:*MEMORY[0x263F1D348]];
  v12[1] = v1;
  v11[2] = @"light";
  id v2 = [NSNumber numberWithDouble:*MEMORY[0x263F1D328]];
  v12[2] = v2;
  v11[3] = @"regular";
  id v3 = [NSNumber numberWithDouble:*MEMORY[0x263F1D338]];
  v12[3] = v3;
  v11[4] = @"medium";
  v4 = [NSNumber numberWithDouble:*MEMORY[0x263F1D330]];
  v12[4] = v4;
  v11[5] = @"semibold";
  v5 = [NSNumber numberWithDouble:*MEMORY[0x263F1D340]];
  v12[5] = v5;
  v11[6] = @"bold";
  v6 = [NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
  v12[6] = v6;
  v11[7] = @"heavy";
  float v7 = [NSNumber numberWithDouble:*MEMORY[0x263F1D320]];
  v12[7] = v7;
  v11[8] = @"black";
  double v8 = [NSNumber numberWithDouble:*MEMORY[0x263F1D310]];
  v12[8] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:9];
  v10 = (void *)uiFontWeightFromCSSFontWeight__sFontWeightMap;
  uiFontWeightFromCSSFontWeight__sFontWeightMap = v9;
}

+ (id)fontFromStyle:(id)a3
{
  v45[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "tv_textStyle");
  v6 = objc_msgSend(v4, "tv_fontWeight");
  objc_msgSend(v4, "tv_fontSize");
  double v8 = v7;
  uint64_t v9 = objc_msgSend(v4, "tv_fontStretch");
  v10 = [(id)objc_opt_class() fontFromTextStyle:v5 fontWeight:v6 fontSize:v9 symbolicTraits:v8];
  if (v10) {
    goto LABEL_20;
  }
  v11 = objc_msgSend(v4, "tv_fontFamily");
  [a1 uiFontWeightFromCSSFontWeight:v6];
  double v13 = v12;
  unint64_t v14 = 0x263F1C000uLL;
  if (v8 <= 0.0)
  {
    [MEMORY[0x263F1C658] systemFontSize];
    double v8 = v15;
  }
  if ([v11 length])
  {
    if (![v6 length] || v13 == *MEMORY[0x263F1D338])
    {
      v20 = [MEMORY[0x263F1C660] fontDescriptorWithName:v11 size:v8];
      if (v20) {
        goto LABEL_11;
      }
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x263F1C660]);
      v44[0] = *MEMORY[0x263F1D210];
      uint64_t v42 = *MEMORY[0x263F1D350];
      v17 = [NSNumber numberWithDouble:v13];
      v43 = v17;
      v18 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v44[1] = *MEMORY[0x263F1D1E0];
      v45[0] = v18;
      v45[1] = v11;
      v19 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      v20 = (void *)[v16 initWithFontAttributes:v19];

      unint64_t v14 = 0x263F1C000;
      if (v20) {
        goto LABEL_11;
      }
    }
  }
  v21 = [*(id *)(v14 + 1624) systemFontOfSize:v8 weight:v13];
  v20 = [v21 fontDescriptor];

LABEL_11:
  v22 = [v4 valueForStyle:@"itml-text-caps"];
  v23 = v22;
  if (v22 && [v22 isEqualToString:@"small"])
  {
    v33 = [0 fontDescriptor];
    uint64_t v40 = *MEMORY[0x263F1D1E8];
    uint64_t v25 = *MEMORY[0x263F1D218];
    v37[0] = *MEMORY[0x263F1D220];
    uint64_t v24 = v37[0];
    v37[1] = v25;
    v38[0] = &unk_26E59E158;
    v38[1] = &unk_26E59E170;
    v32 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    v39[0] = v32;
    v35[0] = v24;
    v35[1] = v25;
    v36[0] = &unk_26E59E188;
    v36[1] = &unk_26E59E170;
    [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    v26 = v34 = v11;
    v39[1] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    v41 = v27;
    v28 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v31 = [v33 fontDescriptorByAddingAttributes:v28];

    unint64_t v14 = 0x263F1C000uLL;
    v11 = v34;

    v20 = (void *)v31;
  }
  if (v9)
  {
    uint64_t v29 = objc_msgSend(v20, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v20, "symbolicTraits") | v9);

    v20 = (void *)v29;
  }
  if (v20)
  {
    v10 = [*(id *)(v14 + 1624) fontWithDescriptor:v20 size:v8];
  }
  else
  {
    v10 = 0;
  }

LABEL_20:
  return v10;
}

+ (id)fontFromTextStyle:(id)a3 fontWeight:(id)a4 fontSize:(double)a5 symbolicTraits:(unsigned int)a6
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "tv_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", a3, a4, *(void *)&a6, a5);
}

+ (id)randomColor
{
  double v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v4 = (double)arc4random_uniform(0xFFu) / 255.0;
  v5 = (void *)MEMORY[0x263F1C550];
  return (id)[v5 colorWithRed:v2 green:v3 blue:v4 alpha:0.4];
}

+ (BOOL)_cornerRadiiFromImgTreatmentValue:(id)a3 width:(double)a4 cornerRadii:(TVCornerRadii *)a5 circle:(BOOL *)a6
{
  id v9 = a3;
  if (![v9 length]) {
    goto LABEL_16;
  }
  double v10 = 4.0;
  if ([v9 isEqualToString:@"small"]) {
    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"corner-small"]) {
    goto LABEL_13;
  }
  double v10 = 8.0;
  if ([v9 isEqualToString:@"medium"]) {
    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"corner-medium"]) {
    goto LABEL_13;
  }
  double v10 = 12.0;
  if (([v9 isEqualToString:@"large"] & 1) != 0
    || ([v9 isEqualToString:@"corner-large"] & 1) != 0)
  {
    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"circle"])
  {
    double v10 = fabs(a4 * 0.5);
    if (a6) {
      *a6 = 1;
    }
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_16:
    BOOL v16 = 0;
    goto LABEL_17;
  }
  [v9 floatValue];
  double v10 = v11;
LABEL_13:
  if (a5)
  {
    +[TVCornerUtilities radiiFromRadius:v10];
    a5->topLeft = v12;
    a5->topRight = v13;
    a5->bottomLeft = v14;
    a5->bottomRight = v15;
  }
  BOOL v16 = 1;
LABEL_17:

  return v16;
}

+ (BOOL)cornerRadiiFromElement:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5
{
  double v8 = [a3 element];
  LOBYTE(a5) = [a1 _cornerRadiiFromElement:v8 cornerRadii:a4 circle:a5];

  return (char)a5;
}

+ (BOOL)_cornerRadiiFromImageLayout:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5
{
  id v8 = a3;
  id v9 = [v8 ikBorderRadius];
  [v8 decoratorSize];
  double v11 = v10;
  double v12 = [v8 imageTreatment];

  LOBYTE(a5) = [a1 _cornerRadiiWithBorderRadius:v9 cornerRadii:a4 imageWidth:v12 imageTreatmentValue:a5 circle:v11];
  return (char)a5;
}

+ (BOOL)_cornerRadiiFromElement:(id)a3 cornerRadii:(TVCornerRadii *)a4 circle:(BOOL *)a5
{
  id v8 = a3;
  id v9 = [v8 style];
  double v10 = objc_msgSend(v9, "tv_borderRadius");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v8, "tv_imageScaleToSize");
    double v12 = v11;
  }
  else
  {
    double v13 = [v8 style];
    objc_msgSend(v13, "tv_width");
    double v12 = v14;
  }
  double v15 = [v8 style];
  BOOL v16 = objc_msgSend(v15, "tv_imageTreatment");

  char v17 = [a1 _cornerRadiiWithBorderRadius:v10 cornerRadii:a4 imageWidth:v16 imageTreatmentValue:a5 circle:v12];
  return v17;
}

+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = objc_opt_class();
  objc_msgSend(v7, "focusedSizeIncreaseForSize:upscaleFactor:useInSearchPartial:", 0, width, height, a4);
  return result;
}

+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4 useInSearchPartial:(BOOL)a5
{
  BOOL v5 = a3.width < 180.0 || a5;
  double v6 = 70.0;
  if (v5) {
    double v6 = 60.0;
  }
  double result = v6 + floor(fmax(a3.width, a3.height) * (a4 + -1.0));
  if (a4 <= 1.0) {
    return v6;
  }
  return result;
}

+ (CGRect)centerRect:(CGRect)result inRect:(CGRect)a4
{
  double v4 = round(a4.origin.x + (a4.size.width - result.size.width) * 0.5);
  double v5 = round(a4.origin.y + (a4.size.height - result.size.height) * 0.5);
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (void)getValuesFromTransform:(CGAffineTransform *)a3 translation:(CGPoint *)a4 rotation:(CGPoint *)a5
{
  if (a4) {
    *a4 = *(CGPoint *)&a3->tx;
  }
  if (a5)
  {
    long double v6 = atan2(a3->b, a3->d);
    a5->x = v6;
    a5->y = v6;
  }
}

+ (id)indexPathForFirstItemAttributeValue:(id)a3
{
  if (a3)
  {
    double v3 = [a3 componentsSeparatedByString:@","];
    uint64_t v4 = [v3 count];
    double v5 = (void *)v4;
    if (v4)
    {
      long double v6 = malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
      if (v6)
      {
        double v7 = v6;
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __53__TVMLUtilities_indexPathForFirstItemAttributeValue___block_invoke;
        v9[3] = &__block_descriptor_40_e25_v32__0__NSString_8Q16_B24l;
        v9[4] = v6;
        [v3 enumerateObjectsUsingBlock:v9];
        double v5 = [MEMORY[0x263F088C8] indexPathWithIndexes:v7 length:v5];
        free(v7);
      }
      else
      {
        double v5 = 0;
      }
    }
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

uint64_t __53__TVMLUtilities_indexPathForFirstItemAttributeValue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 integerValue];
  *(void *)(*(void *)(a1 + 32) + 8 * a3) = result;
  return result;
}

+ (id)rowSpacingMetricsForRowMetrics:(id)a3
{
  return (id)[a1 rowSpacingMetricsForRowMetrics:a3 forShowcase:0];
}

+ (id)rowSpacingMetricsForRowMetrics:(id)a3 forShowcase:(BOOL)a4
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    long double v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count") - 1);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x7010000000;
    v23[3] = &unk_230C43B61;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x7010000000;
    v17[3] = &unk_230C43B61;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    double v11 = __60__TVMLUtilities_rowSpacingMetricsForRowMetrics_forShowcase___block_invoke;
    double v12 = &unk_264BA6478;
    double v15 = v23;
    BOOL v16 = v17;
    id v13 = v4;
    id v7 = v6;
    id v14 = v7;
    [v13 enumerateObjectsUsingBlock:&v9];
    double v5 = objc_msgSend(v7, "copy", v9, v10, v11, v12);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v23, 8);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

__n128 __60__TVMLUtilities_rowSpacingMetricsForRowMetrics_forShowcase___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = *(_OWORD **)(*(void *)(a1 + 48) + 8);
  long double v6 = *(_OWORD **)(*(void *)(a1 + 56) + 8);
  long long v7 = v6[6];
  long long v9 = v6[3];
  long long v8 = v6[4];
  v5[5] = v6[5];
  v5[6] = v7;
  v5[3] = v9;
  v5[4] = v8;
  v5[2] = v6[2];
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  objc_msgSend(v10, "tv_rowMetricsValue");
  double v11 = *(_OWORD **)(*(void *)(a1 + 56) + 8);
  long long v13 = v36;
  long long v12 = v37;
  v11[4] = v35;
  v11[5] = v13;
  v11[6] = v12;
  long long v14 = v34;
  v11[2] = v33;
  v11[3] = v14;

  if (a3)
  {
    BOOL v16 = *(double **)(*(void *)(a1 + 56) + 8);
    if (v16[5] == 0.0)
    {
      char v17 = *(void **)(a1 + 40);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
      long long v18 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v28);
      [v17 addObject:v18];
    }
    else
    {
      long long v19 = *(void **)(a1 + 40);
      long long v20 = *(double **)(*(void *)(a1 + 48) + 8);
      double v21 = fmax(fmax(46.0 - (v20[7] + v16[6]), 0.0), fmax(v20[13] + 30.0 - (v20[9] + v16[10]), v16[12] + 30.0 - (v20[11] + v16[8])));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      *(void *)&long long v28 = 1;
      *((double *)&v28 + 1) = v21;
      long long v22 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v28);
      [v19 addObject:v22];

      uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      long long v25 = *(_OWORD *)(v24 + 96);
      long long v27 = *(_OWORD *)(v24 + 48);
      long long v26 = *(_OWORD *)(v24 + 64);
      *(_OWORD *)(v23 + 80) = *(_OWORD *)(v24 + 80);
      *(_OWORD *)(v23 + 96) = v25;
      *(_OWORD *)(v23 + 48) = v27;
      *(_OWORD *)(v23 + 64) = v26;
      __n128 result = *(__n128 *)(v24 + 32);
      *(__n128 *)(v23 + 32) = result;
    }
  }
  return result;
}

+ (id)imageWithRadialGradientOverlayFromImage:(id)a3
{
  double v3 = (void *)MEMORY[0x263F1C920];
  id v4 = a3;
  double v5 = [v3 mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  [v4 size];
  double v11 = v10;
  double v13 = v12;
  long long v14 = (void *)MEMORY[0x263F1C6B0];
  double v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v16 = [v14 imageNamed:@"TVCKBackgroundShelfGradient" inBundle:v15];

  double v17 = v7 / v11;
  if (v7 / v11 < v9 / v13) {
    double v17 = v9 / v13;
  }
  CGAffineTransformMakeScale(&v28, v17, v17);
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.double width = v11;
  v31.size.double height = v13;
  CGRect v32 = CGRectApplyAffineTransform(v31, &v28);
  double width = v32.size.width;
  double height = v32.size.height;
  long long v20 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", v32.origin.x, v32.origin.y);
  [v20 scale];
  CGFloat v22 = v21;
  v30.double width = v7;
  v30.double height = v9;
  UIGraphicsBeginImageContextWithOptions(v30, 0, v22);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double v24 = round((v7 - width) * 0.5 + *MEMORY[0x263F00148]);
  double v25 = round((v9 - height) * 0.5 + *(double *)(MEMORY[0x263F00148] + 8));
  objc_msgSend(v4, "drawInRect:blendMode:alpha:", 17, v24, v25, width, height, 1.0);

  objc_msgSend(v16, "drawInRect:blendMode:alpha:", 0, v24, v25, width, height, 1.0);
  CGContextRestoreGState(CurrentContext);
  long long v26 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v26;
}

+ (id)placeholderImageForViewElement:(id)a3
{
  id v4 = [a3 element];
  double v5 = [a1 _placeholderImageForViewElement:v4];

  return v5;
}

+ (id)placeholderImageForViewElement:(id)a3 withCornerRadii:(TVCornerRadii)a4 andScaledSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double bottomRight = a4.bottomRight;
  double bottomLeft = a4.bottomLeft;
  double topRight = a4.topRight;
  double topLeft = a4.topLeft;
  double v12 = [a3 element];
  double v13 = objc_msgSend(a1, "_placeholderImageForViewElement:withCornerRadii:andScaledSize:", v12, topLeft, topRight, bottomLeft, bottomRight, width, height);

  return v13;
}

+ (CGPath)shadowPathWithCornerRadii:(TVCornerRadii)a3 andScaledSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double bottomRight = a3.bottomRight;
  double bottomLeft = a3.bottomLeft;
  double topRight = a3.topRight;
  double topLeft = a3.topLeft;
  double v10 = [NSString stringWithFormat:@"{%.1lf, %.1lf}[%.1f %.1f %.1f %.1f]", *(void *)&a4.width, *(void *)&a4.height, *(void *)&a3.topLeft, *(void *)&a3.topRight, *(void *)&a3.bottomRight, *(void *)&a3.bottomLeft];
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
    double v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    if (!shadowPathWithCornerRadii_andScaledSize__pathsByShape)
    {
      uint64_t v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
      double v15 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
      shadowPathWithCornerRadii_andScaledSize__pathsByShape = v14;

      double v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    }
    [v13 setObject:Mutable forKeyedSubscript:v10];
  }
  return (CGPath *)Mutable;
}

+ (int64_t)semanticContentAttributeForTemplateElement:(id)a3
{
  double v3 = [a3 attributes];
  id v4 = [v3 objectForKey:@"layoutDirection"];
  double v5 = [v4 lowercaseString];

  if ([v5 length])
  {
    if ([v5 isEqualToString:@"ltr"])
    {
      int64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"rtl"])
    {
      int64_t v6 = 4;
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)_interfaceStyleForElement:(id)a3
{
  id v4 = a3;
  double v5 = [v4 appDocument];
  int64_t v6 = [v5 appContext];
  double v7 = [v6 app];
  if ([v7 conformsToProtocol:&unk_26E5B3CE8])
  {
    double v8 = [v4 appDocument];
    double v9 = [v8 appContext];
    double v10 = [v9 app];
    double v11 = [v10 keyTraitEnvironment];
  }
  else
  {
    double v11 = 0;
  }

  double v12 = [v11 traitCollection];
  if (v12)
  {
    double v13 = [v11 traitCollection];
    uint64_t v14 = [v13 userInterfaceStyle];
  }
  else
  {
    uint64_t v14 = 0;
  }

  uint64_t v15 = [a1 _overrideInterfaceStyleForElement:v4];
  if (v15) {
    int64_t v16 = v15;
  }
  else {
    int64_t v16 = v14;
  }
  if (!v16)
  {
    double v17 = [MEMORY[0x263F1C920] mainScreen];
    long long v18 = [v17 traitCollection];
    int64_t v16 = [v18 userInterfaceStyle];
  }
  return v16;
}

+ (int64_t)_overrideInterfaceStyleForElement:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
LABEL_11:
    int64_t v13 = 0;
    goto LABEL_18;
  }
  double v5 = v3;
  while (1)
  {
    uint64_t v6 = [v5 elementType];
    double v7 = [v5 parent];
    double v8 = v7;
    if (v6 == 35)
    {
      double v9 = [v7 attributes];
      double v10 = [v9 objectForKeyedSubscript:@"theme"];
      double v11 = [v10 lowercaseString];
    }
    else
    {

      if (v8)
      {
        double v11 = 0;
        goto LABEL_9;
      }
      double v8 = [v5 attributes];
      double v9 = [v8 objectForKeyedSubscript:@"theme"];
      double v11 = [v9 lowercaseString];
    }

LABEL_9:
    if ([v11 length]) {
      break;
    }
    uint64_t v12 = [v5 parent];

    double v5 = (void *)v12;
    if (!v12) {
      goto LABEL_11;
    }
  }
  if ([v11 isEqualToString:@"light"])
  {
    int64_t v13 = 1;
  }
  else if ([v11 isEqualToString:@"dark"])
  {
    int64_t v13 = 2;
  }
  else
  {
    int64_t v13 = 0;
  }

LABEL_18:
  return v13;
}

+ (id)_bgImageElementForProductTemplate:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v3 = [a3 unfilteredChildren];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (!v4) {
    goto LABEL_48;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v43;
  uint64_t v27 = *(void *)v43;
  CGAffineTransform v28 = v3;
  do
  {
    uint64_t v7 = 0;
    uint64_t v29 = v5;
    do
    {
      if (*(void *)v43 != v6) {
        objc_enumerationMutation(v3);
      }
      double v8 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
      if (objc_msgSend(v8, "tv_elementType") == 4)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        double v9 = [v8 unfilteredChildren];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (!v10) {
          goto LABEL_42;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v39;
LABEL_9:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
          if (objc_msgSend(v14, "tv_elementType") == 16
            && (!objc_msgSend(v14, "tv_imageType") || objc_msgSend(v14, "tv_imageType") == 3))
          {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
            if (v11) {
              goto LABEL_9;
            }
            goto LABEL_42;
          }
        }
LABEL_44:
        id v25 = v14;
      }
      else
      {
        if (objc_msgSend(v8, "tv_elementType") != 12) {
          goto LABEL_46;
        }
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        double v9 = [v8 unfilteredChildren];
        uint64_t v15 = [v9 countByEnumeratingWithState:&v34 objects:v47 count:16];
        if (!v15)
        {
LABEL_42:
          id v25 = 0;
          goto LABEL_45;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v14, "tv_elementType") == 16 && objc_msgSend(v14, "tv_imageType") == 3)
            {
              uint64_t v6 = v27;
              id v3 = v28;
              uint64_t v5 = v29;
              goto LABEL_44;
            }
            if (objc_msgSend(v14, "tv_elementType") == 24)
            {
              long long v32 = 0u;
              long long v33 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v19 = [v14 unfilteredChildren];
              uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v46 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v31;
LABEL_29:
                uint64_t v23 = 0;
                while (1)
                {
                  if (*(void *)v31 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  double v24 = *(void **)(*((void *)&v30 + 1) + 8 * v23);
                  if (objc_msgSend(v24, "tv_elementType") == 16 && objc_msgSend(v24, "tv_imageType") == 3) {
                    break;
                  }
                  if (v21 == ++v23)
                  {
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v46 count:16];
                    if (v21) {
                      goto LABEL_29;
                    }
                    goto LABEL_36;
                  }
                }
                id v25 = v24;

                if (v25) {
                  goto LABEL_41;
                }
              }
              else
              {
LABEL_36:
              }
            }
          }
          uint64_t v16 = [v9 countByEnumeratingWithState:&v34 objects:v47 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        id v25 = 0;
LABEL_41:
        uint64_t v6 = v27;
        id v3 = v28;
        uint64_t v5 = v29;
      }
LABEL_45:

      if (v25) {
        goto LABEL_49;
      }
LABEL_46:
      ++v7;
    }
    while (v7 != v5);
    uint64_t v5 = [v3 countByEnumeratingWithState:&v42 objects:v49 count:16];
  }
  while (v5);
LABEL_48:
  id v25 = 0;
LABEL_49:

  return v25;
}

+ (int64_t)semanticAlignmentForAlignment:(int64_t)a3 semanticContentAttribute:(int64_t)a4
{
  uint64_t v5 = [MEMORY[0x263F1CB60] userInterfaceLayoutDirectionForSemanticContentAttribute:a4];
  if (a3 == 5)
  {
    if (v5 == 1) {
      return 1;
    }
    else {
      return 3;
    }
  }
  else if (a3 == 4)
  {
    if (v5 == 1) {
      return 3;
    }
    else {
      return 1;
    }
  }
  return a3;
}

+ (int64_t)semanticPositionForPosition:(int64_t)a3 semanticContentAttribute:(int64_t)a4
{
  uint64_t v5 = [MEMORY[0x263F1CB60] userInterfaceLayoutDirectionForSemanticContentAttribute:a4];
  switch(a3)
  {
    case 12:
      BOOL v6 = v5 == 1;
      int64_t v7 = 4;
      goto LABEL_7;
    case 13:
      BOOL v8 = v5 == 1;
      int64_t v9 = 4;
      goto LABEL_11;
    case 14:
      BOOL v6 = v5 == 1;
      int64_t v7 = 6;
      goto LABEL_7;
    case 15:
      BOOL v8 = v5 == 1;
      int64_t v9 = 6;
      goto LABEL_11;
    case 16:
      BOOL v6 = v5 == 1;
      int64_t v7 = 8;
LABEL_7:
      if (v6) {
        a3 = v7 + 1;
      }
      else {
        a3 = v7;
      }
      break;
    case 17:
      BOOL v8 = v5 == 1;
      int64_t v9 = 8;
LABEL_11:
      if (v8) {
        a3 = v9;
      }
      else {
        a3 = v9 + 1;
      }
      break;
    default:
      return a3;
  }
  return a3;
}

+ (int64_t)contentModeForPosition:(int64_t)a3 defaultMode:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) >= 9) {
    return a4;
  }
  else {
    return a3 + 3;
  }
}

+ (BOOL)_cornerRadiiWithBorderRadius:(id)a3 cornerRadii:(TVCornerRadii *)a4 imageWidth:(double)a5 imageTreatmentValue:(id)a6 circle:(BOOL *)a7
{
  id v12 = a3;
  BOOL v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  if (![a1 _cornerRadiiFromImgTreatmentValue:a6 width:&v23 cornerRadii:&v25 circle:a5]|| (int v13 = 1, v12) && !v25)
  {
    uint64_t v14 = [v12 namedStyle];

    if (!v14)
    {
      if (!v12)
      {
        LOBYTE(v13) = 0;
        goto LABEL_17;
      }
      [v12 cornerRadiiValue];
      *(void *)&long long v23 = v18;
      *((void *)&v23 + 1) = v19;
      *(void *)&long long v24 = v20;
      *((void *)&v24 + 1) = v21;
      int v13 = 1;
      if (a4) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    uint64_t v15 = [v12 namedStyle];
    int v13 = [a1 _cornerRadiiFromImgTreatmentValue:v15 width:&v23 cornerRadii:&v25 circle:a5];
  }
  if (a4)
  {
LABEL_7:
    if (v13)
    {
      long long v16 = v24;
      *(_OWORD *)&a4->double topLeft = v23;
      *(_OWORD *)&a4->double bottomLeft = v16;
    }
  }
LABEL_9:
  char v17 = v13 ^ 1;
  if (!a7) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    *a7 = v25;
    LOBYTE(v13) = 1;
  }
LABEL_17:

  return v13;
}

+ (id)_placeholderImageForValue:(id)a3 userInterfaceStyle:(int64_t)a4
{
  return (id)objc_msgSend(a1, "_placeholderImageForValue:userInterfaceStyle:withCornerRadii:andScaledSize:", a3, a4, 0.0, 0.0, 0.0, 0.0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

+ (id)_placeholderImageForValue:(id)a3 userInterfaceStyle:(int64_t)a4 withCornerRadii:(TVCornerRadii)a5 andScaledSize:(CGSize)a6
{
  int64_t v7 = objc_msgSend(a3, "lowercaseString", a5.topLeft, a5.topRight, a5.bottomLeft, a5.bottomRight, a6.width, a6.height);
  if ([v7 isEqualToString:@"movie"])
  {
    BOOL v8 = @"PreloadAsset-Movie";
    int64_t v9 = @"PreloadAsset-Dark-Movie";
  }
  else if ([v7 isEqualToString:@"tv"])
  {
    BOOL v8 = @"PreloadAsset-TV";
    int64_t v9 = @"PreloadAsset-Dark-TV";
  }
  else if ([v7 isEqualToString:@"music"])
  {
    BOOL v8 = @"PreloadAsset-Music";
    int64_t v9 = @"PreloadAsset-Dark-Music";
  }
  else if ([v7 isEqualToString:@"podcast"])
  {
    BOOL v8 = @"PreloadAsset-Podcast";
    int64_t v9 = @"PreloadAsset-Dark-Podcast";
  }
  else if ([v7 isEqualToString:@"icloud"])
  {
    BOOL v8 = @"PreloadAsset-iCloud";
    int64_t v9 = @"PreloadAsset-Dark-iCloud";
  }
  else if ([v7 isEqualToString:@"monogram"])
  {
    BOOL v8 = @"PreloadAsset-Monogram";
    int64_t v9 = @"PreloadAsset-Dark-Monogram";
  }
  else if ([v7 isEqualToString:@"flowcase"])
  {
    BOOL v8 = @"PreloadAsset-GenericFlowcase";
    int64_t v9 = @"PreloadAsset-Dark-GenericFlowcase";
  }
  else if ([v7 isEqualToString:@"16x9"])
  {
    BOOL v8 = @"PreloadAsset-Generic16x9";
    int64_t v9 = @"PreloadAsset-Dark-Generic16x9";
  }
  else if ([v7 isEqualToString:@"tv16x9"])
  {
    BOOL v8 = @"PreloadAsset-TV16x9";
    int64_t v9 = @"PreloadAsset-Dark-TV16x9";
  }
  else if ([v7 isEqualToString:@"movie16x9"])
  {
    BOOL v8 = @"PreloadAsset-Movie16x9";
    int64_t v9 = @"PreloadAsset-Dark-Movie16x9";
  }
  else
  {
    if (![v7 isEqualToString:@"generic"])
    {
      id v12 = 0;
      goto LABEL_34;
    }
    BOOL v8 = @"PreloadAsset-Generic";
    int64_t v9 = @"PreloadAsset-Dark-Generic";
  }
  if (a4 == 2) {
    BOOL v8 = v9;
  }
  uint64_t v10 = v8;
  if (_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____once != -1) {
    dispatch_once(&_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____once, &__block_literal_global_280);
  }
  uint64_t v11 = v10;
  id v12 = [(id)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache objectForKey:v11];
  if (!v12)
  {
    int v13 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v14 = +[TVMLUtilities TVMLKitBundle];
    id v12 = [v13 imageNamed:v11 inBundle:v14];

    if (v12)
    {
      [(id)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache setObject:v12 forKey:v11];
    }
    else
    {
      uint64_t v15 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR)) {
        +[TVMLUtilities _placeholderImageForValue:userInterfaceStyle:withCornerRadii:andScaledSize:]((uint64_t)v11, v15);
      }
      id v12 = 0;
    }
  }

LABEL_34:
  return v12;
}

uint64_t __92__TVMLUtilities__placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = (void *)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache;
  _placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache = (uint64_t)v0;

  double v2 = (void *)_placeholderImageForValue_userInterfaceStyle_withCornerRadii_andScaledSize____placeholderImageCache;
  return [v2 setCountLimit:15];
}

+ (id)_defaultPlaceholderImageForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    if (_defaultPlaceholderImageForUserInterfaceStyle____once != -1) {
      dispatch_once(&_defaultPlaceholderImageForUserInterfaceStyle____once, &__block_literal_global_284);
    }
    id v3 = &_defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  }
  else
  {
    if (_defaultPlaceholderImageForUserInterfaceStyle____once_285 != -1) {
      dispatch_once(&_defaultPlaceholderImageForUserInterfaceStyle____once_285, &__block_literal_global_287);
    }
    id v3 = &_defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  }
  uint64_t v4 = (void *)*v3;
  return v4;
}

void __63__TVMLUtilities__defaultPlaceholderImageForUserInterfaceStyle___block_invoke()
{
  v4.double width = 1.0;
  v4.double height = 1.0;
  UIGraphicsBeginImageContext(v4);
  id v0 = [MEMORY[0x263F1C550] colorWithRed:0.11372549 green:0.11372549 blue:0.11372549 alpha:1.0];
  [v0 setFill];

  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.double width = 1.0;
  v5.size.double height = 1.0;
  UIRectFillUsingBlendMode(v5, kCGBlendModeCopy);
  uint64_t v1 = UIGraphicsGetImageFromCurrentImageContext();
  double v2 = (void *)_defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  _defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

void __63__TVMLUtilities__defaultPlaceholderImageForUserInterfaceStyle___block_invoke_2()
{
  v4.double width = 1.0;
  v4.double height = 1.0;
  UIGraphicsBeginImageContext(v4);
  id v0 = [MEMORY[0x263F1C550] colorWithRed:0.921568627 green:0.921568627 blue:0.921568627 alpha:1.0];
  [v0 setFill];

  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.double width = 1.0;
  v5.size.double height = 1.0;
  UIRectFillUsingBlendMode(v5, kCGBlendModeCopy);
  uint64_t v1 = UIGraphicsGetImageFromCurrentImageContext();
  double v2 = (void *)_defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  _defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

+ (id)_defaultPlaceholderImageForUserInterfaceStyle:(int64_t)a3 withCornerRadii:(TVCornerRadii)a4 andSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double bottomRight = a4.bottomRight;
  double bottomLeft = a4.bottomLeft;
  double topRight = a4.topRight;
  double topLeft = a4.topLeft;
  if (_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____once != -1) {
    dispatch_once(&_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____once, &__block_literal_global_289);
  }
  id v12 = NSString;
  v25.double width = width;
  v25.double height = height;
  uint64_t v13 = NSStringFromCGSize(v25);
  uint64_t v14 = (void *)v13;
  if (a3 != 2)
  {
    uint64_t v15 = [v12 stringWithFormat:@"placeholder-light-%@-%0.2f-%0.2f-%0.2f-%0.2f", v13, *(void *)&topRight, *(void *)&bottomRight, *(void *)&bottomLeft, *(void *)&topLeft];

    uint64_t v16 = [(id)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache objectForKey:v15];
    if (!v16)
    {
      char v17 = +[TVCornerUtilities createPathForRadii:inRect:](TVCornerUtilities, "createPathForRadii:inRect:", topLeft, topRight, bottomLeft, bottomRight, 0.0, 0.0, width, height);
      v27.double width = width;
      v27.double height = height;
      UIGraphicsBeginImageContext(v27);
      uint64_t v18 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v17];
      uint64_t v19 = (void *)MEMORY[0x263F1C550];
      double v20 = 0.921568627;
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v21 = (void *)v16;
    goto LABEL_10;
  }
  uint64_t v15 = [v12 stringWithFormat:@"placeholder-dark-%@-%0.2f-%0.2f-%0.2f-%0.2f", v13, *(void *)&topRight, *(void *)&bottomRight, *(void *)&bottomLeft, *(void *)&topLeft];

  uint64_t v16 = [(id)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache objectForKey:v15];
  if (v16) {
    goto LABEL_7;
  }
  char v17 = +[TVCornerUtilities createPathForRadii:inRect:](TVCornerUtilities, "createPathForRadii:inRect:", topLeft, topRight, bottomLeft, bottomRight, 0.0, 0.0, width, height);
  v26.double width = width;
  v26.double height = height;
  UIGraphicsBeginImageContext(v26);
  uint64_t v18 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v17];
  uint64_t v19 = (void *)MEMORY[0x263F1C550];
  double v20 = 0.11372549;
LABEL_9:
  uint64_t v22 = [v19 colorWithRed:v20 green:v20 blue:v20 alpha:1.0];
  [v22 setFill];

  [v18 fillWithBlendMode:17 alpha:1.0];
  uint64_t v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGPathRelease(v17);
  [(id)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache setObject:v21 forKey:v15];

LABEL_10:
  return v21;
}

uint64_t __87__TVMLUtilities__defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = (void *)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache;
  _defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache = (uint64_t)v0;

  double v2 = (void *)_defaultPlaceholderImageForUserInterfaceStyle_withCornerRadii_andSize____placeholderRounedImageCache;
  return [v2 setCountLimit:8];
}

+ (id)_placeholderImageForViewElement:(id)a3 imageLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v7 style];
  int64_t v9 = [v8 valueForStyle:@"tv-placeholder"];

  uint64_t v10 = [v7 appDocument];

  uint64_t v11 = [v10 templateElement];

  uint64_t v12 = [a1 interfaceStyleForTemplateElement:v11];
  if ([v9 isEqualToString:@"none"])
  {
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  if ([v9 length])
  {
    uint64_t v13 = [a1 _placeholderImageForValue:v9 userInterfaceStyle:v12];
    if (v13) {
      goto LABEL_13;
    }
    uint64_t v14 = +[TVInterfaceFactory sharedInterfaceFactory];
    uint64_t v13 = [v14 imageForResource:v9];

    if (!v6)
    {
LABEL_11:
      if (v13) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (!v6) {
      goto LABEL_11;
    }
  }
  if (v13) {
    goto LABEL_11;
  }
  uint64_t v15 = [v6 placeholderArtworkName];

  if (v15)
  {
    uint64_t v16 = [v6 placeholderArtworkName];
    char v17 = +[TVInterfaceFactory sharedInterfaceFactory];
    uint64_t v13 = [v17 imageForResource:v16];

    goto LABEL_11;
  }
LABEL_12:
  uint64_t v13 = [a1 _defaultPlaceholderImageForUserInterfaceStyle:v12];
LABEL_13:

  return v13;
}

+ (id)_placeholderImageForViewElement:(id)a3
{
  return (id)[a1 _placeholderImageForViewElement:a3 imageLayout:0];
}

+ (id)_placeholderImageForViewElement:(id)a3 withImageLayout:(id)a4 cornerRadii:(TVCornerRadii)a5 andScaledSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topRight = a5.topRight;
  double topLeft = a5.topLeft;
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = [v14 style];
  char v17 = [v16 valueForStyle:@"tv-placeholder"];

  uint64_t v18 = [v14 appDocument];
  uint64_t v19 = [v18 templateElement];

  uint64_t v20 = [a1 interfaceStyleForTemplateElement:v19];
  if ([v17 isEqualToString:@"none"])
  {
    uint64_t v21 = 0;
    goto LABEL_12;
  }
  if ([v17 length])
  {
    uint64_t v21 = objc_msgSend(a1, "_placeholderImageForValue:userInterfaceStyle:withCornerRadii:andScaledSize:", v17, v20, topLeft, topRight, bottomLeft, bottomRight, width, height);
    if (!v15)
    {
LABEL_10:
      if (v21) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if (!v15) {
      goto LABEL_10;
    }
  }
  if (v21) {
    goto LABEL_10;
  }
  uint64_t v22 = [v15 placeholderArtworkName];

  if (v22)
  {
    uint64_t v21 = [a1 _placeholderImageForViewElement:v14 imageLayout:v15];
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v21 = objc_msgSend(a1, "_defaultPlaceholderImageForUserInterfaceStyle:withCornerRadii:andSize:", v20, topLeft, topRight, bottomLeft, bottomRight, width, height);
LABEL_12:

  return v21;
}

+ (id)_placeholderImageForViewElement:(id)a3 withCornerRadii:(TVCornerRadii)a4 andScaledSize:(CGSize)a5
{
  return (id)objc_msgSend(a1, "_placeholderImageForViewElement:withImageLayout:cornerRadii:andScaledSize:", a3, 0, a4.topLeft, a4.topRight, a4.bottomLeft, a4.bottomRight, a5.width, a5.height);
}

+ (void)disassociateIKViewElementsRecursivelyFromView:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "tv_setAssociatedIKViewElement:", 0);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CGRect v5 = [v4 subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [a1 disassociateIKViewElementsRecursivelyFromView:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = objc_msgSend(v4, "components", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [a1 disassociateIKViewElementsRecursivelyFromView:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

+ (BOOL)isFlowcaseAtTopOfStackFromElement:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 appDocument];
  CGRect v5 = [v4 templateElement];
  uint64_t v6 = objc_msgSend(v5, "tv_elementType");

  if (v6 == 74)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = objc_msgSend(v3, "appDocument", 0);
    uint64_t v8 = [v7 templateElement];
    uint64_t v9 = [v8 children];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        if (objc_msgSend(v14, "tv_elementType") == 12) {
          break;
        }
        if (objc_msgSend(v14, "tv_elementType") == 10)
        {
          long long v16 = [v14 children];
          long long v17 = [v16 firstObject];

          BOOL v15 = objc_msgSend(v17, "tv_elementType") == 9 || objc_msgSend(v17, "tv_elementType") == 12;
          goto LABEL_18;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          BOOL v15 = 0;
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_18;
        }
      }
    }
    BOOL v15 = 0;
LABEL_18:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)canHandleDecodingOnRenderThread
{
  return 0;
}

+ (id)_mobileGestaltStringForKey:(__CFString *)a3
{
  id v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    id v4 = v3;
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

+ (double)_headerFadeForShowcaseFactor:(double)a3
{
  return fmax(a3 * -2.0 + 1.0, 0.0);
}

+ (BOOL)isAXSmallEnabled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || [v3 isEqual:*MEMORY[0x263F1D1A0]])
  {
    CFTypeID v5 = [MEMORY[0x263F1C920] mainScreen];
    uint64_t v6 = [v5 traitCollection];
    uint64_t v7 = [v6 preferredContentSizeCategory];

    id v4 = (void *)v7;
  }
  BOOL v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x263F1D160]) == NSOrderedDescending
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x263F1D140]) == NSOrderedAscending;

  return v8;
}

+ (BOOL)isAXLargeEnabled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || [v3 isEqual:*MEMORY[0x263F1D1A0]])
  {
    CFTypeID v5 = [MEMORY[0x263F1C920] mainScreen];
    uint64_t v6 = [v5 traitCollection];
    uint64_t v7 = [v6 preferredContentSizeCategory];

    id v4 = (void *)v7;
  }
  BOOL v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x263F1D148]) == NSOrderedDescending;

  return v8;
}

+ (void)_placeholderImageForValue:(uint64_t)a1 userInterfaceStyle:(NSObject *)a2 withCornerRadii:andScaledSize:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_230B4C000, a2, OS_LOG_TYPE_ERROR, "Failed to load placeholder image named: [%@]", (uint8_t *)&v2, 0xCu);
}

@end