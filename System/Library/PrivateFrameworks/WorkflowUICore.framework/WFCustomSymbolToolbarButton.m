@interface WFCustomSymbolToolbarButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)symbolName;
- (double)pointSizeToWidthRatio;
- (void)setPointSizeToWidthRatio:(double)a3;
- (void)setSymbolName:(id)a3;
- (void)setSymbolName:(id)a3 pointSizeToWidthRatio:(double)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImage;
@end

@implementation WFCustomSymbolToolbarButton

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFCustomSymbolToolbarButton;
  id v4 = a3;
  [(WFCustomSymbolToolbarButton *)&v8 traitCollectionDidChange:v4];
  v5 = [(WFCustomSymbolToolbarButton *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(WFCustomSymbolToolbarButton *)self updateImage];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v6 pointSize];
  double v8 = v7;

  [(WFCustomSymbolToolbarButton *)self pointSizeToWidthRatio];
  double v10 = fmin(v8, 21.0) * v9;
  v14.receiver = self;
  v14.super_class = (Class)WFCustomSymbolToolbarButton;
  -[WFCustomSymbolToolbarButton sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
  double v12 = v11 + 10.0;
  double v13 = v10;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)updateImage
{
  uint64_t v3 = [(WFCustomSymbolToolbarButton *)self symbolName];
  if (v3)
  {
    id v4 = (void *)v3;
    [(WFCustomSymbolToolbarButton *)self pointSizeToWidthRatio];
    double v6 = v5;

    if (v6 != 0.0)
    {
      id v11 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570]];
      double v7 = (void *)MEMORY[0x263F827E8];
      double v8 = [(WFCustomSymbolToolbarButton *)self symbolName];
      double v9 = [v7 systemImageNamed:v8 withConfiguration:v11];

      [(WFCustomSymbolToolbarButton *)self setImage:v9 forState:0];
      double v10 = [(WFCustomSymbolToolbarButton *)self imageView];
      [v10 setContentMode:4];
    }
  }
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (double)pointSizeToWidthRatio
{
  return self->_pointSizeToWidthRatio;
}

- (void)setSymbolName:(id)a3 pointSizeToWidthRatio:(double)a4
{
  [(WFCustomSymbolToolbarButton *)self setSymbolName:a3];
  [(WFCustomSymbolToolbarButton *)self setPointSizeToWidthRatio:a4];
  [(WFCustomSymbolToolbarButton *)self updateImage];
}

- (void)setSymbolName:(id)a3
{
}

- (void)setPointSizeToWidthRatio:(double)a3
{
  self->_pointSizeToWidthRatio = a3;
}

- (void).cxx_destruct
{
}

@end