@interface SUUITemplateDefinitionViewElement
- (NSString)definitionMode;
- (NSString)definitionType;
- (SUUIPredicateListViewElement)predicateListViewElement;
- (SUUIViewElement)contentViewElement;
@end

@implementation SUUITemplateDefinitionViewElement

- (SUUIViewElement)contentViewElement
{
  return (SUUIViewElement *)[(SUUIViewElement *)self firstChildForElementType:26];
}

- (NSString)definitionMode
{
  v2 = [(SUUITemplateDefinitionViewElement *)self attributes];
  v3 = [v2 objectForKey:@"mode"];

  return (NSString *)v3;
}

- (NSString)definitionType
{
  v2 = [(SUUITemplateDefinitionViewElement *)self attributes];
  v3 = [v2 objectForKey:@"type"];

  return (NSString *)v3;
}

- (SUUIPredicateListViewElement)predicateListViewElement
{
  return (SUUIPredicateListViewElement *)[(SUUIViewElement *)self firstChildForElementType:89];
}

@end