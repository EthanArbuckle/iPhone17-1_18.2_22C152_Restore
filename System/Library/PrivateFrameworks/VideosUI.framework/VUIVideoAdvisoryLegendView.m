@interface VUIVideoAdvisoryLegendView
- (CGSize)legendDescriptionSizeThatFits:(CGSize)a3;
- (CGSize)legendNameSizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)legendDescription;
- (NSString)legendName;
- (VUILabel)legendDescriptionLabel;
- (VUILabel)legendNameLabel;
- (VUIVideoAdvisoryLegendView)initWithLayout:(id)a3;
- (VUIVideoAdvisoryViewLayout)layout;
- (void)layoutSubviews;
- (void)setLayout:(id)a3;
- (void)setLegendDescription:(id)a3;
- (void)setLegendDescriptionLabel:(id)a3;
- (void)setLegendName:(id)a3;
- (void)setLegendNameLabel:(id)a3;
@end

@implementation VUIVideoAdvisoryLegendView

- (VUIVideoAdvisoryLegendView)initWithLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIVideoAdvisoryLegendView;
  v6 = -[VUIVideoAdvisoryLegendView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layout, a3);
  }

  return v7;
}

- (CGSize)legendNameSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(VUIVideoAdvisoryLegendView *)self bounds];
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double height = v7;
    double width = v6;
  }
  v8 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;

  v13 = [(VUIVideoAdvisoryLegendView *)self layout];
  v14 = v13;
  double v15 = v12;
  if (v10 > v12)
  {
    [v13 legendNamePadding];
    double v17 = v16;
    [v14 legendNamePadding];
    double v15 = v10 + v17 + v18;
  }

  double v19 = v15;
  double v20 = v12;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (CGSize)legendDescriptionSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(VUIVideoAdvisoryLegendView *)self bounds];
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double height = v7;
    double width = v6;
  }
  v8 = [(VUIVideoAdvisoryLegendView *)self legendDescriptionLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;

  v13 = [(VUIVideoAdvisoryLegendView *)self layout];
  v14 = v13;
  double v15 = v12;
  if (v10 > v12)
  {
    [v13 legendNamePadding];
    double v15 = v10 + v16;
  }

  double v17 = v15;
  double v18 = v12;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[VUIVideoAdvisoryLegendView legendNameSizeThatFits:](self, "legendNameSizeThatFits:");
  double v7 = v6;
  v8 = [(VUIVideoAdvisoryLegendView *)self legendDescriptionLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;

  if (v7 >= v10) {
    double v11 = v7;
  }
  else {
    double v11 = v10;
  }
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)VUIVideoAdvisoryLegendView;
  [(VUIVideoAdvisoryLegendView *)&v41 layoutSubviews];
  v3 = [(VUIVideoAdvisoryLegendView *)self layout];
  [(VUIVideoAdvisoryLegendView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(VUIVideoAdvisoryLegendView *)self effectiveUserInterfaceLayoutDirection];
  -[VUIVideoAdvisoryLegendView legendNameSizeThatFits:](self, "legendNameSizeThatFits:", v5, v7);
  double v10 = v9;
  [v3 legendNameMinWidth];
  double v12 = v11;
  double v13 = v5 - v7;
  v14 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];

  if (v14)
  {
    if (v8 == 1) {
      double v15 = v5 - v7;
    }
    else {
      double v15 = 0.0;
    }
    if (v10 >= v12) {
      double v16 = v10;
    }
    else {
      double v16 = v12;
    }
    if (v16 >= v7) {
      double v17 = v16;
    }
    else {
      double v17 = v7;
    }
    double v18 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
    objc_msgSend(v18, "setFrame:", v15, 0.0, v17, v7);
  }
  double v19 = [(VUIVideoAdvisoryLegendView *)self legendDescriptionLabel];
  objc_msgSend(v19, "sizeThatFits:", v5, v7);
  double v21 = v20;
  double v23 = v22;

  if (v8 == 1)
  {
    [v3 legendsMargin];
    double v25 = v21 + v24;
    v26 = [v3 descriptionLayout];
    [v26 margin];
    double v28 = v13 - (v25 + v27);
  }
  else
  {
    v26 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
    if (v26)
    {
      v29 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
      [v29 frame];
      double v31 = v30;
      [v3 legendsMargin];
      double v33 = v31 + v32;
      v34 = [v3 descriptionLayout];
      [v34 margin];
      double v28 = v33 + v35 + 0.0;
    }
    else
    {
      double v28 = 0.0;
    }
  }

  v36 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
  if (v36)
  {
    v37 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
    [v37 frame];
    double v39 = (v38 - v23) * 0.5;
  }
  else
  {
    double v39 = 0.0;
  }

  v40 = [(VUIVideoAdvisoryLegendView *)self legendDescriptionLabel];
  objc_msgSend(v40, "setFrame:", v28, v39, v21, v23);
}

- (NSString)legendName
{
  v2 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setLegendName:(id)a3
{
  id v15 = a3;
  if ([v15 length])
  {
    double v4 = [(VUIVideoAdvisoryLegendView *)self layout];
    double v5 = [v4 legendLayout];
    double v6 = +[VUILabel labelWithString:v15 textLayout:v5 existingLabel:0];

    double v7 = [(VUIVideoAdvisoryLegendView *)self layout];
    uint64_t v8 = [v7 legendLayout];
    [v8 margin];
    objc_msgSend(v6, "setPadding:");

    double v9 = [(VUIVideoAdvisoryLegendView *)self layout];
    double v10 = [v9 legendBackgroundColor];
    [v6 setBackgroundColor:v10];

    [v6 setClipsToBounds:1];
    double v11 = [v6 layer];
    double v12 = [(VUIVideoAdvisoryLegendView *)self layout];
    [v12 legendCornerRadius];
    objc_msgSend(v11, "setCornerRadius:");

    double v13 = [v6 layer];
    [v13 setCompositingFilter:*MEMORY[0x1E4F3A370]];

    v14 = [(VUIVideoAdvisoryLegendView *)self legendNameLabel];
    [v14 removeFromSuperview];

    [(VUIVideoAdvisoryLegendView *)self setLegendNameLabel:v6];
    [(VUIVideoAdvisoryLegendView *)self addSubview:v6];
    [(VUIVideoAdvisoryLegendView *)self setNeedsLayout];
  }
}

- (NSString)legendDescription
{
  v2 = [(VUIVideoAdvisoryLegendView *)self legendDescriptionLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setLegendDescription:(id)a3
{
  id v8 = a3;
  if ([v8 length])
  {
    double v4 = [(VUIVideoAdvisoryLegendView *)self layout];
    double v5 = [v4 descriptionLayout];
    double v6 = +[VUILabel labelWithString:v8 textLayout:v5 existingLabel:0];

    double v7 = [(VUIVideoAdvisoryLegendView *)self legendDescriptionLabel];
    [v7 removeFromSuperview];

    [(VUIVideoAdvisoryLegendView *)self setLegendDescriptionLabel:v6];
    [(VUIVideoAdvisoryLegendView *)self addSubview:v6];
    [(VUIVideoAdvisoryLegendView *)self setNeedsLayout];
  }
}

- (VUIVideoAdvisoryViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (VUILabel)legendNameLabel
{
  return self->_legendNameLabel;
}

- (void)setLegendNameLabel:(id)a3
{
}

- (VUILabel)legendDescriptionLabel
{
  return self->_legendDescriptionLabel;
}

- (void)setLegendDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legendDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_legendNameLabel, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end