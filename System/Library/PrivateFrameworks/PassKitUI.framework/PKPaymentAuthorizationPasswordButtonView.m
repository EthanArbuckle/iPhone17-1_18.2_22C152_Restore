@interface PKPaymentAuthorizationPasswordButtonView
- (PKPaymentAuthorizationPasswordButtonView)initWithFrame:(CGRect)a3 action:(id)a4;
- (void)_setupConstraints;
- (void)setActionTitle:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation PKPaymentAuthorizationPasswordButtonView

- (PKPaymentAuthorizationPasswordButtonView)initWithFrame:(CGRect)a3 action:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentAuthorizationPasswordButtonView;
  v10 = -[PKPaymentAuthorizationPasswordButtonView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4FB14D8];
    v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    v13 = objc_msgSend(v11, "pkui_plainConfigurationWithTitle:font:", 0, v12);

    v14 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v13 setBaseForegroundColor:v14];

    uint64_t v15 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v13 primaryAction:v9];
    passwordButton = v10->_passwordButton;
    v10->_passwordButton = (UIButton *)v15;

    [(UIButton *)v10->_passwordButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaymentAuthorizationPasswordButtonView *)v10 addSubview:v10->_passwordButton];
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v10->_separatorView;
    v10->_separatorView = v17;

    [(UIView *)v10->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = v10->_separatorView;
    v20 = PKAuthorizationSeparatorColor();
    [(UIView *)v19 setBackgroundColor:v20];

    [(PKPaymentAuthorizationPasswordButtonView *)v10 addSubview:v10->_separatorView];
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hiddenConstraints = v10->_hiddenConstraints;
    v10->_hiddenConstraints = v21;

    [(PKPaymentAuthorizationPasswordButtonView *)v10 _setupConstraints];
    [(PKPaymentAuthorizationPasswordButtonView *)v10 setNeedsUpdateConstraints];
  }
  return v10;
}

- (void)setActionTitle:(id)a3
{
}

- (void)updateConstraints
{
  int v3 = [(PKPaymentAuthorizationPasswordButtonView *)self isHidden];
  hiddenConstraints = self->_hiddenConstraints;
  if (v3)
  {
    [MEMORY[0x1E4F28DC8] activateConstraints:hiddenConstraints];
    [(NSLayoutConstraint *)self->_buttonBottomPaddingConstraint setConstant:0.0];
    [(NSLayoutConstraint *)self->_buttonTopPaddingConstraint setConstant:0.0];
    seperatorHeightConstraint = self->_seperatorHeightConstraint;
    double v6 = 0.0;
  }
  else
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:hiddenConstraints];
    [(NSLayoutConstraint *)self->_buttonTopPaddingConstraint setConstant:13.0];
    [(NSLayoutConstraint *)self->_buttonBottomPaddingConstraint setConstant:-13.0];
    v7 = self->_seperatorHeightConstraint;
    PKFloatCeilToPixel();
    seperatorHeightConstraint = v7;
  }
  [(NSLayoutConstraint *)seperatorHeightConstraint setConstant:v6];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationPasswordButtonView;
  [(PKPaymentAuthorizationPasswordButtonView *)&v8 updateConstraints];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationPasswordButtonView;
  [(PKPaymentAuthorizationPasswordButtonView *)&v4 setHidden:a3];
  [(PKPaymentAuthorizationPasswordButtonView *)self setNeedsUpdateConstraints];
}

- (void)_setupConstraints
{
  int v3 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButton attribute:5 relatedBy:0 toItem:self attribute:17 multiplier:1.0 constant:0.0];
  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:v3];

  objc_super v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButton attribute:6 relatedBy:0 toItem:self attribute:18 multiplier:1.0 constant:0.0];
  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:v4];

  v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButton attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  buttonTopPaddingConstraint = self->_buttonTopPaddingConstraint;
  self->_buttonTopPaddingConstraint = v5;

  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:self->_buttonTopPaddingConstraint];
  v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButton attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
  buttonBottomPaddingConstraint = self->_buttonBottomPaddingConstraint;
  self->_buttonBottomPaddingConstraint = v7;

  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:self->_buttonBottomPaddingConstraint];
  id v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:0.0];
  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:v9];

  v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:0.0];
  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:v10];

  v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:v11];

  v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
  seperatorHeightConstraint = self->_seperatorHeightConstraint;
  self->_seperatorHeightConstraint = v12;

  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraint:self->_seperatorHeightConstraint];
  LODWORD(v14) = 1148846080;
  [(UIButton *)self->_passwordButton setContentCompressionResistancePriority:1 forAxis:v14];
  hiddenConstraints = self->_hiddenConstraints;
  v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)hiddenConstraints addObject:v16];

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_hiddenConstraints];
  v17 = self->_hiddenConstraints;

  [(PKPaymentAuthorizationPasswordButtonView *)self addConstraints:v17];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seperatorHeightConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTopPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_hiddenConstraints, 0);
  objc_storeStrong((id *)&self->_passwordButton, 0);

  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end