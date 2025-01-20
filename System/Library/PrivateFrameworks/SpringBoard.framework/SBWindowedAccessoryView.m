@interface SBWindowedAccessoryView
- (SBWindowedAccessoryView)initWithFrame:(CGRect)a3;
- (SBWindowedAccessoryViewDelegate)delegate;
- (UIButton)forceDetachWindowedAcessoryButton;
- (UIColor)backgroundColor;
- (void)_forceDetachWindowedAcessoryButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceDetachWindowedAcessoryButton:(id)a3;
@end

@implementation SBWindowedAccessoryView

- (SBWindowedAccessoryView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBWindowedAccessoryView;
  v3 = -[SBWindowedAccessoryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBWindowedAccessoryView *)v3 setBackgroundColor:v4];

    uint64_t v5 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    forceDetachWindowedAcessoryButton = v3->_forceDetachWindowedAcessoryButton;
    v3->_forceDetachWindowedAcessoryButton = (UIButton *)v5;

    [(UIButton *)v3->_forceDetachWindowedAcessoryButton addTarget:v3 action:sel__forceDetachWindowedAcessoryButtonTapped_ forControlEvents:5];
    v7 = [MEMORY[0x1E4F42A80] imageNamed:@"ForceDetachWindowedAcessoryButton"];
    v8 = [v7 imageWithRenderingMode:2];

    [(UIButton *)v3->_forceDetachWindowedAcessoryButton setImage:v8 forState:0];
    v9 = v3->_forceDetachWindowedAcessoryButton;
    v10 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIButton *)v9 setTintColor:v10];

    [(SBWindowedAccessoryView *)v3 addSubview:v3->_forceDetachWindowedAcessoryButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SBWindowedAccessoryView;
  [(SBWindowedAccessoryView *)&v13 layoutSubviews];
  v3 = [(SBWindowedAccessoryView *)self superview];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[SBWindowedAccessoryView setBounds:](self, "setBounds:", v5, v7, v9, v11);
  [(UIButton *)self->_forceDetachWindowedAcessoryButton sizeToFit];
  [(UIButton *)self->_forceDetachWindowedAcessoryButton frame];
  -[UIButton setFrame:](self->_forceDetachWindowedAcessoryButton, "setFrame:", v9 - (v12 + 20.0), 40.0);
}

- (void)_forceDetachWindowedAcessoryButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained forceDetachWindowedAcessoryButtonTapped:self];
}

- (SBWindowedAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBWindowedAccessoryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIButton)forceDetachWindowedAcessoryButton
{
  return self->_forceDetachWindowedAcessoryButton;
}

- (void)setForceDetachWindowedAcessoryButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceDetachWindowedAcessoryButton, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end