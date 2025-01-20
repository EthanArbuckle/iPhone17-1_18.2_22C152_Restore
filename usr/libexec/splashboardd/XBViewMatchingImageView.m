@interface XBViewMatchingImageView
- (BOOL)bottom;
- (UIImageView)imageView;
- (UIView)matchingView;
- (XBViewMatchingImageView)initWithMatchingView:(id)a3 image:(id)a4 bottom:(BOOL)a5;
- (void)layoutSubviews;
- (void)setBottom:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setMatchingView:(id)a3;
@end

@implementation XBViewMatchingImageView

- (XBViewMatchingImageView)initWithMatchingView:(id)a3 image:(id)a4 bottom:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)XBViewMatchingImageView;
  v10 = [(XBViewMatchingImageView *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [(XBViewMatchingImageView *)v10 setMatchingView:v8];
    if (v9)
    {
      id v12 = [objc_alloc((Class)UIImageView) initWithImage:v9];
      [(XBViewMatchingImageView *)v11 setImageView:v12];
    }
    [(XBViewMatchingImageView *)v11 setBottom:v5];
    if (v5) {
      uint64_t v13 = 10;
    }
    else {
      uint64_t v13 = 34;
    }
    [v8 setAutoresizingMask:v13];
    [v8 setHidden:v9 != 0];
    [(XBViewMatchingImageView *)v11 addSubview:v8];
    [(XBViewMatchingImageView *)v11 addSubview:v11->_imageView];
  }

  return v11;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)XBViewMatchingImageView;
  [(XBViewMatchingImageView *)&v13 layoutSubviews];
  [(UIView *)self->_matchingView sizeToFit];
  [(UIView *)self->_matchingView frame];
  BOOL bottom = self->_bottom;
  [(XBViewMatchingImageView *)self safeAreaInsets];
  UIRectInset();
  double v8 = v7;
  if (bottom)
  {
    double v9 = v5;
    double v10 = v6;
    [(XBViewMatchingImageView *)self frame];
    double v12 = v11 - v10;
  }
  else
  {
    double v12 = v4;
    double v9 = v5;
    double v10 = v6;
  }
  -[UIView setFrame:](self->_matchingView, "setFrame:", v8, v12, v9, v10);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v8, v12, v9, v10);
}

- (UIView)matchingView
{
  return self->_matchingView;
}

- (void)setMatchingView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)bottom
{
  return self->_bottom;
}

- (void)setBottom:(BOOL)a3
{
  self->_BOOL bottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_matchingView, 0);
}

@end