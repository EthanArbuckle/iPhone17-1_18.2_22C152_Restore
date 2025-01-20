@interface SUUIRedeemITunesPassLockup
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIRedeemITunesPassLockup)initWithITunesPassConfiguration:(id)a3 clientContext:(id)a4;
- (id)_attributedDescriptionString;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SUUIRedeemITunesPassLockup

- (SUUIRedeemITunesPassLockup)initWithITunesPassConfiguration:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SUUIRedeemITunesPassLockup;
  v9 = [(SUUIRedeemITunesPassLockup *)&v33 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_configuration, a3);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    descriptionLabel = v10->_descriptionLabel;
    v10->_descriptionLabel = v11;

    v13 = v10->_descriptionLabel;
    v14 = [(SUUIRedeemITunesPassLockup *)v10 _attributedDescriptionString];
    [(UILabel *)v13 setAttributedText:v14];

    [(UILabel *)v10->_descriptionLabel setNumberOfLines:0];
    [(SUUIRedeemITunesPassLockup *)v10 addSubview:v10->_descriptionLabel];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    horizontalSeparatorView = v10->_horizontalSeparatorView;
    v10->_horizontalSeparatorView = v15;

    v17 = v10->_horizontalSeparatorView;
    v18 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v17 setBackgroundColor:v18];

    [(SUUIRedeemITunesPassLockup *)v10 addSubview:v10->_horizontalSeparatorView];
    v19 = (void *)MEMORY[0x263F827E8];
    v20 = [MEMORY[0x263F82B60] mainScreen];
    [v20 scale];
    v21 = objc_msgSend(v19, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.Passbook", 2);

    if (v21)
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v21];
      iconImageView = v10->_iconImageView;
      v10->_iconImageView = (UIImageView *)v22;

      [(SUUIRedeemITunesPassLockup *)v10 addSubview:v10->_iconImageView];
    }
    v24 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v24;

    v26 = v10->_titleLabel;
    v27 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [(UILabel *)v26 setFont:v27];

    v28 = v10->_titleLabel;
    v29 = [v7 lockupTitle];
    [(UILabel *)v28 setText:v29];

    v30 = v10->_titleLabel;
    v31 = [MEMORY[0x263F825C8] blackColor];
    [(UILabel *)v30 setTextColor:v31];

    [(SUUIRedeemITunesPassLockup *)v10 addSubview:v10->_titleLabel];
  }

  return v10;
}

- (void)layoutSubviews
{
  [(SUUIRedeemITunesPassLockup *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_iconImageView frame];
  float v7 = (v6 + -55.0) * 0.5;
  CGFloat v8 = floorf(v7);
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", 0.0, v8, 55.0, 55.0);
  [(UIView *)self->_horizontalSeparatorView frame];
  v27.origin.x = 0.0;
  v27.origin.y = v8;
  v27.size.width = 55.0;
  v27.size.height = 55.0;
  CGFloat v9 = CGRectGetMaxX(v27) + 15.0;
  v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  double v12 = 1.0 / v11;

  -[UIView setFrame:](self->_horizontalSeparatorView, "setFrame:", v9, v8, v12, 55.0);
  double v13 = v9 + 15.0;
  double v14 = v4 - (v9 + 15.0);
  [(UILabel *)self->_titleLabel frame];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v14, 1.79769313e308);
  double v16 = v15;
  double v18 = v17;
  [(UILabel *)self->_descriptionLabel frame];
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v14, 1.79769313e308);
  double v20 = v19;
  double v22 = v21;
  *(float *)&double v19 = (v6 - (v18 + 4.0 + v21)) * 0.5;
  CGFloat v23 = floorf(*(float *)&v19);
  v28.origin.x = v13;
  v28.origin.y = v23;
  v28.size.width = v16;
  v28.size.height = v18;
  double v24 = CGRectGetMaxY(v28) + 4.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v13, v23, v16, v18);
  descriptionLabel = self->_descriptionLabel;
  -[UILabel setFrame:](descriptionLabel, "setFrame:", v13, v24, v20, v22);
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIRedeemITunesPassLockup;
  [(SUUIRedeemITunesPassLockup *)&v6 setHighlighted:a3];
  descriptionLabel = self->_descriptionLabel;
  double v5 = [(SUUIRedeemITunesPassLockup *)self _attributedDescriptionString];
  [(UILabel *)descriptionLabel setAttributedText:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  CGFloat v5 = a3.width + -55.0 + -30.0;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v5, 1.79769313e308);
  double v7 = v6;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5, 1.79769313e308);
  double v9 = fmax(v7 + 4.0 + v8, 55.0);
  double v10 = width;
  result.height = v9;
  result.CGFloat width = v10;
  return result;
}

- (id)_attributedDescriptionString
{
  uint64_t v3 = [(SUUIITunesPassConfiguration *)self->_configuration lockupDescription];
  double v24 = [(SUUIITunesPassConfiguration *)self->_configuration lockupLearnMoreLinkTitle];
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"ITUNES_PASS_EXPLANATION_LEARN_MORE_FORMAT" inTable:@"Redeem"];
  }
  else {
  CGFloat v23 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_EXPLANATION_LEARN_MORE_FORMAT" inBundles:0 inTable:@"Redeem"];
  }
  CGFloat v5 = [NSString stringWithValidatedFormat:v23, @"%@%@", 0, v3, v24 validFormatSpecifiers error];
  double v6 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v5];
  double v7 = [MEMORY[0x263F81708] systemFontOfSize:11.0];
  double v8 = [MEMORY[0x263F81658] defaultParagraphStyle];
  double v9 = (void *)[v8 mutableCopy];

  [v9 setLineHeightMultiple:0.75];
  [v9 setMinimumLineHeight:15.0];
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x263F81540], v9, 0, objc_msgSend(v5, "length"));
  double v22 = (void *)v3;
  uint64_t v10 = [v5 rangeOfString:v3];
  uint64_t v12 = v11;
  uint64_t v13 = *MEMORY[0x263F814F0];
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x263F814F0], v7, v10, v11);
  uint64_t v14 = *MEMORY[0x263F81500];
  double v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.600000024];
  objc_msgSend(v6, "addAttribute:value:range:", v14, v15, v10, v12);

  uint64_t v16 = [v5 rangeOfString:v24];
  uint64_t v18 = v17;
  objc_msgSend(v6, "addAttribute:value:range:", v13, v7, v16, v17);
  double v19 = [(SUUIRedeemITunesPassLockup *)self tintColor];
  if ([(SUUIRedeemITunesPassLockup *)self isHighlighted])
  {
    uint64_t v20 = [v19 colorWithAlphaComponent:0.2];

    double v19 = (void *)v20;
  }
  objc_msgSend(v6, "addAttribute:value:range:", v14, v19, v16, v18);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_horizontalSeparatorView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end