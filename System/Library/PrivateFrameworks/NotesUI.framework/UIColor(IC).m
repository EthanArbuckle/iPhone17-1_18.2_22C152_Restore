@interface UIColor(IC)
+ (id)ICBackgroundColor;
+ (id)ICBlockQuoteBackgroundColor;
+ (id)ICDarkenedTintColor;
+ (id)ICGrayTodoButtonColor;
+ (id)ICGroupedBackgroundColor;
+ (id)ICHashtagColor;
+ (id)ICHashtagUnconfirmedColor;
+ (id)ICLearnMoreButtonPressedColor;
+ (id)ICLearnMoreLinkColor;
+ (id)ICLinkAcceleratorUnconfirmedColor;
+ (id)ICMentionUnconfirmedColor;
+ (id)ICSelectedAttachmentBrickHighlightColor;
+ (id)ICTintColor;
+ (id)ICTintedSelectionColor;
+ (id)ICUnknownInlineAttachmentTextColor;
+ (id)ic_attachmentBackgroundColor;
+ (id)ic_attachmentBackgroundColorForTraitCollection:()IC;
+ (id)ic_colorFromString:()IC;
+ (id)ic_darkerAccessibilityColorForColor:()IC;
+ (id)ic_emphasisBackgroudColorFromColor:()IC;
+ (id)ic_imageFromColor:()IC size:;
+ (id)ic_noteEditorBackgroundColor;
+ (id)ic_noteEditorLabelColor;
+ (id)ic_noteEditorPreviewColorForceLightContent:()IC;
+ (id)ic_noteEditorSecondaryLabelColor;
+ (id)ic_notePreviewBackgroundLightContent:()IC;
+ (id)ic_tintColorWithTraitCollection:()IC;
+ (id)preferredDefaultFontColor;
+ (uint64_t)ICControlAccentColor;
+ (uint64_t)ICDefaultFindBarColor;
+ (uint64_t)ICExtractedDocumentViewControllerBackgroundColor;
+ (uint64_t)ICFindInNoteHighlightColor;
+ (uint64_t)ICLearnMoreButtonUnpressedColor;
+ (uint64_t)ICListStatusIndicatorColor;
+ (uint64_t)ICListTitleTextColor;
+ (uint64_t)ICMonostyledBackgroundColor;
+ (uint64_t)ICMonostyledBorderColor;
+ (uint64_t)ICMoveActionBackgroundColor;
+ (uint64_t)ICNoteEditorToolbarColor;
+ (uint64_t)ICPasswordProtectActionColor;
+ (uint64_t)ICPinActionColor;
+ (uint64_t)ICShareActionBackgroundColor;
+ (uint64_t)ic_colorWith256Red:()IC green:blue:alpha:;
+ (uint64_t)ic_colorWith256Red:()IC green:blue:unitAlpha:;
+ (uint64_t)ic_dynamicWhiteBlackColor;
+ (uint64_t)ic_lightAttachmentBackgroundColor;
+ (uint64_t)ic_systemGray2Color;
+ (uint64_t)ic_systemGray3Color;
+ (uint64_t)ic_systemGray4Color;
+ (uint64_t)ic_systemGray5Color;
- (BOOL)ic_isWhite;
- (id)ic_colorBlendedWithColor:()IC;
- (id)ic_colorBlendedWithColor:()IC fraction:;
- (id)ic_colorString;
- (id)ic_resolvedColorForLightUserInterfaceStyle;
- (id)ic_resolvedColorForNoteEditor;
- (uint64_t)ic_isBlack;
- (uint64_t)ic_resolvedColor;
@end

@implementation UIColor(IC)

+ (id)preferredDefaultFontColor
{
  if (preferredDefaultFontColor_onceToken != -1) {
    dispatch_once(&preferredDefaultFontColor_onceToken, &__block_literal_global_33_0);
  }
  v0 = (void *)preferredDefaultFontColor_sDefaultFontColor;
  return v0;
}

+ (uint64_t)ic_systemGray5Color
{
  return [MEMORY[0x1E4FB1618] systemGray5Color];
}

+ (id)ic_noteEditorSecondaryLabelColor
{
  v0 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v1 = objc_msgSend(v0, "ic_resolvedColorForNoteEditor");

  return v1;
}

+ (id)ICGroupedBackgroundColor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  return v0;
}

+ (id)ICBackgroundColor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  return v0;
}

- (id)ic_resolvedColorForNoteEditor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision"))
  {
    objc_msgSend(a1, "ic_resolvedColorForLightUserInterfaceStyle");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

+ (id)ic_noteEditorBackgroundColor
{
  v0 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v1 = objc_msgSend(v0, "ic_resolvedColorForNoteEditor");

  return v1;
}

+ (uint64_t)ICNoteEditorToolbarColor
{
  return [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
}

+ (id)ICTintColor
{
  if (ICTintColor_onceToken[0] != -1) {
    dispatch_once(ICTintColor_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)ICTintColor_color;
  if (!ICTintColor_color)
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((color) != nil)", "+[UIColor(IC) ICTintColor]", 1, 0, @"Expected non-nil value for '%s'", "color");
    v0 = (void *)ICTintColor_color;
  }
  return v0;
}

+ (id)ICDarkenedTintColor
{
  id v2 = [a1 ICTintColor];
  v3 = objc_msgSend(a1, "ic_darkerAccessibilityColorForColor:", v2);

  return v3;
}

+ (id)ic_darkerAccessibilityColorForColor:()IC
{
  id v3 = a3;
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (([v3 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8] & 1) == 0)
  {
    id v4 = v3;
    ConvertedToSRGB = TSUCGColorCreateConvertedToSRGB([v4 CGColor]);
    id v3 = [MEMORY[0x1E4FB1618] colorWithCGColor:ConvertedToSRGB];

    CGColorRelease(ConvertedToSRGB);
    if (([v3 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8] & 1) == 0) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[UIColor(IC) ic_darkerAccessibilityColorForColor:]", 1, 0, @"Trying to darken color, but even converting to SRGB failed." functionName simulateCrash showAlert format];
    }
  }
  v6 = [MEMORY[0x1E4FB1618] colorWithHue:v11 saturation:v10 brightness:v9 * 0.8 alpha:v8];

  return v6;
}

+ (uint64_t)ICPasswordProtectActionColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0];
}

+ (uint64_t)ICPinActionColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.58 blue:0.0 alpha:1.0];
}

+ (uint64_t)ICExtractedDocumentViewControllerBackgroundColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.819607843 alpha:1.0];
}

+ (id)ICTintedSelectionColor
{
  id v1 = (id)[a1 ICTintColor];
  if (sUsingCustomTintColor == 1)
  {
    id v2 = [MEMORY[0x1E4FB1618] ICTintColor];
    id v3 = [v2 colorWithAlphaComponent:0.2];
  }
  else
  {
    if (ICTintedSelectionColor_onceToken != -1) {
      dispatch_once(&ICTintedSelectionColor_onceToken, &__block_literal_global_29);
    }
    id v3 = (id)ICTintedSelectionColor_sTintedSelectionColor;
  }
  return v3;
}

+ (uint64_t)ICMoveActionBackgroundColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.471 green:0.479 blue:0.999 alpha:1.0];
}

+ (uint64_t)ICShareActionBackgroundColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.196 green:0.576 blue:0.988 alpha:1.0];
}

+ (uint64_t)ICDefaultFindBarColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.82 green:0.83 blue:0.85 alpha:1.0];
}

+ (uint64_t)ICListTitleTextColor
{
  return [MEMORY[0x1E4FB1618] colorNamed:@"list_title_text_color"];
}

+ (uint64_t)ic_dynamicWhiteBlackColor
{
  return [MEMORY[0x1E4FB1618] colorNamed:@"dynamic_white_black_color"];
}

+ (id)ic_attachmentBackgroundColorForTraitCollection:()IC
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(a1, "ic_attachmentBackgroundColor");
    v6 = [v5 resolvedColorWithTraitCollection:v4];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((traitCollection) != nil)", "+[UIColor(IC) ic_attachmentBackgroundColorForTraitCollection:]", 1, 0, @"Expected non-nil value for '%s'", "traitCollection");
    v6 = 0;
  }

  return v6;
}

+ (id)ic_tintColorWithTraitCollection:()IC
{
  id v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  v5 = [v3 tintColor];
  v6 = [v5 resolvedColorWithTraitCollection:v4];

  return v6;
}

- (uint64_t)ic_resolvedColor
{
  uint64_t v1 = [a1 CGColor];
  id v2 = (void *)MEMORY[0x1E4FB1618];
  return [v2 colorWithCGColor:v1];
}

- (id)ic_resolvedColorForLightUserInterfaceStyle
{
  id v2 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
  id v3 = [a1 resolvedColorWithTraitCollection:v2];

  return v3;
}

+ (uint64_t)ic_colorWith256Red:()IC green:blue:alpha:
{
  return [MEMORY[0x1E4FB1618] colorWithRed:a1 / 255.0 green:a2 / 255.0 blue:a3 / 255.0 alpha:a4 / 255.0];
}

+ (uint64_t)ic_colorWith256Red:()IC green:blue:unitAlpha:
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", a1 / 255.0, a2 / 255.0, a3 / 255.0);
}

+ (id)ICSelectedAttachmentBrickHighlightColor
{
  if (ICSelectedAttachmentBrickHighlightColor_onceToken != -1) {
    dispatch_once(&ICSelectedAttachmentBrickHighlightColor_onceToken, &__block_literal_global_53);
  }
  v0 = (void *)ICSelectedAttachmentBrickHighlightColor_color;
  return v0;
}

+ (id)ICGrayTodoButtonColor
{
  uint64_t v1 = [a1 tertiaryLabelColor];
  id v2 = objc_msgSend(v1, "ic_resolvedColorForNoteEditor");

  return v2;
}

+ (uint64_t)ICControlAccentColor
{
  return [MEMORY[0x1E4FB1618] tintColor];
}

+ (uint64_t)ICListStatusIndicatorColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "ic_colorWith256Red:green:blue:alpha:", 234.0, 187.0, 0.0, 255.0);
}

+ (uint64_t)ICFindInNoteHighlightColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.917647059 green:0.733333333 blue:0.0 alpha:0.3];
}

+ (uint64_t)ICLearnMoreButtonUnpressedColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "ic_colorWith256Red:green:blue:alpha:", 0.0, 122.0, 255.0, 255.0);
}

+ (id)ICLearnMoreButtonPressedColor
{
  uint64_t v1 = [a1 ICLearnMoreButtonUnpressedColor];
  id v2 = [v1 colorWithAlphaComponent:0.4];

  return v2;
}

+ (id)ICLearnMoreLinkColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    [MEMORY[0x1E4FB1618] ICDarkenedTintColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] ICTintColor];
  }
  return v0;
}

+ (id)ICHashtagUnconfirmedColor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  return v0;
}

+ (id)ICHashtagColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    [MEMORY[0x1E4FB1618] ICDarkenedTintColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] ICTintColor];
  }
  return v0;
}

+ (id)ICLinkAcceleratorUnconfirmedColor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  return v0;
}

+ (id)ICMentionUnconfirmedColor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  return v0;
}

+ (id)ICUnknownInlineAttachmentTextColor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  return v0;
}

+ (id)ic_imageFromColor:()IC size:
{
  id v7 = a5;
  v14.width = a1;
  v14.height = a2;
  UIGraphicsBeginImageContext(v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = v7;
  double v10 = (CGColor *)[v9 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = a1;
  v15.size.height = a2;
  CGContextFillRect(CurrentContext, v15);
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

+ (id)ic_attachmentBackgroundColor
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    objc_msgSend(MEMORY[0x1E4FB1618], "ic_dynamicWhiteBlackColor");
  }
  else {
  v0 = [MEMORY[0x1E4FB1618] ICBackgroundColor];
  }
  return v0;
}

+ (uint64_t)ICMonostyledBackgroundColor
{
  return [MEMORY[0x1E4FB1618] lightGrayColor];
}

+ (uint64_t)ICMonostyledBorderColor
{
  return [MEMORY[0x1E4FB1618] quaternaryLabelColor];
}

+ (id)ICBlockQuoteBackgroundColor
{
  v0 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  uint64_t v1 = objc_msgSend(v0, "ic_resolvedColorForNoteEditor");

  return v1;
}

+ (uint64_t)ic_lightAttachmentBackgroundColor
{
  return [MEMORY[0x1E4FB1618] whiteColor];
}

+ (id)ic_noteEditorLabelColor
{
  v0 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v1 = objc_msgSend(v0, "ic_resolvedColorForNoteEditor");

  return v1;
}

+ (id)ic_noteEditorPreviewColorForceLightContent:()IC
{
  if (a3)
  {
    id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    id v3 = objc_msgSend(v4, "ic_resolvedColorForNoteEditor");
  }
  return v3;
}

+ (id)ic_notePreviewBackgroundLightContent:()IC
{
  if (a3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  return v3;
}

+ (id)ic_colorFromString:()IC
{
  uint64_t v0 = ICCGColorCreateWithString();
  if (v0)
  {
    uint64_t v1 = (CGColor *)v0;
    id v2 = [MEMORY[0x1E4FB1618] colorWithCGColor:v0];
    CGColorRelease(v1);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

+ (id)ic_emphasisBackgroudColorFromColor:()IC
{
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", objc_msgSend(a3, "CGColor"));
  double v8 = 0.0;
  double v9 = 0.0;
  uint64_t v6 = 0;
  double v7 = 0.0;
  [v3 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", fmax(v9 * 0.85, 0.0), fmax(v8 * 0.85, 0.0), fmax(v7 * 0.85, 0.0), 0.15);

  return v4;
}

- (id)ic_colorString
{
  uint64_t v1 = (void *)[a1 CGColor];
  if (v1)
  {
    uint64_t v1 = ICStringFromCGColor();
  }
  return v1;
}

- (uint64_t)ic_isBlack
{
  uint64_t v1 = [a1 CGColor];
  return MEMORY[0x1F4139E08](v1);
}

- (BOOL)ic_isWhite
{
  [a1 CGColor];
  TSUColorLightness();
  return v1 == 1.0;
}

- (id)ic_colorBlendedWithColor:()IC
{
  id v4 = a3;
  if (v4 && ![a1 isEqual:v4])
  {
    id v5 = [a1 _colorBlendedWithColor:v4];
  }
  else
  {
    id v5 = a1;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)ic_colorBlendedWithColor:()IC fraction:
{
  id v6 = a4;
  if (v6 && ![a1 isEqual:v6])
  {
    [a1 alphaComponent];
    double v9 = v8;
    [v6 alphaComponent];
    double v11 = v10 * a2 + (1.0 - a2) * v9;
    v12 = [a1 colorWithAlphaComponent:1.0];
    v13 = [v6 colorWithAlphaComponent:a2];
    CGSize v14 = [v12 _colorBlendedWithColor:v13];

    id v7 = [v14 colorWithAlphaComponent:v11];
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

+ (uint64_t)ic_systemGray2Color
{
  return [MEMORY[0x1E4FB1618] systemGray2Color];
}

+ (uint64_t)ic_systemGray3Color
{
  return [MEMORY[0x1E4FB1618] systemGray3Color];
}

+ (uint64_t)ic_systemGray4Color
{
  return [MEMORY[0x1E4FB1618] systemGray4Color];
}

@end