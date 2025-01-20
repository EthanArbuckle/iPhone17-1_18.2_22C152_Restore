@interface SKUITextFooterSettingsHeaderFooterDescriptionView
+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_concatenateTextFromLabelElements:(id)a3;
+ (id)_labelElementsFromViewElement:(id)a3;
+ (id)_labelWithLabelElements:(id)a3;
+ (void)requestLayoutForSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)layoutSubviews;
- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUITextFooterSettingsHeaderFooterDescriptionView

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITextFooterSettingsHeaderFooterDescriptionView preferredSizeForSettingsHeaderFooterDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUITextFooterSettingsHeaderFooterDescriptionView prefetchResourcesForSettingsHeaderFooterDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (void)requestLayoutForSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUITextFooterSettingsHeaderFooterDescriptionView requestLayoutForSettingsHeaderFooterDescription:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUITextFooterSettingsHeaderFooterDescriptionView sizeThatFitsWidth:settingsHeaderFooterDescription:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [v7 viewElement];
  v17 = [(id)objc_opt_class() _labelElementsFromViewElement:v16];
  v18 = [a1 _labelWithLabelElements:v17];
  v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [v18 setFont:v19];
  objc_msgSend(v18, "sizeThatFits:", a3, 1.0);
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v20, v22);
  [v19 _scaledValueForValue:16.0];
  double v25 = v24;
  [v18 _firstLineBaselineFrameOriginY];
  double v27 = v23 + v25 - v26;

  double v28 = v21;
  double v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUITextFooterSettingsHeaderFooterDescriptionView reloadWithSettingsHeaderFooterDescription:width:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [v6 viewElement];
  viewElement = self->_viewElement;
  self->_viewElement = v15;

  v17 = [(id)objc_opt_class() _labelElementsFromViewElement:self->_viewElement];
  label = self->_label;
  if (label)
  {
    [(UILabel *)label removeFromSuperview];
    v19 = self->_label;
    self->_label = 0;
  }
  double v20 = [(id)objc_opt_class() _labelWithLabelElements:v17];
  double v21 = self->_label;
  self->_label = v20;

  [(SKUITextFooterSettingsHeaderFooterDescriptionView *)self addSubview:self->_label];
  [(SKUITextFooterSettingsHeaderFooterDescriptionView *)self setNeedsLayout];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITextFooterSettingsHeaderFooterDescriptionView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (void)layoutSubviews
{
}

+ (id)_concatenateTextFromLabelElements:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "text", (void)v14);
        uint64_t v11 = [v10 string];

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [v4 componentsJoinedByString:@"\n"];

  return v12;
}

+ (id)_labelElementsFromViewElement:(id)a3
{
  return (id)[a3 titleLabels];
}

+ (id)_labelWithLabelElements:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setNumberOfLines:0];
  uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  [v6 setTextColor:v7];

  uint64_t v8 = [a1 _concatenateTextFromLabelElements:v5];

  [v6 setText:v8];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

+ (void)preferredSizeForSettingsHeaderFooterDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForSettingsHeaderFooterDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForSettingsHeaderFooterDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingsHeaderFooterDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadWithSettingsHeaderFooterDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end