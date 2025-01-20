@interface PUPlayheadView
- (PUPlayheadView)initWithFrame:(CGRect)a3;
- (UIColor)preferredHighlightColor;
- (void)_updateLineColor;
- (void)layoutSubviews;
- (void)setPreferredHighlightColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation PUPlayheadView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredHighlightColor, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

- (UIColor)preferredHighlightColor
{
  return self->_preferredHighlightColor;
}

- (void)_updateLineColor
{
  uint64_t v3 = [(PUPlayheadView *)self preferredHighlightColor];
  if (!v3)
  {
    v4 = +[PUInterfaceManager currentTheme];
    id v5 = [v4 playheadColor];

    uint64_t v3 = (uint64_t)v5;
    if (!v5)
    {
      uint64_t v3 = [(PUPlayheadView *)self tintColor];
    }
  }
  id v6 = (id)v3;
  [(UIView *)self->_line setBackgroundColor:v3];
}

- (void)setPreferredHighlightColor:(id)a3
{
  v7 = (UIColor *)a3;
  id v5 = self->_preferredHighlightColor;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIColor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredHighlightColor, a3);
      [(PUPlayheadView *)self _updateLineColor];
    }
  }
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PUPlayheadView;
  [(PUPlayheadView *)&v24 layoutSubviews];
  [(PUPlayheadView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(PUPlayheadView *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  CGFloat v14 = (CGRectGetWidth(v25) + -2.0) * 0.5;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  CGFloat v15 = CGRectGetMinY(v26) + 1.0;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  double v16 = round(v13 * (v15 + CGRectGetHeight(v27) + -2.0)) / v13;
  double v17 = round(v13 * v14) / v13;
  double v18 = round(v13 * v15) / v13;
  -[UIView setFrame:](self->_line, "setFrame:", v17, v18, round(v13 * (v14 + 2.0)) / v13 - v17, v16 - v18);
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  CGFloat v19 = (CGRectGetWidth(v28) + -4.0) * 0.5;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  double MinY = CGRectGetMinY(v29);
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  double v21 = round(v13 * (MinY + CGRectGetHeight(v30))) / v13;
  double v22 = round(v13 * v19) / v13;
  double v23 = round(v13 * MinY) / v13;
  -[UIView setFrame:](self->_outline, "setFrame:", v22, v23, round(v13 * (v19 + 4.0)) / v13 - v22, v21 - v23);
  [(PUPlayheadView *)self _updateLineColor];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUPlayheadView;
  [(PUPlayheadView *)&v3 tintColorDidChange];
  [(PUPlayheadView *)self _updateLineColor];
}

- (PUPlayheadView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PUPlayheadView;
  objc_super v3 = -[PUPlayheadView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CGFloat v4 = +[PUInterfaceManager currentTheme];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    line = v3->_line;
    v3->_line = (UIView *)v10;

    double v12 = [(UIView *)v3->_line layer];
    [v12 setCornerRadius:1.0];

    [(PUPlayheadView *)v3 addSubview:v3->_line];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
    outline = v3->_outline;
    v3->_outline = (UIView *)v13;

    CGFloat v15 = [(UIView *)v3->_outline layer];
    [v15 setBorderWidth:1.0];

    double v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v3->_outline setBackgroundColor:v16];

    id v17 = [v4 playheadOutlineColor];
    uint64_t v18 = [v17 CGColor];
    CGFloat v19 = [(UIView *)v3->_outline layer];
    [v19 setBorderColor:v18];

    v20 = [(UIView *)v3->_outline layer];
    [v20 setCornerRadius:2.0];

    [(PUPlayheadView *)v3 addSubview:v3->_outline];
    [(PUPlayheadView *)v3 _updateLineColor];
    double v21 = [v4 playheadBackgroundColor];
    [(PUPlayheadView *)v3 setBackgroundColor:v21];

    [(PUPlayheadView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

@end