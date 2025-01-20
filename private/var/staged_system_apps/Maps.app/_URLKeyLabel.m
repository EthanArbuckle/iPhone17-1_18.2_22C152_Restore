@interface _URLKeyLabel
- (_URLKeyLabel)initWithString:(id)a3 color:(id)a4;
- (void)layoutSubviews;
- (void)sizeToFit;
@end

@implementation _URLKeyLabel

- (_URLKeyLabel)initWithString:(id)a3 color:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_URLKeyLabel;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[_URLKeyLabel initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v11->_label;
    v11->_label = v12;

    +[UIFont systemFontSize];
    v14 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [(UILabel *)v11->_label setFont:v14];

    [(UILabel *)v11->_label setText:v6];
    [(UILabel *)v11->_label setTextColor:v7];
    [(UILabel *)v11->_label setBackgroundColor:0];
    [(UILabel *)v11->_label setOpaque:0];
    [(UILabel *)v11->_label sizeToFit];
    v15 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 16.0, 16.0];
    colorView = v11->_colorView;
    v11->_colorView = v15;

    [(UIView *)v11->_colorView setBackgroundColor:v7];
    [(_URLKeyLabel *)v11 addSubview:v11->_label];
    [(_URLKeyLabel *)v11 addSubview:v11->_colorView];
    [(_URLKeyLabel *)v11 sizeToFit];
    v17 = v11;
  }

  return v11;
}

- (void)sizeToFit
{
  [(_URLKeyLabel *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_label bounds];
  double v8 = v7;
  [(UIView *)self->_colorView bounds];
  if (v8 <= v9) {
    uint64_t v10 = 16;
  }
  else {
    uint64_t v10 = 8;
  }
  [*(id *)((char *)&self->super.super.super.isa + v10) bounds];
  double v12 = v11;
  [(UIView *)self->_colorView bounds];
  double v14 = v13 + 4.0;
  [(UILabel *)self->_label bounds];
  double v16 = v14 + v15;

  -[_URLKeyLabel setFrame:](self, "setFrame:", v4, v6, v16, v12);
}

- (void)layoutSubviews
{
  [(_URLKeyLabel *)self bounds];
  double v4 = v3;
  [(UIView *)self->_colorView bounds];
  double v6 = (v4 - v5) * 0.5;
  [(UIView *)self->_colorView bounds];
  double v8 = v7;
  [(UIView *)self->_colorView bounds];
  -[UIView setFrame:](self->_colorView, "setFrame:", 0.0, v6, v8);
  [(UIView *)self->_colorView frame];
  double v9 = CGRectGetMaxX(v18) + 4.0;
  [(_URLKeyLabel *)self bounds];
  double v11 = v10;
  [(UILabel *)self->_label bounds];
  double v13 = (v11 - v12) * 0.5;
  [(UILabel *)self->_label bounds];
  double v15 = v14;
  [(UILabel *)self->_label bounds];
  label = self->_label;

  -[UILabel setFrame:](label, "setFrame:", v9, v13, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end