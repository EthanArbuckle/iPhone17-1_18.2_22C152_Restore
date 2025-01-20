@interface WebDefaultUIKitDelegate
+ (id)sharedUIKitDelegate;
- (BOOL)handleKeyAppCommandForCurrentEvent;
- (BOOL)handleKeyTextCommandForCurrentEvent;
- (BOOL)hasRichlyEditableSelection;
- (BOOL)performTwoStepDrop:(id)a3 atDestination:(id)a4 isMove:(BOOL)a5;
- (BOOL)performsTwoStepPaste:(id)a3;
- (BOOL)shouldRevealCurrentSelectionAfterInsertion;
- (BOOL)shouldSuppressPasswordEcho;
- (BOOL)webView:(id)a3 shouldScrollToPoint:(CGPoint)a4 forFrame:(id)a5;
- (CGPoint)contentsPointForWebView:(id)a3;
- (CGPoint)interactionLocation;
- (CGRect)documentVisibleRectForWebView:(id)a3;
- (id)checkSpellingOfString:(id)a3;
- (id)readDataFromPasteboard:(id)a3 withIndex:(int64_t)a4;
- (id)supportedPasteboardTypesForCurrentSelection;
- (id)webView:(id)a3 plugInViewWithArguments:(id)a4 fromPlugInPackage:(id)a5;
- (int)deviceOrientation;
- (int64_t)getPasteboardChangeCount;
- (int64_t)getPasteboardItemsCount;
- (void)webView:(id)a3 runOpenPanelForFileButtonWithResultListener:(id)a4 configuration:(id)a5;
@end

@implementation WebDefaultUIKitDelegate

+ (id)sharedUIKitDelegate
{
  id result = (id)sharedDelegate_0;
  if (!sharedDelegate_0)
  {
    id result = objc_alloc_init(WebDefaultUIKitDelegate);
    sharedDelegate_0 = (uint64_t)result;
  }
  return result;
}

- (CGPoint)contentsPointForWebView:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)documentVisibleRectForWebView:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)webView:(id)a3 shouldScrollToPoint:(CGPoint)a4 forFrame:(id)a5
{
  return 1;
}

- (id)webView:(id)a3 plugInViewWithArguments:(id)a4 fromPlugInPackage:(id)a5
{
  return 0;
}

- (BOOL)handleKeyTextCommandForCurrentEvent
{
  return 0;
}

- (BOOL)handleKeyAppCommandForCurrentEvent
{
  return 0;
}

- (void)webView:(id)a3 runOpenPanelForFileButtonWithResultListener:(id)a4 configuration:(id)a5
{
}

- (id)checkSpellingOfString:(id)a3
{
  return 0;
}

- (id)readDataFromPasteboard:(id)a3 withIndex:(int64_t)a4
{
  return 0;
}

- (int64_t)getPasteboardItemsCount
{
  return 0;
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  return 0;
}

- (CGPoint)interactionLocation
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)shouldRevealCurrentSelectionAfterInsertion
{
  return 1;
}

- (int)deviceOrientation
{
  return 0;
}

- (BOOL)shouldSuppressPasswordEcho
{
  return 0;
}

- (BOOL)hasRichlyEditableSelection
{
  return 0;
}

- (BOOL)performsTwoStepPaste:(id)a3
{
  return 0;
}

- (BOOL)performTwoStepDrop:(id)a3 atDestination:(id)a4 isMove:(BOOL)a5
{
  return 0;
}

- (int64_t)getPasteboardChangeCount
{
  return 0;
}

@end