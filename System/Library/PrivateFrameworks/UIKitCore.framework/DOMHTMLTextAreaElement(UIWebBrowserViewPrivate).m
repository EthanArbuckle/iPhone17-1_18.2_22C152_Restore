@interface DOMHTMLTextAreaElement(UIWebBrowserViewPrivate)
- (uint64_t)_requiresAccessoryView;
- (uint64_t)_requiresInputView;
- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_supportsAutoFill;
@end

@implementation DOMHTMLTextAreaElement(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return [a3 _startAssistingKeyboard];
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return [a3 _stopAssistingKeyboard];
}

- (uint64_t)_requiresAccessoryView
{
  return 1;
}

- (uint64_t)_requiresInputView
{
  return 1;
}

- (uint64_t)_supportsAutoFill
{
  return 1;
}

@end