@interface CRLConnectionLineRep
+ (BOOL)canConnectToRep:(id)a3;
+ (id)infosToConnectFromSelectionPath:(id)a3 withInteractiveCanvasController:(id)a4;
- (BOOL)canBeUsedForImageMask;
- (BOOL)canConnectToRep:(id)a3;
- (BOOL)canMakePathEditable;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)crlaxIsStraightLine;
- (BOOL)directlyManagesLayerContent;
- (BOOL)i_editMenuOverlapsEndKnobs;
- (BOOL)i_targetsDropsToStroke;
- (BOOL)p_controlKnobVisible;
- (BOOL)p_isConnected;
- (BOOL)shouldCreateKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldSetPathSourceWhenChangingInfoGeometry;
- (BOOL)shouldShowSmartShapeKnobs;
- (CGPoint)i_dragOffset;
- (CGRect)targetRectForEditMenu;
- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4;
- (id)additionalRepsForDragging;
- (id)connectionLineLayout;
- (id)newTrackerForKnob:(id)a3;
- (id)overlayRenderables;
- (id)p_createClippedPathRenderableForEnd:(unint64_t)a3;
- (id)p_createRenderableForMagnet:(CGPoint)a3 connected:(BOOL)a4;
- (unint64_t)enabledKnobMask;
- (void)updateFromLayout;
- (void)updateMagnetRenderables:(id)a3 withEmptyMagnets:(id)a4 withHighlightedMagnets:(id)a5 includeClippedPortions:(BOOL)a6;
@end

@implementation CRLConnectionLineRep

- (id)connectionLineLayout
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self layout];
  v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  v8 = [(CRLConnectionLineRep *)self connectionLineLayout];
  if (([v8 isInvisible] & 1) != 0 || !objc_msgSend(v8, "validLine"))
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLConnectionLineRep;
    BOOL v9 = -[CRLShapeRep containsPoint:withPrecision:](&v11, "containsPoint:withPrecision:", v4, x, y);
  }

  return v9;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(CRLConnectionLineRep *)self connectionLineLayout];
  double v9 = 3.40282347e38;
  if (([v8 isInvisible] & 1) == 0 && objc_msgSend(v8, "validLine"))
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLConnectionLineRep;
    -[CRLShapeRep shortestDistanceToPoint:countAsHit:](&v12, "shortestDistanceToPoint:countAsHit:", a4, x, y);
    double v9 = v10;
  }

  return v9;
}

- (void)updateFromLayout
{
  v7.receiver = self;
  v7.super_class = (Class)CRLConnectionLineRep;
  [(CRLCanvasRep *)&v7 updateFromLayout];
  if (![(CRLCanvasRep *)self isBeingDragged]
    && ![(CRLCanvasRep *)self isBeingRotated]
    && ![(CRLCanvasRep *)self isBeingFreeTransformed])
  {
    uint64_t v3 = [(CRLShapeRep *)self shapeLayout];
    BOOL v4 = [v3 pathSource];

    if (([v4 isEqual:self->mLastPathSource] & 1) == 0)
    {
      [(CRLShapeRep *)self layoutInRootChangedFrom:0 to:0 translatedOnly:0];
      v5 = (CRLPathSource *)[v4 copy];
      mLastPathSource = self->mLastPathSource;
      self->mLastPathSource = v5;
    }
  }
}

- (BOOL)shouldSetPathSourceWhenChangingInfoGeometry
{
  uint64_t v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v4 = [(CRLCanvasRep *)self layout];
  if ([v4 isInTopLevelContainerForEditing])
  {
    if ([v3 displaysMultiselectionWithSingleBounds]) {
      unsigned __int8 v5 = [v3 shouldSuppressSelectionKnobsForRep:self];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

+ (id)infosToConnectFromSelectionPath:(id)a3 withInteractiveCanvasController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = +[NSMutableArray array];
  v8 = [v5 selectionModelTranslator];
  double v9 = [v8 boardItemsForSelectionPath:v6];

  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100248520;
  v18 = &unk_1014E53C0;
  id v10 = v5;
  id v19 = v10;
  id v11 = v7;
  id v20 = v11;
  [v9 enumerateObjectsUsingBlock:&v15];
  objc_super v12 = +[NSArray array];
  if ([v11 count] == (id)2
    && ([v10 hasSelectedInfosInMultipleContainers] & 1) == 0)
  {
    id v13 = v11;

    objc_super v12 = v13;
  }

  return v12;
}

+ (BOOL)canConnectToRep:(id)a3
{
  uint64_t v3 = [a3 repForSelecting];
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 layout];
  id v6 = sub_1002469D0(v4, v5);
  unsigned __int8 v7 = [v6 pathIsLineSegment];

  if (v7)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    double v9 = [v3 layout];
    unsigned __int8 v8 = [v9 allowsConnections];
  }
  return v8;
}

- (BOOL)canConnectToRep:(id)a3
{
  uint64_t v4 = [a3 repForSelecting];
  if (v4 == self
    || !+[CRLConnectionLineRep canConnectToRep:v4])
  {
    BOOL v19 = 0;
  }
  else
  {
    id v5 = [(CRLCanvasRep *)v4 layout];
    id v6 = [v5 parent];
    unsigned __int8 v7 = [(CRLCanvasRep *)self layout];
    unsigned __int8 v8 = [v7 parent];

    if (v6 == v8)
    {
      BOOL v19 = 1;
    }
    else
    {
      double v9 = [(CRLCanvasRep *)self interactiveCanvasController];
      id v10 = [v9 freehandDrawingToolkit];
      uint64_t v11 = objc_opt_class();
      objc_super v12 = [(CRLCanvasRep *)v4 info];
      id v13 = sub_1002469D0(v11, v12);

      if (v13 && [v10 isLassoSelectionForMixedTypeEnabledInDrawingMode])
      {
        v14 = sub_10006B444(v13);
        v15 = [v9 layoutForInfo:v14];
        uint64_t v16 = [v15 parent];
        v17 = [(CRLCanvasRep *)self layout];
        v18 = [v17 parent];
        BOOL v19 = v16 == v18;
      }
      else
      {
        BOOL v19 = 0;
      }
    }
  }

  return v19;
}

- (void)updateMagnetRenderables:(id)a3 withEmptyMagnets:(id)a4 withHighlightedMagnets:(id)a5 includeClippedPortions:(BOOL)a6
{
  BOOL v6 = a6;
  id v52 = a3;
  id v51 = a4;
  id v10 = a5;
  uint64_t v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mMagnetRenderables = self->mMagnetRenderables;
  self->mMagnetRenderables = v11;

  uint64_t v13 = objc_opt_class();
  v14 = [(CRLCanvasRep *)self layout];
  v15 = sub_1002469D0(v13, v14);

  if (v6)
  {
    if ([v15 drawClippedHeadPortion]
      && ([v15 connectedTo], uint64_t v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      v17 = self;
      uint64_t v18 = 11;
    }
    else
    {
      if (![v15 drawClippedTailPortion]) {
        goto LABEL_11;
      }
      BOOL v19 = [v15 connectedFrom];

      if (!v19) {
        goto LABEL_11;
      }
      v17 = self;
      uint64_t v18 = 10;
    }
    id v20 = [(CRLConnectionLineRep *)v17 p_createClippedPathRenderableForEnd:v18];
    if (v20) {
      [(NSMutableArray *)self->mMagnetRenderables addObject:v20];
    }
  }
LABEL_11:
  v53 = v15;
  v21 = [(CRLCanvasRep *)self canvas];
  [v21 viewScale];
  double v23 = v22;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v24 = v10;
  id v25 = [v24 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v65;
    double height = CGSizeZero.height;
    do
    {
      v29 = 0;
      do
      {
        if (*(void *)v65 != v27) {
          objc_enumerationMutation(v24);
        }
        v30 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v29);
        Mutable = CGPathCreateMutable();
        [v30 CGPointValue];
        v71.origin.double x = sub_10006402C(v32, v33, 13.125 / v23);
        CGPathAddEllipseInRect(Mutable, 0, v71);
        v34 = +[CRLCanvasShapeRenderable renderable];
        [v34 setShadowPath:Mutable];
        CGAffineTransformMakeScale(&v63, v23, v23);
        CGAffineTransform v62 = v63;
        [v34 setAffineTransform:&v62];
        v35 = [(CRLCanvasRep *)self defaultSelectionHighlightColor];
        [v34 setShadowColor:[v35 CGColor]];

        [v34 setShadowOffset:CGSizeZero.width, height];
        LODWORD(v36) = 1.0;
        [v34 setShadowOpacity:v36];
        [v34 setShadowRadius:1.0];
        CGPathRelease(Mutable);
        [(NSMutableArray *)self->mMagnetRenderables addObject:v34];

        v29 = (char *)v29 + 1;
      }
      while (v26 != v29);
      id v26 = [v24 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v26);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v37 = v51;
  id v38 = [v37 countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v59;
    do
    {
      v41 = 0;
      do
      {
        if (*(void *)v59 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = self->mMagnetRenderables;
        [*(id *)(*((void *)&v58 + 1) + 8 * (void)v41) CGPointValue];
        v43 = -[CRLConnectionLineRep p_createRenderableForMagnet:connected:](self, "p_createRenderableForMagnet:connected:", 0);
        [(NSMutableArray *)v42 addObject:v43];

        v41 = (char *)v41 + 1;
      }
      while (v39 != v41);
      id v39 = [v37 countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v39);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v44 = v52;
  id v45 = [v44 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v55;
    do
    {
      v48 = 0;
      do
      {
        if (*(void *)v55 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = self->mMagnetRenderables;
        [*(id *)(*((void *)&v54 + 1) + 8 * (void)v48) CGPointValue];
        v50 = -[CRLConnectionLineRep p_createRenderableForMagnet:connected:](self, "p_createRenderableForMagnet:connected:", 1);
        [(NSMutableArray *)v49 addObject:v50];

        v48 = (char *)v48 + 1;
      }
      while (v46 != v48);
      id v46 = [v44 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v46);
  }
}

- (id)p_createClippedPathRenderableForEnd:(unint64_t)a3
{
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v7 = sub_1002469D0(v5, v6);

  if (a3 == 11) {
    [v7 getClippedHeadPortion];
  }
  else {
  unsigned __int8 v8 = [v7 getClippedTailPortion];
  }
  if (v8)
  {
    double v9 = +[CRLCanvasShapeRenderable renderable];
    [v9 setFillColor:0];
    LODWORD(v10) = 0.25;
    [v9 setOpacity:v10];
    [v9 setPath:[v8 CGPath]];
    uint64_t v11 = [(CRLCanvasRep *)self canvas];
    [v11 viewScale];
    CGFloat v13 = v12;
    v14 = [(CRLCanvasRep *)self canvas];
    [v14 viewScale];
    CGAffineTransformMakeScale(&v19, v13, v15);
    CGAffineTransform v18 = v19;
    [v9 setAffineTransform:&v18];

    uint64_t v16 = [v7 stroke];
    [v16 applyToShapeRenderable:v9 withScale:1.0];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)p_createRenderableForMagnet:(CGPoint)a3 connected:(BOOL)a4
{
  double x = a3.x;
  if (a4) {
    CFStringRef v5 = @"ios-canvas-diagram-connect";
  }
  else {
    CFStringRef v5 = @"ios-canvas-diagram-magnet";
  }
  unsigned __int8 v7 = +[CRLImage imageNamed:](CRLImage, "imageNamed:", v5, *(void *)&a3.y, v6);
  unsigned __int8 v8 = [(CRLCanvasRep *)self canvas];
  [v8 contentsScale];
  id v9 = [v7 CGImageForContentsScale:];

  double v10 = +[CRLCanvasShapeRenderable renderable];
  [v10 setContents:v9];
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v21[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v21[1] = v11;
  v21[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v10 setAffineTransform:v21];
  [v7 size];
  [v10 setBounds:sub_100064070()];
  double v12 = [(CRLCanvasRep *)self canvas];
  [v12 viewScale];
  CGFloat v14 = v13;
  CGFloat v15 = [(CRLCanvasRep *)self canvas];
  [v15 viewScale];
  CGAffineTransformMakeScale(&v20, v14, v16);
  [v10 setPosition:vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v18), *(float64x2_t *)&v20.a, x))];

  return v10;
}

- (id)newTrackerForKnob:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E53E0);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101090AFC(v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5400);
    }
    unsigned __int8 v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v7, v5);
    }
    unsigned __int8 v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineRep newTrackerForKnob:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 250, 0, "invalid nil value for '%{public}s'", "knob");
  }
  if ([v4 tag] == (id)28)
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLConnectionLineRep;
    double v10 = [(CRLShapeRep *)&v13 newTrackerForKnob:v4];
  }
  else
  {
    double v10 = [[CRLConnectionLineKnobTracker alloc] initWithRep:self knob:v4];
  }
  long long v11 = v10;

  return v11;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  uint64_t v3 = [(CRLConnectionLineRep *)self connectionLineLayout];
  id v4 = [v3 connectedPathSource];
  id v5 = [v4 type];

  unsigned int v6 = [(CRLConnectionLineRep *)self shouldCreateKnobs];
  if (v5 == (id)1 || !v6)
  {
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    double v8 = v7;
    double v10 = v9;
    long long v11 = [(CRLCanvasRep *)self canvas];
    [v11 viewScale];
    double v13 = sub_1000646A4(v8, v10, v12);
    double v15 = v14;

    float v16 = v15 * v15 + v13 * v13;
    if (sqrtf(v16) < 60.0) {
      goto LABEL_9;
    }
  }
  if (![(CRLCanvasRep *)self isPlaceholder])
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLConnectionLineRep;
    if (([(CRLShapeRep *)&v20 enabledKnobMask] & 0x800) != 0
      && ![(CRLCanvasRep *)self isLocked])
    {
      CGAffineTransform v19 = [(CRLCanvasRep *)self interactiveCanvasController];
      unsigned int v17 = [v19 documentIsSharedReadOnly] ^ 1;

      goto LABEL_10;
    }
  }
LABEL_9:
  LOBYTE(v17) = 0;
LABEL_10:

  return v17;
}

- (BOOL)shouldCreateKnobs
{
  v2 = [(CRLConnectionLineRep *)self connectionLineLayout];
  if ([v2 isInvisible]) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = [v2 validLine];
  }

  return v3;
}

- (unint64_t)enabledKnobMask
{
  v6.receiver = self;
  v6.super_class = (Class)CRLConnectionLineRep;
  unint64_t v3 = [(CRLShapeRep *)&v6 enabledKnobMask];
  v5.receiver = self;
  v5.super_class = (Class)CRLConnectionLineRep;
  if ([(CRLCanvasRep *)&v5 shouldCreateKnobs]) {
    return v3;
  }
  else {
    return v3 & 0xFFFFFFFFFFFFF3FFLL;
  }
}

- (BOOL)shouldCreateSelectionKnobs
{
  v19.receiver = self;
  v19.super_class = (Class)CRLConnectionLineRep;
  if (![(CRLCanvasRep *)&v19 shouldCreateSelectionKnobs])
  {
    id v4 = [(CRLConnectionLineRep *)self connectionLineLayout];
    objc_super v5 = [v4 connectedPathSource];
    id v6 = [v5 type];

    if (v6 != (id)1)
    {
      LOBYTE(v3) = 0;
      return (char)v3;
    }
    double v7 = [(CRLConnectionLineRep *)self connectionLineLayout];
    double v8 = [v7 connectedFrom];

    if (v8)
    {
      double v9 = [(CRLCanvasRep *)self canvas];
      double v10 = [v7 connectedFrom];
      long long v11 = [v9 repForLayout:v10];

      if ([v11 shouldCreateKnobs])
      {
        double v12 = [v7 connectedFrom];
        unsigned int v13 = [v12 layoutState];

        if (v13 == 2)
        {
          LOBYTE(v3) = 1;
LABEL_15:

          return (char)v3;
        }
      }
      else
      {
      }
    }
    unint64_t v3 = [v7 connectedTo];

    if (v3)
    {
      double v14 = [(CRLCanvasRep *)self canvas];
      double v15 = [v7 connectedTo];
      float v16 = [v14 repForLayout:v15];

      if ([v16 shouldCreateKnobs])
      {
        unsigned int v17 = [v7 connectedTo];
        LOBYTE(v3) = [v17 layoutState] == 2;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    goto LABEL_15;
  }
  LOBYTE(v3) = 1;
  return (char)v3;
}

- (id)overlayRenderables
{
  v31.receiver = self;
  v31.super_class = (Class)CRLConnectionLineRep;
  unint64_t v3 = [(CRLShapeRep *)&v31 overlayRenderables];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(CRLCanvasRep *)self currentKnobTracker];
  id v6 = sub_1002469D0(v4, v5);

  double v7 = [v6 connectedRepForHighlighting];
  if (v7)
  {
    if (v3) {
      double v8 = v3;
    }
    else {
      double v8 = &__NSArray0__struct;
    }
    double v9 = +[CRLCanvasShapeRenderable renderable];
    double v10 = [v7 layout];
    long long v11 = [(CRLCanvasRep *)self canvas];
    [v11 viewScale];
    CGFloat v13 = v12;

    memset(&transform, 0, sizeof(transform));
    if (v10) {
      [v10 transformInRoot];
    }
    CGAffineTransformMakeScale(&t2, v13, v13);
    CGAffineTransform t1 = transform;
    CGAffineTransformConcat(&v29, &t1, &t2);
    CGAffineTransform transform = v29;
    double v14 = [v10 pathForClippingConnectionLines];
    double v15 = v14;
    if (!v14
      || (uint64_t)[v14 elementCount] < 2
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v10 boundsForStandardKnobs];
      uint64_t v16 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");

      double v15 = (void *)v16;
    }
    tdouble x = transform.tx;
    tdouble y = transform.ty;
    transform.tdouble x = 0.0;
    transform.tdouble y = 0.0;
    id v19 = v15;
    CGPathRef v20 = CGPathCreateCopyByStrokingPath((CGPathRef)[v19 CGPath], &transform, 3.0 / v13, kCGLineCapButt, kCGLineJoinBevel, 1.0);
    [v9 setShadowPath:v20];
    CGAffineTransformMakeTranslation(&v26, tx, ty);
    CGAffineTransform v25 = v26;
    [v9 setAffineTransform:&v25];
    CFRelease(v20);
    v21 = [(CRLCanvasRep *)self defaultSelectionHighlightColor];
    [v9 setShadowColor:[v21 CGColor]];

    [v9 setShadowOffset:CGSizeZero.width, CGSizeZero.height];
    LODWORD(v22) = 1.0;
    [v9 setShadowOpacity:v22];
    [v9 setShadowRadius:1.0];
    unint64_t v3 = [v8 arrayByAddingObject:v9];
  }
  double v23 = [v3 arrayByAddingObjectsFromArray:self->mMagnetRenderables];

  return v23;
}

- (id)additionalRepsForDragging
{
  if ([(CRLConnectionLineRep *)self p_isConnected])
  {
    unint64_t v3 = [(CRLConnectionLineRep *)self connectionLineLayout];
    id v4 = objc_alloc_init((Class)NSMutableSet);
    objc_super v5 = [v3 connectedFrom];

    if (v5)
    {
      id v6 = [(CRLCanvasRep *)self canvas];
      double v7 = [v3 connectedFrom];
      double v8 = [v6 repForLayout:v7];

      double v9 = [v8 additionalRepsForDraggingConnectionLine:self];
      [v4 unionSet:v9];
    }
    double v10 = [v3 connectedTo];

    if (v10)
    {
      long long v11 = [(CRLCanvasRep *)self canvas];
      double v12 = [v3 connectedTo];
      CGFloat v13 = [v11 repForLayout:v12];

      double v14 = [v13 additionalRepsForDraggingConnectionLine:self];
      [v4 unionSet:v14];
    }
  }
  else
  {
    id v4 = +[NSSet set];
  }

  return v4;
}

- (BOOL)canMakePathEditable
{
  return 0;
}

- (CGRect)targetRectForEditMenu
{
  unint64_t v3 = [(CRLCanvasRep *)self knobForTag:12];
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  if ([(CRLConnectionLineRep *)self p_controlKnobVisible]
    && ![(CRLConnectionLineRep *)self i_editMenuOverlapsEndKnobs])
  {
    [v3 position];
    CGFloat x = sub_10006402C(v8, v9, 2.0);
    CGFloat y = v10;
    CGFloat width = v11;
    CGFloat height = v12;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4 = a3;
  if ([v4 tag] == (id)12)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLConnectionLineRep;
    BOOL v5 = [(CRLShapeRep *)&v7 canUseSpecializedHitRegionForKnob:v4];
  }

  return v5;
}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (BOOL)canBeUsedForImageMask
{
  return 0;
}

- (CGPoint)i_dragOffset
{
  unint64_t v3 = [(CRLConnectionLineRep *)self connectionLineLayout];
  id v4 = [v3 connectedTo];
  BOOL v5 = [v3 connectedFrom];
  char v6 = (v4 != 0) ^ (v5 == 0);

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLConnectionLineRep;
    [(CRLCanvasRep *)&v13 i_dragOffset];
  }
  else
  {
    if ([v3 isBeingTransformed]) {
      [v3 pauseDynamicTransformation];
    }
    [v3 i_accumulatedDrag];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  unint64_t v3 = [(CRLCanvasRep *)self knobForTag:12];
  id v4 = [(CRLCanvasRep *)self knobForTag:11];
  BOOL v5 = [(CRLCanvasRep *)self knobForTag:10];
  char v6 = [(CRLCanvasRep *)self canvas];
  [v3 position];
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  [v6 convertUnscaledToBoundsPoint:];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(CRLCanvasRep *)self canvas];
  [v4 position];
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  [v11 convertUnscaledToBoundsPoint:];
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  double v16 = [(CRLCanvasRep *)self canvas];
  [v5 position];
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  [v16 convertUnscaledToBoundsPoint:];
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v21 = [(CRLCanvasRep *)self canvas];
  [v21 i_approximateScaledFrameOfEditingMenuAtPoint:v8, v10];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v34.origin.CGFloat x = v23;
  v34.origin.CGFloat y = v25;
  v34.size.CGFloat width = v27;
  v34.size.CGFloat height = v29;
  v32.CGFloat x = v13;
  v32.CGFloat y = v15;
  if (CGRectContainsPoint(v34, v32))
  {
    BOOL v30 = 1;
  }
  else
  {
    v35.origin.CGFloat x = v23;
    v35.origin.CGFloat y = v25;
    v35.size.CGFloat width = v27;
    v35.size.CGFloat height = v29;
    v33.CGFloat x = v18;
    v33.CGFloat y = v20;
    BOOL v30 = CGRectContainsPoint(v35, v33);
  }

  return v30;
}

- (BOOL)i_targetsDropsToStroke
{
  return 1;
}

- (BOOL)p_isConnected
{
  v2 = [(CRLConnectionLineRep *)self connectionLineLayout];
  unint64_t v3 = [v2 connectedFrom];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [v2 connectedTo];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)p_controlKnobVisible
{
  BOOL v3 = [(CRLConnectionLineRep *)self shouldShowSmartShapeKnobs];
  if (v3)
  {
    BOOL v4 = [(CRLCanvasRep *)self knobForTag:12];
    BOOL v5 = [(CRLCanvasRep *)self canvas];
    [v4 position];
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    [v5 convertUnscaledToBoundsPoint:];
    CGFloat v7 = v6;
    CGFloat v9 = v8;

    double v10 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v10 visibleBoundsRect];
    v12.CGFloat x = v7;
    v12.CGFloat y = v9;
    LOBYTE(v5) = CGRectContainsPoint(v13, v12);

    LOBYTE(v3) = (_BYTE)v5;
  }
  return v3;
}

- (BOOL)crlaxIsStraightLine
{
  v2 = [(CRLConnectionLineRep *)self connectionLineLayout];
  unsigned __int8 v3 = [v2 isStraightLine];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMagnetRenderables, 0);

  objc_storeStrong((id *)&self->mLastPathSource, 0);
}

@end