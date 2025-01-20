@interface _UIToolbarVisualProvider
+ (BOOL)shouldDecodeSubviews;
- (BOOL)toolbarIsSmall;
- (BOOL)useModernAppearance;
- (CGRect)backgroundFrame;
- (CGSize)defaultSizeForOrientation:(int64_t)a3;
- (NSDirectionalEdgeInsets)contentViewMargins;
- (UIToolbar)toolbar;
- (UIView)currentBackgroundView;
- (UIView)customBackgroundView;
- (_UIBarAppearanceChangeObserver)appearanceObserver;
- (_UIToolbarVisualProvider)initWithToolbar:(id)a3;
- (double)backgroundTransitionProgress;
- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4;
- (int64_t)itemDistribution;
- (void)setCustomBackgroundView:(id)a3;
@end

@implementation _UIToolbarVisualProvider

- (_UIToolbarVisualProvider)initWithToolbar:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIToolbarVisualProvider;
  result = [(_UIToolbarVisualProvider *)&v5 init];
  if (result) {
    result->_toolbar = (UIToolbar *)a3;
  }
  return result;
}

- (CGRect)backgroundFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)useModernAppearance
{
  return 0;
}

- (_UIBarAppearanceChangeObserver)appearanceObserver
{
  return 0;
}

- (double)backgroundTransitionProgress
{
  return 0.0;
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v4 = a4;
  return v4;
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)toolbarIsSmall
{
  return 0;
}

- (int64_t)itemDistribution
{
  return 0;
}

+ (BOOL)shouldDecodeSubviews
{
  return 1;
}

- (NSDirectionalEdgeInsets)contentViewMargins
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (UIView)customBackgroundView
{
  return self->_customBackgroundView;
}

- (void)setCustomBackgroundView:(id)a3
{
}

- (UIView)currentBackgroundView
{
  return self->_currentBackgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBackgroundView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
}

@end