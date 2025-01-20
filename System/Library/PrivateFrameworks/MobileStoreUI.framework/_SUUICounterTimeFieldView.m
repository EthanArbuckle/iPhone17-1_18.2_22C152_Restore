@interface _SUUICounterTimeFieldView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)labelLabel;
- (UILabel)valueLabel;
- (_SUUICounterTimeFieldView)initWithFrame:(CGRect)a3;
- (unint64_t)visibilityField;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setVisibilityField:(unint64_t)a3;
@end

@implementation _SUUICounterTimeFieldView

- (_SUUICounterTimeFieldView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_SUUICounterTimeFieldView;
  v3 = -[_SUUICounterTimeFieldView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    labelLabel = v3->_labelLabel;
    v3->_labelLabel = v4;

    v6 = v3->_labelLabel;
    v7 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-CondensedBold" size:14.0];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)v3->_labelLabel setTextAlignment:1];
    [(_SUUICounterTimeFieldView *)v3 addSubview:v3->_labelLabel];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = v8;

    v10 = v3->_valueLabel;
    v11 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-CondensedBold" size:28.0];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v3->_valueLabel setTextAlignment:1];
    [(_SUUICounterTimeFieldView *)v3 addSubview:v3->_valueLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(_SUUICounterTimeFieldView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_valueLabel frame];
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v4, v6);
  uint64_t v9 = v8;
  if (v7 >= v4) {
    double v10 = v4;
  }
  else {
    double v10 = v7;
  }
  float v11 = (v4 - v10) * 0.5;
  double v12 = floorf(v11);
  uint64_t v13 = 0;
  CGRect v28 = CGRectIntegral(*(CGRect *)(&v9 - 3));
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  -[UILabel setFrame:](self->_valueLabel, "setFrame:");
  [(UILabel *)self->_labelLabel frame];
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v4, v6);
  CGFloat v20 = v19;
  if (v18 >= v4) {
    double v21 = v4;
  }
  else {
    double v21 = v18;
  }
  float v22 = (v4 - v21) * 0.5;
  CGFloat v23 = floorf(v22);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v29);
  [(UILabel *)self->_valueLabel _baselineOffsetFromBottom];
  *(float *)&double v25 = MaxY - v25 + 2.0;
  v30.origin.CGFloat y = roundf(*(float *)&v25);
  v30.origin.CGFloat x = v23;
  v30.size.CGFloat width = v21;
  v30.size.CGFloat height = v20;
  CGRect v31 = CGRectIntegral(v30);
  labelLabel = self->_labelLabel;
  -[UILabel setFrame:](labelLabel, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void)setBackgroundColor:(id)a3
{
  labelLabel = self->_labelLabel;
  id v5 = a3;
  [(UILabel *)labelLabel setBackgroundColor:v5];
  [(UILabel *)self->_valueLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)_SUUICounterTimeFieldView;
  [(_SUUICounterTimeFieldView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", width, height);
  double v11 = v10;
  double v13 = v9 + v12;
  [(UILabel *)self->_valueLabel _baselineOffsetFromBottom];
  *(float *)&double v14 = v13 - v14 + 2.0;
  double v15 = ceilf(*(float *)&v14);
  if (v7 >= v11) {
    double v16 = v7;
  }
  else {
    double v16 = v11;
  }
  if (width < v16) {
    double v16 = width;
  }
  float v17 = v16;
  double v18 = ceilf(v17);
  result.double height = v15;
  result.double width = v18;
  return result;
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (unint64_t)visibilityField
{
  return self->_visibilityField;
}

- (void)setVisibilityField:(unint64_t)a3
{
  self->_visibilityField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
}

@end