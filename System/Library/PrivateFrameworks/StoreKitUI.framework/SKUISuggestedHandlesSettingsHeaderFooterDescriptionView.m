@interface SKUISuggestedHandlesSettingsHeaderFooterDescriptionView
+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_helpLabelWithDescription:(id)a3 forWidth:(double)a4;
+ (void)requestLayoutForSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUISuggestedHandlesSettingsHeaderFooterDescriptionView

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView prefetchResourcesForSettingsHeaderFooterDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView preferredSizeForSettingsHeaderFooterDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView requestLayoutForSettingsHeaderFooterDescription:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView sizeThatFitsWidth:settingsHeaderFooterDescription:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  id v16 = v7;
  v17 = [v16 suggestedHandles];
  unint64_t v18 = [v17 count];

  uint64_t v19 = *MEMORY[0x1E4FB2960];
  v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2960]];
  [v20 _scaledValueForValue:30.0];
  double v22 = v21;
  v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v19];
  [v23 _scaledValueForValue:22.0];
  double v25 = v24;
  v26 = [a1 _helpLabelWithDescription:v16 forWidth:a3];

  [v26 _firstLineBaselineFrameOriginY];
  double v28 = v25 - v27;
  [v26 _lastLineBaselineFrameOriginY];
  double v30 = v28 + v29 + v22 * (double)v18;

  double v31 = a3;
  double v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = (SKUISuggestedHandlesSettingsHeaderFooterDescription *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView reloadWithSettingsHeaderFooterDescription:width:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  description = self->_description;
  self->_description = v7;
  v17 = v7;

  unint64_t v18 = [(id)objc_opt_class() _helpLabelWithDescription:self->_description forWidth:a4];
  label = self->_label;
  self->_label = v18;

  [(SKUISuggestedHandlesSettingsHeaderFooterDescriptionView *)self addSubview:self->_label];
  v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  buttons = self->_buttons;
  self->_buttons = v20;

  double v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2960]];
  v23 = [(SKUISuggestedHandlesSettingsHeaderFooterDescription *)self->_description suggestedHandles];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __115__SKUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke;
  v25[3] = &unk_1E6422200;
  id v26 = v22;
  double v27 = self;
  id v24 = v22;
  [v23 enumerateObjectsUsingBlock:v25];
}

void __115__SKUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = (void *)MEMORY[0x1E4FB14D0];
  id v6 = a2;
  id v11 = [v5 buttonWithType:1];
  id v7 = [NSString stringWithFormat:@"@%@", v6];

  [v11 setTitle:v7 forState:0];
  BOOL v8 = [MEMORY[0x1E4FB1618] systemPinkColor];
  [v11 setTitleColor:v8 forState:0];

  uint64_t v9 = [v11 titleLabel];
  [v9 setFont:*(void *)(a1 + 32)];

  uint64_t v10 = [v11 titleLabel];
  [v10 setTextAlignment:0];

  [v11 setTag:a3];
  [v11 addTarget:*(void *)(a1 + 40) action:sel__buttonAction_ forControlEvents:64];
  [*(id *)(*(void *)(a1 + 40) + 408) addObject:v11];
  [*(id *)(a1 + 40) addSubview:v11];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (void)layoutSubviews
{
}

void __73__SKUISuggestedHandlesSettingsHeaderFooterDescriptionView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(a1 + 40)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  id v3 = a2;
  id v8 = [v3 titleLabel];
  [v8 _firstBaselineOffsetFromTop];
  double v5 = v4;
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(*(CGRect *)(a1 + 48)), 1.0);
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) - v5, v6, v7);
}

- (void)_buttonAction:(id)a3
{
  uint64_t v4 = [a3 tag];
  description = self->_description;

  [(SKUISuggestedHandlesSettingsHeaderFooterDescription *)description selectedHandleAtIndex:v4];
}

+ (id)_helpLabelWithDescription:(id)a3 forWidth:(double)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4FB1930];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = [v6 helpText];

  [v7 setText:v8];
  [v7 setNumberOfLines:0];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2960]];
  [v7 setFont:v9];
  uint64_t v10 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v7 setColor:v10];

  objc_msgSend(v7, "sizeThatFits:", a4, 1.0);
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v11);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_description, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

+ (void)prefetchResourcesForSettingsHeaderFooterDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForSettingsHeaderFooterDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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