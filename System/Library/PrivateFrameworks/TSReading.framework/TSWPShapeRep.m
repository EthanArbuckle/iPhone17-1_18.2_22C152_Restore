@interface TSWPShapeRep
- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3;
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3;
- (BOOL)isDraggable;
- (BOOL)isEditingChildRep;
- (BOOL)isInvisible;
- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3;
- (BOOL)p_shouldShowTextOverflowGlyph;
- (BOOL)shapeLayoutShouldUpdateInstructionalText:(id)a3;
- (BOOL)shouldIgnoreEditMenuTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsToHandleTapsOnContainingGroup;
- (BOOL)wantsToHandleTapsWhenLocked;
- (TSDContainerInfo)containerInfo;
- (TSWPRep)containedRep;
- (TSWPShapeRep)initWithLayout:(id)a3 canvas:(id)a4;
- (double)pParagraphAlignmentOffset;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)additionalLayersOverLayer;
- (id)childReps;
- (id)hitRep:(CGPoint)a3;
- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4;
- (id)hyperlinkRegions;
- (id)overlayLayers;
- (id)p_overflowKnobImage;
- (int)dragTypeAtCanvasPoint:(CGPoint)a3;
- (unint64_t)enabledKnobMask;
- (void)dealloc;
- (void)p_resetOverflowGlyphLayerIfNecessary;
- (void)processChangedProperty:(int)a3;
- (void)shapeLayoutDidChangeContainedStorage:(id)a3;
- (void)updateChildrenFromLayout;
- (void)willBeRemoved;
- (void)willBeginEditingContainedRep;
- (void)willEndEditingContainedRep;
@end

@implementation TSWPShapeRep

- (TSWPShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  objc_opt_class();
  if (!TSUDynamicCast())
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPShapeRep initWithLayout:canvas:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeRep.mm"), 69, @"bad layout class");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSWPShapeRep;
  v9 = [(TSDShapeRep *)&v12 initWithLayout:a3 canvas:a4];
  v10 = v9;
  if (v9) {
    [(TSDLayout *)[(TSDRep *)v9 layout] setDelegate:v9];
  }
  return v10;
}

- (void)dealloc
{
  *(void *)&self->_editingContainedRep = 0;
  [(CALayer *)self->_overflowGlyphLayer setParentRep:0];

  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeRep;
  [(TSDStyledRep *)&v3 dealloc];
}

- (void)updateChildrenFromLayout
{
  uint64_t v3 = [(CALayer *)self->_overflowGlyphLayer layout];
  uint64_t v4 = [(TSDLayout *)[(TSDRep *)self layout] containedLayout];
  overflowGlyphLayer = self->_overflowGlyphLayer;
  if (v3 == v4)
  {
    if (overflowGlyphLayer) {
      goto LABEL_5;
    }
  }
  else
  {
    [(CALayer *)overflowGlyphLayer setParentRep:0];

    self->_overflowGlyphLayer = 0;
  }
  v6 = (CALayer *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)-[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), "repClassOverride")), "initWithLayout:canvas:", -[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), -[TSDRep canvas](self, "canvas"));
  self->_overflowGlyphLayer = v6;
  [(CALayer *)v6 setParentRep:self];
  overflowGlyphLayer = self->_overflowGlyphLayer;
LABEL_5:
  [(CALayer *)overflowGlyphLayer updateChildrenFromLayout];
}

- (void)willBeginEditingContainedRep
{
  *(&self->super.mShadowOnChildrenDisabled + 1) = 1;
  [(TSDLayout *)[(TSDRep *)self layout] createContainedLayoutForEditing];
  [(TSWPShapeRep *)self updateChildrenFromLayout];
  [(TSDStyledRep *)self setNeedsDisplay];
}

- (void)willEndEditingContainedRep
{
  if (!objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "containedStorage"), "length"))
  {
    [(TSDLayout *)[(TSDRep *)self layout] createContainedLayoutForInstructionalText];
    [(TSWPShapeRep *)self updateChildrenFromLayout];
    [(TSDStyledRep *)self setNeedsDisplay];
  }
  *(&self->super.mShadowOnChildrenDisabled + 1) = 0;
}

- (id)hitRep:(CGPoint)a3
{
  overflowGlyphLayer = self->_overflowGlyphLayer;
  if (!overflowGlyphLayer) {
    goto LABEL_6;
  }
  double x = a3.x;
  double y = a3.y;
  v5 = objc_msgSend((id)-[CALayer layout](overflowGlyphLayer, "layout"), "geometry");
  if (v5)
  {
    [v5 inverseTransform];
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
  id result = (id)[(CALayer *)self->_overflowGlyphLayer hitRep:vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, y), v6, x))];
  a3.double x = x;
  a3.double y = y;
  if (!result)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)TSWPShapeRep;
    return -[TSDRep hitRep:](&v12, sel_hitRep_, a3.x, a3.y);
  }
  return result;
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v21.receiver = self;
  v21.super_class = (Class)TSWPShapeRep;
  double y = a3.y;
  double x = a3.x;
  id v7 = -[TSDRep hitReps:withSlop:](&v21, sel_hitReps_withSlop_);
  if (v7)
  {
    overflowGlyphLayer = self->_overflowGlyphLayer;
    if (overflowGlyphLayer)
    {
      v9 = objc_msgSend((id)-[CALayer layout](overflowGlyphLayer, "layout"), "geometry");
      if (v9)
      {
        [v9 inverseTransform];
        float64x2_t v10 = v18;
        float64x2_t v11 = v19;
        float64x2_t v12 = v20;
      }
      else
      {
        float64x2_t v12 = 0uLL;
        float64x2_t v10 = 0uLL;
        float64x2_t v11 = 0uLL;
      }
      float64x2_t v13 = (void *)-[CALayer hitReps:withSlop:](self->_overflowGlyphLayer, "hitReps:withSlop:", vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, y), v10, x)), width, height);
      if ([v13 count])
      {
        float64x2_t v14 = (void *)[MEMORY[0x263EFF980] array];
        [v14 addObjectsFromArray:v13];
        [v14 addObjectsFromArray:v7];
        return v14;
      }
    }
  }
  return v7;
}

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  return -[CALayer dragTypeAtCanvasPoint:](self->_overflowGlyphLayer, "dragTypeAtCanvasPoint:", a3.x, a3.y);
}

- (BOOL)shouldIgnoreEditMenuTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  -[CALayer convertNaturalPointFromUnscaledCanvas:](self->_overflowGlyphLayer, "convertNaturalPointFromUnscaledCanvas:", a4, a3.x, a3.y);
  double v6 = v5;
  double v8 = v7;
  objc_opt_class();
  -[CALayer smartFieldAtPoint:](self->_overflowGlyphLayer, "smartFieldAtPoint:", v6, v8);
  return TSUDynamicCast() != 0;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[CALayer handleSingleTapAtPoint:](self->_overflowGlyphLayer, "handleSingleTapAtPoint:")) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeRep;
  return -[TSDRep handleSingleTapAtPoint:](&v7, sel_handleSingleTapAtPoint_, x, y);
}

- (BOOL)wantsToHandleTapsOnContainingGroup
{
  if ([(CALayer *)self->_overflowGlyphLayer wantsToHandleTapsOnContainingGroup]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return [(TSDRep *)&v4 wantsToHandleTapsOnContainingGroup];
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  if ([(CALayer *)self->_overflowGlyphLayer wantsToHandleTapsWhenLocked]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return [(TSDRep *)&v4 wantsToHandleTapsWhenLocked];
}

- (void)willBeRemoved
{
  [(TSDLayout *)[(TSDRep *)self layout] setDelegate:0];
  [*(id *)&self->_editingContainedRep setDelegate:0];

  *(void *)&self->_editingContainedRep = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeRep;
  [(TSDShapeRep *)&v3 willBeRemoved];
}

- (id)hyperlinkRegions
{
  objc_super v3 = (void *)[(CALayer *)self->_overflowGlyphLayer hyperlinkRegions];
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeRep;
  id result = [(TSDRep *)&v7 hyperlinkRegions];
  if (v3) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    return (id)[v3 arrayByAddingObjectsFromArray:result];
  }
  if (result) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    return v3;
  }
  return result;
}

- (BOOL)shouldShowSelectionHighlight
{
  if ([(TSWPRep *)[(TSWPShapeRep *)self containedRep] isEditing]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return [(TSDShapeRep *)&v4 shouldShowSelectionHighlight];
}

- (BOOL)shouldShowKnobs
{
  if ([(TSWPRep *)[(TSWPShapeRep *)self containedRep] isEditing]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return [(TSDRep *)&v4 shouldShowKnobs];
}

- (BOOL)p_shouldShowTextOverflowGlyph
{
  int v3 = [(TSDCanvas *)[(TSDRep *)self canvas] shouldShowTextOverflowGlyphs];
  if (v3)
  {
    if ([(TSDShapeRep *)self isEditingPath])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      int v3 = [(CALayer *)self->_overflowGlyphLayer isOverflowing];
      if (v3)
      {
        v5.receiver = self;
        v5.super_class = (Class)TSWPShapeRep;
        LOBYTE(v3) = [(TSDRep *)&v5 shouldShowKnobs];
      }
    }
  }
  return v3;
}

- (TSDContainerInfo)containerInfo
{
  [(TSDRep *)self info];
  return (TSDContainerInfo *)TSUProtocolCast();
}

- (id)childReps
{
  v3[1] = *MEMORY[0x263EF8340];
  if (!self->_overflowGlyphLayer) {
    return 0;
  }
  v3[0] = self->_overflowGlyphLayer;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if (*(id *)&self->_editingContainedRep == a3 && [a4 isEqualToString:@"position"])
  {
    objc_super v7 = (void *)MEMORY[0x263EFF9D0];
    return (id)[v7 null];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSWPShapeRep;
    return [(TSDStyledRep *)&v9 actionForLayer:a3 forKey:a4];
  }
}

- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3
{
  if ([(TSDStyledRep *)self shadowLayer] != a3
    && [(TSDStyledRep *)self reflectionLayer] != a3)
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPShapeRep mustDrawTilingLayerOnMainThread:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeRep.mm"), 347, @"image rep's tiling layer delegate being called for wrong layer");
  }
  return -[TSDInteractiveCanvasController allowLayoutAndRenderOnThread](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "allowLayoutAndRenderOnThread")|| objc_msgSend((id)objc_msgSend((id)-[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), "info"), "length") != 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] editorController] currentEditors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      float64x2_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (objc_opt_respondsToSelector())
      {
        int v11 = [v10 canBeginEditingRepOnDoubleTap:self];
        if (!v11) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if (self->_overflowGlyphLayer == a3)
    {
      int v11 = [(TSDLayout *)[(TSDRep *)self layout] isInTopLevelContainerForEditing];
      if (!v11) {
        return v11;
      }
      if ((!objc_msgSend(-[TSDRep info](self, "info"), "owningAttachment")
         || (int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "owningAttachment"), "parentStorage"), "wpKind") <= 2)&& (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment") & 1) == 0)
      {
        LOBYTE(v11) = ![(TSDRep *)self isLocked];
        return v11;
      }
    }
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void)p_resetOverflowGlyphLayerIfNecessary
{
  if (*(void *)&self->_editingContainedRep)
  {
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    double v4 = v3;
    [*(id *)&self->_editingContainedRep contentsScale];
    id v5 = *(void **)&self->_editingContainedRep;
    if (v4 == v6)
    {
      if (v5) {
        return;
      }
    }
    else
    {

      *(void *)&self->_editingContainedRep = 0;
    }
  }
  id v7 = [(TSWPShapeRep *)self p_overflowKnobImage];
  *(void *)&self->_editingContainedRep = objc_alloc_init(MEMORY[0x263F157E8]);
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  objc_msgSend(*(id *)&self->_editingContainedRep, "setContents:", objc_msgSend(v7, "CGImageForContentsScale:"));
  [v7 size];
  [*(id *)&self->_editingContainedRep setBounds:TSDRectWithSize()];
  uint64_t v8 = *(void **)&self->_editingContainedRep;
  [v8 setDelegate:self];
}

- (id)overlayLayers
{
  v25.receiver = self;
  v25.super_class = (Class)TSWPShapeRep;
  id v3 = (id)objc_msgSend(-[TSDShapeRep overlayLayers](&v25, sel_overlayLayers), "mutableCopy");
  if ([(TSWPShapeRep *)self p_shouldShowTextOverflowGlyph]
    && [(TSDRep *)self isSelectedIgnoringLocking])
  {
    [(TSWPShapeRep *)self p_resetOverflowGlyphLayerIfNecessary];
    double v4 = [(TSDRep *)self interactiveCanvasController];
    [(TSDRep *)self boundsForStandardKnobs];
    [(TSDRep *)self convertNaturalPointToUnscaledCanvas:TSDPositionOfKnobOnRectangle(8, v5, v6, v7, v8)];
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v4, "convertUnscaledToBoundsPoint:");
    double v10 = v9;
    double v12 = v11;
    [*(id *)&self->_editingContainedRep bounds];
    double v17 = TSDCenterOfRect(v13, v14, v15, v16);
    double v18 = TSDSubtractPoints(v10, v12, v17);
    double v20 = v19;
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)v4 canvas] contentsScale];
    double v22 = TSDRoundedPointForScale(v18, v20, v21);
    objc_msgSend(*(id *)&self->_editingContainedRep, "setPosition:", TSDAddPoints(v22, v23, v17));
    [v3 addObject:*(void *)&self->_editingContainedRep];
  }
  return v3;
}

- (id)additionalLayersOverLayer
{
  v28.receiver = self;
  v28.super_class = (Class)TSWPShapeRep;
  id v3 = [(TSDShapeRep *)&v28 additionalLayersOverLayer];
  if ([(TSWPShapeRep *)self p_shouldShowTextOverflowGlyph]
    && ![(TSDRep *)self isSelectedIgnoringLocking])
  {
    if (v3) {
      id v4 = (id)[v3 mutableCopy];
    }
    else {
      id v4 = (id)[MEMORY[0x263EFF980] array];
    }
    id v3 = v4;
    [(TSWPShapeRep *)self p_resetOverflowGlyphLayerIfNecessary];
    double v5 = [(TSDRep *)self interactiveCanvasController];
    [(TSDRep *)self boundsForStandardKnobs];
    [(TSDRep *)self convertNaturalPointToUnscaledCanvas:TSDPositionOfKnobOnRectangle(8, v6, v7, v8, v9)];
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v5, "convertUnscaledToBoundsPoint:");
    double v11 = v10;
    double v13 = v12;
    [*(id *)&self->_editingContainedRep bounds];
    double v18 = TSDCenterOfRect(v14, v15, v16, v17);
    double v19 = TSDSubtractPoints(v11, v13, v18);
    double v21 = v20;
    if ([(TSDRep *)self parentRep])
    {
      [[(TSDRep *)self parentRep] layerFrameInScaledCanvas];
      double v19 = TSDSubtractPoints(v19, v21, v22);
      double v21 = v23;
    }
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)v5 canvas] contentsScale];
    double v25 = TSDRoundedPointForScale(v19, v21, v24);
    objc_msgSend(*(id *)&self->_editingContainedRep, "setPosition:", TSDAddPoints(v25, v26, v18));
    [v3 addObject:*(void *)&self->_editingContainedRep];
  }
  return v3;
}

- (BOOL)isDraggable
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeRep;
  unsigned int v3 = [(TSDShapeRep *)&v5 isDraggable];
  if (v3) {
    LOBYTE(v3) = objc_msgSend(-[TSDRep info](self, "info"), "isTextUserEditable");
  }
  return v3;
}

- (BOOL)isInvisible
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeRep;
  if ([(TSDShapeRep *)&v5 isInvisible]
    || (int v3 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "isInvisibleAutosizingShape")) != 0)
  {
    if (objc_msgSend((id)objc_msgSend((id)-[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), "info"), "length"))
    {
      LOBYTE(v3) = (objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "shadow"), "isEnabled") & 1) == 0
                && [(TSDStyledRep *)self reflection] == 0;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)processChangedProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case 146:
      goto LABEL_4;
    case 153:
      [(CALayer *)self->_overflowGlyphLayer verticalTextPropertyChanged];
      [(TSDRep *)self invalidateKnobs];
      break;
    case 149:
LABEL_4:
      [(CALayer *)self->_overflowGlyphLayer invalidateKnobs];
      [(CALayer *)self->_overflowGlyphLayer setNeedsDisplay];
      break;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeRep;
  [(TSDShapeRep *)&v5 processChangedProperty:v3];
}

- (id)p_overflowKnobImage
{
  v2 = (void *)MEMORY[0x263F7C858];
  uint64_t v3 = TSWPBundle();
  return (id)[v2 imageNamed:@"TSWPOverflowGlyph" inBundle:v3];
}

- (unint64_t)enabledKnobMask
{
  if ([(TSDLayout *)[(TSDRep *)self layout] autosizes])
  {
    if (objc_msgSend(-[TSDRep info](self, "info"), "textIsVertical")) {
      return 260;
    }
    else {
      return 80;
    }
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSWPShapeRep;
    return [(TSDShapeRep *)&v4 enabledKnobMask];
  }
}

- (double)pParagraphAlignmentOffset
{
  int v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "containedStorage"), "paragraphStyleAtParIndex:effectiveRange:", 0, 0), "intValueForProperty:", 86);
  if (v3 == 1) {
    return 1.0;
  }
  if (v3 == 2) {
    return 0.5;
  }
  double result = 0.0;
  if (v3 == 4)
  {
    int v5 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info", 0.0), "containedStorage"), "isWritingDirectionRightToLeftForParagraphAtParIndex:", 0);
    double result = 0.0;
    if (v5) {
      return 1.0;
    }
  }
  return result;
}

- (BOOL)isEditingChildRep
{
  return *(&self->super.mShadowOnChildrenDisabled + 1);
}

- (BOOL)shapeLayoutShouldUpdateInstructionalText:(id)a3
{
  return !*(&self->super.mShadowOnChildrenDisabled + 1);
}

- (void)shapeLayoutDidChangeContainedStorage:(id)a3
{
  if ([(TSDRep *)self texture] && self->super.super.super.mTextureDeliveryStyle) {
    [(TSDRep *)self setTexture:0];
  }
  if ([(TSDStyledRep *)self reflectionLayer])
  {
    objc_super v4 = [(TSDStyledRep *)self reflectionLayer];
    [(CALayer *)v4 setNeedsDisplay];
  }
}

- (TSWPRep)containedRep
{
  return (TSWPRep *)self->_overflowGlyphLayer;
}

@end