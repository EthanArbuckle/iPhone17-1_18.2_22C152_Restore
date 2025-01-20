@interface UIColor(UIKit_SiriUIFrameworkAdditions)
+ (id)siriui_colorWithAceColor:()UIKit_SiriUIFrameworkAdditions;
+ (id)siriui_glyphColor;
+ (id)siriui_highlightColor;
+ (id)siriui_insertionPointColor;
+ (id)siriui_keylineColor;
+ (id)siriui_linkTextColor;
+ (id)siriui_maskingColor;
+ (id)siriui_maskingHighlightColor;
+ (id)siriui_platterInsertionPointColor;
+ (id)siriui_platterKeylineColor;
+ (id)siriui_platterLinkTextColor;
+ (id)siriui_platterMaskingColor;
+ (id)siriui_platterMaskingHighlightColor;
+ (id)siriui_platterSemiTransparentTextColor;
+ (id)siriui_semiTransparentTextColor;
+ (id)siriui_textColor;
+ (id)siriui_textHighlightColor;
+ (uint64_t)siriui_blendEffectColor;
+ (uint64_t)siriui_lightHighlightColor;
+ (uint64_t)siriui_lightInsertionPointColor;
+ (uint64_t)siriui_lightKeylineColor;
+ (uint64_t)siriui_lightMaskingColor;
+ (uint64_t)siriui_lightMaskingHighlightColor;
+ (uint64_t)siriui_lightTextColor;
+ (uint64_t)siriui_lightTextHighlightColor;
+ (uint64_t)siriui_platterGlyphColor;
+ (uint64_t)siriui_platterOverlayBackgroundColor;
+ (uint64_t)siriui_platterOverlayDarkBackgroundColor;
+ (uint64_t)siriui_platterTextColor;
+ (uint64_t)siriui_platterTextHighlightColor;
+ (uint64_t)siriui_sashOverlayBackgroundColor;
+ (uint64_t)siriui_semiTransparentLightTextColor;
+ (uint64_t)siriui_snippetBackgroundColor;
+ (uint64_t)siriui_tapToEditColor;
+ (uint64_t)siriui_tapToEditMaskingColor;
+ (uint64_t)siriui_transparantButtonColor;
+ (uint64_t)siriui_transparantHighlightedButtonColor;
@end

@implementation UIColor(UIKit_SiriUIFrameworkAdditions)

+ (uint64_t)siriui_lightTextColor
{
  return [MEMORY[0x263F1C550] whiteColor];
}

+ (uint64_t)siriui_snippetBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.1];
}

+ (id)siriui_highlightColor
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  v1 = [v0 colorWithAlphaComponent:0.1];

  return v1;
}

+ (uint64_t)siriui_lightHighlightColor
{
  return [a1 colorWithWhite:1.0 alpha:0.1];
}

+ (id)siriui_maskingHighlightColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterMaskingHighlightColor");
  }
  else {
  v2 = [a1 colorWithWhite:1.0 alpha:0.2];
  }
  return v2;
}

+ (uint64_t)siriui_lightMaskingHighlightColor
{
  return [a1 colorWithWhite:1.0 alpha:0.2];
}

+ (id)siriui_platterMaskingHighlightColor
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  v1 = [v0 colorWithAlphaComponent:0.2];

  return v1;
}

+ (id)siriui_keylineColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterKeylineColor");
  }
  else {
  v2 = objc_msgSend(a1, "siriui_lightKeylineColor");
  }
  return v2;
}

+ (uint64_t)siriui_lightKeylineColor
{
  return [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.18];
}

+ (id)siriui_platterKeylineColor
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  v1 = [v0 colorWithAlphaComponent:0.18];

  return v1;
}

+ (id)siriui_maskingColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterMaskingColor");
  }
  else {
  v2 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.6];
  }
  return v2;
}

+ (uint64_t)siriui_transparantButtonColor
{
  v0 = (void *)MEMORY[0x263F1C550];
  BOOL v1 = UIAccessibilityDarkerSystemColorsEnabled();
  double v2 = 0.8;
  if (!v1) {
    double v2 = 0.6;
  }
  return [v0 colorWithWhite:1.0 alpha:v2];
}

+ (uint64_t)siriui_transparantHighlightedButtonColor
{
  BOOL v2 = UIAccessibilityDarkerSystemColorsEnabled();
  double v3 = 0.4;
  if (!v2) {
    double v3 = 0.2;
  }
  return [a1 colorWithWhite:1.0 alpha:v3];
}

+ (uint64_t)siriui_lightMaskingColor
{
  return [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.6];
}

+ (id)siriui_platterMaskingColor
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  BOOL v1 = [v0 colorWithAlphaComponent:0.6];

  return v1;
}

+ (id)siriui_glyphColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterGlyphColor");
  }
  else {
  BOOL v2 = [MEMORY[0x263F1C550] whiteColor];
  }
  return v2;
}

+ (uint64_t)siriui_platterGlyphColor
{
  return [MEMORY[0x263F1C550] labelColor];
}

+ (id)siriui_textColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterTextColor");
  }
  else {
  BOOL v2 = [MEMORY[0x263F1C550] whiteColor];
  }
  return v2;
}

+ (uint64_t)siriui_platterTextColor
{
  return [MEMORY[0x263F1C550] labelColor];
}

+ (id)siriui_linkTextColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterLinkTextColor");
  }
  else {
  BOOL v2 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.55];
  }
  return v2;
}

+ (id)siriui_platterLinkTextColor
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  BOOL v1 = [v0 colorWithAlphaComponent:0.55];

  return v1;
}

+ (id)siriui_semiTransparentTextColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterSemiTransparentTextColor");
  }
  else {
  BOOL v2 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
  }
  return v2;
}

+ (uint64_t)siriui_semiTransparentLightTextColor
{
  return [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
}

+ (id)siriui_platterSemiTransparentTextColor
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  BOOL v1 = [v0 colorWithAlphaComponent:0.5];

  return v1;
}

+ (id)siriui_textHighlightColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterTextHighlightColor");
  }
  else {
  BOOL v2 = objc_msgSend(a1, "siriui_lightTextHighlightColor");
  }
  return v2;
}

+ (uint64_t)siriui_lightTextHighlightColor
{
  return [MEMORY[0x263F1C550] whiteColor];
}

+ (uint64_t)siriui_platterTextHighlightColor
{
  return [MEMORY[0x263F1C550] labelColor];
}

+ (uint64_t)siriui_tapToEditColor
{
  BOOL v0 = UIAccessibilityDarkerSystemColorsEnabled();
  double v1 = 0.314;
  if (v0) {
    double v1 = 0.510078431;
  }
  BOOL v2 = (void *)MEMORY[0x263F1C550];
  return [v2 colorWithRed:v1 green:v1 blue:v1 alpha:1.0];
}

+ (uint64_t)siriui_tapToEditMaskingColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    double v0 = 0.510078431;
  }
  else {
    double v0 = 0.314;
  }
  double v1 = (void *)MEMORY[0x263F1C550];
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    double v2 = 0.8;
  }
  else {
    double v2 = 0.6;
  }
  return [v1 colorWithRed:v0 green:v0 blue:v0 alpha:v2];
}

+ (id)siriui_insertionPointColor
{
  if (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()) {
    objc_msgSend(a1, "siriui_platterInsertionPointColor");
  }
  else {
  double v2 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
  }
  return v2;
}

+ (id)siriui_platterInsertionPointColor
{
  double v0 = [MEMORY[0x263F1C550] labelColor];
  double v1 = [v0 colorWithAlphaComponent:0.5];

  return v1;
}

+ (uint64_t)siriui_lightInsertionPointColor
{
  return [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
}

+ (uint64_t)siriui_platterOverlayBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
}

+ (uint64_t)siriui_platterOverlayDarkBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.8];
}

+ (uint64_t)siriui_sashOverlayBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.956 green:0.956 blue:0.956 alpha:1.0];
}

+ (id)siriui_colorWithAceColor:()UIKit_SiriUIFrameworkAdditions
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F1C550];
  double v5 = (double)[v3 redValue] / 255.0;
  double v6 = (double)[v3 greenValue] / 255.0;
  double v7 = (double)[v3 blueValue] / 255.0;
  v8 = [v3 alpha];
  if (v8)
  {
    v9 = [v3 alpha];
    [v9 floatValue];
    v11 = [v4 colorWithRed:v5 green:v6 blue:v7 alpha:v10];
  }
  else
  {
    v11 = [v4 colorWithRed:v5 green:v6 blue:v7 alpha:1.0];
  }

  return v11;
}

+ (uint64_t)siriui_blendEffectColor
{
  BOOL v0 = UIAccessibilityDarkerSystemColorsEnabled();
  double v1 = 0.596;
  if (v0) {
    double v1 = 0.792078431;
  }
  double v2 = (void *)MEMORY[0x263F1C550];
  return [v2 colorWithRed:v1 green:v1 blue:v1 alpha:1.0];
}

@end