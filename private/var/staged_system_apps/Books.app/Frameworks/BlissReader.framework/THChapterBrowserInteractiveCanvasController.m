@interface THChapterBrowserInteractiveCanvasController
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)supportsReadingHighlights;
- (BOOL)supportsWritingHighlights;
- (CGRect)visibleBoundsRect;
@end

@implementation THChapterBrowserInteractiveCanvasController

- (CGRect)visibleBoundsRect
{
  id v2 = [(THChapterBrowserInteractiveCanvasController *)self canvasView];

  [v2 bounds];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)supportsReadingHighlights
{
  return 0;
}

- (BOOL)supportsWritingHighlights
{
  return 0;
}

- (BOOL)canHandleGesture:(id)a3
{
  objc_opt_class();
  BOOL result = 0;
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id)TSWPImmediateSingleTap;
    if (v4 == [a3 gestureKind]) {
      return 1;
    }
  }
  return result;
}

@end