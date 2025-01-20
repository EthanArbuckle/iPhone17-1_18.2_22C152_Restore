@interface SKUIGiftConfirmLabeledValue
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)label;
- (NSString)subtitleLabel;
- (NSString)value;
- (SKUIGiftConfirmLabeledValue)initWithGiftConfirmLabelStyle:(int64_t)a3;
- (int64_t)giftConfirmLabelStyle;
- (void)layoutSubviews;
- (void)setLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SKUIGiftConfirmLabeledValue

- (SKUIGiftConfirmLabeledValue)initWithGiftConfirmLabelStyle:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIGiftConfirmLabeledValue;
  v5 = [(SKUIGiftConfirmLabeledValue *)&v14 init];
  if (v5)
  {
    if (a3 == 2)
    {
      v6 = objc_alloc_init(SKUIGiftDashView);
      dashView = v5->_dashView;
      v5->_dashView = v6;

      v8 = v5->_dashView;
      v9 = [MEMORY[0x1E4FB1618] clearColor];
      [(SKUIGiftDashView *)v8 setBackgroundColor:v9];

      v10 = v5->_dashView;
      v11 = [MEMORY[0x1E4FB1618] _labelColor];
      v12 = [v11 colorWithAlphaComponent:0.3];
      [(SKUIGiftDashView *)v10 setDashColor:v12];

      -[SKUIGiftDashView setDashSize:](v5->_dashView, "setDashSize:", 1.0, 1.0);
      [(SKUIGiftDashView *)v5->_dashView setDashSpacing:4.0];
      [(SKUIGiftConfirmLabeledValue *)v5 addSubview:v5->_dashView];
    }
    v5->_style = a3;
  }
  return v5;
}

- (NSString)label
{
  return [(UILabel *)self->_labelLabel text];
}

- (void)setLabel:(id)a3
{
  id v15 = a3;
  id v4 = [(SKUIGiftConfirmLabeledValue *)self label];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    labelLabel = self->_labelLabel;
    if (v15)
    {
      if (!labelLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v7 = self->_labelLabel;
        self->_labelLabel = v6;

        v8 = self->_labelLabel;
        v9 = [MEMORY[0x1E4FB1618] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_labelLabel;
        v11 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:13.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_labelLabel;
        v13 = [MEMORY[0x1E4FB1618] _labelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(UILabel *)self->_labelLabel setTextAlignment:4];
        [(SKUIGiftConfirmLabeledValue *)self addSubview:self->_labelLabel];
        labelLabel = self->_labelLabel;
      }
      -[UILabel setText:](labelLabel, "setText:");
      [(UILabel *)self->_labelLabel sizeToFit];
    }
    else
    {
      [(UILabel *)labelLabel removeFromSuperview];
      objc_super v14 = self->_labelLabel;
      self->_labelLabel = 0;
    }
    [(SKUIGiftConfirmLabeledValue *)self setNeedsLayout];
  }
}

- (NSString)subtitleLabel
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitleLabel:(id)a3
{
  id v15 = a3;
  id v4 = [(SKUIGiftConfirmLabeledValue *)self subtitleLabel];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    subtitleLabel = self->_subtitleLabel;
    if (v15)
    {
      if (!subtitleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v7 = self->_subtitleLabel;
        self->_subtitleLabel = v6;

        v8 = self->_subtitleLabel;
        v9 = [MEMORY[0x1E4FB1618] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_subtitleLabel;
        v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_subtitleLabel;
        v13 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(UILabel *)self->_subtitleLabel setTextAlignment:4];
        [(SKUIGiftConfirmLabeledValue *)self addSubview:self->_subtitleLabel];
        subtitleLabel = self->_subtitleLabel;
      }
      -[UILabel setText:](subtitleLabel, "setText:");
      [(UILabel *)self->_subtitleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)subtitleLabel removeFromSuperview];
      objc_super v14 = self->_subtitleLabel;
      self->_subtitleLabel = 0;
    }
    [(SKUIGiftConfirmLabeledValue *)self setNeedsLayout];
  }
}

- (void)setValue:(id)a3
{
  id v20 = a3;
  id v4 = [(SKUIGiftConfirmLabeledValue *)self label];
  if (v4 != v20 && ([v20 isEqualToString:v4] & 1) == 0)
  {
    valueLabel = self->_valueLabel;
    if (!v20)
    {
      [(UILabel *)valueLabel removeFromSuperview];
      v17 = self->_valueLabel;
      self->_valueLabel = 0;

LABEL_17:
      [(SKUIGiftConfirmLabeledValue *)self setNeedsLayout];
      goto LABEL_18;
    }
    if (valueLabel)
    {
LABEL_16:
      -[UILabel setText:](valueLabel, "setText:");
      goto LABEL_17;
    }
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v7 = self->_valueLabel;
    self->_valueLabel = v6;

    v8 = self->_valueLabel;
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v8 setBackgroundColor:v9];

    v10 = self->_valueLabel;
    v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    [(UILabel *)v10 setFont:v11];

    v12 = self->_valueLabel;
    v13 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)self->_valueLabel setTextAlignment:4];
    int64_t style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        v18 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v19 = [v18 userInterfaceIdiom];

        id v15 = self->_valueLabel;
        if (v19 == 1) {
          uint64_t v16 = 7;
        }
        else {
          uint64_t v16 = 6;
        }
      }
      else
      {
        if (style != 2)
        {
LABEL_15:
          [(SKUIGiftConfirmLabeledValue *)self addSubview:self->_valueLabel];
          valueLabel = self->_valueLabel;
          goto LABEL_16;
        }
        id v15 = self->_valueLabel;
        uint64_t v16 = 1;
      }
    }
    else
    {
      id v15 = self->_valueLabel;
      uint64_t v16 = 2;
    }
    [(UILabel *)v15 setNumberOfLines:v16];
    goto LABEL_15;
  }
LABEL_18:
}

- (NSString)value
{
  return [(UILabel *)self->_valueLabel text];
}

- (void)layoutSubviews
{
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  [(SKUIGiftConfirmLabeledValue *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  labelLabel = self->_labelLabel;
  double v14 = v7;
  double v15 = v5;
  if (labelLabel)
  {
    [(UILabel *)labelLabel frame];
    CGFloat v19 = v16;
    CGFloat v20 = v17;
    CGFloat v21 = v18;
    v22 = self->_labelLabel;
    if (v4) {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v6, v16, v17, v18, v6, v8, v10, v12);
    }
    else {
      double v23 = v6;
    }
    [(UILabel *)v22 setFrame:v23];
    v77.origin.CGFloat x = v6;
    v77.origin.CGFloat y = v19;
    v77.size.CGFloat width = v20;
    v77.size.CGFloat height = v21;
    double v15 = CGRectGetMaxX(v77) + 5.0;
    v78.origin.CGFloat x = v6;
    v78.origin.CGFloat y = v19;
    v78.size.CGFloat width = v20;
    v78.size.CGFloat height = v21;
    double v14 = CGRectGetMaxY(v78) + 3.0;
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    double v74 = v14;
    [(UILabel *)subtitleLabel frame];
    CGFloat v28 = v25;
    CGFloat v29 = v26;
    CGFloat v30 = v27;
    v31 = self->_subtitleLabel;
    double v75 = v6;
    if (v4)
    {
      double v32 = v10;
      CGFloat v33 = v15;
      double v34 = v6;
      double v35 = v8;
      double v36 = v8;
      double v37 = v32;
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v15, v25, v26, v27, v34, v36);
      double v15 = v38;
    }
    else
    {
      double v35 = v8;
      double v37 = v10;
      CGFloat v33 = v15;
    }
    [(UILabel *)v31 setFrame:v15];
    v79.origin.CGFloat x = v33;
    v79.origin.CGFloat y = v28;
    v79.size.CGFloat width = v29;
    v79.size.CGFloat height = v30;
    double v15 = CGRectGetMaxX(v79) + 5.0;
    double v10 = v37;
    double v8 = v35;
    double v14 = v74;
    double v6 = v75;
  }
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    [(UILabel *)valueLabel frame];
    double v44 = v43;
    int64_t style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v10 - v6, v12 - v14);
        double v53 = v55;
        double v42 = v56;
        double v44 = v14;
        double v15 = v6;
      }
      else if (style == 2)
      {
        double v46 = v6;
        double v47 = v8;
        double v48 = v12;
        double v49 = v10;
        double v50 = v10 + -5.0 - v15;
        -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v50, v48);
        double v42 = v52;
        if (v51 >= v50) {
          double v53 = v50;
        }
        else {
          double v53 = v51;
        }
        double v10 = v49;
        double v12 = v48;
        double v8 = v47;
        double v6 = v46;
        double v15 = v10 - v53;
      }
      else
      {
        double v53 = v41;
        double v15 = v40;
      }
    }
    else
    {
      double v53 = v10 - v15;
      -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v10 - v15, v12);
      double v42 = v54;
    }
    v57 = self->_valueLabel;
    if (v4)
    {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v15, v44, v53, v42, v6, v8, v10, v12);
      double v15 = v58;
      double v44 = v59;
      double v53 = v60;
    }
    -[UILabel setFrame:](v57, "setFrame:", v15, v44, v53, v42);
  }
  dashView = self->_dashView;
  if (dashView)
  {
    [(SKUIGiftDashView *)dashView frame];
    double v62 = v12 + -1.0;
    if (v4)
    {
      v63 = self->_valueLabel;
      if (v63)
      {
        [(UILabel *)v63 frame];
        double v6 = CGRectGetMaxX(v80) + 2.0;
      }
      v64 = self->_subtitleLabel;
      if (v64 || (v64 = self->_labelLabel) != 0)
      {
        [(UILabel *)v64 frame];
        double v10 = v81.origin.x + -2.0 - v6;
        double v62 = CGRectGetMaxY(v81) + -1.0 + -3.0;
      }
    }
    else
    {
      v65 = self->_subtitleLabel;
      if (v65 || (v65 = self->_labelLabel) != 0)
      {
        [(UILabel *)v65 frame];
        double v66 = v10;
        CGFloat x = v82.origin.x;
        CGFloat y = v82.origin.y;
        CGFloat width = v82.size.width;
        CGFloat height = v82.size.height;
        double v6 = CGRectGetMaxX(v82) + 2.0;
        v83.origin.CGFloat x = x;
        double v10 = v66;
        v83.origin.CGFloat y = y;
        v83.size.CGFloat width = width;
        v83.size.CGFloat height = height;
        double v62 = CGRectGetMaxY(v83) + -1.0 + -3.0;
      }
      v71 = self->_valueLabel;
      if (v71)
      {
        [(UILabel *)v71 frame];
        double v10 = v72 + -2.0 - v6;
      }
    }
    v73 = self->_dashView;
    -[SKUIGiftDashView setFrame:](v73, "setFrame:", v6, v62, v10, 1.0);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    double height = a3.height;
    goto LABEL_5;
  }
  [(UILabel *)labelLabel frame];
  double height = v7;
  if ((self->_style | 2) != 2)
  {
LABEL_5:
    double v9 = width;
    goto LABEL_6;
  }
  double v9 = width - (v6 + 5.0);
LABEL_6:
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    -[UILabel sizeThatFits:](valueLabel, "sizeThatFits:", v9, 1.79769313e308);
    int64_t style = self->_style;
    switch(style)
    {
      case 2:
        goto LABEL_10;
      case 1:
        double height = height + v11 + 3.0;
        break;
      case 0:
LABEL_10:
        if (height < v11) {
          double height = v11;
        }
        break;
    }
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (int64_t)giftConfirmLabelStyle
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);

  objc_storeStrong((id *)&self->_dashView, 0);
}

- (void)initWithGiftConfirmLabelStyle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]";
}

@end