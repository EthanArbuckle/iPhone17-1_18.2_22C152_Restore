@interface SXAutoSizedCanvasController
- (BOOL)allowCopy;
- (BOOL)allowHighlighting;
- (BOOL)allowSelectionPopover;
- (BOOL)editorAllowsCaret;
- (BOOL)editorAllowsEditMenu;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginInteraction:(id)a4 atPoint:(CGPoint)a5;
- (BOOL)isCanvasInteractive;
- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4;
- (CGSize)sizeThatFits;
- (Class)wpEditorClassOverride;
- (SXAutoSizedCanvasController)initWithDocumentRoot:(id)a3 actionHandler:(id)a4 dragItemProvider:(id)a5;
- (SXAutoSizedCanvasControllerDelegate)delegate;
- (SXComponentActionHandler)actionHandler;
- (SXTangierDragItemProvider)dragItemProvider;
- (SXTextTangierCanvasViewController)cvc;
- (SXTextTangierInteractiveCanvasController)icc;
- (TSDCanvasView)canvasView;
- (TSKDocumentRoot)documentRoot;
- (double)lineHeight;
- (id)interactiveCanvasController:(id)a3 dragItemForSmartField:(id)a4 interaction:(id)a5 session:(id)a6;
- (void)interactiveCanvasController:(id)a3 interactedWithHyperlink:(id)a4 info:(id)a5 range:(_NSRange)a6 touchPoint:(CGPoint)a7 touchAndHold:(BOOL)a8;
- (void)invalidateLayoutsAndFrames;
- (void)setDelegate:(id)a3;
- (void)teardown;
@end

@implementation SXAutoSizedCanvasController

- (SXAutoSizedCanvasController)initWithDocumentRoot:(id)a3 actionHandler:(id)a4 dragItemProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SXAutoSizedCanvasController;
  v12 = [(SXAutoSizedCanvasController *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentRoot, a3);
    objc_storeStrong((id *)&v13->_actionHandler, a4);
    objc_storeStrong((id *)&v13->_dragItemProvider, a5);
    id v22 = 0;
    id v23 = 0;
    uint64_t v14 = objc_opt_class();
    +[SXTextTangierInteractiveCanvasController createCanvasWithDelegate:v13 outICC:&v23 outLayerHost:&v22 iccClass:v14 layerHostClass:objc_opt_class()];
    v15 = (SXTextTangierInteractiveCanvasController *)v23;
    v16 = (SXTextTangierCanvasViewController *)v22;
    icc = v13->_icc;
    v13->_icc = v15;
    v18 = v15;

    cvc = v13->_cvc;
    v13->_cvc = v16;
    v20 = v16;

    [(TSDInteractiveCanvasController *)v13->_icc setAllowLayoutAndRenderOnThread:1];
    [(TSDInteractiveCanvasController *)v13->_icc setCreateRepsForOffscreenLayouts:1];
  }
  return v13;
}

- (void)teardown
{
  [(SXTextTangierInteractiveCanvasController *)self->_icc teardown];
  cvc = self->_cvc;
  [(TSWPiOSCanvasViewController *)cvc teardown];
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (TSDCanvasView)canvasView
{
  return [(TSDiOSCanvasViewController *)self->_cvc canvasView];
}

- (CGSize)sizeThatFits
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  v7 = [(SXAutoSizedCanvasController *)self icc];
  [v7 layoutIfNeeded];

  v26 = [(TSDInteractiveCanvasController *)self->_icc layoutController];
  v8 = [v26 rootLayout];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v8 addLayoutsToArray:v9];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v27 + 1) + 8 * v14);
        NSClassFromString(&cfstr_Tswplayout.isa);
        if (objc_opt_isKindOfClass())
        {
          [v15 frame];
          v36.origin.CGFloat x = v16;
          v36.origin.CGFloat y = v17;
          v36.size.CGFloat width = v18;
          v36.size.CGFloat height = v19;
          v34.origin.CGFloat x = x;
          v34.origin.CGFloat y = y;
          v34.size.CGFloat width = width;
          v34.size.CGFloat height = height;
          CGRect v35 = CGRectUnion(v34, v36);
          CGFloat x = v35.origin.x;
          CGFloat y = v35.origin.y;
          CGFloat width = v35.size.width;
          CGFloat height = v35.size.height;
          v20 = [v15 columns];
          v21 = [v20 firstObject];

          [v21 range];
          objc_msgSend(v21, "columnRectForRange:", v22 - 1, 1);
          self->_lineHeight = v23;
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  self->_frame.origin.CGFloat x = x;
  self->_frame.origin.CGFloat y = y;
  self->_frame.size.CGFloat width = width;
  self->_frame.size.CGFloat height = height;

  double v24 = width;
  double v25 = height;
  result.CGFloat height = v25;
  result.CGFloat width = v24;
  return result;
}

- (void)invalidateLayoutsAndFrames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(TSDInteractiveCanvasController *)self->_icc layoutController];
  v3 = [v2 rootLayout];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 addLayoutsToArray:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v11 + 1) + 8 * v9);
        NSClassFromString(&cfstr_Tsdlayout.isa);
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v10, "invalidateFrame", (void)v11);
          [v10 invalidateChildren];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)interactiveCanvasController:(id)a3 interactedWithHyperlink:(id)a4 info:(id)a5 range:(_NSRange)a6 touchPoint:(CGPoint)a7 touchAndHold:(BOOL)a8
{
  BOOL v8 = a8;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v39 = a3;
  id v14 = a4;
  id v15 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v14;
    CGFloat v17 = [(SXAutoSizedCanvasController *)self icc];
    CGFloat v18 = [v17 repForInfo:v15];

    objc_msgSend(v18, "glyphRectForRange:includingLabel:", location, length, 0);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    long long v27 = [v39 canvasView];
    objc_msgSend(v27, "convertRect:toView:", 0, v20, v22, v24, v26);
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    CGRect v36 = [(SXAutoSizedCanvasController *)self actionHandler];
    v37 = [v16 action];
    v38 = [v39 canvasView];
    objc_msgSend(v36, "handleAction:sourceView:sourceRect:invocationType:", v37, v38, v8, v29, v31, v33, v35);
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
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
  return 1;
}

- (BOOL)allowHighlighting
{
  return 0;
}

- (BOOL)allowSelectionPopover
{
  return 1;
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginInteraction:(id)a4 atPoint:(CGPoint)a5
{
  return 0;
}

- (id)interactiveCanvasController:(id)a3 dragItemForSmartField:(id)a4 interaction:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(SXAutoSizedCanvasController *)self dragItemProvider];
  id v15 = [v14 dragItemForSmartField:v13 interaction:v12 session:v11];

  if (v15) {
    [v10 endUISession];
  }

  return v15;
}

- (SXAutoSizedCanvasControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXAutoSizedCanvasControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXTextTangierInteractiveCanvasController)icc
{
  return self->_icc;
}

- (SXTextTangierCanvasViewController)cvc
{
  return self->_cvc;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXTangierDragItemProvider)dragItemProvider
{
  return self->_dragItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemProvider, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_cvc, 0);
  objc_storeStrong((id *)&self->_icc, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_documentRoot, 0);
}

@end