@interface UISegmentedControlDefaultStyleProvider
- (BOOL)animateSlidingSelectionByDefault;
- (BOOL)hasShadowWithSelectedSegmentEffect;
- (BOOL)hasTransparentBackgroundByDefault;
- (BOOL)limitInternalLayoutAndInteractionToDefaultHeight;
- (BOOL)maskToCornerRadius;
- (BOOL)supportsAXPopover;
- (BOOL)supportsDynamicTypeByDefault;
- (BOOL)useGeneratedImages;
- (BOOL)useSelectionIndicatorStyling;
- (BOOL)useTVStyleFocusSelection;
- (BOOL)usesContinuousCurveCorners;
- (UIBlurEffect)selectedSegmentDefaultBlurEffect;
- (UIColor)defaultBackgroundTintColor;
- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4;
- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4 traitCollection:(id)a5;
- (UIEdgeInsets)contentInsetsForControlSize:(int)a3 position:(unsigned int)a4 bounds:(CGRect)a5 traitCollection:(id)a6;
- (UIVibrancyEffect)selectedSegmentContentDefaultVibrancyEffect;
- (UIVibrancyEffect)selectedSegmentDefaultVibrancyEffect;
- (UIVibrancyEffect)unselectedSegmentContentDefaultVibrancyEffect;
- (double)cornerRadiusForControlSize:(int)a3;
- (double)defaultContentPaddingWidth;
- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4;
- (double)defaultInterSegmentSpacing;
- (double)defaultTextContentPaddingWidth;
- (double)dividerWidthForControlSize:(int)a3;
- (double)mostlyInsideMargin;
- (double)segmentHidingFinalScaleFactor;
- (double)segmentSelectionScaleFactor;
- (double)selectionIndicatorInsetForControlSize:(int)a3;
- (id)createBackdropView;
- (id)createSegmentBezelView;
- (id)createSelectedSegmentEffectShadowView;
- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6;
- (id)fontForControlSize:(int)a3 selected:(BOOL)a4;
@end

@implementation UISegmentedControlDefaultStyleProvider

- (double)cornerRadiusForControlSize:(int)a3
{
  double result = 8.0;
  if (a3 == 1) {
    return 6.0;
  }
  return result;
}

- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4
{
  double result = 32.0;
  if (a3 == 1) {
    return 26.0;
  }
  return result;
}

- (double)defaultContentPaddingWidth
{
  return 9.0;
}

- (BOOL)animateSlidingSelectionByDefault
{
  return 1;
}

- (UIVibrancyEffect)unselectedSegmentContentDefaultVibrancyEffect
{
  return 0;
}

- (UIVibrancyEffect)selectedSegmentContentDefaultVibrancyEffect
{
  return 0;
}

- (BOOL)useTVStyleFocusSelection
{
  return 0;
}

- (double)dividerWidthForControlSize:(int)a3
{
  return 1.0;
}

- (BOOL)useSelectionIndicatorStyling
{
  return 1;
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  if (a4)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(a3, "_disabledColor", v6);
  }
  return v8;
}

- (double)selectionIndicatorInsetForControlSize:(int)a3
{
  return 2.0;
}

- (BOOL)limitInternalLayoutAndInteractionToDefaultHeight
{
  return 0;
}

- (double)defaultTextContentPaddingWidth
{
  return 4.0;
}

- (UIEdgeInsets)contentInsetsForControlSize:(int)a3 position:(unsigned int)a4 bounds:(CGRect)a5 traitCollection:(id)a6
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (BOOL)useGeneratedImages
{
  return 1;
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  v18[3] = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  if (a3 <= 2) {
    double v4 = dbl_186B9DCC8[a3];
  }
  v5 = (double *)off_1E52D6BF0;
  if (!a4) {
    v5 = (double *)off_1E52D6BF8;
  }
  double v6 = *v5;
  uint64_t v7 = *(void *)off_1E52D6BD0;
  v18[0] = *(void *)off_1E52D6BC0;
  uint64_t v8 = *(void *)off_1E52D6C08;
  v17[0] = v7;
  v17[1] = v8;
  double v9 = [NSNumber numberWithDouble:v6];
  v17[2] = *MEMORY[0x1E4F24578];
  v18[1] = v9;
  v18[2] = &unk_1ED3F7278;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  uint64_t v15 = *(void *)off_1E52D6B98;
  v16 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v12 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v11];

  v13 = [off_1E52D39B8 fontWithDescriptor:v12 size:v4];

  return v13;
}

- (BOOL)usesContinuousCurveCorners
{
  return 1;
}

- (BOOL)hasShadowWithSelectedSegmentEffect
{
  return 0;
}

- (id)createSegmentBezelView
{
  return 0;
}

- (BOOL)supportsDynamicTypeByDefault
{
  return 0;
}

- (UIVibrancyEffect)selectedSegmentDefaultVibrancyEffect
{
  return 0;
}

- (UIBlurEffect)selectedSegmentDefaultBlurEffect
{
  return 0;
}

- (BOOL)hasTransparentBackgroundByDefault
{
  return 0;
}

- (double)defaultInterSegmentSpacing
{
  return 0.0;
}

- (UIColor)defaultBackgroundTintColor
{
  return 0;
}

- (id)createBackdropView
{
  return 0;
}

- (double)segmentHidingFinalScaleFactor
{
  return 0.88;
}

- (double)segmentSelectionScaleFactor
{
  return 0.95;
}

- (BOOL)supportsAXPopover
{
  return 1;
}

- (id)createSelectedSegmentEffectShadowView
{
  return 0;
}

- (double)mostlyInsideMargin
{
  return 70.0;
}

- (BOOL)maskToCornerRadius
{
  return 1;
}

- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4
{
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 1.0;
  double v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4 traitCollection:(id)a5
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 1.0;
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

@end