@interface DOMHTMLInputElement(UIWebBrowserViewPrivate)
- (BOOL)_requiresAccessoryView;
- (BOOL)_requiresInputView;
- (uint64_t)_accessoryClear;
- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_supportsAccessoryClear;
- (uint64_t)_supportsAutoFill;
@end

@implementation DOMHTMLInputElement(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  if ([a1 isAssistedDateType])
  {
    return [a3 _startAssistingNode:a1];
  }
  else
  {
    return [a3 _startAssistingKeyboard];
  }
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  if ([a1 isAssistedDateType])
  {
    return [a3 _stopAssistingNode:a1];
  }
  else
  {
    return [a3 _stopAssistingKeyboard];
  }
}

- (BOOL)_requiresAccessoryView
{
  return (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1|| ([a1 isAssistedDateType] & 1) == 0;
}

- (BOOL)_requiresInputView
{
  return (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1|| ([a1 isAssistedDateType] & 1) == 0;
}

- (uint64_t)_supportsAutoFill
{
  return 1;
}

- (uint64_t)_supportsAccessoryClear
{
  if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)return 0; {
  return [a1 isAssistedDateType];
  }
}

- (uint64_t)_accessoryClear
{
  return [a1 setValueWithChangeEvent:&stru_1ED0E84C0];
}

@end