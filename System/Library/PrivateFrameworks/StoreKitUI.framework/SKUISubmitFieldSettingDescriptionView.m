@interface SKUISubmitFieldSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (id)_currentControllerValue;
- (void)_addInputWithElement:(id)a3;
- (void)_addSubmitInputWithElement:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setEnabled:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation SKUISubmitFieldSettingDescriptionView

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISubmitFieldSettingDescriptionView setEnabled:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUISubmitFieldSettingDescriptionView;
  [(SKUIFieldSettingDescriptionView *)&v15 setEnabled:v3];
  label = self->_label;
  if (label)
  {
    if (v3) {
      [(SKUISubmitFieldSettingDescriptionView *)self tintColor];
    }
    else {
    v14 = [MEMORY[0x1E4FB1618] grayColor];
    }
    [(UILabel *)label setTextColor:v14];
  }
}

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUISubmitFieldSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUISubmitFieldSettingDescriptionView preferredSizeForSettingDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
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
  id v6 = a3;
  id v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUISubmitFieldSettingDescriptionView requestLayoutForSettingDescription:width:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [v6 viewElement];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  id v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__SKUISubmitFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke;
  v17[3] = &unk_1E6422498;
  v17[4] = v18;
  [v16 enumerateChildrenUsingBlock:v17];
  _Block_object_dispose(v18, 8);
}

void __90__SKUISubmitFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v4 = [v5 elementType];
  if ((unint64_t)(v4 - 139) < 2 || v4 == 58) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
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
        +[SKUISubmitFieldSettingDescriptionView sizeThatFitsWidth:settingDescription:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        -[SKUISubmitFieldSettingDescriptionView reloadWithSettingDescription:width:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  settingDescription = self->_settingDescription;
  self->_settingDescription = v6;
  v16 = v6;

  v17 = [(SKUISettingDescription *)v16 viewElement];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__SKUISubmitFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v18[3] = &unk_1E6423570;
  v18[4] = self;
  [v17 enumerateChildrenUsingBlock:v18];
  [(SKUISubmitFieldSettingDescriptionView *)self setNeedsLayout];
}

void __84__SKUISubmitFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 elementType];
  if ((unint64_t)(v3 - 139) < 2 || v3 == 58) {
    [*(id *)(a1 + 32) _addInputWithElement:v4];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v3) {
      -[SKUISubmitFieldSettingDescriptionView setContentInset:](v3, v4, v5, v6, v7, v8, v9, v10);
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
        -[SKUISubmitFieldSettingDescriptionView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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

- (void)_addInputWithElement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if ([v5 isMemberOfClass:objc_opt_class()]) {
    [(SKUISubmitFieldSettingDescriptionView *)self _addSubmitInputWithElement:v5];
  }
}

- (void)_addSubmitInputWithElement:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  uint64_t v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  uint64_t v8 = self->_label;
  uint64_t v9 = [v5 label];

  [(UILabel *)v8 setText:v9];
  uint64_t v10 = self->_label;
  uint64_t v11 = [MEMORY[0x1E4FB1618] grayColor];
  [(UILabel *)v10 setTextColor:v11];

  uint64_t v12 = self->_label;

  [(SKUISubmitFieldSettingDescriptionView *)self addSubview:v12];
}

- (id)_currentControllerValue
{
  BOOL v3 = [(SKUIFieldSettingDescription *)self->_settingDescription controller];
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v4 = [v3 valueForSettingDescription:self->_settingDescription];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

- (void)setEnabled:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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