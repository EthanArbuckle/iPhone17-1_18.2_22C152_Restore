@interface DOMNode(UIWebBrowserViewPrivate)
- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate;
- (uint64_t)_supportsAccessoryClear;
- (uint64_t)_supportsAutoFill;
- (void)_nextAssistedNode;
- (void)_previousAssistedNode;
- (void)_textFormElement;
@end

@implementation DOMNode(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  uint64_t result = [a1 isContentEditable];
  if (result)
  {
    return [a3 _startAssistingKeyboard];
  }
  return result;
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  uint64_t result = [a1 isContentEditable];
  if (result)
  {
    return [a3 _stopAssistingKeyboard];
  }
  return result;
}

- (uint64_t)_supportsAutoFill
{
  return 0;
}

- (uint64_t)_supportsAccessoryClear
{
  return 0;
}

- (void)_nextAssistedNode
{
  while (1)
  {
    v1 = (void *)[a1 nextFocusNode];
    v2 = v1;
    if (!v1 || ([v1 nodeCanBecomeFirstResponder] & 1) != 0) {
      break;
    }
    a1 = v2;
  }
  return v2;
}

- (void)_previousAssistedNode
{
  while (1)
  {
    v1 = (void *)[a1 previousFocusNode];
    v2 = v1;
    if (!v1 || ([v1 nodeCanBecomeFirstResponder] & 1) != 0) {
      break;
    }
    a1 = v2;
  }
  return v2;
}

- (void)_textFormElement
{
  if ([a1 isContentEditable]) {
    return a1;
  }
  else {
    return 0;
  }
}

@end