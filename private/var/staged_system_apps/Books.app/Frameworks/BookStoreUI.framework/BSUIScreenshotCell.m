@interface BSUIScreenshotCell
+ (CGSize)itemSizeForRegularPad:(BOOL)a3 maxSize:(CGSize)a4;
+ (UIEdgeInsets)sectionInsetForRegularPad:(BOOL)a3 maxSize:(CGSize)a4 artworkSize:(CGSize)a5;
+ (double)borderWidth;
+ (double)bottomMarginWithRegularPad:(BOOL)a3;
+ (double)minimumLineSpacingWithRegularPad:(BOOL)a3;
+ (double)topMargin;
- (BSUIScreenshotCell)initWithFrame:(CGRect)a3;
- (CGRect)_imageRectWithScreenshot:(id)a3;
- (UIImageView)imageView;
- (void)configureWithScreenshot:(id)a3 image:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BSUIScreenshotCell

- (BSUIScreenshotCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BSUIScreenshotCell;
  v3 = -[BSUIScreenshotCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(id)objc_opt_class() borderWidth];
    double v7 = v6;
    v8 = [(UIImageView *)v3->_imageView layer];
    [v8 setBorderWidth:v7];

    v9 = [(UIImageView *)v3->_imageView layer];
    [v9 setCornerRadius:5.0];

    v10 = [(UIImageView *)v3->_imageView layer];
    [v10 setMasksToBounds:1];

    v11 = [(BSUIScreenshotCell *)v3 contentView];
    [v11 setAutoresizingMask:18];

    v12 = [(BSUIScreenshotCell *)v3 contentView];
    [v12 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)BSUIScreenshotCell;
  [(BSUIScreenshotCell *)&v12 layoutSubviews];
  [(BSUIScreenshotCell *)self _imageRectWithScreenshot:0];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BSUIScreenshotCell *)self imageView];
  [v11 setFrame:v4, v6, v8, v10];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIScreenshotCell;
  [(BSUIScreenshotCell *)&v4 prepareForReuse];
  double v3 = [(BSUIScreenshotCell *)self imageView];
  [v3 setImage:0];
}

- (void)configureWithScreenshot:(id)a3 image:(id)a4
{
  id v6 = a4;
  [(BSUIScreenshotCell *)self _imageRectWithScreenshot:a3];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(BSUIScreenshotCell *)self imageView];
  [v15 setFrame:v8, v10, v12, v14];

  id v16 = [(BSUIScreenshotCell *)self imageView];
  [v16 setImage:v6];
}

- (CGRect)_imageRectWithScreenshot:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    [v4 size];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v10 = [(BSUIScreenshotCell *)self imageView];
    [v10 bounds];
    double v7 = v11;
    double v9 = v12;
  }
  double v13 = v7 / v9;
  double v14 = [(BSUIScreenshotCell *)self contentView];
  [v14 bounds];
  double Height = CGRectGetHeight(v26);

  id v16 = [(BSUIScreenshotCell *)self contentView];
  [v16 bounds];
  double Width = CGRectGetWidth(v27);

  BOOL v18 = Width / Height <= v13;
  double v19 = Width / v13;
  if (Width / Height > v13) {
    double v20 = v13 * Height;
  }
  else {
    double v20 = Width;
  }
  if (v18) {
    double v21 = v19;
  }
  else {
    double v21 = Height;
  }

  double v22 = (Width - v20) * 0.5;
  double v23 = (Height - v21) * 0.5;
  double v24 = v20;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (double)topMargin
{
  return 71.0;
}

+ (double)minimumLineSpacingWithRegularPad:(BOOL)a3
{
  double result = 15.0;
  if (a3) {
    return 30.0;
  }
  return result;
}

+ (double)bottomMarginWithRegularPad:(BOOL)a3
{
  double result = 52.0;
  if (!a3) {
    return 30.0;
  }
  return result;
}

+ (UIEdgeInsets)sectionInsetForRegularPad:(BOOL)a3 maxSize:(CGSize)a4 artworkSize:(CGSize)a5
{
  double height = a4.height;
  double width = a4.width;
  BOOL v7 = a3;
  [a1 itemSizeForRegularPad:a4.width maxSize:a4.height];
  double v10 = v9;
  double v12 = v11;
  [a1 topMargin];
  double v14 = height - (v13 + v12);
  if (v14 > v13)
  {
    [a1 topMargin];
    double v16 = v15;
    [a1 bottomMarginWithRegularPad:v7];
    double v13 = (height - (v16 + v17) - v12) * 0.5;
    double v14 = v13;
  }
  double v18 = (width - v10) * 0.5;
  double v19 = v18;
  result.right = v19;
  result.bottom = v14;
  result.left = v18;
  result.top = v13;
  return result;
}

+ (CGSize)itemSizeForRegularPad:(BOOL)a3 maxSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  BOOL v6 = a3;
  [a1 bottomMarginWithRegularPad];
  double v9 = v8;
  [a1 topMargin];
  double v11 = height - (v9 + v10);
  [a1 minimumLineSpacingWithRegularPad:v6];
  double v13 = width - v12;
  double v14 = v11;
  result.double height = v14;
  result.double width = v13;
  return result;
}

+ (double)borderWidth
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
}

@end