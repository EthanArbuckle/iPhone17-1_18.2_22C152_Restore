@interface PSCapacityBarLegendView
- (NSString)text;
- (PSCapacityBarLegendView)initWithCapacityBarCategory:(id)a3;
- (UIColor)color;
- (UIColor)textColor;
- (void)createConstraints;
- (void)setColor:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PSCapacityBarLegendView

- (PSCapacityBarLegendView)initWithCapacityBarCategory:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PSCapacityBarLegendView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[PSCapacityBarLegendView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    [(PSCapacityBarLegendView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [PSLegendColorView alloc];
    if (v4) {
      [v4 color];
    }
    else {
    v12 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
    }
    uint64_t v13 = [(PSLegendColorView *)v11 initWithColor:v12];
    legendColor = v10->_legendColor;
    v10->_legendColor = (PSLegendColorView *)v13;

    [(PSLegendColorView *)v10->_legendColor setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1144750080;
    [(PSLegendColorView *)v10->_legendColor setContentCompressionResistancePriority:0 forAxis:v15];
    LODWORD(v16) = 1144750080;
    [(PSLegendColorView *)v10->_legendColor setContentCompressionResistancePriority:1 forAxis:v16];
    [(PSCapacityBarLegendView *)v10 addSubview:v10->_legendColor];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    legendLabel = v10->_legendLabel;
    v10->_legendLabel = (UILabel *)v17;

    [(UILabel *)v10->_legendLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_legendLabel setLineBreakMode:4];
    [(UILabel *)v10->_legendLabel setNumberOfLines:1];
    if (v4)
    {
      v19 = [v4 title];
      [(UILabel *)v10->_legendLabel setText:v19];
    }
    else
    {
      [(UILabel *)v10->_legendLabel setText:@"????"];
    }
    v20 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
    [(UILabel *)v10->_legendLabel setFont:v20];

    [(UILabel *)v10->_legendLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v21) = 1144750080;
    [(UILabel *)v10->_legendLabel setContentHuggingPriority:0 forAxis:v21];
    LODWORD(v22) = 1144750080;
    [(UILabel *)v10->_legendLabel setContentHuggingPriority:1 forAxis:v22];
    [(PSCapacityBarLegendView *)v10 addSubview:v10->_legendLabel];
    LODWORD(v23) = 1144750080;
    [(PSCapacityBarLegendView *)v10 setContentHuggingPriority:0 forAxis:v23];
    LODWORD(v24) = 1144750080;
    [(PSCapacityBarLegendView *)v10 setContentHuggingPriority:1 forAxis:v24];
    [(PSCapacityBarLegendView *)v10 createConstraints];
    [(PSCapacityBarLegendView *)v10 setNeedsLayout];
    [(PSCapacityBarLegendView *)v10 layoutIfNeeded];
  }

  return v10;
}

- (void)createConstraints
{
  id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  v3 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendLabel attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [v11 addObject:v3];

  id v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:8 relatedBy:0 toItem:self->_legendLabel attribute:8 multiplier:1.0 constant:0.0];
  [v11 addObject:v4];

  double v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendColor attribute:8 relatedBy:0 toItem:self->_legendLabel attribute:8 multiplier:0.5 constant:0.0];
  [v11 addObject:v5];

  double v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendColor attribute:7 relatedBy:0 toItem:self->_legendColor attribute:8 multiplier:1.0 constant:0.0];
  [v11 addObject:v6];

  double v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendColor attribute:4 relatedBy:0 toItem:self->_legendLabel attribute:12 multiplier:1.0 constant:0.0];
  [v11 addObject:v7];

  double v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendColor attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [v11 addObject:v8];

  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendLabel attribute:5 relatedBy:0 toItem:self->_legendColor attribute:6 multiplier:1.0 constant:6.0];
  [v11 addObject:v9];

  v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:6 relatedBy:0 toItem:self->_legendLabel attribute:6 multiplier:1.0 constant:0.0];
  [v11 addObject:v10];

  [MEMORY[0x1E4F28DC8] activateConstraints:v11];
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return [(UILabel *)self->_legendLabel textColor];
}

- (void)setText:(id)a3
{
  legendLabel = self->_legendLabel;
  id v5 = a3;
  [(UILabel *)legendLabel setText:v5];
  [(PSCapacityBarLegendView *)self setAccessibilityIdentifier:v5];

  [(PSCapacityBarLegendView *)self setNeedsLayout];
}

- (NSString)text
{
  return [(UILabel *)self->_legendLabel text];
}

- (void)setColor:(id)a3
{
}

- (UIColor)color
{
  return [(PSLegendColorView *)self->_legendColor color];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legendLabel, 0);
  objc_storeStrong((id *)&self->_legendColor, 0);
}

@end