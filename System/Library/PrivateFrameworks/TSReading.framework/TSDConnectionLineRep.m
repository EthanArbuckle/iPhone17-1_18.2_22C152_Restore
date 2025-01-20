@interface TSDConnectionLineRep
+ (BOOL)canConnectToRep:(id)a3;
+ (id)infosToConnectFromSelection:(id)a3 withInteractiveCanvasController:(id)a4;
- (BOOL)canBeUsedForImageMask;
- (BOOL)canConnectToRep:(id)a3;
- (BOOL)canMakePathEditable;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)i_editMenuOverlapsEndKnobs;
- (BOOL)isDraggable;
- (BOOL)isSelectable;
- (BOOL)p_controlKnobVisible;
- (BOOL)p_isConnected;
- (BOOL)p_isConnectedToLockedObjects;
- (BOOL)shouldCreateKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldShowCommentHighlight;
- (BOOL)shouldShowSmartShapeKnobs;
- (CGPoint)i_dragOffset;
- (CGRect)targetRectForEditMenu;
- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4;
- (id)additionalRepsForDragging;
- (id)connectionLineLayout;
- (unint64_t)enabledKnobMask;
- (void)dealloc;
- (void)updateFromLayout;
@end

@implementation TSDConnectionLineRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineRep;
  [(TSDStyledRep *)&v3 dealloc];
}

- (id)connectionLineLayout
{
  objc_opt_class();
  [(TSDRep *)self layout];

  return (id)TSUDynamicCast();
}

+ (id)infosToConnectFromSelection:(id)a3 withInteractiveCanvasController:(id)a4
{
  v6 = (void *)[MEMORY[0x263EFF980] array];
  v7 = (void *)[a3 infos];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__TSDConnectionLineRep_infosToConnectFromSelection_withInteractiveCanvasController___block_invoke;
  v9[3] = &unk_2646B21D8;
  v9[4] = a4;
  v9[5] = v6;
  [v7 enumerateObjectsUsingBlock:v9];
  if ([v6 count] == 2) {
    return v6;
  }
  else {
    return 0;
  }
}

unint64_t __84__TSDConnectionLineRep_infosToConnectFromSelection_withInteractiveCanvasController___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unint64_t result = +[TSDConnectionLineRep canConnectToRep:](TSDConnectionLineRep, "canConnectToRep:", [*(id *)(a1 + 32) repForInfo:a2]);
  if (result)
  {
    [*(id *)(a1 + 40) addObject:a2];
    unint64_t result = [*(id *)(a1 + 40) count];
    if (result >= 3) {
      *a3 = 1;
    }
  }
  return result;
}

+ (BOOL)canConnectToRep:(id)a3
{
  objc_super v3 = (void *)[a3 repForSelecting];
  objc_opt_class();
  [v3 layout];
  if ([(id)TSUDynamicCast() pathIsLineSegment]) {
    goto LABEL_4;
  }
  int v4 = objc_msgSend((id)objc_msgSend(v3, "layout"), "allowsConnections");
  if (v4)
  {
    if (objc_msgSend((id)objc_msgSend(v3, "info"), "isAnchoredToText"))
    {
LABEL_4:
      LOBYTE(v4) = 0;
      return v4;
    }
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v3, "info"), "isInlineWithText") ^ 1;
  }
  return v4;
}

- (BOOL)canConnectToRep:(id)a3
{
  int v4 = (TSDConnectionLineRep *)[a3 repForSelecting];
  if (v4 == self)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v5 = v4;
    BOOL v6 = +[TSDConnectionLineRep canConnectToRep:v4];
    if (v6)
    {
      v7 = [(TSDAbstractLayout *)[(TSDRep *)v5 layout] parent];
      LOBYTE(v6) = v7 == [(TSDAbstractLayout *)[(TSDRep *)self layout] parent];
    }
  }
  return v6;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  int v3 = objc_msgSend((id)objc_msgSend(-[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout"), "connectedPathSource"), "type");
  BOOL v4 = [(TSDConnectionLineRep *)self shouldCreateKnobs];
  if (v3 == 1 || !v4)
  {
    if (!v4) {
      return v4;
    }
  }
  else
  {
    [(TSDRep *)self boundsForStandardKnobs];
    double v7 = v6;
    double v9 = v8;
    [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
    double v11 = TSDMultiplySizeScalar(v7, v9, v10);
    *(float *)&double v11 = v12 * v12 + v11 * v11;
    if (sqrtf(*(float *)&v11) < 60.0) {
      goto LABEL_11;
    }
  }
  if (![(TSDRep *)self isPlaceholder])
  {
    v14.receiver = self;
    v14.super_class = (Class)TSDConnectionLineRep;
    if (([(TSDShapeRep *)&v14 enabledKnobMask] & 0x800) != 0)
    {
      LOBYTE(v4) = ![(TSDRep *)self isLocked];
      return v4;
    }
  }
LABEL_11:
  LOBYTE(v4) = 0;
  return v4;
}

- (BOOL)shouldCreateKnobs
{
  id v2 = [(TSDConnectionLineRep *)self connectionLineLayout];
  if ([v2 isInvisible]) {
    return 0;
  }

  return [v2 validLine];
}

- (BOOL)shouldShowCommentHighlight
{
  id v3 = [(TSDConnectionLineRep *)self connectionLineLayout];
  if ([v3 isInvisible])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 validLine];
    if (v4)
    {
      v6.receiver = self;
      v6.super_class = (Class)TSDConnectionLineRep;
      LOBYTE(v4) = [(TSDRep *)&v6 shouldShowCommentHighlight];
    }
  }
  return v4;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(TSDConnectionLineRep *)self connectionLineLayout];
  if ([v6 isInvisible])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = [v6 validLine];
    if (v7)
    {
      v9.receiver = self;
      v9.super_class = (Class)TSDConnectionLineRep;
      LOBYTE(v7) = -[TSDShapeRep containsPoint:](&v9, sel_containsPoint_, x, y);
    }
  }
  return v7;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(TSDConnectionLineRep *)self connectionLineLayout];
  double v9 = 3.40282347e38;
  if (([v8 isInvisible] & 1) == 0 && objc_msgSend(v8, "validLine"))
  {
    v12.receiver = self;
    v12.super_class = (Class)TSDConnectionLineRep;
    -[TSDShapeRep shortestDistanceToPoint:countAsHit:](&v12, sel_shortestDistanceToPoint_countAsHit_, a4, x, y);
    return v10;
  }
  return v9;
}

- (unint64_t)enabledKnobMask
{
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineRep;
  unint64_t v3 = [(TSDShapeRep *)&v6 enabledKnobMask];
  v5.receiver = self;
  v5.super_class = (Class)TSDConnectionLineRep;
  if ([(TSDRep *)&v5 shouldCreateKnobs]) {
    return v3;
  }
  else {
    return v3 & 0xFFFFFFFFFFFFF3FFLL;
  }
}

- (BOOL)shouldCreateSelectionKnobs
{
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineRep;
  if ([(TSDRep *)&v6 shouldCreateSelectionKnobs]) {
    goto LABEL_2;
  }
  if (objc_msgSend((id)objc_msgSend(-[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout"), "connectedPathSource"), "type") != 1)
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  id v4 = [(TSDConnectionLineRep *)self connectionLineLayout];
  if ([v4 connectedFrom]
    && objc_msgSend(-[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v4, "connectedFrom")), "shouldCreateKnobs")&& objc_msgSend((id)objc_msgSend(v4, "connectedFrom"), "layoutState") == 2)
  {
LABEL_2:
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v3 = [v4 connectedTo];
    if (v3)
    {
      LODWORD(v3) = objc_msgSend(-[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v4, "connectedTo")), "shouldCreateKnobs");
      if (v3) {
        LOBYTE(v3) = objc_msgSend((id)objc_msgSend(v4, "connectedTo"), "layoutState") == 2;
      }
    }
  }
  return v3;
}

- (id)additionalRepsForDragging
{
  if ([(TSDConnectionLineRep *)self p_isConnected])
  {
    id v3 = [(TSDConnectionLineRep *)self connectionLineLayout];
    id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    if ([v3 connectedFrom]) {
      objc_msgSend(v4, "addObject:", -[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v3, "connectedFrom")));
    }
    if ([v3 connectedTo]) {
      objc_msgSend(v4, "addObject:", -[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v3, "connectedTo")));
    }
    return v4;
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    return (id)[v6 set];
  }
}

- (BOOL)isSelectable
{
  id v2 = [(TSDRep *)self layout];

  return [(TSDLayout *)v2 isInTopLevelContainerForEditing];
}

- (BOOL)isDraggable
{
  v5.receiver = self;
  v5.super_class = (Class)TSDConnectionLineRep;
  BOOL v3 = [(TSDShapeRep *)&v5 isDraggable];
  if (v3) {
    LOBYTE(v3) = ![(TSDConnectionLineRep *)self p_isConnectedToLockedObjects];
  }
  return v3;
}

- (BOOL)canMakePathEditable
{
  return 0;
}

- (CGRect)targetRectForEditMenu
{
  id v3 = [(TSDRep *)self knobForTag:12];
  double v4 = *MEMORY[0x263F001A0];
  double v5 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  if ([(TSDConnectionLineRep *)self p_controlKnobVisible]
    && ![(TSDConnectionLineRep *)self i_editMenuOverlapsEndKnobs])
  {
    [v3 position];
    double v4 = TSDRectWithCenterAndSize(v8, v9, 2.0);
    double v5 = v10;
    double v6 = v11;
    double v7 = v12;
  }
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  double v16 = v7;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  if ([a3 tag] == 12) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineRep;
  return [(TSDShapeRep *)&v6 canUseSpecializedHitRegionForKnob:a3];
}

- (BOOL)directlyManagesLayerContent
{
  if (objc_msgSend(-[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout"), "shouldValidate")) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDConnectionLineRep;
  return [(TSDShapeRep *)&v4 directlyManagesLayerContent];
}

- (BOOL)canBeUsedForImageMask
{
  return 0;
}

- (void)updateFromLayout
{
  v4.receiver = self;
  v4.super_class = (Class)TSDConnectionLineRep;
  [(TSDRep *)&v4 updateFromLayout];
  id v3 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathSource");
  if (([v3 isEqual:self->mLastPathSource] & 1) == 0)
  {
    [(TSDShapeRep *)self layoutInRootChangedFrom:0 to:0 translatedOnly:0];

    self->mLastPathSource = (TSDPathSource *)[v3 copy];
  }
}

- (CGPoint)i_dragOffset
{
  id v3 = [(TSDConnectionLineRep *)self connectionLineLayout];
  BOOL v4 = [v3 connectedTo] != 0;
  if ((v4 ^ ([v3 connectedFrom] == 0)))
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDConnectionLineRep;
    [(TSDRep *)&v7 i_dragOffset];
  }
  else
  {
    if ([v3 isBeingTransformed]) {
      [v3 pauseDynamicTransformation];
    }
    objc_msgSend(v3, "i_accumulatedDrag");
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  id v3 = [(TSDRep *)self knobForTag:12];
  id v4 = [(TSDRep *)self knobForTag:11];
  id v5 = [(TSDRep *)self knobForTag:10];
  double v6 = [(TSDRep *)self canvas];
  [v3 position];
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  -[TSDCanvas convertUnscaledToBoundsPoint:](v6, "convertUnscaledToBoundsPoint:");
  double v8 = v7;
  double v10 = v9;
  double v11 = [(TSDRep *)self canvas];
  [v4 position];
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  -[TSDCanvas convertUnscaledToBoundsPoint:](v11, "convertUnscaledToBoundsPoint:");
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v16 = [(TSDRep *)self canvas];
  [v5 position];
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  -[TSDCanvas convertUnscaledToBoundsPoint:](v16, "convertUnscaledToBoundsPoint:");
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  -[TSDCanvas i_approximateScaledFrameOfEditingMenuAtPoint:]([(TSDRep *)self canvas], "i_approximateScaledFrameOfEditingMenuAtPoint:", v8, v10);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  v33.CGFloat x = v13;
  v33.CGFloat y = v15;
  if (CGRectContainsPoint(v34, v33)) {
    return 1;
  }
  CGFloat v26 = x;
  CGFloat v27 = y;
  CGFloat v28 = width;
  CGFloat v29 = height;
  uint64_t v30 = v18;
  uint64_t v31 = v20;

  return CGRectContainsPoint(*(CGRect *)&v26, *(CGPoint *)&v30);
}

- (BOOL)p_isConnected
{
  id v2 = [(TSDConnectionLineRep *)self connectionLineLayout];
  return [v2 connectedFrom] || objc_msgSend(v2, "connectedTo") != 0;
}

- (BOOL)p_isConnectedToLockedObjects
{
  id v2 = [(TSDConnectionLineRep *)self connectionLineLayout];
  objc_opt_class();
  objc_msgSend((id)objc_msgSend(v2, "connectedFrom"), "info");
  id v3 = (void *)TSUDynamicCast();
  objc_opt_class();
  objc_msgSend((id)objc_msgSend(v2, "connectedTo"), "info");
  id v4 = (void *)TSUDynamicCast();
  if ([v3 isLocked]) {
    return 1;
  }

  return [v4 isLocked];
}

- (BOOL)p_controlKnobVisible
{
  BOOL v3 = [(TSDConnectionLineRep *)self shouldShowSmartShapeKnobs];
  if (v3)
  {
    id v4 = [(TSDRep *)self knobForTag:12];
    id v5 = [(TSDRep *)self canvas];
    [v4 position];
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    -[TSDCanvas convertUnscaledToBoundsPoint:](v5, "convertUnscaledToBoundsPoint:");
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] visibleBoundsRect];
    uint64_t v14 = v7;
    uint64_t v15 = v9;
    LOBYTE(v3) = CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v14);
  }
  return v3;
}

@end