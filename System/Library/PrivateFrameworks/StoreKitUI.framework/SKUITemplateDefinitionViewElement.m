@interface SKUITemplateDefinitionViewElement
- (NSString)definitionMode;
- (NSString)definitionType;
- (SKUIPredicateListViewElement)predicateListViewElement;
- (SKUIViewElement)contentViewElement;
- (void)contentViewElement;
- (void)definitionMode;
- (void)definitionType;
- (void)predicateListViewElement;
@end

@implementation SKUITemplateDefinitionViewElement

- (SKUIViewElement)contentViewElement
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITemplateDefinitionViewElement *)v3 contentViewElement];
      }
    }
  }
  v11 = [(SKUIViewElement *)self firstChildForElementType:26];

  return (SKUIViewElement *)v11;
}

- (NSString)definitionMode
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITemplateDefinitionViewElement *)v3 definitionMode];
      }
    }
  }
  v11 = [(SKUITemplateDefinitionViewElement *)self attributes];
  v12 = [v11 objectForKey:@"mode"];

  return (NSString *)v12;
}

- (NSString)definitionType
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITemplateDefinitionViewElement *)v3 definitionType];
      }
    }
  }
  v11 = [(SKUITemplateDefinitionViewElement *)self attributes];
  v12 = [v11 objectForKey:@"type"];

  return (NSString *)v12;
}

- (SKUIPredicateListViewElement)predicateListViewElement
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITemplateDefinitionViewElement *)v3 predicateListViewElement];
      }
    }
  }
  v11 = [(SKUIViewElement *)self firstChildForElementType:89];

  return (SKUIPredicateListViewElement *)v11;
}

- (void)contentViewElement
{
}

- (void)definitionMode
{
}

- (void)definitionType
{
}

- (void)predicateListViewElement
{
}

@end