@interface THWPRep
- (BOOL)canEditWithEditor:(id)a3;
- (BOOL)canReadHighlights;
- (BOOL)canWriteHighlights;
- (BOOL)hasBeenRemovedFromCanvas;
- (BOOL)hasMarginNoteAtCanvasPoint:(CGPoint)a3;
- (BOOL)p_isSelectionSingleAnchoredDrawableAttachment;
- (BOOL)p_shouldStartEditingOnLongPress;
- (BOOL)p_shouldStartEditingOnPress;
- (BOOL)shouldBeginEditingWithGesture:(id)a3;
- (CGPoint)lastPositionInRoot;
- (CGRect)boundsRectForSelection:(id)a3;
- (CGRect)popoverPresentationRectForRange:(_NSRange)a3;
- (CGRect)rectForHighlight:(_NSRange)a3 lineHasAttachment:(BOOL)a4;
- (CGRect)visibleBoundsForTilingLayer:(id)a3;
- (NSArray)activeHighlightLayers;
- (NSArray)linkPulseSearchReferences;
- (THMarginNotesController)marginNotesController;
- (THModelContentNode)storageContentNode;
- (THWPHighlightController)highlightController;
- (THWPRep)initWithLayout:(id)a3 canvas:(id)a4;
- (_NSRange)rangeIntersectingFirstOverlappingColumnOfRange:(_NSRange)a3;
- (double)firstLineBaseline;
- (double)linkPulseActivationTime;
- (id)allLines;
- (id)backgroundHighlightLayer;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)marginNoteForAnnotation:(id)a3 inRep:(id)a4 highlightBounds:(CGRect)a5;
- (id)overlayLayers;
- (id)p_lineSearchReferencesForSearchReferences:(id)a3;
- (id)p_lineSelectionsForSelection:(id)a3;
- (id)repForDragging;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)addMarginNoteLayersToArray:(id)a3;
- (void)dealloc;
- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4 forCaret:(BOOL)a5;
- (void)p_cleanup;
- (void)p_enumerateBoundsRectsForRange:(_NSRange)a3 includeSpaceBefore:(BOOL)a4 includeSpaceAfter:(BOOL)a5 includeLeading:(BOOL)a6 withBlock:(id)a7;
- (void)p_enumerateBoundsRectsForSelection:(id)a3 includeSpaceBefore:(BOOL)a4 includeSpaceAfter:(BOOL)a5 includeLeading:(BOOL)a6 withBlock:(id)a7;
- (void)p_setLinkPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4;
- (void)p_setSelectionLineLayersHidden:(BOOL)a3;
- (void)p_updateLinkAnimationForSelection:(id)a3 withAnimatingPulse:(BOOL)a4;
- (void)p_updateLinkForSelection:(id)a3 withAnimatingPulse:(BOOL)a4 selectionFlags:(unsigned int)a5;
- (void)p_updateLinkLayersForRangeSelection:(id)a3 withAnimatingPulse:(BOOL)a4;
- (void)p_updatePulseLayerPositions;
- (void)processFindUIStateChangedNotificationUserInfo:(id)a3;
- (void)pulseAnimationDidStop:(id)a3;
- (void)setActiveHighlightLayers:(id)a3;
- (void)setHighlightController:(id)a3;
- (void)setLastPositionInRoot:(CGPoint)a3;
- (void)setLinkPulseActivationTime:(double)a3;
- (void)setLinkPulseSearchReferences:(id)a3;
- (void)setupMarginNotesControllerForHighlightController:(id)a3;
- (void)showEditorForMarginNote:(id)a3;
- (void)updateFromLayout;
- (void)viewScaleDidChange;
- (void)willBeRemoved;
@end

@implementation THWPRep

- (THWPRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWPRep;
  result = [(THWPRep *)&v5 initWithLayout:a3 canvas:a4];
  if (result) {
    result->mHighlightController = 0;
  }
  __dmb(0xBu);
  return result;
}

- (void)p_cleanup
{
  [(CALayer *)self->mBackgroundHighlightLayer setDelegate:0];
  [(CALayer *)self->mBackgroundHighlightLayer removeFromSuperlayer];

  self->mBackgroundHighlightLayer = 0;
  [(THWPRep *)self setActiveHighlightLayers:0];
  [(TSKHighlightArrayController *)self->mLinkPulseArrayController disconnect];
  [(TSKHighlightArrayController *)self->mLinkPulseArrayController reset];

  self->mLinkPulseArrayController = 0;

  [(THWPRep *)self setLinkPulseSearchReferences:0];
}

- (void)dealloc
{
  [(THWPRep *)self setHighlightController:0];
  [(THWPRep *)self p_cleanup];
  v3.receiver = self;
  v3.super_class = (Class)THWPRep;
  [(THWPRep *)&v3 dealloc];
}

- (void)willBeRemoved
{
  v4.receiver = self;
  v4.super_class = (Class)THWPRep;
  [(THWPRep *)&v4 willBeRemoved];
  objc_sync_enter(self);
  mHighlightController = self->mHighlightController;
  if (mHighlightController) {
    [(THWPHighlightController *)mHighlightController parentWillBeRemovedFromCanvas:self];
  }
  objc_sync_exit(self);
  [(THWPRep *)self p_cleanup];
}

- (BOOL)canReadHighlights
{
  if (![(THWPRep *)self storageContentNode]) {
    return 0;
  }
  if (objc_msgSend(-[THWPRep storage](self, "storage"), "preventHighlighting")) {
    return 0;
  }
  if (!objc_msgSend(-[THWPRep canvas](self, "canvas"), "isCanvasInteractive")) {
    return 0;
  }
  [(THWPRep *)self interactiveCanvasController];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  [(THWPRep *)self interactiveCanvasController];
  objc_super v3 = (void *)TSUDynamicCast();

  return [v3 supportsReadingHighlights];
}

- (BOOL)canWriteHighlights
{
  if (![(THWPRep *)self storageContentNode]) {
    return 0;
  }
  if (![(THWPRep *)self canReadHighlights]) {
    return 0;
  }
  if (!objc_msgSend(-[THWPRep canvas](self, "canvas"), "isCanvasInteractive")) {
    return 0;
  }
  [(THWPRep *)self interactiveCanvasController];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  [(THWPRep *)self interactiveCanvasController];
  objc_super v3 = (void *)TSUDynamicCast();

  return [v3 supportsWritingHighlights];
}

- (THWPHighlightController)highlightController
{
  if ([(THWPRep *)self canReadHighlights])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A0A78;
    block[3] = &unk_456DE0;
    block[4] = self;
    if (self->mHighlightControllerOnceToken != -1) {
      dispatch_once(&self->mHighlightControllerOnceToken, block);
    }
  }
  return self->mHighlightController;
}

- (THModelContentNode)storageContentNode
{
  id v2 = objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "sectionLayout"), "info");

  return (THModelContentNode *)[v2 contentNode];
}

- (id)backgroundHighlightLayer
{
  id result = self->mBackgroundHighlightLayer;
  if (!result)
  {
    objc_super v4 = (CALayer *)objc_alloc_init((Class)CALayer);
    self->mBackgroundHighlightLayer = v4;
    -[CALayer setAnchorPoint:](v4, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    [(CALayer *)self->mBackgroundHighlightLayer setEdgeAntialiasingMask:0];
    [(CALayer *)self->mBackgroundHighlightLayer setDelegate:self];
    -[CALayer setPosition:](self->mBackgroundHighlightLayer, "setPosition:", CGPointZero.x, CGPointZero.y);
    [(CALayer *)self->mBackgroundHighlightLayer setZPosition:-2.1];
    [self canvas].contentsScale;
    -[CALayer setContentsScale:](self->mBackgroundHighlightLayer, "setContentsScale:");
    return self->mBackgroundHighlightLayer;
  }
  return result;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)THWPRep;
  -[THWPRep addAdditionalChildLayersToArray:](&v36, "addAdditionalChildLayersToArray:");
  if ([(THWPRep *)self canReadHighlights])
  {
    objc_super v5 = [(THWPRep *)self highlightController];
    [self interactiveCanvasController].visibleUnscaledRect;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [self canvas].viewScale;
    id v15 = -[THWPHighlightController highlightLayersInCanvasUnscaledRect:scale:](v5, "highlightLayersInCanvasUnscaledRect:scale:", v7, v9, v11, v13, v14);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v16 = [(THWPRep *)self activeHighlightLayers];
    id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (([v15 containsObject:v21] & 1) == 0) {
            [v21 removeFromSuperlayer];
          }
        }
        id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v18);
    }
    [(THWPRep *)self setActiveHighlightLayers:v15];
    if ([(NSArray *)[(THWPRep *)self activeHighlightLayers] count])
    {
      id v22 = [(THWPRep *)self backgroundHighlightLayer];
      [a3 insertObject:v22 atIndex:0];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v23 = [(NSArray *)[(THWPRep *)self activeHighlightLayers] reverseObjectEnumerator];
      id v24 = [(NSEnumerator *)v23 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v29;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v29 != v26) {
              objc_enumerationMutation(v23);
            }
            [v22 insertSublayer:*(void *)(*((void *)&v28 + 1) + 8 * (void)j) atIndex:0];
          }
          id v25 = [(NSEnumerator *)v23 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v25);
      }
    }
    [(THWPRep *)self addMarginNoteLayersToArray:a3];
  }
}

- (BOOL)shouldBeginEditingWithGesture:(id)a3
{
  [self interactiveCanvasController].delegate;
  if (objc_opt_respondsToSelector())
  {
    unsigned int v5 = [[-[THWPRep interactiveCanvasController](self, "interactiveCanvasController") delegate] interactiveCanvasController:shouldBeginEditingTHWPRep:self withGesture:a3];
    id v6 = [a3 gestureKind];
    if (!v5) {
      return 0;
    }
  }
  else
  {
    id v6 = [a3 gestureKind];
  }
  id v8 = v6;
  if (v6 == (id)TSWPTapAndTouch
    || [(THWPRep *)self p_shouldStartEditingOnPress] && v8 == (id)TSWPImmediatePress)
  {
    return 1;
  }
  BOOL result = [(THWPRep *)self p_shouldStartEditingOnLongPress];
  if (v8 != (id)TSWPLongPress) {
    return 0;
  }
  return result;
}

- (BOOL)canEditWithEditor:(id)a3
{
  objc_opt_class();
  objc_super v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    id v5 = [v4 storage];
    if (v5 == [(THWPRep *)self storage]) {
      LOBYTE(v4) = [self parentRep].isLocked ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (id)repForDragging
{
  return 0;
}

- (_NSRange)rangeIntersectingFirstOverlappingColumnOfRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(THWPRep *)self columns];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      double v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v21.NSUInteger location = (NSUInteger)[*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) range];
        v21.NSUInteger length = v10;
        v19.NSUInteger location = location;
        v19.NSUInteger length = length;
        NSRange v11 = NSIntersectionRange(v19, v21);
        if (v11.length)
        {
          NSUInteger length = v11.length;
          NSUInteger location = v11.location;
          goto LABEL_11;
        }
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWPRep rangeIntersectingFirstOverlappingColumnOfRange:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPRep.mm"] lineNumber:307 description:@"Couldn't find any column that intersects range"];
LABEL_11:
  NSUInteger v12 = location;
  NSUInteger v13 = length;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (CGRect)rectForHighlight:(_NSRange)a3 lineHasAttachment:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = (TSWPStorage *)[(THWPRep *)self storage];
  v17.NSUInteger location = location;
  v17.NSUInteger length = length;
  NSUInteger v9 = THTrimHighlightRange(v8, v17);
  NSRange v11 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v9, v10);
  [(THWPRep *)self boundsRectForSelection:v11];
  if (v4) {
    [(THWPRep *)self rectForSelection:v11];
  }

  TSDRoundedRectForMainScreen();
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)firstLineBaseline
{
  id v2 = [[-[THWPRep columns](self, "columns") firstObject]];
  if (![v2 countLines]) {
    return 0.0;
  }
  objc_super v3 = (double *)[v2 lineFragmentAtIndex:0];
  return v3[4] + v3[5];
}

- (CGRect)popoverPresentationRectForRange:(_NSRange)a3
{
  id v4 = [(THWPRep *)self lineSelectionsForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length)];
  id v5 = +[NSMutableArray array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v73;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v73 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        NSRange v11 = (TSWPStorage *)[(THWPRep *)self storage];
        id v12 = [v10 range];
        NSUInteger v14 = v13;
        v78.NSUInteger location = (NSUInteger)v12;
        v78.NSUInteger length = v14;
        NSUInteger v15 = THTrimHighlightRange(v11, v78);
        if (v16) {
          [v5 addObject:[TSWPSelection selectionWithRange:v15, v16]];
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v7);
  }
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if ([v5 count] == (char *)&dword_0 + 2)
  {
    id v21 = [[v5 objectAtIndex:0] range];
    -[THWPRep rectForHighlight:lineHasAttachment:](self, "rectForHighlight:lineHasAttachment:", v21, v22, objc_msgSend(-[THWPRep storage](self, "storage"), "rangeContainsAttachment:", v21, v22));
    CGFloat x = v23;
    CGFloat y = v24;
    CGFloat width = v25;
    CGFloat height = v26;
    id v27 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 1), "range");
    -[THWPRep rectForHighlight:lineHasAttachment:](self, "rectForHighlight:lineHasAttachment:", v27, v28, objc_msgSend(-[THWPRep storage](self, "storage"), "rangeContainsAttachment:", v27, v28));
    CGFloat v30 = v29;
    r2.origin.CGFloat y = v31;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    v79.origin.CGFloat x = x;
    v79.origin.CGFloat y = y;
    v79.size.CGFloat width = width;
    v79.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v79);
    v80.origin.CGFloat x = v30;
    v80.origin.CGFloat y = r2.origin.y;
    v80.size.CGFloat width = v33;
    v80.size.CGFloat height = v35;
    if (MinX <= CGRectGetMaxX(v80))
    {
      v81.origin.CGFloat x = x;
      v81.origin.CGFloat y = y;
      v81.size.CGFloat width = width;
      v81.size.CGFloat height = height;
      v95.origin.CGFloat x = v30;
      v95.origin.CGFloat y = r2.origin.y;
      v95.size.CGFloat width = v33;
      v95.size.CGFloat height = v35;
      CGRect v82 = CGRectUnion(v81, v95);
      CGFloat x = v82.origin.x;
      CGFloat y = v82.origin.y;
      CGFloat width = v82.size.width;
      CGFloat height = v82.size.height;
    }
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
    r2.size = 0u;
    long long v69 = 0u;
    id v37 = [v5 countByEnumeratingWithState:&r2.size objects:v76 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v69;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v69 != v39) {
            objc_enumerationMutation(v5);
          }
          v41 = *(void **)(*(void *)&r2.size.height + 8 * (void)j);
          [v41 range];
          if (v42)
          {
            id v43 = [v41 range];
            uint64_t v45 = v44;
            id v46 = [(THWPRep *)self storage];
            id v47 = [v41 range];
            -[THWPRep rectForHighlight:lineHasAttachment:](self, "rectForHighlight:lineHasAttachment:", v43, v45, [v46 rangeContainsAttachment:v47, v48]);
            CGFloat v50 = v49;
            CGFloat v52 = v51;
            CGFloat v54 = v53;
            CGFloat v56 = v55;
            v83.origin.CGFloat x = x;
            v83.origin.CGFloat y = y;
            v83.size.CGFloat width = width;
            v83.size.CGFloat height = height;
            if (CGRectIsEmpty(v83))
            {
              CGFloat x = v50;
              CGFloat y = v52;
              CGFloat width = v54;
              CGFloat height = v56;
            }
            else
            {
              r2.origin.CGFloat y = v50;
              v84.origin.CGFloat x = v50;
              CGFloat v57 = v52;
              v84.origin.CGFloat y = v52;
              CGFloat v58 = v54;
              v84.size.CGFloat width = v54;
              CGFloat v59 = v56;
              v84.size.CGFloat height = v56;
              double MaxX = CGRectGetMaxX(v84);
              v85.origin.CGFloat x = x;
              v85.origin.CGFloat y = y;
              v85.size.CGFloat width = width;
              v85.size.CGFloat height = height;
              if (MaxX <= CGRectGetMinX(v85)) {
                goto LABEL_28;
              }
              v86.origin.CGFloat x = r2.origin.y;
              v86.origin.CGFloat y = v57;
              v86.size.CGFloat width = v58;
              v86.size.CGFloat height = v59;
              double v61 = CGRectGetMinX(v86);
              v87.origin.CGFloat x = x;
              v87.origin.CGFloat y = y;
              v87.size.CGFloat width = width;
              v87.size.CGFloat height = height;
              if (v61 >= CGRectGetMaxX(v87)) {
                goto LABEL_28;
              }
              v88.origin.CGFloat x = r2.origin.y;
              v88.origin.CGFloat y = v57;
              v88.size.CGFloat width = v58;
              v88.size.CGFloat height = v59;
              double MaxY = CGRectGetMaxY(v88);
              v89.origin.CGFloat x = x;
              v89.origin.CGFloat y = y;
              v89.size.CGFloat width = width;
              v89.size.CGFloat height = height;
              if (MaxY > CGRectGetMaxY(v89))
              {
                v90.origin.CGFloat x = r2.origin.y;
                v90.origin.CGFloat y = v57;
                v90.size.CGFloat width = v58;
                v90.size.CGFloat height = v59;
                double MinY = CGRectGetMinY(v90);
                v91.origin.CGFloat x = x;
                v91.origin.CGFloat y = y;
                v91.size.CGFloat width = width;
                v91.size.CGFloat height = height;
                if (MinY > CGRectGetMinY(v91))
                {
                  v92.origin.CGFloat x = x;
                  v92.origin.CGFloat y = y;
                  v92.size.CGFloat width = width;
                  v92.size.CGFloat height = height;
                  v96.origin.CGFloat x = r2.origin.y;
                  v96.origin.CGFloat y = v57;
                  v96.size.CGFloat width = v58;
                  v96.size.CGFloat height = v59;
                  CGRect v93 = CGRectUnion(v92, v96);
                  CGFloat x = v93.origin.x;
                  CGFloat y = v93.origin.y;
                  CGFloat width = v93.size.width;
                  CGFloat height = v93.size.height;
                }
              }
            }
          }
        }
        id v38 = [v5 countByEnumeratingWithState:&r2.size objects:v76 count:16];
      }
      while (v38);
    }
  }
LABEL_28:
  double v64 = x;
  double v65 = y;
  double v66 = width;
  double v67 = height;
  result.size.CGFloat height = v67;
  result.size.CGFloat width = v66;
  result.origin.CGFloat y = v65;
  result.origin.CGFloat x = v64;
  return result;
}

- (id)allLines
{
  id v3 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(THWPRep *)self columns];
  id v19 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v22;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v6 = (char *)[v5 countLines];
        if (v6)
        {
          id v7 = v6;
          for (j = 0; j != v7; ++j)
          {
            NSUInteger v9 = [v5 lineFragmentAtIndex:j];
            uint64_t v10 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", *v9, v9[1]);
            NSRange v11 = (TSWPStorage *)[(THWPRep *)self storage];
            id v12 = [(TSWPSelection *)v10 range];
            NSUInteger v14 = v13;
            v26.NSUInteger location = (NSUInteger)v12;
            v26.NSUInteger length = v14;
            THTrimHighlightRange(v11, v26);
            if (v15)
            {
              if (v5) {
                [v5 lineMetricsAtCharIndex:*v9 allowEndOfLine:0];
              }
              else {
                memset(v20, 0, sizeof(v20));
              }
              [v3 addObject:[THWPRepLine lineWithLineMetrics:v20]];
            }
          }
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v19);
  }
  return v3;
}

- (id)hitRep:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = self;
  -[THWPRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  if (!-[THWPRep hasMarginNoteAtCanvasPoint:](v5, "hasMarginNoteAtCanvasPoint:"))
  {
    v7.receiver = v5;
    v7.super_class = (Class)THWPRep;
    return -[THWPRep hitRep:](&v7, "hitRep:", x, y);
  }
  return v5;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)THWPRep;
  id result = -[THWPRep hitRep:withGesture:passingTest:](&v9, "hitRep:withGesture:passingTest:", a4, a5);
  if (!result)
  {
    -[THWPRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    if (-[THWPRep hasMarginNoteAtCanvasPoint:](self, "hasMarginNoteAtCanvasPoint:")) {
      return self;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (THMarginNotesController)marginNotesController
{
  id v2 = [(THWPRep *)self highlightController];

  return [(THWPHighlightController *)v2 marginNotesController];
}

- (void)addMarginNoteLayersToArray:(id)a3
{
  id v4 = [(THMarginNotesController *)[(THWPRep *)self marginNotesController] layers];

  [a3 addObjectsFromArray:v4];
}

- (BOOL)hasMarginNoteAtCanvasPoint:(CGPoint)a3
{
  [self marginNotesOwner].convertCanvasPointToOwnerPoint:a3.x, a3.y];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(THWPRep *)self marginNotesController];

  return -[THMarginNotesController hasMarginNoteAtPoint:](v8, "hasMarginNoteAtPoint:", v5, v7);
}

- (void)setupMarginNotesControllerForHighlightController:(id)a3
{
  NSUInteger v13 = objc_alloc_init(THMarginNotesController);
  [a3 setMarginNotesController:v13];
  CGFloat y = CGPointZero.y;
  objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "geometryInRoot"), "frame");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  int v10 = TSUPadUI();
  double v11 = 75.0;
  if (v10) {
    double v11 = 45.0;
  }
  CGFloat v12 = -v11;
  v15.origin.double x = CGPointZero.x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = v7;
  v15.size.CGFloat height = v9;
  CGRect v16 = CGRectInset(v15, v12, 0.0);
  -[THMarginNotesController setOwnerFrame:](v13, "setOwnerFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  [self canvas].viewScale;
  -[THMarginNotesController setOwnerScale:](v13, "setOwnerScale:");
}

- (void)viewScaleDidChange
{
  [self canvas].viewScale;
  [(THMarginNotesController *)[(THWPHighlightController *)[(THWPRep *)self highlightController] marginNotesController] setOwnerScale:v3];
  v4.receiver = self;
  v4.super_class = (Class)THWPRep;
  [(THWPRep *)&v4 viewScaleDidChange];
}

- (id)marginNoteForAnnotation:(id)a3 inRep:(id)a4 highlightBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  if (a4 != self) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPRep marginNoteForAnnotation:inRep:highlightBounds:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPRep.mm") lineNumber:528 description:@"Creating margin note for foreign rep."];
  }
  id v11 = objc_alloc_init((Class)AEMarginNote);
  [v11 setAnnotation:a3];
  [v11 setSide:0];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRectGetMinY(v14);
  [self canvas].contentsScale;
  TSDRoundForScale();
  [v11 setYStart:];
  [v11 setTheme:[a3 theme]];

  return v11;
}

- (void)showEditorForMarginNote:(id)a3
{
  objc_super v4 = [(THWPRep *)self highlightController];

  [(THWPHighlightController *)v4 showNoteEditorForMarginNote:a3];
}

- (id)overlayLayers
{
  v7.receiver = self;
  v7.super_class = (Class)THWPRep;
  double v3 = +[NSMutableArray arrayWithArray:[(THWPRep *)&v7 overlayLayers]];
  mLinkPulseArrayController = self->mLinkPulseArrayController;
  if (mLinkPulseArrayController)
  {
    id v5 = [(TSKHighlightArrayController *)mLinkPulseArrayController layers];
    if ([v5 count])
    {
      [(THWPRep *)self p_updatePulseLayerPositions];
      [v5 makeObjectsPerformSelector:@"setDelegate:" withObject:[self interactiveCanvasController]];
      [(NSMutableArray *)v3 addObjectsFromArray:v5];
    }
  }
  return v3;
}

- (void)pulseAnimationDidStop:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWPRep;
  -[THWPRep pulseAnimationDidStop:](&v5, "pulseAnimationDidStop:");
  if (self->mLinkPulseArrayController == a3)
  {
    if ([a3 autohide])
    {
      [(THWPRep *)self p_setLinkPulseControllerActive:0 autohide:0];
      [(THWPRep *)self p_updateLinkLayersForRangeSelection:[(THWPRep *)self selection] withAnimatingPulse:0];
      [(THWPRep *)self invalidateKnobs];
      [self interactiveCanvasController].layoutInvalidated;
    }
  }
}

- (void)processFindUIStateChangedNotificationUserInfo:(id)a3
{
  if (a3 && [a3 objectForKey:@"THMessageIsForTHWPRep"])
  {
    id v5 = [[a3 objectForKey:TSKSearchReferencesToHighlightKey] objectForKey:[self storage]];
    if (v5)
    {
      double v6 = +[NSArray arrayWithArray:v5];
      [(THWPRep *)self setLinkPulseSearchReferences:v6];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)THWPRep;
    [(THWPRep *)&v7 processFindUIStateChangedNotificationUserInfo:a3];
  }
}

- (void)updateFromLayout
{
  v7.receiver = self;
  v7.super_class = (Class)THWPRep;
  [(THWPRep *)&v7 updateFromLayout];
  if ([(THWPRep *)self linkPulseSearchReferences])
  {
    [(THWPRep *)self p_setLinkPulseControllerActive:1 autohide:1];
    [(THWPRep *)self setLinkPulseActivationTime:CACurrentMediaTime()];
    [self p_updateLinkForSelection:[-[NSArray objectAtIndex:](-[THWPRep linkPulseSearchReferences](self, "linkPulseSearchReferences"), "objectAtIndex:", 0), "selection"] withAnimatingPulse:1 selectionFlags:0];
  }
  else if (self->mLinkPulseArrayController)
  {
    [(THWPRep *)self linkPulseActivationTime];
    if (v4 != 0.0)
    {
      double v5 = CACurrentMediaTime();
      [(THWPRep *)self linkPulseActivationTime];
      if (v5 - v6 > 0.1)
      {
        [(TSKHighlightArrayController *)self->mLinkPulseArrayController disconnect];
        [(TSKHighlightArrayController *)self->mLinkPulseArrayController reset];

        self->mLinkPulseArrayController = 0;
      }
    }
  }
  [(THWPRep *)self setLinkPulseSearchReferences:0];
  double v3 = [(THWPRep *)self highlightController];
  if (v3) {
    [(THWPHighlightController *)v3 updateFromLayout];
  }
}

- (void)p_setLinkPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  mLinkPulseArrayController = self->mLinkPulseArrayController;
  if (a3)
  {
    BOOL v6 = a4;
    if (!mLinkPulseArrayController)
    {
      mLinkPulseArrayController = (TSKHighlightArrayController *)[objc_alloc((Class)TSKHighlightArrayController) initWithZOrder:self delegate:4.0];
      self->mLinkPulseArrayController = mLinkPulseArrayController;
    }
    [(TSKHighlightArrayController *)mLinkPulseArrayController setShouldPulsate:0];
    objc_super v7 = self->mLinkPulseArrayController;
    [(TSKHighlightArrayController *)v7 setAutohide:v6];
  }
  else if (mLinkPulseArrayController)
  {
    [(TSKHighlightArrayController *)mLinkPulseArrayController disconnect];
    [(TSKHighlightArrayController *)self->mLinkPulseArrayController reset];

    self->mLinkPulseArrayController = 0;
  }
}

- (void)p_updatePulseLayerPositions
{
  objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "geometryInRoot"), "frame");
  double v4 = v3;
  double v6 = v5;
  [(THWPRep *)self lastPositionInRoot];
  if (v8 != v4 || v7 != v6)
  {
    [(THWPRep *)self lastPositionInRoot];
    id v10 = [(TSKHighlightArrayController *)self->mLinkPulseArrayController layers];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      TSDSubtractPoints();
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          CGRect v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v15 position];
          TSDAddPoints();
          [v15 setPosition:];
        }
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  -[THWPRep setLastPositionInRoot:](self, "setLastPositionInRoot:", v4, v6);
}

- (void)p_updateLinkAnimationForSelection:(id)a3 withAnimatingPulse:(BOOL)a4
{
  BOOL v4 = a4;
  if (([(TSKHighlightArrayController *)self->mLinkPulseArrayController pulsating] & 1) == 0)
  {
    if ([a3 isValid])
    {
      uint64_t v7 = OBJC_IVAR___TSWPRep__updatingHighlights;
      if (!self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__updatingHighlights])
      {
        self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__updatingHighlights] = 1;
        id v8 = [(THWPRep *)self layout];
        if (v8)
        {
          [v8 transformInRoot];
        }
        else
        {
          long long v16 = 0u;
          long long v17 = 0u;
          long long v15 = 0u;
        }
        mLinkPulseArrayController = self->mLinkPulseArrayController;
        v14[0] = v15;
        v14[1] = v16;
        v14[2] = v17;
        [(TSKHighlightArrayController *)mLinkPulseArrayController setTransform:v14];
        [*(id *)&self->TSWPRep_opaque[OBJC_IVAR___TSDRep_mCanvas] viewScale];
        -[TSKHighlightArrayController setViewScale:](self->mLinkPulseArrayController, "setViewScale:");
        id v10 = [objc_alloc((Class)TSWPSearchReference) initWithStorage:[self storage] selection:a3];
        id v11 = [objc_alloc((Class)NSArray) initWithObjects:v10, 0];
        id v12 = [(THWPRep *)self p_lineSearchReferencesForSearchReferences:v11];
        objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "geometryInRoot"), "frame");
        -[THWPRep setLastPositionInRoot:](self, "setLastPositionInRoot:");
        uint64_t v13 = self->mLinkPulseArrayController;
        [self canvas].contentsScale;
        -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v13, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v12);

        if (v4) {
          [(TSKHighlightArrayController *)self->mLinkPulseArrayController startAnimating];
        }
        [(THWPRep *)self p_setSelectionLineLayersHidden:1];
        self->TSWPRep_opaque[v7] = 0;
      }
    }
  }
}

- (void)p_updateLinkLayersForRangeSelection:(id)a3 withAnimatingPulse:(BOOL)a4
{
  if (self->mLinkPulseArrayController) {
    [(THWPRep *)self p_updateLinkAnimationForSelection:a3 withAnimatingPulse:a4];
  }
}

- (void)p_updateLinkForSelection:(id)a3 withAnimatingPulse:(BOOL)a4 selectionFlags:(unsigned int)a5
{
  BOOL v5 = a4;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = +[TSUAssertionHandler currentHandler];
      CGFloat v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPRep p_updateLinkForSelection:withAnimatingPulse:selectionFlags:]");
      id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPRep.mm"];
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      uint64_t v13 = (objc_class *)objc_opt_class();
      [v8 handleFailureInFunction:v9, v10, 751, @"%s expected %@, got %@", "-[THWPRep p_updateLinkForSelection:withAnimatingPulse:selectionFlags:]", v12, NSStringFromClass(v13) file lineNumber description];
    }
  }
  if (*(void *)&self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__caretLayer])
  {
    if (!self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__suppressSelectionHighlight])
    {
      [self layout].validate;
      if ([a3 isRange])
      {
        [(THWPRep *)self p_updateLinkLayersForRangeSelection:a3 withAnimatingPulse:v5];
      }
    }
  }
}

- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4 forCaret:(BOOL)a5
{
  BOOL v5 = a5;
  CGRect v23 = CGRectIntegral(a4);
  double v7 = 4.0;
  if (v5) {
    double v7 = 0.1;
  }
  CGRect v24 = CGRectInset(v23, -v7, -v7);
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  CGContextBeginTransparencyLayer(a3, 0);
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  uint64_t v13 = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGRect v14 = (CGColor *)TSUCGColorCreateDeviceRGB();
  long long v15 = (CGColor *)TSUCGColorCreateDeviceRGB();
  long long v16 = (const CGPath *)TSDCreateRoundRectPathForRectWithRadius();
  CGContextSaveGState(a3);
  v20.CGFloat width = 0.0;
  v20.CGFloat height = -1.0;
  CGContextSetShadowWithColor(a3, v20, 4.0, DeviceRGB);
  CGContextAddPath(a3, v16);
  CGContextSetFillColorWithColor(a3, v13);
  CGContextFillPath(a3);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  CGContextAddPath(a3, v16);
  CGContextSetStrokeColorWithColor(a3, v15);
  CGContextSetLineWidth(a3, 1.0);
  CGContextDrawPath(a3, kCGPathStroke);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  CFArrayRef v17 = (const __CFArray *)[objc_alloc((Class)NSArray) initWithObjects:v13, v14, 0];
  CGContextAddPath(a3, v16);
  CGContextClip(a3);
  long long v18 = CGGradientCreateWithColors(0, v17, 0);

  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  v22.CGFloat y = CGRectGetMaxY(v25);
  v21.CGFloat x = 0.0;
  v22.CGFloat x = 0.0;
  v21.CGFloat y = y;
  CGContextDrawLinearGradient(a3, v18, v21, v22, 0);
  CGGradientRelease(v18);
  CGContextRestoreGState(a3);
  CGColorRelease(DeviceRGB);
  CGColorRelease(v14);
  CGColorRelease(v13);
  CGColorRelease(v15);
  CGPathRelease(v16);

  CGContextEndTransparencyLayer(a3);
}

- (void)p_setSelectionLineLayersHidden:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = &self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__selectionLineLayers];
  [*(id *)v4 setHidden:];
  BOOL v5 = (void *)*((void *)v4 + 1);

  [v5 setHidden:v3];
}

- (id)p_lineSearchReferencesForSearchReferences:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  id v4 = 0;
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(a3);
        }
        id v6 = -[THWPRep p_lineSelectionsForSelection:](self, "p_lineSelectionsForSelection:", [*(id *)(*((void *)&v23 + 1) + 8 * v5) selection]);
        uint64_t v18 = v5;
        if (v6)
        {
          double v7 = v6;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v20;
            do
            {
              id v11 = 0;
              do
              {
                if (*(void *)v20 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
                if (!v4) {
                  id v4 = +[NSMutableArray array];
                }
                id v13 = [objc_alloc((Class)TSWPSearchReference) initWithStorage:[self storage] selection:v12];
                [v4 addObject:v13];

                id v11 = (char *)v11 + 1;
              }
              while (v9 != v11);
              id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v9);
          }
        }
        uint64_t v5 = v18 + 1;
      }
      while ((id)(v18 + 1) != v17);
      id v17 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }
  return v4;
}

- (id)p_lineSelectionsForSelection:(id)a3
{
  if (![a3 isRange]) {
    return 0;
  }
  if ([(THWPRep *)self p_isSelectionSingleAnchoredDrawableAttachment]) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(THWPRep *)self columns];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) lineSelectionsForSelection:a3];
      if (v11)
      {
        id v12 = v11;
        if (!v8) {
          id v8 = +[NSMutableArray array];
        }
        [v8 addObjectsFromArray:v12];
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v7);
  return v8;
}

- (BOOL)p_isSelectionSingleAnchoredDrawableAttachment
{
  id v2 = [(THWPRep *)self textEditor];

  return [v2 isSelectionSingleAnchoredDrawableAttachment];
}

- (BOOL)p_shouldStartEditingOnPress
{
  return 0;
}

- (BOOL)p_shouldStartEditingOnLongPress
{
  return 1;
}

- (void)p_enumerateBoundsRectsForRange:(_NSRange)a3 includeSpaceBefore:(BOOL)a4 includeSpaceAfter:(BOOL)a5 includeLeading:(BOOL)a6 withBlock:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length);

  [(THWPRep *)self p_enumerateBoundsRectsForSelection:v12 includeSpaceBefore:v10 includeSpaceAfter:v9 includeLeading:v8 withBlock:a7];
}

- (void)p_enumerateBoundsRectsForSelection:(id)a3 includeSpaceBefore:(BOOL)a4 includeSpaceAfter:(BOOL)a5 includeLeading:(BOOL)a6 withBlock:(id)a7
{
  BOOL v24 = a5;
  BOOL v25 = a6;
  BOOL v23 = a4;
  if (a3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(THWPRep *)self columns];
    id v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v12);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v14 = [a3 range];
          LOWORD(v21) = 0;
          id v16 = [v13 rectsForSelectionRange:v14 selectionType:v15 includeSpaceAfter:[a3 type] includeSpaceBefore:v24 includeLeading:v23 forParagraphMode:v25 includeRuby:v21];
          id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v27;
            do
            {
              long long v20 = 0;
              do
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v16);
                }
                [*(id *)(*((void *)&v26 + 1) + 8 * (void)v20) CGRectValue];
                (*((void (**)(id))a7 + 2))(a7);
                long long v20 = (char *)v20 + 1;
              }
              while (v18 != v20);
              id v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v18);
          }
          id v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        id v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }
  }
}

- (CGRect)boundsRectForSelection:(id)a3
{
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x5012000000;
  id v16 = sub_A303C;
  id v17 = nullsub_20;
  id v18 = &unk_41622E;
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v20 = size;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_A304C;
  v12[3] = &unk_458C10;
  v12[4] = &v13;
  [(THWPRep *)self p_enumerateBoundsRectsForSelection:a3 includeSpaceBefore:0 includeSpaceAfter:0 includeLeading:0 withBlock:v12];
  double v4 = v14[6];
  double v5 = v14[7];
  double v6 = v14[8];
  double v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  if ([(THWPRep *)self highlightController])
  {
    double v5 = [(THWPRep *)self highlightController];
    [self interactiveCanvasController].visibleBoundsRect;
    if (-[THWPHighlightController needsToRedrawForVisibleBounds:](v5, "needsToRedrawForVisibleBounds:")) {
      [self interactiveCanvasController].layoutInvalidated;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)THWPRep;
  [(THWPRep *)&v10 visibleBoundsForTilingLayer:a3];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (void)setHighlightController:(id)a3
{
}

- (NSArray)activeHighlightLayers
{
  return self->mActiveHighlightLayers;
}

- (void)setActiveHighlightLayers:(id)a3
{
}

- (CGPoint)lastPositionInRoot
{
  double x = self->mLastPositionInRoot.x;
  double y = self->mLastPositionInRoot.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPositionInRoot:(CGPoint)a3
{
  self->mLastPositionInRoot = a3;
}

- (BOOL)hasBeenRemovedFromCanvas
{
  return self->_hasBeenRemovedFromCanvas;
}

- (NSArray)linkPulseSearchReferences
{
  return self->_linkPulseSearchReferences;
}

- (void)setLinkPulseSearchReferences:(id)a3
{
}

- (double)linkPulseActivationTime
{
  return self->_linkPulseActivationTime;
}

- (void)setLinkPulseActivationTime:(double)a3
{
  self->_linkPulseActivationTime = a3;
}

@end