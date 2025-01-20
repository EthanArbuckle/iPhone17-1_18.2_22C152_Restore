@interface SBHFocusGuideView
- (SBHFocusGuideView)initWithFrame:(CGRect)a3;
- (UIView)targetView;
- (void)_updateTargetedView;
- (void)setTargetView:(id)a3;
@end

@implementation SBHFocusGuideView

- (SBHFocusGuideView)initWithFrame:(CGRect)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)SBHFocusGuideView;
  v3 = -[SBHFocusGuideView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E4FB1780]);
    focusGuide = v3->_focusGuide;
    v3->_focusGuide = v4;

    [(SBHFocusGuideView *)v3 addLayoutGuide:v3->_focusGuide];
    v16 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [(UIFocusGuide *)v3->_focusGuide topAnchor];
    v19 = [(SBHFocusGuideView *)v3 topAnchor];
    v18 = [v20 constraintEqualToAnchor:v19];
    v22[0] = v18;
    v17 = [(UIFocusGuide *)v3->_focusGuide bottomAnchor];
    v6 = [(SBHFocusGuideView *)v3 bottomAnchor];
    v7 = [v17 constraintEqualToAnchor:v6];
    v22[1] = v7;
    v8 = [(UIFocusGuide *)v3->_focusGuide leadingAnchor];
    v9 = [(SBHFocusGuideView *)v3 leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v22[2] = v10;
    v11 = [(UIFocusGuide *)v3->_focusGuide trailingAnchor];
    v12 = [(SBHFocusGuideView *)v3 trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v22[3] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    [v16 activateConstraints:v14];

    [(SBHFocusGuideView *)v3 _updateTargetedView];
  }
  return v3;
}

- (void)setTargetView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_targetView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_targetView, a3);
    [(SBHFocusGuideView *)self _updateTargetedView];
    v5 = v6;
  }
}

- (void)_updateTargetedView
{
  v5[1] = *MEMORY[0x1E4F143B8];
  focusGuide = self->_focusGuide;
  if (self->_targetView)
  {
    v5[0] = self->_targetView;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [(UIFocusGuide *)focusGuide setPreferredFocusEnvironments:v3];
  }
  else
  {
    v4 = self->_focusGuide;
    [(UIFocusGuide *)v4 setPreferredFocusEnvironments:0];
  }
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
}

@end