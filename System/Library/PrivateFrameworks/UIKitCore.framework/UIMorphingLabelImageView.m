@interface UIMorphingLabelImageView
- (UIMorphingLabelImage)image;
- (UIMorphingLabelImageView)initWithImage:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation UIMorphingLabelImageView

- (UIMorphingLabelImageView)initWithImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  [v4 size];
  v11.receiver = self;
  v11.super_class = (Class)UIMorphingLabelImageView;
  v8 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, v6, v7);
  v9 = v8;
  if (v8) {
    [(UIMorphingLabelImageView *)v8 setImage:v4];
  }

  return v9;
}

- (void)setImage:(id)a3
{
  double v5 = (UIMorphingLabelImage *)a3;
  if (self->_image != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    double v6 = [(UIView *)self layer];
    id v7 = [(UIMorphingLabelImage *)v21 image];
    objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));

    if (v21)
    {
      [(UIMorphingLabelImage *)v21 contentsRect];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v16 = [(UIMorphingLabelImage *)v21 image];
      [v16 size];
      double v18 = v17;
      double v20 = v19;

      objc_msgSend(v6, "setContentsRect:", v9 / v18, v11 / v20, v13 / v18, v15 / v20);
    }

    double v5 = v21;
  }
}

- (UIMorphingLabelImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end