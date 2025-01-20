@interface _TVAlertView
+ (id)_newLabelWithText:(id)a3;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)additionalLabels;
- (NSString)message;
- (NSString)title;
- (TVImageProxy)imageProxy;
- (_TVAlertView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAdditionalLabels:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _TVAlertView

- (_TVAlertView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_TVAlertView;
  v3 = -[_TVAlertView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_TVImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    v6 = v3->_imageView;
    v7 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.2];
    [(_TVImageView *)v6 setBackgroundColor:v7];

    [(_TVImageView *)v3->_imageView setClipsToBounds:1];
    [(_TVImageView *)v3->_imageView _setContinuousCornerRadius:5.0];
    [(_TVAlertView *)v3 addSubview:v3->_imageView];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    v10 = v3->_titleLabel;
    v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
    [(UILabel *)v10 setFont:v11];

    v12 = v3->_titleLabel;
    v13 = [MEMORY[0x263F1C550] blackColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(_TVAlertView *)v3 addSubview:v3->_titleLabel];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = v14;

    v16 = v3->_messageLabel;
    v17 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    [(UILabel *)v16 setFont:v17];

    v18 = v3->_messageLabel;
    v19 = [MEMORY[0x263F1C550] blackColor];
    [(UILabel *)v18 setTextColor:v19];

    [(UILabel *)v3->_messageLabel setTextAlignment:1];
    [(UILabel *)v3->_messageLabel setNumberOfLines:0];
    [(_TVAlertView *)v3 addSubview:v3->_messageLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)_TVAlertView;
  [(_TVAlertView *)&v19 layoutSubviews];
  if (self->_imageProxy)
  {
    [(_TVAlertView *)self bounds];
    UIRectCenteredXInRect();
    -[_TVImageView setFrame:](self->_imageView, "setFrame:");
    [(_TVImageView *)self->_imageView setHidden:0];
    [(_TVImageView *)self->_imageView frame];
    CGRectGetMaxY(v22);
  }
  else
  {
    [(_TVImageView *)self->_imageView setHidden:1];
  }
  v3 = [(UILabel *)self->_titleLabel text];
  uint64_t v4 = [v3 length];

  titleLabel = self->_titleLabel;
  if (v4)
  {
    [(UILabel *)titleLabel tv_heightToFirstBaseline];
    [(UILabel *)self->_titleLabel tv_scaledValueForValue:36.0];
    [(UILabel *)self->_titleLabel frame];
    [(_TVAlertView *)self bounds];
    UIRectCenteredXInRect();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    [(UILabel *)self->_titleLabel setHidden:0];
    [(UILabel *)self->_titleLabel frame];
    CGRectGetMaxY(v23);
  }
  else
  {
    [(UILabel *)titleLabel setHidden:1];
  }
  v6 = [(UILabel *)self->_messageLabel text];
  uint64_t v7 = [v6 length];

  messageLabel = self->_messageLabel;
  if (v7)
  {
    [(UILabel *)messageLabel tv_heightToFirstBaseline];
    [(UILabel *)self->_messageLabel tv_scaledValueForValue:25.0];
    [(UILabel *)self->_messageLabel frame];
    [(_TVAlertView *)self bounds];
    UIRectCenteredXInRect();
    -[UILabel setFrame:](self->_messageLabel, "setFrame:");
    [(UILabel *)self->_messageLabel setHidden:0];
    [(UILabel *)self->_messageLabel frame];
    CGRectGetMaxY(v24);
  }
  else
  {
    [(UILabel *)messageLabel setHidden:1];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = self->_additionalLabelViews;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v14, "tv_scaledValueForValue:", 25.0, (void)v15);
        objc_msgSend(v14, "tv_heightToFirstBaseline");
        [v14 frame];
        [(_TVAlertView *)self bounds];
        UIRectCenteredXInRect();
        objc_msgSend(v14, "setFrame:");
        [v14 frame];
        CGRectGetMaxY(v25);
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v11);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (self->_imageProxy) {
    double v5 = self->_imageSize.height + 24.0;
  }
  else {
    double v5 = 0.0;
  }
  if ([(NSString *)self->_title length])
  {
    [(UILabel *)self->_titleLabel tv_heightToFirstBaseline];
    double v7 = v6;
    [(UILabel *)self->_titleLabel tv_scaledValueForValue:36.0];
    double v9 = v8 - v7;
    if (!self->_imageProxy) {
      double v9 = 24.0;
    }
    double v10 = v5 + v9;
    [(UILabel *)self->_titleLabel frame];
    double v5 = v10 + CGRectGetHeight(v35);
  }
  if ([(NSString *)self->_message length])
  {
    [(UILabel *)self->_messageLabel tv_heightToFirstBaseline];
    double v12 = v11;
    [(UILabel *)self->_messageLabel tv_scaledValueForValue:25.0];
    if (self->_imageProxy || self->_titleLabel) {
      double v14 = v13 - v12;
    }
    else {
      double v14 = 24.0;
    }
    double v15 = v5 + v14;
    [(UILabel *)self->_messageLabel frame];
    double v5 = v15 + CGRectGetHeight(v36);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v16 = self->_additionalLabelViews;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend(v21, "tv_scaledValueForValue:", 25.0, (void)v28);
        double v23 = v22;
        objc_msgSend(v21, "tv_heightToFirstBaseline");
        double v25 = v5 + v23 - v24;
        [v21 frame];
        double v5 = v25 + CGRectGetHeight(v37);
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  double v26 = v5 + 24.0;
  double v27 = width;
  result.height = v26;
  result.CGFloat width = v27;
  return result;
}

- (void)setAdditionalLabels:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSArray *)self->_additionalLabels isEqualToArray:v4])
  {
    double v5 = (NSArray *)[v4 copy];
    additionalLabels = self->_additionalLabels;
    self->_additionalLabels = v5;

    [(NSArray *)self->_additionalLabelViews makeObjectsPerformSelector:sel_removeFromSuperview];
    double v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_additionalLabels, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v8 = self->_additionalLabels;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      double v12 = *MEMORY[0x263F00148];
      double v13 = *(double *)(MEMORY[0x263F00148] + 8);
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          double v15 = objc_msgSend((id)objc_opt_class(), "_newLabelWithText:", *(void *)(*((void *)&v19 + 1) + 8 * v14), (void)v19);
          objc_msgSend(v15, "sizeThatFits:", 230.0, 0.0);
          objc_msgSend(v15, "setFrame:", v12, v13, 230.0, v16);
          [(_TVAlertView *)self addSubview:v15];
          [v7 addObject:v15];

          ++v14;
        }
        while (v10 != v14);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    uint64_t v17 = (NSArray *)[v7 copy];
    additionalLabelViews = self->_additionalLabelViews;
    self->_additionalLabelViews = v17;
  }
}

- (void)setImageProxy:(id)a3
{
  double v5 = (TVImageProxy *)a3;
  if (self->_imageProxy != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_imageProxy, a3);
    [(_TVImageView *)self->_imageView setImageProxy:self->_imageProxy];
    [(_TVAlertView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    [(_TVAlertView *)self setNeedsLayout];
  }
}

- (void)setMessage:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    message = self->_message;
    self->_message = v4;

    [(UILabel *)self->_messageLabel setText:self->_message];
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", 230.0, 0.0);
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 230.0, v6);
    [(_TVAlertView *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    [(UILabel *)self->_titleLabel setText:self->_title];
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", 230.0, 0.0);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 230.0, v6);
    [(_TVAlertView *)self setNeedsLayout];
  }
}

+ (id)_newLabelWithText:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  double v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D278]];
  [v5 setFont:v6];

  id v7 = [MEMORY[0x263F1C550] systemGrayColor];
  [v5 setTextColor:v7];

  [v5 setTextAlignment:1];
  [v5 setText:v4];

  [v5 setNumberOfLines:0];
  return v5;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)additionalLabels
{
  return self->_additionalLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalLabels, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_additionalLabelViews, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end