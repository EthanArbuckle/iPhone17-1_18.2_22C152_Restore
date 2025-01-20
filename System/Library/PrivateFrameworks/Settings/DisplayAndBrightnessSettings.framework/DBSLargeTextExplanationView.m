@interface DBSLargeTextExplanationView
- (DBSLargeTextExplanationView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutSubviews;
@end

@implementation DBSLargeTextExplanationView

- (DBSLargeTextExplanationView)initWithSpecifier:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)DBSLargeTextExplanationView;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  v7 = -[DBSLargeTextExplanationView initWithFrame:](&v25, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], v4, v5, v6);
  if (v7)
  {
    v8 = [MEMORY[0x263F82670] currentDevice];
    char v9 = objc_msgSend(v8, "sf_isiPhone");

    if (v9)
    {
      v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      p_bodyExampleLabel = &v7->_bodyExampleLabel;
      bodyExampleLabel = v7->_bodyExampleLabel;
      v7->_bodyExampleLabel = v10;

      v13 = [MEMORY[0x263F825C8] clearColor];
      [(UILabel *)v7->_bodyExampleLabel setBackgroundColor:v13];

      v14 = [MEMORY[0x263F5FBC0] appearance];
      v15 = [v14 textColor];
      [(UILabel *)v7->_bodyExampleLabel setTextColor:v15];

      [(UILabel *)v7->_bodyExampleLabel setNumberOfLines:0];
      [(UILabel *)v7->_bodyExampleLabel setLineBreakMode:0];
      [(UILabel *)v7->_bodyExampleLabel setTextAlignment:1];
      v16 = DBS_LocalizedStringForLargeFontSettings(@"DYNAMIC_TYPE_DESCRIPTION");
      [(UILabel *)v7->_bodyExampleLabel setText:v16];

      LODWORD(v17) = 0.5;
      [(UILabel *)v7->_bodyExampleLabel _setHyphenationFactor:v17];
    }
    else
    {
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F82D60]), "initWithFrame:", v3, v4, v5, v6);
      p_bodyExampleLabel = &v7->_bodyExampleTextView;
      bodyExampleTextView = v7->_bodyExampleTextView;
      v7->_bodyExampleTextView = (UITextView *)v18;

      v20 = DBS_LocalizedStringForLargeFontSettings(@"DYNAMIC_TYPE_DESCRIPTION");
      [(UITextView *)v7->_bodyExampleTextView setText:v20];

      v21 = [MEMORY[0x263F825C8] clearColor];
      [(UITextView *)v7->_bodyExampleTextView setBackgroundColor:v21];

      v22 = [MEMORY[0x263F5FBC0] appearance];
      v23 = [v22 textColor];
      [(UITextView *)v7->_bodyExampleTextView setTextColor:v23];

      [(UITextView *)v7->_bodyExampleTextView setTextAlignment:1];
      [(UITextView *)v7->_bodyExampleTextView setEditable:0];
      -[UITextView setTextContainerInset:](v7->_bodyExampleTextView, "setTextContainerInset:", 0.0, 25.0, 0.0, 25.0);
    }
    [(DBSLargeTextExplanationView *)v7 addSubview:*p_bodyExampleLabel];
  }
  return v7;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)DBSLargeTextExplanationView;
  [(DBSLargeTextExplanationView *)&v6 layoutSubviews];
  [(DBSLargeTextExplanationView *)self bounds];
  double v4 = v3;
  double v5 = [(DBSLargeTextExplanationView *)self superview];
  [(DBSLargeTextExplanationView *)self layoutForWidth:v5 inTableView:v4];
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  [(DBSLargeTextExplanationView *)self layoutForWidth:a4 inTableView:a3];
  double v5 = [MEMORY[0x263F82670] currentDevice];
  int v6 = objc_msgSend(v5, "sf_isiPhone");
  v7 = &OBJC_IVAR___DBSLargeTextExplanationView__bodyExampleTextView;
  if (v6) {
    v7 = &OBJC_IVAR___DBSLargeTextExplanationView__bodyExampleLabel;
  }
  id v8 = *(id *)((char *)&self->super.super.super.isa + *v7);

  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v18.origin.x = v10;
  v18.origin.y = v12;
  v18.size.width = v14;
  v18.size.height = v16;
  return CGRectGetMaxY(v18) + 10.0;
}

- (void)layoutForWidth:(double)a3 inTableView:(id)a4
{
  objc_msgSend(a4, "bounds", a3);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  double v13 = [MEMORY[0x263F82670] currentDevice];
  int v14 = objc_msgSend(v13, "sf_isiPhone");

  if (v14)
  {
    [(DBSLargeTextExplanationView *)self frame];
    double MinX = CGRectGetMinX(v27);
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    double v10 = v10 + (MinX - CGRectGetMinX(v28) + 25.0) * -2.0;
  }
  if (v10 > 0.0)
  {
    id v25 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
    CGFloat v16 = objc_msgSend(MEMORY[0x263F81708], "fontWithDescriptor:size:", 0.0);
    double v17 = [MEMORY[0x263F82670] currentDevice];
    char v18 = objc_msgSend(v17, "sf_isiPhone");

    if (v18)
    {
      p_bodyExampleLabel = (id *)&self->_bodyExampleLabel;
      [(UILabel *)self->_bodyExampleLabel setFont:v16];
      [(UILabel *)self->_bodyExampleLabel frame];
      -[UILabel sizeThatFits:](self->_bodyExampleLabel, "sizeThatFits:", v10, 1.79769313e308);
      double v21 = v20;
      double v22 = 10.0;
      double v23 = 25.0;
    }
    else
    {
      p_bodyExampleLabel = (id *)&self->_bodyExampleTextView;
      [(UITextView *)self->_bodyExampleTextView setFont:v16];
      [(UITextView *)self->_bodyExampleTextView frame];
      [(DBSLargeTextExplanationView *)self frame];
      double v23 = (v10 - v24) * -0.5;
      v29.origin.x = v6;
      v29.origin.y = v8;
      v29.size.width = v10;
      v29.size.height = v12;
      double v21 = CGRectGetHeight(v29) + -80.0;
      double v22 = 10.0;
    }
    objc_msgSend(*p_bodyExampleLabel, "setFrame:", v23, v22, v10, v21);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyExampleTextView, 0);
  objc_storeStrong((id *)&self->_bodyExampleLabel, 0);
}

@end