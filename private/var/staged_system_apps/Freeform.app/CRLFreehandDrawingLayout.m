@interface CRLFreehandDrawingLayout
+ (BOOL)anyFreehandDrawingsVisibleAndSelectedInInteractiveCanvasController:(id)a3;
+ (BOOL)anyFreehandDrawingsVisibleInInteractiveCanvasController:(id)a3;
+ (BOOL)p_anyFreehandDrawingsVisibleInInteractiveCanvasController:(id)a3 findSelected:(BOOL)a4;
+ (BOOL)p_layoutIsFreehandDrawing:(id)a3 andSelected:(BOOL)a4 icc:(id)a5;
+ (id)freehandDrawingLayoutsToInteractWithFromLayouts:(id)a3;
- (BOOL)exclusivelyProvidesGuidesForChildLayouts;
- (BOOL)isInteractable;
- (BOOL)shouldSnapWhileResizing;
- (BOOL)showingSubselectionAffordance;
- (CGAffineTransform)pureTransformInRootWithoutMathResults;
- (CGRect)boundsForMathResultViews;
- (CGRect)cachedFrameForMiniFormatterPositioning;
- (CGRect)computeBoundsForStandardKnobs;
- (CGRect)frameAtMathViewAttachment;
- (CGRect)frameForMiniFormatterPositioning;
- (CGRect)p_boundsForMathResultViews;
- (CGRect)p_boundsInNaturalSpaceForMathView:(id)a3;
- (CGRect)p_getUnRotatedFrameWithoutMathResults;
- (CGSize)minimumSize;
- (CRLCanvasLayoutGeometry)pureGeometryInRootWithoutMathResults;
- (CRLCanvasLayoutGeometry)pureGeometryWithoutMathResults;
- (CRLFreehandDrawingLayout)initWithInfo:(id)a3;
- (CRLFreehandDrawingTransformInfo)transformInfo;
- (_TtC8Freeform17CRLMathResultView)baseMathView;
- (_TtC8Freeform22CRLFreehandDrawingItem)freehandInfo;
- (_TtC8Freeform30CRLMathRecognitionItemsHandler)mathRecognitionHandler;
- (double)previousAspectRatio;
- (double)rotationAtMathViewAttachment;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childInfosForChildLayouts;
- (id)childSearchTargets;
- (id)computeLayoutGeometry;
- (id)computeWrapPath;
- (id)descendentWrappables;
- (id)layoutsForProvidingGuidesForChildLayouts;
- (id)pathForClippingConnectionLines;
- (unint64_t)maxFilledShapeIndex;
- (void)didAddSubviewWithSubview:(id)a3;
- (void)endDynamicOperation;
- (void)p_updateBoundsForMathResultSubviewsWillChangeWithDelay:(BOOL)a3;
- (void)p_updateLayoutBoundsForMathResultView;
- (void)parentDidChange;
- (void)resetMathRecognitionHandlerIfRequestedAndEnabled;
- (void)setBoundsForMathResultViews:(CGRect)a3;
- (void)setCachedFrameForMiniFormatterPositioning:(CGRect)a3;
- (void)setFrameAtMathViewAttachment:(CGRect)a3;
- (void)setPreviousAspectRatio:(double)a3;
- (void)setRotationAtMathViewAttachment:(double)a3;
- (void)setupMathRecognitionHandler;
- (void)showSubselectionAffordanceForSelectedInfos:(id)a3;
- (void)subviewWillBeRemovedWithSubview:(id)a3;
- (void)transformLayoutDidBeginDynamicOperation;
- (void)transformLayoutDidEndDynamicOperation;
- (void)willBeRemovedFromLayoutController:(id)a3;
@end

@implementation CRLFreehandDrawingLayout

- (CRLFreehandDrawingLayout)initWithInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingLayout;
  result = [(CRLCanvasLayout *)&v7 initWithInfo:a3];
  if (result)
  {
    CGPoint origin = CGRectNull.origin;
    CGSize size = CGRectNull.size;
    *(CGPoint *)((char *)&result->_transformInfo + 2) = CGRectNull.origin;
    *(CGSize *)((char *)&result->_frameForMiniFormatterPositioning.origin.y + 2) = size;
    *(CGPoint *)((char *)&result->_previousAspectRatio + 2) = origin;
    *(CGSize *)((char *)&result->_boundsForMathResultViews.origin.y + 2) = size;
    CGSize v6 = CGRectZero.size;
    *(CGPoint *)((char *)&result->_frameForMiniFormatterPositioning.size.height + 2) = CGRectZero.origin;
    *(CGSize *)((char *)&result->_boundsForStandardKnobsWithoutMathResultsViews.origin.y + 2) = v6;
  }
  return result;
}

- (_TtC8Freeform22CRLFreehandDrawingItem)freehandInfo
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasLayout *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform22CRLFreehandDrawingItem *)v5;
}

- (CGSize)minimumSize
{
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingLayout;
  [(CRLGroupLayout *)&v4 minimumSize];
  if (v2 < 0.00000000999999994) {
    double v2 = 0.00000000999999994;
  }
  if (v3 < 0.00000000999999994) {
    double v3 = 0.00000000999999994;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)childInfosForChildLayouts
{
  if (*(void *)(&self->_isTransformLayoutInDynamicOperation + 2))
  {
    double v3 = [&__NSArray0__struct arrayByAddingObject:];
  }
  else
  {
    double v3 = &__NSArray0__struct;
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingLayout;
  objc_super v4 = [(CRLGroupLayout *)&v7 childInfosForChildLayouts];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLFreehandDrawingLayout;
  v5 = [(CRLGroupLayout *)&v14 additionalDependenciesForChildLayout:v4];
  CGSize v6 = [(CRLCanvasLayout *)self layoutController];
  id v7 = [v6 layoutForInfo:*(void *)(&self->_isTransformLayoutInDynamicOperation + 2)];

  if (v7) {
    BOOL v8 = v7 == v4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v9 = [(CRLFreehandDrawingLayout *)self freehandInfo];
    v10 = [v4 info];
    unsigned __int8 v11 = [v9 isNonGroupedChild:v10];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [v5 arrayByAddingObject:v7];

      v5 = (void *)v12;
    }
  }

  return v5;
}

- (BOOL)shouldSnapWhileResizing
{
  double v3 = [(CRLFreehandDrawingLayout *)self freehandInfo];
  id v4 = [v3 childInfos];
  id v5 = [v4 count];

  if ((unint64_t)v5 > 0xC8) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingLayout;
  return [(CRLGroupLayout *)&v7 shouldSnapWhileResizing];
}

- (id)descendentWrappables
{
  double v2 = (id *)(&self->super._hasInvalidated + 2);
  double v3 = *(void **)(&self->super._hasInvalidated + 2);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingLayout;
    id v4 = [(CRLGroupLayout *)&v7 descendentWrappables];
    if ([(CRLCanvasLayout *)self isBeingManipulated] || BYTE2(self->_dynamicDescendentWrappables)) {
      objc_storeStrong(v2, v4);
    }
  }

  return v4;
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasLayout *)self layoutController];
  CGSize v6 = [v5 canvas];
  objc_super v7 = [v6 canvasController];

  if ([v7 isCanvasInteractive])
  {
    [*(id *)((char *)&self->_baseMathView + 2) willBeRemoved];
    BOOL v8 = *(_TtC8Freeform17CRLMathResultView **)((char *)&self->_baseMathView + 2);
    *(_TtC8Freeform17CRLMathResultView **)((char *)&self->_baseMathView + 2) = 0;

    [*(id *)((char *)&self->_baseMathViewController + 2) removeFromSuperview];
    v9 = *(UIViewController **)((char *)&self->_baseMathViewController + 2);
    *(UIViewController **)((char *)&self->_baseMathViewController + 2) = 0;

    [*(id *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2) removeFromParentViewController];
    v10 = *(void **)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2);
    *(CGFloat *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2) = 0.0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingLayout;
  [(CRLCanvasLayout *)&v11 willBeRemovedFromLayoutController:v4];
}

- (void)parentDidChange
{
  double v3 = [(CRLCanvasLayout *)self layoutController];
  id v4 = [v3 canvas];
  id v5 = [v4 canvasController];

  if ([v5 isCanvasInteractive]) {
    [(CRLFreehandDrawingLayout *)self setupMathRecognitionHandler];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingLayout;
  [(CRLCanvasLayout *)&v6 parentDidChange];
}

- (CGRect)computeBoundsForStandardKnobs
{
  v19.receiver = self;
  v19.super_class = (Class)CRLFreehandDrawingLayout;
  [(CRLGroupLayout *)&v19 computeBoundsForStandardKnobs];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  *(double *)((char *)&self->_frameForMiniFormatterPositioning.size.height + 2) = v3;
  *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.x + 2) = v5;
  *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.y + 2) = v7;
  *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.width + 2) = v9;
  [(CRLFreehandDrawingLayout *)self boundsForMathResultViews];
  if (!CGRectIsNull(v20))
  {
    [(CRLFreehandDrawingLayout *)self boundsForMathResultViews];
    v24.origin.CGFloat x = v11;
    v24.origin.CGFloat y = v12;
    v24.size.CGFloat width = v13;
    v24.size.CGFloat height = v14;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectUnion(v21, v24);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)computeLayoutGeometry
{
  v21.receiver = self;
  v21.super_class = (Class)CRLFreehandDrawingLayout;
  double v3 = [(CRLGroupLayout *)&v21 computeLayoutGeometry];
  if ([(CRLCanvasLayout *)self isSelectable])
  {
    [(CRLGroupLayout *)self boundsForStandardKnobs];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    if (v3) {
      [v3 transform];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    v23.origin.CGFloat x = v5;
    v23.origin.CGFloat y = v7;
    v23.size.CGFloat width = v9;
    v23.size.CGFloat height = v11;
    *(CGRect *)((char *)&self->_transformInfo + 2) = CGRectApplyAffineTransform(v23, &v20);
    CGFloat v12 = [(CRLCanvasLayout *)self layoutController];
    CGFloat v13 = [v12 canvas];
    CGFloat v14 = [v13 canvasController];

    if (v14)
    {
      double v15 = [(CRLCanvasLayout *)self info];
      if ([v14 currentSelectionPathContainsInfo:v15])
      {
        double v16 = [v14 layerHost];
        double v17 = [v16 miniFormatterPresenter];

        double v18 = [v17 asiOSPresenter];
        [v18 forceMiniFormatterVCToReposition];
      }
    }
  }

  return v3;
}

- (CRLCanvasLayoutGeometry)pureGeometryWithoutMathResults
{
  CGFloat v2 = *(double *)((char *)&self->_frameForMiniFormatterPositioning.size.height + 2);
  CGFloat v3 = *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.x + 2);
  double v4 = *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.origin.y + 2);
  double v5 = *(double *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.width + 2);
  memset(&v14, 0, sizeof(v14));
  double v6 = [(CRLCanvasAbstractLayout *)self geometry];
  CGFloat v7 = v6;
  if (v6) {
    [v6 transform];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }

  CGAffineTransformMakeTranslation(&t1, v2, v3);
  CGAffineTransform v11 = v14;
  CGAffineTransformConcat(&v13, &t1, &v11);
  CGAffineTransform v14 = v13;
  double v8 = [CRLCanvasLayoutGeometry alloc];
  CGAffineTransform v13 = v14;
  CGFloat v9 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v8, "initWithSize:transform:", &v13, v4, v5);

  return v9;
}

- (CRLCanvasLayoutGeometry)pureGeometryInRootWithoutMathResults
{
  CGFloat v3 = [(CRLFreehandDrawingLayout *)self pureGeometryWithoutMathResults];
  double v4 = [(CRLCanvasAbstractLayout *)self geometryInRoot:v3];

  return (CRLCanvasLayoutGeometry *)v4;
}

- (CGAffineTransform)pureTransformInRootWithoutMathResults
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  double v5 = [(CRLFreehandDrawingLayout *)self pureGeometryWithoutMathResults];
  double v6 = v5;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tCGFloat x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  CGRect result = [(CRLCanvasAbstractLayout *)self parent];
  if (result)
  {
    double v8 = result;
    do
    {
      CGFloat v9 = [(CGAffineTransform *)v8 geometry];
      double v10 = v9;
      if (v9)
      {
        long long v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        [v9 transformByConcatenatingTransformTo:v14];
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v15 = 0u;
      }
      long long v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tCGFloat x = v17;

      uint64_t v13 = [(CGAffineTransform *)v8 parent];

      double v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (void)setupMathRecognitionHandler
{
  CGFloat v3 = [(CRLCanvasLayout *)self layoutController];
  double v4 = [v3 canvas];
  double v5 = [v4 canvasController];

  if ([v5 isCanvasInteractive])
  {
    double v6 = *(UIViewController **)((char *)&self->_baseMathViewController + 2);
    if (!v6 || ([v6 frame], CGRectIsEmpty(v28)))
    {
      [(CRLFreehandDrawingLayout *)self p_getUnRotatedFrameWithoutMathResults];
      [v5 convertUnscaledToBoundsRect:];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      long long v15 = -[CRLMathResultView initWithFrame:delegate:]([_TtC8Freeform17CRLMathResultView alloc], "initWithFrame:delegate:", self, v7, v9, v11, v13);
      long long v16 = *(UIViewController **)((char *)&self->_baseMathViewController + 2);
      *(UIViewController **)((char *)&self->_baseMathViewController + 2) = (UIViewController *)v15;

      long long v17 = *(UIViewController **)((char *)&self->_baseMathViewController + 2);
      double v18 = +[UIColor clearColor];
      [v17 setBackgroundColor:v18];

      [*(id *)((char *)&self->_baseMathViewController + 2) setClipsToBounds:0];
      *(double *)((char *)&self->_boundsForMathResultViews.size.height + 2) = v8;
      *(double *)((char *)&self->_frameAtMathViewAttachment.origin.x + 2) = v10;
      *(double *)((char *)&self->_frameAtMathViewAttachment.origin.y + 2) = v12;
      *(double *)((char *)&self->_frameAtMathViewAttachment.size.width + 2) = v14;
      objc_super v19 = [(CRLCanvasLayout *)self pureGeometryInRoot];
      CGAffineTransform v20 = v19;
      if (v19)
      {
        [v19 transform];
      }
      else
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v25 = 0u;
      }
      *(double *)((char *)&self->_mathRecognitionHandler + 2) = sub_10007F7C8((double *)&v25);

      *(double *)((char *)&self->_rotationAtMathViewAttachment + 2) = v12 / v14;
      id v21 = objc_alloc_init((Class)UIViewController);
      CGRect v22 = *(void **)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2);
      *(void *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2) = v21;

      [*(id *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2) setView:*(UIViewController **)((char *)&self->_baseMathViewController + 2)];
      CGRect v23 = [v5 layerHost];
      CGRect v24 = [v23 asiOSCVC];

      [v24 addChildViewController:*(void *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2)];
    }
    [(CRLFreehandDrawingLayout *)self resetMathRecognitionHandlerIfRequestedAndEnabled];
  }
}

- (void)resetMathRecognitionHandlerIfRequestedAndEnabled
{
  CGFloat v3 = [(CRLCanvasLayout *)self layoutController];
  double v4 = [v3 canvas];
  double v5 = [v4 canvasController];

  double v6 = [v5 mathCalculationController];
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1CE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101071CDC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1D08);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout resetMathRecognitionHandlerIfRequestedAndEnabled]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 238, 0, "invalid nil value for '%{public}s'", "mathCalculationController");
  }
  if (([v6 isSolvingSuspended] & 1) == 0)
  {
    [*(id *)((char *)&self->_baseMathView + 2) willBeRemoved];
    double v10 = *(_TtC8Freeform17CRLMathResultView **)((char *)&self->_baseMathView + 2);
    *(_TtC8Freeform17CRLMathResultView **)((char *)&self->_baseMathView + 2) = 0;

    if ([v6 mathHintsMode])
    {
      double v11 = [[_TtC8Freeform30CRLMathRecognitionItemsHandler alloc] initWithLayout:self view:*(UIViewController **)((char *)&self->_baseMathViewController + 2) viewController:*(void *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2)];
      double v12 = *(_TtC8Freeform17CRLMathResultView **)((char *)&self->_baseMathView + 2);
      *(_TtC8Freeform17CRLMathResultView **)((char *)&self->_baseMathView + 2) = (_TtC8Freeform17CRLMathResultView *)v11;
    }
  }
}

- (CGRect)p_getUnRotatedFrameWithoutMathResults
{
  if ([(CRLCanvasLayout *)self layoutState])
  {
    CGFloat v3 = [(CRLCanvasLayout *)self dynamicGeometry];
    [v3 infoGeometry];
  }
  else
  {
    CGFloat v3 = [(CRLCanvasLayout *)self info];
    [v3 geometry];
  double v4 = };
  [v4 boundsBeforeRotation];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(CRLFreehandDrawingLayout *)self pureGeometryWithoutMathResults];
  [v9 size];
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  [(CRLFreehandDrawingLayout *)self pureTransformInRootWithoutMathResults];
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v19.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v15 = *(_OWORD *)&v19.a;
  *(_OWORD *)&v19.c = v16;
  *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v14 = *(_OWORD *)&v19.tx;
  CGAffineTransformMakeTranslation(&t2, *(double *)&v22 - v6, *((double *)&v22 + 1) - v8);
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tCGFloat x = v14;
  CGAffineTransformConcat(&v19, &t1, &t2);
  CGAffineTransform t1 = v19;
  v23.origin.CGFloat x = v6;
  v23.origin.CGFloat y = v8;
  v23.size.CGFloat width = v11;
  v23.size.CGFloat height = v13;
  return CGRectApplyAffineTransform(v23, &t1);
}

- (void)subviewWillBeRemovedWithSubview:(id)a3
{
}

- (void)didAddSubviewWithSubview:(id)a3
{
}

- (void)p_updateBoundsForMathResultSubviewsWillChangeWithDelay:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CRLCanvasLayout *)self layoutController];
  double v6 = [v5 canvas];
  id v9 = [v6 canvasController];

  double v7 = [(CRLFreehandDrawingLayout *)self freehandInfo];
  double v8 = [v9 repForInfo:v7];

  [v8 invalidateKnobs];
  [(CRLCanvasLayout *)self invalidateFrame];
  if (v3) {
    [(CRLFreehandDrawingLayout *)self performSelector:"p_updateLayoutBoundsForMathResultView" withObject:0 afterDelay:0.0];
  }
  else {
    [(CRLFreehandDrawingLayout *)self p_updateLayoutBoundsForMathResultView];
  }
}

- (void)p_updateLayoutBoundsForMathResultView
{
  [(CRLFreehandDrawingLayout *)self p_boundsForMathResultViews];
  -[CRLFreehandDrawingLayout setBoundsForMathResultViews:](self, "setBoundsForMathResultViews:");

  [(CRLCanvasLayout *)self invalidateFrame];
}

- (CGRect)p_boundsForMathResultViews
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v7 = [self->_baseMathViewController subviews];
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        CGFloat v13 = [v12 subviews];
        id v14 = [v13 count];

        if (v14)
        {
          [(CRLFreehandDrawingLayout *)self p_boundsInNaturalSpaceForMathView:v12];
          v31.origin.CGFloat x = v15;
          v31.origin.CGFloat y = v16;
          v31.size.CGFloat width = v17;
          v31.size.CGFloat height = v18;
          v28.origin.CGFloat x = x;
          v28.origin.CGFloat y = y;
          v28.size.CGFloat width = width;
          v28.size.CGFloat height = height;
          CGRect v29 = CGRectUnion(v28, v31);
          CGFloat x = v29.origin.x;
          CGFloat y = v29.origin.y;
          CGFloat width = v29.size.width;
          CGFloat height = v29.size.height;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)p_boundsInNaturalSpaceForMathView:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLCanvasLayout *)self layoutController];
  double v6 = [v5 canvas];
  double v7 = [v6 canvasController];

  [v4 bounds];
  double v9 = v8;
  double v11 = v10;
  [v4 bounds];
  double v16 = sub_1000657F8(v12, v13, v14, v15);
  double v18 = v17;
  [*(id *)((char *)&self->_baseMathViewController + 2) convertPoint:v4 fromView:v9];
  double v20 = v19;
  double v22 = v21;
  [*(id *)((char *)&self->_baseMathViewController + 2) convertPoint:v4 fromView:v16];
  double v24 = v23;
  double v26 = v25;

  long long v27 = [v7 canvasView];
  [v27 convertPoint:*(UIViewController **)((char *)&self->_baseMathViewController + 2) fromView:v20, v22];
  double v29 = v28;
  double v31 = v30;

  v32 = [v7 canvasView];
  [v32 convertPoint:*(UIViewController **)((char *)&self->_baseMathViewController + 2) fromView:v24, v26];
  double v34 = v33;
  double v36 = v35;

  [v7 convertBoundsToUnscaledPoint:v29, v31];
  double v38 = v37;
  double v40 = v39;
  [v7 convertBoundsToUnscaledPoint:v34, v36];
  double v42 = v41;
  double v44 = v43;
  -[CRLCanvasLayout convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v38, v40);
  double v46 = v45;
  double v48 = v47;
  -[CRLCanvasLayout convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v42, v44);
  double v50 = sub_100064044(v46, v48, v49);
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;

  double v57 = v50;
  double v58 = v52;
  double v59 = v54;
  double v60 = v56;
  result.size.CGFloat height = v60;
  result.size.CGFloat width = v59;
  result.origin.CGFloat y = v58;
  result.origin.CGFloat x = v57;
  return result;
}

- (id)computeWrapPath
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(CRLFreehandDrawingLayout *)self freehandInfo];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v25 = self;
  double v5 = [(CRLCanvasAbstractLayout *)self children];
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        CGFloat v12 = sub_1002469D0(v11, v10);
        if (v12)
        {
          CGFloat v13 = [v10 info];
          unsigned __int8 v14 = [v4 isNonGroupedChild:v13];

          if ((v14 & 1) == 0) {
            [v3 addObject:v12];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    CGFloat v15 = [(CRLCanvasLayout *)v25 layoutController];
    double v16 = [v15 canvas];

    if (!v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1D28);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101071D70();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1D48);
      }
      double v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      double v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout computeWrapPath]");
      double v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 345, 0, "invalid nil value for '%{public}s'", "canvas");
    }
    [v16 viewScale];
    double v21 = +[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:v3 unscaledOutset:0.0 viewScale:v20];
    double v22 = v21;
    if (v21 && ([v21 isEmpty] & 1) == 0)
    {
      [(CRLCanvasAbstractLayout *)v25 transformInRoot];
      CGAffineTransformInvert(&v27, &v26);
      [v22 transformUsingAffineTransform:&v27];
    }
    else
    {
      [(CRLGroupLayout *)v25 boundsForStandardKnobs];
      uint64_t v23 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");

      double v22 = (void *)v23;
    }
  }
  else
  {
    [(CRLGroupLayout *)v25 boundsForStandardKnobs];
    double v22 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
  }

  return v22;
}

- (id)pathForClippingConnectionLines
{
  id v3 = [(CRLFreehandDrawingLayout *)self freehandInfo];
  unsigned int v4 = [v3 shouldBeTreatedAsBoxForConnectionLinesForPerf];

  if (v4)
  {
    [(CRLGroupLayout *)self boundsForStandardKnobs];
    double v5 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingLayout;
    double v5 = [(CRLGroupLayout *)&v7 pathForClippingConnectionLines];
  }

  return v5;
}

- (CGRect)frameForMiniFormatterPositioning
{
  v16.receiver = self;
  v16.super_class = (Class)CRLFreehandDrawingLayout;
  [(CRLGroupLayout *)&v16 frameForMiniFormatterPositioning];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  uint64_t v11 = (CGRect *)((char *)&self->_transformInfo + 2);
  v17.origin.CGFloat x = v11->origin.x;
  v17.origin.CGFloat y = v11->origin.y;
  v17.size.CGFloat width = v11->size.width;
  v17.size.CGFloat height = v11->size.height;
  if (!CGRectIsNull(v17))
  {
    v19.origin.CGFloat x = CGRectZero.origin.x;
    v19.origin.CGFloat y = CGRectZero.origin.y;
    v19.size.CGFloat width = CGRectZero.size.width;
    v19.size.CGFloat height = CGRectZero.size.height;
    if (!CGRectEqualToRect(*v11, v19))
    {
      CGFloat x = v11->origin.x;
      CGFloat y = v11->origin.y;
      CGFloat width = v11->size.width;
      CGFloat height = v11->size.height;
    }
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (unint64_t)maxFilledShapeIndex
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CGFloat v2 = [(CRLFreehandDrawingLayout *)self freehandInfo];
  double v3 = [v2 childInfos];

  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint64_t v8 = 0;
      unint64_t v9 = (unint64_t)v5 + v6;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v8);
        uint64_t v11 = objc_opt_class();
        double v12 = sub_1002469D0(v11, v10);
        double v13 = v12;
        if (!v12
          || ([v12 fill], double v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
        {

          unint64_t v9 = (unint64_t)v8 + v6;
          goto LABEL_13;
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      unint64_t v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
LABEL_13:

  return v9;
}

- (void)endDynamicOperation
{
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingLayout;
  [(CRLGroupLayout *)&v4 endDynamicOperation];
  double v3 = *(void **)(&self->super._hasInvalidated + 2);
  *(void *)(&self->super._hasInvalidated + 2) = 0;
}

- (void)transformLayoutDidBeginDynamicOperation
{
  if (BYTE2(self->_dynamicDescendentWrappables))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1D68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101071E98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1D88);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout transformLayoutDidBeginDynamicOperation]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:416 isFatal:0 description:"Should only begin a transform dynamic operation when not in one already."];
  }
  BYTE2(self->_dynamicDescendentWrappables) = 1;
  if (*(void *)(&self->super._hasInvalidated + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1DA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101071E04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1DC8);
    }
    unint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout transformLayoutDidBeginDynamicOperation]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 418, 0, "expected nil value for '%{public}s'", "_dynamicDescendentWrappables");
  }
}

- (void)transformLayoutDidEndDynamicOperation
{
  if (!BYTE2(self->_dynamicDescendentWrappables))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1DE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101071F2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1E08);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout transformLayoutDidEndDynamicOperation]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:422 isFatal:0 description:"Should only end a transform dynamic operation when in one already."];
  }
  BYTE2(self->_dynamicDescendentWrappables) = 0;
  unint64_t v6 = *(void **)(&self->super._hasInvalidated + 2);
  *(void *)(&self->super._hasInvalidated + 2) = 0;
}

- (BOOL)exclusivelyProvidesGuidesForChildLayouts
{
  return 1;
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  return &__NSArray0__struct;
}

- (CRLFreehandDrawingTransformInfo)transformInfo
{
  return (CRLFreehandDrawingTransformInfo *)objc_retainAutoreleaseReturnValue(*(id *)(&self->_isTransformLayoutInDynamicOperation
                                                                                    + 2));
}

- (BOOL)isInteractable
{
  CGFloat v2 = self;
  double v3 = v2;
  if (v2)
  {
    objc_super v4 = v2;
    while (1)
    {
      id v5 = (objc_class *)objc_opt_class();
      unint64_t v6 = [v4 info];
      uint64_t v7 = sub_10024715C(v5, v6);

      if ([v7 locked]) {
        break;
      }
      uint64_t v8 = objc_opt_class();
      unint64_t v9 = [v4 parent];
      uint64_t v10 = sub_1002469D0(v8, v9);

      objc_super v4 = (void *)v10;
      if (!v10) {
        goto LABEL_5;
      }
    }

    unsigned __int8 v17 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v11 = [(CRLCanvasLayout *)v3 layoutController];
    double v12 = [v11 canvas];
    objc_super v4 = [v12 canvasController];

    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1E28);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101071FC0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1E48);
      }
      double v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingLayout isInteractable]");
      double v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 455, 0, "invalid nil value for '%{public}s'", "icc");
    }
    long long v16 = [v4 canvasEditor];
    unsigned __int8 v17 = [v16 isLayoutSelectable:v3];
  }
  return v17;
}

- (BOOL)showingSubselectionAffordance
{
  return *(void *)(&self->_isTransformLayoutInDynamicOperation + 2) != 0;
}

- (void)showSubselectionAffordanceForSelectedInfos:(id)a3
{
  id v22 = a3;
  id v4 = [v22 count];
  id v5 = *(void **)(&self->_isTransformLayoutInDynamicOperation + 2);
  if (v4)
  {
    if (!v5)
    {
      unint64_t v6 = [CRLFreehandDrawingTransformInfo alloc];
      uint64_t v7 = [(CRLFreehandDrawingLayout *)self freehandInfo];
      uint64_t v8 = [(CRLFreehandDrawingTransformInfo *)v6 initWithParentInfo:v7];
      unint64_t v9 = *(void **)(&self->_isTransformLayoutInDynamicOperation + 2);
      *(void *)(&self->_isTransformLayoutInDynamicOperation + 2) = v8;

      [(CRLCanvasLayout *)self invalidateChildren];
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = [(CRLCanvasLayout *)self layoutController];
    double v12 = [v11 layoutForInfo:*(void *)(&self->_isTransformLayoutInDynamicOperation + 2)];
    double v13 = sub_10024715C(v10, v12);

    double v14 = *(void **)(&self->_isTransformLayoutInDynamicOperation + 2);
    double v15 = [(CRLCanvasLayout *)self layoutController];
    [v14 setRepresentedShapeInfos:v22 currentlyLaidOutOnLayoutController:v15];

    [v13 invalidateFrame];
    long long v16 = (objc_class *)objc_opt_class();
    unsigned __int8 v17 = [(CRLCanvasLayout *)self layoutController];
    long long v18 = [v17 canvas];
    long long v19 = [v18 canvasController];
    double v20 = [v19 repForInfo:*(void *)(&self->_isTransformLayoutInDynamicOperation + 2)];
    double v21 = sub_10024715C(v16, v20);

    if (v21)
    {
      [v21 invalidateSubselectionAffordance];
      [v21 invalidateKnobs];
    }
  }
  else if (v5)
  {
    *(void *)(&self->_isTransformLayoutInDynamicOperation + 2) = 0;

    [(CRLCanvasLayout *)self invalidateChildren];
  }
}

+ (id)freehandDrawingLayoutsToInteractWithFromLayouts:(id)a3
{
  id v3 = a3;
  id v29 = +[NSMutableArray array];
  if ([v3 count])
  {
    id v4 = [v3 crl_anyObject];
    id v5 = [v4 layoutController];
    unint64_t v6 = [v5 canvas];
    uint64_t v7 = [v6 canvasController];

    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1E68);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101072054();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1E88);
      }
      uint64_t v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      unint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:]");
      uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 498, 0, "invalid nil value for '%{public}s'", "icc");
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = v3;
    id v11 = v3;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v17 = objc_opt_class();
          long long v18 = sub_1002469D0(v17, v16);
          long long v19 = (objc_class *)objc_opt_class();
          double v20 = [v18 info];
          double v21 = sub_10024715C(v19, v20);

          if (!v18 || ([v21 locked] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v22 = [v7 canvasEditor];
              unsigned int v23 = [v22 isLayoutSelectable:v16];

              if (v23) {
                [v29 addObject:v16];
              }
            }
            else if (v18)
            {
              double v24 = [v18 children];
              double v25 = [a1 freehandDrawingLayoutsToInteractWithFromLayouts:v24];
              [v29 addObjectsFromArray:v25];
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    id v3 = v27;
  }

  return v29;
}

+ (BOOL)anyFreehandDrawingsVisibleInInteractiveCanvasController:(id)a3
{
  return _objc_msgSend(a1, "p_anyFreehandDrawingsVisibleInInteractiveCanvasController:findSelected:", a3, 0);
}

+ (BOOL)anyFreehandDrawingsVisibleAndSelectedInInteractiveCanvasController:(id)a3
{
  return _objc_msgSend(a1, "p_anyFreehandDrawingsVisibleInInteractiveCanvasController:findSelected:", a3, 1);
}

+ (BOOL)p_anyFreehandDrawingsVisibleInInteractiveCanvasController:(id)a3 findSelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 layoutController];
  [v6 visibleUnscaledRect];
  [v7 layoutsInRect:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(a1, "p_layoutIsFreehandDrawing:andSelected:icc:", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, v6, (void)v15))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)p_layoutIsFreehandDrawing:(id)a3 andSelected:(BOOL)a4 icc:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 && v6)
  {
    id v10 = [v7 info];
    unsigned __int8 isKindOfClass = [v8 currentSelectionPathContainsInfo:v10];
  }
  return isKindOfClass & 1;
}

- (id)childSearchTargets
{
  return &__NSArray0__struct;
}

- (CGRect)boundsForMathResultViews
{
  double v2 = *(double *)((char *)&self->_previousAspectRatio + 2);
  double v3 = *(double *)((char *)&self->_boundsForMathResultViews.origin.x + 2);
  double v4 = *(double *)((char *)&self->_boundsForMathResultViews.origin.y + 2);
  double v5 = *(double *)((char *)&self->_boundsForMathResultViews.size.width + 2);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setBoundsForMathResultViews:(CGRect)a3
{
  *(double *)((char *)&self->_previousAspectRatio + 2) = a3.origin.x;
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.origin.x + 2) = a3.origin.y;
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.origin.y + 2) = a3.size.width;
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.size.width + 2) = a3.size.height;
}

- (_TtC8Freeform17CRLMathResultView)baseMathView
{
  return *(_TtC8Freeform17CRLMathResultView **)((char *)&self->_baseMathViewController + 2);
}

- (_TtC8Freeform30CRLMathRecognitionItemsHandler)mathRecognitionHandler
{
  return *(_TtC8Freeform30CRLMathRecognitionItemsHandler **)((char *)&self->_baseMathView + 2);
}

- (CGRect)frameAtMathViewAttachment
{
  double v2 = *(double *)((char *)&self->_boundsForMathResultViews.size.height + 2);
  double v3 = *(double *)((char *)&self->_frameAtMathViewAttachment.origin.x + 2);
  double v4 = *(double *)((char *)&self->_frameAtMathViewAttachment.origin.y + 2);
  double v5 = *(double *)((char *)&self->_frameAtMathViewAttachment.size.width + 2);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setFrameAtMathViewAttachment:(CGRect)a3
{
  *(CGFloat *)((char *)&self->_boundsForMathResultViews.size.height + 2) = a3.origin.x;
  *(CGFloat *)((char *)&self->_frameAtMathViewAttachment.origin.x + 2) = a3.origin.y;
  *(CGFloat *)((char *)&self->_frameAtMathViewAttachment.origin.y + 2) = a3.size.width;
  *(CGFloat *)((char *)&self->_frameAtMathViewAttachment.size.width + 2) = a3.size.height;
}

- (double)rotationAtMathViewAttachment
{
  return *(double *)((char *)&self->_mathRecognitionHandler + 2);
}

- (void)setRotationAtMathViewAttachment:(double)a3
{
  *(double *)((char *)&self->_mathRecognitionHandler + 2) = a3;
}

- (double)previousAspectRatio
{
  return *(double *)((char *)&self->_rotationAtMathViewAttachment + 2);
}

- (void)setPreviousAspectRatio:(double)a3
{
  *(double *)((char *)&self->_rotationAtMathViewAttachment + 2) = a3;
}

- (CGRect)cachedFrameForMiniFormatterPositioning
{
  double v2 = *(double *)((char *)&self->_frameAtMathViewAttachment.size.height + 2);
  double v3 = *(double *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.x + 2);
  double v4 = *(double *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.y + 2);
  double v5 = *(double *)((char *)&self->_cachedFrameForMiniFormatterPositioning.size.width + 2);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setCachedFrameForMiniFormatterPositioning:(CGRect)a3
{
  *(CGFloat *)((char *)&self->_frameAtMathViewAttachment.size.height + 2) = a3.origin.x;
  *(CGFloat *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.x + 2) = a3.origin.y;
  *(CGFloat *)((char *)&self->_cachedFrameForMiniFormatterPositioning.origin.y + 2) = a3.size.width;
  *(CGFloat *)((char *)&self->_cachedFrameForMiniFormatterPositioning.size.width + 2) = a3.size.height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_baseMathView + 2), 0);
  objc_storeStrong((id *)((char *)&self->_baseMathViewController + 2), 0);
  objc_storeStrong((id *)((char *)&self->_boundsForStandardKnobsWithoutMathResultsViews.size.height + 2), 0);
  objc_storeStrong((id *)(&self->_isTransformLayoutInDynamicOperation + 2), 0);

  objc_storeStrong((id *)(&self->super._hasInvalidated + 2), 0);
}

@end