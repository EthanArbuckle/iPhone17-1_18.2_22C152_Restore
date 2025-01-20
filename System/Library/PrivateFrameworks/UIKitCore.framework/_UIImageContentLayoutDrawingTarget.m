@interface _UIImageContentLayoutDrawingTarget
+ (id)targetWithSize:(double)a3 scale:;
- (BOOL)_hasContentGravity;
- (BOOL)_layoutShouldFlipHorizontalOrientations;
- (BOOL)_supportsContents;
- (CGRect)bounds;
- (UIEdgeInsets)_additionalAlignmentRectInsetsForRenderingSource:(id)a3;
- (UITraitCollection)traitCollection;
- (double)preferredContentScaleFactor;
- (id)_renditionForSource:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5 withRenditionResult:(id)a6;
- (id)_symbolConfigurationForSource:(id)a3;
- (int64_t)_effectiveRenderingModeForSource:(id)a3 symbolConfiguration:(id)a4;
- (int64_t)contentMode;
- (int64_t)semanticContentAttribute;
@end

@implementation _UIImageContentLayoutDrawingTarget

- (double)preferredContentScaleFactor
{
  return self->_preferredContentScaleFactor;
}

- (int64_t)contentMode
{
  return 0;
}

- (int64_t)semanticContentAttribute
{
  return 0;
}

- (id)_symbolConfigurationForSource:(id)a3
{
  return (id)[a3 symbolConfiguration];
}

- (BOOL)_supportsContents
{
  return 0;
}

- (BOOL)_layoutShouldFlipHorizontalOrientations
{
  return 1;
}

- (UIEdgeInsets)_additionalAlignmentRectInsetsForRenderingSource:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (id)targetWithSize:(double)a3 scale:
{
  self;
  uint64_t v6 = objc_opt_new();
  if (v6)
  {
    *(_OWORD *)(v6 + 16) = *MEMORY[0x1E4F1DAD8];
    *(double *)(v6 + 32) = a1;
    *(double *)(v6 + 40) = a2;
    *(double *)(v6 + 8) = a3;
  }
  return (id)v6;
}

- (id)_renditionForSource:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5 withRenditionResult:(id)a6
{
  id v9 = a3;
  v10 = a5;
  id v11 = a6;
  v12 = [v9 _colorForFlattening];
  if (!v12)
  {
    if (-[_UIImageContentLayoutDrawingTarget _effectiveRenderingModeForSource:symbolConfiguration:](self, "_effectiveRenderingModeForSource:symbolConfiguration:", v9, v10) == 2&& (![v10 _hasSpecifiedHierarchicalColors]|| (objc_msgSend(v9, "_isHierarchicalColorSymbolImage") & 1) == 0))
    {
      if ([v10 _hasSpecifiedPaletteColors])
      {
        v13 = [v10 _colors];
        if ((unint64_t)[v13 count] > 1)
        {
          char v14 = [v9 _isPaletteColorSymbolImage];

          v12 = 0;
          if (!v10 || (v14 & 1) != 0) {
            goto LABEL_15;
          }
          goto LABEL_12;
        }
      }
      if (v10)
      {
LABEL_12:
        if (v10[7])
        {
          v15 = [v10 _colors];
          v12 = [v15 firstObject];

          goto LABEL_15;
        }
      }
    }
    v12 = 0;
  }
LABEL_15:
  v16 = +[_UIImageContentRendition renditionWithResult:color:]((uint64_t)_UIImageContentRendition, v11, v12);

  return v16;
}

- (int64_t)_effectiveRenderingModeForSource:(id)a3 symbolConfiguration:(id)a4
{
  return [a3 _effectiveRenderingModeWithSymbolConfiguration:a4];
}

- (BOOL)_hasContentGravity
{
  return 0;
}

- (UITraitCollection)traitCollection
{
  return +[UITraitCollection currentTraitCollection];
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end