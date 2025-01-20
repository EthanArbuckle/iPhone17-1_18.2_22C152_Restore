@interface SKUISettingsHeaderFooterDescription
+ (Class)viewClassForSettingsHeaderFooterDescription:(id)a3;
+ (id)_settingsHeaderFooterDescriptionWithFooterElement:(id)a3;
+ (id)_settingsHeaderFooterDescriptionWithHeaderElement:(id)a3;
+ (id)settingsHeaderFooterDescriptionWithViewElement:(id)a3;
- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3;
- (SKUISettingsHeaderFooterDescription)initWithViewElement:(id)a3;
- (id)viewElement;
@end

@implementation SKUISettingsHeaderFooterDescription

- (SKUISettingsHeaderFooterDescription)initWithViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUISettingsHeaderFooterDescription initWithViewElement:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v14 = [(SKUISettingsHeaderFooterDescription *)self init];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_viewElement, a3);
  }

  return v15;
}

+ (id)settingsHeaderFooterDescriptionWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUISettingsHeaderFooterDescription settingsHeaderFooterDescriptionWithViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 elementType];
  if (v13 == 41)
  {
    uint64_t v14 = [a1 _settingsHeaderFooterDescriptionWithFooterElement:v4];
    goto LABEL_9;
  }
  if (v13 == 48)
  {
    uint64_t v14 = [a1 _settingsHeaderFooterDescriptionWithHeaderElement:v4];
LABEL_9:
    v15 = (void *)v14;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_11:

  return v15;
}

+ (Class)viewClassForSettingsHeaderFooterDescription:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 _viewClassForSettingsHeaderFooterDescription:v3];

  return (Class)v12;
}

- (id)viewElement
{
  return self->_viewElement;
}

+ (id)_settingsHeaderFooterDescriptionWithFooterElement:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUISettingsHeaderFooterDescription _settingsHeaderFooterDescriptionWithFooterElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 children];
  uint64_t v13 = [v12 firstObject];

  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = [v13 elementType];
  if (v14 == 138)
  {
    v15 = off_1E6421070;
    goto LABEL_11;
  }
  if (v14 != 12)
  {
LABEL_9:
    v16 = 0;
    goto LABEL_12;
  }
  v15 = off_1E6420A90;
LABEL_11:
  v16 = (void *)[objc_alloc(*v15) initWithViewElement:v3];
LABEL_12:

  return v16;
}

+ (id)_settingsHeaderFooterDescriptionWithHeaderElement:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUISettingsHeaderFooterDescription _settingsHeaderFooterDescriptionWithHeaderElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 children];
  uint64_t v13 = [v12 firstObject];

  if (v13 && [v13 elementType] == 138) {
    uint64_t v14 = [(SKUISettingsHeaderFooterDescription *)[SKUITextHeaderSettingsHeaderFooterDescription alloc] initWithViewElement:v3];
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)settingsHeaderFooterDescriptionWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)viewClassForSettingsHeaderFooterDescription:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_settingsHeaderFooterDescriptionWithFooterElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_settingsHeaderFooterDescriptionWithHeaderElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end