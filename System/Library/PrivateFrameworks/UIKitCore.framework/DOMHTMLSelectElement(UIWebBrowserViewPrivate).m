@interface DOMHTMLSelectElement(UIWebBrowserViewPrivate)
- (BOOL)_requiresAccessoryView;
- (BOOL)_requiresInputView;
- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_supportsAutoFill;
@end

@implementation DOMHTMLSelectElement(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return [a3 _startAssistingNode:a1];
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return [a3 _stopAssistingNode:a1];
}

- (BOOL)_requiresAccessoryView
{
  return ([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (BOOL)_requiresInputView
{
  return ([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (uint64_t)_supportsAutoFill
{
  return 0;
}

@end