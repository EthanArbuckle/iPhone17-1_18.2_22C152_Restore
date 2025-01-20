@interface PLVideoPosterFrameView
- (CGRect)imageFrame;
- (PLVideoPosterFrameView)initWithFrame:(CGRect)a3;
- (id)image;
- (id)imageView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setScaleMode:(int64_t)a3;
@end

@implementation PLVideoPosterFrameView

- (CGRect)imageFrame
{
  [(UIImageView *)self->_imageView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)imageView
{
  return self->_imageView;
}

- (id)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setScaleMode:(int64_t)a3
{
  if (self->_scaleMode != a3)
  {
    self->_scaleMode = a3;
    [(PLVideoPosterFrameView *)self setNeedsLayout];
  }
}

- (void)setImage:(id)a3
{
  [(UIImageView *)self->_imageView setImage:a3];

  [(PLVideoPosterFrameView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(PLVideoPosterFrameView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(UIImageView *)self->_imageView image];
  if (v7)
  {
    [(UIImage *)v7 size];
    double v9 = v4 / v8;
    double v11 = v6 / v10;
    int64_t scaleMode = self->_scaleMode;
    if (v9 >= v11) {
      double v13 = v11;
    }
    else {
      double v13 = v9;
    }
    if (v9 >= v11) {
      double v14 = v9;
    }
    else {
      double v14 = v11;
    }
    if (scaleMode == 2)
    {
      double v9 = v14;
      double v11 = v14;
    }
    if (scaleMode == 1) {
      double v9 = v13;
    }
    memset(&v21.c, 0, 32);
    if (scaleMode == 1) {
      double v11 = v13;
    }
    *(_OWORD *)&v21.a = 0uLL;
    CGAffineTransformMakeScale(&v21, v9, v11);
    [(UIImageView *)self->_imageView center];
    double v16 = v15;
    double v18 = v17;
    [(UIImageView *)self->_imageView bounds];
    -[UIImageView setBounds:](self->_imageView, "setBounds:");
    -[UIImageView setCenter:](self->_imageView, "setCenter:", v16, v18);
    imageView = self->_imageView;
    CGAffineTransform v20 = v21;
    [(UIImageView *)imageView setTransform:&v20];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PLVideoPosterFrameView *)self frame];
  v15.origin.double x = v8;
  v15.origin.double y = v9;
  v15.size.double width = v10;
  v15.size.double height = v11;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    v13.receiver = self;
    v13.super_class = (Class)PLVideoPosterFrameView;
    -[PLVideoPosterFrameView setFrame:](&v13, sel_setFrame_, x, y, width, height);
    imageView = self->_imageView;
    [(PLVideoPosterFrameView *)self bounds];
    -[UIImageView setFrame:](imageView, "setFrame:");
    [(PLVideoPosterFrameView *)self setNeedsLayout];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLVideoPosterFrameView;
  [(PLVideoPosterFrameView *)&v3 dealloc];
}

- (PLVideoPosterFrameView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLVideoPosterFrameView;
  objc_super v3 = -[PLVideoPosterFrameView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(PLVideoPosterFrameView *)v3 bounds];
    v3->_imageView = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
    v3->_int64_t scaleMode = 1;
    [(PLVideoPosterFrameView *)v3 addSubview:v3->_imageView];
    [(PLVideoPosterFrameView *)v3 setClipsToBounds:1];
  }
  return v3;
}

@end