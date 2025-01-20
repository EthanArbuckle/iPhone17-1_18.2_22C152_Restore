@interface SUUICheckboxFieldSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)_addInputWithElement:(id)a3;
- (void)_addLabelWithElement:(id)a3;
- (void)_addSwitchWithElement:(id)a3;
- (void)_switchValueChanged:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)tintColorDidChange;
@end

@implementation SUUICheckboxFieldSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_storeStrong((id *)&self->_settingDescription, a3);
  id v7 = a3;
  v8 = [v7 viewElement];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__SUUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v9[3] = &unk_2654008B8;
  v9[4] = self;
  [v8 enumerateChildrenUsingBlock:v9];
  [(SUUICheckboxFieldSettingDescriptionView *)self setNeedsLayout];
}

void __86__SUUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 elementType];
  if (v3 == 18)
  {
    [*(id *)(a1 + 32) _addInputWithElement:v4];
  }
  else if (v3 == 138)
  {
    [*(id *)(a1 + 32) _addLabelWithElement:v4];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SUUICheckboxFieldSettingDescriptionView;
  [(SUUICheckboxFieldSettingDescriptionView *)&v3 tintColorDidChange];
  [(SUUICheckboxFieldSettingDescriptionView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SUUICheckboxFieldSettingDescriptionView;
  [(SUUICheckboxFieldSettingDescriptionView *)&v28 layoutSubviews];
  [(SUUISettingDescriptionView *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  [(SUUICheckboxFieldSettingDescriptionView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[UISwitch sizeThatFits:](self->_switch, "sizeThatFits:", 1.0, 1.0);
  double v16 = v15;
  double v18 = v17;
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  CGFloat v19 = CGRectGetWidth(v29) - v6 - v16;
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  CGFloat v20 = floor((CGRectGetHeight(v30) - v18) * 0.5);
  -[UISwitch setFrame:](self->_switch, "setFrame:", v19, v20, v16, v18);
  v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v31.origin.x = v19;
  v31.origin.y = v20;
  v31.size.width = v16;
  v31.size.height = v18;
  CGFloat v22 = CGRectGetMinX(v31) - v4 + -16.0;
  [v21 _scaledValueForValue:30.0];
  double v24 = v23;
  [(UILabel *)self->_label _firstBaselineOffsetFromTop];
  double v26 = v24 - v25;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v22, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v4, v26, v22, v27);
}

- (void)_switchValueChanged:(id)a3
{
  id v4 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[UISwitch isOn](self->_switch, "isOn"));
  [(SUUIFieldSettingDescription *)self->_settingDescription setFieldValue:v4 forKey:@"selected"];
}

- (void)_addInputWithElement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if ([v5 isMemberOfClass:objc_opt_class()]) {
    [(SUUICheckboxFieldSettingDescriptionView *)self _addSwitchWithElement:v5];
  }
}

- (void)_addLabelWithElement:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F828E0];
  id v5 = a3;
  double v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  CGFloat v8 = self->_label;
  double v9 = [v5 text];

  CGFloat v10 = [v9 string];
  [(UILabel *)v8 setText:v10];

  double v11 = self->_label;
  CGFloat v12 = [MEMORY[0x263F825C8] blackColor];
  [(UILabel *)v11 setTextColor:v12];

  double v13 = self->_label;
  [(SUUICheckboxFieldSettingDescriptionView *)self addSubview:v13];
}

- (void)_addSwitchWithElement:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F82C40];
  id v5 = a3;
  double v6 = (UISwitch *)objc_alloc_init(v4);
  double v7 = self->_switch;
  self->_switch = v6;

  uint64_t v8 = [v5 isSelected];
  double v9 = [(SUUIFieldSettingDescription *)self->_settingDescription fieldValueForKey:@"selected"];
  id v10 = v9;
  if (v9) {
    uint64_t v8 = [v9 BOOLValue];
  }
  [(UISwitch *)self->_switch setOn:v8];
  [(UISwitch *)self->_switch addTarget:self action:sel__switchValueChanged_ forControlEvents:4096];
  [(SUUICheckboxFieldSettingDescriptionView *)self addSubview:self->_switch];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

@end