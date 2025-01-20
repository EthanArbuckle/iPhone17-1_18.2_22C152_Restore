@interface PKMerchantTokenLoadingView
- (NSString)loadingText;
- (PKMerchantTokenLoadingView)initWithFrame:(CGRect)a3;
- (void)_setUpActivityIndicator;
- (void)_setUpConstraints;
- (void)_setUpLabel;
- (void)_setUpSelf;
- (void)_setUpStackView;
- (void)_setUpViews;
- (void)setLoadingText:(id)a3;
@end

@implementation PKMerchantTokenLoadingView

- (PKMerchantTokenLoadingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenLoadingView;
  v3 = -[PKMerchantTokenLoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKMerchantTokenLoadingView *)v3 _setUpViews];
    [(PKMerchantTokenLoadingView *)v4 _setUpConstraints];
  }
  return v4;
}

- (NSString)loadingText
{
  return [(UILabel *)self->_label text];
}

- (void)setLoadingText:(id)a3
{
}

- (void)_setUpViews
{
  [(PKMerchantTokenLoadingView *)self _setUpSelf];
  [(PKMerchantTokenLoadingView *)self _setUpStackView];
  [(PKMerchantTokenLoadingView *)self _setUpActivityIndicator];

  [(PKMerchantTokenLoadingView *)self _setUpLabel];
}

- (void)_setUpSelf
{
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKMerchantTokenLoadingView *)self setBackgroundColor:v3];
}

- (void)_setUpStackView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v4 = (UIStackView *)[v3 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setSpacing:16.0];
  objc_super v6 = self->_stackView;

  [(PKMerchantTokenLoadingView *)self addSubview:v6];
}

- (void)_setUpActivityIndicator
{
  id v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  stackView = self->_stackView;
  objc_super v6 = self->_activityIndicator;

  [(UIStackView *)stackView addArrangedSubview:v6];
}

- (void)_setUpLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  label = self->_label;
  self->_label = v4;

  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setNumberOfLines:2];
  stackView = self->_stackView;
  v7 = self->_label;

  [(UIStackView *)stackView addArrangedSubview:v7];
}

- (void)_setUpConstraints
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v13 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [(UIStackView *)self->_stackView centerXAnchor];
  v17 = [(PKMerchantTokenLoadingView *)self centerXAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  v15 = [(UIStackView *)self->_stackView centerYAnchor];
  v14 = [(PKMerchantTokenLoadingView *)self centerYAnchor];
  id v3 = [v15 constraintEqualToAnchor:v14];
  v19[1] = v3;
  v4 = [(UIStackView *)self->_stackView leadingAnchor];
  v5 = [(PKMerchantTokenLoadingView *)self layoutMarginsGuide];
  objc_super v6 = [v5 leadingAnchor];
  v7 = [v4 constraintGreaterThanOrEqualToAnchor:v6];
  v19[2] = v7;
  v8 = [(UIStackView *)self->_stackView trailingAnchor];
  v9 = [(PKMerchantTokenLoadingView *)self layoutMarginsGuide];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintLessThanOrEqualToAnchor:v10];
  v19[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v13 activateConstraints:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end