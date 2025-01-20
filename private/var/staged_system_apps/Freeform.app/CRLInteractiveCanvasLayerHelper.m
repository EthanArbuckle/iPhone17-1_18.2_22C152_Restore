@interface CRLInteractiveCanvasLayerHelper
- (BOOL)currentlySuppressingLayerUpdates;
- (BOOL)isCanvasContentLayer:(id)a3;
- (BOOL)isRepContentPlatformView:(id)a3;
- (BOOL)p_shouldPerformLayerTreeComparison;
- (CALayer)overlayLayer;
- (CALayer)popoutLayer;
- (CALayer)repContainerLayer;
- (CRLInteractiveCanvasLayerHelper)initWithInteractiveCanvasController:(id)a3;
- (id)containerRenderablesForRep:(id)a3;
- (id)renderableForRep:(id)a3;
- (id)repForLayer:(id)a3;
- (id)viewWithTransferredLayers;
- (void)beginSuppressingLayerUpdatesExceptForReps:(id)a3;
- (void)dealloc;
- (void)decoratorWasRemoved:(id)a3;
- (void)endSuppressingLayerUpdates;
- (void)p_recursivelySetContentsFormatForLayer:(id)a3 toContentsFormat:(id)a4;
- (void)p_recursivelyUpdateLayerEdgeAntialiasingForLayer:(id)a3;
- (void)p_updateDecoratorOverlayContainer;
- (void)p_updateLayersForcingUpdateOfValidLayers:(BOOL)a3;
- (void)p_updateOverlayViewForReps:(id)a3 forcingUpdateOfValidLayers:(BOOL)a4;
- (void)repWasRemoved:(id)a3;
- (void)teardown;
- (void)updateLayerContainerFrames;
- (void)updateLayers;
@end

@implementation CRLInteractiveCanvasLayerHelper

- (CRLInteractiveCanvasLayerHelper)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRLInteractiveCanvasLayerHelper;
  v5 = [(CRLInteractiveCanvasLayerHelper *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v7 = objc_alloc_init(CRLCanvasSubview);
    repContainerView = v6->_repContainerView;
    v6->_repContainerView = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    [(CRLCanvasSubview *)v6->_repContainerView setLayerDelegate:WeakRetained];

    uint64_t v10 = [(CRLCanvasSubview *)v6->_repContainerView layer];
    repContainerLayer = v6->_repContainerLayer;
    v6->_repContainerLayer = (CALayer *)v10;

    v12 = [CRLInteractiveCanvasRepContentUpdater alloc];
    id v13 = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    v14 = [v13 canvas];
    id v15 = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    v16 = [(CRLInteractiveCanvasRepContentUpdater *)v12 initWithCanvas:v14 layerDelegate:v15];
    repContentUpdater = v6->_repContentUpdater;
    v6->_repContentUpdater = v16;

    v18 = [[CRLInteractiveCanvasRepContentSubviewUpdater alloc] initWithRepContainerView:v6->_repContainerView];
    repContentSubviewUpdater = v6->_repContentSubviewUpdater;
    v6->_repContentSubviewUpdater = v18;

    v20 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    repOverlayRenderablesByRep = v6->_repOverlayRenderablesByRep;
    v6->_repOverlayRenderablesByRep = v20;

    v22 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    decoratorOverlayRenderablesByDecorator = v6->_decoratorOverlayRenderablesByDecorator;
    v6->_decoratorOverlayRenderablesByDecorator = v22;
  }
  return v6;
}

- (void)teardown
{
  repOverlayRenderablesByRep = self->_repOverlayRenderablesByRep;
  self->_repOverlayRenderablesByRep = 0;

  decoratorOverlayRenderablesByDecorator = self->_decoratorOverlayRenderablesByDecorator;
  self->_decoratorOverlayRenderablesByDecorator = 0;

  [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater teardown];
  if (self->_wasTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F93D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1D00();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F93F0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper teardown]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:97 isFatal:0 description:"Shouldn't be torn down twice!"];
  }
  self->_wasTornDown = 1;
}

- (void)dealloc
{
  if (!self->_wasTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9410);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1D88();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9430);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:102 isFatal:0 description:"Must be torn down!"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLInteractiveCanvasLayerHelper;
  [(CRLInteractiveCanvasLayerHelper *)&v6 dealloc];
}

- (BOOL)p_shouldPerformLayerTreeComparison
{
  return 0;
}

- (void)updateLayers
{
  [(CRLInteractiveCanvasLayerHelper *)self p_updateLayersForcingUpdateOfValidLayers:0];
  if ([(CRLInteractiveCanvasLayerHelper *)self p_shouldPerformLayerTreeComparison])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    id v4 = [WeakRetained canvasView];

    v5 = [v4 canvasLayer];
    objc_super v6 = [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater i_descriptionOfLayerTreeRootedAt:v5];
    [(CRLInteractiveCanvasLayerHelper *)self p_updateLayersForcingUpdateOfValidLayers:1];
    v7 = [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater i_descriptionOfLayerTreeRootedAt:v5];
    v8 = [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater i_firstDifferenceBetweenLayerTreeDescription:v6 andDescription:v7];
    if ([v8 count])
    {
      int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9450);
      }
      uint64_t v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B1E10((uint64_t)v8, v9, v10);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9470);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper updateLayers]");
      id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12, v13, 146, 0, "Canvas layer tree mismatch detected! The fully and incrementally updated layer trees do not match.\n%@", v8 file lineNumber isFatal description];
    }
  }
}

- (void)p_updateLayersForcingUpdateOfValidLayers:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[NSThread isMainThread];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v7 = [WeakRetained canvasView];

  v62 = v7;
  v8 = [v7 canvasLayer];
  id v9 = objc_alloc_init((Class)NSMutableOrderedSet);
  v61 = v8;
  [v8 bounds];
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  if (v5)
  {
    -[CRLCanvasSubview setFrame:](self->_repContainerView, "setFrame:", v10, v11, v12, v13);
    -[CRLCanvasSubview setBounds:](self->_repContainerView, "setBounds:", v14, v15, v16, v17);
  }
  id v18 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v19 = [v18 additionalLayersUnderRepLayers];

  if ([v19 count])
  {
    if (self->_bottommostLayersContainerView) {
      unsigned int v20 = 0;
    }
    else {
      unsigned int v20 = v5;
    }
    if (v20 == 1)
    {
      v21 = objc_alloc_init(CRLCanvasSubview);
      bottommostLayersContainerView = self->_bottommostLayersContainerView;
      self->_bottommostLayersContainerView = v21;

      id v23 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      [(CRLCanvasSubview *)self->_bottommostLayersContainerView setLayerDelegate:v23];

      v24 = [(CRLCanvasSubview *)self->_bottommostLayersContainerView layer];
      bottommostLayersContainerLayer = self->_bottommostLayersContainerLayer;
      self->_bottommostLayersContainerLayer = v24;
    }
    if (!self->_bottommostLayersContainerLayer)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      BOOL v26 = v3;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9490);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B1ECC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F94B0);
      }
      v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v27);
      }
      v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper p_updateLayersForcingUpdateOfValidLayers:]");
      v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:185 isFatal:0 description:"Layout with bottommost layers should have run at least once on the main thread."];

      BOOL v3 = v26;
    }
  }
  if (self->_bottommostLayersContainerLayer)
  {
    if (v5)
    {
      -[CRLCanvasSubview setFrame:](self->_bottommostLayersContainerView, "setFrame:", v14, v15, v16, v17);
      -[CRLCanvasSubview setBounds:](self->_bottommostLayersContainerView, "setBounds:", v14, v15, v16, v17);
    }
    if (!v19) {
      v19 = &__NSArray0__struct;
    }
    v30 = [(CALayer *)self->_bottommostLayersContainerLayer sublayers];
    unsigned __int8 v31 = [v19 isEqualToArray:v30];

    if ((v31 & 1) == 0) {
      [(CALayer *)self->_bottommostLayersContainerLayer setSublayers:v19];
    }
    if (self->_bottommostLayersContainerView) {
      [v9 addObject:];
    }
  }
  unsigned int v32 = [(CRLInteractiveCanvasLayerHelper *)self currentlySuppressingLayerUpdates];
  repContentUpdater = self->_repContentUpdater;
  if (v32)
  {
    [(CRLInteractiveCanvasRepContentUpdater *)repContentUpdater updateLayerFramesOnlyForReps:self->_repsWhoseLayersAreAllowedToUpdate];
  }
  else
  {
    [(CRLInteractiveCanvasRepContentUpdater *)repContentUpdater updateRepContentForcingUpdateOfValidLayers:v3];
    uint64_t v34 = [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater repContentPiles];
    v35 = [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater allReps];
    v60 = (void *)v34;
    [(CRLInteractiveCanvasRepContentSubviewUpdater *)self->_repContentSubviewUpdater updateSubviewsFromRepContentPiles:v34];
    [v9 addObject:self->_repContainerView];
    id v36 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    unsigned __int8 v37 = [v36 overlayLayerSuppressed];

    if ((v37 & 1) == 0)
    {
      [(CRLInteractiveCanvasLayerHelper *)self p_updateOverlayViewForReps:v35 forcingUpdateOfValidLayers:v3];
      if (self->_overlayView) {
        [v9 addObject:];
      }
    }
    [(CRLInteractiveCanvasLayerHelper *)self p_updateDecoratorOverlayContainer];
    if (self->_decoratorOverlayContainerView) {
      [v9 addObject:];
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v38 = [v62 subviews];
    id v39 = [v38 countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v68;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v68 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(CRLCanvasSubview **)(*((void *)&v67 + 1) + 8 * i);
          if (v43 != self->_bottommostLayersContainerView
            && v43 != self->_repContainerView
            && v43 != self->_overlayView
            && v43 != self->_decoratorOverlayContainerView)
          {
            [v9 addObject:];
          }
        }
        id v40 = [v38 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v40);
    }

    if (v5)
    {
      v44 = [v9 array];
      v45 = [v62 canvasSubviews];
      unsigned __int8 v46 = [v44 isEqualToArray:v45];

      if ((v46 & 1) == 0) {
        [v62 setCanvasSubviews:v44];
      }
    }
  }
  id v47 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v48 = [v47 canvas];
  unsigned int v49 = [v48 canvasIsWideGamut];
  v50 = (id *)&kCAContentsFormatRGBA16Float;
  if (!v49) {
    v50 = (id *)&kCAContentsFormatRGBA8Uint;
  }
  id v51 = *v50;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v52 = v9;
  id v53 = [v52 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v64;
    do
    {
      for (j = 0; j != v54; j = (char *)j + 1)
      {
        if (*(void *)v64 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v58 = [v57 layer];
          [(CRLInteractiveCanvasLayerHelper *)self p_recursivelyUpdateLayerEdgeAntialiasingForLayer:v58];

          v59 = [v57 layer];
          [(CRLInteractiveCanvasLayerHelper *)self p_recursivelySetContentsFormatForLayer:v59 toContentsFormat:v51];
        }
      }
      id v54 = [v52 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v54);
  }
}

- (void)p_updateDecoratorOverlayContainer
{
  if (+[NSThread isMainThread])
  {
    id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    v35 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    unsigned int v5 = [WeakRetained i_decorators];

    id v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v41;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            double v11 = [v10 decoratorOverlayViews];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v12 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v37;
              do
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(void *)v37 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  [v3 addObject:*(void *)(*((void *)&v36 + 1) + 8 * (void)j) p_interactiveCanvasController];
                }
                id v13 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v13);
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v7);
    }

    id v16 = [v3 count];
    decoratorOverlayContainerView = v35->_decoratorOverlayContainerView;
    if (v16)
    {
      id v18 = (id *)p_interactiveCanvasController;
      if (!decoratorOverlayContainerView)
      {
        v19 = objc_alloc_init(CRLCanvasSubview);
        unsigned int v20 = v35->_decoratorOverlayContainerView;
        v35->_decoratorOverlayContainerView = v19;

        id v21 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
        [(CRLCanvasSubview *)v35->_decoratorOverlayContainerView setLayerDelegate:v21];
      }
    }
    else
    {
      id v18 = (id *)p_interactiveCanvasController;
      if (!decoratorOverlayContainerView)
      {
LABEL_26:

        return;
      }
    }
    v22 = [v3 array:p_interactiveCanvasController];
    [(CRLCanvasSubview *)v35->_decoratorOverlayContainerView setSubviews:v22];

    id v23 = objc_loadWeakRetained(v18);
    v24 = [v23 layerHost];
    objc_super v25 = [v24 canvasLayer];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    [(CRLCanvasSubview *)v35->_decoratorOverlayContainerView frame];
    v48.origin.x = v27;
    v48.origin.y = v29;
    v48.size.width = v31;
    v48.size.height = v33;
    if (!CGRectEqualToRect(v46, v48)) {
      -[CRLCanvasSubview setFrame:](v35->_decoratorOverlayContainerView, "setFrame:", v27, v29, v31, v33);
    }
    [(CRLCanvasSubview *)v35->_decoratorOverlayContainerView bounds];
    v49.origin.x = v27;
    v49.origin.y = v29;
    v49.size.width = v31;
    v49.size.height = v33;
    if (!CGRectEqualToRect(v47, v49)) {
      -[CRLCanvasSubview setBounds:](v35->_decoratorOverlayContainerView, "setBounds:", v27, v29, v31, v33);
    }
    goto LABEL_26;
  }
}

- (void)p_recursivelyUpdateLayerEdgeAntialiasingForLayer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v4 setAllowsEdgeAntialiasing:1];
  }
  unsigned int v5 = [v4 mask];
  if (v5) {
    [(CRLInteractiveCanvasLayerHelper *)self p_recursivelyUpdateLayerEdgeAntialiasingForLayer:v5];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [v4 sublayers];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CRLInteractiveCanvasLayerHelper *)self p_recursivelyUpdateLayerEdgeAntialiasingForLayer:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)p_recursivelySetContentsFormatForLayer:(id)a3 toContentsFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v6 setContentsFormat:v7];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [v6 sublayers];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(CRLInteractiveCanvasLayerHelper *)self p_recursivelySetContentsFormatForLayer:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) toContentsFormat:v7];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)p_updateOverlayViewForReps:(id)a3 forcingUpdateOfValidLayers:(BOOL)a4
{
  id v5 = a3;
  unsigned int v62 = +[NSThread isMainThread];
  location = (id *)&self->_interactiveCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  long long v63 = [WeakRetained canvas];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
  long long v67 = self;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v82;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v82 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if (a4
          || objc_msgSend(v63, "i_areOverlayLayersInvalidForRep:", *(void *)(*((void *)&v81 + 1) + 8 * i)))
        {
          long long v13 = [v12 overlayRenderables];
          [(NSMapTable *)self->_repOverlayRenderablesByRep setObject:v13 forKeyedSubscript:v12];
          if (!v13) {
            goto LABEL_19;
          }
        }
        else
        {
          long long v13 = [(NSMapTable *)self->_repOverlayRenderablesByRep objectForKeyedSubscript:v12];
          if (!v13) {
            goto LABEL_19;
          }
        }
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v14 = v13;
        id v15 = [v14 countByEnumeratingWithState:&v77 objects:v87 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v78;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v78 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = [*(id *)(*((void *)&v77 + 1) + 8 * (void)j) layer];
              [v7 addObject:v19];
            }
            id v16 = [v14 countByEnumeratingWithState:&v77 objects:v87 count:16];
          }
          while (v16);
        }

        self = v67;
LABEL_19:
      }
      id v9 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
    }
    while (v9);
  }

  id v20 = objc_loadWeakRetained(location);
  id v21 = [v20 i_decorators];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v65 = v21;
  id v22 = [v65 countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (!v22) {
    goto LABEL_41;
  }
  id v23 = v22;
  uint64_t v24 = *(void *)v74;
  do
  {
    for (k = 0; k != v23; k = (char *)k + 1)
    {
      if (*(void *)v74 != v24) {
        objc_enumerationMutation(v65);
      }
      double v26 = *(void **)(*((void *)&v73 + 1) + 8 * (void)k);
      if (a4
        || (id v27 = objc_loadWeakRetained(location),
            unsigned int v28 = objc_msgSend(v27, "i_areLayersInvalidForDecorator:", v26),
            v27,
            v28))
      {
        double v29 = [v26 decoratorOverlayRenderables];
        [(NSMapTable *)self->_decoratorOverlayRenderablesByDecorator setObject:v29 forKeyedSubscript:v26];
        if (!v29) {
          goto LABEL_39;
        }
      }
      else
      {
        double v29 = [(NSMapTable *)self->_decoratorOverlayRenderablesByDecorator objectForKeyedSubscript:v26];
        if (!v29) {
          goto LABEL_39;
        }
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v30 = v29;
      id v31 = [v30 countByEnumeratingWithState:&v69 objects:v85 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v70;
        do
        {
          for (m = 0; m != v32; m = (char *)m + 1)
          {
            if (*(void *)v70 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = [*(id *)(*((void *)&v69 + 1) + 8 * (void)m) layer];
            [v7 addObject:v35];
          }
          id v32 = [v30 countByEnumeratingWithState:&v69 objects:v85 count:16];
        }
        while (v32);
      }

      self = v67;
LABEL_39:
    }
    id v23 = [v65 countByEnumeratingWithState:&v73 objects:v86 count:16];
  }
  while (v23);
LABEL_41:

  if (self->_overlayView) {
    unsigned int v36 = 0;
  }
  else {
    unsigned int v36 = v62;
  }
  if (v36 == 1)
  {
    long long v37 = objc_alloc_init(CRLCanvasSubview);
    overlayView = self->_overlayView;
    self->_overlayView = v37;

    id v39 = objc_loadWeakRetained(location);
    [(CRLCanvasSubview *)self->_overlayView setLayerDelegate:v39];

    long long v40 = [(CRLCanvasSubview *)self->_overlayView layer];
    overlayLayer = self->_overlayLayer;
    self->_overlayLayer = v40;
  }
  long long v42 = self->_overlayLayer;
  if (!v42)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F94D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1F54();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F94F0);
    }
    long long v43 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v43);
    }
    v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper p_updateOverlayViewForReps:forcingUpdateOfValidLayers:]");
    v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v44 file:v45 lineNumber:419 isFatal:0 description:"Layout with overlay layers should have run at least once on the main thread."];

    long long v42 = self->_overlayLayer;
  }
  CGRect v46 = [(CALayer *)v42 sublayers];
  unsigned __int8 v47 = [v46 isEqualToArray:v7];

  if ((v47 & 1) == 0) {
    [(CALayer *)self->_overlayLayer setSublayers:v7];
  }
  id v48 = objc_loadWeakRetained(location);
  unsigned int v49 = [v48 showGrayOverlay];

  if (v49)
  {
    v50 = sub_10000FE5C(0.0, 0.0, 0.0, 0.219600007);
    [(CALayer *)self->_overlayLayer setBackgroundColor:v50];
    CGColorRelease(v50);
    if (!v62) {
      goto LABEL_66;
    }
LABEL_62:
    id v51 = objc_loadWeakRetained(location);
    id v52 = [v51 layerHost];
    id v53 = [v52 canvasLayer];
    [v53 bounds];
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;

    [(CRLCanvasSubview *)self->_overlayView frame];
    v91.origin.x = v55;
    v91.origin.y = v57;
    v91.size.width = v59;
    v91.size.height = v61;
    if (!CGRectEqualToRect(v89, v91)) {
      -[CRLCanvasSubview setFrame:](self->_overlayView, "setFrame:", v55, v57, v59, v61);
    }
    [(CRLCanvasSubview *)self->_overlayView bounds];
    v92.origin.x = v55;
    v92.origin.y = v57;
    v92.size.width = v59;
    v92.size.height = v61;
    if (!CGRectEqualToRect(v90, v92)) {
      -[CRLCanvasSubview setBounds:](self->_overlayView, "setBounds:", v55, v57, v59, v61);
    }
  }
  else
  {
    [(CALayer *)self->_overlayLayer setBackgroundColor:0];
    if (v62) {
      goto LABEL_62;
    }
  }
LABEL_66:
}

- (id)renderableForRep:(id)a3
{
  return [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater renderableForRep:a3];
}

- (id)repForLayer:(id)a3
{
  return [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater repForLayer:a3];
}

- (id)containerRenderablesForRep:(id)a3
{
  return [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater containerRenderablesForRep:a3];
}

- (id)viewWithTransferredLayers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v4 = [WeakRetained canvasView];

  id v5 = [CRLCanvasSubview alloc];
  [v4 frame];
  id v6 = -[CRLCanvasSubview initWithFrame:](v5, "initWithFrame:");
  objc_super v25 = v4;
  [v4 bounds];
  uint64_t v24 = v6;
  -[CRLCanvasSubview setBounds:](v6, "setBounds:");
  id v7 = [(CRLCanvasSubview *)self->_repContainerView subviews];
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v7 count]];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v15 = [v14 subviews];
        id v16 = [v15 count];

        if (!v16)
        {
          uint64_t v17 = [CRLCanvasSubview alloc];
          [v14 frame];
          id v18 = -[CRLCanvasSubview initWithFrame:](v17, "initWithFrame:");
          [v14 bounds];
          -[CRLCanvasSubview setBounds:](v18, "setBounds:");
          v19 = [v14 layer];
          id v20 = [v19 sublayers];
          id v21 = [v20 copy];

          id v22 = [(CRLCanvasSubview *)v18 layer];
          [v22 setSublayers:v21];

          [v8 addObject:v18];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  [(CRLCanvasSubview *)v24 setSubviews:v8];

  return v24;
}

- (BOOL)isCanvasContentLayer:(id)a3
{
  id v4 = (CALayer *)a3;
  if ([(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater isRepContentLayer:v4]
    || [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater isRepContainerLayer:v4]|| [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater isChildWrapperLayer:v4]|| [(CRLInteractiveCanvasRepContentUpdater *)self->_repContentUpdater isClonedParentRepLayer:v4]|| self->_repContainerLayer == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v5 = [(CALayer *)v4 superlayer];
    if (v5 == self->_repContainerLayer || self->_overlayLayer == v4)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v6 = [(CALayer *)v4 superlayer];
      if (v6 == self->_overlayLayer || self->_bottommostLayersContainerLayer == v4)
      {
        BOOL v8 = 1;
      }
      else
      {
        id v7 = [(CALayer *)v4 superlayer];
        BOOL v8 = v7 == 0;
      }
    }
  }
  return v8;
}

- (BOOL)isRepContentPlatformView:(id)a3
{
  return [(CRLCanvasSubview *)self->_repContainerView containsView:a3];
}

- (void)repWasRemoved:(id)a3
{
}

- (void)decoratorWasRemoved:(id)a3
{
}

- (void)beginSuppressingLayerUpdatesExceptForReps:(id)a3
{
  id v4 = (NSSet *)[a3 copy];
  repsWhoseLayersAreAllowedToUpdate = self->_repsWhoseLayersAreAllowedToUpdate;
  self->_repsWhoseLayersAreAllowedToUpdate = v4;
}

- (void)endSuppressingLayerUpdates
{
  repsWhoseLayersAreAllowedToUpdate = self->_repsWhoseLayersAreAllowedToUpdate;
  if (!repsWhoseLayersAreAllowedToUpdate)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9510);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1FDC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9530);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper endSuppressingLayerUpdates]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 529, 0, "invalid nil value for '%{public}s'", "_repsWhoseLayersAreAllowedToUpdate");

    repsWhoseLayersAreAllowedToUpdate = self->_repsWhoseLayersAreAllowedToUpdate;
  }
  self->_repsWhoseLayersAreAllowedToUpdate = 0;
}

- (BOOL)currentlySuppressingLayerUpdates
{
  return self->_repsWhoseLayersAreAllowedToUpdate != 0;
}

- (void)updateLayerContainerFrames
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9550);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B208C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9570);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper updateLayerContainerFrames]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:540 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v7 = [WeakRetained canvasView];
  BOOL v8 = [v7 canvasLayer];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[CRLCanvasSubview setFrame:](self->_repContainerView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_repContainerView, "setBounds:", v10, v12, v14, v16);
  [(CRLInteractiveCanvasRepContentSubviewUpdater *)self->_repContentSubviewUpdater updateSubviewFrames];
  -[CRLCanvasSubview setFrame:](self->_bottommostLayersContainerView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_bottommostLayersContainerView, "setBounds:", v10, v12, v14, v16);
  -[CRLCanvasSubview setFrame:](self->_overlayView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_overlayView, "setBounds:", v10, v12, v14, v16);
  -[CRLCanvasSubview setFrame:](self->_decoratorOverlayContainerView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_decoratorOverlayContainerView, "setBounds:", v10, v12, v14, v16);
}

- (CALayer)repContainerLayer
{
  return self->_repContainerLayer;
}

- (CALayer)overlayLayer
{
  return self->_overlayLayer;
}

- (CALayer)popoutLayer
{
  return self->_popoutLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoutLayer, 0);
  objc_storeStrong((id *)&self->_overlayLayer, 0);
  objc_storeStrong((id *)&self->_repContainerLayer, 0);
  objc_storeStrong((id *)&self->_repsWhoseLayersAreAllowedToUpdate, 0);
  objc_storeStrong((id *)&self->_decoratorOverlayRenderablesByDecorator, 0);
  objc_storeStrong((id *)&self->_repOverlayRenderablesByRep, 0);
  objc_storeStrong((id *)&self->_repContentSubviewUpdater, 0);
  objc_storeStrong((id *)&self->_repContentUpdater, 0);
  objc_storeStrong((id *)&self->_bottommostLayersContainerLayer, 0);
  objc_storeStrong((id *)&self->_decoratorOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_repContainerView, 0);
  objc_storeStrong((id *)&self->_bottommostLayersContainerView, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end