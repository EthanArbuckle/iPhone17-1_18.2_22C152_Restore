@interface VKKeyboardCameraCloseButton
- (CGSize)intrinsicContentSize;
- (UIButton)uiButton;
- (VKKeyboardCameraCloseButton)initWithFrame:(CGRect)a3;
- (id)viewForFirstBaselineLayout;
- (void)layoutSubviews;
@end

@implementation VKKeyboardCameraCloseButton

- (VKKeyboardCameraCloseButton)initWithFrame:(CGRect)a3
{
  v38[8] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)VKKeyboardCameraCloseButton;
  v3 = -[VKKeyboardCameraCloseButton initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F427E0] buttonWithType:7];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button setAlpha:0.85];
    [(UIButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = objc_alloc(MEMORY[0x1E4F43028]);
    v7 = [MEMORY[0x1E4F427D8] effectWithStyle:1];
    uint64_t v8 = [v6 initWithEffect:v7];
    effectView = v3->_effectView;
    v3->_effectView = (UIVisualEffectView *)v8;

    [(UIVisualEffectView *)v3->_effectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VKKeyboardCameraCloseButton *)v3 addSubview:v3->_effectView];
    [(VKKeyboardCameraCloseButton *)v3 addSubview:v3->_button];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(UIVisualEffectView *)v3->_effectView leadingAnchor];
    v35 = [(VKKeyboardCameraCloseButton *)v3 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v38[0] = v34;
    v33 = [(UIVisualEffectView *)v3->_effectView bottomAnchor];
    v32 = [(VKKeyboardCameraCloseButton *)v3 bottomAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v38[1] = v31;
    v30 = [(UIVisualEffectView *)v3->_effectView topAnchor];
    v29 = [(VKKeyboardCameraCloseButton *)v3 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v38[2] = v28;
    v26 = [(UIVisualEffectView *)v3->_effectView trailingAnchor];
    v25 = [(VKKeyboardCameraCloseButton *)v3 trailingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v38[3] = v24;
    v23 = [(UIButton *)v3->_button leadingAnchor];
    v22 = [(UIVisualEffectView *)v3->_effectView leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v38[4] = v21;
    v20 = [(UIButton *)v3->_button bottomAnchor];
    v10 = [(VKKeyboardCameraCloseButton *)v3 bottomAnchor];
    v11 = [v20 constraintEqualToAnchor:v10];
    v38[5] = v11;
    v12 = [(UIButton *)v3->_button topAnchor];
    v13 = [(VKKeyboardCameraCloseButton *)v3 topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v38[6] = v14;
    v15 = [(UIButton *)v3->_button trailingAnchor];
    v16 = [(VKKeyboardCameraCloseButton *)v3 trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v38[7] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:8];
    [v27 activateConstraints:v18];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(UIButton *)self->_button intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_button;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKKeyboardCameraCloseButton;
  [(VKKeyboardCameraCloseButton *)&v3 layoutSubviews];
  [(UIButton *)self->_button bounds];
  [(UIVisualEffectView *)self->_effectView _setContinuousCornerRadius:CGRectGetWidth(v4) * 0.5];
}

- (UIButton)uiButton
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end