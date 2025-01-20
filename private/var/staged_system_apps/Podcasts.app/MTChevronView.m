@interface MTChevronView
+ (id)chevronImage;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTChevronView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
@end

@implementation MTChevronView

+ (id)chevronImage
{
  if (qword_10060A918 != -1) {
    dispatch_once(&qword_10060A918, &stru_100552EC8);
  }
  v2 = (void *)qword_10060A910;

  return v2;
}

- (MTChevronView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTChevronView;
  v3 = -[MTChevronView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(id)objc_opt_class() chevronImage];
    id v5 = [objc_alloc((Class)UIImageView) initWithImage:v4];
    [(MTChevronView *)v3 setImageView:v5];

    v6 = [(MTChevronView *)v3 imageView];
    [v6 sizeToFit];

    v7 = [(MTChevronView *)v3 imageView];
    [(MTChevronView *)v3 addSubview:v7];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MTChevronView;
  [(MTChevronView *)&v13 layoutSubviews];
  v3 = [(MTChevronView *)self imageView];
  [v3 bounds];
  [(MTChevronView *)self bounds];
  CGRectCenterRectInRect();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(MTChevronView *)self imageView];
  [v12 setFrame:v5, v7, v9, v11];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(MTChevronView *)self imageView];
  [v5 sizeThatFits:width, height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end