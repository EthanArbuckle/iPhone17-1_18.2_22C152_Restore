@interface PXTextBannerView
- (BOOL)isDestructiveText;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (PXTextBannerView)initWithFrame:(CGRect)a3;
- (int64_t)textAlignment;
- (void)_updateSubviews;
- (void)layoutSubviews;
- (void)setDestructiveText:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation PXTextBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)isDestructiveText
{
  return self->_destructiveText;
}

- (NSString)text
{
  return self->_text;
}

- (void)layoutSubviews
{
  [(PXTextBannerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIImageView setFrame:](self->_backgroundView, "setFrame:");
  if (self->_textAlignment == 1) {
    double v11 = 0.0;
  }
  else {
    double v11 = 5.0;
  }
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGRect v15 = CGRectInset(v14, v11, 0.0);
  textLabel = self->_textLabel;
  -[UILabel setFrame:](textLabel, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:");
  double v7 = 5.0;
  if (self->_textAlignment == 1) {
    double v7 = 0.0;
  }
  double v8 = v6 + v7 * 2.0;
  if (width < v8) {
    double v8 = width;
  }
  double v9 = height;
  result.CGFloat height = v9;
  result.double width = v8;
  return result;
}

- (void)_updateSubviews
{
  [(UILabel *)self->_textLabel setText:self->_text];
  [(UILabel *)self->_textLabel setTextAlignment:self->_textAlignment];
  if (self->_destructiveText) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [(UILabel *)self->_textLabel setTextColor:v3];
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    [(PXTextBannerView *)self _updateSubviews];
  }
}

- (void)setDestructiveText:(BOOL)a3
{
  if (self->_destructiveText != a3)
  {
    self->_destructiveText = a3;
    [(PXTextBannerView *)self _updateSubviews];
  }
}

- (void)setText:(id)a3
{
  CGFloat v4 = (NSString *)a3;
  double v5 = v4;
  double v9 = v4;
  if (self->_text != v4 || (v6 = [(NSString *)v4 isEqualToString:v4], double v5 = v9, !v6))
  {
    double v7 = (NSString *)[(NSString *)v5 copy];
    text = self->_text;
    self->_text = v7;

    [(PXTextBannerView *)self _updateSubviews];
    double v5 = v9;
  }
}

- (PXTextBannerView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PXTextBannerView;
  id v3 = -[PXTextBannerView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CGFloat v4 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPhotoViewGradient");
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIImageView *)v5;

    [(PXTextBannerView *)v3 addSubview:v3->_backgroundView];
    double v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v7;

    double v9 = v3->_textLabel;
    CGFloat v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    double v11 = v3->_textLabel;
    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [(UILabel *)v11 setFont:v12];

    v13 = v3->_textLabel;
    CGRect v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v3->_textLabel setTextAlignment:2];
    [(PXTextBannerView *)v3 addSubview:v3->_textLabel];
    CGRect v15 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXTextBannerView *)v3 setBackgroundColor:v15];

    [(PXTextBannerView *)v3 _updateSubviews];
  }
  return v3;
}

@end