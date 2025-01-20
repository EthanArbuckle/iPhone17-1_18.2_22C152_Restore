@interface CRLCanvasGuideController
+ (BOOL)shouldAlignCenters;
+ (BOOL)shouldAlignEdges;
+ (BOOL)shouldAlignEdgesToTemplateGuides;
+ (BOOL)shouldAlignToSizingGuides;
+ (BOOL)shouldAlignToSpacingGuides;
+ (BOOL)shouldSnapToGrid;
+ (BOOL)shouldSnapToOffscreenContent;
+ (BOOL)shouldUseHapticFeedbackWhenSnapping;
+ (CRLColor)defaultGuideColor;
+ (CRLColor)guideColor;
+ (void)setGuideColor:(id)a3;
+ (void)setShouldAlignCenters:(BOOL)a3;
+ (void)setShouldAlignEdges:(BOOL)a3;
+ (void)setShouldAlignEdgesToTemplateGuides:(BOOL)a3;
+ (void)setShouldAlignToSizingGuides:(BOOL)a3;
+ (void)setShouldAlignToSpacingGuides:(BOOL)a3;
+ (void)setShouldSnapToGrid:(BOOL)a3;
+ (void)setShouldUseHapticFeedbackWhenSnapping:(BOOL)a3;
- (BOOL)didJustSnapInX;
- (BOOL)didJustSnapInY;
- (BOOL)doNotRemoveExistingGuidesWhenDisplaying;
- (BOOL)p_guidesAreRelevantForEdge:(int)a3 whileDraggingKnobTag:(unint64_t)a4;
- (BOOL)p_sizingGuidesAreRelevantForOrientation:(int)a3 whileDraggingKnobTag:(unint64_t)a4;
- (CGPoint)snapRectToGuides:(CGRect)a3;
- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4;
- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5;
- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5 snapWithBackgroundAlignmentProvider:(BOOL)a6 isLine:(BOOL)a7 startPoint:(CGPoint)a8 endPoint:(CGPoint)a9;
- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5 snapWithBackgroundAlignmentProvider:(BOOL)a6 isLine:(BOOL)a7 startPoint:(CGPoint)a8 endPoint:(CGPoint)a9 hasHorizontalFlip:(BOOL)a10 hasVerticalFlip:(BOOL)a11 snapWithGuides:(BOOL)a12;
- (CGRect)i_currentGuidesRect;
- (CGRect)p_alignmentFrameInRootForLayout:(id)a3;
- (CRLCanvasGuideController)initWithInteractiveCanvasController:(id)a3;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (NSArray)decoratorOverlayRenderables;
- (NSSet)i_currentGuides;
- (double)p_maxSnapForSnapDistance:(double)a3;
- (double)snapDistanceToUseForGuides;
- (float)p_spacingForCenterOrSpacingGuide:(id)a3;
- (id)p_closestGuideForOffset:(double)a3 predicate:(id)a4 inArray:(id)a5;
- (id)p_guideClosestToEdge:(int)a3 ofFrame:(CGRect)a4;
- (id)p_guidesForEdge:(int)a3 ofFrame:(CGRect)a4;
- (id)p_guidesForOffset:(double)a3 predicate:(id)a4 inArray:(id)a5;
- (id)p_predicateCanBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5;
- (id)p_predicateCanBeSnappedToInVisibleUnscaledRect:(CGRect)a3;
- (int64_t)p_indexToInsertGuide:(id)a3 inSortedArray:(id)a4;
- (void)beginAlignmentOperationForRep:(id)a3;
- (void)beginAlignmentOperationForReps:(id)a3;
- (void)beginAlignmentOperationForReps:(id)a3 preventCenterGuides:(BOOL)a4 preventSpacingGuides:(BOOL)a5 preventSizingGuides:(BOOL)a6;
- (void)endAlignmentOperation;
- (void)hideAlignmentGuides;
- (void)hideSizingGuides;
- (void)p_addAlignmentGuide:(id)a3 toSortedArray:(id)a4;
- (void)p_addCenterAlignmentGuide:(id)a3 toSortedArray:(id)a4;
- (void)p_addGuidesForLayout:(id)a3;
- (void)p_addSizingGuide:(id)a3 toSortedArray:(id)a4;
- (void)p_addSpacingGuide:(id)a3 toSortedArray:(id)a4;
- (void)p_addSpacingGuidesForFrame:(CGRect)a3 spacing:(id)a4 isVerticalSpacing:(BOOL)a5;
- (void)p_getOffset:(double *)a3 andGuidesArray:(id *)a4 forEdge:(int)a5 ofFrame:(CGRect)a6;
- (void)setDidJustSnapInX:(BOOL)a3;
- (void)setDidJustSnapInY:(BOOL)a3;
- (void)setDoNotRemoveExistingGuidesWhenDisplaying:(BOOL)a3;
- (void)showGuidesAlignedWithRect:(CGRect)a3 forKnobTag:(unint64_t)a4;
- (void)showGuidesAlignedWithRect:(CGRect)a3 forKnobTag:(unint64_t)a4 shouldRenderX:(BOOL)a5 shouldRenderY:(BOOL)a6 shouldRenderSizeGuides:(BOOL)a7;
- (void)showGuidesAlignedWithRect:(CGRect)a3 shouldRenderX:(BOOL)a4 shouldRenderY:(BOOL)a5;
- (void)showSizingGuideUIForRep:(id)a3 matchingWidth:(BOOL)a4 matchingHeight:(BOOL)a5;
- (void)showSizingGuidesAlignedWithLayout:(id)a3 forKnobTag:(unint64_t)a4;
@end

@implementation CRLCanvasGuideController

+ (BOOL)shouldSnapToOffscreenContent
{
  return 1;
}

+ (CRLColor)defaultGuideColor
{
  return +[CRLColor colorWithRed:0.933 green:0.792 blue:0.0 alpha:1.0];
}

+ (void)setShouldAlignEdges:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"CRLDisplayEdgeGuides"];
}

+ (BOOL)shouldAlignEdges
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CRLDisplayEdgeGuides"];

  return v3;
}

+ (void)setShouldAlignToSpacingGuides:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"CRLDisplaySpacingGuides"];
}

+ (BOOL)shouldAlignToSpacingGuides
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CRLDisplaySpacingGuides"];

  return v3;
}

+ (void)setShouldAlignToSizingGuides:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"CRLDisplaySizingGuides"];
}

+ (void)setGuideColor:(id)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CD978);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101069D44();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CD998);
  }
  BOOL v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCanvasGuideController setGuideColor:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:288 isFatal:0 description:"iOS and QL do not support setting the guide color"];
}

+ (BOOL)shouldAlignToSizingGuides
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CRLDisplaySizingGuides"];

  return v3;
}

+ (void)setShouldAlignCenters:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"CRLDisplayCenterGuides"];
}

+ (BOOL)shouldAlignCenters
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CRLDisplayCenterGuides"];

  return v3;
}

+ (void)setShouldSnapToGrid:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:5])
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:v3 forKey:@"CRLSnapToGrid"];
  }
}

+ (BOOL)shouldSnapToGrid
{
  BOOL v2 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:5];
  if (v2)
  {
    BOOL v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"CRLSnapToGrid"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (double)snapDistanceToUseForGuides
{
  BOOL v3 = [(CRLCanvasGuideController *)self interactiveCanvasController];
  double v4 = 7.0;
  if (![v3 isCanvasBackgroundAlignmentSnappingEnabled]) {
    goto LABEL_4;
  }
  v5 = [(CRLCanvasGuideController *)self interactiveCanvasController];
  v6 = [v5 canvasBackground];
  v7 = [v6 alignmentProvider];

  if (v7)
  {
    BOOL v3 = [(CRLCanvasGuideController *)self interactiveCanvasController];
    v8 = [v3 canvasBackground];
    v9 = [v8 alignmentProvider];
    [v9 snapDistanceForViewScale:1.0];
    double v4 = v10;

LABEL_4:
  }
  return v4;
}

+ (void)setShouldAlignEdgesToTemplateGuides:(BOOL)a3
{
  byte_1016A8EF8 = a3;
}

+ (BOOL)shouldAlignEdgesToTemplateGuides
{
  return byte_1016A8EF8;
}

+ (CRLColor)guideColor
{
  return (CRLColor *)_[a1 defaultGuideColor];
}

+ (void)setShouldUseHapticFeedbackWhenSnapping:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"CRLUseHapticFeedbackWhenSnapping"];
}

+ (BOOL)shouldUseHapticFeedbackWhenSnapping
{
  BOOL v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CRLUseHapticFeedbackWhenSnapping"];

  return v3;
}

- (CRLCanvasGuideController)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasGuideController;
  v5 = [(CRLCanvasGuideController *)&v16 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_storeWeak((id *)&v5->_icc, v4);
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.freeform.CRLGuideGeneration", 0);
      guideGenerationAccessQueue = v6->_guideGenerationAccessQueue;
      v6->_guideGenerationAccessQueue = (OS_dispatch_queue *)v7;

      dispatch_semaphore_t v9 = dispatch_semaphore_create(1);
      guideGenerationStateLock = v6->_guideGenerationStateLock;
      v6->_guideGenerationStateLock = (OS_dispatch_semaphore *)v9;

      CGSize size = CGRectNull.size;
      v6->_lastIgnoredRectForDisplayingGuides.origin = CGRectNull.origin;
      v6->_lastIgnoredRectForDisplayingGuides.CGSize size = size;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CD9B8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101069DCC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CD9D8);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController initWithInteractiveCanvasController:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 431, 0, "invalid nil value for '%{public}s'", "icc");

      v6 = 0;
    }
  }

  return v6;
}

- (void)beginAlignmentOperationForRep:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD9F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069E64();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDA18);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForRep:]");
    dispatch_queue_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 447, 0, "invalid nil value for '%{public}s'", "rep");
  }
  v8 = +[NSSet setWithObject:v4];
  [(CRLCanvasGuideController *)self beginAlignmentOperationForReps:v8];
}

- (void)beginAlignmentOperationForReps:(id)a3
{
}

- (void)beginAlignmentOperationForReps:(id)a3 preventCenterGuides:(BOOL)a4 preventSpacingGuides:(BOOL)a5 preventSizingGuides:(BOOL)a6
{
  id v7 = a3;
  if (!+[NSThread isMainThread])
  {
    int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDA38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106A23C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDA58);
    }
    dispatch_semaphore_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106A184(v9, v8);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:456 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (v7 && [v7 count])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v61;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v61 != v14) {
            objc_enumerationMutation(v12);
          }
          objc_super v16 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if ([v16 exclusivelyProvidesGuidesWhileAligning])
          {
            id v17 = v16;
            goto LABEL_32;
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v60 objects:v64 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    id v17 = 0;
LABEL_32:

    CGSize size = CGRectNull.size;
    self->_lastIgnoredRectForDisplayingGuides.origin = CGRectNull.origin;
    self->_lastIgnoredRectForDisplayingGuides.CGSize size = size;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
    p_unint64_t guideGenerationState = &self->_guideGenerationState;
    unint64_t guideGenerationState = self->_guideGenerationState;
    if (guideGenerationState != 3)
    {
      if (guideGenerationState)
      {
        int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CDAB8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106A0F4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CDAD8);
        }
        v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106A03C(v26, v25);
        }
        v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:]");
        v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 478, 0, "Guide state unexpected when begin alignment operation! %lu", *p_guideGenerationState);
      }
      else
      {
        *p_unint64_t guideGenerationState = 1;
      }
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = sub_1000485F8;
    v58[4] = sub_100048608;
    id v59 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = sub_1000485F8;
    v56[4] = sub_100048608;
    id v57 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = sub_1000485F8;
    v54[4] = sub_100048608;
    id v55 = 0;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 1;
    guideGenerationAccessQueue = self->_guideGenerationAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100048610;
    block[3] = &unk_1014CDBE8;
    BOOL v47 = a4;
    BOOL v48 = a5;
    BOOL v49 = a6;
    block[4] = self;
    v43 = v54;
    id v41 = v12;
    v44 = &v50;
    v45 = v58;
    id v20 = v17;
    id v42 = v20;
    v46 = v56;
    dispatch_sync(guideGenerationAccessQueue, block);
    if (*((unsigned char *)v51 + 24))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
      [WeakRetained addDecorator:self];

      v31 = self->_guideGenerationAccessQueue;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100049570;
      v35[3] = &unk_1014CB068;
      id v36 = v20;
      v37 = self;
      v38 = v58;
      v39 = v56;
      dispatch_async(v31, v35);
    }
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(v54, 8);

    _Block_object_dispose(v56, 8);
    _Block_object_dispose(v58, 8);
  }
  else
  {
    int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDA78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069FB4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDA98);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069EFC(v19, v18);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:]");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:458 isFatal:0 description:"beginning alignment with no reps"];
  }
}

- (CGPoint)snapRectToGuides:(CGRect)a3
{
  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:](self, "snapRectToGuides:forKnobTag:snapSize:", 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4
{
  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:](self, "snapRectToGuides:forKnobTag:snapSize:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5
{
  LOBYTE(v7) = 1;
  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:](self, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:", a4, a5, 1, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, CGPointZero.x, CGPointZero.y, CGPointZero.x, CGPointZero.y, v7);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5 snapWithBackgroundAlignmentProvider:(BOOL)a6 isLine:(BOOL)a7 startPoint:(CGPoint)a8 endPoint:(CGPoint)a9
{
  LOBYTE(v11) = 1;
  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:](self, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:", a4, a5, a6, a7, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a8.x, a8.y, a9.x, a9.y, v11);
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5 snapWithBackgroundAlignmentProvider:(BOOL)a6 isLine:(BOOL)a7 startPoint:(CGPoint)a8 endPoint:(CGPoint)a9 hasHorizontalFlip:(BOOL)a10 hasVerticalFlip:(BOOL)a11 snapWithGuides:(BOOL)a12
{
  BOOL v88 = a10;
  BOOL v89 = a11;
  BOOL v87 = a7;
  BOOL v12 = a6;
  CGFloat y = a9.y;
  CGFloat x = a9.x;
  CGFloat v16 = a8.y;
  CGFloat v17 = a8.x;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat v21 = a3.origin.y;
  CGFloat v22 = a3.origin.x;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDC58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106A588();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDC78);
    }
    v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v24);
    }
    int v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:]");
    v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:791 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t guideGenerationState = self->_guideGenerationState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  if (guideGenerationState == 2)
  {
    if (fabs(v22) == INFINITY
      || fabs(v21) == INFINITY
      || fabs(width) == INFINITY
      || (double v28 = fabs(height), v28 >= INFINITY) && v28 <= INFINITY)
    {
      int v29 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CDC98);
      }
      v30 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106A478(v30, v29, v22, v21, width, height);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CDCB8);
      }
      v31 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v31);
      }
      v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:]");
      v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
      v93.origin.CGFloat x = v22;
      v93.origin.CGFloat y = v21;
      v93.size.double width = width;
      v93.size.CGFloat height = height;
      v34 = NSStringFromCGRect(v93);
      +[CRLAssertionHandler handleFailureInFunction:v32, v33, 800, 0, "bad rect for snap rect! %@", v34 file lineNumber isFatal description];
    }
    double v81 = y;
    double v82 = x;
    double v85 = v17;
    double v86 = height;
    double v83 = v16;
    double v35 = 7.0;
    if (v12) {
      [(CRLCanvasGuideController *)self snapDistanceToUseForGuides];
    }
    [(CRLCanvasGuideController *)self p_maxSnapForSnapDistance:v35];
    uint64_t v37 = v36;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    [WeakRetained visibleUnscaledRect];
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v46 = v45;

    if (a12)
    {
      BOOL v47 = objc_alloc_init(CRLBidirectionalGeometricOperator);
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10004A908;
      v90[3] = &unk_1014CDCE0;
      v90[5] = v37;
      v90[4] = self;
      v90[6] = a4;
      *(CGFloat *)&v90[7] = v22;
      *(CGFloat *)&v90[8] = v21;
      *(double *)&v90[9] = width;
      *(double *)&v90[10] = v86;
      v90[11] = v40;
      v90[12] = v42;
      v90[13] = v44;
      v90[14] = v46;
      BOOL v91 = a5;
      [(CRLBidirectionalGeometricOperator *)v47 executeBidirectionalOperation:v90];
      BOOL v48 = [(CRLBidirectionalGeometricOperator *)v47 valueForKey:@"CRLCanvasGuideControllerHorizontalSnapOffsetKey" swapped:0];
      [v48 floatValue];
      double v50 = v49;
      v51 = [(CRLBidirectionalGeometricOperator *)v47 valueForKey:@"CRLCanvasGuideControllerHorizontalSnapOffsetKey" swapped:1];
      [v51 floatValue];
      double v53 = v52;

      v54 = [(CRLBidirectionalGeometricOperator *)v47 valueForKey:@"CRLCanvasGuideControllerDidSnapHorizontalKey" swapped:0];
      unsigned int v55 = [v54 BOOLValue];

      v56 = [(CRLBidirectionalGeometricOperator *)v47 valueForKey:@"CRLCanvasGuideControllerDidSnapHorizontalKey" swapped:1];
      unsigned int v57 = [v56 BOOLValue];
    }
    else
    {
      unsigned int v57 = 0;
      unsigned int v55 = 0;
      double v50 = CGPointZero.x;
      double v53 = CGPointZero.y;
    }
    v58 = [(CRLCanvasGuideController *)self interactiveCanvasController];
    id v59 = [v58 canvasBackground];

    uint64_t v60 = [v59 alignmentProvider];
    long long v61 = (void *)v60;
    if (!v12
      || !v60
      || ([(CRLCanvasGuideController *)self interactiveCanvasController],
          long long v62 = objc_claimAutoreleasedReturnValue(),
          unsigned int v63 = [v62 isCanvasBackgroundAlignmentSnappingEnabled],
          v62,
          !v63))
    {
      self->_didJustSnapInX = v55;
      self->_didJustSnapInY = v57;
LABEL_70:

      goto LABEL_71;
    }
    if (a4 != 5 && a4)
    {
      BOOL v65 = v88;
      BOOL v64 = v89;
      if (v88 && v89)
      {
        uint64_t v70 = sub_1002895C8(a4);
      }
      else
      {
        uint64_t v70 = a4;
        if (v89)
        {
          uint64_t v72 = sub_100289B08(a4);
          uint64_t v70 = sub_1002895C8(v72);
        }
        else if (v88)
        {
          uint64_t v70 = sub_100289B08(a4);
        }
      }
      double v73 = sub_100289A18(v70, v22, v21, width, v86);
      double v84 = v74;
      double v85 = v73;
      [v61 alignmentPointForPoint:];
      switch(a4)
      {
        case 2uLL:
        case 8uLL:
          *(_WORD *)&self->_didJustSnapInX = 256;
          double v68 = v85;
          break;
        case 3uLL:
        case 7uLL:
        case 9uLL:
          goto LABEL_55;
        case 4uLL:
        case 6uLL:
          *(_WORD *)&self->_didJustSnapInX = 1;
          double v69 = v84;
          break;
        default:
          goto LABEL_56;
      }
      goto LABEL_56;
    }
    BOOL v65 = v88;
    BOOL v64 = v89;
    if (!v87) {
      goto LABEL_40;
    }
    [v61 alignmentPointForPoint:v85, v83];
    if (vabdd_f64(v82, v85) <= 0.01)
    {
      double v71 = -(width * 0.5);
      if (v83 >= v81) {
        double v71 = width * 0.5;
      }
    }
    else
    {
      if (vabdd_f64(v81, v83) > 0.01)
      {
LABEL_40:
        [v61 originPointForAligningRect:v22, v21, width, v86];
        double v85 = v22;
LABEL_55:
        *(_WORD *)&self->_didJustSnapInX = 257;
LABEL_56:
        double v75 = sub_100064680(v68, v69, v85);
        double v77 = -v75;
        if (!v65) {
          double v77 = v75;
        }
        double v78 = -v76;
        if (!v64) {
          double v78 = v76;
        }
        if (v55 && fabs(v50) < fabs(v75) && a12)
        {
          self->_didJustSnapInX = 1;
          double v77 = v50;
        }
        if (v57 && fabs(v53) < fabs(v76) && a12) {
          self->_didJustSnapInY = 1;
        }
        else {
          double v53 = v78;
        }
        double v50 = v77;
        goto LABEL_70;
      }
      double v71 = 0.0;
    }
    double v68 = sub_100064680(v66, v67, v71);
    goto LABEL_55;
  }
  double v50 = CGPointZero.x;
  double v53 = CGPointZero.y;
LABEL_71:
  double v79 = v50;
  double v80 = v53;
  result.CGFloat y = v80;
  result.CGFloat x = v79;
  return result;
}

- (void)showGuidesAlignedWithRect:(CGRect)a3 shouldRenderX:(BOOL)a4 shouldRenderY:(BOOL)a5
{
}

- (void)showGuidesAlignedWithRect:(CGRect)a3 forKnobTag:(unint64_t)a4
{
}

- (void)showGuidesAlignedWithRect:(CGRect)a3 forKnobTag:(unint64_t)a4 shouldRenderX:(BOOL)a5 shouldRenderY:(BOOL)a6 shouldRenderSizeGuides:(BOOL)a7
{
  BOOL obj = a7;
  BOOL v7 = a6;
  BOOL v8 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!+[NSThread isMainThread])
  {
    int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDD00);
    }
    CGFloat v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_10106A800();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDD20);
    }
    CGFloat v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_10106A74C(v15, v17);
    }

    int v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:1143 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t guideGenerationState = self->_guideGenerationState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  if (guideGenerationState != 2)
  {
    self->_lastIgnoredRectForDisplayingGuides.origin.double x = x;
    self->_lastIgnoredRectForDisplayingGuides.origin.double y = y;
    self->_lastIgnoredRectForDisplayingGuides.size.double width = width;
    self->_lastIgnoredRectForDisplayingGuides.size.double height = height;
    self->_lastIgnoredKnobTag = a4;
    self->_lastIgnoredShouldShowSizeGuides = obj;
    return;
  }
  CGFloat v21 = +[NSMutableSet set];
  __int16 v22 = sub_1002893CC(a4);
  if (a4 && (v22 & 0x3DE) == 0)
  {
    int v23 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDD40);
    }
    v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
      sub_10106A6C4();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDD60);
    }
    int v25 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
      sub_10106A610(v23, v25);
    }

    v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:]");
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:1165 isFatal:0 description:"Attempting to do guide operation for an unsupported knob type"];
  }
  if (v8)
  {
    if ([(CRLCanvasGuideController *)self p_guidesAreRelevantForEdge:0 whileDraggingKnobTag:a4])
    {
      double v28 = -[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 0, x, y, width, height);
      [v21 addObjectsFromArray:v28];
    }
    if ([(CRLCanvasGuideController *)self p_guidesAreRelevantForEdge:2 whileDraggingKnobTag:a4])
    {
      int v29 = -[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 2, x, y, width, height);
      [v21 addObjectsFromArray:v29];
    }
    if ([(CRLCanvasGuideController *)self p_guidesAreRelevantForEdge:1 whileDraggingKnobTag:a4])
    {
      v30 = -[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 1, x, y, width, height);
      [v21 addObjectsFromArray:v30];
    }
  }
  if (v7)
  {
    if ([(CRLCanvasGuideController *)self p_guidesAreRelevantForEdge:3 whileDraggingKnobTag:a4])
    {
      v31 = -[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 3, x, y, width, height);
      [v21 addObjectsFromArray:v31];
    }
    if ([(CRLCanvasGuideController *)self p_guidesAreRelevantForEdge:5 whileDraggingKnobTag:a4])
    {
      v32 = -[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 5, x, y, width, height);
      [v21 addObjectsFromArray:v32];
    }
    if ([(CRLCanvasGuideController *)self p_guidesAreRelevantForEdge:4 whileDraggingKnobTag:a4])
    {
      v33 = -[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 4, x, y, width, height);
      [v21 addObjectsFromArray:v33];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained visibleUnscaledRect];
  double v91 = v35;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  if (self->_shouldAlignToSpacingGuides)
  {
    if (self->_shouldAlignEdges) {
      goto LABEL_67;
    }
    if (v8)
    {
      if (a4 && (sub_1002893CC(a4) & 0x92) == 0) {
        goto LABEL_47;
      }
      v129.origin.double x = x;
      v129.origin.double y = y;
      v129.size.double width = width;
      v129.size.double height = height;
      double MinX = CGRectGetMinX(v129);
      uint64_t v43 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 0, x, y, width, height, v91, v37, v39, v41);
      uint64_t v44 = [(CRLCanvasGuideController *)self p_closestGuideForOffset:v43 predicate:self->_spacingGuidesForSnappingX inArray:MinX];

      if (v44)
      {
        [v44 offset];
        if (v45 - MinX == 0.0 || vabdd_f64(v45, MinX) < 0.00999999978) {
          [v21 addObject:v44 *(void *)&v91];
        }
      }

      if (a4)
      {
LABEL_47:
        if ((sub_1002893CC(a4) & 0x248) == 0)
        {
          if (!v7)
          {
            if (self->_shouldAlignCenters) {
              goto LABEL_86;
            }
LABEL_70:
            if ((sub_1002893CC(a4) & 4) != 0 || (sub_1002893CC(a4) & 0x100) != 0)
            {
LABEL_77:
              if (v7 && (!a4 || (sub_1002893CC(a4) & 0x10) == 0 && (sub_1002893CC(a4) & 0x40) == 0))
              {
                v134.origin.double x = x;
                v134.origin.double y = y;
                v134.size.double width = width;
                v134.size.double height = height;
                double MidY = CGRectGetMidY(v134);
                unsigned int v63 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 3, x, y, width, height, v91, v37, v39, v41);
                BOOL v64 = [(CRLCanvasGuideController *)self p_closestGuideForOffset:v63 predicate:self->_spacingCenterGuidesForSnappingY inArray:MidY];

                if (v64)
                {
                  [v64 offset];
                  if (v65 - MidY == 0.0 || vabdd_f64(v65, MidY) < 0.00999999978) {
                    [v21 addObject:v64, *(void *)&v91];
                  }
                }
              }
              goto LABEL_86;
            }
LABEL_72:
            v133.origin.double x = x;
            v133.origin.double y = y;
            v133.size.double width = width;
            v133.size.double height = height;
            double MidX = CGRectGetMidX(v133);
            id v59 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 1, x, y, width, height, v91, v37, v39, v41);
            uint64_t v60 = [(CRLCanvasGuideController *)self p_closestGuideForOffset:v59 predicate:self->_spacingCenterGuidesForSnappingX inArray:MidX];

            if (v60)
            {
              [v60 offset];
              if (v61 - MidX == 0.0 || vabdd_f64(v61, MidX) < 0.00999999978) {
                [v21 addObject:v60, *(void *)&v91];
              }
            }

            goto LABEL_77;
          }
          goto LABEL_55;
        }
      }
      v130.origin.double x = x;
      v130.origin.double y = y;
      v130.size.double width = width;
      v130.size.double height = height;
      double MaxX = CGRectGetMaxX(v130);
      BOOL v47 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 2, x, y, width, height, v91, v37, v39, v41);
      BOOL v48 = [(CRLCanvasGuideController *)self p_closestGuideForOffset:v47 predicate:self->_spacingGuidesForSnappingX inArray:MaxX];

      if (v48)
      {
        [v48 offset];
        if (v49 - MaxX == 0.0 || vabdd_f64(v49, MaxX) < 0.00999999978) {
          [v21 addObject:v48];
        }
      }
    }
    if (!v7) {
      goto LABEL_67;
    }
    if (!a4)
    {
LABEL_56:
      v131.origin.double x = x;
      v131.origin.double y = y;
      v131.size.double width = width;
      v131.size.double height = height;
      double MinY = CGRectGetMinY(v131);
      v51 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 3, x, y, width, height, v91, v37, v39, v41);
      float v52 = [(CRLCanvasGuideController *)self p_closestGuideForOffset:v51 predicate:self->_spacingGuidesForSnappingY inArray:MinY];

      if (v52)
      {
        [v52 offset];
        if (v53 - MinY == 0.0 || vabdd_f64(v53, MinY) < 0.00999999978) {
          [v21 addObject:v52, *(void *)&v91];
        }
      }

      if (!a4)
      {
LABEL_62:
        v132.origin.double x = x;
        v132.origin.double y = y;
        v132.size.double width = width;
        v132.size.double height = height;
        double MaxY = CGRectGetMaxY(v132);
        unsigned int v55 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 5, x, y, width, height, v91, v37, v39, v41);
        v56 = [(CRLCanvasGuideController *)self p_closestGuideForOffset:v55 predicate:self->_spacingGuidesForSnappingY inArray:MaxY];

        if (v56)
        {
          [v56 offset];
          if (v57 - MaxY == 0.0 || vabdd_f64(v57, MaxY) < 0.00999999978) {
            [v21 addObject:v56 *(void *)&v91];
          }
        }

LABEL_67:
        if (self->_shouldAlignCenters) {
          goto LABEL_86;
        }
        if (!v8) {
          goto LABEL_77;
        }
        if (!a4) {
          goto LABEL_72;
        }
        goto LABEL_70;
      }
LABEL_61:
      if ((sub_1002893CC(a4) & 0x380) == 0) {
        goto LABEL_67;
      }
      goto LABEL_62;
    }
LABEL_55:
    if ((sub_1002893CC(a4) & 0xE) == 0) {
      goto LABEL_61;
    }
    goto LABEL_56;
  }
LABEL_86:
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v66 = v21;
  id v67 = [v66 countByEnumeratingWithState:&v123 objects:v128 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v124;
    do
    {
      for (i = 0; i != v67; i = (char *)i + 1)
      {
        if (*(void *)v124 != v68) {
          objc_enumerationMutation(v66);
        }
        [*(id *)(*((void *)&v123 + 1) + 8 * i) setSnappingObjectFrame:x, y, width, height, *(void *)&v91];
      }
      id v67 = [v66 countByEnumeratingWithState:&v123 objects:v128 count:16];
    }
    while (v67);
  }

  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0x3032000000;
  v120 = sub_1000485F8;
  v121 = sub_100048608;
  id v122 = 0;
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x3032000000;
  v114 = sub_1000485F8;
  v115 = sub_100048608;
  id v116 = 0;
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x3032000000;
  v108 = sub_1000485F8;
  v109 = sub_100048608;
  id v110 = 0;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = sub_1000485F8;
  v103 = sub_100048608;
  id v104 = 0;
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_10004C07C;
  v98[3] = &unk_1014CDD88;
  v98[4] = self;
  v98[5] = &v117;
  v98[6] = &v111;
  v98[7] = &v105;
  v98[8] = &v99;
  uint64_t v70 = +[NSPredicate predicateWithBlock:v98];
  [v66 filterUsingPredicate:v70];

  if (v106[5]) {
    [v66 addObject:];
  }
  uint64_t v71 = v118[5];
  if (v71)
  {
    if (v106[5])
    {
      uint64_t v72 = [(id)v118[5] parentSpacing];
      unsigned int v73 = [v72 integerOffset];
      BOOL v74 = v73 == [(id)v106[5] integerOffset];

      if (!v74) {
        goto LABEL_100;
      }
      uint64_t v71 = v118[5];
    }
    [v66 addObject:v71 *(void *)&v91];
  }
LABEL_100:
  if (v100[5]) {
    [v66 addObject:];
  }
  uint64_t v75 = v112[5];
  if (!v75) {
    goto LABEL_107;
  }
  if (!v100[5]) {
    goto LABEL_106;
  }
  double v76 = [(id)v112[5] parentSpacing];
  unsigned int v77 = [v76 integerOffset];
  BOOL v78 = v77 == [(id)v100[5] integerOffset];

  if (v78)
  {
    uint64_t v75 = v112[5];
LABEL_106:
    [v66 addObject:v75 *(void *)&v91];
  }
LABEL_107:
  if ([(CRLCanvasGuideController *)self doNotRemoveExistingGuidesWhenDisplaying])
  {
    double v79 = [(NSSet *)self->_currentGuides allObjects];
    [v66 addObjectsFromArray:v79];
  }
  objc_storeStrong((id *)&self->_currentGuides, v21);
  self->_currentGuidesRect.origin.double x = x;
  self->_currentGuidesRect.origin.double y = y;
  self->_currentGuidesRect.size.double width = width;
  self->_currentGuidesRect.size.double height = height;
  [(NSMutableSet *)self->_currentSizingGuideUIRenderables removeAllObjects];
  if (obj && self->_shouldAlignToSizingGuides && (sub_1002893CC(a4) & 0x3DE) != 0)
  {
    id obja = objc_alloc_init((Class)NSMutableSet);
    if ([(CRLCanvasGuideController *)self p_sizingGuidesAreRelevantForOrientation:0 whileDraggingKnobTag:a4])
    {
      double v80 = [(CRLCanvasGuideController *)self p_guidesForOffset:0 predicate:self->_horizontalSizingGuides inArray:width];
      [obja addObjectsFromArray:v80];
    }
    if ([(CRLCanvasGuideController *)self p_sizingGuidesAreRelevantForOrientation:1 whileDraggingKnobTag:a4])
    {
      double v81 = [(CRLCanvasGuideController *)self p_guidesForOffset:0 predicate:self->_verticalSizingGuides inArray:height];
      [obja addObjectsFromArray:v81];
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v82 = obja;
    id v83 = [v82 countByEnumeratingWithState:&v94 objects:v127 count:16];
    if (v83)
    {
      uint64_t v84 = *(void *)v95;
      do
      {
        for (j = 0; j != v83; j = (char *)j + 1)
        {
          if (*(void *)v95 != v84) {
            objc_enumerationMutation(v82);
          }
          double v86 = *(void **)(*((void *)&v94 + 1) + 8 * (void)j);
          [v86 setSnappingObjectFrame:x, y, width, height];
          currentSizingGuideUIRenderables = self->_currentSizingGuideUIRenderables;
          id v88 = objc_loadWeakRetained((id *)&self->_icc);
          BOOL v89 = [v86 renderableWithICC:v88];
          [(NSMutableSet *)currentSizingGuideUIRenderables addObject:v89];
        }
        id v83 = [v82 countByEnumeratingWithState:&v94 objects:v127 count:16];
      }
      while (v83);
    }

    objc_storeStrong((id *)&self->_currentSizingGuides, obja);
  }
  id v90 = objc_loadWeakRetained((id *)&self->_icc);
  [v90 invalidateLayersForDecorator:self];

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v105, 8);

  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v117, 8);
}

- (NSSet)i_currentGuides
{
  return [(NSSet *)self->_currentGuides setByAddingObjectsFromSet:self->_currentSizingGuides];
}

- (void)showSizingGuidesAlignedWithLayout:(id)a3 forKnobTag:(unint64_t)a4
{
  id v6 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDDA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106A888();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDDC8);
    }
    BOOL v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    BOOL v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController showSizingGuidesAlignedWithLayout:forKnobTag:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1398 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (self->_shouldAlignToSizingGuides)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
    unint64_t guideGenerationState = self->_guideGenerationState;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
    if (guideGenerationState == 2)
    {
      [v6 alignmentFrameForProvidingGuidesInRoot];
      double v12 = v11;
      double v14 = v13;
      if (v6) {
        [v6 transform];
      }
      else {
        memset(v34, 0, sizeof(v34));
      }
      double v15 = sub_10007F788(v34);
      sub_100065C2C(v15);
      if (v16 == 90.0 || fabs(v16 + -90.0) < 0.00999999978)
      {
        unint64_t v17 = sub_1002895EC(a4);
      }
      else
      {
        if (v16 != 270.0 && fabs(v16 + -270.0) >= 0.00999999978) {
          goto LABEL_23;
        }
        unint64_t v17 = sub_1002893D8(a4);
      }
      a4 = v17;
LABEL_23:
      id v18 = objc_alloc_init((Class)NSMutableArray);
      if ([(CRLCanvasGuideController *)self p_sizingGuidesAreRelevantForOrientation:0 whileDraggingKnobTag:a4])
      {
        v19 = [(CRLCanvasGuideController *)self p_guidesForOffset:0 predicate:self->_horizontalSizingGuides inArray:v12];
        [v18 addObjectsFromArray:v19];
      }
      if ([(CRLCanvasGuideController *)self p_sizingGuidesAreRelevantForOrientation:1 whileDraggingKnobTag:a4])
      {
        id v20 = [(CRLCanvasGuideController *)self p_guidesForOffset:0 predicate:self->_verticalSizingGuides inArray:v14];
        [v18 addObjectsFromArray:v20];
      }
      [(NSMutableSet *)self->_currentSizingGuideUIRenderables removeAllObjects];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v21 = v18;
      id v22 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            [v26 setSnappingObjectLayout:v6, v30];
            currentSizingGuideUIRenderables = self->_currentSizingGuideUIRenderables;
            id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
            int v29 = [v26 renderableWithICC:WeakRetained];
            [(NSMutableSet *)currentSizingGuideUIRenderables addObject:v29];
          }
          id v23 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v23);
      }
    }
  }
}

- (void)showSizingGuideUIForRep:(id)a3 matchingWidth:(BOOL)a4 matchingHeight:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = [CRLCanvasSizingGuideUILayer alloc];
  double v10 = [v8 layout];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v14 = [(CRLCanvasSizingGuideUILayer *)v9 initForLayout:v10 withICC:WeakRetained showWidth:v6 showHeight:v5];

  currentSizingGuideUIRenderables = self->_currentSizingGuideUIRenderables;
  double v13 = +[CRLCanvasRenderable renderableFromLayer:v14];
  [(NSMutableSet *)currentSizingGuideUIRenderables addObject:v13];
}

- (void)hideSizingGuides
{
  [(NSMutableSet *)self->_currentSizingGuideUIRenderables removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained invalidateLayersForDecorator:self];
}

- (void)hideAlignmentGuides
{
  currentGuides = self->_currentGuides;
  self->_currentGuides = 0;

  currentSizingGuides = self->_currentSizingGuides;
  self->_currentSizingGuides = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained invalidateLayersForDecorator:self];
}

- (void)endAlignmentOperation
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDDE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106A910();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDE08);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController endAlignmentOperation]");
    BOOL v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1457 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  BOOL v6 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v6 setDelegate:0];
  [v6 setDuration:0.400000006];
  [v6 setFromValue:&off_10155DF28];
  [v6 setToValue:&off_10155E118];
  BOOL v7 = [(CRLCanvasGuideController *)self decoratorOverlayRenderables];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v12 setOpacity:0.0];
        [v12 addAnimation:v6 forKey:@"fade out"];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  self->_unint64_t guideGenerationState = 3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained removeDecorator:self];

  guideGenerationAccessQueue = self->_guideGenerationAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CC40;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(guideGenerationAccessQueue, block);
}

- (NSArray)decoratorOverlayRenderables
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t guideGenerationState = self->_guideGenerationState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  if (guideGenerationState == 2
    && (p_icc = &self->_icc,
        id v5 = objc_loadWeakRetained((id *)&self->_icc),
        [v5 visibleUnscaledRect],
        IsEmptdouble y = CGRectIsEmpty(v61),
        v5,
        !IsEmpty))
  {
    BOOL v7 = +[NSMutableArray array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v8 = [(NSMutableDictionary *)self->_horizontalSpacings allValues];
    id v9 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v54;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * i) needsRedraw];
        }
        id v10 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v10);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    double v13 = [(NSMutableDictionary *)self->_verticalSpacings allValues];
    id v14 = [v13 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v50;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * (void)j) needsRedraw];
        }
        id v15 = [v13 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v15);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v43 = self;
    BOOL obj = self->_currentGuides;
    id v18 = [(NSSet *)obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v46;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v45 + 1) + 8 * (void)k);
          uint64_t v23 = objc_opt_class();
          uint64_t v24 = sub_1002469D0(v23, v22);
          int v25 = v24;
          if (v24 && [v24 infinite])
          {
            v26 = v7;
            id v27 = [v25 guideType];
            id WeakRetained = objc_loadWeakRetained((id *)p_icc);
            [WeakRetained visibleUnscaledRect];
            if (v27 == (id)1)
            {
              [v25 setStart:v29];

              id v30 = objc_loadWeakRetained((id *)p_icc);
              [v30 visibleUnscaledRect];
              double v32 = v31;
              id v33 = objc_loadWeakRetained((id *)p_icc);
              [v33 visibleUnscaledRect];
              double v35 = v32 + v34;
            }
            else
            {
              [v25 setStart:];

              id v30 = objc_loadWeakRetained((id *)p_icc);
              [v30 visibleUnscaledRect];
              double v37 = v36;
              id v33 = objc_loadWeakRetained((id *)p_icc);
              [v33 visibleUnscaledRect];
              double v35 = v37 + v38;
            }
            [v25 setEnd:v35, v43];

            BOOL v7 = v26;
          }
          id v39 = objc_loadWeakRetained((id *)p_icc);
          double v40 = [v22 renderableWithICC:v39];

          if (v40) {
            [v7 addObject:v40];
          }
        }
        id v19 = [(NSSet *)obj countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v19);
    }

    double v41 = [(NSMutableSet *)v43->_currentSizingGuideUIRenderables allObjects];
    [v7 addObjectsFromArray:v41];
  }
  else
  {
    BOOL v7 = &__NSArray0__struct;
  }

  return (NSArray *)v7;
}

- (double)p_maxSnapForSnapDistance:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained viewScale];
  *(float *)&double v5 = v5 + -1.0;
  double v6 = a3 / (tanhf(*(float *)&v5) + 1.0);

  return v6;
}

- (BOOL)p_sizingGuidesAreRelevantForOrientation:(int)a3 whileDraggingKnobTag:(unint64_t)a4
{
  BOOL v4 = (a4 & 0xFFFFFFFFFFFFFFFDLL) != 4;
  BOOL v6 = a4 != 2 && a4 != 8;
  if (!a3) {
    BOOL v4 = v6;
  }
  return a4 && v4;
}

- (BOOL)p_guidesAreRelevantForEdge:(int)a3 whileDraggingKnobTag:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
      if (a3 > 5)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CDE68);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106AAC8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CDE88);
        }
        uint64_t v11 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v11);
        }
        double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:]");
        double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1673 isFatal:0 description:"unexpected edge type"];

        return 0;
      }
      if (((1 << a3) & 0x2D) != 0) {
        return self->_shouldAlignEdges;
      }
      return self->_shouldAlignCenters;
    case 1uLL:
      BOOL result = 0;
      switch(a3)
      {
        case 0:
        case 3:
          return self->_shouldAlignEdges;
        case 1:
        case 4:
          return self->_shouldAlignCenters;
        default:
          return result;
      }
      return result;
    case 2uLL:
      if (a3 == 4) {
        return self->_shouldAlignCenters;
      }
      if (a3 != 3) {
        return 0;
      }
      return self->_shouldAlignEdges;
    case 3uLL:
      if ((a3 & 0xFFFFFFFE) == 2) {
        return self->_shouldAlignEdges;
      }
      if (a3 != 4 && a3 != 1) {
        return 0;
      }
      return self->_shouldAlignCenters;
    case 4uLL:
      if (a3 == 1) {
        return self->_shouldAlignCenters;
      }
      if (a3) {
        return 0;
      }
      return self->_shouldAlignEdges;
    case 6uLL:
      if (a3 == 1) {
        return self->_shouldAlignCenters;
      }
      if (a3 != 2) {
        return 0;
      }
      return self->_shouldAlignEdges;
    case 7uLL:
      BOOL result = 0;
      switch(a3)
      {
        case 0:
        case 5:
          return self->_shouldAlignEdges;
        case 1:
        case 4:
          return self->_shouldAlignCenters;
        default:
          return result;
      }
      return result;
    case 8uLL:
      if (a3 == 4) {
        return self->_shouldAlignCenters;
      }
      if (a3 != 5) {
        return 0;
      }
      return self->_shouldAlignEdges;
    case 9uLL:
      BOOL result = 0;
      switch(a3)
      {
        case 1:
        case 4:
          return self->_shouldAlignCenters;
        case 2:
        case 5:
          return self->_shouldAlignEdges;
        default:
          return result;
      }
      return result;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CDEA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106AA2C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CDEC8);
      }
      BOOL v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1677, 0, "unexpected knob tag %zu", a4);

      return 0;
  }
}

- (CGRect)p_alignmentFrameInRootForLayout:(id)a3
{
  alignmentFrameInRootByLayout = self->_alignmentFrameInRootByLayout;
  if (alignmentFrameInRootByLayout)
  {
    BOOL v4 = [(NSMapTable *)alignmentFrameInRootByLayout objectForKeyedSubscript:a3];
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CDEE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106AB50();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CDF08);
      }
      double v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_alignmentFrameInRootForLayout:]");
      BOOL v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1688, 0, "invalid nil value for '%{public}s'", "value");
    }
    [v4 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    [a3 alignmentFrameForProvidingGuidesInRoot];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)p_addGuidesForLayout:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4 && [v4 shouldDisplayGuides])
  {
    BOOL v6 = [v5 additionalGuides];
    BOOL v7 = [(CRLCanvasGuideController *)self interactiveCanvasController];
    [v7 transformGuides:v6 forLayout:v5];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v13 guideType]) {
            uint64_t v14 = 120;
          }
          else {
            uint64_t v14 = 112;
          }
          [(CRLCanvasGuideController *)self p_addAlignmentGuide:v13 toSortedArray:*(Class *)((char *)&self->super.isa + v14)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v10);
    }

    double v15 = +[NSMutableSet set];
    [(CRLCanvasGuideController *)self p_alignmentFrameInRootForLayout:v5];
    double v20 = v16;
    double v21 = v17;
    double v22 = v18;
    double v23 = v19;
    if (self->_shouldAlignCenters)
    {
      uint64_t v24 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 1, v16, v17, v18, v19);
      [v15 addObject:v24];
      int v25 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 4, v20, v21, v22, v23);

      [v15 addObject:v25];
    }
    else
    {
      int v25 = 0;
    }
    if (self->_shouldAlignEdges)
    {
      v26 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 0, v20, v21, v22, v23);

      [v15 addObject:v26];
      id v27 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 2, v20, v21, v22, v23);

      [v15 addObject:v27];
      double v28 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 3, v20, v21, v22, v23);

      [v15 addObject:v28];
      int v25 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 5, v20, v21, v22, v23);

      [v15 addObject:v25];
    }
    double v29 = [(CRLCanvasGuideController *)self interactiveCanvasController];
    double v37 = v5;
    [v29 transformGuides:v15 forLayout:v5];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = v15;
    id v31 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v39;
      do
      {
        double v34 = 0;
        double v35 = v25;
        do
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(v30);
          }
          int v25 = (CRLCanvasAlignmentGuide *)*(id *)(*((void *)&v38 + 1) + 8 * (void)v34);

          if ([(CRLCanvasAlignmentGuide *)v25 guideType]) {
            uint64_t v36 = 120;
          }
          else {
            uint64_t v36 = 112;
          }
          [(CRLCanvasGuideController *)self p_addAlignmentGuide:v25 toSortedArray:*(Class *)((char *)&self->super.isa + v36)];
          double v34 = (char *)v34 + 1;
          double v35 = v25;
        }
        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v32);
    }

    double v5 = v37;
  }
}

- (void)p_addSpacingGuidesForFrame:(CGRect)a3 spacing:(id)a4 isVerticalSpacing:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a4;
  uint64_t v11 = 120;
  if (v5)
  {
    uint64_t v11 = 112;
    uint64_t v12 = 136;
  }
  else
  {
    uint64_t v12 = 128;
  }
  if (v5) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v5) {
    uint64_t v14 = 5;
  }
  else {
    uint64_t v14 = 2;
  }
  id v15 = *(id *)((char *)&self->super.isa + v11);
  id v16 = *(id *)((char *)&self->super.isa + v12);
  if (objc_msgSend(v19, "needsGuideForEdge:ofRect:", v13, x, y, width, height))
  {
    id v17 = -[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]([CRLCanvasSpacingGuide alloc], "initForEdge:ofGeneratingObjectRect:andParentSpacing:", v13, v19, x, y, width, height);
    [(CRLCanvasGuideController *)self p_addSpacingGuide:v17 toSortedArray:v15];
    [(CRLCanvasGuideController *)self p_addSpacingGuide:v17 toSortedArray:v16];
  }
  else
  {
    id v17 = 0;
  }
  if (objc_msgSend(v19, "needsGuideForEdge:ofRect:", v14, x, y, width, height))
  {
    id v18 = -[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]([CRLCanvasSpacingGuide alloc], "initForEdge:ofGeneratingObjectRect:andParentSpacing:", v14, v19, x, y, width, height);

    [(CRLCanvasGuideController *)self p_addSpacingGuide:v18 toSortedArray:v15];
    [(CRLCanvasGuideController *)self p_addSpacingGuide:v18 toSortedArray:v16];
    id v17 = v18;
  }
}

- (void)p_addAlignmentGuide:(id)a3 toSortedArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 insertObject:v7 atIndex:[self p_indexToInsertGuide:v7 inSortedArray:v6]];
}

- (void)p_addSpacingGuide:(id)a3 toSortedArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 insertObject:v7 atIndex:[self p_indexToInsertGuide:v7 inSortedArray:v6]];
}

- (void)p_addSizingGuide:(id)a3 toSortedArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 insertObject:v7 atIndex:[self p_indexToInsertGuide:v7 inSortedArray:v6]];
}

- (void)p_addCenterAlignmentGuide:(id)a3 toSortedArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 insertObject:v7 atIndex:[self p_indexToInsertGuide:v7 inSortedArray:v6]];
}

- (int64_t)p_indexToInsertGuide:(id)a3 inSortedArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)[v6 count];
  if (v7 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDF28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106ABE8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDF48);
    }
    double v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_indexToInsertGuide:inSortedArray:]");
    double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:1799 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (!v7)
  {
    int64_t v11 = 0;
    goto LABEL_16;
  }
  int64_t v8 = 0;
  int64_t v9 = v7 - 1;
  while (1)
  {
    uint64_t v10 = v9 + v8;
    if (v9 + v8 < 0 != __OFADD__(v9, v8)) {
      ++v10;
    }
    int64_t v11 = v10 >> 1;
    uint64_t v12 = [v6 objectAtIndexedSubscript:v10 >> 1];
    [v5 offset];
    double v14 = sub_100407DFC(v13);
    [v12 offset];
    if (v14 == sub_100407DFC(v15)) {
      break;
    }
    [v5 offset];
    double v17 = v16;
    [v12 offset];
    if (v17 < v18) {
      int64_t v9 = v11 - 1;
    }
    else {
      int64_t v8 = v11 + 1;
    }

    if (v8 > v9) {
      goto LABEL_14;
    }
  }
  [v12 offset];
  [v5 setOffset:];

  int64_t v8 = v11;
  int64_t v9 = v11;
LABEL_14:
  if (v9 >= v11) {
    int64_t v11 = v8;
  }
LABEL_16:

  return v11;
}

- (void)p_getOffset:(double *)a3 andGuidesArray:(id *)a4 forEdge:(int)a5 ofFrame:(CGRect)a6
{
  switch(a5)
  {
    case 0:
      CGFloat MinX = CGRectGetMinX(a6);
      goto LABEL_5;
    case 1:
      CGFloat MinX = CGRectGetMidX(a6);
      goto LABEL_5;
    case 2:
      CGFloat MinX = CGRectGetMaxX(a6);
LABEL_5:
      uint64_t v10 = 120;
      goto LABEL_10;
    case 3:
      CGFloat MinX = CGRectGetMinY(a6);
      goto LABEL_9;
    case 4:
      CGFloat MinX = CGRectGetMidY(a6);
      goto LABEL_9;
    case 5:
      CGFloat MinX = CGRectGetMaxY(a6);
LABEL_9:
      uint64_t v10 = 112;
LABEL_10:
      *a3 = MinX;
      *a4 = *(id *)((char *)&self->super.isa + v10);
      break;
    default:
      return;
  }
}

- (id)p_guidesForEdge:(int)a3 ofFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v7 = *(void *)&a3;
  id v24 = 0;
  double v25 = 0.0;
  -[CRLCanvasGuideController p_getOffset:andGuidesArray:forEdge:ofFrame:](self, "p_getOffset:andGuidesArray:forEdge:ofFrame:", &v25, &v24, *(void *)&a3);
  id v9 = v24;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained visibleUnscaledRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v25;
  double v20 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", v7, x, y, width, height, v12, v14, v16, v18);
  double v21 = [(CRLCanvasGuideController *)self p_guidesForOffset:v20 predicate:v9 inArray:v19];

  return v21;
}

- (id)p_guidesForOffset:(double)a3 predicate:(id)a4 inArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (uint64_t)[v8 count];
  if (v9 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDF68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106AC70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDF88);
    }
    id v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v27);
    }
    double v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_guidesForOffset:predicate:inArray:]");
    double v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:1873 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = v9;
    if (!v9)
    {
      id v20 = 0;
      goto LABEL_27;
    }
  }
  uint64_t v11 = 0;
  double v12 = 0;
  uint64_t v13 = v10 - 1;
  do
  {
    double v14 = v12;
    uint64_t v15 = v13 + v11;
    if (v13 + v11 < 0 != __OFADD__(v13, v11)) {
      uint64_t v16 = v15 + 1;
    }
    else {
      uint64_t v16 = v13 + v11;
    }
    uint64_t v17 = v16 >> 1;
    double v12 = [v8 objectAtIndexedSubscript:v16 >> 1];

    [v12 offset];
    if (vabdd_f64(a3, v18) < 0.01) {
      break;
    }
    [v12 offset];
    if (v19 > a3) {
      uint64_t v13 = v17 - 1;
    }
    else {
      uint64_t v11 = v17 + 1;
    }
  }
  while (v11 <= v13);
  id v20 = objc_alloc_init((Class)NSMutableArray);
  if (v15 >= 2)
  {
    unint64_t v21 = v17 + 1;
    do
    {
      double v22 = v12;
      double v12 = [v8 objectAtIndexedSubscript:v21 - 2];

      [v12 offset];
      if (vabdd_f64(v23, a3) > 0.01) {
        break;
      }
      if (!v7 || [v7 evaluateWithObject:v12]) {
        [v20 addObject:v12];
      }
      --v21;
    }
    while (v21 > 1);
  }
  if (v17 < v10)
  {
    do
    {
      id v24 = v12;
      double v12 = [v8 objectAtIndexedSubscript:v17];

      [v12 offset];
      if (vabdd_f64(v25, a3) > 0.01) {
        break;
      }
      if (!v7 || [v7 evaluateWithObject:v12]) {
        [v20 addObject:v12];
      }
      ++v17;
    }
    while (v10 != v17);
  }

LABEL_27:

  return v20;
}

- (id)p_guideClosestToEdge:(int)a3 ofFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v8 = *(void *)&a3;
  double v25 = 0.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained visibleUnscaledRect];
  double v23 = v11;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  id v24 = 0;
  -[CRLCanvasGuideController p_getOffset:andGuidesArray:forEdge:ofFrame:](self, "p_getOffset:andGuidesArray:forEdge:ofFrame:", &v25, &v24, v8, x, y, width, height);
  id v18 = v24;
  double v19 = v25;
  id v20 = -[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", v8, x, y, width, height, v23, v13, v15, v17);
  unint64_t v21 = [(CRLCanvasGuideController *)self p_closestGuideForOffset:v20 predicate:v18 inArray:v19];

  return v21;
}

- (id)p_closestGuideForOffset:(double)a3 predicate:(id)a4 inArray:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (uint64_t)[v9 count];
  if (v10 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDFA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106ACF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CDFC8);
    }
    long long v41 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v41);
    }
    long long v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:]");
    long long v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v42 file:v43 lineNumber:1934 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = v10;
    if (!v10)
    {
      id v25 = 0;
      goto LABEL_36;
    }
  }
  uint64_t v12 = 0;
  double v13 = 0;
  uint64_t v14 = v11 - 1;
  do
  {
    double v15 = v13;
    uint64_t v16 = v14 + v12;
    if (v14 + v12 < 0 != __OFADD__(v14, v12)) {
      uint64_t v17 = v16 + 1;
    }
    else {
      uint64_t v17 = v14 + v12;
    }
    uint64_t v18 = v17 >> 1;
    double v13 = [v9 objectAtIndexedSubscript:v17 >> 1];

    [v13 offset];
    if (v19 == a3) {
      break;
    }
    [v13 offset];
    if (v20 > a3) {
      uint64_t v14 = v18 - 1;
    }
    else {
      uint64_t v12 = v18 + 1;
    }
  }
  while (v12 <= v14);
  unint64_t v21 = [v9 objectAtIndexedSubscript:v18];

  [v21 offset];
  double v23 = vabdd_f64(v22, a3);
  [(CRLCanvasGuideController *)self snapDistanceToUseForGuides];
  if (v23 >= v24 + v24 || v8 && ![v8 evaluateWithObject:v21]) {
    id v25 = 0;
  }
  else {
    id v25 = v21;
  }
  if (v16 >= 2)
  {
    unint64_t v26 = v18 + 1;
    do
    {
      id v27 = v21;
      unint64_t v21 = [v9 objectAtIndexedSubscript:v26 - 2];

      [v21 offset];
      double v29 = vabdd_f64(v28, a3);
      [(CRLCanvasGuideController *)self snapDistanceToUseForGuides];
      if (v29 > v30 + v30) {
        break;
      }
      if (v25)
      {
        [v25 offset];
        if (v29 >= vabdd_f64(v31, a3)) {
          continue;
        }
      }
      if (!v8 || [v8 evaluateWithObject:v21])
      {
        id v32 = v21;

        id v25 = v32;
      }
      --v26;
    }
    while (v26 > 1);
  }
  uint64_t v33 = v18 + 1;
  if (v33 < v11)
  {
    do
    {
      double v34 = v21;
      unint64_t v21 = [v9 objectAtIndexedSubscript:v33];

      [v21 offset];
      double v36 = vabdd_f64(v35, a3);
      [(CRLCanvasGuideController *)self snapDistanceToUseForGuides];
      if (v36 > v37 + v37) {
        break;
      }
      if (v25)
      {
        [v25 offset];
        if (v36 >= vabdd_f64(v38, a3)) {
          continue;
        }
      }
      if (!v8 || [v8 evaluateWithObject:v21])
      {
        id v39 = v21;

        id v25 = v39;
      }
      ++v33;
    }
    while (v11 != v33);
  }

LABEL_36:

  return v25;
}

- (float)p_spacingForCenterOrSpacingGuide:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CDFE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106AD80();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CE008);
      }
      id v4 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v4);
      }
      id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_spacingForCenterOrSpacingGuide:]");
      id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:2000 isFatal:0 description:"Guide must have an associated spacing."];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_opt_class();
    id v8 = sub_1002469D0(v7, v3);
    id v9 = [v8 parentSpacing];
    [v9 exactOffset];
    double v11 = v10;

LABEL_16:
    float v12 = v11;

    goto LABEL_17;
  }
  objc_opt_class();
  float v12 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_opt_class();
    id v8 = sub_1002469D0(v13, v3);
    [v8 exactOffset];
    double v11 = v14;
    goto LABEL_16;
  }
LABEL_17:

  return v12;
}

- (id)p_predicateCanBeSnappedToInVisibleUnscaledRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (+[CRLCanvasGuideController shouldSnapToOffscreenContent])
  {
    uint64_t v7 = 0;
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004F398;
    v9[3] = &unk_1014CE028;
    *(CGFloat *)&v9[4] = x;
    *(CGFloat *)&v9[5] = y;
    *(CGFloat *)&v9[6] = width;
    *(CGFloat *)&v9[7] = height;
    uint64_t v7 = +[NSPredicate predicateWithBlock:v9];
  }

  return v7;
}

- (id)p_predicateCanBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F4A0;
  v7[3] = &unk_1014CE048;
  int v10 = a3;
  CGRect v8 = a4;
  CGRect v9 = a5;
  id v5 = +[NSPredicate predicateWithBlock:v7];

  return v5;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (BOOL)doNotRemoveExistingGuidesWhenDisplaying
{
  return self->_doNotRemoveExistingGuidesWhenDisplaying;
}

- (void)setDoNotRemoveExistingGuidesWhenDisplaying:(BOOL)a3
{
  self->_doNotRemoveExistingGuidesWhenDisplaying = a3;
}

- (BOOL)didJustSnapInX
{
  return self->_didJustSnapInX;
}

- (void)setDidJustSnapInX:(BOOL)a3
{
  self->_didJustSnapInX = a3;
}

- (BOOL)didJustSnapInY
{
  return self->_didJustSnapInY;
}

- (void)setDidJustSnapInY:(BOOL)a3
{
  self->_didJustSnapInY = a3;
}

- (CGRect)i_currentGuidesRect
{
  double x = self->_currentGuidesRect.origin.x;
  double y = self->_currentGuidesRect.origin.y;
  double width = self->_currentGuidesRect.size.width;
  double height = self->_currentGuidesRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_alignmentFrameInRootByLayout, 0);
  objc_storeStrong((id *)&self->_currentSizingGuideUIRenderables, 0);
  objc_storeStrong((id *)&self->_currentSizingGuides, 0);
  objc_storeStrong((id *)&self->_currentGuides, 0);
  objc_storeStrong((id *)&self->_spacingCenterGuidesForSnappingY, 0);
  objc_storeStrong((id *)&self->_spacingCenterGuidesForSnappingX, 0);
  objc_storeStrong((id *)&self->_spacingGuidesForSnappingY, 0);
  objc_storeStrong((id *)&self->_spacingGuidesForSnappingX, 0);
  objc_storeStrong((id *)&self->_guidesForSnappingX, 0);
  objc_storeStrong((id *)&self->_guidesForSnappingY, 0);
  objc_storeStrong((id *)&self->_horizontalSizingGuides, 0);
  objc_storeStrong((id *)&self->_verticalSizingGuides, 0);
  objc_storeStrong((id *)&self->_horizontalSpacings, 0);
  objc_storeStrong((id *)&self->_verticalSpacings, 0);
  objc_storeStrong((id *)&self->_guideGenerationStateLock, 0);

  objc_storeStrong((id *)&self->_guideGenerationAccessQueue, 0);
}

@end