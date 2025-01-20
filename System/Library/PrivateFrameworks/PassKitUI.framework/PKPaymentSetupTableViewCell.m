@interface PKPaymentSetupTableViewCell
+ (CGSize)defaultImageViewSize;
- (BOOL)showBetaBadge;
- (PKPaymentSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImage)thumbnail;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setShowBetaBadge:(BOOL)a3;
- (void)setThumbnail:(id)a3 type:(int64_t)a4 animated:(BOOL)a5;
@end

@implementation PKPaymentSetupTableViewCell

- (PKPaymentSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentSetupTableViewCell;
  v4 = [(PKPaymentSetupTableViewCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PKPaymentSetupTableViewCell *)v4 contentView];
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    cardImageView = v5->_cardImageView;
    v5->_cardImageView = (UIImageView *)v12;

    [(UIImageView *)v5->_cardImageView setAccessibilityIgnoresInvertColors:1];
    [v6 addSubview:v5->_cardImageView];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v8, v9, v10, v11);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = (UIImageView *)v14;

    [(UIImageView *)v5->_iconImageView setAccessibilityIgnoresInvertColors:1];
    [(UIImageView *)v5->_iconImageView setContentMode:1];
    [v6 addSubview:v5->_iconImageView];
    v16 = [(UIImageView *)v5->_cardImageView layer];
    PKUIPixelLength();
    id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.21];
    [v17 CGColor];
    PKPaymentStyleApplyCorners();

    [v16 setShouldRasterize:1];
    [v16 setRasterizationScale:PKUIScreenScale()];
    v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    v19 = [MEMORY[0x1E4FB1618] colorWithRed:0.909803922 green:0.364705882 blue:0.0 alpha:1.0];
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    betaLabel = v5->_betaLabel;
    v5->_betaLabel = v20;

    v22 = v5->_betaLabel;
    v23 = PKLocalizedPaymentString(&cfstr_CardTypeBetaBa.isa);
    [(UILabel *)v22 setText:v23];

    v24 = [(UILabel *)v5->_betaLabel layer];

    [v24 setBorderWidth:1.0];
    [v24 setCornerRadius:3.0];
    id v25 = v19;
    objc_msgSend(v24, "setBorderColor:", objc_msgSend(v25, "CGColor"));
    [(UILabel *)v5->_betaLabel setTextColor:v25];
    [(UILabel *)v5->_betaLabel setFont:v18];
    [(UILabel *)v5->_betaLabel setTextAlignment:1];
    v26 = [(PKPaymentSetupTableViewCell *)v5 textLabel];
    [v26 setNumberOfLines:2];
  }
  return v5;
}

- (void)setShowBetaBadge:(BOOL)a3
{
  if (self->_showBetaBadge != a3)
  {
    if (a3)
    {
      v5 = [(PKPaymentSetupTableViewCell *)self contentView];
      [v5 addSubview:self->_betaLabel];
    }
    else
    {
      [(UILabel *)self->_betaLabel removeFromSuperview];
    }
  }
  self->_showBetaBadge = a3;
}

- (void)setThumbnail:(id)a3 type:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = (UIImage *)a3;
  if (self->_thumbnail != v9 || self->_thumbnailType != a4)
  {
    objc_storeStrong((id *)&self->_thumbnail, a3);
    self->_thumbnailType = a4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PKPaymentSetupTableViewCell_setThumbnail_type_animated___block_invoke;
    aBlock[3] = &unk_1E59CD7B0;
    aBlock[4] = self;
    v13 = v9;
    BOOL v14 = v5;
    double v10 = _Block_copy(aBlock);
    double v11 = v10;
    if (v5) {
      [MEMORY[0x1E4FB1EB0] transitionWithView:self duration:5242880 options:v10 animations:0 completion:0.3];
    }
    else {
      (*((void (**)(void *))v10 + 2))(v10);
    }
  }
}

uint64_t __58__PKPaymentSetupTableViewCell_setThumbnail_type_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 1080);
  if (v3 == 1)
  {
    [*(id *)(v2 + 1072) setImage:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:1.0];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = 1064;
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    [*(id *)(v2 + 1064) setImage:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 1064) setAlpha:1.0];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = 1072;
  }
  [*(id *)(v4 + v5) setImage:0];
  [*(id *)(*(void *)(a1 + 32) + v5) setAlpha:0.0];
  uint64_t v2 = *(void *)(a1 + 32);
LABEL_6:
  uint64_t result = [(id)v2 setNeedsLayout];
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = *(void **)(a1 + 32);
    return [v7 layoutIfNeeded];
  }
  return result;
}

- (void)layoutSubviews
{
  v58[1] = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)PKPaymentSetupTableViewCell;
  [(PKPaymentSetupTableViewCell *)&v56 layoutSubviews];
  int v3 = [(PKPaymentSetupTableViewCell *)self _shouldReverseLayoutDirection];
  uint64_t v4 = [(PKPaymentSetupTableViewCell *)self contentView];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v59.origin.x = v6;
  v59.origin.y = v8;
  v59.size.width = v10;
  v59.size.height = v12;
  double Width = CGRectGetWidth(v59);
  v60.origin.x = v6;
  v60.origin.y = v8;
  v60.size.width = v10;
  v60.size.height = v12;
  CGFloat Height = CGRectGetHeight(v60);
  thumbnail = self->_thumbnail;
  CGFloat v16 = *MEMORY[0x1E4F1DB28];
  CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v54 = Height;
  if (thumbnail)
  {
    PKFloatRoundToPixel();
    double v19 = v18;
    if (v3) {
      double v20 = Width + -53.0 + -15.0;
    }
    else {
      double v20 = 15.0;
    }
    double v21 = 53.0;
    double v22 = 32.0;
  }
  else
  {
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v20 = *MEMORY[0x1E4F1DB28];
  }
  -[UIImageView setFrame:](self->_cardImageView, "setFrame:", v20, v19, v21, v22, *(void *)&v54);
  iconImageView = self->_iconImageView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](iconImageView, "setFrame:");
  if (thumbnail)
  {
    if ([(PKPaymentSetupTableViewCell *)self accessoryType]) {
      double v24 = 0.0;
    }
    else {
      double v24 = 40.0;
    }
    v61.origin.x = v20;
    v61.origin.y = v19;
    v61.size.width = v21;
    v61.size.height = v22;
    double v25 = Width - CGRectGetWidth(v61) + -30.0 - v24;
    v26 = [(PKPaymentSetupTableViewCell *)self textLabel];
    [v26 sizeToFit];
    objc_msgSend(v26, "sizeThatFits:", v25, 1.79769313e308);
    double v29 = v28;
    if (v25 >= v27) {
      double v25 = v27;
    }
    v62.origin.x = v16;
    v62.origin.y = v17;
    v62.size.width = v25;
    v62.size.height = v29;
    double v30 = (v55 - CGRectGetHeight(v62)) * 0.5;
    double v31 = v20;
    double v32 = v19;
    double v33 = v21;
    double v34 = v22;
    if (v3) {
      double v35 = CGRectGetMinX(*(CGRect *)&v31) + -15.0 - v25;
    }
    else {
      double v35 = CGRectGetMaxX(*(CGRect *)&v31) + 15.0;
    }
    objc_msgSend(v26, "setFrame:", v35, v30, v25, v29);
  }
  if (self->_showBetaBadge)
  {
    [(UILabel *)self->_betaLabel frame];
    if (v36 >= 40.0) {
      double v38 = v36;
    }
    else {
      double v38 = 40.0;
    }
    if (v37 >= 19.0) {
      double v39 = v37;
    }
    else {
      double v39 = 19.0;
    }
    v40 = [(UILabel *)self->_betaLabel text];
    uint64_t v57 = *MEMORY[0x1E4FB06F8];
    v41 = [(UILabel *)self->_betaLabel font];
    v58[0] = v41;
    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
    [v40 sizeWithAttributes:v42];
    double v44 = v43;

    if (v38 >= v44 + 20.0) {
      double v45 = v38;
    }
    else {
      double v45 = v44 + 20.0;
    }
    v46 = [(PKPaymentSetupTableViewCell *)self textLabel];
    [v46 frame];
    double v48 = v47;
    double v50 = v49;

    PKFloatRoundToPixel();
    double v52 = v51;
    double v53 = v48 - v45 + -11.0;
    if (!v3) {
      double v53 = v48 + v50 + 11.0;
    }
    -[UILabel setFrame:](self->_betaLabel, "setFrame:", v53, v52, v45, v39);
  }
}

+ (CGSize)defaultImageViewSize
{
  double v2 = 53.0;
  double v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupTableViewCell;
  [(PKTableViewCell *)&v4 prepareForReuse];
  double v3 = [(PKPaymentSetupTableViewCell *)self textLabel];
  [v3 setText:0];

  [(PKPaymentSetupTableViewCell *)self setThumbnail:0 type:0 animated:0];
  [(PKPaymentSetupTableViewCell *)self setShowBetaBadge:0];
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (BOOL)showBetaBadge
{
  return self->_showBetaBadge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_cardImageView, 0);

  objc_storeStrong((id *)&self->_betaLabel, 0);
}

@end