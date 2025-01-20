@interface VUIUtilities
+ (BOOL)isInFullscreenOrPipPlayback;
+ (BOOL)isInRetailDemoMode;
+ (BOOL)isIpadInterface;
+ (BOOL)isIpadPortrait;
+ (BOOL)isPortraitIgnoringFlatOrientation:(int64_t)a3 viewSize:(CGSize)a4;
+ (BOOL)isRemoteApp;
+ (BOOL)isSUIEnabled;
+ (BOOL)isStoreOrPressDemoMode;
+ (BOOL)isTVApp;
+ (BOOL)shouldInvalidateLayoutWithPreviousTraitCollection:(id)a3 newTraitCollection:(id)a4;
+ (BOOL)shouldPlayerTabsUseVerticalLayoutForSize:(CGSize)a3 isPhoneSizeClass:(BOOL)a4;
+ (CGRect)vuiRectCenteredXInRect:(CGRect)a3 boundsToCenterIn:(CGRect)a4 offset:(double)a5;
+ (CGSize)imageSizeWithAspectRatio:(double)a3 scaleToSize:(CGSize)a4;
+ (TVCornerRadii)imageCornerRadiiWithStyle:(int64_t)a3;
+ (double)imageCornerRadiusWithStyle:(int64_t)a3;
+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4;
+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4 maximumContentSizeCategory:(id)a5;
+ (id)VideosUIBundle;
+ (id)colorFromHexStr:(id)a3;
+ (id)colorFromRGBStr:(id)a3;
+ (id)getCurrentQueueLabel;
+ (id)getOSVersion;
+ (id)gradientLayerLocationsFromSpacings:(id)a3 height:(double)a4;
+ (id)placeholderImageResourceName:(int64_t)a3;
+ (id)randomColor;
+ (int64_t)interfaceStyleFromTheme:(id)a3 defaultInterfaceStyle:(int64_t)a4;
+ (int64_t)textAlignmentWithSemanticContentAttribute:(int64_t)a3;
+ (unint64_t)minimumNumberOfItemsToEnableSeeAllButton;
+ (void)gradientConfigForCollection:(id)a3 gradientMask:(int64_t)a4 properties:(id)a5 configuration:(id *)a6;
@end

@implementation VUIUtilities

+ (BOOL)isSUIEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)getCurrentQueueLabel
{
  label = dispatch_queue_get_label(0);
  v3 = NSString;
  return (id)[v3 stringWithCString:label encoding:4];
}

+ (id)getOSVersion
{
  if (getOSVersion_onceToken != -1) {
    dispatch_once(&getOSVersion_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)getOSVersion_osVersion;
  return v2;
}

+ (BOOL)isInRetailDemoMode
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F4DC48] isRunningInStoreDemoMode];
  v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUIUtilities::isInRetailDemoMode=%hhd", (uint8_t *)v5, 8u);
  }

  return v2;
}

+ (BOOL)isTVApp
{
  int v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  if (([v3 isEqualToString:@"com.apple.TVWatchList"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.tv"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.TV"];
  }

  return v4;
}

void __28__VUIUtilities_getOSVersion__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      uint64_t v3 = [NSString stringWithString:v1];
      char v4 = (void *)getOSVersion_osVersion;
      getOSVersion_osVersion = v3;
    }
    CFRelease(v1);
  }
}

+ (id)randomColor
{
  double v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v4 = (double)arc4random_uniform(0xFFu) / 255.0;
  v5 = (void *)MEMORY[0x1E4FB1618];
  return (id)[v5 colorWithRed:v2 green:v3 blue:v4 alpha:0.4];
}

+ (BOOL)shouldInvalidateLayoutWithPreviousTraitCollection:(id)a3 newTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = [v5 horizontalSizeClass];
    if (v7 == [v6 horizontalSizeClass])
    {
      uint64_t v8 = [v5 verticalSizeClass];
      BOOL v9 = v8 != [v6 verticalSizeClass];
    }
    else
    {
      BOOL v9 = 1;
    }
    v11 = [v5 preferredContentSizeCategory];
    v12 = [v6 preferredContentSizeCategory];
    BOOL v10 = v11 != v12;
  }
  else
  {
    BOOL v10 = 0;
    BOOL v9 = 0;
  }

  return v9 || v10;
}

+ (CGSize)imageSizeWithAspectRatio:(double)a3 scaleToSize:(CGSize)a4
{
  if (a3 == 0.0 || a4.height != 0.0)
  {
    if (a4.width == 0.0) {
      a4.double width = round(a4.height * a3);
    }
  }
  else
  {
    a4.double height = round(a4.width / a3);
  }
  double width = a4.width;
  double height = a4.height;
  result.double height = height;
  result.double width = width;
  return result;
}

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4
{
  id v5 = a4;
  [(id)objc_opt_class() scaleContentSizeValue:v5 forTraitCollection:*MEMORY[0x1E4FB27F0] maximumContentSizeCategory:a3];
  double v7 = v6;

  return v7;
}

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4 maximumContentSizeCategory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken != -1) {
    dispatch_once(&scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken, &__block_literal_global_91);
  }
  BOOL v9 = [v7 preferredContentSizeCategory];
  BOOL v10 = v9;
  id v11 = (id)*MEMORY[0x1E4FB27F0];
  if (!v9 || [v9 isEqual:*MEMORY[0x1E4FB27F0]])
  {
    v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v13 = [v12 traitCollection];
    uint64_t v14 = [v13 preferredContentSizeCategory];

    BOOL v10 = (void *)v14;
  }
  if (v11 != v8
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, (UIContentSizeCategory)v10) == NSOrderedAscending)
  {
    id v15 = v8;

    BOOL v10 = v15;
  }
  uint64_t v16 = [(id)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale objectForKeyedSubscript:v10];
  v17 = (void *)v16;
  v18 = &unk_1F3F3E5F8;
  if (v16) {
    v18 = (void *)v16;
  }
  id v19 = v18;

  [v19 floatValue];
  float v21 = v20;

  return ceil(v21 * a3);
}

void __84__VUIUtilities_scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory___block_invoke()
{
  id v2 = (id)objc_opt_new();
  [v2 setObject:&unk_1F3F3E5C8 forKeyedSubscript:*MEMORY[0x1E4FB27C8]];
  [v2 setObject:&unk_1F3F3E5D8 forKeyedSubscript:*MEMORY[0x1E4FB27E8]];
  [v2 setObject:&unk_1F3F3E5E8 forKeyedSubscript:*MEMORY[0x1E4FB27D8]];
  [v2 setObject:&unk_1F3F3E5F8 forKeyedSubscript:*MEMORY[0x1E4FB27D0]];
  [v2 setObject:&unk_1F3F3E608 forKeyedSubscript:*MEMORY[0x1E4FB27C0]];
  [v2 setObject:&unk_1F3F3E618 forKeyedSubscript:*MEMORY[0x1E4FB27B8]];
  [v2 setObject:&unk_1F3F3E628 forKeyedSubscript:*MEMORY[0x1E4FB27B0]];
  [v2 setObject:&unk_1F3F3E638 forKeyedSubscript:*MEMORY[0x1E4FB2798]];
  [v2 setObject:&unk_1F3F3E648 forKeyedSubscript:*MEMORY[0x1E4FB2790]];
  [v2 setObject:&unk_1F3F3E658 forKeyedSubscript:*MEMORY[0x1E4FB2788]];
  [v2 setObject:&unk_1F3F3E668 forKeyedSubscript:*MEMORY[0x1E4FB2780]];
  [v2 setObject:&unk_1F3F3E678 forKeyedSubscript:*MEMORY[0x1E4FB2778]];
  uint64_t v0 = [v2 copy];
  v1 = (void *)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale;
  scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale = v0;
}

+ (BOOL)isIpadInterface
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return v3 == 1;
}

+ (BOOL)isIpadPortrait
{
  BOOL v2 = +[VUIUtilities isIpadInterface];
  if (v2) {
    LOBYTE(v2) = (unint64_t)(objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation") - 1) < 2;
  }
  return v2;
}

+ (unint64_t)minimumNumberOfItemsToEnableSeeAllButton
{
  return 10;
}

+ (int64_t)textAlignmentWithSemanticContentAttribute:(int64_t)a3
{
  if (a3 == 4) {
    return 2;
  }
  if (a3 == 3) {
    return 0;
  }
  double v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v5 = [v4 userInterfaceLayoutDirection] == 1;

  return 2 * v5;
}

+ (id)VideosUIBundle
{
  if (VideosUIBundle_onceToken != -1) {
    dispatch_once(&VideosUIBundle_onceToken, &__block_literal_global_43_0);
  }
  BOOL v2 = (void *)VideosUIBundle_bundle;
  return v2;
}

void __30__VUIUtilities_VideosUIBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.VideosUI"];
  v1 = (void *)VideosUIBundle_bundle;
  VideosUIBundle_bundle = v0;
}

+ (BOOL)isInFullscreenOrPipPlayback
{
  BOOL v2 = +[VUIPlaybackManager sharedInstance];
  char v3 = [v2 isPlaybackUIBeingShown];

  return v3;
}

+ (BOOL)isPortraitIgnoringFlatOrientation:(int64_t)a3 viewSize:(CGSize)a4
{
  if ((unint64_t)(a3 - 5) >= 2) {
    return (unint64_t)(a3 - 1) < 2;
  }
  else {
    return a4.width < a4.height;
  }
}

+ (void)gradientConfigForCollection:(id)a3 gradientMask:(int64_t)a4 properties:(id)a5 configuration:(id *)a6
{
  char v7 = a4;
  id v9 = a5;
  [a3 contentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v47 = v16;
  [v9 minPadding];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [v9 minLengths];
  double v46 = v25;
  double v27 = v26;

  double v28 = *MEMORY[0x1E4FB2848];
  double v29 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v30 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v31 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v32 = -(v18 - v11);
  if (v11 >= v18) {
    double v32 = *MEMORY[0x1E4FB2848];
  }
  double v33 = v28 + v18 - v11;
  if (v11 >= v18) {
    double v33 = *MEMORY[0x1E4FB2848];
  }
  if (v7) {
    double v34 = v27;
  }
  else {
    double v34 = v32;
  }
  if (v7) {
    double v28 = v32;
  }
  else {
    double v33 = *MEMORY[0x1E4FB2848];
  }
  double v35 = -(v22 - v15);
  if (v15 >= v22) {
    double v35 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  double v36 = v22 - v15 + v30;
  if (v15 >= v22) {
    double v36 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  if ((v7 & 4) != 0) {
    double v37 = v27;
  }
  else {
    double v37 = v35;
  }
  if ((v7 & 4) != 0) {
    double v30 = v35;
  }
  else {
    double v36 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  double v38 = -(v20 - v13);
  if (v13 >= v20) {
    double v38 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  double v39 = v20 - v13 + v29;
  if (v13 >= v20) {
    double v39 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  if ((v7 & 8) != 0) {
    double v40 = v46;
  }
  else {
    double v40 = v38;
  }
  if ((v7 & 8) != 0) {
    double v29 = v38;
  }
  else {
    double v39 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  double v41 = -(v24 - v47);
  if (v47 >= v24) {
    double v41 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  a6->var0.top = v34;
  a6->var0.left = v40;
  double v42 = v24 - v47 + v31;
  if (v47 >= v24) {
    double v42 = v31;
  }
  if ((v7 & 0x10) != 0) {
    double v43 = v46;
  }
  else {
    double v43 = v41;
  }
  a6->var0.bottom = v37;
  a6->var0.right = v43;
  a6->var1.top = v33;
  a6->var1.left = v39;
  if ((v7 & 0x10) != 0) {
    double v44 = v42;
  }
  else {
    double v44 = v31;
  }
  a6->var1.bottom = v36;
  a6->var1.right = v44;
  a6->var2.top = v28;
  a6->var2.left = v29;
  if ((v7 & 0x10) != 0) {
    double v45 = v41;
  }
  else {
    double v45 = v31;
  }
  a6->var2.bottom = v30;
  a6->var2.right = v45;
}

+ (TVCornerRadii)imageCornerRadiiWithStyle:(int64_t)a3
{
  char v3 = (void *)MEMORY[0x1E4FA9C78];
  [(id)objc_opt_class() imageCornerRadiusWithStyle:a3];
  objc_msgSend(v3, "radiiFromRadius:");
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

+ (id)placeholderImageResourceName:(int64_t)a3
{
  int64_t v3 = a3;
  if (!a3)
  {
    double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    double v5 = [v4 traitCollection];
    int64_t v3 = [v5 userInterfaceStyle];
  }
  double v6 = VUIImageResourceMapGenericPlaceholder16x9;
  if (v3 != 1) {
    double v6 = &VUIImageResourceMapDarkGenericPlaceholder16x9;
  }
  double v7 = *v6;
  return v7;
}

+ (id)colorFromRGBStr:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x1E4FB1618] clearColor];
  if ([v3 length])
  {
    double v5 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"(");
    uint64_t v6 = [v3 rangeOfCharacterFromSet:v5];

    double v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@""]);
    uint64_t v8 = [v3 rangeOfCharacterFromSet:v7];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v10 = objc_msgSend(v3, "substringWithRange:", v6 + 1, v8 + ~v6);
      double v11 = [v10 componentsSeparatedByString:@","];
      if ([v11 count] == 3)
      {
        double v12 = [v11 objectAtIndexedSubscript:0];
        double v13 = (double)[v12 integerValue] / 255.0;

        double v14 = [v11 objectAtIndexedSubscript:1];
        double v15 = (double)[v14 integerValue] / 255.0;

        double v16 = [v11 objectAtIndexedSubscript:2];
        double v17 = (double)[v16 integerValue] / 255.0;

        uint64_t v18 = [MEMORY[0x1E4FB1618] colorWithRed:v13 green:v15 blue:v17 alpha:1.0];

        double v4 = (void *)v18;
      }
    }
  }

  return v4;
}

+ (id)colorFromHexStr:(id)a3
{
  id v3 = a3;
  if ([v3 length] && objc_msgSend(v3, "hasPrefix:", @"#"))
  {
    int v8 = 0;
    double v4 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
    double v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"#"];
    [v4 setCharactersToBeSkipped:v5];

    [v4 scanHexInt:&v8];
    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:(double)BYTE2(v8) / 255.0 green:(double)BYTE1(v8) / 255.0 blue:(double)v8 / 255.0 alpha:1.0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)interfaceStyleFromTheme:(id)a3 defaultInterfaceStyle:(int64_t)a4
{
  id v5 = a3;
  if (interfaceStyleFromTheme_defaultInterfaceStyle__onceToken != -1) {
    dispatch_once(&interfaceStyleFromTheme_defaultInterfaceStyle__onceToken, &__block_literal_global_65_0);
  }
  if ([v5 length])
  {
    uint64_t v6 = [(id)interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap objectForKeyedSubscript:v5];

    if (v6)
    {
      double v7 = [(id)interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap objectForKeyedSubscript:v5];
      a4 = [v7 unsignedIntegerValue];
    }
  }

  return a4;
}

void __62__VUIUtilities_interfaceStyleFromTheme_defaultInterfaceStyle___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"light";
  v2[1] = @"dark";
  v3[0] = &unk_1F3F3D148;
  v3[1] = &unk_1F3F3D160;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap;
  interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap = v0;
}

+ (BOOL)isRemoteApp
{
  BOOL v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  LOBYTE(v2) = [v3 isEqualToString:@"com.apple.TVRemoteUIService"];
  return (char)v2;
}

+ (id)gradientLayerLocationsFromSpacings:(id)a3 height:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "floatValue", (void)v17);
        double v11 = v11 + v13;
        double v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v11 / a4];
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  double v15 = (void *)[v6 copy];
  return v15;
}

+ (double)imageCornerRadiusWithStyle:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 2) {
    return dbl_1E38FDF10[a3];
  }
  return result;
}

+ (BOOL)isStoreOrPressDemoMode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VUIUtilities_isStoreOrPressDemoMode__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isStoreOrPressDemoMode_onceToken[0] != -1) {
    dispatch_once(isStoreOrPressDemoMode_onceToken, block);
  }
  return isStoreOrPressDemoMode_isInDemoMode;
}

uint64_t __38__VUIUtilities_isStoreOrPressDemoMode__block_invoke(uint64_t a1)
{
  char v1 = [*(id *)(a1 + 32) isInRetailDemoMode];
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"PressDemoMode", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    char v4 = v1;
  }
  else {
    char v4 = 1;
  }
  isStoreOrPressDemoMode_isInDemoMode = v4;
  return result;
}

+ (CGRect)vuiRectCenteredXInRect:(CGRect)a3 boundsToCenterIn:(CGRect)a4 offset:(double)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  VUIRoundValue();
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.x = v8;
  return result;
}

+ (BOOL)shouldPlayerTabsUseVerticalLayoutForSize:(CGSize)a3 isPhoneSizeClass:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 orientation];

  BOOL result = 1;
  if (!+[VUIUtilities isPortraitIgnoringFlatOrientation:viewSize:](VUIUtilities, "isPortraitIgnoringFlatOrientation:viewSize:", v8, width, height)&& (![MEMORY[0x1E4FB3C90] isPad] || !v4))
  {
    return 0;
  }
  return result;
}

@end