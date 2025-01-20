@interface SKUIImageView
+ (Class)layerClass;
+ (void)layerClass;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIImagePlaceholder)placeholder;
- (UITapGestureRecognizer)tapRecognizer;
- (id)cornerPathBlock;
- (void)layoutSubviews;
- (void)setContents:(id)a3;
- (void)setCornerPathBlock:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setPlaceholder:(id)a3;
- (void)tapRecognizer;
@end

@implementation SKUIImageView

+ (Class)layerClass
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        +[SKUIImageView layerClass];
      }
    }
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (UITapGestureRecognizer)tapRecognizer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUIImageView *)v3 tapRecognizer];
      }
    }
  }
  tapRecognizer = self->_tapRecognizer;
  if (!tapRecognizer)
  {
    v12 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
    v13 = self->_tapRecognizer;
    self->_tapRecognizer = v12;

    [(SKUIImageView *)self addGestureRecognizer:self->_tapRecognizer];
    tapRecognizer = self->_tapRecognizer;
  }

  return tapRecognizer;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIImageView setImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIImageView;
  [(SKUIImageView *)&v22 setImage:v4];
  if (v4) {
    [(SKUIImageView *)self setPlaceholder:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v4;
    [v13 cornerRadius];
    double v15 = fabs(v14);
    if (v15 < 2.22044605e-16)
    {
      [(SKUIImageView *)self _setCornerRadius:0.0];
      double v17 = 0.0;
    }
    else
    {
      uint64_t v16 = [v13 cornerType];
      if (v16 == 1)
      {
        [v13 cornerRadius];
        -[SKUIImageView _setCornerRadius:](self, "_setCornerRadius:");
        goto LABEL_15;
      }
      if (v16)
      {
LABEL_15:
        [(SKUIImageView *)self setClipsToBounds:v15 >= 2.22044605e-16];
        v18 = [(SKUIImageView *)self layer];
        [v13 borderWidth];
        double matched = SKUIGraphicsMatchViewBorderToStroke(self, v19);
        objc_msgSend(v18, "setBorderWidth:");
        id v21 = [v13 borderColor];
        objc_msgSend(v18, "setBorderColor:", objc_msgSend(v21, "CGColor"));

        [v18 setAllowsEdgeAntialiasing:fabs(matched) >= 2.22044605e-16];
        goto LABEL_16;
      }
      [v13 cornerRadius];
    }
    [(SKUIImageView *)self _setContinuousCornerRadius:v17];
    goto LABEL_15;
  }
  [(SKUIImageView *)self _setContinuousCornerRadius:0.0];
  [(SKUIImageView *)self _setCornerRadius:0.0];
  [(SKUIImageView *)self setClipsToBounds:0];
  id v13 = [(SKUIImageView *)self layer];
  [v13 setBorderWidth:0.0];
  [v13 setBorderColor:0];
  [v13 setAllowsEdgeAntialiasing:0];
LABEL_16:
}

- (void)setPlaceholder:(id)a3
{
  BOOL v5 = (SKUIImagePlaceholder *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        -[SKUIImageView setPlaceholder:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_placeholder != v5)
  {
    objc_storeStrong((id *)&self->_placeholder, a3);
    double v14 = [(SKUIImageView *)self layer];
    if (v5)
    {
      id v15 = [(SKUIImagePlaceholder *)v5 borderColor];
      objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

      [(SKUIImagePlaceholder *)v5 borderWidth];
      objc_msgSend(v14, "setLineWidth:", SKUIGraphicsMatchViewBorderToStroke(self, v16));
      double v17 = [(SKUIImagePlaceholder *)v5 cornerPathBlock];
      if (v17)
      {
        [(SKUIImageView *)self setCornerPathBlock:v17];
        self->_lastLayoutSize = (CGSize)*MEMORY[0x1E4F1DB30];
        [(SKUIImageView *)self setNeedsLayout];
      }
      else
      {
        [(SKUIImageView *)self setCornerPathBlock:0];
        [v14 setPath:0];
      }
      id v18 = [(SKUIImagePlaceholder *)v5 backgroundColor];
      objc_msgSend(v14, "setFillColor:", objc_msgSend(v18, "CGColor"));
    }
    else
    {
      [(SKUIImageView *)self setCornerPathBlock:0];
      [v14 setStrokeColor:0];
      [v14 setLineWidth:0.0];
      [v14 setPath:0];
      [v14 setFillColor:0];
    }
  }
}

- (void)setContents:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIImageView setContents:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SKUIImageView *)self setImage:v4];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    [(SKUIImageView *)self setImage:0];
    if (isKindOfClass) {
      id v14 = v4;
    }
    else {
      id v14 = 0;
    }
    [(SKUIImageView *)self setPlaceholder:v14];
  }
}

- (void)layoutSubviews
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        -[SKUIImageView sizeThatFits:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  double v14 = self->_imageSize.width;
  double v15 = self->_imageSize.height;
  double v16 = *MEMORY[0x1E4F1DB30];
  double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v14 == *MEMORY[0x1E4F1DB30] && v15 == v17)
  {
    double v19 = [(SKUIImageView *)self image];
    [v19 size];
    double v14 = v20;
    double v15 = v21;
  }
  if (width >= v14) {
    double v22 = v14;
  }
  else {
    double v22 = width;
  }
  if (height == v17 && width == v16) {
    double v22 = v14;
  }
  double v24 = v15;
  result.double height = v24;
  result.double width = v22;
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

- (SKUIImagePlaceholder)placeholder
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

+ (void)layerClass
{
}

- (void)tapRecognizer
{
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPlaceholder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContents:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end