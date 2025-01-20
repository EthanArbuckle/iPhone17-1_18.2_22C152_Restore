@interface MapsGuidanceLevelLabel
- (MapsGuidanceLevelLabel)initWithFrame:(CGRect)a3;
- (NSString)text;
- (void)layoutSubviews;
- (void)setText:(id)a3;
- (void)sizeToFit;
@end

@implementation MapsGuidanceLevelLabel

- (MapsGuidanceLevelLabel)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MapsGuidanceLevelLabel;
  v3 = -[MapsGuidanceLevelLabel initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    label = v3->_label;
    v3->_label = v4;

    v6 = +[UIColor whiteColor];
    [(UILabel *)v3->_label setTextColor:v6];

    v7 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v3->_label setBackgroundColor:v7];

    v8 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v3->_label setFont:v8];

    [(UILabel *)v3->_label setTextAlignment:2];
    [(MapsGuidanceLevelLabel *)v3 addSubview:v3->_label];
    uint64_t v9 = +[CAShapeLayer layer];
    roundedCorner = v3->_roundedCorner;
    v3->_roundedCorner = (CAShapeLayer *)v9;

    id v11 = [(UILabel *)v3->_label backgroundColor];
    -[CAShapeLayer setFillColor:](v3->_roundedCorner, "setFillColor:", [v11 CGColor]);

    v12 = [(MapsGuidanceLevelLabel *)v3 layer];
    [v12 addSublayer:v3->_roundedCorner];

    v13 = v3;
  }

  return v3;
}

- (void)sizeToFit
{
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label bounds];
  double v4 = v3 * 0.5;
  [(UILabel *)self->_label bounds];
  -[CAShapeLayer setBounds:](self->_roundedCorner, "setBounds:", 0.0, 0.0, v4);
  [(CAShapeLayer *)self->_roundedCorner bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(CAShapeLayer *)self->_roundedCorner bounds];
  double v14 = v13;
  [(CAShapeLayer *)self->_roundedCorner bounds];
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 8, v6, v8, v10, v12, v14, v15);
  id v20 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_roundedCorner, "setPath:", [v20 CGPath]);
  [(UILabel *)self->_label bounds];
  -[UILabel setBounds:](self->_label, "setBounds:");
  [(CAShapeLayer *)self->_roundedCorner bounds];
  double v17 = v16;
  [(UILabel *)self->_label bounds];
  double v19 = v17 + v18;
  [(UILabel *)self->_label bounds];
  -[MapsGuidanceLevelLabel setBounds:](self, "setBounds:", 0.0, 0.0, v19);
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)MapsGuidanceLevelLabel;
  [(MapsGuidanceLevelLabel *)&v8 layoutSubviews];
  [(UILabel *)self->_label bounds];
  double v4 = v3;
  [(UILabel *)self->_label bounds];
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, 0.0, v4);
  [(UILabel *)self->_label frame];
  double MaxX = CGRectGetMaxX(v9);
  [(CAShapeLayer *)self->_roundedCorner bounds];
  double v7 = v6;
  [(CAShapeLayer *)self->_roundedCorner bounds];
  -[CAShapeLayer setFrame:](self->_roundedCorner, "setFrame:", MaxX, 0.0, v7);
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedCorner, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end