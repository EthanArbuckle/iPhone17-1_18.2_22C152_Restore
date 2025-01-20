@interface UIKeyboardCameraGrabberView
- (UIKeyboardCameraGrabberView)init;
@end

@implementation UIKeyboardCameraGrabberView

- (UIKeyboardCameraGrabberView)init
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)UIKeyboardCameraGrabberView;
  v2 = [(UIView *)&v24 init];
  if (v2)
  {
    v3 = [UIVisualEffectView alloc];
    v4 = +[UIBlurEffect effectWithStyle:1];
    uint64_t v5 = [(UIVisualEffectView *)v3 initWithEffect:v4];
    blurView = v2->_blurView;
    v2->_blurView = (UIVisualEffectView *)v5;

    [(UIView *)v2->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(UIView *)v2->_blurView layer];
    [v7 setMasksToBounds:1];

    v8 = [(UIView *)v2->_blurView layer];
    [v8 setCornerRadius:2.5];

    [(UIView *)v2->_blurView setUserInteractionEnabled:0];
    [(UIView *)v2 addSubview:v2->_blurView];
    v21 = (void *)MEMORY[0x1E4F5B268];
    v23 = [(UIView *)v2->_blurView topAnchor];
    v22 = [(UIView *)v2 topAnchor];
    v9 = [v23 constraintEqualToAnchor:v22 constant:10.0];
    v25[0] = v9;
    v10 = [(UIView *)v2->_blurView centerXAnchor];
    v11 = [(UIView *)v2 centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v25[1] = v12;
    v13 = [(UIView *)v2->_blurView widthAnchor];
    v14 = [v13 constraintEqualToConstant:36.0];
    v25[2] = v14;
    v15 = [(UIView *)v2->_blurView heightAnchor];
    v16 = [v15 constraintEqualToConstant:5.0];
    v25[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    [v21 activateConstraints:v17];

    v18 = +[UIColor blackColor];
    v19 = [v18 colorWithAlphaComponent:0.01];
    [(UIView *)v2 setBackgroundColor:v19];
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end