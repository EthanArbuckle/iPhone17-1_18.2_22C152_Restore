@interface _UIPickerViewStyle
- (BOOL)highlightViewIsOverlay;
- (BOOL)sizeIsValid:(CGSize)a3;
- (CATransform3D)perspectiveTransform;
- (CATransform3D)transformForCellAtY:(SEL)a3 inBounds:(double)a4 rowHeight:(CGRect)a5 selectionBarRect:(double)a6;
- (CGSize)defaultSizeForTraitCollection:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forTraitCollection:(id)a4;
- (UIEdgeInsets)columnContentEdgeInsets;
- (double)columnHighlightCornerRadius;
- (double)defaultRowHeightForSize:(CGSize)a3;
- (double)horizontalBiasForEndTablesWithColumnFrame:(CGRect)a3 tableFrame:(CGRect)a4;
- (double)horizontalPaddingForCenterHighlightView;
- (double)horizontalPaddingForContents;
- (double)labelSideOffset;
- (double)paddingAroundWheels;
- (double)paddingBetweenWheels;
- (double)selectionBarSideInset;
- (double)verticalPaddingForCenterHighlightView;
- (id)centerCellDigitFontWithTraitCollection:(id)a3;
- (id)centerCellFontWithTraitCollection:(id)a3;
- (id)createCenterHighlightView;
- (id)nonCenterCellDigitFontWithTraitCollection:(id)a3;
- (id)nonCenterCellFontWithTraitCollection:(id)a3;
- (id)selectionFeedbackGeneratorConfiguration;
- (void)_resetFontCacheForLegibilityWeightIfNeeded:(int64_t)a3;
- (void)configureMaskGradientLayer:(id)a3;
- (void)setHighlightViewIsOverlay:(BOOL)a3;
@end

@implementation _UIPickerViewStyle

- (CGSize)defaultSizeForTraitCollection:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forTraitCollection:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)sizeIsValid:(CGSize)a3
{
  return 1;
}

- (double)defaultRowHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (double)paddingBetweenWheels
{
  return 0.0;
}

- (double)paddingAroundWheels
{
  return 0.0;
}

- (CATransform3D)perspectiveTransform
{
  double v3 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v4;
  long long v5 = v3[7];
  *(_OWORD *)&retstr->m41 = v3[6];
  *(_OWORD *)&retstr->m43 = v5;
  long long v6 = v3[1];
  *(_OWORD *)&retstr->m11 = *v3;
  *(_OWORD *)&retstr->m13 = v6;
  long long v7 = v3[3];
  *(_OWORD *)&retstr->m21 = v3[2];
  *(_OWORD *)&retstr->m23 = v7;
  return self;
}

- (CATransform3D)transformForCellAtY:(SEL)a3 inBounds:(double)a4 rowHeight:(CGRect)a5 selectionBarRect:(double)a6
{
  long long v7 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v8;
  long long v9 = v7[7];
  *(_OWORD *)&retstr->m41 = v7[6];
  *(_OWORD *)&retstr->m43 = v9;
  long long v10 = v7[1];
  *(_OWORD *)&retstr->m11 = *v7;
  *(_OWORD *)&retstr->m13 = v10;
  long long v11 = v7[3];
  *(_OWORD *)&retstr->m21 = v7[2];
  *(_OWORD *)&retstr->m23 = v11;
  return self;
}

- (double)horizontalBiasForEndTablesWithColumnFrame:(CGRect)a3 tableFrame:(CGRect)a4
{
  return 0.0;
}

- (void)configureMaskGradientLayer:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor blackColor];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
}

- (id)createCenterHighlightView
{
  return 0;
}

- (double)horizontalPaddingForCenterHighlightView
{
  return 0.0;
}

- (double)verticalPaddingForCenterHighlightView
{
  return 0.0;
}

- (double)horizontalPaddingForContents
{
  return 0.0;
}

- (double)selectionBarSideInset
{
  return 0.0;
}

- (double)labelSideOffset
{
  return 0.0;
}

- (id)selectionFeedbackGeneratorConfiguration
{
  return +[_UISelectionFeedbackGeneratorConfiguration pickerConfiguration];
}

- (UIEdgeInsets)columnContentEdgeInsets
{
  double v2 = -1.0;
  double v3 = -1.0;
  double v4 = -1.0;
  double v5 = -1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)columnHighlightCornerRadius
{
  return 0.0;
}

- (void)_resetFontCacheForLegibilityWeightIfNeeded:(int64_t)a3
{
  if (_MergedGlobals_1309 != a3)
  {
    double v3 = (void *)qword_1EB264EA0;
    _MergedGlobals_1309 = a3;
    qword_1EB264EA0 = 0;

    double v4 = (void *)qword_1EB264EA8;
    qword_1EB264EA8 = 0;

    double v5 = (void *)qword_1EB264EB0;
    qword_1EB264EB0 = 0;

    long long v6 = (void *)qword_1EB264EB8;
    qword_1EB264EB8 = 0;
  }
}

- (id)centerCellFontWithTraitCollection:(id)a3
{
  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", [a3 legibilityWeight]);
  double v3 = (void *)qword_1EB264EA0;
  if (!qword_1EB264EA0)
  {
    uint64_t v4 = [off_1E52D39B8 systemFontOfSize:23.5];
    double v5 = (void *)qword_1EB264EA0;
    qword_1EB264EA0 = v4;

    double v3 = (void *)qword_1EB264EA0;
  }
  return v3;
}

- (id)nonCenterCellFontWithTraitCollection:(id)a3
{
  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", [a3 legibilityWeight]);
  double v3 = (void *)qword_1EB264EA8;
  if (!qword_1EB264EA8)
  {
    uint64_t v4 = [off_1E52D39B8 systemFontOfSize:21.0];
    double v5 = (void *)qword_1EB264EA8;
    qword_1EB264EA8 = v4;

    double v3 = (void *)qword_1EB264EA8;
  }
  return v3;
}

- (id)centerCellDigitFontWithTraitCollection:(id)a3
{
  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", [a3 legibilityWeight]);
  double v3 = (void *)qword_1EB264EB0;
  if (!qword_1EB264EB0)
  {
    uint64_t v4 = [off_1E52D39B8 monospacedDigitSystemFontOfSize:23.5 weight:*(double *)off_1E52D6BF8];
    double v5 = (void *)qword_1EB264EB0;
    qword_1EB264EB0 = v4;

    double v3 = (void *)qword_1EB264EB0;
  }
  return v3;
}

- (id)nonCenterCellDigitFontWithTraitCollection:(id)a3
{
  -[_UIPickerViewStyle _resetFontCacheForLegibilityWeightIfNeeded:](self, "_resetFontCacheForLegibilityWeightIfNeeded:", [a3 legibilityWeight]);
  double v3 = (void *)qword_1EB264EB8;
  if (!qword_1EB264EB8)
  {
    uint64_t v4 = [off_1E52D39B8 monospacedDigitSystemFontOfSize:21.0 weight:*(double *)off_1E52D6BF8];
    double v5 = (void *)qword_1EB264EB8;
    qword_1EB264EB8 = v4;

    double v3 = (void *)qword_1EB264EB8;
  }
  return v3;
}

- (BOOL)highlightViewIsOverlay
{
  return 1;
}

- (void)setHighlightViewIsOverlay:(BOOL)a3
{
  self->_highlightViewIsOverlay = a3;
}

@end