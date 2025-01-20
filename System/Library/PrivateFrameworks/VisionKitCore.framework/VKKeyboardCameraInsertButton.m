@interface VKKeyboardCameraInsertButton
- (CGSize)intrinsicContentSize;
- (UIButton)uiButton;
- (VKKeyboardCameraInsertButton)initWithPrimaryAction:(id)a3;
- (id)viewForFirstBaselineLayout;
@end

@implementation VKKeyboardCameraInsertButton

- (VKKeyboardCameraInsertButton)initWithPrimaryAction:(id)a3
{
  v51[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)VKKeyboardCameraInsertButton;
  v5 = [(VKKeyboardCameraInsertButton *)&v50 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
    objc_msgSend(v6, "setContentInsets:", 12.0, 25.0, 12.0, 25.0);
    v48 = v6;
    v7 = [v6 background];
    [v7 setCornerRadius:15.0];

    uint64_t v8 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v6 primaryAction:v4];
    button = v5->_button;
    v5->_button = (UIButton *)v8;

    [(UIButton *)v5->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v5->_button setAlpha:0.85];
    [(UIButton *)v5->_button setRole:1];
    id v10 = objc_alloc(MEMORY[0x1E4F43028]);
    [MEMORY[0x1E4F427D8] effectWithStyle:1];
    v11 = id v49 = v4;
    uint64_t v12 = [v10 initWithEffect:v11];
    effectView = v5->_effectView;
    v5->_effectView = (UIVisualEffectView *)v12;

    [(UIVisualEffectView *)v5->_effectView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [MEMORY[0x1E4F42A40] defaultMetrics];
    v15 = [(UIButton *)v5->_button traitCollection];
    [v14 scaledValueForValue:v15 compatibleWithTraitCollection:15.0];
    double v17 = v16;

    [(UIVisualEffectView *)v5->_effectView _setContinuousCornerRadius:v17];
    [(VKKeyboardCameraInsertButton *)v5 addSubview:v5->_effectView];
    [(VKKeyboardCameraInsertButton *)v5 addSubview:v5->_button];
    v18 = (void *)MEMORY[0x1E4F42A30];
    [MEMORY[0x1E4F42A30] systemFontSize];
    v19 = objc_msgSend(v18, "boldSystemFontOfSize:");
    v20 = [(UIButton *)v5->_button titleLabel];
    [v20 setFont:v19];

    v38 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [(UIVisualEffectView *)v5->_effectView leadingAnchor];
    v46 = [(VKKeyboardCameraInsertButton *)v5 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v51[0] = v45;
    v44 = [(UIVisualEffectView *)v5->_effectView bottomAnchor];
    v43 = [(VKKeyboardCameraInsertButton *)v5 bottomAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v51[1] = v42;
    v41 = [(UIVisualEffectView *)v5->_effectView topAnchor];
    v40 = [(VKKeyboardCameraInsertButton *)v5 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v51[2] = v39;
    v37 = [(UIVisualEffectView *)v5->_effectView trailingAnchor];
    v36 = [(VKKeyboardCameraInsertButton *)v5 trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v51[3] = v35;
    v34 = [(UIButton *)v5->_button leadingAnchor];
    v33 = [(UIVisualEffectView *)v5->_effectView leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v51[4] = v32;
    v31 = [(UIButton *)v5->_button bottomAnchor];
    v21 = [(VKKeyboardCameraInsertButton *)v5 bottomAnchor];
    v22 = [v31 constraintEqualToAnchor:v21];
    v51[5] = v22;
    v23 = [(UIButton *)v5->_button topAnchor];
    v24 = [(VKKeyboardCameraInsertButton *)v5 topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v51[6] = v25;
    v26 = [(UIButton *)v5->_button trailingAnchor];
    v27 = [(VKKeyboardCameraInsertButton *)v5 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v51[7] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:8];
    [v38 activateConstraints:v29];

    id v4 = v49;
  }

  return v5;
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