@interface DBSColorTemperatureSliderTableCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (DBSColorTemperatureSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation DBSColorTemperatureSliderTableCell

- (DBSColorTemperatureSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v28.receiver = self;
  v28.super_class = (Class)DBSColorTemperatureSliderTableCell;
  v5 = [(PSSliderTableCell *)&v28 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(DBSColorTemperatureSliderTableCell *)v5 textLabel];
    v8 = [v7 font];

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    coolerLabel = v6->_coolerLabel;
    v6->_coolerLabel = v9;

    [(UILabel *)v6->_coolerLabel setFont:v8];
    v11 = DBS_LocalizedStringForColorTemperature(@"COOLER");
    [(UILabel *)v6->_coolerLabel setText:v11];

    [(UILabel *)v6->_coolerLabel setNumberOfLines:0];
    [(UILabel *)v6->_coolerLabel setLineBreakMode:0];
    v12 = [MEMORY[0x263F5FBC0] appearance];
    v13 = [v12 textColor];
    [(UILabel *)v6->_coolerLabel setTextColor:v13];

    v14 = [(DBSColorTemperatureSliderTableCell *)v6 contentView];
    [v14 addSubview:v6->_coolerLabel];

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    warmerLabel = v6->_warmerLabel;
    v6->_warmerLabel = v15;

    [(UILabel *)v6->_warmerLabel setFont:v8];
    v17 = DBS_LocalizedStringForColorTemperature(@"WARMER");
    [(UILabel *)v6->_warmerLabel setText:v17];

    [(UILabel *)v6->_warmerLabel setNumberOfLines:0];
    [(UILabel *)v6->_warmerLabel setLineBreakMode:0];
    v18 = [MEMORY[0x263F5FBC0] appearance];
    v19 = [v18 textColor];
    [(UILabel *)v6->_warmerLabel setTextColor:v19];

    v20 = [(DBSColorTemperatureSliderTableCell *)v6 contentView];
    [v20 addSubview:v6->_warmerLabel];

    v27.receiver = v6;
    v27.super_class = (Class)DBSColorTemperatureSliderTableCell;
    [(PSTableCell *)&v27 layoutSubviews];
    v21 = [(DBSColorTemperatureSliderTableCell *)v6 textLabel];
    [v21 frame];
    double v23 = v22;
    double v25 = v24;

    if ([(DBSColorTemperatureSliderTableCell *)v6 effectiveUserInterfaceLayoutDirection] == 1)
    {
      [(DBSColorTemperatureSliderTableCell *)v6 bounds];
      double v23 = CGRectGetWidth(v29) - v23;
    }
    v6->_horizontalMargin = v23;
    v6->_verticalMargin = v25;
  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(DBSColorTemperatureSliderTableCell *)self layoutSubviews];
  v5 = [(PSControlTableCell *)self control];
  [v5 frame];
  CGFloat v6 = CGRectGetMaxY(v10) + self->_verticalMargin;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)DBSColorTemperatureSliderTableCell;
  [(PSTableCell *)&v33 layoutSubviews];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDF0]);
  v4 = [(PSControlTableCell *)self control];
  [v4 frame];
  objc_msgSend(v3, "setFrame:");

  uint64_t v5 = [(DBSColorTemperatureSliderTableCell *)self effectiveUserInterfaceLayoutDirection];
  [(DBSColorTemperatureSliderTableCell *)self bounds];
  double Width = CGRectGetWidth(v34);
  PSRoundToPixel();
  double v8 = v7;
  if (v5) {
    v9 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__warmerLabel;
  }
  else {
    v9 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__coolerLabel;
  }
  CGRect v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v9);
  if (v5) {
    v11 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__coolerLabel;
  }
  else {
    v11 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__warmerLabel;
  }
  id v12 = v10;
  [v12 setTextAlignment:0];
  id v13 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v11);
  [v13 setTextAlignment:2];
  [v12 frame];
  objc_msgSend(v12, "sizeThatFits:", v8, 1.79769313e308);
  CGFloat v31 = v15;
  CGFloat v32 = v14;
  double horizontalMargin = self->_horizontalMargin;
  double verticalMargin = self->_verticalMargin;
  objc_msgSend(v12, "setFrame:", horizontalMargin, verticalMargin, v14, v15);
  [v13 frame];
  objc_msgSend(v13, "sizeThatFits:", v8, 1.79769313e308);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v22 = Width - (self->_horizontalMargin + v18);
  double v23 = self->_verticalMargin;
  objc_msgSend(v13, "setFrame:", v22, v23, v18, v20);
  double v24 = [(PSControlTableCell *)self control];

  [v24 sizeToFit];
  [v24 frame];
  PSRoundToPixel();
  double v26 = v25;
  PSRoundToPixel();
  double v28 = v27;
  v35.origin.x = horizontalMargin;
  v35.origin.y = verticalMargin;
  v35.size.height = v31;
  v35.size.CGFloat width = v32;
  double MaxY = CGRectGetMaxY(v35);
  v36.origin.x = v22;
  v36.origin.y = v23;
  v36.size.CGFloat width = v19;
  v36.size.height = v21;
  double v30 = CGRectGetMaxY(v36);
  if (MaxY >= v30) {
    double v30 = MaxY;
  }
  objc_msgSend(v24, "setFrame:", v28, v30 + 10.0, v26, 31.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warmerLabel, 0);
  objc_storeStrong((id *)&self->_coolerLabel, 0);
}

@end