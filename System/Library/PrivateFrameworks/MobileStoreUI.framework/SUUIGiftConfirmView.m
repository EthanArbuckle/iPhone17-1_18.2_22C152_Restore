@interface SUUIGiftConfirmView
- (SUUIGiftConfirmView)initWithGift:(id)a3 configuration:(id)a4;
- (id)_newBoldLabelWithSize:(double)a3;
- (id)_newLightLabelWithSize:(double)a3 alpha:(double)a4;
- (id)_termsButton;
- (void)layoutSubviews;
@end

@implementation SUUIGiftConfirmView

- (SUUIGiftConfirmView)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v136.receiver = self;
  v136.super_class = (Class)SUUIGiftConfirmView;
  v8 = [(SUUIGiftConfirmView *)&v136 init];
  if (v8)
  {
    id v133 = v7;
    uint64_t v9 = [v7 clientContext];
    id v10 = a4;
    v11 = (void *)v9;
    objc_storeStrong((id *)&v8->_giftConfiguration, v10);
    uint64_t v12 = [(SUUIGiftConfirmView *)v8 _newLightLabelWithSize:23.0 alpha:1.0];
    confirmYourOrderLabel = v8->_confirmYourOrderLabel;
    v8->_confirmYourOrderLabel = (UILabel *)v12;

    v14 = v8->_confirmYourOrderLabel;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_CONFIRM_YOUR_ORDER" inTable:@"Gifting"];
    }
    else {
    v15 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_CONFIRM_YOUR_ORDER" inBundles:0 inTable:@"Gifting"];
    }
    [(UILabel *)v14 setText:v15];

    [(UILabel *)v8->_confirmYourOrderLabel sizeToFit];
    [(SUUIGiftConfirmView *)v8 addSubview:v8->_confirmYourOrderLabel];
    uint64_t v16 = [(SUUIGiftConfirmView *)v8 _newLightLabelWithSize:11.0 alpha:0.5];
    chargeDisclaimerLabel = v8->_chargeDisclaimerLabel;
    v8->_chargeDisclaimerLabel = (UILabel *)v16;

    [(UILabel *)v8->_chargeDisclaimerLabel setNumberOfLines:0];
    v18 = v8->_chargeDisclaimerLabel;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_CHARGE_WARNING" inTable:@"Gifting"];
    }
    else {
    v19 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_CHARGE_WARNING" inBundles:0 inTable:@"Gifting"];
    }
    [(UILabel *)v18 setText:v19];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_chargeDisclaimerLabel];
    v20 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    rule1 = v8->_rule1;
    v8->_rule1 = v20;

    v22 = v8->_rule1;
    v23 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UIView *)v22 setBackgroundColor:v23];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_rule1];
    v24 = [[SUUIGiftConfirmLabeledValue alloc] initWithGiftConfirmLabelStyle:0];
    recipientsView = v8->_recipientsView;
    v8->_recipientsView = v24;

    v26 = v8->_recipientsView;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_RECIPIENTS_LABEL" inTable:@"Gifting"];
    }
    else {
    v27 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_RECIPIENTS_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftConfirmLabeledValue *)v26 setLabel:v27];

    v28 = v8->_recipientsView;
    v29 = [v6 recipientAddresses];
    v30 = [v29 componentsJoinedByString:@", "];
    [(SUUIGiftConfirmLabeledValue *)v28 setValue:v30];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_recipientsView];
    v31 = [[SUUIGiftConfirmLabeledValue alloc] initWithGiftConfirmLabelStyle:0];
    senderView = v8->_senderView;
    v8->_senderView = v31;

    v33 = v8->_senderView;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_SENDER_LABEL" inTable:@"Gifting"];
    }
    else {
    v34 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_SENDER_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftConfirmLabeledValue *)v33 setLabel:v34];

    v35 = v8->_senderView;
    v36 = [v6 senderName];
    [(SUUIGiftConfirmLabeledValue *)v35 setValue:v36];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_senderView];
    v37 = [[SUUIGiftConfirmLabeledValue alloc] initWithGiftConfirmLabelStyle:0];
    fromView = v8->_fromView;
    v8->_fromView = v37;

    v39 = v8->_fromView;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_FROM_LABEL" inTable:@"Gifting"];
    }
    else {
    v40 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_FROM_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftConfirmLabeledValue *)v39 setLabel:v40];

    v41 = v8->_fromView;
    v42 = [v6 senderEmailAddress];
    [(SUUIGiftConfirmLabeledValue *)v41 setValue:v42];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_fromView];
    v43 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    rule2 = v8->_rule2;
    v8->_rule2 = v43;

    v45 = v8->_rule2;
    v46 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UIView *)v45 setBackgroundColor:v46];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_rule2];
    v132 = [v6 message];
    uint64_t v47 = [v132 length];
    v48 = [SUUIGiftConfirmLabeledValue alloc];
    if (v47)
    {
      uint64_t v49 = [(SUUIGiftConfirmLabeledValue *)v48 initWithGiftConfirmLabelStyle:1];
      messageView = v8->_messageView;
      v8->_messageView = (SUUIGiftConfirmLabeledValue *)v49;

      v51 = v8->_messageView;
      uint64_t v52 = [v6 message];
    }
    else
    {
      uint64_t v53 = [(SUUIGiftConfirmLabeledValue *)v48 initWithGiftConfirmLabelStyle:0];
      v54 = v8->_messageView;
      v8->_messageView = (SUUIGiftConfirmLabeledValue *)v53;

      v51 = v8->_messageView;
      if (v11) {
        [v11 localizedStringForKey:@"GIFTING_NO_MESSAGE_PLACEHOLDER" inTable:@"Gifting"];
      }
      else {
      uint64_t v52 = +[SUUIClientContext localizedStringForKey:@"GIFTING_NO_MESSAGE_PLACEHOLDER" inBundles:0 inTable:@"Gifting"];
      }
    }
    v55 = (void *)v52;
    [(SUUIGiftConfirmLabeledValue *)v51 setValue:v52];

    v56 = v8->_messageView;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_MESSAGE_LABEL" inTable:@"Gifting"];
    }
    else {
    v57 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_MESSAGE_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftConfirmLabeledValue *)v56 setLabel:v57];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_messageView];
    v58 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    rule3 = v8->_rule3;
    v8->_rule3 = v58;

    v60 = v8->_rule3;
    v61 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UIView *)v60 setBackgroundColor:v61];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_rule3];
    v62 = [v6 item];
    v63 = [[SUUIGiftConfirmLabeledValue alloc] initWithGiftConfirmLabelStyle:2];
    v134 = v6;
    v135 = v62;
    if (v62)
    {
      itemView = v8->_itemView;
      v8->_itemView = v63;

      v65 = v8->_itemView;
      if (v11) {
        [v11 localizedStringForKey:@"GIFTING_CONFIRM_ITEM_LABEL" inTable:@"Gifting"];
      }
      else {
      v68 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_ITEM_LABEL" inBundles:0 inTable:@"Gifting"];
      }
      [(SUUIGiftConfirmLabeledValue *)v65 setLabel:v68];

      v69 = v8->_itemView;
      v70 = [v62 title];
      [(SUUIGiftConfirmLabeledValue *)v69 setValue:v70];

      [(SUUIGiftConfirmView *)v8 addSubview:v8->_itemView];
      v71 = [[SUUIGiftConfirmLabeledValue alloc] initWithGiftConfirmLabelStyle:2];
      amountView = v8->_amountView;
      v8->_amountView = v71;

      v73 = v8->_amountView;
      if (v11) {
        [v11 localizedStringForKey:@"GIFTING_CONFIRM_PRICE_LABEL" inTable:@"Gifting"];
      }
      else {
      v74 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_PRICE_LABEL" inBundles:0 inTable:@"Gifting"];
      }
      [(SUUIGiftConfirmLabeledValue *)v73 setLabel:v74];

      id v75 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v75 setNumberStyle:1];
      v76 = [v6 recipientAddresses];
      uint64_t v77 = [v76 count];

      v131 = v11;
      if (v11) {
        [v11 localizedStringForKey:@"GIFTING_MULTIPLE_RECPIENT_PRICE_FORMAT" inTable:@"Gifting"];
      }
      else {
      v78 = +[SUUIClientContext localizedStringForKey:@"GIFTING_MULTIPLE_RECPIENT_PRICE_FORMAT" inBundles:0 inTable:@"Gifting"];
      }
      v79 = NSString;
      v80 = [NSNumber numberWithInteger:v77];
      v81 = [v75 stringFromNumber:v80];
      [v135 primaryItemOffer];
      v82 = v130 = v75;
      v83 = [v82 buttonText];
      v84 = [v79 stringWithValidatedFormat:v78, @"%@%@", 0, v81, v83 validFormatSpecifiers error];

      [(SUUIGiftConfirmLabeledValue *)v8->_amountView setSubtitleLabel:v84];
      v85 = v8->_amountView;
      v86 = [v135 primaryItemOffer];
      v87 = [v86 buttonText];
      [(SUUIGiftConfirmLabeledValue *)v85 setValue:v87];

      [(SUUIGiftConfirmView *)v8 addSubview:v8->_amountView];
      id v6 = v134;
      v11 = v131;
    }
    else
    {
      v66 = v8->_amountView;
      v8->_amountView = v63;

      v67 = v8->_amountView;
      if (v11) {
        [v11 localizedStringForKey:@"GIFTING_CONFIRM_AMOUNT_LABEL" inTable:@"Gifting"];
      }
      else {
      v88 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_AMOUNT_LABEL" inBundles:0 inTable:@"Gifting"];
      }
      [(SUUIGiftConfirmLabeledValue *)v67 setLabel:v88];

      v89 = v8->_amountView;
      v90 = [v6 giftAmountString];
      [(SUUIGiftConfirmLabeledValue *)v89 setValue:v90];

      [(SUUIGiftConfirmView *)v8 addSubview:v8->_amountView];
    }
    v91 = [v6 deliveryDate];
    v92 = [[SUUIGiftConfirmLabeledValue alloc] initWithGiftConfirmLabelStyle:2];
    sendOnView = v8->_sendOnView;
    v8->_sendOnView = v92;

    v94 = v8->_sendOnView;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_SEND_DATE_LABEL" inTable:@"Gifting"];
    }
    else {
    v95 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_SEND_DATE_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftConfirmLabeledValue *)v94 setLabel:v95];

    if (v91)
    {
      id v96 = objc_alloc_init(MEMORY[0x263F08790]);
      [v96 setDateStyle:2];
      [v96 setTimeStyle:0];
      v97 = v8->_sendOnView;
      v98 = [v96 stringFromDate:v91];
      [(SUUIGiftConfirmLabeledValue *)v97 setValue:v98];
    }
    else
    {
      v99 = v8->_sendOnView;
      if (v11) {
        [v11 localizedStringForKey:@"GIFTING_DATE_TODAY" inTable:@"Gifting"];
      }
      else {
      id v96 = +[SUUIClientContext localizedStringForKey:@"GIFTING_DATE_TODAY" inBundles:0 inTable:@"Gifting"];
      }
      [(SUUIGiftConfirmLabeledValue *)v99 setValue:v96];
    }

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_sendOnView];
    v100 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    rule4 = v8->_rule4;
    v8->_rule4 = v100;

    v102 = v8->_rule4;
    v103 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UIView *)v102 setBackgroundColor:v103];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_rule4];
    v104 = [[SUUIGiftConfirmLabeledValue alloc] initWithGiftConfirmLabelStyle:2];
    themeNameView = v8->_themeNameView;
    v8->_themeNameView = v104;

    v106 = v8->_themeNameView;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_CONFIRM_THEME_LABEL" inTable:@"Gifting"];
    }
    else {
    v107 = +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_THEME_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    v108 = v11;
    [(SUUIGiftConfirmLabeledValue *)v106 setLabel:v107];

    v109 = v8->_themeNameView;
    id v6 = v134;
    v110 = [v134 theme];
    v111 = [v110 themeName];
    [(SUUIGiftConfirmLabeledValue *)v109 setValue:v111];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_themeNameView];
    v112 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    rule5 = v8->_rule5;
    v8->_rule5 = v112;

    v114 = v8->_rule5;
    v115 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UIView *)v114 setBackgroundColor:v115];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_rule5];
    uint64_t v116 = [(SUUIGiftConfirmView *)v8 _newLightLabelWithSize:20.0 alpha:1.0];
    totalLabel = v8->_totalLabel;
    v8->_totalLabel = (UILabel *)v116;

    if (v108) {
      [v108 localizedStringForKey:@"GIFTING_CONFIRM_TOTAL_LABEL" inTable:@"Gifting"];
    }
    else {
      +[SUUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_TOTAL_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    v119 = v118 = v108;
    v120 = v8->_totalLabel;
    v121 = NSString;
    v122 = [v134 totalGiftAmountString];
    v123 = [v121 stringWithValidatedFormat:v119, @"%@", 0, v122 validFormatSpecifiers error];
    [(UILabel *)v120 setText:v123];

    [(UILabel *)v8->_totalLabel sizeToFit];
    [(SUUIGiftConfirmView *)v8 addSubview:v8->_totalLabel];
    v124 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    rule6 = v8->_rule6;
    v8->_rule6 = v124;

    v126 = v8->_rule6;
    v127 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UIView *)v126 setBackgroundColor:v127];

    [(SUUIGiftConfirmView *)v8 addSubview:v8->_rule6];
    v128 = [(SUUIGiftConfirmView *)v8 _termsButton];
    [(SUUIGiftConfirmView *)v8 addSubview:v128];

    id v7 = v133;
  }

  return v8;
}

- (void)layoutSubviews
{
  [(SUUIGiftConfirmView *)self bounds];
  double v200 = v4;
  double v201 = v3;
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v10 = [v9 userInterfaceLayoutDirection];

  v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v13 = 75.0;
  }
  else {
    double v13 = 30.0;
  }
  double v14 = v8 - v13;
  v15 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v17 = 55.0;
  }
  else {
    double v17 = 15.0;
  }
  [(UILabel *)self->_confirmYourOrderLabel frame];
  double v19 = v18;
  v20 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v22 = 75.0;
  }
  else {
    double v22 = 30.0;
  }
  double v203 = v14;
  double v23 = v14 - v22;
  confirmYourOrderLabel = self->_confirmYourOrderLabel;
  double v199 = v6;
  if (v10)
  {
    double v25 = v14 - v22;
    double v26 = v200;
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v22, v17, v25, v19, v201, v6, v8, v200);
  }
  else
  {
    double v27 = v22;
    double v28 = v17;
    double v29 = v14 - v22;
    double v30 = v19;
    double v26 = v200;
  }
  double v31 = v8;
  -[UILabel setFrame:](confirmYourOrderLabel, "setFrame:", v27, v28, v29, v30);
  v206.origin.x = v22;
  v206.origin.y = v17;
  v206.size.width = v23;
  v206.size.height = v19;
  double v32 = CGRectGetMaxY(v206) + 16.0;
  [(UILabel *)self->_chargeDisclaimerLabel frame];
  v33 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v34 = [v33 userInterfaceIdiom];

  if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v35 = 75.0;
  }
  else {
    double v35 = 30.0;
  }
  -[UILabel sizeThatFits:](self->_chargeDisclaimerLabel, "sizeThatFits:", v203 - v35, 1.79769313e308);
  CGFloat v38 = v36;
  CGFloat v39 = v37;
  chargeDisclaimerLabel = self->_chargeDisclaimerLabel;
  if (v10)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v35, v32, v36, v37, v201, v199, v31, v26);
  }
  else
  {
    double v41 = v35;
    double v42 = v32;
    double v43 = v38;
    double v44 = v39;
  }
  -[UILabel setFrame:](chargeDisclaimerLabel, "setFrame:", v41, v42, v43, v44, *(void *)&v31);
  v207.origin.x = v35;
  v207.origin.y = v32;
  v207.size.width = v38;
  v207.size.height = v39;
  double MaxY = CGRectGetMaxY(v207);
  v46 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v47 = [v46 userInterfaceIdiom];

  double v48 = 10.0;
  if ((v47 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v48 = 6.0;
  }
  double v49 = MaxY + v48;
  v50 = [MEMORY[0x263F82B60] mainScreen];
  [v50 scale];
  double v52 = 1.0 / v51;

  uint64_t v53 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v54 = [v53 userInterfaceIdiom];

  if ((v54 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v55 = 75.0;
  }
  else {
    double v55 = 30.0;
  }
  v56 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v57 = [v56 userInterfaceIdiom];

  if ((v57 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v58 = 75.0;
  }
  else {
    double v58 = 30.0;
  }
  CGFloat v59 = v203 - v58;
  -[UIView setFrame:](self->_rule1, "setFrame:", v55, v49, v203 - v58, v52);
  v208.origin.x = v55;
  v208.origin.y = v49;
  v208.size.width = v59;
  v208.size.height = v52;
  float v60 = CGRectGetMaxY(v208) + 6.0;
  double v61 = ceilf(v60);
  [(SUUIGiftConfirmLabeledValue *)self->_recipientsView frame];
  v62 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v63 = [v62 userInterfaceIdiom];

  if ((v63 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v64 = 75.0;
  }
  else {
    double v64 = 30.0;
  }
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_recipientsView, "sizeThatFits:", v203 - v64, 1.79769313e308);
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_recipientsView, "setFrame:", v64, v61, v65, v67);
  v209.origin.x = v64;
  v209.origin.y = v61;
  v209.size.width = v66;
  v209.size.height = v68;
  double v69 = CGRectGetMaxY(v209) + 3.0;
  [(SUUIGiftConfirmLabeledValue *)self->_senderView frame];
  v70 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v71 = [v70 userInterfaceIdiom];

  if ((v71 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v72 = 75.0;
  }
  else {
    double v72 = 30.0;
  }
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_senderView, "sizeThatFits:", v203 - v72, 1.79769313e308);
  CGFloat v74 = v73;
  CGFloat v76 = v75;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_senderView, "setFrame:", v72, v69, v73, v75);
  v210.origin.x = v72;
  v210.origin.y = v69;
  v210.size.width = v74;
  v210.size.height = v76;
  double v77 = CGRectGetMaxY(v210) + 3.0;
  [(SUUIGiftConfirmLabeledValue *)self->_fromView frame];
  v78 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v79 = [v78 userInterfaceIdiom];

  if ((v79 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v80 = 75.0;
  }
  else {
    double v80 = 30.0;
  }
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_fromView, "sizeThatFits:", v203 - v80, 1.79769313e308);
  CGFloat v82 = v81;
  CGFloat v84 = v83;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_fromView, "setFrame:", v80, v77, v81, v83);
  v211.origin.x = v80;
  v211.origin.y = v77;
  v211.size.width = v82;
  v211.size.height = v84;
  double v85 = CGRectGetMaxY(v211) + 7.0;
  v86 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v87 = [v86 userInterfaceIdiom];

  if ((v87 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v88 = 75.0;
  }
  else {
    double v88 = 30.0;
  }
  v89 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v90 = [v89 userInterfaceIdiom];

  if ((v90 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v91 = 75.0;
  }
  else {
    double v91 = 30.0;
  }
  CGFloat v92 = v203 - v91;
  -[UIView setFrame:](self->_rule2, "setFrame:", v88, v85, v203 - v91, v52);
  v212.origin.x = v88;
  v212.origin.y = v85;
  v212.size.width = v92;
  v212.size.height = v52;
  float v93 = CGRectGetMaxY(v212) + 6.0;
  double v94 = ceilf(v93);
  [(SUUIGiftConfirmLabeledValue *)self->_messageView frame];
  v95 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v96 = [v95 userInterfaceIdiom];

  if ((v96 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v97 = 75.0;
  }
  else {
    double v97 = 30.0;
  }
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_messageView, "sizeThatFits:", v203 - v97, 1.79769313e308);
  CGFloat v99 = v98;
  CGFloat v101 = v100;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_messageView, "setFrame:", v97, v94, v98, v100);
  v213.origin.x = v97;
  v213.origin.y = v94;
  v213.size.width = v99;
  v213.size.height = v101;
  double v102 = CGRectGetMaxY(v213) + 6.0;
  v103 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v104 = [v103 userInterfaceIdiom];

  if ((v104 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v105 = 75.0;
  }
  else {
    double v105 = 30.0;
  }
  v106 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v107 = [v106 userInterfaceIdiom];

  if ((v107 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v108 = 75.0;
  }
  else {
    double v108 = 30.0;
  }
  CGFloat v109 = v203 - v108;
  -[UIView setFrame:](self->_rule3, "setFrame:", v105, v102, v203 - v108, v52);
  v214.origin.x = v105;
  v214.origin.y = v102;
  v214.size.width = v109;
  double v202 = v52;
  v214.size.height = v52;
  float v110 = CGRectGetMaxY(v214) + 6.0;
  double v111 = ceilf(v110);
  itemView = self->_itemView;
  if (itemView)
  {
    [(SUUIGiftConfirmLabeledValue *)itemView frame];
    v113 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v114 = [v113 userInterfaceIdiom];

    if ((v114 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v115 = 75.0;
    }
    else {
      double v115 = 30.0;
    }
    -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_itemView, "sizeThatFits:", v203 - v115, 1.79769313e308);
    CGFloat v117 = v116;
    CGFloat v119 = v118;
    -[SUUIGiftConfirmLabeledValue setFrame:](self->_itemView, "setFrame:", v115, v111, v116, v118);
    v215.origin.x = v115;
    v215.origin.y = v111;
    v215.size.width = v117;
    v215.size.height = v119;
    double v111 = CGRectGetMaxY(v215) + 4.0;
  }
  [(SUUIGiftConfirmLabeledValue *)self->_amountView frame];
  v120 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v121 = [v120 userInterfaceIdiom];

  if ((v121 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v122 = 75.0;
  }
  else {
    double v122 = 30.0;
  }
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_amountView, "sizeThatFits:", v203 - v122, 1.79769313e308);
  CGFloat v124 = v123;
  CGFloat v126 = v125;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_amountView, "setFrame:", v122, v111, v123, v125);
  v216.origin.x = v122;
  v216.origin.y = v111;
  v216.size.width = v124;
  v216.size.height = v126;
  double v127 = CGRectGetMaxY(v216) + 4.0;
  [(SUUIGiftConfirmLabeledValue *)self->_sendOnView frame];
  v128 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v129 = [v128 userInterfaceIdiom];

  if ((v129 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v130 = 75.0;
  }
  else {
    double v130 = 30.0;
  }
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_sendOnView, "sizeThatFits:", v203 - v130, 1.79769313e308);
  CGFloat v132 = v131;
  CGFloat v134 = v133;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_sendOnView, "setFrame:", v130, v127, v131, v133);
  v217.origin.x = v130;
  v217.origin.y = v127;
  v217.size.width = v132;
  v217.size.height = v134;
  double v135 = CGRectGetMaxY(v217) + 6.0;
  objc_super v136 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v137 = [v136 userInterfaceIdiom];

  if ((v137 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v138 = 75.0;
  }
  else {
    double v138 = 30.0;
  }
  v139 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v140 = [v139 userInterfaceIdiom];

  if ((v140 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v141 = 75.0;
  }
  else {
    double v141 = 30.0;
  }
  CGFloat v142 = v203 - v141;
  -[UIView setFrame:](self->_rule4, "setFrame:", v138, v135, v203 - v141, v52);
  v218.origin.x = v138;
  v218.origin.y = v135;
  v218.size.width = v142;
  v218.size.height = v52;
  float v143 = CGRectGetMaxY(v218) + 6.0;
  double v144 = ceilf(v143);
  [(SUUIGiftConfirmLabeledValue *)self->_themeNameView frame];
  v145 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v146 = [v145 userInterfaceIdiom];

  if ((v146 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v147 = 75.0;
  }
  else {
    double v147 = 30.0;
  }
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_themeNameView, "sizeThatFits:", v203 - v147, 1.79769313e308);
  CGFloat v149 = v148;
  CGFloat v151 = v150;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_themeNameView, "setFrame:", v147, v144, v148, v150);
  v219.origin.x = v147;
  v219.origin.y = v144;
  v219.size.width = v149;
  v219.size.height = v151;
  double v152 = CGRectGetMaxY(v219) + 6.0;
  v153 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v154 = [v153 userInterfaceIdiom];

  if ((v154 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v155 = 75.0;
  }
  else {
    double v155 = 30.0;
  }
  v156 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v157 = [v156 userInterfaceIdiom];

  if ((v157 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v158 = 75.0;
  }
  else {
    double v158 = 30.0;
  }
  CGFloat v159 = v203 - v158;
  -[UIView setFrame:](self->_rule5, "setFrame:", v155, v152, v203 - v158, v52);
  v220.origin.x = v155;
  v220.origin.y = v152;
  v220.size.width = v159;
  v220.size.height = v52;
  double v160 = CGRectGetMaxY(v220);
  v161 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v162 = [v161 userInterfaceIdiom];

  if ((v162 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v163 = 15.0;
  }
  else {
    double v163 = 6.0;
  }
  float v164 = v160 + v163;
  double v165 = ceilf(v164);
  [(UILabel *)self->_totalLabel frame];
  double v167 = v166;
  double v169 = v168;
  double v170 = v203 - v166;
  -[UILabel setFrame:](self->_totalLabel, "setFrame:", v203 - v166, v165);
  totalLabel = self->_totalLabel;
  double v172 = v170;
  double v173 = v165;
  double v174 = v167;
  double v175 = v169;
  if (v10) {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v170, v165, v167, v169, v201, v199, v198, v200);
  }
  -[UILabel setFrame:](totalLabel, "setFrame:", v172, v173, v174, v175);
  v221.origin.x = v170;
  v221.origin.y = v165;
  v221.size.width = v167;
  v221.size.height = v169;
  double v176 = CGRectGetMaxY(v221);
  v177 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v178 = [v177 userInterfaceIdiom];

  double v179 = 6.0;
  if ((v178 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v179 = 15.0;
  }
  double v180 = v176 + v179;
  v181 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v182 = [v181 userInterfaceIdiom];

  if ((v182 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v183 = 75.0;
  }
  else {
    double v183 = 30.0;
  }
  v184 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v185 = [v184 userInterfaceIdiom];

  if ((v185 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v186 = 75.0;
  }
  else {
    double v186 = 30.0;
  }
  CGFloat v187 = v203 - v186;
  -[UIView setFrame:](self->_rule6, "setFrame:", v183, v180, v203 - v186, v202);
  v222.origin.x = v183;
  v222.origin.y = v180;
  v222.size.width = v187;
  v222.size.height = v202;
  float v188 = CGRectGetMaxY(v222) + 25.0;
  double v189 = ceilf(v188);
  id v204 = [(SUUIGiftConfirmView *)self _termsButton];
  [v204 frame];
  double v191 = v190;
  v192 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v193 = [v192 userInterfaceIdiom];

  if ((v193 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v194 = 75.0;
  }
  else {
    double v194 = 30.0;
  }
  v195 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v196 = [v195 userInterfaceIdiom];

  if ((v196 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v197 = 75.0;
  }
  else {
    double v197 = 30.0;
  }
  objc_msgSend(v204, "setFrame:", v194, v189, v198 - v197 - v194, v191);
}

- (id)_newBoldLabelWithSize:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v5 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v5];

  double v6 = [MEMORY[0x263F81708] boldSystemFontOfSize:a3];
  [v4 setFont:v6];

  double v7 = [MEMORY[0x263F825C8] labelColor];
  [v4 setTextColor:v7];

  [v4 setTextAlignment:4];
  return v4;
}

- (id)_newLightLabelWithSize:(double)a3 alpha:(double)a4
{
  id v6 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v7 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v7];

  double v8 = [MEMORY[0x263F81708] systemFontOfSize:a3];
  [v6 setFont:v8];

  uint64_t v9 = [MEMORY[0x263F825C8] labelColor];
  uint64_t v10 = [v9 colorWithAlphaComponent:a4];
  [v6 setTextColor:v10];

  [v6 setTextAlignment:4];
  return v6;
}

- (id)_termsButton
{
  termsButton = self->_termsButton;
  if (!termsButton)
  {
    id v4 = [(SUUIGiftConfiguration *)self->_giftConfiguration clientContext];
    double v5 = [[SUUILinkButton alloc] initWithArrowStyle:0];
    id v6 = self->_termsButton;
    self->_termsButton = &v5->super;

    if (SUUIUserInterfaceIdiom(v4) == 1)
    {
      if (v4)
      {
        double v7 = @"GIFTING_TERMS_LINK_IPAD";
LABEL_7:
        uint64_t v8 = [v4 localizedStringForKey:v7 inTable:@"Gifting"];
LABEL_11:
        uint64_t v10 = (void *)v8;
        [(UIButton *)self->_termsButton setTitle:v8 forState:0];
        v11 = [(UIButton *)self->_termsButton titleLabel];
        uint64_t v12 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [v11 setFont:v12];

        double v13 = self->_termsButton;
        double v14 = [MEMORY[0x263F825C8] secondaryLabelColor];
        [(UIButton *)v13 setTitleColor:v14 forState:0];

        v15 = self->_termsButton;
        uint64_t v16 = [MEMORY[0x263F825C8] labelColor];
        [(UIButton *)v15 setTitleColor:v16 forState:1];

        [(UIButton *)self->_termsButton setAutoresizingMask:5];
        double v17 = self->_termsButton;
        double v18 = [MEMORY[0x263F825C8] clearColor];
        [(UIButton *)v17 setBackgroundColor:v18];

        LODWORD(v19) = -1.0;
        [(UIButton *)self->_termsButton setCharge:v19];
        [(UIButton *)self->_termsButton sizeToFit];

        termsButton = self->_termsButton;
        goto LABEL_12;
      }
      uint64_t v9 = @"GIFTING_TERMS_LINK_IPAD";
    }
    else
    {
      if (v4)
      {
        double v7 = @"GIFTING_TERMS_LINK_IPHONE";
        goto LABEL_7;
      }
      uint64_t v9 = @"GIFTING_TERMS_LINK_IPHONE";
    }
    uint64_t v8 = +[SUUIClientContext localizedStringForKey:v9 inBundles:0 inTable:@"Gifting"];
    goto LABEL_11;
  }
LABEL_12:
  return termsButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalLabel, 0);
  objc_storeStrong((id *)&self->_themeNameView, 0);
  objc_storeStrong((id *)&self->_termsButton, 0);
  objc_storeStrong((id *)&self->_sendOnView, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_rule6, 0);
  objc_storeStrong((id *)&self->_rule5, 0);
  objc_storeStrong((id *)&self->_rule4, 0);
  objc_storeStrong((id *)&self->_rule3, 0);
  objc_storeStrong((id *)&self->_rule2, 0);
  objc_storeStrong((id *)&self->_rule1, 0);
  objc_storeStrong((id *)&self->_recipientsView, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_storeStrong((id *)&self->_senderView, 0);
  objc_storeStrong((id *)&self->_confirmYourOrderLabel, 0);
  objc_storeStrong((id *)&self->_chargeDisclaimerLabel, 0);
  objc_storeStrong((id *)&self->_amountView, 0);
}

@end