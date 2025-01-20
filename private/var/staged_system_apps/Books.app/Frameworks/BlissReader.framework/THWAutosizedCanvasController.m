@interface THWAutosizedCanvasController
- (BOOL)allowCopy;
- (BOOL)allowHighlighting;
- (BOOL)allowSelectionPopover;
- (BOOL)editorAllowsCaret;
- (BOOL)editorAllowsEditMenu;
- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)interactiveCanvasControllerShouldForwardTabEventsToNextResponder:(id)a3;
- (BOOL)isCanvasInteractive;
- (BOOL)spellCheckingSuppressed;
- (CGSize)canvasLayoutSize;
- (Class)wpEditorClassOverride;
- (THWAutosizedCanvasController)initWithDelegate:(id)a3 documentRoot:(id)a4;
- (THWAutosizedCanvasControllerDelegate)delegate;
- (TSDCanvasView)canvasView;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSDiOSCanvasViewController)canvasViewController;
- (TSKDocumentRoot)documentRoot;
- (TSWPLongPressGestureRecognizer)immediatePressGesture;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4;
- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (void)dealloc;
- (void)interactiveCanvasControllerDidLayout:(id)a3;
- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3;
- (void)interactiveCanvasControllerWillLayout:(id)a3;
- (void)invalidateLayoutsAndFrames;
- (void)setDelegate:(id)a3;
- (void)setImmediatePressGesture:(id)a3;
- (void)setupImmediatePressGesture;
- (void)teardown;
@end

@implementation THWAutosizedCanvasController

- (THWAutosizedCanvasController)initWithDelegate:(id)a3 documentRoot:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THWAutosizedCanvasController;
  v6 = [(THWAutosizedCanvasController *)&v8 init];
  if (v6)
  {
    v6->_documentRoot = (TSKDocumentRoot *)a4;
    v6->_delegate = (THWAutosizedCanvasControllerDelegate *)a3;
    THCanvasCreate(v6, (id *)&v6->_interactiveCanvasController, &v6->_canvasViewController);
    [(TSDInteractiveCanvasController *)v6->_interactiveCanvasController disableAllGestures];
    [(TSDInteractiveCanvasController *)v6->_interactiveCanvasController setAllowLayoutAndRenderOnThread:1];
    [(TSDInteractiveCanvasController *)v6->_interactiveCanvasController setCreateRepsForOffscreenLayouts:1];
  }
  return v6;
}

- (void)dealloc
{
  [(TSDInteractiveCanvasController *)[(THWAutosizedCanvasController *)self interactiveCanvasController] setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)THWAutosizedCanvasController;
  [(THWAutosizedCanvasController *)&v3 dealloc];
}

- (TSDCanvasView)canvasView
{
  return (TSDCanvasView *)[(TSDiOSCanvasViewController *)self->_canvasViewController canvasView];
}

- (void)teardown
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController teardown];
  canvasViewController = self->_canvasViewController;

  [(TSDiOSCanvasViewController *)canvasViewController teardown];
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (BOOL)editorAllowsEditMenu
{
  return 0;
}

- (BOOL)allowCopy
{
  return 0;
}

- (BOOL)allowHighlighting
{
  return 0;
}

- (BOOL)allowSelectionPopover
{
  objc_super v3 = [(THWAutosizedCanvasController *)self delegate];

  return [(THWAutosizedCanvasControllerDelegate *)v3 allowSelectionPopoverForAutosizedCanvasController:self];
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  v6 = [(THWAutosizedCanvasController *)self delegate];

  return [(THWAutosizedCanvasControllerDelegate *)v6 autosizedCanvasController:self geometryProviderForLayout:a4];
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  objc_super v8 = [(THWAutosizedCanvasController *)self delegate];

  return [(THWAutosizedCanvasControllerDelegate *)v8 autosizedCanvasController:self delegateConformingToProtocol:a4 forRep:a5];
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  v6 = [(THWAutosizedCanvasController *)self delegate];

  return [(THWAutosizedCanvasControllerDelegate *)v6 autosizedCanvasController:self primaryTargetForGesture:a4];
}

- (void)interactiveCanvasControllerWillLayout:(id)a3
{
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  v4 = sub_17AF64;
  v5 = &unk_456DE0;
  v6 = self;
  if (+[NSThread isMainThread]) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(THWAutosizedCanvasControllerDelegate *)delegate autosizedCanvasControllerIsRelatedCanvasScrolling:self];
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(THWAutosizedCanvasControllerDelegate *)delegate autosizedCanvasControllerDidLayoutAndRenderOnBackgroundThread:self];
  }
}

- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (BOOL)interactiveCanvasControllerShouldForwardTabEventsToNextResponder:(id)a3
{
  return 1;
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  v6 = [(THWAutosizedCanvasController *)self delegate];

  return [(THWAutosizedCanvasControllerDelegate *)v6 autosizedCanvasController:self allowsEditMenuForRep:a4];
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  v6 = [(THWAutosizedCanvasController *)self delegate];
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();

  return [(THWAutosizedCanvasControllerDelegate *)v6 autosizedCanvasController:self allowsSelectionForRep:v7];
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (void)setupImmediatePressGesture
{
  if (!self->_immediatePressGesture)
  {
    id v3 = objc_alloc((Class)TSWPLongPressGestureRecognizer);
    id v4 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController gestureDispatcher];
    v5 = (TSWPLongPressGestureRecognizer *)[v3 initWithGestureDispatcher:v4 gestureKind:TSWPImmediatePress];
    self->_immediatePressGesture = v5;
    [(TSWPLongPressGestureRecognizer *)v5 setNumberOfTapsRequired:0];
    [(TSWPLongPressGestureRecognizer *)self->_immediatePressGesture setNumberOfTouchesRequired:1];
    [(TSWPLongPressGestureRecognizer *)self->_immediatePressGesture setMinimumPressDuration:0.0];
    id v6 = [(TSDiOSCanvasViewController *)self->_canvasViewController viewForGestureRecognizer:self->_immediatePressGesture];
    immediatePressGesture = self->_immediatePressGesture;
    [v6 addGestureRecognizer:immediatePressGesture];
  }
}

- (void)invalidateLayoutsAndFrames
{
  id v2 = [[self->_interactiveCanvasController layoutController] rootLayout];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v2 addLayoutsToArray:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        objc_super v8 = (void *)TSUDynamicCast();
        if (v8)
        {
          v9 = v8;
          [v8 invalidateFrame];
          [v9 invalidateChildren];
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (TSDiOSCanvasViewController)canvasViewController
{
  return self->_canvasViewController;
}

- (THWAutosizedCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWAutosizedCanvasControllerDelegate *)a3;
}

- (TSWPLongPressGestureRecognizer)immediatePressGesture
{
  return self->_immediatePressGesture;
}

- (void)setImmediatePressGesture:(id)a3
{
}

- (CGSize)canvasLayoutSize
{
  double width = self->_canvasLayoutSize.width;
  double height = self->_canvasLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end