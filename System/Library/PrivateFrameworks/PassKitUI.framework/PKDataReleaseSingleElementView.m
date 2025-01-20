@interface PKDataReleaseSingleElementView
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDataReleaseSingleElementView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitle:(id)a3 titleFont:(id)a4 image:(id)a5;
@end

@implementation PKDataReleaseSingleElementView

- (PKDataReleaseSingleElementView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKDataReleaseSingleElementView;
  v3 = -[PKDataReleaseSingleElementView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(UILabel *)v3->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(PKDataReleaseSingleElementView *)v3 addSubview:v3->_titleLabel];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v6;

    [(UIImageView *)v3->_imageView setContentMode:1];
    v8 = v3->_imageView;
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v8 setTintColor:v9];

    [(PKDataReleaseSingleElementView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)setTitle:(id)a3 titleFont:(id)a4 image:(id)a5
{
  titleLabel = self->_titleLabel;
  id v9 = a5;
  id v10 = a4;
  [(UILabel *)titleLabel setText:a3];
  [(UILabel *)self->_titleLabel setFont:v10];

  [(UIImageView *)self->_imageView setImage:v9];

  [(PKDataReleaseSingleElementView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDataReleaseSingleElementView;
  [(PKDataReleaseSingleElementView *)&v3 layoutSubviews];
  [(PKDataReleaseSingleElementView *)self bounds];
  [(PKDataReleaseSingleElementView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKDataReleaseSingleElementView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.size.width, a3.size.height);
  CGFloat v10 = v9;
  if (!self->_isTemplateLayout)
  {
    CGFloat v11 = v8;
    memset(&slice, 0, sizeof(slice));
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    if ([(PKDataReleaseSingleElementView *)self _shouldReverseLayoutDirection])CGRectEdge v12 = CGRectMaxXEdge; {
    else
    }
      CGRectEdge v12 = CGRectMinXEdge;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGRectDivide(v18, &slice, &v15, v10, v12);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(v15, &slice, &v15, 10.0, v12);
    CGRectDivide(v15, &slice, &v15, v11, v12);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  double v13 = width;
  double v14 = v10;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end