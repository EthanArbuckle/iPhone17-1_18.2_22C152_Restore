@interface THInteractiveCanvasController
- ($666C738BFF45484503FF79351D233943)wordMetricsAtPoint:(SEL)a3;
- (BOOL)_accessibilityQuickSpeakContentIsSpeakable;
- (BOOL)_accessibilityShouldShowSpeakBubble;
- (BOOL)animatingScroll;
- (BOOL)canAddHighlight;
- (BOOL)canAddNote;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)dynamicallyZooming;
- (BOOL)gestureHitLink:(id)a3;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handleHyperlinksWithTextGRs;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3;
- (BOOL)hasCurrentSelection;
- (BOOL)isCompactHeight;
- (BOOL)isCompactWidth;
- (BOOL)isOverscrolling;
- (BOOL)p_allowPaging;
- (BOOL)p_handleLongPress:(id)a3;
- (BOOL)p_handleSingleTap:(id)a3;
- (BOOL)p_handleTapAtPoint:(CGPoint)a3;
- (BOOL)p_pointIsInLeftMargin:(CGPoint)a3;
- (BOOL)p_pointIsInRightMargin:(CGPoint)a3;
- (BOOL)p_zoomColumnAtPoint:(CGPoint)a3 forceWpRep:(BOOL)a4;
- (BOOL)selectOnLongPress;
- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)spellCheckingSuppressed;
- (BOOL)supportsReadingHighlights;
- (BOOL)supportsWritingHighlights;
- (BOOL)suppressDoubleTapForSelection;
- (BOOL)suppressRevealScrollViewOnLayoutAndRender;
- (BOOL)wantsUpdatedScrollIndicatorInsets;
- (BOOL)zoomColumnAtPoint:(CGPoint)a3;
- (BOOL)zoomToColumnWithFrame:(CGRect)a3;
- (CALayer)maskLayer;
- (CGPoint)maskLayerOrigin;
- (CGRect)visibleUnscaledRectForContent;
- (NSArray)backgroundLayers;
- (NSArray)foregroundLayers;
- (NSObject)iTunesMobileContext;
- (THAnnotationStorageController)bookAnnotationController;
- (THTextInputResponder)th_textInputResponder;
- (double)visibleHeight;
- (id)_accessibilitySpeakSelectionTextInputResponder;
- (id)_axQuickSpeakContent;
- (id)activityItemProviderForCurrentSelection;
- (id)additionalLayersOverRepLayers;
- (id)additionalLayersUnderRepLayers;
- (id)annotationForCurrentSelection;
- (id)annotationForUUID:(id)a3;
- (id)annotationFromCurrentSelection;
- (id)bookNavigator;
- (id)canvasEditor;
- (id)documentNavigator;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 allowsAllReps:(BOOL)a4;
- (id)linkForHyperlinkField:(id)a3;
- (id)menuForHighlightAtLocation:(CGPoint)a3;
- (id)nsAttributedSubstringForStorage:(id)a3 range:(_NSRange)a4 rep:(id)a5 baselineOrigin:(CGPoint *)a6;
- (id)p_gestureHitLink:(id)a3;
- (id)textInputResponder;
- (void)addHighlight:(id)a3;
- (void)addNote:(id)a3;
- (void)beginStaticLayoutAndRender;
- (void)canvasDidLayout:(id)a3;
- (void)changeAnnotationStyle:(id)a3;
- (void)dealloc;
- (void)didBeginFreeTransform;
- (void)didEndFreeTransform;
- (void)didLayoutAndRenderOnThread;
- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5;
- (void)endStaticLayoutAndRender:(BOOL)a3;
- (void)handleHyperlink:(id)a3 hitRep:(id)a4;
- (void)handleHyperlinkGesture:(id)a3;
- (void)handleHyperlinkWithURL:(id)a3;
- (void)i_handleGlossaryHyperlink:(id)a3 rep:(id)a4 anchor:(id)a5;
- (void)makeRepsRecursivelyPerformSelectorIfImplemented:(SEL)a3;
- (void)navigateToNextChapter;
- (void)navigateToNextPage;
- (void)navigateToPreviousChapter;
- (void)navigateToPreviousPage;
- (void)p_adjustMaskLayerOnScrollView:(id)a3;
- (void)p_editorControllerDidChangeTextInputEditor:(id)a3;
- (void)p_handleOverscroll:(id)a3 state:(int)a4;
- (void)p_hoistMaskLayer;
- (void)p_moveMaskFromLayer:(id)a3 toLayer:(id)a4;
- (void)p_releaseOutlets;
- (void)p_trackProgressForRep:(id)a3;
- (void)p_unhoistMaskLayer;
- (void)p_updateMaskLayer;
- (void)pageLeft;
- (void)pageRight;
- (void)presentMenuAtCanvasPoint:(CGPoint)a3 forAnnotationUUID:(id)a4;
- (void)pressableRepWasPressed:(id)a3 atPoint:(CGPoint)a4;
- (void)progressDidChangeForRep:(id)a3 percent:(id)a4;
- (void)removeNote:(id)a3;
- (void)removeNoteAndHighlight:(id)a3;
- (void)resetAttemptForRep:(id)a3;
- (void)scoreDidChangeForRep:(id)a3 score:(id)a4 total:(id)a5;
- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidLayoutSubviews:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchSelection:(id)a3;
- (void)setBackgroundLayers:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setForegroundLayers:(id)a3;
- (void)setITunesMobileContext:(id)a3;
- (void)setIsOverscrolling:(BOOL)a3;
- (void)setMaskLayer:(id)a3;
- (void)setMaskLayerOrigin:(CGPoint)a3;
- (void)setSelectOnLongPress:(BOOL)a3;
- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5;
- (void)setSuppressRevealScrollViewOnLayoutAndRender:(BOOL)a3;
- (void)showDictionary:(id)a3;
- (void)showHyperlinkInfoForField:(id)a3 inRep:(id)a4 openInEditMode:(BOOL)a5;
- (void)updateBookmarkStatusAnimated:(BOOL)a3;
- (void)updateBookmarkVisibleState;
- (void)willBeginHandlingGesture:(id)a3;
- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5;
@end

@implementation THInteractiveCanvasController

- (void)dealloc
{
  [(THInteractiveCanvasController *)self p_releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)THInteractiveCanvasController;
  [(THInteractiveCanvasController *)&v3 dealloc];
}

- (void)p_releaseOutlets
{
  [(THInteractiveCanvasController *)self setITunesMobileContext:0];

  [(THInteractiveCanvasController *)self setMaskLayer:0];
}

- (THTextInputResponder)th_textInputResponder
{
  objc_opt_class();
  objc_super v3 = [(THInteractiveCanvasController *)self textInputResponder];
  v4 = TSUDynamicCast();

  return (THTextInputResponder *)v4;
}

- (id)textInputResponder
{
  uint64_t v3 = OBJC_IVAR___TSDInteractiveCanvasController_mTextInputResponder;
  if (!*(void *)&self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mTextInputResponder])
  {
    v4 = [(THInteractiveCanvasController *)self layerHost];
    v5 = [v4 canvasView];

    if (v5)
    {
      v6 = [THTextInputResponder alloc];
      v7 = [(THInteractiveCanvasController *)self layerHost];
      v8 = [v7 canvasView];
      v9 = [(THTextInputResponder *)v6 initWithNextResponder:v8];
      v10 = *(void **)&self->TSAInteractiveCanvasController_opaque[v3];
      *(void *)&self->TSAInteractiveCanvasController_opaque[v3] = v9;
    }
  }
  v11 = *(void **)&self->TSAInteractiveCanvasController_opaque[v3];

  return v11;
}

- (id)hitRep:(CGPoint)a3 allowsAllReps:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)THInteractiveCanvasController;
  v6 = -[THInteractiveCanvasController hitRep:](&v10, "hitRep:", a3.x, a3.y);
  [(THInteractiveCanvasController *)self p_trackProgressForRep:v6];
  if (a4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)hitRep:(CGPoint)a3
{
  return -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 0, a3.x, a3.y);
}

- (BOOL)supportsReadingHighlights
{
  v2 = [(THInteractiveCanvasController *)self bookAnnotationController];
  unsigned __int8 v3 = [v2 canReadAnnotations];

  return v3;
}

- (BOOL)supportsWritingHighlights
{
  v2 = [(THInteractiveCanvasController *)self bookAnnotationController];
  unsigned __int8 v3 = [v2 canModifyAnnotations];

  return v3;
}

- (id)additionalLayersUnderRepLayers
{
  return [(THInteractiveCanvasController *)self backgroundLayers];
}

- (id)additionalLayersOverRepLayers
{
  return [(THInteractiveCanvasController *)self foregroundLayers];
}

- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes
{
  return 0;
}

- (BOOL)isCompactHeight
{
  objc_opt_class();
  unsigned __int8 v3 = [(THInteractiveCanvasController *)self layerHost];
  v4 = [v3 asiOSCVC];
  v5 = TSUDynamicCast();

  v6 = [v5 traitsCache];
  LOBYTE(v4) = [v6 isCompactHeight];

  return (char)v4;
}

- (BOOL)isCompactWidth
{
  objc_opt_class();
  unsigned __int8 v3 = [(THInteractiveCanvasController *)self layerHost];
  v4 = [v3 asiOSCVC];
  v5 = TSUDynamicCast();

  v6 = [v5 traitsCache];
  LOBYTE(v4) = [v6 isCompactWidth];

  return (char)v4;
}

- (void)p_adjustMaskLayerOnScrollView:(id)a3
{
  if (!self->mHoistedMaskLayer)
  {
    v4 = [(THInteractiveCanvasController *)self layerHost];
    v5 = [v4 canvasLayer];
    v6 = [v5 mask];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;

    v11 = [(THInteractiveCanvasController *)self layerHost];
    v12 = [v11 canvasLayer];
    v13 = [(THInteractiveCanvasController *)self layerHost];
    v14 = [v13 clippingLayer];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    v19 = [(THInteractiveCanvasController *)self layerHost];
    v20 = [v19 clippingLayer];
    [v12 convertPoint:v20 toLayer:v16];

    [(THInteractiveCanvasController *)self maskLayerOrigin];
    TSDAddPoints();
    double v22 = v21;
    double v24 = v23;
    v25 = [(THInteractiveCanvasController *)self layerHost];
    v26 = [v25 canvasLayer];
    v27 = [(THInteractiveCanvasController *)self layerHost];
    v28 = [v27 clippingLayer];
    [v26 convertRect:v28 fromLayer:v22 toLayer:v24];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    id v39 = [(THInteractiveCanvasController *)self layerHost];
    v37 = [v39 canvasLayer];
    v38 = [v37 mask];
    [v38 setFrame:v30, v32, v34, v36];
  }
}

- (void)p_updateMaskLayer
{
  if (!self->mHoistedMaskLayer)
  {
    unsigned __int8 v3 = [(THInteractiveCanvasController *)self delegate];
    TSUProtocolCast();
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_opt_respondsToSelector())
    {
      v4 = [(THInteractiveCanvasController *)self layerHost];
      v5 = [v4 clippingLayer];
      [v5 bounds];
      TSDRectWithSize();
      v6 = [v13 interactiveCanvasController:self maskLayerForBounds:];

      double v7 = +[THNoAnimationLayerDelegate sharedInstance];
      [v6 setDelegate:v7];
    }
    else
    {
      v6 = 0;
    }
    double v8 = [(THInteractiveCanvasController *)self maskLayer];

    if (v6 != v8)
    {
      [(THInteractiveCanvasController *)self setMaskLayer:v6];
      if (v6)
      {
        [v6 frame];
        -[THInteractiveCanvasController setMaskLayerOrigin:](self, "setMaskLayerOrigin:");
        double v9 = [(THInteractiveCanvasController *)self layerHost];
        double v10 = [v9 canvasLayer];
        [v10 setMask:v6];

        v11 = [(THInteractiveCanvasController *)self canvasView];
        v12 = [v11 enclosingScrollView];
        [(THInteractiveCanvasController *)self p_adjustMaskLayerOnScrollView:v12];
      }
      else
      {
        -[THInteractiveCanvasController setMaskLayerOrigin:](self, "setMaskLayerOrigin:", CGPointZero.x, CGPointZero.y);
        v11 = [(THInteractiveCanvasController *)self layerHost];
        v12 = [v11 canvasLayer];
        [v12 setMask:0];
      }
    }
  }
}

- (void)p_hoistMaskLayer
{
  if (!self->mHoistedMaskLayer) {
    goto LABEL_3;
  }
  unsigned __int8 v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_hoistMaskLayer]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:291 description:@"mask layer has already been hoisted"];

  if (!self->mHoistedMaskLayer)
  {
LABEL_3:
    self->mHoistedMaskLayer = 1;
    id v10 = [(THInteractiveCanvasController *)self layerHost];
    v6 = [v10 canvasLayer];
    double v7 = [(THInteractiveCanvasController *)self layerHost];
    double v8 = [v7 clippingLayer];
    double v9 = [v8 superlayer];
    [(THInteractiveCanvasController *)self p_moveMaskFromLayer:v6 toLayer:v9];
  }
}

- (void)p_unhoistMaskLayer
{
  if (self->mHoistedMaskLayer) {
    goto LABEL_3;
  }
  unsigned __int8 v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_unhoistMaskLayer]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:303 description:@"mask layer hasn't been hoisted"];

  if (self->mHoistedMaskLayer)
  {
LABEL_3:
    v6 = [(THInteractiveCanvasController *)self layerHost];
    double v7 = [v6 clippingLayer];
    double v8 = [v7 superlayer];
    double v9 = [(THInteractiveCanvasController *)self layerHost];
    id v10 = [v9 canvasLayer];
    [(THInteractiveCanvasController *)self p_moveMaskFromLayer:v8 toLayer:v10];

    self->mHoistedMaskLayer = 0;
  }
}

- (void)p_moveMaskFromLayer:(id)a3 toLayer:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  if (v17 && v5)
  {
    v6 = [v17 mask];

    if (!v6)
    {
      double v7 = +[TSUAssertionHandler currentHandler];
      double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
      [v7 handleFailureInFunction:v8 file:v9 lineNumber:316 description:@"source layer should have a mask"];
    }
    id v10 = [v5 mask];

    if (v10)
    {
      v11 = +[TSUAssertionHandler currentHandler];
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:]");
      id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
      [v11 handleFailureInFunction:v12 file:v13 lineNumber:317 description:@"destination layer should not have a mask"];
    }
    v14 = [v17 mask];
    [v14 frame];
    [v5 convertRect:v17 fromLayer:];
    [v14 setFrame:];
    [v5 setMask:v14];
    [v17 setMask:0];
  }
  else
  {
    v14 = +[TSUAssertionHandler currentHandler];
    double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
    [v14 handleFailureInFunction:v15 file:v16 lineNumber:313 description:@"Invalid parameter not satisfying: %s", "sourceLayer != nil && destinationLayer != nil"];
  }
}

- (void)canvasDidLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THInteractiveCanvasController;
  [(THInteractiveCanvasController *)&v4 canvasDidLayout:a3];
  [(THInteractiveCanvasController *)self p_updateMaskLayer];
}

- (BOOL)suppressDoubleTapForSelection
{
  if ([(THInteractiveCanvasController *)self isCompactWidth]) {
    return 1;
  }

  return [(THInteractiveCanvasController *)self isCompactHeight];
}

- (BOOL)zoomColumnAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(THInteractiveCanvasController *)self delegate];
  double v7 = TSUProtocolCast();

  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v7 interactiveCanvasControllerShouldAllowZoomToColumn:self])
  {
    BOOL v8 = -[THInteractiveCanvasController p_zoomColumnAtPoint:forceWpRep:](self, "p_zoomColumnAtPoint:forceWpRep:", 0, x, y);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)zoomToColumnWithFrame:(CGRect)a3
{
  TSDCenterOfRect();

  return -[THInteractiveCanvasController p_zoomColumnAtPoint:forceWpRep:](self, "p_zoomColumnAtPoint:forceWpRep:", 1);
}

- (BOOL)dynamicallyZooming
{
  return self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mDynamicallyZooming];
}

- (BOOL)handleHyperlinksWithTextGRs
{
  return 1;
}

- (id)linkForHyperlinkField:(id)a3
{
  objc_super v4 = [a3 url];
  id v5 = [(THInteractiveCanvasController *)self documentRoot];
  v6 = [v4 scheme];

  if (v6)
  {
    double v7 = [THModelLink alloc];
    BOOL v8 = [v4 absoluteString];
    double v9 = [v5 context];
    id v10 = [(THModelLink *)v7 initWithTarget:v8 context:v9];
  }
  else
  {
    BOOL v8 = [v4 absoluteString];
    if ([v8 hasPrefix:@"OPS/"])
    {
      uint64_t v11 = [v8 substringFromIndex:4];

      BOOL v8 = (void *)v11;
    }
    double v9 = [@"/OPS/" stringByAppendingString:v8];
    v12 = +[NSString stringWithFormat:@"apub:///0/0/0%@", v9];
    id v13 = [THModelLink alloc];
    v14 = [v5 context];
    id v10 = [(THModelLink *)v13 initWithTarget:v12 context:v14];
  }

  return v10;
}

- (void)handleHyperlinkGesture:(id)a3
{
  id v7 = a3;
  if ([v7 state] == (char *)&dword_0 + 3)
  {
    if ([v7 wasTapHold]) {
      +[TSWPEditMenuController hideEditMenu];
    }
    objc_opt_class();
    objc_super v4 = [v7 hitRep];
    id v5 = TSUDynamicCast();

    v6 = [v7 hitField];
    [(THInteractiveCanvasController *)self handleHyperlink:v6 hitRep:v5];
  }
}

- (id)bookNavigator
{
  unsigned __int8 v3 = [(THInteractiveCanvasController *)self delegate];
  objc_super v4 = TSUProtocolCast();

  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 bookNavigatorForInteractiveCanvasController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)documentNavigator
{
  unsigned __int8 v3 = [(THInteractiveCanvasController *)self delegate];
  objc_super v4 = TSUProtocolCast();

  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 documentNavigatorForInteractiveCanvasController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)handleHyperlink:(id)a3 hitRep:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [v17 url];
  if (objc_msgSend(v7, "th_shouldSharedAppDelegateHandleURL"))
  {
    BOOL v8 = +[TSKApplicationDelegate sharedDelegate];
    double v9 = [(THInteractiveCanvasController *)self documentRoot];
    [v8 openURL:v7 sourceDocumentRoot:v9];
  }
  else
  {
    BOOL v8 = [(THInteractiveCanvasController *)self bookNavigator];
    uint64_t v10 = [(THInteractiveCanvasController *)self documentNavigator];
    double v9 = (void *)v10;
    if (v8 && v10)
    {
      uint64_t v11 = [v17 parentStorage];
      v12 = [v9 linkForURL:v7 inStorage:v11];

      id v13 = [v8 anchorFromLink:v12];
      objc_opt_class();
      v14 = TSUDynamicCast();
      double v15 = [v14 glossaryEntry];

      if (v15)
      {
        [(THInteractiveCanvasController *)self i_handleGlossaryHyperlink:v17 rep:v6 anchor:v14];
      }
      else
      {
        double v16 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];
        [v16 endUISession];

        [v8 recordOutgoingMajorNavigationJump];
        [v8 followLink:v12];
      }
    }
  }
}

- (void)handleHyperlinkWithURL:(id)a3
{
  id v11 = a3;
  if (objc_msgSend(v11, "th_shouldSharedAppDelegateHandleURL"))
  {
    objc_super v4 = +[TSKApplicationDelegate sharedDelegate];
    [v4 openURL:v11];
  }
  else
  {
    objc_super v4 = [(THInteractiveCanvasController *)self bookNavigator];
    uint64_t v5 = [(THInteractiveCanvasController *)self documentNavigator];
    id v6 = (void *)v5;
    if (v4 && v5)
    {
      id v7 = [(THInteractiveCanvasController *)self documentNavigator];
      BOOL v8 = [v7 currentContentNode];

      double v9 = [v6 linkForURL:v11 inContentNode:v8];
      uint64_t v10 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];
      [v10 endUISession];

      [v4 recordOutgoingMajorNavigationJump];
      [v4 followLink:v9];
    }
  }
}

- (BOOL)gestureHitLink:(id)a3
{
  unsigned __int8 v3 = [(THInteractiveCanvasController *)self p_gestureHitLink:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:kTHShowTextOverflowIndicator[0]];

  return v3;
}

- (THAnnotationStorageController)bookAnnotationController
{
  v2 = [(THInteractiveCanvasController *)self documentRoot];
  unsigned __int8 v3 = [v2 annotationController];

  return (THAnnotationStorageController *)v3;
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  [(THInteractiveCanvasController *)&v5 setSelection:a3 onModel:a4 withFlags:a5 & 0xFFFFFFFFFFFFFFAFLL];
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)updateBookmarkVisibleState
{
}

- (void)updateBookmarkStatusAnimated:(BOOL)a3
{
  unsigned __int8 v3 = &selRef_updateBookmarkStatusAnimated;
  if (!a3) {
    unsigned __int8 v3 = &selRef_updateBookmarkStatus;
  }
  [(THInteractiveCanvasController *)self makeRepsRecursivelyPerformSelectorIfImplemented:*v3];
}

- (void)makeRepsRecursivelyPerformSelectorIfImplemented:(SEL)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = [(THInteractiveCanvasController *)self canvas];
  objc_super v5 = [v4 topLevelReps];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) recursivelyPerformSelectorIfImplemented:a3];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (CGRect)visibleUnscaledRectForContent
{
  [(THInteractiveCanvasController *)self visibleBoundsRect];
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    CGRect v27 = CGRectInset(v26, -width, -height);
    CGFloat v7 = v27.origin.x;
    CGFloat v8 = v27.origin.y;
    CGFloat v9 = v27.size.width;
    CGFloat v10 = v27.size.height;
    long long v11 = [(THInteractiveCanvasController *)self layerHost];
    long long v12 = [v11 canvasLayer];
    [v12 bounds];
    v32.origin.double x = v13;
    v32.origin.double y = v14;
    v32.size.double width = v15;
    v32.size.double height = v16;
    v28.origin.double x = v7;
    v28.origin.double y = v8;
    v28.size.double width = v9;
    v28.size.double height = v10;
    CGRect v29 = CGRectIntersection(v28, v32);
    double x = v29.origin.x;
    double y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;

    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    if (CGRectIsEmpty(v30))
    {
      id v17 = +[TSUAssertionHandler currentHandler];
      double v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController visibleUnscaledRectForContent]");
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
      [v17 handleFailureInFunction:v18 file:v19 lineNumber:583 description:@"shouldn't result in an empty rect"];
    }
  }

  -[THInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", x, y, width, height);
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (double)visibleHeight
{
  v2 = [(THInteractiveCanvasController *)self canvasView];
  unsigned __int8 v3 = [v2 enclosingScrollView];
  BOOL v4 = [v3 layer];
  [v4 bounds];
  double Height = CGRectGetHeight(v7);

  return Height;
}

- (void)beginStaticLayoutAndRender
{
  self->mWasThreadedLayoutAndRenderEnabled = [(THInteractiveCanvasController *)self allowLayoutAndRenderOnThread];
  [(THInteractiveCanvasController *)self setAllowLayoutAndRenderOnThread:1];
  [(THInteractiveCanvasController *)self setStaticLayoutAndRenderOnThread:1];
  id v5 = [(THInteractiveCanvasController *)self canvasView];
  unsigned __int8 v3 = [v5 enclosingScrollView];
  BOOL v4 = [v3 layer];
  [v4 setOpacity:0.0];
}

- (void)endStaticLayoutAndRender:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(THInteractiveCanvasController *)self staticLayoutAndRenderOnThread] & 1) == 0)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController endStaticLayoutAndRender:]");
    CGRect v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:611 description:@"didn't begin static layout and render"];
  }
  if ([(THInteractiveCanvasController *)self staticLayoutAndRenderOnThread])
  {
    [(THInteractiveCanvasController *)self setAllowLayoutAndRenderOnThread:self->mWasThreadedLayoutAndRenderEnabled];
    [(THInteractiveCanvasController *)self setStaticLayoutAndRenderOnThread:0];
    [(THInteractiveCanvasController *)self layoutIfNeeded];
    if (v3) {
      +[CATransaction flush];
    }
    id v11 = [(THInteractiveCanvasController *)self canvasView];
    CGFloat v8 = [v11 enclosingScrollView];
    CGFloat v9 = [v8 layer];
    LODWORD(v10) = 1.0;
    [v9 setOpacity:v10];
  }
}

- (void)didBeginFreeTransform
{
  [(THInteractiveCanvasController *)self endEditing];
  BOOL v3 = [(THInteractiveCanvasController *)self canvas];
  BOOL v4 = [v3 topLevelReps];
  id v5 = [v4 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:@"canvasDidBeginFreeTransform" withObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = [(THInteractiveCanvasController *)self delegate];
  long long v12 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    [v12 interactiveCanvasControllerFreeTransformWillBegin:self];
  }
}

- (void)didEndFreeTransform
{
  BOOL v3 = [(THInteractiveCanvasController *)self canvas];
  BOOL v4 = [v3 topLevelReps];
  id v5 = [v4 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:@"canvasDidEndFreeTransform" withObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = [(THInteractiveCanvasController *)self delegate];
  long long v12 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    [v12 interactiveCanvasControllerFreeTransformDidEnd:self];
  }
}

- (void)didLayoutAndRenderOnThread
{
  if ([(THInteractiveCanvasController *)self staticLayoutAndRenderOnThread]&& ![(THInteractiveCanvasController *)self suppressRevealScrollViewOnLayoutAndRender])
  {
    BOOL v3 = [(THInteractiveCanvasController *)self canvasView];
    BOOL v4 = [v3 enclosingScrollView];
    id v5 = [v4 layer];
    LODWORD(v6) = 1.0;
    [v5 setOpacity:v6];

    +[CATransaction flush];
  }
}

- (id)canvasEditor
{
  uint64_t v3 = OBJC_IVAR___TSDInteractiveCanvasController_mCanvasEditor;
  if (!*(void *)&self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mCanvasEditor])
  {
    double v6 = [(THInteractiveCanvasController *)self documentRoot];
    if (v6)
    {
      int v7 = self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mHasBeenTornDown];

      if (!v7)
      {
        id v8 = [[THCanvasEditor alloc] initWithInteractiveCanvasController:self];
        uint64_t v9 = *(void **)&self->TSAInteractiveCanvasController_opaque[v3];
        *(void *)&self->TSAInteractiveCanvasController_opaque[v3] = v8;
      }
    }
  }
  BOOL v4 = *(void **)&self->TSAInteractiveCanvasController_opaque[v3];

  return v4;
}

- (void)setITunesMobileContext:(id)a3
{
  BOOL v4 = a3;
  if (v4 && self->miTunesMobileContext)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController setITunesMobileContext:]");
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:677 description:@"context does not support simultaneous uses"];
  }
  miTunesMobileContext = self->miTunesMobileContext;
  self->miTunesMobileContext = v4;
}

- ($666C738BFF45484503FF79351D233943)wordMetricsAtPoint:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  long long v8 = *((_OWORD *)&TSWPEmptyWordMetrics + 3);
  *(_OWORD *)&retstr->var1 = *((_OWORD *)&TSWPEmptyWordMetrics + 2);
  *(_OWORD *)&retstr->var3 = v8;
  *(void *)&retstr->var5 = *((void *)&TSWPEmptyWordMetrics + 8);
  CGSize v9 = (CGSize)*((_OWORD *)&TSWPEmptyWordMetrics + 1);
  retstr->var0.origin = *(CGPoint *)&TSWPEmptyWordMetrics;
  retstr->var0.size = v9;
  objc_opt_class();
  double v10 = -[THInteractiveCanvasController hitRep:](self, "hitRep:", x, y);
  id v11 = TSUDynamicCast();

  if (v11)
  {
    [v11 convertNaturalPointFromUnscaledCanvas:x, y];
    id v12 = [v11 charIndexFromPoint:0 allowPastBreak:1 allowNotFound:0 pastCenterGoesToNextChar:0 isAtEndOfLine:0 leadingEdge:0];
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v11 wordMetricsAtCharIndex:v12];
      *(_OWORD *)&retstr->var1 = v21;
      *(_OWORD *)&retstr->var3 = v22;
      *(void *)&retstr->var5 = v23;
      retstr->var0.origin = v19;
      retstr->var0.size = v20;
      [v11 convertNaturalRectToUnscaledCanvas:retstr->var0.origin.x, retstr->var0.origin.y, retstr->var0.size.width, retstr->var0.size.height];
      retstr->var0.origin.double x = v13;
      retstr->var0.origin.double y = v14;
      retstr->var0.size.double width = v15;
      retstr->var0.size.double height = v16;
      [v11 convertNaturalPointToUnscaledCanvas:0.0 retstr->var1];
      retstr->var1 = v17;
    }
  }

  return result;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  double v6 = -[THInteractiveCanvasController hitRep:](self, "hitRep:", x, y);
  int v7 = TSUDynamicCast();

  long long v8 = [v7 highlightController];
  unsigned int v9 = [v8 isCanvasPointOnHighlight:x, y];

  if (v9)
  {
    double v10 = [v7 highlightController];
    [v10 showHighlightEditorForHighlightAtPoint:x, y];
  }
  else
  {
    id v11 = [(THInteractiveCanvasController *)self delegate];
    double v10 = TSUProtocolCast();

    if (objc_opt_respondsToSelector()) {
      [v10 interactiveCanvasControllerWasTapped:self];
    }
  }

  [(THInteractiveCanvasController *)self endEditing];
  return 1;
}

- (id)nsAttributedSubstringForStorage:(id)a3 range:(_NSRange)a4 rep:(id)a5 baselineOrigin:(CGPoint *)a6
{
  return 0;
}

- (void)i_handleGlossaryHyperlink:(id)a3 rep:(id)a4 anchor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(THInteractiveCanvasController *)self layerHost];
  TSUProtocolCast();
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v12 = [v8 glossaryEntry];

  CGFloat v13 = [v12 term];
  id v14 = [v10 range];
  uint64_t v16 = v15;

  [v17 presentGlossaryPopoverOfType:0 withTerm:v13 rangeInRep:v14 rep:v16];
  [(THInteractiveCanvasController *)self endEditing];
}

- (BOOL)p_handleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  double v6 = -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y);
  int v7 = TSUDynamicCast();

  id v8 = [v7 highlightController];
  unsigned int v9 = [v8 isCanvasPointOnHighlight:x y:y];
  if (v9)
  {
    unsigned int v10 = [(THInteractiveCanvasController *)self supportsWritingHighlights];

    if (!v10)
    {
      LOBYTE(v9) = 0;
      goto LABEL_6;
    }
    id v8 = [v7 highlightController];
    [v8 showHighlightMenuForHighlightAtPoint:x, y];
  }

LABEL_6:
  return v9;
}

- (id)menuForHighlightAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  double v6 = -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y);
  int v7 = TSUDynamicCast();

  id v8 = [v7 highlightController];
  if (!objc_msgSend(v8, "isCanvasPointOnHighlight:", x, y))
  {
    unsigned int v10 = 0;
    goto LABEL_5;
  }
  unsigned int v9 = [(THInteractiveCanvasController *)self supportsWritingHighlights];

  if (v9)
  {
    id v8 = [v7 highlightController];
    unsigned int v10 = [v8 editMenuForHighlightAtPoint:x, y];
LABEL_5:

    goto LABEL_7;
  }
  unsigned int v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)p_handleLongPress:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 gestureState];
  switch(v5)
  {
    case 3u:
      if (![(THInteractiveCanvasController *)self selectOnLongPress]) {
        break;
      }
      [v4 unscaledLocationForICC:self];
      double v7 = v6;
      double v9 = v8;
      objc_opt_class();
      unsigned int v10 = -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, v7, v9);
      id v11 = TSUDynamicCast();

      if ([v11 shouldBeginEditingWithGesture:v4])
      {
        id v12 = [v11 highlightController];
        unsigned __int8 v13 = [v12 isCanvasPointOnHighlight:v7, v9];

        if ((v13 & 1) == 0)
        {
          objc_opt_class();
          id v14 = [(THInteractiveCanvasController *)self beginEditingRep:v11];
          uint64_t v15 = TSUDynamicCast();

          if (v15)
          {
            [v11 convertNaturalPointFromUnscaledCanvas:v7, v9];
            [v15 tappedInRep:v11 point:1 tapCount:1 isTapHold:0 precise:0];
          }
        }
      }
LABEL_12:

      break;
    case 2u:
      [v4 unscaledLocationForICC:self];
      double v17 = v16;
      double v19 = v18;
      objc_opt_class();
      CGSize v20 = -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, v17, v19);
      id v11 = TSUDynamicCast();

      long long v21 = [v11 highlightController];
      long long v22 = [v21 currentDragAnnotation];
      [(THInteractiveCanvasController *)self setSelectOnLongPress:v22 == 0];

      goto LABEL_12;
    case 1u:
      [(THInteractiveCanvasController *)self setSelectOnLongPress:1];
      break;
  }

  return 1;
}

- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  objc_opt_class();
  double v9 = [(THInteractiveCanvasController *)self layerHost];
  unsigned int v10 = [v9 asiOSCVC];
  id v11 = TSUDynamicCast();

  id v12 = [v11 hyperlinkGestureRecognizer];
  id v13 = [v12 isEnabled];

  v15.receiver = self;
  v15.super_class = (Class)THInteractiveCanvasController;
  [(THInteractiveCanvasController *)&v15 willSetDocumentToMode:a3 fromMode:a4 animated:v5];
  id v14 = [v11 hyperlinkGestureRecognizer];
  [v14 setEnabled:v13];
}

- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)THInteractiveCanvasController;
  [(THInteractiveCanvasController *)&v6 didSetDocumentToMode:a3 fromMode:a4 animated:a5];
  [(THInteractiveCanvasController *)self disableNormalGestures];
}

- (void)navigateToPreviousChapter
{
  id v2 = [(THInteractiveCanvasController *)self documentNavigator];
  [v2 navigateByBookDirection:2 bookGranularity:3];
}

- (void)navigateToNextChapter
{
  id v2 = [(THInteractiveCanvasController *)self documentNavigator];
  [v2 navigateByBookDirection:1 bookGranularity:3];
}

- (void)navigateToPreviousPage
{
  id v2 = [(THInteractiveCanvasController *)self documentNavigator];
  [v2 navigateByBookDirection:2 bookGranularity:1];
}

- (void)navigateToNextPage
{
  id v2 = [(THInteractiveCanvasController *)self documentNavigator];
  [v2 navigateByBookDirection:1 bookGranularity:1];
}

- (void)showDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(THInteractiveCanvasController *)self editorController];
  objc_super v6 = [v5 textInputEditor];
  TSUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 showDictionary:v4];
}

- (void)searchSelection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(THInteractiveCanvasController *)self editorController];
  objc_super v6 = [v5 textInputEditor];
  TSUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 searchSelection:v4];
}

- (BOOL)canAddNote
{
  return [(THInteractiveCanvasController *)self hasCurrentSelection];
}

- (void)addNote:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(THInteractiveCanvasController *)self editorController];
  objc_super v6 = [v5 textInputEditor];
  TSUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 addNote:v4];
}

- (BOOL)canAddHighlight
{
  return [(THInteractiveCanvasController *)self hasCurrentSelection];
}

- (void)addHighlight:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(THInteractiveCanvasController *)self editorController];
  objc_super v6 = [v5 textInputEditor];
  TSUDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [(THInteractiveCanvasController *)self bookAnnotationController];
  [v8 addHighlightWithStyle:[v7 currentAnnotationStyle] forSender:v4];
}

- (void)removeNote:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(THInteractiveCanvasController *)self editorController];
  objc_super v6 = [v5 textInputEditor];
  TSUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 removeNote:v4];
}

- (void)removeNoteAndHighlight:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(THInteractiveCanvasController *)self editorController];
  objc_super v6 = [v5 textInputEditor];
  TSUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 removeNoteAndHighlight:v4];
}

- (void)changeAnnotationStyle:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  id v4 = [(THInteractiveCanvasController *)self editorController];
  BOOL v5 = [v4 textInputEditor];
  objc_super v6 = TSUDynamicCast();

  objc_opt_class();
  id v7 = TSUDynamicCast();
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unsigned int v10 = [v7 propertyList];
    id v11 = [v10 objectForKeyedSubscript:@"style"];

    if (v11)
    {
      unint64_t v12 = (unint64_t)[v11 integerValue] - 1;
      if (v12 > 5) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = dword_343FC0[v12];
      }
      [v6 addHighlightWithStyle:v13 forSender:v14];
      [v6 setSelection:0];
    }
  }
}

- (void)presentMenuAtCanvasPoint:(CGPoint)a3 forAnnotationUUID:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v7 = [(THInteractiveCanvasController *)self delegate];
  id v8 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    [v8 interactiveCanvasController:self wantsToPresentContextMenuAtCanvasPoint:v9 forAnnotationUUID:x, y];
  }
}

- (BOOL)hasCurrentSelection
{
  objc_opt_class();
  uint64_t v3 = [(THInteractiveCanvasController *)self editorController];
  id v4 = [v3 textInputEditor];
  BOOL v5 = TSUDynamicCast();

  if (v5)
  {
    objc_super v6 = [v5 stringFromSelection];
    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)annotationForUUID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(THInteractiveCanvasController *)self editorController];
  objc_super v6 = [v5 textInputEditor];
  BOOL v7 = TSUDynamicCast();

  if (v7)
  {
    id v8 = [v7 annotationForUUID:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)annotationForCurrentSelection
{
  objc_opt_class();
  uint64_t v3 = [(THInteractiveCanvasController *)self editorController];
  id v4 = [v3 textInputEditor];
  BOOL v5 = TSUDynamicCast();

  if (v5)
  {
    objc_super v6 = [v5 annotationForCurrentSelection];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)annotationFromCurrentSelection
{
  objc_opt_class();
  uint64_t v3 = [(THInteractiveCanvasController *)self editorController];
  id v4 = [v3 textInputEditor];
  BOOL v5 = TSUDynamicCast();

  if (v5)
  {
    objc_super v6 = [v5 annotationFromCurrentSelection];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)activityItemProviderForCurrentSelection
{
  objc_opt_class();
  uint64_t v3 = [(THInteractiveCanvasController *)self editorController];
  id v4 = [v3 textInputEditor];
  BOOL v5 = TSUDynamicCast();

  if (v5)
  {
    objc_super v6 = [v5 activityItemProviderForCurrentSelection];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)p_gestureHitLink:(id)a3
{
  [a3 unscaledLocationForICC:self];
  double v5 = v4;
  double v7 = v6;
  id v8 = -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1);
  objc_opt_class();
  id v9 = TSUDynamicCast();
  [v9 convertNaturalPointFromUnscaledCanvas:v5, v7];
  double v11 = v10;
  double v13 = v12;
  objc_opt_class();
  id v14 = [v9 smartFieldAtPoint:v11, v13];
  objc_super v15 = TSUDynamicCast();

  return v15;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = [(THInteractiveCanvasController *)self editorController];
  double v6 = [v5 textInputEditor];
  double v7 = TSUDynamicCast();

  id v8 = [v4 gestureKind];
  if (v8 == (void *)TSWPImmediateSingleTap)
  {
    double v10 = [(THInteractiveCanvasController *)self p_gestureHitLink:v4];
    if (v10)
    {
      v44.receiver = self;
      v44.super_class = (Class)THInteractiveCanvasController;
      unsigned int v9 = [(THInteractiveCanvasController *)&v44 canHandleGesture:v4];
    }
    else
    {
      unsigned int v9 = 1;
    }
  }
  else
  {
    unsigned int v9 = 0;
  }

  double v11 = [v4 gestureKind];
  double v12 = v11;
  if (v7)
  {
    double v13 = (void *)TSWPLongPress;

    if (v12 != v13)
    {
      v43.receiver = self;
      v43.super_class = (Class)THInteractiveCanvasController;
      if (([(THInteractiveCanvasController *)&v43 canHandleGesture:v4] | v9))
      {
LABEL_10:
        char v14 = 1;
        goto LABEL_36;
      }
    }
  }
  else
  {
    if (v11 == (void *)TSWPTapAndTouch) {
      LOBYTE(v9) = 1;
    }

    if (v9) {
      goto LABEL_10;
    }
  }
  objc_super v15 = [v4 gestureKind];
  if (v15 == (void *)TSDShortTap) {
    goto LABEL_20;
  }
  double v16 = [v4 gestureKind];
  double v17 = v16;
  if (v16 == (void *)TSDDelayedShortTap)
  {

LABEL_20:
    goto LABEL_21;
  }
  double v18 = [v4 gestureKind];
  double v19 = (void *)TSWPLongPress;

  if (v18 == v19)
  {
LABEL_21:
    long long v22 = [(THInteractiveCanvasController *)self delegate];
    uint64_t v23 = TSUProtocolCast();

    [v4 unscaledLocationForICC:self];
    double v25 = v24;
    double v27 = v26;
    CGRect v28 = -[THInteractiveCanvasController hitRep:](self, "hitRep:");
    objc_opt_class();
    CGRect v29 = TSUDynamicCast();
    CGRect v30 = [v4 gestureKind];
    double v31 = (void *)TSWPLongPress;

    if (v30 != v31 || !v29)
    {
      if (v29)
      {
        CGRect v32 = [v4 gestureKind];
        double v33 = (void *)TSDDelayedShortTap;

        if (v32 != v33)
        {
          char v14 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      unsigned int v34 = -[THInteractiveCanvasController p_pointIsInLeftMargin:](self, "p_pointIsInLeftMargin:", v25, v27);
      unsigned __int8 v35 = -[THInteractiveCanvasController p_pointIsInRightMargin:](self, "p_pointIsInRightMargin:", v25, v27);
      if (objc_opt_respondsToSelector()) {
        unsigned int v36 = [v23 interactiveCanvasControllerShouldPageLeftOnMarginTap:self] ^ 1;
      }
      else {
        unsigned int v36 = 1;
      }
      if (objc_opt_respondsToSelector()) {
        unsigned __int8 v37 = [v23 interactiveCanvasControllerShouldPageRightOnMarginTap:self];
      }
      else {
        unsigned __int8 v37 = 0;
      }
      if ((v34 ^ 1 | v36) == 1)
      {
        char v14 = v35 & v37;
        goto LABEL_35;
      }
    }
    char v14 = 1;
    goto LABEL_35;
  }
  CGSize v20 = [v4 gestureKind];
  long long v21 = (void *)TSDFreeTransform;

  if (v20 == v21)
  {
    if ([(THInteractiveCanvasController *)self isCompactWidth]) {
      LOBYTE(v39) = 0;
    }
    else {
      unsigned int v39 = ![(THInteractiveCanvasController *)self isCompactHeight];
    }
    [(THInteractiveCanvasController *)self viewScale];
    double v41 = v40;
    [(THInteractiveCanvasController *)self fitWidthViewScale];
    if (v41 <= v42) {
      char v14 = 1;
    }
    else {
      char v14 = v39;
    }
  }
  else
  {
    char v14 = 0;
  }
LABEL_36:

  return v14;
}

- (BOOL)handleGesture:(id)a3
{
  id v4 = a3;
  double v5 = [v4 gestureKind];
  double v6 = v5;
  if (v5 == (void *)TSDShortTap)
  {
  }
  else
  {
    double v7 = [v4 gestureKind];
    id v8 = (void *)TSDDelayedShortTap;

    if (v7 != v8)
    {
      unsigned int v9 = [v4 gestureKind];
      double v10 = (void *)TSWPLongPress;

      if (v9 == v10)
      {
        if ([(THInteractiveCanvasController *)self p_handleLongPress:v4]) {
          goto LABEL_23;
        }
      }
      else
      {
        double v11 = [v4 gestureKind];
        double v12 = (void *)TSDFreeTransform;

        if (v11 == v12)
        {
          unsigned int v13 = [v4 gestureState];
          objc_opt_class();
          char v14 = TSUDynamicCast();
          if (v14)
          {
            objc_opt_class();
            objc_super v15 = [(THInteractiveCanvasController *)self documentRoot];
            double v16 = TSUDynamicCast();

            double v17 = +[THApplePubAssetPlugin sharedPlugin];
            double v18 = [v17 existingBookViewControllerForDocumentRoot:v16];

            double v19 = [v18 canvasExitFreeTransformController];
            CGSize v20 = v19;
            if (v13 == 1)
            {
              long long v21 = [v14 freeTransformDelegate];

              if (v21 != v20)
              {
                long long v22 = +[TSUAssertionHandler currentHandler];
                uint64_t v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController handleGesture:]");
                double v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
                [v22 handleFailureInFunction:v23 file:v24 lineNumber:1134 description:@"Expected the gesture free transform delegate to be the canvas exit FTC."];
              }
              double v25 = [v18 canvasExitFreeTransformController];
              [v14 setFreeTransformDelegate:v25];

              [v20 setTransformGR:v14];
              [v20 transformGRChanged:v14];
            }
            else
            {
              [v19 transformGRChanged:v14];
              if (v13 - 3 <= 1)
              {
                v46 = [v20 transformGR];
                [v46 setFreeTransformDelegate:0];

                [v20 setTransformGR:0];
              }
            }
          }
          goto LABEL_23;
        }
      }
      goto LABEL_12;
    }
  }
  if ([(THInteractiveCanvasController *)self p_handleSingleTap:v4]) {
    goto LABEL_23;
  }
LABEL_12:
  double v26 = [v4 gestureKind];
  double v27 = (void *)TSWPImmediateSingleTap;

  if (v26 == v27)
  {
    [v4 unscaledLocationForICC:self];
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    CGRect v32 = [(THInteractiveCanvasController *)self p_gestureHitLink:v4];
    if (v32)
    {

      goto LABEL_15;
    }
    objc_opt_class();
    unsigned int v34 = [(THInteractiveCanvasController *)self editorController];
    unsigned __int8 v35 = [v34 textInputEditor];
    unsigned int v36 = TSUDynamicCast();

    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = sub_30F3C;
    v63[4] = sub_30F4C;
    unsigned __int8 v37 = self;
    v64 = v37;
    objc_opt_class();
    v38 = [(THInteractiveCanvasController *)v37 layerHost];
    unsigned int v39 = [v38 asiOSCVC];
    double v40 = TSUDynamicCast();

    objc_opt_class();
    double v41 = TSUDynamicCast();
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    char v62 = 0;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_30F54;
    v56[3] = &unk_457620;
    id v57 = v36;
    id v42 = v40;
    id v58 = v42;
    id v43 = v41;
    id v59 = v43;
    v60 = v61;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_30FF8;
    v49[3] = &unk_457668;
    id v44 = v57;
    id v50 = v44;
    v51 = v37;
    uint64_t v54 = v29;
    uint64_t v55 = v31;
    v52 = v63;
    v53 = v61;
    v45 = +[TSWPTwoPartAction actionWithStartAction:v56 cancelAction:&stru_457640 finishAction:v49];
    [v42 startDelayedTapAction:v45];

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v63, 8);

LABEL_23:
    BOOL v33 = 1;
    goto LABEL_24;
  }
LABEL_15:
  v48.receiver = self;
  v48.super_class = (Class)THInteractiveCanvasController;
  BOOL v33 = [(THInteractiveCanvasController *)&v48 handleGesture:v4];
LABEL_24:

  return v33;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v19 = a3;
  id v4 = [v19 gestureKind];
  double v5 = (void *)TSDFreeTransform;

  if (v4 == v5)
  {
    objc_opt_class();
    double v6 = [(THInteractiveCanvasController *)self documentRoot];
    double v7 = TSUDynamicCast();

    id v8 = +[THApplePubAssetPlugin sharedPlugin];
    unsigned int v9 = [v8 existingBookViewControllerForDocumentRoot:v7];

    double v10 = [v9 canvasExitFreeTransformController];
    objc_opt_class();
    double v11 = TSUDynamicCast();
    uint64_t v12 = [v11 freeTransformDelegate];
    if (v12)
    {
      unsigned int v13 = (void *)v12;
      char v14 = [v11 freeTransformDelegate];

      if (v14 != v10)
      {
        objc_super v15 = +[TSUAssertionHandler currentHandler];
        double v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController willBeginHandlingGesture:]");
        double v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
        [v15 handleFailureInFunction:v16 file:v17 lineNumber:1219 description:@"Overriding existing delegate."];
      }
    }
    double v18 = [v9 canvasExitFreeTransformController];
    [v11 setFreeTransformDelegate:v18];
  }
}

- (void)showHyperlinkInfoForField:(id)a3 inRep:(id)a4 openInEditMode:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_opt_class();
  TSUDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(THInteractiveCanvasController *)self handleHyperlink:v8 hitRep:v9];
}

- (void)pressableRepWasPressed:(id)a3 atPoint:(CGPoint)a4
{
  id v26 = a3;
  double v5 = [(THInteractiveCanvasController *)self delegate];
  double v6 = TSUProtocolCast();

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v26 pressableAction];
    if (v7 == 3)
    {
      objc_opt_class();
      uint64_t v12 = [v26 info];
      double v10 = TSUDynamicCast();

      double v11 = [v10 hyperlinkURL];
      if (v11) {
        [(THInteractiveCanvasController *)self performSelectorOnMainThread:"handleHyperlinkWithURL:" withObject:v11 waitUntilDone:0];
      }
    }
    else
    {
      id v8 = v7;
      if (v7 == 2)
      {
        if (!v6) {
          goto LABEL_22;
        }
        unsigned int v13 = [v26 pressableAnimationLayer];
        [v13 removeAllAnimations];

        if (objc_opt_respondsToSelector())
        {
          [v26 expandableRep];
        }
        else
        {
          objc_opt_class();
          TSUClassAndProtocolCast();
        double v10 = };
        if (v10) {
          [v6 presentRepExpanded:v10];
        }
        goto LABEL_21;
      }
      if (v7 != 1)
      {
        double v10 = +[TSUAssertionHandler currentHandler];
        char v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController pressableRepWasPressed:atPoint:]");
        objc_super v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"];
        [v10 handleFailureInFunction:v14 file:v15 lineNumber:1308 description:@"Unrecognized action type: %d" v8];

LABEL_21:
        goto LABEL_22;
      }
      if (!v6) {
        goto LABEL_22;
      }
      id v9 = [v26 info];
      double v10 = TSUProtocolCast();

      double v11 = [v10 popUpInfo];
      if (v11)
      {
        if (objc_opt_respondsToSelector()) {
          [v26 frameForPopupInUnscaledCanvas];
        }
        else {
          [v26 frameInUnscaledCanvas];
        }
        -[THInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:");
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v24 = [(THInteractiveCanvasController *)self canvasView];
        double v25 = [v24 layer];
        [v6 presentPopoverForPopUpInfo:v11 withFrame:v25 inLayer:v17];
      }
    }

    goto LABEL_21;
  }
LABEL_22:
}

- (BOOL)wantsUpdatedScrollIndicatorInsets
{
  return 0;
}

- (void)progressDidChangeForRep:(id)a3 percent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(THInteractiveCanvasController *)self delegate];
  id v8 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    [v8 interactiveCanvasController:self progressDidChangeForRep:v9 percent:v6];
  }
}

- (void)scoreDidChangeForRep:(id)a3 score:(id)a4 total:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [(THInteractiveCanvasController *)self delegate];
  double v11 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    [v11 interactiveCanvasController:self scoreDidChangeForRep:v12 score:v8 total:v9];
  }
}

- (void)resetAttemptForRep:(id)a3
{
  id v6 = a3;
  id v4 = [(THInteractiveCanvasController *)self delegate];
  double v5 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    [v5 interactiveCanvasController:self resetAttemptForRep:v6];
  }
}

- (void)p_trackProgressForRep:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (v4)
  {
    double v5 = v4;
    do
    {
      if ([v5 conformsToProtocol:&OBJC_PROTOCOL___BCProgressTracking]) {
        break;
      }
      uint64_t v6 = [v5 parentRep];

      double v5 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    double v5 = 0;
  }
  objc_opt_class();
  id v7 = TSUClassAndProtocolCast();
  if (v7)
  {
    id v8 = [(THInteractiveCanvasController *)self delegate];
    id v9 = TSUProtocolCast();

    if (objc_opt_respondsToSelector()) {
      [v9 interactiveCanvasController:self activateProgressForRep:v7];
    }
  }
}

- (BOOL)animatingScroll
{
  return self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mAnimatingScroll];
}

- (void)scrollViewDidScroll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  id v4 = a3;
  [(THInteractiveCanvasController *)&v5 scrollViewDidScroll:v4];
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v4, 0, v5.receiver, v5.super_class);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(THInteractiveCanvasController *)self p_adjustMaskLayerOnScrollView:v4];

  +[CATransaction commit];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  if (![(THInteractiveCanvasController *)self isOverscrolling])
  {
    v10.receiver = self;
    v10.super_class = (Class)THInteractiveCanvasController;
    -[THInteractiveCanvasController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)THInteractiveCanvasController;
  id v6 = a3;
  [(THInteractiveCanvasController *)&v7 scrollViewDidEndDragging:v6 willDecelerate:v4];
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v6, 2, v7.receiver, v7.super_class);
}

- (void)scrollViewDidLayoutSubviews:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(THInteractiveCanvasController *)self maskLayer];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    id v6 = [(THInteractiveCanvasController *)self layerHost];
    objc_super v7 = [v6 canvasLayer];
    id v8 = [v7 mask];

    if (v8)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(THInteractiveCanvasController *)self p_adjustMaskLayerOnScrollView:v9];
      +[CATransaction commit];
    }
  }
}

- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController scrollView:willAnimateToContentOffset:](&v5, "scrollView:willAnimateToContentOffset:", a3, a4.x, a4.y);
  [(THInteractiveCanvasController *)self p_hoistMaskLayer];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  id v4 = a3;
  [(THInteractiveCanvasController *)&v5 scrollViewDidEndScrollingAnimation:v4];
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v4, 3, v5.receiver, v5.super_class);

  [(THInteractiveCanvasController *)self p_unhoistMaskLayer];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  id v4 = a3;
  [(THInteractiveCanvasController *)&v5 scrollViewDidEndDecelerating:v4];
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v4, 3, v5.receiver, v5.super_class);
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THInteractiveCanvasController;
  [(THInteractiveCanvasController *)&v4 scrollViewDidScrollToTop:a3];
  [(THInteractiveCanvasController *)self p_unhoistMaskLayer];
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[THInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:", a3.x, a3.y);
  double v7 = v6;
  double v9 = v8;
  id v11 = [(THInteractiveCanvasController *)self canvasView];
  objc_super v10 = [v11 enclosingScrollView];
  [v10 setContentOffset:v4 animated:v7];
}

- (void)p_handleOverscroll:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v31 = a3;
  double v6 = [(THInteractiveCanvasController *)self delegate];
  double v7 = TSUProtocolCast();

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v7 interactiveCanvasControllerShouldIgnoreOverscroll:self] & 1) != 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    [v31 contentOffset];
    double v10 = v9;
    double v12 = v11;
    [v31 contentSize];
    double v14 = v10 - v13;
    [v31 frame];
    double v16 = v14 + v15;
    [v31 contentSize];
    double v18 = v12 - v17;
    [v31 frame];
    double v20 = v18 + v19;
    [v31 contentInset];
    double v22 = v21;
    double v24 = v10 + v23;
    double v26 = v16 - v25;
    double v28 = v12 + v27;
    if (v24 >= -5.0)
    {
      if (v26 > 5.0 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v7 interactiveCanvasController:self didOverscrollRight:v4 state:v26];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v7 interactiveCanvasController:self didOverscrollLeft:v4 state:fabs(v24)];
    }
    double v29 = v20 - v22;
    if (v28 >= -5.0)
    {
      if (v29 > 5.0 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v7 interactiveCanvasController:self didOverscrollBottom:v4 state:v29];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v7 interactiveCanvasController:self didOverscrollTop:v4 state:fabs(v28)];
    }
    BOOL v30 = v24 < -5.0;
    if (v26 > 5.0) {
      BOOL v30 = 1;
    }
    if (v28 < -5.0) {
      BOOL v30 = 1;
    }
    uint64_t v8 = v29 > 5.0 || v30;
  }
  [(THInteractiveCanvasController *)self setIsOverscrolling:v8];
}

- (BOOL)p_handleSingleTap:(id)a3
{
  [a3 unscaledLocationForICC:self];
  double v5 = v4;
  double v7 = v6;
  unsigned int v8 = -[THInteractiveCanvasController p_pointIsInLeftMargin:](self, "p_pointIsInLeftMargin:");
  BOOL v9 = -[THInteractiveCanvasController p_pointIsInRightMargin:](self, "p_pointIsInRightMargin:", v5, v7);
  if (v8)
  {
    [(THInteractiveCanvasController *)self pageLeft];
LABEL_5:
    LOBYTE(v9) = 1;
    return v9;
  }
  if (v9)
  {
    [(THInteractiveCanvasController *)self pageRight];
    goto LABEL_5;
  }
  return v9;
}

- (BOOL)p_allowPaging
{
  id v2 = self;
  uint64_t v3 = [(THInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(THInteractiveCanvasController *)v2 delegate];
    LOBYTE(v2) = [v4 interactiveCanvasControllerAllowPaging:v2];
  }
  else
  {
    LODWORD(v2) = [(THInteractiveCanvasController *)v2 currentlyScrolling] ^ 1;
  }

  return (char)v2;
}

- (void)pageLeft
{
  if ([(THInteractiveCanvasController *)self p_allowPaging])
  {
    uint64_t v3 = +[AETestDriver shared];
    [v3 postEvent:kBETestDriverPageTurnStart sender:self];
    [v3 postEvent:kBETestDriverPageTurnSetupStart sender:self];
    double v4 = [(THInteractiveCanvasController *)self canvasView];
    double v5 = [v4 enclosingScrollView];

    [v5 contentOffset];
    double v7 = v6;
    double v9 = v8;
    [v5 bounds];
    double v11 = v10;
    double v12 = v7 - v10;
    [v5 contentSize];
    if (v11 > 0.0)
    {
      double v14 = v13;
      if ([v5 isPagingEnabled])
      {
        double v15 = floor(v7 / v11);
        double v16 = ceil(v7 / v11);
        BOOL v17 = vabdd_f64(v7 + v11, v14) >= 0.00999999978 || v15 == v16;
        if (!v17 && vabdd_f64(v7 / v11, round(v7 / v11)) > 0.1) {
          double v12 = v12 + v11 * 0.5;
        }
      }
    }
    [v3 postEvent:kBETestDriverPageTurnSetupEnd sender:self];
    [v3 postEvent:kBETestDriverPageTurnAnimationStart sender:self];
    double v18 = [(THInteractiveCanvasController *)self canvasView];
    double v19 = [v18 enclosingScrollView];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_32380;
    v21[3] = &unk_456D90;
    id v22 = v3;
    double v23 = self;
    id v20 = v3;
    [v19 setContentOffset:1 animated:v21 completionBlock:v12 v9];
  }
}

- (void)pageRight
{
  if ([(THInteractiveCanvasController *)self p_allowPaging])
  {
    uint64_t v3 = +[AETestDriver shared];
    [v3 postEvent:kBETestDriverPageTurnStart sender:self];
    [v3 postEvent:kBETestDriverPageTurnSetupStart sender:self];
    double v4 = [(THInteractiveCanvasController *)self canvasView];
    double v5 = [v4 enclosingScrollView];

    [v5 contentOffset];
    double v7 = v6;
    double v9 = v8;
    [v5 bounds];
    double v11 = v10;
    double v12 = v7 + v10;
    [v5 contentSize];
    if (v11 > 0.0)
    {
      double v14 = v13;
      if ([v5 isPagingEnabled])
      {
        double v15 = v11 + v12;
        BOOL v16 = vabdd_f64(v12, v14) < 0.00999999978 || v15 <= v14;
        double v17 = v12 - (v15 - v14);
        if (!v16) {
          double v12 = v17;
        }
      }
    }
    [v3 postEvent:kBETestDriverPageTurnSetupEnd sender:self];
    [v3 postEvent:kBETestDriverPageTurnAnimationStart sender:self];
    double v18 = [(THInteractiveCanvasController *)self canvasView];
    double v19 = [v18 enclosingScrollView];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_325B8;
    v21[3] = &unk_456D90;
    id v22 = v3;
    double v23 = self;
    id v20 = v3;
    [v19 setContentOffset:1 animated:v21 completionBlock:v12 v9];
  }
}

- (BOOL)p_pointIsInLeftMargin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(THInteractiveCanvasController *)self delegate];
  double v7 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v8 = [v7 interactiveCanvasController:self pointIsInLeftMargin:x, y];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)p_pointIsInRightMargin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(THInteractiveCanvasController *)self delegate];
  double v7 = TSUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v8 = [v7 interactiveCanvasController:self pointIsInRightMargin:x, y];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)p_zoomColumnAtPoint:(CGPoint)a3 forceWpRep:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4) {
    -[THInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", 0, &stru_4576A8, a3.x, a3.y);
  }
  else {
  double v7 = -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, a3.x, a3.y);
  }
  objc_opt_class();
  unsigned __int8 v8 = TSUDynamicCast();
  [v8 convertNaturalPointFromUnscaledCanvas:x, y];
  double v9 = [v8 closestColumnForPoint:];
  double v10 = v9;
  if (v9)
  {
    [v9 typographicBounds];
    [v8 convertNaturalRectToUnscaledCanvas:];
    CGFloat v12 = v11;
    double v14 = v13;
    double width = v15;
    double v18 = v17;
    double v19 = [(THInteractiveCanvasController *)self delegate];
    id v20 = TSUProtocolCast();

    double height = v18;
    double v35 = width;
    double v36 = v14;
    double v22 = v12;
    if (objc_opt_respondsToSelector())
    {
      [v20 interactiveCanvasControllerPaddingForZoomToColumn:self];
      CGFloat v24 = -v23;
      v37.origin.double x = v12;
      v37.size.double width = width;
      v37.origin.double y = v14;
      v37.size.double height = v18;
      CGRect v38 = CGRectInset(v37, v24, v24);
      double v22 = v38.origin.x;
      double v14 = v38.origin.y;
      double width = v38.size.width;
      double height = v38.size.height;
    }
    double v34 = v12;
    [(THInteractiveCanvasController *)self viewScale];
    double v26 = v25;
    -[THInteractiveCanvasController viewScaleForZoomToFitRect:outset:fitWidthOnly:](self, "viewScaleForZoomToFitRect:outset:fitWidthOnly:", 0, 1, v22, v14, width, height);
    if (vabdd_f64(v26, v27) >= 0.00999999978)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v20 interactiveCanvasControllerShouldAllowZoomToColumn:self]
        && ((objc_opt_respondsToSelector() & 1) == 0
         || objc_msgSend(v20, "interactiveCanvasController:shouldZoomToColumn:withFrame:tapPoint:", self, v10, v34, v36, v35, v18, x, y)))
      {
        unsigned __int8 v32 = -[THInteractiveCanvasController zoomToFitRect:outset:fitWidthOnly:centerHorizontally:centerVertically:animated:](self, "zoomToFitRect:outset:fitWidthOnly:centerHorizontally:centerVertically:animated:", 0, 1, 1, 0, 1, v22, v14, width, height);
        if (objc_opt_respondsToSelector()) {
          [v20 interactiveCanvasController:self didZoomToColumn:v10 ofRep:v8];
        }
        goto LABEL_19;
      }
    }
    else
    {
      [(THInteractiveCanvasController *)self contentOffset];
      double v28 = [v8 layout];
      double v29 = [v28 pageLayout];

      if (v29) {
        [v29 frameInRoot];
      }
      BOOL v30 = [(THInteractiveCanvasController *)self layerHost];
      id v31 = [v30 canvasLayer];
      [v31 minimumPinchViewScale];
      -[THInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self, "setViewScale:contentOffset:clampOffset:animated:", 1, 1);
    }
    unsigned __int8 v32 = 0;
LABEL_19:

    goto LABEL_20;
  }
  unsigned __int8 v32 = 0;
LABEL_20:

  return v32;
}

- (void)p_editorControllerDidChangeTextInputEditor:(id)a3
{
  id v4 = a3;
  if (TSUSupportsTextInteraction())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_32BFC;
    v8[3] = &unk_456D90;
    id v9 = v4;
    double v10 = self;
    double v5 = objc_retainBlock(v8);
    if (v5)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v5[2])(v5);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_32D34;
        block[3] = &unk_4576D0;
        double v7 = v5;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (BOOL)suppressRevealScrollViewOnLayoutAndRender
{
  return self->mSuppressRevealScrollViewOnLayoutAndRender;
}

- (void)setSuppressRevealScrollViewOnLayoutAndRender:(BOOL)a3
{
  self->mSuppressRevealScrollViewOnLayoutAndRender = a3;
}

- (NSObject)iTunesMobileContext
{
  return self->miTunesMobileContext;
}

- (BOOL)isOverscrolling
{
  return self->mOverscrolling;
}

- (void)setIsOverscrolling:(BOOL)a3
{
  self->mOverscrolling = a3;
}

- (NSArray)backgroundLayers
{
  return self->mBackgroundLayers;
}

- (void)setBackgroundLayers:(id)a3
{
}

- (NSArray)foregroundLayers
{
  return self->mForegroundLayers;
}

- (void)setForegroundLayers:(id)a3
{
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (CGPoint)maskLayerOrigin
{
  double x = self->_maskLayerOrigin.x;
  double y = self->_maskLayerOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMaskLayerOrigin:(CGPoint)a3
{
  self->_maskLayerOrigin = a3;
}

- (BOOL)selectOnLongPress
{
  return self->_selectOnLongPress;
}

- (void)setSelectOnLongPress:(BOOL)a3
{
  self->_selectOnLongPress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->miTunesMobileContext, 0);
  objc_storeStrong((id *)&self->mForegroundLayers, 0);

  objc_storeStrong((id *)&self->mBackgroundLayers, 0);
}

- (id)_axQuickSpeakContent
{
  id v2 = [self tsaxValueForKey:@"editorController" tsaxValueForKey:@"textInputEditor"];
  NSClassFromString(@"TSWPEditingController");
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (id v3 = [v2 tsaxValueForKey:@"selection"],
        ![v3 tsaxBoolValueForKey:@"isRange"]))
  {
LABEL_8:
    id v6 = 0;
    goto LABEL_9;
  }
  id v4 = [v3 tsaxRangeValueForKey:@"range"];
  id v6 = 0;
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v5)
      {
        id v8 = v4;
        id v9 = [v2 tsaxValueForKey:@"storage"];
        if (objc_opt_respondsToSelector())
        {
          id v6 = [v9 stringEquivalentFromRange:v8, v7];
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  double v10 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];

  return [v6 stringByTrimmingCharactersInSet:v10];
}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  return [(THInteractiveCanvasController *)self tsaxValueForKey:@"mTextInputResponder"];
}

- (BOOL)_accessibilityQuickSpeakContentIsSpeakable
{
  return [self _axQuickSpeakContent].length != 0;
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  BOOL v3 = [+[TSAccessibility sharedInstance] isQuickSpeakEnabled];
  if (v3) {
    LOBYTE(v3) = (-[THInteractiveCanvasController tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", @"_accessibilityShouldShowPauseBubble") & 1) == 0&& [self _axQuickSpeakContent].length != 0;
  }
  return v3;
}

@end