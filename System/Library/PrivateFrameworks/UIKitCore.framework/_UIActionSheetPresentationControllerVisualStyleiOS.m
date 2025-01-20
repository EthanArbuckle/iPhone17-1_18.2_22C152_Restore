@interface _UIActionSheetPresentationControllerVisualStyleiOS
- (UIActionSheetiOSDismissActionView)dismissActionView;
- (UIColor)dimmingViewColor;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (_UIActionSheetPresentationControllerVisualStyleiOS)init;
- (double)cornerRadius;
- (double)dismissToContentSpacing;
- (void)setDismissActionView:(id)a3;
@end

@implementation _UIActionSheetPresentationControllerVisualStyleiOS

- (_UIActionSheetPresentationControllerVisualStyleiOS)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIActionSheetPresentationControllerVisualStyleiOS;
  v2 = [(_UIActionSheetPresentationControllerVisualStyleiOS *)&v7 init];
  if (v2)
  {
    v3 = [UIActionSheetiOSDismissActionView alloc];
    [(_UIActionSheetPresentationControllerVisualStyleiOS *)v2 cornerRadius];
    uint64_t v4 = -[UIActionSheetiOSDismissActionView initWithContinuousCornerRadius:](v3, "initWithContinuousCornerRadius:");
    dismissActionView = v2->_dismissActionView;
    v2->_dismissActionView = (UIActionSheetiOSDismissActionView *)v4;
  }
  return v2;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 8.0, 8.0, 8.0, 8.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)dismissToContentSpacing
{
  return 8.0;
}

- (UIColor)dimmingViewColor
{
  return (UIColor *)+[UIColor _alertControllerDimmingViewColor];
}

- (double)cornerRadius
{
  return 13.0;
}

- (UIActionSheetiOSDismissActionView)dismissActionView
{
  return self->_dismissActionView;
}

- (void)setDismissActionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end