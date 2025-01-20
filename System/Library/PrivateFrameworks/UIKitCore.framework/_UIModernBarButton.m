@interface _UIModernBarButton
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
- (BOOL)_guardAgainstDegenerateBaselineCalculation;
- (BOOL)_likelyToHaveTitle;
- (BOOL)_shouldAdjustToTraitCollection;
- (BOOL)_supportsMacIdiom;
- (CGRect)_selectedIndicatorBounds;
- (CGRect)contentRectForBounds:(CGRect)a3;
- (CGSize)_roundSize:(CGSize)a3;
- (UIEdgeInsets)_additionalSelectionInsets;
- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3;
- (void)_setGuardAgainstDegenerateBaselineCalculation:(BOOL)a3;
- (void)_setupForUseAsImageButton;
- (void)didMoveToWindow;
@end

@implementation _UIModernBarButton

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIModernBarButton;
  [(UIView *)&v4 didMoveToWindow];
  v3 = [(UIView *)self window];

  if (!v3) {
    [(UIButton *)self setHighlighted:0];
  }
}

- (BOOL)_shouldAdjustToTraitCollection
{
  int v2 = dyld_program_sdk_at_least();
  if (v2)
  {
    LOBYTE(v2) = _UIBarsUseDynamicType();
  }
  return v2;
}

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  if (a3.size.width == *MEMORY[0x1E4F1DB30] && a3.size.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIModernBarButton;
    -[UIButton contentRectForBounds:](&v8, sel_contentRectForBounds_, a3.origin.x, a3.origin.y);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)_guardAgainstDegenerateBaselineCalculation
{
  v3 = [(UIButton *)self _imageView];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char guardAgainstDegenerateBaselineCalculation = [v3 _guardAgainstDegenerateBaselineCalculation];
  }
  else {
    char guardAgainstDegenerateBaselineCalculation = self->_guardAgainstDegenerateBaselineCalculation;
  }

  return guardAgainstDegenerateBaselineCalculation;
}

- (BOOL)_likelyToHaveTitle
{
  return 0;
}

- (void)_setGuardAgainstDegenerateBaselineCalculation:(BOOL)a3
{
  BOOL v3 = a3;
  self->_char guardAgainstDegenerateBaselineCalculation = a3;
  id v4 = [(UIButton *)self _imageView];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 _setGuardAgainstDegenerateBaselineCalculation:v3];
    }
  }
}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  self->__additionalSelectionInsets = a3;
}

- (CGSize)_roundSize:(CGSize)a3
{
  UICeilToViewScale(self);
  double v5 = v4;
  UICeilToViewScale(self);
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_setupForUseAsImageButton
{
  v12[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIButton *)self imageView];
  double v4 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
  double v5 = [(UIView *)self traitCollection];
  double v6 = [v4 configurationWithTraitCollection:v5];
  [v3 _setOverridingSymbolConfiguration:v6];

  v12[0] = 0x1ED3F5AD8;
  v12[1] = 0x1ED3F5B38;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47___UIModernBarButton__setupForUseAsImageButton__block_invoke;
  v10[3] = &unk_1E52DDAC8;
  id v11 = v3;
  id v8 = v3;
  id v9 = [(UIView *)self _registerForTraitTokenChanges:v7 withHandler:v10];
}

- (CGRect)_selectedIndicatorBounds
{
  [(_UIModernBarButton *)self _additionalSelectionInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v19.receiver = self;
  v19.super_class = (Class)_UIModernBarButton;
  [(UIButton *)&v19 _selectedIndicatorBounds];
  double v12 = v6 + v11;
  double v14 = v13 - (v10 + v6);
  double v16 = v4 + v15;
  double v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v14;
  result.origin.y = v16;
  result.origin.x = v12;
  return result;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top = self->__additionalSelectionInsets.top;
  double left = self->__additionalSelectionInsets.left;
  double bottom = self->__additionalSelectionInsets.bottom;
  double right = self->__additionalSelectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end