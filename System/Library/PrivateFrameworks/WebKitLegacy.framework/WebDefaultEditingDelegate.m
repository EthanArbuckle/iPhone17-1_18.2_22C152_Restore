@interface WebDefaultEditingDelegate
+ (id)sharedEditingDelegate;
- (BOOL)webView:(id)a3 doCommandBySelector:(SEL)a4;
- (BOOL)webView:(id)a3 shouldApplyStyle:(id)a4 toElementsInDOMRange:(id)a5;
- (BOOL)webView:(id)a3 shouldBeginEditingInDOMRange:(id)a4;
- (BOOL)webView:(id)a3 shouldChangeSelectedDOMRange:(id)a4 toDOMRange:(id)a5 affinity:(unint64_t)a6 stillSelecting:(BOOL)a7;
- (BOOL)webView:(id)a3 shouldChangeTypingStyle:(id)a4 toStyle:(id)a5;
- (BOOL)webView:(id)a3 shouldDeleteDOMRange:(id)a4;
- (BOOL)webView:(id)a3 shouldEndEditingInDOMRange:(id)a4;
- (BOOL)webView:(id)a3 shouldInsertNode:(id)a4 replacingDOMRange:(id)a5 givenAction:(int64_t)a6;
- (BOOL)webView:(id)a3 shouldInsertText:(id)a4 replacingDOMRange:(id)a5 givenAction:(int64_t)a6;
- (BOOL)webView:(id)a3 shouldMoveRangeAfterDelete:(id)a4 replacingRange:(id)a5;
- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3;
- (id)supportedPasteboardTypesForCurrentSelection;
- (id)undoManagerForWebView:(id)a3;
@end

@implementation WebDefaultEditingDelegate

+ (id)sharedEditingDelegate
{
  id result = (id)sharedDelegate;
  if (!sharedDelegate)
  {
    id result = objc_alloc_init(WebDefaultEditingDelegate);
    sharedDelegate = (uint64_t)result;
  }
  return result;
}

- (BOOL)webView:(id)a3 shouldBeginEditingInDOMRange:(id)a4
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldEndEditingInDOMRange:(id)a4
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldInsertNode:(id)a4 replacingDOMRange:(id)a5 givenAction:(int64_t)a6
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldInsertText:(id)a4 replacingDOMRange:(id)a5 givenAction:(int64_t)a6
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldDeleteDOMRange:(id)a4
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldChangeSelectedDOMRange:(id)a4 toDOMRange:(id)a5 affinity:(unint64_t)a6 stillSelecting:(BOOL)a7
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldApplyStyle:(id)a4 toElementsInDOMRange:(id)a5
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldMoveRangeAfterDelete:(id)a4 replacingRange:(id)a5
{
  return 1;
}

- (BOOL)webView:(id)a3 shouldChangeTypingStyle:(id)a4 toStyle:(id)a5
{
  return 1;
}

- (BOOL)webView:(id)a3 doCommandBySelector:(SEL)a4
{
  return 0;
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  return 0;
}

- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)undoManagerForWebView:(id)a3
{
  return 0;
}

@end