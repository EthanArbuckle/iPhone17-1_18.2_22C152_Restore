@interface COSFeatureHighlightRowView
- (CGSize)_sizeThatFits:(CGSize)a3 doLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (COSFeatureHighlightRowView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UILabel)body;
- (UILabel)title;
- (void)layoutSubviews;
@end

@implementation COSFeatureHighlightRowView

- (COSFeatureHighlightRowView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)COSFeatureHighlightRowView;
  v3 = -[COSFeatureHighlightRowView initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v4;

    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    title = v3->_title;
    v3->_title = v10;

    [(UILabel *)v3->_title setNumberOfLines:0];
    v12 = v3->_title;
    uint64_t v13 = UIFontSystemFontDesignAlternate;
    v14 = +[UIFont systemFontOfSize:UIFontSystemFontDesignAlternate weight:15.0 design:UIFontWeightMedium];
    [(UILabel *)v12 setFont:v14];

    v15 = v3->_title;
    v16 = BPSTextColor();
    [(UILabel *)v15 setTextColor:v16];

    v17 = v3->_title;
    v18 = +[UIColor clearColor];
    [(UILabel *)v17 setBackgroundColor:v18];

    [(UILabel *)v3->_title setTextAlignment:4];
    v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    boddouble y = v3->_body;
    v3->_boddouble y = v19;

    [(UILabel *)v3->_body setNumberOfLines:0];
    v21 = v3->_body;
    v22 = +[UIFont systemFontOfSize:v13 weight:15.0 design:UIFontWeightRegular];
    [(UILabel *)v21 setFont:v22];

    v23 = v3->_body;
    v24 = +[UIColor systemGrayColor];
    [(UILabel *)v23 setTextColor:v24];

    v25 = v3->_body;
    v26 = +[UIColor clearColor];
    [(UILabel *)v25 setBackgroundColor:v26];

    [(UILabel *)v3->_body setTextAlignment:4];
    [(COSFeatureHighlightRowView *)v3 addSubview:v3->_imageView];
    [(COSFeatureHighlightRowView *)v3 addSubview:v3->_title];
    [(COSFeatureHighlightRowView *)v3 addSubview:v3->_body];
  }
  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)COSFeatureHighlightRowView;
  [(COSFeatureHighlightRowView *)&v5 layoutSubviews];
  [(COSFeatureHighlightRowView *)self bounds];
  -[COSFeatureHighlightRowView _sizeThatFits:doLayout:](self, "_sizeThatFits:doLayout:", 1, v3, v4);
}

- (CGSize)_sizeThatFits:(CGSize)a3 doLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = PSLocaleLanguageDirection();
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v10 = v9;
  double v12 = v11;
  *(float *)&double v9 = (height - v11) * 0.5;
  double v13 = floorf(*(float *)&v9);
  __asm { FMOV            V2.2D, #13.0 }
  double v40 = 0.0;
  if (_ZF) {
    double v19 = width - v10;
  }
  else {
    double v19 = 0.0;
  }
  BPSScreenValueGetRelevantValue();
  double v21 = v20;
  double v38 = v19;
  double v39 = v13;
  v43.origin.x = v19;
  v43.origin.double y = v13;
  v43.size.double width = v10;
  v43.size.double height = v12;
  double v22 = v21 + CGRectGetWidth(v43);
  double v41 = width;
  double v23 = width - v22;
  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", width - v22, 0.0);
  double v25 = v24;
  -[UILabel sizeThatFits:](self->_body, "sizeThatFits:", v23, 0.0);
  double v27 = v26;
  __asm { FMOV            V1.2D, #3.0 }
  BPSScreenValueGetRelevantValue();
  double v30 = v29;
  double v37 = v27;
  double v31 = v25 + v27 + v29;
  *(float *)&double v29 = (height - v31) * 0.5;
  double v32 = floorf(*(float *)&v29);
  v44.origin.x = v22;
  v44.origin.double y = v32;
  v44.size.double width = v23;
  v44.size.double height = v25;
  double MaxY = CGRectGetMaxY(v44);
  if (v8 != 2)
  {
    double v40 = v22;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v45.origin.x = 0.0;
  v45.origin.double y = v32;
  v45.size.double width = v23;
  v45.size.double height = v25;
  double MaxY = CGRectGetMaxY(v45);
  double v22 = 0.0;
  if (v4)
  {
LABEL_8:
    double v34 = v30 + MaxY;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v38, v39, v10, v12);
    -[UILabel setFrame:](self->_title, "setFrame:", v40, v32, v23, v25);
    -[UILabel setFrame:](self->_body, "setFrame:", v22, v34, v23, v37);
  }
LABEL_9:
  if (v31 >= v12) {
    double v35 = v31;
  }
  else {
    double v35 = v12;
  }
  double v36 = v41;
  result.double height = v35;
  result.double width = v36;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[COSFeatureHighlightRowView _sizeThatFits:doLayout:](self, "_sizeThatFits:doLayout:", 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)title
{
  return self->_title;
}

- (UILabel)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end