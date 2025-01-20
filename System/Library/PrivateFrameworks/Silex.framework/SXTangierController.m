@interface SXTangierController
- (BOOL)disableClippingForTiles;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginInteraction:(id)a4 atPoint:(CGPoint)a5;
- (BOOL)isCanvasInteractive;
- (BOOL)isEnclosingCanvasScrolling;
- (BOOL)performedInitialLayoutAndRender;
- (BOOL)preventScrollViewDidScrollReentrance;
- (BOOL)rebuildFlows;
- (BOOL)selectAllEnabled;
- (BOOL)selectionEnabled;
- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds;
- (CGPoint)pointForCharacterAtIndex:(unint64_t)a3 inComponentWithIdentifier:(id)a4;
- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForClippingReps:(CGRect)a4;
- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4;
- (CGRect)visibleBounds;
- (NSMutableSet)presentedTextViews;
- (NSString)selectedText;
- (SXComponentActionHandler)componentActionHandler;
- (SXComponentController)componentController;
- (SXComponentInteractionManager)componentInteractionManager;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXFeatures)config;
- (SXScrollView)scrollView;
- (SXTangierController)initWithViewport:(id)a3 scrollView:(id)a4 componentActionHandler:(id)a5 dragItemProvider:(id)a6 componentController:(id)a7 componentInteractionManager:(id)a8 DOMObjectProvider:(id)a9 adIgnorableViewFactory:(id)a10 config:(id)a11;
- (SXTangierControllerDelegate)delegate;
- (SXTangierDragItemProvider)dragItemProvider;
- (SXTangierRepDirectLayerHostProvider)directLayerHostProvider;
- (SXTangierTextRenderCollector)textRenderCollector;
- (SXTextTangierCanvasViewController)cvc;
- (SXTextTangierInteractiveCanvasController)icc;
- (SXViewport)viewport;
- (TSKDocumentRoot)documentRoot;
- (TSWPSelection)storedSelection;
- (UIView)aboveRepsHost;
- (UIView)overlayRepsHost;
- (UIView)underRepsHost;
- (id)backgroundColorForDragUIPlatter;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)interactiveCanvasController:(id)a3 dragItemForSmartField:(id)a4 interaction:(id)a5 session:(id)a6;
- (id)interactiveCanvasController:(id)a3 infoForModel:(id)a4 withSelection:(id)a5;
- (id)layoutDescriptionForComponent:(id)a3;
- (id)scrollPositionForVisibleBounds:(CGRect)a3 canvasWidth:(double)a4;
- (id)topLevelLayersForInteractiveCanvasController:(id)a3;
- (id)topLevelRepsForInteractiveCanvasController:(id)a3;
- (id)visibleBoundsClipViewForInteractiveCanvasController:(id)a3;
- (os_unfair_lock_s)unfairLock;
- (unint64_t)initialSubviewCount;
- (unint64_t)selectableWordLimit;
- (void)_fixLayoutOffsets;
- (void)clearSelection;
- (void)dealloc;
- (void)didStartPresentingTextView:(id)a3;
- (void)didStopPresentingTextView:(id)a3;
- (void)didTransitionToPresented;
- (void)interactiveCanvasController:(id)a3 interactedWithHyperlink:(id)a4 info:(id)a5 range:(_NSRange)a6 touchPoint:(CGPoint)a7 touchAndHold:(BOOL)a8;
- (void)interactiveCanvasController:(id)a3 scrollViewDidEndDragging:(id)a4 willDecelerate:(BOOL)a5;
- (void)interactiveCanvasController:(id)a3 scrollViewWillBeginDragging:(id)a4;
- (void)interactiveCanvasController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6;
- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3;
- (void)interactiveCanvasControllerDidScroll:(id)a3;
- (void)interactiveCanvasControllerDidStopScrolling:(id)a3;
- (void)interactiveCanvasControllerWillStartInteraction:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableClippingForTiles:(BOOL)a3;
- (void)setEnclosingCanvasScrolling:(BOOL)a3;
- (void)setInitialSubviewCount:(unint64_t)a3;
- (void)setPerformedInitialLayoutAndRender:(BOOL)a3;
- (void)setPreventScrollViewDidScrollReentrance:(BOOL)a3;
- (void)setRebuildFlows:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setSelectAllEnabled:(BOOL)a3;
- (void)setSelectionEnabled:(BOOL)a3;
- (void)setStoredSelection:(id)a3;
- (void)setUnscaledCanvasRect:(CGRect)a3;
- (void)setViewport:(id)a3;
- (void)teardown;
- (void)updateCanvasSize:(CGSize)a3 forComponentViews:(id)a4;
- (void)updateInfosWithBlock:(id)a3;
- (void)updatePresentationState;
- (void)willTransitionToPresented;
@end

@implementation SXTangierController

- (SXTangierController)initWithViewport:(id)a3 scrollView:(id)a4 componentActionHandler:(id)a5 dragItemProvider:(id)a6 componentController:(id)a7 componentInteractionManager:(id)a8 DOMObjectProvider:(id)a9 adIgnorableViewFactory:(id)a10 config:(id)a11
{
  id v87 = a3;
  id v88 = a4;
  id v86 = a5;
  id obj = a6;
  id v85 = a6;
  id v18 = a7;
  id v19 = a8;
  id v84 = a9;
  id v20 = a10;
  id v89 = a11;
  v92.receiver = self;
  v92.super_class = (Class)SXTangierController;
  v21 = [(SXTangierController *)&v92 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_viewport, a3);
    [(SXViewport *)v22->_viewport addViewportChangeListener:v22 forOptions:8];
    objc_storeStrong((id *)&v22->_scrollView, a4);
    objc_storeStrong((id *)&v22->_componentActionHandler, a5);
    objc_storeStrong((id *)&v22->_dragItemProvider, obj);
    id v23 = v18;
    objc_storeWeak((id *)&v22->_componentController, v18);
    id v24 = v19;
    objc_storeWeak((id *)&v22->_componentInteractionManager, v19);
    objc_storeStrong((id *)&v22->_DOMObjectProvider, a9);
    objc_storeStrong((id *)&v22->_config, a11);
    v22->_unfairLock._os_unfair_lock_opaque = 0;
    +[SXTextTangierApplicationDelegate setup];
    v25 = objc_alloc_init(SXTextTangierDocumentRoot);
    documentRoot = v22->_documentRoot;
    v22->_documentRoot = v25;

    v27 = objc_alloc_init(SXTangierRepDirectLayerHostProvider);
    directLayerHostProvider = v22->_directLayerHostProvider;
    v22->_directLayerHostProvider = v27;

    v29 = objc_alloc_init(SXTangierTextRenderCollector);
    textRenderCollector = v22->_textRenderCollector;
    v22->_textRenderCollector = v29;

    id v90 = 0;
    id v91 = 0;
    uint64_t v31 = objc_opt_class();
    +[SXTextTangierInteractiveCanvasController createCanvasWithDelegate:v22 outICC:&v91 outLayerHost:&v90 iccClass:v31 layerHostClass:objc_opt_class()];
    id v32 = v91;
    id v33 = v91;
    id v34 = v90;
    id v35 = v90;
    [v33 setForceLayoutAndRenderOnThread:1];
    objc_storeStrong((id *)&v22->_icc, v32);
    objc_storeStrong((id *)&v22->_cvc, v34);
    [(SXTextTangierDocumentRoot *)v22->_documentRoot setViewController:v22->_cvc];
    v36 = [(SXTangierController *)v22 icc];
    [v36 setCreateRepsForOffscreenLayouts:1];

    v37 = [(SXTangierController *)v22 icc];
    [v37 setAllowLayoutAndRenderOnThread:1];

    v38 = [(SXTangierController *)v22 icc];
    [v38 setNestedCanvasAllowLayoutAndRenderOnThread:1];

    v39 = [(SXTangierController *)v22 icc];
    LOBYTE(v34) = objc_opt_respondsToSelector();

    if (v34)
    {
      v40 = [(SXTangierController *)v22 icc];
      [v40 setForceTilingLayoutOnThreadWhenScrolling:1];
    }
    v41 = v22->_directLayerHostProvider;
    v42 = [(SXTangierController *)v22 icc];
    [v42 setDirectLayerHostProvider:v41];

    v43 = [(SXTangierController *)v22 cvc];
    v44 = [v43 view];
    [v44 setClipsToBounds:0];

    v45 = [MEMORY[0x263F1C550] clearColor];
    v46 = [(SXTangierController *)v22 cvc];
    v47 = [v46 view];
    [v47 setBackgroundColor:v45];

    v48 = [(SXTangierController *)v22 cvc];
    [v48 setDelegate:v22];

    [(SXTangierController *)v22 setSelectionEnabled:1];
    -[SXTangierController setSelectAllEnabled:](v22, "setSelectAllEnabled:", [v89 limitTextSelectionEnabled] ^ 1);
    double v49 = *MEMORY[0x263F001B0];
    double v50 = *(double *)(MEMORY[0x263F001B0] + 8);
    v51 = [(SXTangierController *)v22 cvc];
    v52 = [v51 canvasLayer];
    objc_msgSend(v52, "setUnscaledSize:", v49, v50);

    double v53 = *MEMORY[0x263F001A8];
    double v54 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v55 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v56 = *(double *)(MEMORY[0x263F001A8] + 24);
    v57 = [(SXTangierController *)v22 icc];
    v58 = [v57 canvasView];
    objc_msgSend(v58, "setFrame:", v53, v54, v55, v56);

    v59 = [(SXTangierController *)v22 icc];
    [v59 setDataSource:v22];

    v60 = [(SXTangierController *)v22 icc];
    v61 = [v60 canvasView];

    id v20 = v82;
    uint64_t v62 = [v82 createView];
    underRepsHost = v22->_underRepsHost;
    v22->_underRepsHost = (UIView *)v62;

    v64 = v22->_underRepsHost;
    [v61 bounds];
    -[UIView setBounds:](v64, "setBounds:");
    [(UIView *)v22->_underRepsHost setAutoresizingMask:18];
    v65 = [(UIView *)v22->_underRepsHost layer];
    [v65 setZPosition:-1.0];

    uint64_t v66 = [v82 createView];
    overlayRepsHost = v22->_overlayRepsHost;
    v22->_overlayRepsHost = (UIView *)v66;

    v68 = v22->_overlayRepsHost;
    [v61 bounds];
    -[UIView setBounds:](v68, "setBounds:");
    [(UIView *)v22->_overlayRepsHost setAutoresizingMask:18];
    v69 = [(UIView *)v22->_overlayRepsHost layer];
    [v69 setZPosition:1.0];

    [(UIView *)v22->_overlayRepsHost setTag:45366];
    uint64_t v70 = [v82 createView];
    aboveRepsHost = v22->_aboveRepsHost;
    v22->_aboveRepsHost = (UIView *)v70;

    v72 = v22->_aboveRepsHost;
    [v61 bounds];
    -[UIView setBounds:](v72, "setBounds:");
    [(UIView *)v22->_aboveRepsHost setAutoresizingMask:18];
    v73 = [(UIView *)v22->_aboveRepsHost layer];
    [v73 setZPosition:2.0];

    [(UIView *)v22->_aboveRepsHost setTag:45366];
    [v61 addSubview:v22->_underRepsHost];
    [v61 addSubview:v22->_overlayRepsHost];
    [v61 addSubview:v22->_aboveRepsHost];
    [(UIView *)v22->_underRepsHost setUserInteractionEnabled:0];
    [(UIView *)v22->_overlayRepsHost setUserInteractionEnabled:0];
    [(UIView *)v22->_aboveRepsHost setUserInteractionEnabled:0];
    v74 = [(UIView *)v22->_underRepsHost layer];
    [(SXTangierRepDirectLayerHostProvider *)v22->_directLayerHostProvider setUnderRepsLayerHost:v74];

    v75 = [(UIView *)v22->_aboveRepsHost layer];
    [(SXTangierRepDirectLayerHostProvider *)v22->_directLayerHostProvider setAboveRepsLayerHost:v75];

    v76 = [(UIView *)v22->_overlayRepsHost layer];
    [(SXTangierRepDirectLayerHostProvider *)v22->_directLayerHostProvider setOverlayLayerHost:v76];

    uint64_t v77 = [MEMORY[0x263EFF9C0] set];
    presentedTextViews = v22->_presentedTextViews;
    v22->_presentedTextViews = (NSMutableSet *)v77;

    v79 = [v61 subviews];
    v22->_initialSubviewCount = [v79 count];

    v80 = [(SXTangierController *)v22 icc];
    [v80 setScrollView:v88];

    [(SXTangierController *)v22 updatePresentationState];
    id v18 = v23;
    id v19 = v24;
  }

  return v22;
}

- (void)updatePresentationState
{
  v3 = [(SXTangierController *)self viewport];
  uint64_t v4 = [v3 appearState];

  if (v4 == 1)
  {
    [(SXTangierController *)self willTransitionToPresented];
  }
  else
  {
    v5 = [(SXTangierController *)self viewport];
    uint64_t v6 = [v5 appearState];

    if (v6 == 2)
    {
      [(SXTangierController *)self didTransitionToPresented];
    }
  }
}

- (void)teardown
{
  v3 = [(SXTangierController *)self icc];
  [v3 teardown];

  uint64_t v4 = [(SXTangierController *)self cvc];
  [v4 teardown];

  icc = self->_icc;
  self->_icc = 0;

  cvc = self->_cvc;
  self->_cvc = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SXTangierController;
  [(SXTangierController *)&v2 dealloc];
}

- (void)didStartPresentingTextView:(id)a3
{
  p_unfairLock = &self->_unfairLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(SXTangierController *)self presentedTextViews];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_unfairLock);
  id v8 = [(SXTangierController *)self icc];
  v7 = [v8 canvas];
  [v7 layoutIfNeeded];
}

- (void)didStopPresentingTextView:(id)a3
{
  p_unfairLock = &self->_unfairLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(SXTangierController *)self presentedTextViews];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_unfairLock);
}

- (BOOL)selectionEnabled
{
  return [(SXTextTangierCanvasViewController *)self->_cvc selectionEnabled];
}

- (void)setSelectionEnabled:(BOOL)a3
{
}

- (BOOL)selectAllEnabled
{
  return [(SXTextTangierCanvasViewController *)self->_cvc selectionEnabled];
}

- (void)setSelectAllEnabled:(BOOL)a3
{
}

- (void)clearSelection
{
  id v2 = [(SXTangierController *)self icc];
  [v2 endEditing];
}

- (void)updateCanvasSize:(CGSize)a3 forComponentViews:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[SXTangierController setUnscaledCanvasRect:](self, "setUnscaledCanvasRect:", 0.0, 0.0, width, height);
  id v8 = [(SXTangierController *)self icc];
  v9 = [v8 canvas];
  [v9 layoutIfNeeded];

  if ([(SXTangierController *)self rebuildFlows])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__SXTangierController_updateCanvasSize_forComponentViews___block_invoke;
    v12[3] = &unk_264652D18;
    id v13 = v7;
    [(SXTangierController *)self updateInfosWithBlock:v12];
  }
  v10 = [(SXTangierController *)self icc];
  v11 = [v10 canvas];
  [v11 layoutIfNeeded];

  [(SXTangierController *)self _fixLayoutOffsets];
}

void __58__SXTangierController_updateCanvasSize_forComponentViews___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "provideInfosLayoutTo:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setUnscaledCanvasRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v6 = [(SXTangierController *)self icc];
  uint64_t v7 = [v6 layerHost];
  uint64_t v8 = [v7 canvasLayer];
  [v8 unscaledSize];
  double v10 = v9;
  double v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_preventScrollViewDidScrollReentrance = 1;
    uint64_t v14 = [(SXTangierController *)self icc];
    v15 = [v14 layerHost];
    v16 = [v15 canvasLayer];
    objc_msgSend(v16, "setUnscaledSize:", width, height);

    self->_preventScrollViewDidScrollReentrance = 0;
  }
}

- (id)scrollPositionForVisibleBounds:(CGRect)a3 canvasWidth:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v79 = *MEMORY[0x263EF8340];
  double v10 = [(SXTangierController *)self icc];
  double v11 = [v10 layoutController];
  CGFloat rect1 = width;
  double v12 = objc_msgSend(v11, "layoutsInRect:", x, y, width, height);

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v12;
  id v13 = (SXTextComponentScrollPosition *)[obj countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (v13)
  {
    v67 = self;
    double v69 = a4;
    uint64_t v14 = *(void *)v75;
    double v68 = y;
    double v15 = y + height * 0.2;
    double v16 = height - height * 0.2;
    uint64_t v70 = *(void *)v75;
    do
    {
      v17 = 0;
      v71 = v13;
      do
      {
        if (*(void *)v75 != v14) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v17);
        id v19 = [v18 info];
        id v20 = [v19 storage];
        v21 = [v20 flowName];
        int v22 = [v21 isEqualToString:@"body"];

        if (v22)
        {
          id v23 = [v18 info];
          id v24 = [v18 columns];
          v25 = [v24 firstObject];

          v26 = [v23 storage];
          uint64_t v27 = [v23 range];
          unint64_t v29 = objc_msgSend(v26, "paragraphIndexRangeForCharRange:", v27, v28);
          uint64_t v31 = v30;

          uint64_t v32 = v29 + v31;
          if (v29 < v29 + v31)
          {
            do
            {
              id v33 = [v23 storage];
              uint64_t v34 = [v33 textRangeForParagraphAtIndex:v29];
              uint64_t v36 = v35;

              objc_msgSend(v25, "glyphRectForRange:includingLabel:", v34, v36, 0);
              CGFloat v38 = v37;
              double v40 = v39;
              CGFloat v42 = v41;
              CGFloat v44 = v43;
              v45 = [v18 geometry];
              [v45 frame];
              double v47 = v46;

              unint64_t v48 = v34 - [v23 range];
              if (v48 != 0x7FFFFFFFFFFFFFFFLL)
              {
                while (1)
                {
                  double v49 = [v25 storage];
                  unint64_t v50 = [v49 length];
                  if (v48 >= v50) {
                    break;
                  }
                  int v51 = __66__SXTangierController_scrollPositionForVisibleBounds_canvasWidth___block_invoke(v50, v25, v48);

                  if (!v51) {
                    goto LABEL_13;
                  }
                  ++v48;
                }

LABEL_13:
                v52 = [v25 storage];
                unint64_t v53 = [v52 length];
                if (v48 >= v53)
                {
                }
                else
                {
                  char v54 = __66__SXTangierController_scrollPositionForVisibleBounds_canvasWidth___block_invoke(v53, v25, v48);

                  if ((v54 & 1) == 0)
                  {
                    CGFloat v55 = v40 + v47;
                    objc_msgSend(v18, "pointForCharacterPosition:", objc_msgSend(v23, "range") + v48);
                    double v57 = v56;
                    v81.origin.double x = x;
                    v81.origin.double y = v15;
                    v81.size.double width = rect1;
                    v81.size.double height = v16;
                    v82.origin.double x = v38;
                    v82.origin.double y = v55;
                    v82.size.double width = v42;
                    v82.size.double height = v44;
                    if (CGRectIntersectsRect(v81, v82))
                    {
                      v58 = [SXTextComponentScrollPosition alloc];
                      v59 = [(SXTangierController *)v67 textRenderCollector];
                      v60 = [v59 componentIdentifierForFlowLayout:v18];
                      v61 = [v18 geometry];
                      [v61 frame];
                      double v63 = v62 - v68;
                      v64 = [v18 geometry];
                      [v64 frame];
                      id v13 = [(SXTextComponentScrollPosition *)v58 initWithComponentIdentifier:v60 canvasWidth:v48 relativePageOffset:v69 characterIndex:v63 relativeTextOffset:v57 + v65 - v68];

                      goto LABEL_22;
                    }
                  }
                }
              }
              ++v29;
            }
            while (v29 != v32);
          }

          uint64_t v14 = v70;
          id v13 = v71;
        }
        v17 = (SXTextComponentScrollPosition *)((char *)v17 + 1);
      }
      while (v17 != v13);
      id v13 = (SXTextComponentScrollPosition *)[obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    }
    while (v13);
  }
LABEL_22:

  return v13;
}

uint64_t __66__SXTangierController_scrollPositionForVisibleBounds_canvasWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a2;
  uint64_t v6 = [v4 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v5 storage];

  uint64_t v8 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", a3));
  return v8;
}

- (CGPoint)pointForCharacterAtIndex:(unint64_t)a3 inComponentWithIdentifier:(id)a4
{
  id v5 = [(SXTangierTextRenderCollector *)self->_textRenderCollector flowLayoutForComponentIdentifier:a4];
  uint64_t v6 = [v5 info];
  unint64_t v7 = [v6 range] + a3;

  [v5 pointForCharacterPosition:v7];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)topLevelRepsForInteractiveCanvasController:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock_with_options();
  id v5 = [(SXTangierController *)self presentedTextViews];
  uint64_t v6 = (void *)[v5 copy];

  os_unfair_lock_unlock(p_unfairLock);
  unint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "rep", (void)v17);

        if (v14)
        {
          double v15 = [v13 rep];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)topLevelLayersForInteractiveCanvasController:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock_with_options();
  id v5 = [(SXTangierController *)self presentedTextViews];
  uint64_t v6 = (void *)[v5 copy];

  os_unfair_lock_unlock(p_unfairLock);
  unint64_t v7 = [MEMORY[0x263EFF9C0] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "rep", (void)v19);
        double v15 = [v14 textLayer];

        if (v15)
        {
          double v16 = [v13 rep];
          long long v17 = [v16 textLayer];
          [v7 addObject:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (CGRect)visibleBounds
{
  id v2 = [(SXTangierController *)self icc];
  id v3 = [v2 canvasView];
  id v4 = [v3 enclosingScrollView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)interactiveCanvasController:(id)a3 interactedWithHyperlink:(id)a4 info:(id)a5 range:(_NSRange)a6 touchPoint:(CGPoint)a7 touchAndHold:(BOOL)a8
{
  BOOL v8 = a8;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v40 = a3;
  id v14 = a4;
  id v15 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v14;
    long long v17 = [v15 directLayerHost];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = [(SXTangierController *)self icc];
      long long v19 = [v18 repForInfo:v15];

      objc_msgSend(v19, "glyphRectForRange:includingLabel:", location, length, 0);
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      uint64_t v28 = [v40 canvasView];
      objc_msgSend(v17, "convertRect:toView:", v28, v21, v23, v25, v27);
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;

      double v37 = [(SXTangierController *)self componentActionHandler];
      CGFloat v38 = [v16 action];
      double v39 = [v40 canvasView];
      objc_msgSend(v37, "handleAction:sourceView:sourceRect:invocationType:", v38, v39, v8, v30, v32, v34, v36);
    }
  }
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  id v4 = [(SXTangierController *)self icc];
  double v5 = [v4 selectedText];

  if (v5) {
    [(SXTangierController *)self _fixLayoutOffsets];
  }
  double v6 = [(SXTangierController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    BOOL v8 = [(SXTangierController *)self delegate];
    [v8 tangierControllerDidScroll:self];
  }
  id v9 = [(SXTangierController *)self icc];
  [v9 invalidateVisibleBounds];
}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  [(SXTangierController *)self _fixLayoutOffsets];
  id v4 = [(SXTangierController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SXTangierController *)self delegate];
    [v6 tangierControllerDidStopScrolling:self];
  }
}

- (void)_fixLayoutOffsets
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(SXTangierController *)self icc];
  id v4 = [v3 topLevelRepsForHitTesting];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  int v7 = 0;
  uint64_t v8 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v4);
      }
      v7 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) updateFromVisualPosition];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v6);

  if (v7)
  {
    id v4 = [(SXTangierController *)self icc];
    [v4 invalidateLayers];
LABEL_10:
  }
}

- (void)interactiveCanvasController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y = a5.y;
  double x = a5.x;
  id v13 = a4;
  long long v10 = [(SXTangierController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    long long v12 = [(SXTangierController *)self delegate];
    objc_msgSend(v12, "tangierController:scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, v13, a6, x, y);
  }
}

- (void)interactiveCanvasController:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int v7 = [(SXTangierController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SXTangierController *)self delegate];
    [v9 tangierController:self scrollViewWillBeginDragging:v6];
  }
  [v10 endUISession];
}

- (void)interactiveCanvasController:(id)a3 scrollViewDidEndDragging:(id)a4 willDecelerate:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  int v7 = [(SXTangierController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SXTangierController *)self delegate];
    [v9 tangierController:self scrollViewDidEndDragging:v10 willDecelerate:v5];
  }
  if (!v5) {
    [(SXTangierController *)self _fixLayoutOffsets];
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = -CGRectGetWidth(a4);
  CGFloat v9 = x;
  CGFloat v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;
  return CGRectInset(*(CGRect *)&v9, v8, 0.0);
}

- (void)interactiveCanvasControllerWillStartInteraction:(id)a3
{
  id v4 = [(SXTangierController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SXTangierController *)self delegate];
    [v6 tangierControllerWillStartScrolling:self];
  }
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if (![(SXTangierController *)self performedInitialLayoutAndRender])
  {
    [(SXTangierController *)self _fixLayoutOffsets];
    [(SXTangierController *)self setPerformedInitialLayoutAndRender:1];
  }
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginInteraction:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  if (![(SXTangierController *)self selectionEnabled]) {
    return 0;
  }
  uint64_t v8 = [(SXTangierController *)self componentController];
  CGFloat v9 = objc_msgSend((id)v8, "componentViewForPoint:", x, y);

  CGFloat v10 = [(SXTangierController *)self componentInteractionManager];
  LOBYTE(v8) = objc_msgSend(v10, "hasInteractionForLocation:", x, y);

  BOOL v11 = (v8 & 1) == 0
     && (!v9
      || ![v9 conformsToProtocol:&unk_26D5A14D8]
      || ([v9 userInteractable] & 1) == 0);

  return v11;
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (id)interactiveCanvasController:(id)a3 dragItemForSmartField:(id)a4 interaction:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(SXTangierController *)self dragItemProvider];
  uint64_t v15 = [v14 dragItemForSmartField:v13 interaction:v12 session:v11];

  if (v15) {
    [v10 endUISession];
  }

  return v15;
}

- (id)interactiveCanvasController:(id)a3 infoForModel:(id)a4 withSelection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 conformsToProtocol:&unk_26D5B9A68]) {
    CGFloat v9 = v7;
  }
  else {
    CGFloat v9 = 0;
  }
  id v10 = v9;
  id v11 = v7;
  NSClassFromString(&cfstr_Tswpstorage.isa);
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    NSClassFromString(&cfstr_Tswpselection.isa);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [(SXTangierTextRenderCollector *)self->_textRenderCollector infoForStorage:v11 selection:v12];

      id v10 = (id)v13;
    }
  }
  return v10;
}

- (void)updateInfosWithBlock:(id)a3
{
  id v4 = a3;
  textRenderCollector = self->_textRenderCollector;
  id v6 = [(SXTangierController *)self icc];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SXTangierController_updateInfosWithBlock___block_invoke;
  v8[3] = &unk_264652F90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SXTangierTextRenderCollector *)textRenderCollector buildFlowsAndUpdateInfosWithICC:v6 updateBlock:v8];
}

uint64_t __44__SXTangierController_updateInfosWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 128));
  }
  return result;
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForClippingReps:(CGRect)a4
{
  return CGRectInset(a4, -a4.size.width, -a4.size.height);
}

- (id)visibleBoundsClipViewForInteractiveCanvasController:(id)a3
{
  if ([(SXTangierController *)self disableClippingForTiles])
  {
    id v4 = 0;
  }
  else
  {
    char v5 = [(SXTangierController *)self icc];
    id v6 = [v5 canvasView];
    id v4 = [v6 window];
  }
  return v4;
}

- (void)willTransitionToPresented
{
  [(SXTangierController *)self setEnclosingCanvasScrolling:1];
  [(SXTangierController *)self setDisableClippingForTiles:1];
  id v3 = [(SXTangierController *)self icc];
  [v3 invalidateVisibleBounds];

  id v4 = [(SXTangierController *)self icc];
  char v5 = [v4 layerHost];
  id v6 = [v5 asiOSCVC];

  [v6 cancelDelayedTapAction];
}

- (void)didTransitionToPresented
{
  [(SXTangierController *)self setEnclosingCanvasScrolling:0];
  [(SXTangierController *)self setDisableClippingForTiles:0];
  [(SXTangierController *)self _fixLayoutOffsets];
  id v3 = [(SXTangierController *)self icc];
  [v3 invalidateVisibleBounds];
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  if (protocol_isEqual((Protocol *)a4, (Protocol *)&unk_26D617D70)) {
    id v6 = self->_textRenderCollector;
  }
  else {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds
{
  return 1;
}

- (unint64_t)selectableWordLimit
{
  id v3 = [(SXTangierController *)self config];
  int v4 = [v3 limitTextSelectionEnabled];

  if (!v4) {
    return 0;
  }
  char v5 = [(SXTangierController *)self config];
  unint64_t v6 = (int)[v5 textSelectionLimit];

  return v6;
}

- (NSString)selectedText
{
  id v2 = [(SXTangierController *)self icc];
  id v3 = [v2 selectedText];

  return (NSString *)v3;
}

- (id)layoutDescriptionForComponent:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  textRenderCollector = self->_textRenderCollector;
  double v35 = v4;
  unint64_t v6 = [v4 identifier];
  id v7 = [(SXTangierTextRenderCollector *)textRenderCollector flowLayoutForComponentIdentifier:v6];

  id v8 = [v7 info];
  id v9 = [v8 storage];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  double v34 = v7;
  id obj = [v7 columns];
  uint64_t v39 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v42;
    id v10 = @"bounds";
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v11;
        id v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        uint64_t v13 = [v12 countLines];
        if (v13)
        {
          uint64_t v14 = v13;
          for (uint64_t i = 0; i != v14; ++i)
          {
            [v12 boundsOfLineFragmentAtIndex:i];
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            CGFloat v21 = v20;
            CGFloat v23 = v22;
            NSUInteger v24 = [v12 rangeOfLineFragmentAtIndex:i];
            NSUInteger v26 = v25;
            double v27 = objc_msgSend(v9, "substringWithRange:", v24, v25);
            v47[0] = v10;
            v53.origin.double x = v17;
            v53.origin.double y = v19;
            v53.size.CGFloat width = v21;
            v53.size.CGFloat height = v23;
            NSStringFromCGRect(v53);
            v29 = uint64_t v28 = v10;
            v48[0] = v29;
            v47[1] = @"range";
            v52.NSUInteger location = v24;
            v52.NSUInteger length = v26;
            double v30 = NSStringFromRange(v52);
            v47[2] = @"text";
            v48[1] = v30;
            v48[2] = v27;
            double v31 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
            [v38 addObject:v31];

            id v10 = v28;
          }
        }
        uint64_t v11 = v40 + 1;
      }
      while (v40 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v39);
  }

  v45 = @"lineFragments";
  id v46 = v38;
  double v32 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];

  return v32;
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)self->_documentRoot;
}

- (id)backgroundColorForDragUIPlatter
{
  objc_opt_class();
  id v3 = [(SXTangierController *)self icc];
  id v4 = [v3 editorController];
  char v5 = [v4 textInputEditor];
  unint64_t v6 = TSUDynamicCast();

  id v7 = [v6 selection];
  id v8 = [(SXTangierController *)self textRenderCollector];
  id v9 = [v6 storage];
  id v10 = [v8 infoForStorage:v9 selection:v7];

  unint64_t v11 = [v7 start];
  if (v11 >= [v7 end])
  {
    unint64_t v12 = 0;
    double v13 = 0.0;
  }
  else
  {
    unint64_t v12 = 0;
    double v13 = 0.0;
    do
    {
      uint64_t v14 = [v10 storage];
      uint64_t v15 = [v14 characterStyleAtCharIndex:v11 effectiveRange:0];

      double v16 = [v15 valueForProperty:18];
      CGFloat v17 = v16;
      if (v16)
      {
        [v16 luminance];
        double v13 = v13 + v18;
        ++v12;
      }

      ++v11;
    }
    while (v11 < [v7 end]);
  }
  if (v12 <= 1) {
    unint64_t v19 = 1;
  }
  else {
    unint64_t v19 = v12;
  }
  double v20 = v13 / (double)v19;
  CGFloat v21 = [MEMORY[0x263F1C550] whiteColor];
  if (v20 > 0.5)
  {
    uint64_t v22 = [MEMORY[0x263F1C550] blackColor];

    CGFloat v21 = (void *)v22;
  }

  return v21;
}

- (BOOL)isEnclosingCanvasScrolling
{
  return self->_enclosingCanvasScrolling;
}

- (void)setEnclosingCanvasScrolling:(BOOL)a3
{
  self->_enclosingCanvasScrolling = a3;
}

- (SXTangierControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXTangierControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXTextTangierCanvasViewController)cvc
{
  return self->_cvc;
}

- (SXTextTangierInteractiveCanvasController)icc
{
  return self->_icc;
}

- (BOOL)rebuildFlows
{
  return self->_rebuildFlows;
}

- (void)setRebuildFlows:(BOOL)a3
{
  self->_rebuildFlows = a3;
}

- (unint64_t)initialSubviewCount
{
  return self->_initialSubviewCount;
}

- (void)setInitialSubviewCount:(unint64_t)a3
{
  self->_initialSubviewCount = a3;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void)setViewport:(id)a3
{
}

- (SXScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (SXComponentActionHandler)componentActionHandler
{
  return self->_componentActionHandler;
}

- (SXTangierDragItemProvider)dragItemProvider
{
  return self->_dragItemProvider;
}

- (SXComponentController)componentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentController);
  return (SXComponentController *)WeakRetained;
}

- (SXComponentInteractionManager)componentInteractionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentInteractionManager);
  return (SXComponentInteractionManager *)WeakRetained;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXFeatures)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (SXTangierTextRenderCollector)textRenderCollector
{
  return self->_textRenderCollector;
}

- (SXTangierRepDirectLayerHostProvider)directLayerHostProvider
{
  return self->_directLayerHostProvider;
}

- (UIView)underRepsHost
{
  return self->_underRepsHost;
}

- (UIView)aboveRepsHost
{
  return self->_aboveRepsHost;
}

- (UIView)overlayRepsHost
{
  return self->_overlayRepsHost;
}

- (BOOL)preventScrollViewDidScrollReentrance
{
  return self->_preventScrollViewDidScrollReentrance;
}

- (void)setPreventScrollViewDidScrollReentrance:(BOOL)a3
{
  self->_preventScrollViewDidScrollReentrance = a3;
}

- (BOOL)disableClippingForTiles
{
  return self->_disableClippingForTiles;
}

- (void)setDisableClippingForTiles:(BOOL)a3
{
  self->_disableClippingForTiles = a3;
}

- (TSWPSelection)storedSelection
{
  return self->_storedSelection;
}

- (void)setStoredSelection:(id)a3
{
}

- (BOOL)performedInitialLayoutAndRender
{
  return self->_performedInitialLayoutAndRender;
}

- (void)setPerformedInitialLayoutAndRender:(BOOL)a3
{
  self->_performedInitialLayoutAndRender = a3;
}

- (NSMutableSet)presentedTextViews
{
  return self->_presentedTextViews;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedTextViews, 0);
  objc_storeStrong((id *)&self->_storedSelection, 0);
  objc_storeStrong((id *)&self->_overlayRepsHost, 0);
  objc_storeStrong((id *)&self->_aboveRepsHost, 0);
  objc_storeStrong((id *)&self->_underRepsHost, 0);
  objc_storeStrong((id *)&self->_directLayerHostProvider, 0);
  objc_storeStrong((id *)&self->_textRenderCollector, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_destroyWeak((id *)&self->_componentInteractionManager);
  objc_destroyWeak((id *)&self->_componentController);
  objc_storeStrong((id *)&self->_dragItemProvider, 0);
  objc_storeStrong((id *)&self->_componentActionHandler, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_icc, 0);
  objc_storeStrong((id *)&self->_cvc, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_documentRoot, 0);
}

@end