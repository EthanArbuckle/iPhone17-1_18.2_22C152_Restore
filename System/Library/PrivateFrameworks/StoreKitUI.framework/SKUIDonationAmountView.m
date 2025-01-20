@interface SKUIDonationAmountView
- (SKUIDonationAmountView)initWithCharity:(id)a3;
- (SKUIGiftAmount)selectedAmount;
- (SKUIGiftCharity)charity;
- (UIImage)logoImage;
- (void)_amountButtonDown:(id)a3;
- (void)_amountButtonUpInside:(id)a3;
- (void)_amountButtonUpOutside:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setLogoImage:(id)a3;
@end

@implementation SKUIDonationAmountView

- (SKUIDonationAmountView)initWithCharity:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationAmountView initWithCharity:]();
  }
  v60.receiver = self;
  v60.super_class = (Class)SKUIDonationAmountView;
  v6 = [(SKUIDonationAmountView *)&v60 init];
  v7 = v6;
  if (v6)
  {
    p_charity = (id *)&v6->_charity;
    objc_storeStrong((id *)&v6->_charity, a3);
    v7->_selectedAmountIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
    v10 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v7->_scrollView;
    v7->_scrollView = v10;

    [(UIScrollView *)v7->_scrollView setAlwaysBounceVertical:0];
    [(UIScrollView *)v7->_scrollView setBackgroundColor:v9];
    [(SKUIDonationAmountView *)v7 addSubview:v7->_scrollView];
    v12 = [*p_charity amountDisclaimer];
    if (v12)
    {
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      amountDisclaimerLabel = v7->_amountDisclaimerLabel;
      v7->_amountDisclaimerLabel = v13;

      [(UILabel *)v7->_amountDisclaimerLabel setBackgroundColor:v9];
      v15 = v7->_amountDisclaimerLabel;
      v16 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
      [(UILabel *)v15 setFont:v16];

      [(UILabel *)v7->_amountDisclaimerLabel setNumberOfLines:0];
      [(UILabel *)v7->_amountDisclaimerLabel setText:v12];
      [(UILabel *)v7->_amountDisclaimerLabel setTextAlignment:1];
      v17 = v7->_amountDisclaimerLabel;
      v18 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
      [(UILabel *)v17 setTextColor:v18];

      [(UIScrollView *)v7->_scrollView addSubview:v7->_amountDisclaimerLabel];
    }
    v19 = [*p_charity charityDescription];

    if (v19)
    {
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      descriptionLabel = v7->_descriptionLabel;
      v7->_descriptionLabel = v20;

      [(UILabel *)v7->_descriptionLabel setBackgroundColor:v9];
      v22 = v7->_descriptionLabel;
      v23 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
      [(UILabel *)v22 setFont:v23];

      [(UILabel *)v7->_descriptionLabel setNumberOfLines:0];
      [(UILabel *)v7->_descriptionLabel setText:v19];
      [(UILabel *)v7->_descriptionLabel setTextAlignment:1];
      v24 = v7->_descriptionLabel;
      v25 = [MEMORY[0x1E4FB1618] _labelColor];
      [(UILabel *)v24 setTextColor:v25];

      [(UIScrollView *)v7->_scrollView addSubview:v7->_descriptionLabel];
    }
    v26 = [*p_charity legalText];

    if (v26)
    {
      v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      legalTextLabel = v7->_legalTextLabel;
      v7->_legalTextLabel = v27;

      [(UILabel *)v7->_legalTextLabel setBackgroundColor:v9];
      v29 = v7->_legalTextLabel;
      v30 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
      [(UILabel *)v29 setFont:v30];

      [(UILabel *)v7->_legalTextLabel setNumberOfLines:0];
      [(UILabel *)v7->_legalTextLabel setText:v26];
      v31 = v7->_legalTextLabel;
      v32 = [MEMORY[0x1E4FB1618] _labelColor];
      [(UILabel *)v31 setTextColor:v32];

      [(UIScrollView *)v7->_scrollView addSubview:v7->_legalTextLabel];
    }
    uint64_t v33 = [*p_charity legalText2];

    if (v33)
    {
      v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      legalText2Label = v7->_legalText2Label;
      v7->_legalText2Label = v34;

      [(UILabel *)v7->_legalText2Label setBackgroundColor:v9];
      v36 = v7->_legalText2Label;
      v37 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
      [(UILabel *)v36 setFont:v37];

      [(UILabel *)v7->_legalText2Label setNumberOfLines:0];
      [(UILabel *)v7->_legalText2Label setText:v33];
      v38 = v7->_legalText2Label;
      v39 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
      [(UILabel *)v38 setTextColor:v39];

      [(UIScrollView *)v7->_scrollView addSubview:v7->_legalText2Label];
    }
    v54 = (void *)v33;
    v55 = (void *)v9;
    v40 = [*p_charity donationAmounts];
    uint64_t v41 = SKUIGiftAmountButtonsWithAmounts(v40);
    amountButtons = v7->_amountButtons;
    v7->_amountButtons = (NSArray *)v41;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v43 = v7->_amountButtons;
    uint64_t v44 = [(NSArray *)v43 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v57 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          [v48 addTarget:v7 action:sel__amountButtonDown_ forControlEvents:1];
          [v48 addTarget:v7 action:sel__amountButtonUpInside_ forControlEvents:64];
          [v48 addTarget:v7 action:sel__amountButtonUpOutside_ forControlEvents:128];
          [(UIScrollView *)v7->_scrollView addSubview:v48];
        }
        uint64_t v45 = [(NSArray *)v43 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v45);
    }

    v49 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v49;

    v51 = v7->_separatorView;
    v52 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
    [(UIView *)v51 setBackgroundColor:v52];

    [(UIScrollView *)v7->_scrollView addSubview:v7->_separatorView];
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_amountButtons;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKUIDonationAmountView;
  [(SKUIDonationAmountView *)&v8 dealloc];
}

- (UIImage)logoImage
{
  return [(UIImageView *)self->_logoImageView image];
}

- (SKUIGiftAmount)selectedAmount
{
  v3 = [(SKUIGiftCharity *)self->_charity donationAmounts];
  unint64_t selectedAmountIndex = self->_selectedAmountIndex;
  if (selectedAmountIndex >= [v3 count])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v3 objectAtIndex:self->_selectedAmountIndex];
  }

  return (SKUIGiftAmount *)v5;
}

- (void)setLogoImage:(id)a3
{
  id v15 = a3;
  id v4 = [(SKUIDonationAmountView *)self logoImage];

  id v6 = v15;
  if (v4 != v15)
  {
    logoImageView = self->_logoImageView;
    if (v15)
    {
      if (!logoImageView)
      {
        objc_super v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        long long v9 = self->_logoImageView;
        self->_logoImageView = v8;

        long long v10 = self->_logoImageView;
        long long v11 = [(SKUIGiftCharity *)self->_charity name];
        [(UIImageView *)v10 setAccessibilityLabel:v11];

        long long v12 = self->_logoImageView;
        v13 = [(SKUIDonationAmountView *)self backgroundColor];
        [(UIImageView *)v12 setBackgroundColor:v13];

        [(UIImageView *)self->_logoImageView setContentMode:1];
        [(UIScrollView *)self->_scrollView addSubview:self->_logoImageView];
        logoImageView = self->_logoImageView;
      }
      [(UIImageView *)logoImageView setImage:v15];
      uint64_t v5 = [(SKUIDonationAmountView *)self setNeedsLayout];
    }
    else
    {
      [(UIImageView *)logoImageView removeFromSuperview];
      uint64_t v14 = self->_logoImageView;
      self->_logoImageView = 0;
    }
    id v6 = v15;
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)layoutSubviews
{
  [(SKUIDonationAmountView *)self bounds];
  double v4 = v3;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 30.0;
  }
  else {
    double v7 = 15.0;
  }
  objc_super v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v10 = 30.0;
  }
  else {
    double v10 = 15.0;
  }
  double v11 = v4 - v10;
  long long v12 = [(SKUIGiftCharity *)self->_charity logoArtwork];
  v13 = v12;
  if (v12)
  {
    double v14 = (double)[v12 height];
    id v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 scale];
    *(float *)&double v16 = v14 / v16;
    double v17 = floorf(*(float *)&v16);

    logoImageView = self->_logoImageView;
    if (logoImageView)
    {
      [(UIImageView *)logoImageView frame];
      -[UIImageView setFrame:](self->_logoImageView, "setFrame:", v7, 20.0, v11 - v7, v17);
    }
    v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    double v21 = 5.0;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v21 = 16.0;
    }
    double v22 = v21 + v17 + 20.0;
  }
  else
  {
    double v22 = 20.0;
  }
  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    -[UILabel sizeThatFits:](descriptionLabel, "sizeThatFits:", v11 - v7, 1.79769313e308);
    CGFloat v25 = v24;
    -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v7, v22, v11 - v7, v24);
    v77.origin.x = v7;
    v77.origin.y = v22;
    v77.size.width = v11 - v7;
    v77.size.height = v25;
    double MaxY = CGRectGetMaxY(v77);
    v27 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v28 = [v27 userInterfaceIdiom];

    double v29 = 35.0;
    if ((v28 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      double v29 = 25.0;
    }
    double v22 = MaxY + v29;
  }
  if ([(NSArray *)self->_amountButtons count])
  {
    float v30 = (v4 + -223.0) * 0.5;
    uint64_t v73 = 0;
    v74 = (double *)&v73;
    uint64_t v75 = 0x2020000000;
    uint64_t v76 = 0;
    amountButtons = self->_amountButtons;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __40__SKUIDonationAmountView_layoutSubviews__block_invoke;
    v72[3] = &unk_1E642A3C0;
    *(double *)&v72[6] = floorf(v30);
    *(double *)&v72[7] = v7;
    *(double *)&v72[8] = v22;
    v72[4] = &v73;
    v72[5] = 3;
    [(NSArray *)amountButtons enumerateObjectsUsingBlock:v72];
    double v32 = v74[3];
    uint64_t v33 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v34 = [v33 userInterfaceIdiom];

    double v35 = 16.0;
    if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v35 = 26.0;
    }
    double v22 = v32 + v35;
    _Block_object_dispose(&v73, 8);
  }
  amountDisclaimerLabel = self->_amountDisclaimerLabel;
  if (amountDisclaimerLabel)
  {
    -[UILabel sizeThatFits:](amountDisclaimerLabel, "sizeThatFits:", v11 - v7, 1.79769313e308);
    CGFloat v38 = v37;
    -[UILabel setFrame:](self->_amountDisclaimerLabel, "setFrame:", v7, v22, v11 - v7, v37);
    v78.origin.x = v7;
    v78.origin.y = v22;
    v78.size.width = v11 - v7;
    v78.size.height = v38;
    double v39 = CGRectGetMaxY(v78);
    v40 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v41 = [v40 userInterfaceIdiom];

    double v42 = 17.0;
    if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v42 = 21.0;
    }
    double v22 = v39 + v42;
  }
  [(UIView *)self->_separatorView frame];
  v43 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v44 = [v43 userInterfaceIdiom];

  if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v45 = 30.0;
  }
  else {
    double v45 = 15.0;
  }
  uint64_t v46 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v46 scale];
  double v48 = 1.0 / v47;

  v49 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v50 = [v49 userInterfaceIdiom];

  if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v51 = 30.0;
  }
  else {
    double v51 = 15.0;
  }
  CGFloat v52 = v4 - v51 - v45;
  -[UIView setFrame:](self->_separatorView, "setFrame:", v45, v22, v52, v48);
  v79.origin.x = v45;
  v79.origin.y = v22;
  v79.size.width = v52;
  v79.size.height = v48;
  double v53 = CGRectGetMaxY(v79);
  v54 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v55 = [v54 userInterfaceIdiom];

  double v56 = 16.0;
  if ((v55 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v56 = 20.0;
  }
  double v57 = v53 + v56;
  legalTextLabel = self->_legalTextLabel;
  if (legalTextLabel)
  {
    -[UILabel sizeThatFits:](legalTextLabel, "sizeThatFits:", v11 - v7, 1.79769313e308);
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    -[UILabel setFrame:](self->_legalTextLabel, "setFrame:", v7, v57, v59, v61);
    v80.origin.x = v7;
    v80.origin.y = v57;
    v80.size.width = v60;
    v80.size.height = v62;
    double v63 = CGRectGetMaxY(v80);
    v64 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v65 = [v64 userInterfaceIdiom];

    double v66 = 23.0;
    if ((v65 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v66 = 18.0;
    }
    double v57 = v63 + v66;
  }
  legalText2Label = self->_legalText2Label;
  if (legalText2Label)
  {
    -[UILabel sizeThatFits:](legalText2Label, "sizeThatFits:", v11 - v7, 1.79769313e308);
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    -[UILabel setFrame:](self->_legalText2Label, "setFrame:", v7, v57, v68, v70);
    v81.origin.x = v7;
    v81.origin.y = v57;
    v81.size.width = v69;
    v81.size.height = v71;
    double v57 = CGRectGetMaxY(v81);
  }
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, v57 + 20.0);
}

void __40__SKUIDonationAmountView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 frame];
  CGFloat v7 = v6;
  unint64_t v8 = *(void *)(a1 + 40);
  CGFloat v9 = *(double *)(a1 + 48) + (double)(uint64_t)(a3 % v8) * 65.0 + (float)((float)(uint64_t)(a3 % v8) * 14.0);
  CGFloat v10 = *(double *)(a1 + 64) + (double)(uint64_t)(a3 / v8) * v6 + (float)((float)(uint64_t)(a3 / v8) * 14.0);
  objc_msgSend(v5, "setFrame:", v9, v10, 65.0);

  v13.origin.x = v9;
  v13.origin.y = v10;
  v13.size.width = 65.0;
  v13.size.height = v7;
  double MaxY = CGRectGetMaxY(v13);
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  if (MaxY < *(double *)(v12 + 24)) {
    double MaxY = *(double *)(v12 + 24);
  }
  *(double *)(v12 + 24) = MaxY;
}

- (void)_amountButtonDown:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = -[NSArray indexOfObjectIdenticalTo:](self->_amountButtons, "indexOfObjectIdenticalTo:");
  int64_t selectedAmountIndex = self->_selectedAmountIndex;
  if (selectedAmountIndex == v4)
  {
    [v8 setSelected:0];
  }
  else
  {
    int64_t v6 = v4;
    if (selectedAmountIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      CGFloat v7 = -[NSArray objectAtIndex:](self->_amountButtons, "objectAtIndex:");
      [v7 setSelected:0];
    }
    self->_int64_t selectedAmountIndex = v6;
  }
}

- (void)_amountButtonUpInside:(id)a3
{
  amountButtons = self->_amountButtons;
  id v5 = a3;
  self->_int64_t selectedAmountIndex = [(NSArray *)amountButtons indexOfObjectIdenticalTo:v5];
  [v5 setSelected:1];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SKUIDonationAmountViewChangedNotification" object:self];
}

- (void)_amountButtonUpOutside:(id)a3
{
  id v5 = a3;
  if (self->_selectedAmountIndex == -[NSArray indexOfObjectIdenticalTo:](self->_amountButtons, "indexOfObjectIdenticalTo:"))
  {
    self->_int64_t selectedAmountIndex = 0x7FFFFFFFFFFFFFFFLL;
    [v5 setSelected:0];
    NSUInteger v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"SKUIDonationAmountViewChangedNotification" object:self];
  }
}

- (SKUIGiftCharity)charity
{
  return self->_charity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_legalText2Label, 0);
  objc_storeStrong((id *)&self->_legalTextLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_charity, 0);
  objc_storeStrong((id *)&self->_amountDisclaimerLabel, 0);

  objc_storeStrong((id *)&self->_amountButtons, 0);
}

- (void)initWithCharity:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDonationAmountView initWithCharity:]";
}

@end