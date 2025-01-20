@interface TSWPTextHostRep
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)doesRepContainSearchReference:(id)a3;
- (BOOL)useFindOverlayers;
- (CGPath)newPathForSearchReference:(id)a3;
- (NSArray)searchReferences;
- (TSKHighlightArrayController)highlightArrayController;
- (TSKHighlightArrayController)pulseArrayController;
- (TSKSearchReference)activeSearchReference;
- (TSWPTextHostRep)initWithLayout:(id)a3 canvas:(id)a4;
- (id)childReps;
- (id)hitRep:(CGPoint)a3;
- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5;
- (id)lineSearchReferencesForSearchReference:(id)a3;
- (id)overlayLayers;
- (void)dealloc;
- (void)drawTextBackground:(CGContext *)a3 insetRect:(CGRect)a4 pulsating:(BOOL)a5;
- (void)p_activeFindHighlightChangedNotification:(id)a3;
- (void)p_findUIStateChangedNotification:(id)a3;
- (void)p_setActiveSearchReference:(id)a3;
- (void)p_setSearchReferencesToHighlight:(id)a3;
- (void)pulseAnimationDidStop:(id)a3;
- (void)selectChildRep:(id)a3;
- (void)setActiveSearchReference:(id)a3;
- (void)setHighlightArrayController:(id)a3;
- (void)setPulseArrayController:(id)a3;
- (void)setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4;
- (void)setSearchReferences:(id)a3;
- (void)updateChildrenFromLayout;
- (void)updateFindAnimationWithAnimatingPulse:(BOOL)a3;
- (void)updateHighlights;
- (void)willBeRemoved;
@end

@implementation TSWPTextHostRep

- (TSWPTextHostRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPTextHostRep;
  v5 = -[TSDRep initWithLayout:canvas:](&v8, sel_initWithLayout_canvas_, a3);
  if (v5 && [a4 isCanvasInteractive])
  {
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_p_activeFindHighlightChangedNotification_, @"TSKActiveFindHighlightChangedNotification", -[TSDRep interactiveCanvasController](v5, "interactiveCanvasController"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_p_findUIStateChangedNotification_, @"TSKFindUIStateChanged", -[TSDRep interactiveCanvasController](v5, "interactiveCanvasController"));
    [(TSWPTextHostRep *)v5 p_setActiveSearchReference:[(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSDRep *)v5 interactiveCanvasController] documentRoot] activeSearchReference]];
    [(TSWPTextHostRep *)v5 p_setSearchReferencesToHighlight:[(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSDRep *)v5 interactiveCanvasController] documentRoot] searchReferencesToHighlight]];
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(TSDRep *)self->_editingRep setParentRep:0];

  self->_editingRep = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextHostRep;
  [(TSDRep *)&v3 dealloc];
}

- (void)willBeRemoved
{
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:@"TSKActiveFindHighlightChangedNotification" object:0];
    [v3 removeObserver:self name:@"TSKFindUIStateChanged" object:0];
  }
}

- (void)updateChildrenFromLayout
{
  objc_super v3 = (TSDLayout *)[(TSDLayout *)[(TSDRep *)self layout] editingShapeLayout];
  v4 = [(TSDRep *)self->_editingRep layout];
  editingRep = self->_editingRep;
  if (v4 != v3)
  {
    [(TSDRep *)editingRep setParentRep:0];

    editingRep = 0;
    self->_editingRep = 0;
  }
  if (editingRep) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    v7 = (TSWPShapeRep *)objc_msgSend(objc_alloc(-[TSDLayout repClassOverride](v3, "repClassOverride")), "initWithLayout:canvas:", v3, -[TSDRep canvas](self, "canvas"));
    self->_editingRep = v7;
    [(TSDRep *)v7 setParentRep:self];
    editingRep = self->_editingRep;
  }

  [(TSWPShapeRep *)editingRep updateChildrenFromLayout];
}

- (id)hitRep:(CGPoint)a3
{
  editingRep = self->_editingRep;
  if (!editingRep) {
    goto LABEL_6;
  }
  double x = a3.x;
  double y = a3.y;
  v5 = [(TSDAbstractLayout *)[(TSDRep *)editingRep layout] geometry];
  if (v5)
  {
    [(TSDLayoutGeometry *)v5 inverseTransform];
    float64x2_t v6 = v13;
    float64x2_t v7 = v14;
    float64x2_t v8 = v15;
  }
  else
  {
    float64x2_t v8 = 0uLL;
    float64x2_t v14 = 0u;
    float64x2_t v15 = 0u;
    float64x2_t v13 = 0u;
    float64x2_t v6 = 0uLL;
    float64x2_t v7 = 0uLL;
  }
  id result = [(TSWPShapeRep *)self->_editingRep hitRep:vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, y), v6, x))];
  a3.double x = x;
  a3.double y = y;
  if (!result)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)TSWPTextHostRep;
    return -[TSDRep hitRep:](&v12, sel_hitRep_, a3.x, a3.y);
  }
  return result;
}

- (id)childReps
{
  v3[1] = *MEMORY[0x263EF8340];
  if (!self->_editingRep) {
    return 0;
  }
  v3[0] = self->_editingRep;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)selectChildRep:(id)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPTextHostRep selectChildRep:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextHostRep.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:154 description:@"can't select children of a text editing host rep"];
}

- (void)setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    if (![(TSWPTextHostRep *)self pulseArrayController]) {
      self->_pulseArrayController = [[TSKHighlightArrayController alloc] initWithZOrder:self delegate:8.0];
    }
    [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] setShouldPulsate:1];
    [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] setAutohide:v5];
    float64x2_t v6 = [(TSDRep *)self layout];
    if (v6)
    {
      [(TSDAbstractLayout *)v6 transformInRoot];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v10 = 0u;
    }
    float64x2_t v7 = [(TSWPTextHostRep *)self pulseArrayController];
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    [(TSKHighlightArrayController *)v7 setTransform:v9];
    [(TSDCanvas *)self->super.mCanvas viewScale];
    [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] setViewScale:v8];
  }
  else
  {
    -[TSWPTextHostRep setPulseArrayController:](self, "setPulseArrayController:", 0, a4);
  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  return 0;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  return 0;
}

- (void)pulseAnimationDidStop:(id)a3
{
  if ([(TSWPTextHostRep *)self pulseArrayController] == a3)
  {
    if ([(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] autohide])
    {
      [(TSWPTextHostRep *)self setPulseControllerActive:0 autohide:0];
      [(TSDRep *)self invalidateKnobs];
      [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layoutInvalidated];
    }
    uint64_t v4 = [(TSWPTextHostRep *)self activeSearchReference];
    [(TSKSearchReference *)v4 setPulseHighlight:0];
  }
}

- (BOOL)doesRepContainSearchReference:(id)a3
{
  return 1;
}

- (void)p_activeFindHighlightChangedNotification:(id)a3
{
  -[TSWPTextHostRep p_setActiveSearchReference:](self, "p_setActiveSearchReference:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"TSKActiveSearchReferenceKey"));
  uint64_t v4 = [(TSDRep *)self canvas];

  [(TSDCanvas *)v4 invalidateLayers];
}

- (void)p_setActiveSearchReference:(id)a3
{
  if (a3 && -[TSWPTextHostRep doesRepContainSearchReference:](self, "doesRepContainSearchReference:"))
  {
    if (([(TSKSearchReference *)[(TSWPTextHostRep *)self activeSearchReference] isEqual:a3] & 1) == 0)
    {
      [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] stop];
      -[TSWPTextHostRep setPulseControllerActive:autohide:](self, "setPulseControllerActive:autohide:", 1, [a3 autohideHighlight]);
      [(TSWPTextHostRep *)self setActiveSearchReference:a3];
      uint64_t v5 = [a3 pulseHighlight];
      [(TSWPTextHostRep *)self updateFindAnimationWithAnimatingPulse:v5];
    }
  }
  else
  {
    [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] stop];
    [(TSWPTextHostRep *)self setPulseControllerActive:0 autohide:0];
    [(TSWPTextHostRep *)self setActiveSearchReference:0];
  }
}

- (void)p_findUIStateChangedNotification:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"TSWPSearchReferencesToHighlightKey");

  [(TSWPTextHostRep *)self p_setSearchReferencesToHighlight:v4];
}

- (void)p_setSearchReferencesToHighlight:(id)a3
{
  uint64_t v4 = (NSArray *)objc_msgSend(a3, "objectForKeyedSubscript:", -[TSDRep info](self, "info"));
  if ([(TSWPTextHostRep *)self searchReferences] != v4)
  {
    [(TSWPTextHostRep *)self setSearchReferences:v4];
    [(TSWPTextHostRep *)self updateHighlights];
  }
}

- (void)updateFindAnimationWithAnimatingPulse:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] pulsating])
  {
    if ([(TSWPTextHostRep *)self activeSearchReference])
    {
      id v5 = [(TSWPTextHostRep *)self lineSearchReferencesForSearchReference:[(TSWPTextHostRep *)self activeSearchReference]];
      [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] reset];
      float64x2_t v6 = [(TSWPTextHostRep *)self pulseArrayController];
      [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
      -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v6, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v5);
      if (v3)
      {
        float64x2_t v7 = [(TSWPTextHostRep *)self pulseArrayController];
        [(TSKHighlightArrayController *)v7 startAnimating];
      }
    }
  }
}

- (id)lineSearchReferencesForSearchReference:(id)a3
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = a3;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
}

- (void)updateHighlights
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(NSArray *)[(TSWPTextHostRep *)self searchReferences] count])
  {
    if (![(TSWPTextHostRep *)self highlightArrayController]) {
      self->_highlightArrayController = [[TSKHighlightArrayController alloc] initWithZOrder:self delegate:3.0];
    }
    BOOL v3 = [(TSDRep *)self layout];
    if (v3)
    {
      [(TSDAbstractLayout *)v3 transformInRoot];
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
    }
    uint64_t v4 = [(TSWPTextHostRep *)self highlightArrayController];
    v18[0] = v19;
    v18[1] = v20;
    v18[2] = v21;
    [(TSKHighlightArrayController *)v4 setTransform:v18];
    [(TSDCanvas *)self->super.mCanvas viewScale];
    [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self highlightArrayController] setViewScale:v5];
    [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self highlightArrayController] reset];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    float64x2_t v6 = [(TSWPTextHostRep *)self searchReferences];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = [(TSWPTextHostRep *)self highlightArrayController];
          v22 = v11;
          uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
          [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
          objc_msgSend(v11, "setFindHighlights:", -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v12, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v13));
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v23 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(TSWPTextHostRep *)self setHighlightArrayController:0];
  }
}

- (BOOL)useFindOverlayers
{
  return 1;
}

- (id)overlayLayers
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPTextHostRep;
  BOOL v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDRep overlayLayers](&v7, sel_overlayLayers));
  if ([(TSWPTextHostRep *)self useFindOverlayers])
  {
    uint64_t v4 = [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self highlightArrayController] layers];
    if ([(NSArray *)v4 count])
    {
      [(NSArray *)v4 makeObjectsPerformSelector:sel_setDelegate_ withObject:[(TSDRep *)self interactiveCanvasController]];
      [v3 addObjectsFromArray:v4];
    }
    double v5 = [(TSKHighlightArrayController *)[(TSWPTextHostRep *)self pulseArrayController] layers];
    if ([(NSArray *)v5 count])
    {
      [(NSArray *)v5 makeObjectsPerformSelector:sel_setDelegate_ withObject:[(TSDRep *)self interactiveCanvasController]];
      [v3 addObjectsFromArray:v5];
    }
  }
  return v3;
}

- (void)drawTextBackground:(CGContext *)a3 insetRect:(CGRect)a4 pulsating:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v20[2] = *MEMORY[0x263EF8340];
  CGContextBeginTransparencyLayer(a3, 0);
  CGContextSaveGState(a3);
  long long v11 = (void *)[MEMORY[0x263F7C808] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  long long v12 = v11;
  if (v5)
  {
    uint64_t v13 = (void *)[MEMORY[0x263F7C808] colorWithRed:0.960784316 green:0.917647064 blue:0.184313729 alpha:1.0];
    long long v14 = (void *)[MEMORY[0x263F7C808] colorWithRed:0.941176474 green:0.776470602 blue:0.156862751 alpha:1.0];
    v20[0] = [v13 CGColor];
    v20[1] = [v14 CGColor];
    long long v15 = CGGradientCreateWithColors(0, (CFArrayRef)[MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2], 0);
    long long v16 = TSDCreateRoundRectPathForRectWithRadius(x, y, width, height, 3.0);
    if (v12)
    {
      CGContextSaveGState(a3);
      long long v17 = (CGColor *)[v12 CGColor];
      v21.CGFloat width = 0.0;
      v21.CGFloat height = -1.0;
      CGContextSetShadowWithColor(a3, v21, 2.0, v17);
      CGContextAddPath(a3, v16);
      CGContextSetFillColorWithColor(a3, (CGColorRef)[v13 CGColor]);
      CGContextFillPath(a3);
      CGContextRestoreGState(a3);
    }
    CGContextAddPath(a3, v16);
    CGContextClip(a3);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v25);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    v24.CGFloat y = CGRectGetMaxY(v26);
    v22.CGFloat x = 0.0;
    v24.CGFloat x = 0.0;
    v22.CGFloat y = MinY;
    CGContextDrawLinearGradient(a3, v15, v22, v24, 0);
    CGGradientRelease(v15);
    CGPathRelease(v16);
  }
  else
  {
    long long v19 = (CGColor *)[v11 CGColor];
    v23.CGFloat width = 0.0;
    v23.CGFloat height = -1.0;
    CGContextSetShadowWithColor(a3, v23, 2.0, v19);
    CGContextSetRGBFillColor(a3, 1.0, 1.0, 1.0, 1.0);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGContextFillRect(a3, v27);
  }
  CGContextRestoreGState(a3);
  CGContextEndTransparencyLayer(a3);
}

- (TSKHighlightArrayController)pulseArrayController
{
  return self->_pulseArrayController;
}

- (void)setPulseArrayController:(id)a3
{
}

- (TSKHighlightArrayController)highlightArrayController
{
  return self->_highlightArrayController;
}

- (void)setHighlightArrayController:(id)a3
{
}

- (TSKSearchReference)activeSearchReference
{
  return self->_activeSearchReference;
}

- (void)setActiveSearchReference:(id)a3
{
}

- (NSArray)searchReferences
{
  return self->_searchReferences;
}

- (void)setSearchReferences:(id)a3
{
}

@end