@interface IKViewElementStyle(TVMLKitAdditions)
- (BOOL)tv_hasFocusMargin;
- (BOOL)tv_hasHeight;
- (BOOL)tv_hasWidth;
- (TVViewElementStyle)tv_associatedViewElementStyle;
- (double)tv_borderWidths;
- (double)tv_columnPadding;
- (double)tv_focusMargin;
- (double)tv_focusSizeIncrease;
- (double)tv_fontSize;
- (double)tv_height;
- (double)tv_imageUpscaleFactor;
- (double)tv_interitemSpacing;
- (double)tv_lineSpacing;
- (double)tv_margin;
- (double)tv_maxHeight;
- (double)tv_maxWidth;
- (double)tv_minHeight;
- (double)tv_minWidth;
- (double)tv_minimumScaleFactor;
- (double)tv_padding;
- (double)tv_scrollableBoundsInset;
- (double)tv_symbolPointSize;
- (double)tv_transitionInterval;
- (double)tv_width;
- (id)tv_styleMetrics;
- (id)tv_symbolTextStyle;
- (uint64_t)tv_acceptsFocus;
- (uint64_t)tv_adjustsFontSizeToFitWidth;
- (uint64_t)tv_alignment;
- (uint64_t)tv_backgroundColor;
- (uint64_t)tv_backgroundHighlightColor;
- (uint64_t)tv_backgroundHighlightStyle;
- (uint64_t)tv_borderColor;
- (uint64_t)tv_borderContinuous;
- (uint64_t)tv_borderRadius;
- (uint64_t)tv_color;
- (uint64_t)tv_columnColor;
- (uint64_t)tv_columnCount;
- (uint64_t)tv_contentAlignment;
- (uint64_t)tv_darkTintColor;
- (uint64_t)tv_edgeFlagForStyle:()TVMLKitAdditions;
- (uint64_t)tv_focusAlign;
- (uint64_t)tv_fontFamily;
- (uint64_t)tv_fontStretch;
- (uint64_t)tv_fontWeight;
- (uint64_t)tv_group;
- (uint64_t)tv_highlightColor;
- (uint64_t)tv_highlightStyle;
- (uint64_t)tv_imageTreatment;
- (uint64_t)tv_indexDisplayMode;
- (uint64_t)tv_layerFlipMode;
- (uint64_t)tv_maxLines;
- (uint64_t)tv_maxTextLines;
- (uint64_t)tv_overflow;
- (uint64_t)tv_position;
- (uint64_t)tv_progressStyle;
- (uint64_t)tv_ratingStyle;
- (uint64_t)tv_rowCount;
- (uint64_t)tv_scrollMode;
- (uint64_t)tv_searchStyle;
- (uint64_t)tv_shadow;
- (uint64_t)tv_symbolScale;
- (uint64_t)tv_symbolWeight;
- (uint64_t)tv_textAlignment;
- (uint64_t)tv_textHighlightStyle;
- (uint64_t)tv_textShadow;
- (uint64_t)tv_textStyle;
- (uint64_t)tv_textTransform;
- (uint64_t)tv_tintColor;
- (uint64_t)tv_tintColor2;
- (uint64_t)tv_transition;
- (uint64_t)tv_visualEffect;
- (void)tv_focusTransform;
- (void)tv_setStyleMetrics:()TVMLKitAdditions;
- (void)tv_textHyphenationFactor;
- (void)tv_transform;
@end

@implementation IKViewElementStyle(TVMLKitAdditions)

- (TVViewElementStyle)tv_associatedViewElementStyle
{
  objc_getAssociatedObject(a1, "TVAssociatedViewElementStyle");
  v2 = (TVViewElementStyle *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = [[TVViewElementStyle alloc] initWithStyle:a1];
    objc_setAssociatedObject(a1, "TVAssociatedViewElementStyle", v2, (void *)0x301);
  }
  return v2;
}

- (id)tv_styleMetrics
{
  return objc_getAssociatedObject(a1, sel_tv_styleMetrics);
}

- (void)tv_setStyleMetrics:()TVMLKitAdditions
{
  id value = a3;
  v4 = [value valuesByStyle];
  [a1 setOverridingValuesByStyle:v4];

  objc_setAssociatedObject(a1, sel_tv_styleMetrics, value, (void *)1);
}

- (uint64_t)tv_edgeFlagForStyle:()TVMLKitAdditions
{
  id v4 = a3;
  if ([a1 typeForStyle:v4] == 7)
  {
    v5 = objc_msgSend(a1, "tv_styleMetrics");
    v6 = [v5 valueForStyle:v4];

    if (v6) {
      uint64_t v7 = 15;
    }
    else {
      uint64_t v7 = [a1 edgeFlagForStyle:v4];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)tv_transform
{
  v3 = objc_msgSend(a1, "tv_valueForStyle:", @"transform");
  if (v3)
  {
    v6 = v3;
    [v3 CGAffineTransformValue];
    v3 = v6;
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F000D0];
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *a2 = *MEMORY[0x263F000D0];
    a2[1] = v5;
    a2[2] = *(_OWORD *)(v4 + 32);
  }
}

- (void)tv_focusTransform
{
  v3 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-focus-transform");
  if (v3)
  {
    v6 = v3;
    [v3 CGAffineTransformValue];
    v3 = v6;
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F000D0];
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *a2 = *MEMORY[0x263F000D0];
    a2[1] = v5;
    a2[2] = *(_OWORD *)(v4 + 32);
  }
}

- (uint64_t)tv_fontFamily
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"font-family");
}

- (double)tv_fontSize
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"font-size");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_height
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"height");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (BOOL)tv_hasHeight
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"height");
  BOOL v2 = v1 != 0;

  return v2;
}

- (double)tv_interitemSpacing
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-interitem-spacing");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_lineSpacing
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-line-spacing");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_maxHeight
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"max-height");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_maxWidth
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"max-width");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_minHeight
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"min-height");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_minWidth
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"min-width");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_transitionInterval
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-transition-interval");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_adjustsFontSizeToFitWidth
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-minimum-scale-factor");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (double)tv_minimumScaleFactor
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-minimum-scale-factor");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)tv_width
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"width");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (BOOL)tv_hasWidth
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"width");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)tv_backgroundColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"background-color");
}

- (uint64_t)tv_backgroundHighlightStyle
{
  return [a1 valueForStyle:@"tv-background-highlight-style"];
}

- (uint64_t)tv_backgroundHighlightColor
{
  return [a1 valueForStyle:@"tv-background-highlight-color"];
}

- (uint64_t)tv_borderColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"border-color");
}

- (uint64_t)tv_color
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"color");
}

- (uint64_t)tv_highlightColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-highlight-color");
}

- (uint64_t)tv_tintColor2
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-tint-color2");
}

- (uint64_t)tv_tintColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-tint-color");
}

- (uint64_t)tv_darkTintColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-dark-tint-color");
}

- (uint64_t)tv_columnColor
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-column-color");
}

- (double)tv_columnPadding
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-column-padding");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_textShadow
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"text-shadow");
}

- (uint64_t)tv_textTransform
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"text-transform");
}

- (uint64_t)tv_fontWeight
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"font-weight");
}

- (uint64_t)tv_fontStretch
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"font-stretch");
  double v2 = [v1 lowercaseString];

  if ([v2 isEqualToString:@"condensed"])
  {
    uint64_t v3 = 64;
  }
  else if ([v2 isEqualToString:@"expanded"])
  {
    uint64_t v3 = 32;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)tv_imageTreatment
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-img-treatment");
}

- (uint64_t)tv_textHighlightStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-text-highlight-style");
}

- (uint64_t)tv_textStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-text-style");
}

- (void)tv_textHyphenationFactor
{
  double v2 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-text-hyphenation-factor");

  if (v2)
  {
    uint64_t v3 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-text-hyphenation-factor");
    [v3 doubleValue];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v4 = [v3 preferredContentSizeCategory];
    _UIContentSizeCategoryIsAccessibilityContentSizeCategory();
  }
}

- (uint64_t)tv_transition
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-transition");
}

- (uint64_t)tv_ratingStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-rating-style");
}

- (uint64_t)tv_visualEffect
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-visual-effect");
}

- (uint64_t)tv_textAlignment
{
  if (tv_textAlignment_onceToken != -1) {
    dispatch_once(&tv_textAlignment_onceToken, &__block_literal_global_46);
  }
  double v2 = objc_msgSend(a1, "tv_valueForStyle:", @"text-align");
  if (v2)
  {
    uint64_t v3 = [(id)tv_textAlignment_sAlignmentKeysMap objectForKeyedSubscript:v2];
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 4;
  }

  return v4;
}

- (uint64_t)tv_columnCount
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"column-count");
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)tv_rowCount
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"row-count");
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)tv_maxTextLines
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-text-max-lines");
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)tv_alignment
{
  if (tv_alignment_onceToken != -1) {
    dispatch_once(&tv_alignment_onceToken, &__block_literal_global_492);
  }
  uint64_t v2 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-align");
  if ([v2 length])
  {
    uint64_t v3 = [(id)tv_alignment_sAlignmentKeysMap objectForKeyedSubscript:v2];
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_position
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-position");
  if (tv_position_onceToken != -1) {
    dispatch_once(&tv_position_onceToken, &__block_literal_global_502);
  }
  if ([v1 length])
  {
    uint64_t v2 = [(id)tv_position_sPositionKeysMap objectForKeyedSubscript:v1];
    uint64_t v3 = [v2 unsignedIntegerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (double)tv_borderWidths
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"border-width");
  [v1 UIEdgeInsetsValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_borderRadius
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"border-radius");
}

- (uint64_t)tv_borderContinuous
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-border-continuous");
  uint64_t v2 = [v1 isEqualToString:@"true"];

  return v2;
}

- (double)tv_margin
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"margin");
  [v1 UIEdgeInsetsValue];
  double v3 = v2;

  return v3;
}

- (BOOL)tv_hasFocusMargin
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-focus-margin");
  BOOL v2 = v1 != 0;

  return v2;
}

- (double)tv_focusMargin
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-focus-margin");
  [v1 UIEdgeInsetsValue];
  double v3 = v2;

  return v3;
}

- (double)tv_padding
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"padding");
  [v1 UIEdgeInsetsValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_contentAlignment
{
  if (tv_contentAlignment_onceToken != -1) {
    dispatch_once(&tv_contentAlignment_onceToken, &__block_literal_global_567);
  }
  double v2 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-content-align");
  if ([v2 length])
  {
    double v3 = [(id)tv_contentAlignment_sAlignmentKeysMap objectForKeyedSubscript:v2];
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_searchStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-search-style");
}

- (double)tv_imageUpscaleFactor
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-img-upscale-factor");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_shadow
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-shadow");
}

- (uint64_t)tv_focusAlign
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-focus-align");
}

- (double)tv_focusSizeIncrease
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-focus-size-increase");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_progressStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-progress-style");
}

- (uint64_t)tv_overflow
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-overflow");
}

- (uint64_t)tv_acceptsFocus
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-accepts-focus");
  double v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)tv_highlightStyle
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-highlight-style");
}

- (uint64_t)tv_scrollMode
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-scroll-mode");
}

- (double)tv_scrollableBoundsInset
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-scrollable-bounds-inset");
  [v1 UIEdgeInsetsValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_layerFlipMode
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-layer-flip-mode");
}

- (uint64_t)tv_indexDisplayMode
{
  v1 = [a1 valueForStyle:@"tv-index-display"];
  if ([v1 isEqualToString:@"hidden"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"visible"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)tv_maxLines
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-max-lines");
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)tv_group
{
  return objc_msgSend(a1, "tv_valueForStyle:", @"tv-group");
}

- (double)tv_symbolPointSize
{
  v1 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-symbol-point-size");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_symbolWeight
{
  if (tv_symbolWeight_onceToken != -1) {
    dispatch_once(&tv_symbolWeight_onceToken, &__block_literal_global_569);
  }
  double v2 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-symbol-weight");
  if ([v2 length])
  {
    double v3 = [(id)tv_symbolWeight_sSymbolWeightMap objectForKeyedSubscript:v2];
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_symbolScale
{
  if (tv_symbolScale_onceToken != -1) {
    dispatch_once(&tv_symbolScale_onceToken, &__block_literal_global_571);
  }
  double v2 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-symbol-scale");
  if ([v2 length])
  {
    double v3 = [(id)tv_symbolScale_sSymbolScaleMap objectForKeyedSubscript:v2];
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)tv_symbolTextStyle
{
  if (tv_symbolTextStyle_onceToken != -1) {
    dispatch_once(&tv_symbolTextStyle_onceToken, &__block_literal_global_581);
  }
  double v2 = objc_msgSend(a1, "tv_valueForStyle:", @"tv-symbol-text-style");
  if ([v2 length])
  {
    double v3 = [(id)tv_symbolTextStyle_sSymbolTextStyleMap objectForKeyedSubscript:v2];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

@end