@interface PKSelectActionGroupActionsHeader
- (BOOL)isLoading;
- (CGSize)_imageSize;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitle;
- (NSString)title;
- (PKSelectActionGroupActionsHeader)initWithPass:(id)a3 title:(id)a4 subtitle:(id)a5;
- (void)layoutSubviews;
- (void)setLoading:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKSelectActionGroupActionsHeader

- (PKSelectActionGroupActionsHeader)initWithPass:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PKSelectActionGroupActionsHeader;
  v11 = [(PKSelectActionGroupActionsHeader *)&v34 init];
  v12 = v11;
  if (v11)
  {
    v11->_isTemplateLayout = 0;
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v13;

    v15 = v12->_titleLabel;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v12->_titleLabel setText:v9];
    v17 = v12->_titleLabel;
    v18 = (NSString *)*MEMORY[0x1E4FB2788];
    v19 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB2788], 2, 0);
    [(UILabel *)v17 setFont:v19];

    [(UILabel *)v12->_titleLabel setNumberOfLines:0];
    [(UILabel *)v12->_titleLabel sizeToFit];
    [(UILabel *)v12->_titleLabel setLineBreakMode:0];
    [(UILabel *)v12->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v12->_titleLabel setTextAlignment:1];
    [(UILabel *)v12->_titleLabel setAlpha:1.0];
    [(PKSelectActionGroupActionsHeader *)v12 addSubview:v12->_titleLabel];
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v12->_subtitleLabel;
    v12->_subtitleLabel = v20;

    [(UILabel *)v12->_subtitleLabel setText:v10];
    v22 = v12->_subtitleLabel;
    v23 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v22 setTextColor:v23];

    v24 = v12->_subtitleLabel;
    v25 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], v18);
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v12->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v12->_subtitleLabel sizeToFit];
    [(UILabel *)v12->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v12->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v12->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v12->_subtitleLabel setAlpha:1.0];
    [(PKSelectActionGroupActionsHeader *)v12 addSubview:v12->_subtitleLabel];
    v26 = [[PKPassView alloc] initWithPass:v8 content:5];
    id v27 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(PKSelectActionGroupActionsHeader *)v12 _imageSize];
    v28 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v26, "snapshotOfFrontFaceWithRequestedSize:");
    uint64_t v29 = [v27 initWithImage:v28];
    imageView = v12->_imageView;
    v12->_imageView = (UIImageView *)v29;

    [(PKSelectActionGroupActionsHeader *)v12 addSubview:v12->_imageView];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v12->_spinner;
    v12->_spinner = (UIActivityIndicatorView *)v31;

    [(UIActivityIndicatorView *)v12->_spinner startAnimating];
    [(UIActivityIndicatorView *)v12->_spinner setAlpha:0.0];
    [(PKSelectActionGroupActionsHeader *)v12 addSubview:v12->_spinner];
  }
  return v12;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
  spinner = self->_spinner;
  double v4 = 0.0;
  if (a3) {
    double v4 = 1.0;
  }
  [(UIActivityIndicatorView *)spinner setAlpha:v4];
}

- (CGSize)_imageSize
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double v3 = dbl_1A0442FE0[v2 < 5];
  double v4 = dbl_1A0442FF0[v2 < 5];
  if (!v2)
  {
    double v4 = 81.0;
    double v3 = 51.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKSelectActionGroupActionsHeader _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKSelectActionGroupActionsHeader;
  [(PKSelectActionGroupActionsHeader *)&v3 layoutSubviews];
  [(PKSelectActionGroupActionsHeader *)self bounds];
  [(PKSelectActionGroupActionsHeader *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat v6 = a3.origin.x + 20.0;
  CGFloat v7 = a3.origin.y + 0.0;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = a3.origin.x + 20.0;
  remainder.origin.y = a3.origin.y + 0.0;
  double v8 = a3.size.width + -40.0;
  remainder.size.double width = a3.size.width + -40.0;
  remainder.size.CGFloat height = a3.size.height;
  [(PKSelectActionGroupActionsHeader *)self _imageSize];
  double v10 = v9;
  CGFloat v12 = v11;
  v26.origin.x = v6;
  v26.origin.y = v7;
  v26.size.double width = width + -40.0;
  v26.size.CGFloat height = height;
  CGRectDivide(v26, &slice, &remainder, 20.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v12, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    double v13 = fmin(v10, v8);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", (width - v13) * 0.5, 20.0, v13, v12);
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  CGFloat v15 = v14;
  CGRectDivide(remainder, &slice, &remainder, 20.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  CGFloat v17 = v16;
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v17, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  PKFloatRoundToPixel();
  double v19 = v18;
  if (!self->_isTemplateLayout)
  {
    spinner = self->_spinner;
    [(UIActivityIndicatorView *)spinner frame];
    PKRectCenteredIntegralRect();
    -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
  }
  double v21 = width;
  double v22 = v19;
  result.CGFloat height = v22;
  result.double width = v21;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end