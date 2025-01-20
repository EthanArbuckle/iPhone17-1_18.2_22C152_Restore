@interface SUUIImageView
+ (Class)layerClass;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIImagePlaceholder)placeholder;
- (UITapGestureRecognizer)tapRecognizer;
- (id)cornerPathBlock;
- (void)layoutSubviews;
- (void)setContents:(id)a3;
- (void)setCornerPathBlock:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation SUUIImageView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UITapGestureRecognizer)tapRecognizer
{
  tapRecognizer = self->_tapRecognizer;
  if (!tapRecognizer)
  {
    v4 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x263F82CB0]);
    v5 = self->_tapRecognizer;
    self->_tapRecognizer = v4;

    [(SUUIImageView *)self addGestureRecognizer:self->_tapRecognizer];
    tapRecognizer = self->_tapRecognizer;
  }
  return tapRecognizer;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIImageView;
  [(SUUIImageView *)&v14 setImage:v4];
  if (v4) {
    [(SUUIImageView *)self setPlaceholder:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 cornerRadius];
    double v7 = fabs(v6);
    if (v7 < 2.22044605e-16)
    {
      [(SUUIImageView *)self _setCornerRadius:0.0];
      double v9 = 0.0;
    }
    else
    {
      uint64_t v8 = [v5 cornerType];
      if (v8 == 1)
      {
        [v5 cornerRadius];
        -[SUUIImageView _setCornerRadius:](self, "_setCornerRadius:");
        goto LABEL_12;
      }
      if (v8)
      {
LABEL_12:
        [(SUUIImageView *)self setClipsToBounds:v7 >= 2.22044605e-16];
        v10 = [(SUUIImageView *)self layer];
        [v5 borderWidth];
        double matched = SUUIGraphicsMatchViewBorderToStroke(self, v11);
        objc_msgSend(v10, "setBorderWidth:");
        id v13 = [v5 borderColor];
        objc_msgSend(v10, "setBorderColor:", objc_msgSend(v13, "CGColor"));

        [v10 setAllowsEdgeAntialiasing:fabs(matched) >= 2.22044605e-16];
        goto LABEL_13;
      }
      [v5 cornerRadius];
    }
    [(SUUIImageView *)self _setContinuousCornerRadius:v9];
    goto LABEL_12;
  }
  [(SUUIImageView *)self _setContinuousCornerRadius:0.0];
  [(SUUIImageView *)self _setCornerRadius:0.0];
  [(SUUIImageView *)self setClipsToBounds:0];
  id v5 = [(SUUIImageView *)self layer];
  [v5 setBorderWidth:0.0];
  [v5 setBorderColor:0];
  [v5 setAllowsEdgeAntialiasing:0];
LABEL_13:
}

- (void)setPlaceholder:(id)a3
{
  id v5 = (SUUIImagePlaceholder *)a3;
  p_placeholder = &self->_placeholder;
  if (self->_placeholder != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)p_placeholder, a3);
    double v7 = [(SUUIImageView *)self layer];
    if (v12)
    {
      id v8 = [(SUUIImagePlaceholder *)v12 borderColor];
      objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

      [(SUUIImagePlaceholder *)v12 borderWidth];
      objc_msgSend(v7, "setLineWidth:", SUUIGraphicsMatchViewBorderToStroke(self, v9));
      v10 = [(SUUIImagePlaceholder *)v12 cornerPathBlock];
      if (v10)
      {
        [(SUUIImageView *)self setCornerPathBlock:v10];
        self->_lastLayoutSize = (CGSize)*MEMORY[0x263F001B0];
        [(SUUIImageView *)self setNeedsLayout];
      }
      else
      {
        [(SUUIImageView *)self setCornerPathBlock:0];
        [v7 setPath:0];
      }
      id v11 = [(SUUIImagePlaceholder *)v12 backgroundColor];
      objc_msgSend(v7, "setFillColor:", objc_msgSend(v11, "CGColor"));
    }
    else
    {
      [(SUUIImageView *)self setCornerPathBlock:0];
      [v7 setStrokeColor:0];
      [v7 setLineWidth:0.0];
      [v7 setPath:0];
      [v7 setFillColor:0];
    }

    id v5 = v12;
  }
  MEMORY[0x270F9A758](p_placeholder, v5);
}

- (void)setContents:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUUIImageView *)self setImage:v6];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    [(SUUIImageView *)self setImage:0];
    if (isKindOfClass) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
    [(SUUIImageView *)self setPlaceholder:v5];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SUUIImageView;
  [(SUUIImageView *)&v19 layoutSubviews];
  [(SUUIImageView *)self bounds];
  if (self->_cornerPathBlock)
  {
    CGFloat v7 = v3;
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    p_lastLayoutSize = &self->_lastLayoutSize;
    if (self->_lastLayoutSize.width != v5 || self->_lastLayoutSize.height != v6)
    {
      id v13 = [(SUUIImageView *)self layer];
      [v13 lineWidth];
      UIRoundToViewScale();
      CGFloat v15 = v14;

      v20.origin.x = v7;
      v20.origin.y = v8;
      v20.size.width = v9;
      v20.size.height = v10;
      CGRect v21 = CGRectInset(v20, v15, v15);
      v16 = (*((void (**)(__n128, __n128, __n128, __n128))self->_cornerPathBlock + 2))((__n128)v21.origin, *(__n128 *)&v21.origin.y, (__n128)v21.size, *(__n128 *)&v21.size.height);
      v17 = [(SUUIImageView *)self layer];
      id v18 = v16;
      objc_msgSend(v17, "setPath:", objc_msgSend(v18, "CGPath"));

      p_lastLayoutSize->width = v9;
      p_lastLayoutSize->height = v10;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self->_imageSize.width;
  double v6 = self->_imageSize.height;
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v5 == *MEMORY[0x263F001B0] && v6 == v8)
  {
    CGFloat v10 = [(SUUIImageView *)self image];
    [v10 size];
    double v5 = v11;
    double v6 = v12;
  }
  if (width >= v5) {
    double v13 = v5;
  }
  else {
    double v13 = width;
  }
  if (height == v8 && width == v7) {
    double v13 = v5;
  }
  double v15 = v6;
  result.double height = v15;
  result.double width = v13;
  return result;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (SUUIImagePlaceholder)placeholder
{
  return self->_placeholder;
}

- (id)cornerPathBlock
{
  return self->_cornerPathBlock;
}

- (void)setCornerPathBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cornerPathBlock, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end