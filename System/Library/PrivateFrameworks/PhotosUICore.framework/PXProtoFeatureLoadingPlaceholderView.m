@interface PXProtoFeatureLoadingPlaceholderView
- (BOOL)wantsContentView;
- (CGSize)intrinsicContentSize;
- (PXProtoFeatureLoadingPlaceholderView)initWithFrame:(CGRect)a3;
- (void)_updateLabelText;
- (void)layoutSubviews;
- (void)statusDescriptionDidChange;
@end

@implementation PXProtoFeatureLoadingPlaceholderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

- (void)_updateLabelText
{
  uint64_t v3 = [(PXProtoFeaturePlaceholderView *)self statusDescription];
  id v5 = (id)v3;
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = &stru_1F00B0030;
  }
  [(UILabel *)self->_label setText:v4];
}

- (void)statusDescriptionDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXProtoFeatureLoadingPlaceholderView;
  [(PXProtoFeaturePlaceholderView *)&v3 statusDescriptionDidChange];
  [(PXProtoFeatureLoadingPlaceholderView *)self _updateLabelText];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXProtoFeatureLoadingPlaceholderView;
  [(PXProtoFeatureView *)&v3 layoutSubviews];
  [(PXProtoFeatureLoadingPlaceholderView *)self bounds];
  PXRectGetCenter();
}

- (CGSize)intrinsicContentSize
{
  [(UIActivityIndicatorView *)self->_spinner intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(PXProtoFeaturePlaceholderView *)self preferredStatusWidth];
  if (v4 < v7) {
    double v4 = v7;
  }
  [(UILabel *)self->_label intrinsicContentSize];
  double v9 = v6 + (v8 + 5.0) * 2.0;
  double v10 = v4;
  result.height = v9;
  result.width = v10;
  return result;
}

- (BOOL)wantsContentView
{
  return 0;
}

- (PXProtoFeatureLoadingPlaceholderView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXProtoFeatureLoadingPlaceholderView;
  double v3 = -[PXProtoFeaturePlaceholderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    [(UIActivityIndicatorView *)v3->_spinner startAnimating];
    [(PXProtoFeatureLoadingPlaceholderView *)v3 addSubview:v3->_spinner];
    double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v6;

    [(UILabel *)v3->_label setTextAlignment:1];
    double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.200000003];
    [(UILabel *)v3->_label setTextColor:v8];

    double v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v3->_label setFont:v9];

    [(PXProtoFeatureLoadingPlaceholderView *)v3 addSubview:v3->_label];
    [(PXProtoFeatureLoadingPlaceholderView *)v3 _updateLabelText];
  }
  return v3;
}

@end