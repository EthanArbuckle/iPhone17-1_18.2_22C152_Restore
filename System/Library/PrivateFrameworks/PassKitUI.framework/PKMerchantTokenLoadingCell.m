@interface PKMerchantTokenLoadingCell
- (PKMerchantTokenLoadingCell)initWithFrame:(CGRect)a3;
- (void)_computeLoadingCellHeights;
- (void)_setUpConstraints;
- (void)_setUpViews;
- (void)prepareForReuse;
- (void)useSmallHeight;
@end

@implementation PKMerchantTokenLoadingCell

- (PKMerchantTokenLoadingCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenLoadingCell;
  v3 = -[PKMerchantTokenLoadingCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKMerchantTokenLoadingCell *)v3 _computeLoadingCellHeights];
    [(PKMerchantTokenLoadingCell *)v4 _setUpViews];
    [(PKMerchantTokenLoadingCell *)v4 _setUpConstraints];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKMerchantTokenLoadingCell;
  [(PKMerchantTokenLoadingCell *)&v3 prepareForReuse];
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
}

- (void)useSmallHeight
{
}

- (void)_setUpViews
{
  objc_super v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  [(UIActivityIndicatorView *)self->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  id v5 = [(PKMerchantTokenLoadingCell *)self contentView];
  [v5 addSubview:self->_activityIndicator];
}

- (void)_setUpConstraints
{
  v18[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PKMerchantTokenLoadingCell *)self contentView];
  v4 = [v3 heightAnchor];
  id v5 = [v4 constraintEqualToConstant:self->_loadingCellHeightWithIcon];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v5;

  v17 = (void *)MEMORY[0x1E4F28DC8];
  v7 = [(UIActivityIndicatorView *)self->_activityIndicator centerXAnchor];
  v8 = [(PKMerchantTokenLoadingCell *)self contentView];
  v9 = [v8 centerXAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v18[0] = v10;
  v11 = [(UIActivityIndicatorView *)self->_activityIndicator centerYAnchor];
  v12 = [(PKMerchantTokenLoadingCell *)self contentView];
  v13 = [v12 centerYAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v15 = self->_heightConstraint;
  v18[1] = v14;
  v18[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [v17 activateConstraints:v16];
}

- (void)_computeLoadingCellHeights
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"loading"];
  [v3 frame];
  self->_loadingCellHeight = CGRectGetHeight(v5);
  self->_loadingCellHeightWithIcon = 76.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end