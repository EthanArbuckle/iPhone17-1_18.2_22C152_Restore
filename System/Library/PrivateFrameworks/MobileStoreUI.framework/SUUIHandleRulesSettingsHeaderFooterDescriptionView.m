@interface SUUIHandleRulesSettingsHeaderFooterDescriptionView
+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_labelWithDescription:(id)a3 forWidth:(double)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)layoutSubviews;
- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIHandleRulesSettingsHeaderFooterDescriptionView

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  id v7 = a4;
  v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83600]];
  [v8 _scaledValueForValue:22.0];
  double v10 = v9;
  v11 = [a1 _labelWithDescription:v7 forWidth:a3];
  [v11 _firstLineBaselineFrameOriginY];
  double v13 = v10 - v12;
  [v11 _lastLineBaselineFrameOriginY];
  double v15 = v13 + v14;

  double v16 = a3;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  p_description = &self->_description;
  objc_storeStrong((id *)&self->_description, a3);
  id v11 = a3;
  double v9 = [(id)objc_opt_class() _labelWithDescription:*p_description forWidth:a4];
  label = self->_label;
  self->_label = v9;

  [(SUUIHandleRulesSettingsHeaderFooterDescriptionView *)self addSubview:self->_label];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SUUIHandleRulesSettingsHeaderFooterDescriptionView;
  [(SUUIHandleRulesSettingsHeaderFooterDescriptionView *)&v23 layoutSubviews];
  [(SUUIHandleRulesSettingsHeaderFooterDescriptionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SUUIHandleRulesSettingsHeaderFooterDescriptionView *)self layoutMargins];
  double v12 = v11;
  double v14 = v13;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  CGFloat v15 = CGRectGetWidth(v24) - v12 - v14;
  double v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83600]];
  [v16 _scaledValueForValue:22.0];
  double v18 = v17;
  [(UILabel *)self->_label _firstBaselineOffsetFromTop];
  CGFloat v20 = v18 - v19;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v15, 1.0);
  [(UILabel *)self->_label setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v12, v20, v15, v21, v4, v6, v8, v10)];
  if (storeShouldReverseLayoutDirection()) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 0;
  }
  [(UILabel *)self->_label setTextAlignment:v22];
}

+ (id)_labelWithDescription:(id)a3 forWidth:(double)a4
{
  double v5 = (objc_class *)MEMORY[0x263F828E0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  CGFloat v8 = [v6 text];
  [v7 setText:v8];
  [v7 setNumberOfLines:0];
  double v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83600]];
  [v7 setFont:v9];
  char v10 = [v6 showInvalid];

  if (v10) {
    [MEMORY[0x263F825C8] systemRedColor];
  }
  else {
  double v11 = [MEMORY[0x263F825C8] systemGrayColor];
  }
  [v7 setColor:v11];
  objc_msgSend(v7, "sizeThatFits:", a4, 1.0);
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v12);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end