@interface UIStatusBarCarPlayRecordingTimeItemView
- (BOOL)allowsUserInteraction;
- (BOOL)canBecomeFocused;
- (BOOL)showsTouchWhenHighlighted;
- (BOOL)usesAdvancedActions;
- (CGRect)_pillFrame;
- (UIStatusBarCarPlayRecordingTimeItemView)initWithFrame:(CGRect)a3;
- (double)extraRightPadding;
- (int64_t)buttonType;
- (int64_t)textStyle;
- (void)_updatePillFrame;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)movedToSuperview:(id)a3;
- (void)removeFromSuperview;
- (void)setFrame:(CGRect)a3;
@end

@implementation UIStatusBarCarPlayRecordingTimeItemView

- (UIStatusBarCarPlayRecordingTimeItemView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_UIStatusBarRoundedCornerView alloc];
    uint64_t v5 = -[_UIStatusBarRoundedCornerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    pillView = v3->_pillView;
    v3->_pillView = (_UIStatusBarRoundedCornerView *)v5;

    v7 = v3->_pillView;
    v8 = +[UIColor externalSystemRedColor];
    [(UIView *)v7 setBackgroundColor:v8];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIStatusBarCarPlayRecordingTimeItemView *)self _updatePillFrame];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  [(UIStatusBarButtonActionItemView *)&v3 layoutSubviews];
  [(UIStatusBarCarPlayRecordingTimeItemView *)self _updatePillFrame];
}

- (void)movedToSuperview:(id)a3
{
  [a3 insertSubview:self->_pillView below:self];
  pillView = self->_pillView;
  [(UIStatusBarCarPlayRecordingTimeItemView *)self _pillFrame];
  -[UIView setFrame:](pillView, "setFrame:");
}

- (void)removeFromSuperview
{
  [(UIView *)self->_pillView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  [(UIView *)&v3 removeFromSuperview];
}

- (BOOL)showsTouchWhenHighlighted
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)allowsUserInteraction
{
  return 1;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  id v6 = a3;
  [(UIStatusBarButtonActionItemView *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  objc_msgSend(v6, "nextFocusedItem", v11.receiver, v11.super_class);
  v7 = (UIStatusBarCarPlayRecordingTimeItemView *)objc_claimAutoreleasedReturnValue();

  pillView = self->_pillView;
  if (v7 == self)
  {
    uint64_t v9 = +[UIColor externalSystemTealColor];
  }
  else
  {
    if (!pillView) {
      return;
    }
    uint64_t v9 = +[UIColor externalSystemRedColor];
  }
  objc_super v10 = (void *)v9;
  [(UIView *)pillView setBackgroundColor:v9];
}

- (int64_t)buttonType
{
  return 5;
}

- (int64_t)textStyle
{
  return 5;
}

- (double)extraRightPadding
{
  return -2.0;
}

- (CGRect)_pillFrame
{
  [(UIView *)self frame];
  double v4 = v3 + -4.0;
  [(UIView *)self frame];
  double v9 = round(v8 + v7 * 0.5 + -8.0);
  double v10 = round(v6 + v5 * 0.5 - v4 * 0.5);
  double v11 = 16.0;
  double v12 = v4;
  result.size.height = v11;
  result.size.width = v12;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (void)_updatePillFrame
{
  pillView = self->_pillView;
  [(UIStatusBarCarPlayRecordingTimeItemView *)self _pillFrame];
  -[UIView setFrame:](pillView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end