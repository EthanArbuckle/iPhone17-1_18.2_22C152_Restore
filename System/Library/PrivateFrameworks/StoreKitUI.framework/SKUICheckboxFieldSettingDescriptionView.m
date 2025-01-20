@interface SKUICheckboxFieldSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)_addInputWithElement:(id)a3;
- (void)_addLabelWithElement:(id)a3;
- (void)_addSwitchWithElement:(id)a3;
- (void)_switchValueChanged:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)tintColorDidChange;
@end

@implementation SKUICheckboxFieldSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUICheckboxFieldSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUICheckboxFieldSettingDescriptionView preferredSizeForSettingDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUICheckboxFieldSettingDescriptionView requestLayoutForSettingDescription:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUICheckboxFieldSettingDescriptionView sizeThatFitsWidth:settingDescription:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v6 = (SKUIFieldSettingDescription *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUICheckboxFieldSettingDescriptionView reloadWithSettingDescription:width:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  settingDescription = self->_settingDescription;
  self->_settingDescription = v6;
  v16 = v6;

  v17 = [(SKUISettingDescription *)v16 viewElement];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__SKUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v18[3] = &unk_1E6423570;
  v18[4] = self;
  [v17 enumerateChildrenUsingBlock:v18];
  [(SKUICheckboxFieldSettingDescriptionView *)self setNeedsLayout];
}

void __86__SKUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
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

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v3) {
      -[SKUICheckboxFieldSettingDescriptionView setContentInset:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICheckboxFieldSettingDescriptionView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (void)tintColorDidChange
{
}

- (void)layoutSubviews
{
}

- (void)_switchValueChanged:(id)a3
{
  id v4 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[UISwitch isOn](self->_switch, "isOn"));
  [(SKUIFieldSettingDescription *)self->_settingDescription setFieldValue:v4 forKey:@"selected"];
}

- (void)_addInputWithElement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if ([v5 isMemberOfClass:objc_opt_class()]) {
    [(SKUICheckboxFieldSettingDescriptionView *)self _addSwitchWithElement:v5];
  }
}

- (void)_addLabelWithElement:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  uint64_t v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  uint64_t v8 = self->_label;
  uint64_t v9 = [v5 text];

  uint64_t v10 = [v9 string];
  [(UILabel *)v8 setText:v10];

  uint64_t v11 = self->_label;
  uint64_t v12 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)v11 setTextColor:v12];

  uint64_t v13 = self->_label;

  [(SKUICheckboxFieldSettingDescriptionView *)self addSubview:v13];
}

- (void)_addSwitchWithElement:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1CD0];
  id v5 = a3;
  uint64_t v6 = (UISwitch *)objc_alloc_init(v4);
  uint64_t v7 = self->_switch;
  self->_switch = v6;

  uint64_t v8 = [v5 isSelected];
  uint64_t v9 = [(SKUIFieldSettingDescription *)self->_settingDescription fieldValueForKey:@"selected"];
  id v10 = v9;
  if (v9) {
    uint64_t v8 = [v9 BOOLValue];
  }
  [(UISwitch *)self->_switch setOn:v8];
  [(UISwitch *)self->_switch addTarget:self action:sel__switchValueChanged_ forControlEvents:4096];
  [(SKUICheckboxFieldSettingDescriptionView *)self addSubview:self->_switch];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

+ (void)prefetchResourcesForSettingDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForSettingDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadWithSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end