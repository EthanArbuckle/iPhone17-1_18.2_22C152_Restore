@interface SUUILoadingTemplateViewElement
- (SUUIActivityIndicatorViewElement)activityIndicator;
@end

@implementation SUUILoadingTemplateViewElement

- (SUUIActivityIndicatorViewElement)activityIndicator
{
  return (SUUIActivityIndicatorViewElement *)[(SUUIViewElement *)self firstChildForElementType:4];
}

@end