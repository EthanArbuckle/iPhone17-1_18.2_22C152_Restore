@interface PKDisambiguationFooterView
+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 action:(id)a5;
+ (id)descriptionLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDisambiguationFooterView)initWithFrame:(CGRect)a3 action:(id)a4 secondaryAction:(id)a5 title:(id)a6 secondaryTitle:(id)a7 desscription:(id)a8;
- (UILabel)descriptionLabel;
- (double)_recommendedSecondaryActionTopPaddingForTableView:(id)a3;
- (double)bottomPadding;
- (double)secondaryActionTopPadding;
- (double)topPadding;
- (void)layoutSubviews;
- (void)setBottomPadding:(double)a3;
- (void)setSecondaryActionTopPadding:(double)a3;
- (void)setTopPadding:(double)a3;
- (void)sizeToFitForTableView:(id)a3;
@end

@implementation PKDisambiguationFooterView

- (PKDisambiguationFooterView)initWithFrame:(CGRect)a3 action:(id)a4 secondaryAction:(id)a5 title:(id)a6 secondaryTitle:(id)a7 desscription:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKDisambiguationFooterView;
  v21 = -[PKDisambiguationFooterView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  if (v21)
  {
    if (v17)
    {
      uint64_t v22 = [(id)objc_opt_class() buttonWithTitle:v19 textStyle:*MEMORY[0x1E4FB28C8] action:v17];
      actionButton = v21->_actionButton;
      v21->_actionButton = (UIButton *)v22;

      [(PKDisambiguationFooterView *)v21 addSubview:v21->_actionButton];
    }
    if (v18)
    {
      uint64_t v24 = [(id)objc_opt_class() buttonWithTitle:v20 textStyle:*MEMORY[0x1E4FB28F0] action:v18];
      secondaryActionButton = v21->_secondaryActionButton;
      v21->_secondaryActionButton = (UIButton *)v24;

      [(PKDisambiguationFooterView *)v21 addSubview:v21->_secondaryActionButton];
    }
    if (a8)
    {
      uint64_t v26 = [(id)objc_opt_class() descriptionLabel];
      descriptionLabel = v21->_descriptionLabel;
      v21->_descriptionLabel = (UILabel *)v26;

      [(PKDisambiguationFooterView *)v21 addSubview:v21->_descriptionLabel];
    }
  }

  return v21;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
  [(PKDisambiguationFooterView *)self setNeedsLayout];
}

- (void)setSecondaryActionTopPadding:(double)a3
{
  self->_secondaryActionTopPadding = a3;
  [(PKDisambiguationFooterView *)self setNeedsLayout];
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
  [(PKDisambiguationFooterView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKDisambiguationFooterView *)self layoutMargins];
  double v7 = v6;
  [(PKDisambiguationFooterView *)self layoutMargins];
  double v9 = v7 + v8 + 0.0;
  [(PKDisambiguationFooterView *)self layoutMargins];
  double v11 = v10;
  [(PKDisambiguationFooterView *)self layoutMargins];
  double v13 = v12;
  double topPadding = self->_topPadding;
  if (topPadding <= 0.0) {
    double topPadding = 5.0;
  }
  double v15 = v9 + topPadding;
  v16 = [(UILabel *)self->_descriptionLabel text];

  if (v16)
  {
    -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", width - (v11 + v13) + -20.0, height);
    double v15 = v15 + v17;
  }
  id v18 = [(UIButton *)self->_actionButton titleForState:0];
  if (v18)
  {
  }
  else
  {
    id v19 = [(UIButton *)self->_actionButton imageForState:0];

    if (!v19) {
      goto LABEL_9;
    }
  }
  [(UIButton *)self->_actionButton sizeToFit];
  [(UIButton *)self->_actionButton frame];
  double v15 = v15 + 20.0 + v20;
LABEL_9:
  v21 = [(UIButton *)self->_secondaryActionButton titleForState:0];
  if (v21)
  {
  }
  else
  {
    uint64_t v22 = [(UIButton *)self->_secondaryActionButton imageForState:0];

    if (!v22) {
      goto LABEL_15;
    }
  }
  [(UIButton *)self->_secondaryActionButton sizeToFit];
  [(UIButton *)self->_secondaryActionButton frame];
  double secondaryActionTopPadding = self->_secondaryActionTopPadding;
  if (secondaryActionTopPadding <= 0.0) {
    double secondaryActionTopPadding = 5.0;
  }
  double v15 = v23 + v15 + secondaryActionTopPadding;
LABEL_15:
  double bottomPadding = self->_bottomPadding;
  if (bottomPadding <= 0.0) {
    double bottomPadding = 5.0;
  }
  double v26 = v15 + bottomPadding;
  double v27 = width;
  result.double height = v26;
  result.double width = v27;
  return result;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)PKDisambiguationFooterView;
  [(PKDisambiguationFooterView *)&v48 layoutSubviews];
  [(PKDisambiguationFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(PKDisambiguationFooterView *)self layoutMargins];
  double v10 = v4 + v9;
  double v13 = v6 - (v11 + v12);
  double v15 = v8 - (v9 + v14);
  double topPadding = 5.0;
  if (self->_topPadding > 0.0) {
    double topPadding = self->_topPadding;
  }
  double v17 = v10 + topPadding;
  double v18 = *MEMORY[0x1E4F1DB28];
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v21 = [(UILabel *)self->_descriptionLabel text];

  double v42 = v19;
  double v44 = v18;
  double v46 = v20;
  if (v21)
  {
    [(UILabel *)self->_descriptionLabel frame];
    -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v13 + -20.0, v15);
    UIRectCenteredXInRect();
    double v18 = v22;
    double v20 = v23;
    double v19 = v24;
  }
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v18, v17, v20, v19, *(void *)&v42, *(void *)&v44, *(void *)&v46);
  v49.origin.double x = v18;
  v49.origin.double y = v17;
  v49.size.double width = v20;
  v49.size.double height = v19;
  double MaxY = CGRectGetMaxY(v49);
  double v26 = [(UIButton *)self->_actionButton titleForState:0];
  if (v26)
  {

LABEL_8:
    double MaxY = MaxY + 20.0;
    [(UIButton *)self->_actionButton frame];
    UIRectCenteredXInRect();
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    goto LABEL_9;
  }
  double v27 = [(UIButton *)self->_actionButton imageForState:0];

  if (v27) {
    goto LABEL_8;
  }
  double v33 = v43;
  double v29 = v45;
  double v31 = v47;
LABEL_9:
  -[UIButton setFrame:](self->_actionButton, "setFrame:", v29, MaxY, v31, v33);
  v50.origin.double x = v29;
  v50.origin.double y = MaxY;
  v50.size.double width = v31;
  v50.size.double height = v33;
  double v34 = CGRectGetMaxY(v50);
  double secondaryActionTopPadding = self->_secondaryActionTopPadding;
  v36 = [(UIButton *)self->_secondaryActionButton titleForState:0];
  if (v36)
  {
  }
  else
  {
    v38 = [(UIButton *)self->_secondaryActionButton imageForState:0];

    double v37 = v45;
    double v39 = v47;
    double v40 = v43;
    if (!v38) {
      goto LABEL_13;
    }
  }
  [(UIButton *)self->_secondaryActionButton frame];
  UIRectCenteredXInRect();
LABEL_13:
  double v41 = 5.0;
  if (secondaryActionTopPadding > 0.0) {
    double v41 = secondaryActionTopPadding;
  }
  -[UIButton setFrame:](self->_secondaryActionButton, "setFrame:", v37, v34 + v41, v39, v40);
}

- (double)_recommendedSecondaryActionTopPaddingForTableView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double Height = CGRectGetHeight(v17);
  [v4 contentInset];
  double v7 = v6;
  [v4 _rectForTableFooterView];
  double MinY = CGRectGetMinY(v18);
  [v4 setNeedsLayout];
  [v4 layoutIfNeeded];
  [(PKDisambiguationFooterView *)self setNeedsLayout];
  [(PKDisambiguationFooterView *)self layoutIfNeeded];
  [(UIButton *)self->_actionButton frame];
  double MaxY = CGRectGetMaxY(v19);
  [(UIButton *)self->_secondaryActionButton bounds];
  double v10 = CGRectGetHeight(v20);
  if (self->_bottomPadding <= 0.0) {
    double bottomPadding = 5.0;
  }
  else {
    double bottomPadding = self->_bottomPadding;
  }
  [(PKDisambiguationFooterView *)self layoutMargins];
  double v13 = bottomPadding + v12;
  [v4 contentInset];
  double v15 = v14;

  return fmax(Height - v7 - MinY - MaxY - v10 - v13 - v15, 50.0);
}

- (void)sizeToFitForTableView:(id)a3
{
  id v4 = a3;
  [(PKDisambiguationFooterView *)self sizeToFit];
  [(PKDisambiguationFooterView *)self _recommendedSecondaryActionTopPaddingForTableView:v4];
  double v6 = v5;

  [(PKDisambiguationFooterView *)self setSecondaryActionTopPadding:v6];

  [(PKDisambiguationFooterView *)self sizeToFit];
}

+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 action:(id)a5
{
  double v7 = (void *)MEMORY[0x1E4FB14D8];
  double v8 = (void *)MEMORY[0x1E4FB08E0];
  id v9 = a5;
  id v10 = a3;
  double v11 = [v8 preferredFontForTextStyle:a4];
  double v12 = objc_msgSend(v7, "pkui_plainConfigurationWithTitle:font:", v10, v11);

  double v13 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v12 primaryAction:v9];

  return v13;
}

+ (id)descriptionLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v3 setFont:v4];

  [v3 setNumberOfLines:0];
  [v3 setTextAlignment:1];

  return v3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)secondaryActionTopPadding
{
  return self->_secondaryActionTopPadding;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end