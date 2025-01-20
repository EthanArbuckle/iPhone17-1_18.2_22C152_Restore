@interface PXProtoFeatureEmptyPlaceholderView
- (BOOL)wantsContentView;
- (CGSize)intrinsicContentSize;
- (PXProtoFeatureEmptyPlaceholderView)initWithFrame:(CGRect)a3;
- (void)_updateLabelText;
- (void)statusDescriptionDidChange;
@end

@implementation PXProtoFeatureEmptyPlaceholderView

- (void).cxx_destruct
{
}

- (void)_updateLabelText
{
  uint64_t v3 = [(PXProtoFeaturePlaceholderView *)self statusDescription];
  id v5 = (id)v3;
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = @"No More Relevant Suggestion";
  }
  [(UILabel *)self->_label setText:v4];
}

- (void)statusDescriptionDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXProtoFeatureEmptyPlaceholderView;
  [(PXProtoFeaturePlaceholderView *)&v3 statusDescriptionDidChange];
  [(PXProtoFeatureEmptyPlaceholderView *)self _updateLabelText];
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_label intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(PXProtoFeaturePlaceholderView *)self preferredStatusWidth];
  if (v4 >= v7) {
    double v7 = v4;
  }
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)wantsContentView
{
  return 0;
}

- (PXProtoFeatureEmptyPlaceholderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXProtoFeatureEmptyPlaceholderView;
  double v3 = -[PXProtoFeaturePlaceholderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PXProtoFeatureEmptyPlaceholderView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    [(UILabel *)v3->_label setTextAlignment:1];
    [(UILabel *)v3->_label setAutoresizingMask:18];
    double v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.200000003];
    [(UILabel *)v3->_label setTextColor:v7];

    [(PXProtoFeatureEmptyPlaceholderView *)v3 addSubview:v3->_label];
    [(PXProtoFeatureEmptyPlaceholderView *)v3 _updateLabelText];
  }
  return v3;
}

@end