@interface PUParallaxDebugInfoRectView
- (NSString)identifier;
- (PUParallaxDebugInfoRectView)initWithFrame:(CGRect)a3;
- (UILabel)textLabel;
- (void)layoutSubviews;
- (void)setIdentifier:(id)a3;
@end

@implementation PUParallaxDebugInfoRectView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  v10 = (NSString *)a3;
  v4 = self->_identifier;
  if (v4 == v10)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v10];

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)[(NSString *)v10 copy];
      identifier = self->_identifier;
      self->_identifier = v6;

      v8 = self->_identifier;
      v9 = [(PUParallaxDebugInfoRectView *)self textLabel];
      [v9 setText:v8];

      [(PUParallaxDebugInfoRectView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PUParallaxDebugInfoRectView;
  [(PUParallaxDebugInfoRectView *)&v15 layoutSubviews];
  v3 = [(PUParallaxDebugInfoRectView *)self textLabel];
  [(PUParallaxDebugInfoRectView *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  PXRectWithOriginAndSize();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(PUParallaxDebugInfoRectView *)self textLabel];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
}

- (PUParallaxDebugInfoRectView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PUParallaxDebugInfoRectView;
  v3 = -[PUParallaxDebugInfoRectView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(PUParallaxDebugInfoRectView *)v3 layer];
    [v5 setBorderWidth:2.0];

    id v6 = [MEMORY[0x1E4FB1618] redColor];
    uint64_t v7 = [v6 CGColor];
    double v8 = [(PUParallaxDebugInfoRectView *)v4 layer];
    [v8 setBorderColor:v7];

    id v9 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUParallaxDebugInfoRectView *)v4 bounds];
    double v10 = (UILabel *)objc_msgSend(v9, "initWithFrame:");
    double v11 = [MEMORY[0x1E4FB1618] redColor];
    [(UILabel *)v10 setBackgroundColor:v11];

    double v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v10 setTextColor:v12];

    [(UILabel *)v10 setUserInteractionEnabled:0];
    [(PUParallaxDebugInfoRectView *)v4 addSubview:v10];
    textLabel = v4->_textLabel;
    v4->_textLabel = v10;
  }
  return v4;
}

@end