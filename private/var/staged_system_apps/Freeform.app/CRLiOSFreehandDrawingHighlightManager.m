@interface CRLiOSFreehandDrawingHighlightManager
- (CGPath)newPathForSearchReference:(id)a3;
- (CRLiOSFreehandDrawingHighlightManager)initWithInteractiveCanvasController:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5;
- (id)p_boardItemsForSearchReference:(id)a3;
- (id)p_makeOverlayHighlight;
- (void)dealloc;
- (void)didEndZoomingOperation;
- (void)p_setPrimaryFindResultSearchReference:(id)a3;
- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4;
- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3;
- (void)p_updateHighlights;
- (void)pulseAnimationDidStop:(id)a3;
- (void)setPrimaryFindResultSearchReference:(id)a3;
- (void)setSearchReferencesToHighlight:(id)a3;
- (void)teardown;
@end

@implementation CRLiOSFreehandDrawingHighlightManager

- (CRLiOSFreehandDrawingHighlightManager)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSFreehandDrawingHighlightManager;
  v5 = [(CRLiOSFreehandDrawingHighlightManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    [v4 addDecorator:v6];
  }

  return v6;
}

- (void)teardown
{
  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8660);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107C740();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8680);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v2);
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingHighlightManager teardown]");
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingHighlightManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:55 isFatal:0 description:"attempting to call teardown on an instance of CRLiOSFreehandDrawingHighlightManager that has already been torn down."];
  }
  else
  {
    self->_isTornDown = 1;
    searchReferencesToHighlight = self->_searchReferencesToHighlight;
    self->_searchReferencesToHighlight = 0;

    primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
    self->_primaryFindResultSearchReference = 0;

    pulseArrayController = self->_pulseArrayController;
    self->_pulseArrayController = 0;

    highlightArrayController = self->_highlightArrayController;
    self->_highlightArrayController = 0;
  }
}

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D86A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107C7D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D86C0);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingHighlightManager dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingHighlightManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:60 isFatal:0 description:"teardown not called for CRLiOSFreehandDrawingHighlightManager."];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSFreehandDrawingHighlightManager;
  [(CRLiOSFreehandDrawingHighlightManager *)&v6 dealloc];
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
  id v12 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = sub_1002469D0(v5, v12);
  v7 = v6;
  if (v6
    && ([v6 model],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    objc_storeStrong((id *)&self->_primaryFindResultSearchReference, a3);
    [(CRLiOSFreehandDrawingHighlightManager *)self p_setPrimaryFindResultSearchReference:v12];
  }
  else if (self->_primaryFindResultSearchReference)
  {
    [(CRLWPHighlightArrayController *)self->_pulseArrayController stop];
    [(CRLiOSFreehandDrawingHighlightManager *)self p_setPulseControllerActive:0 autohide:0];
    primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
    self->_primaryFindResultSearchReference = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [WeakRetained invalidateLayersForDecorator:self];
}

- (void)p_setPrimaryFindResultSearchReference:(id)a3
{
  id v8 = a3;
  [(CRLWPHighlightArrayController *)self->_pulseArrayController stop];
  if (v8)
  {
    id v4 = [v8 autohideHighlight];
    uint64_t v5 = self;
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v5 = self;
    uint64_t v6 = 0;
    id v4 = 0;
  }
  [(CRLiOSFreehandDrawingHighlightManager *)v5 p_setPulseControllerActive:v6 autohide:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [WeakRetained invalidateLayersForDecorator:self];

  [(CRLiOSFreehandDrawingHighlightManager *)self p_updateAnimationWithAnimatingPulse:[(CRLWPHighlightArrayController *)self->_pulseArrayController shouldPulsate]];
}

- (void)setSearchReferencesToHighlight:(id)a3
{
  v20 = self;
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v21 = v3;
  uint64_t v5 = [v3 keyEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          v11 = [v21 objectForKey:v10];
          id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v23;
            do
            {
              v15 = 0;
              do
              {
                if (*(void *)v23 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v4 addObject:[v22 objectAtIndex:v15]];
                v15 = (char *)v15 + 1;
              }
              while (v13 != v15);
              id v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v13);
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    v16 = (NSArray *)[v4 copy];
    p_isa = (id *)&v20->super.isa;
    searchReferencesToHighlight = v20->_searchReferencesToHighlight;
    v20->_searchReferencesToHighlight = v16;
  }
  else
  {
    p_isa = (id *)&v20->super.isa;
    searchReferencesToHighlight = v20->_searchReferencesToHighlight;
    v20->_searchReferencesToHighlight = 0;
  }

  id WeakRetained = objc_loadWeakRetained(p_isa + 1);
  [WeakRetained invalidateLayersForDecorator:p_isa];

  [p_isa p_updateHighlights];
}

- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CRLWPHighlightArrayController *)self->_pulseArrayController pulsating]
    && self->_primaryFindResultSearchReference
    && !self->_updatingHighlights)
  {
    self->_updatingHighlights = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    id v6 = [WeakRetained canvas];
    [v6 viewScale];
    -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");

    [(CRLWPHighlightArrayController *)self->_pulseArrayController reset];
    id v7 = sub_1001D0764();
    pulseArrayController = self->_pulseArrayController;
    primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
    v9 = +[NSArray arrayWithObjects:&primaryFindResultSearchReference count:1];
    uint64_t v10 = [WeakRetained canvas];
    [v10 contentsScale];
    id v11 = -[CRLWPHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:](pulseArrayController, "buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:", v9, 1, v7);

    CGColorRelease(v7);
    if (v3) {
      [(CRLWPHighlightArrayController *)self->_pulseArrayController startAnimating];
    }
    self->_updatingHighlights = 0;
  }
}

- (void)p_updateHighlights
{
  NSUInteger v3 = [(NSArray *)self->_searchReferencesToHighlight count];
  highlightArrayController = self->_highlightArrayController;
  if (v3)
  {
    if (!highlightArrayController)
    {
      uint64_t v5 = [[CRLWPHighlightArrayController alloc] initWithZOrder:self delegate:0.0];
      id v6 = self->_highlightArrayController;
      self->_highlightArrayController = v5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    uint64_t v8 = self->_highlightArrayController;
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v26[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v26[1] = v9;
    v26[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(CRLWPHighlightArrayController *)v8 setTransform:v26];
    uint64_t v10 = [WeakRetained canvas];
    [v10 viewScale];
    -[CRLWPHighlightArrayController setViewScale:](self->_highlightArrayController, "setViewScale:");

    [(CRLWPHighlightArrayController *)self->_highlightArrayController reset];
    id v11 = sub_1001D0784();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_searchReferencesToHighlight;
    id v12 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = self->_highlightArrayController;
          long long v27 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v15);
          v16 = v27;
          v18 = +[NSArray arrayWithObjects:&v27 count:1];
          v19 = [WeakRetained canvas];
          [v19 contentsScale];
          v20 = -[CRLWPHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:](v17, "buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:", v18, 1, v11);

          [v16 setFindHighlights:v20];
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v13);
    }

    CGColorRelease(v11);
  }
  else if (highlightArrayController)
  {
    self->_highlightArrayController = 0;
  }
}

- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  pulseArrayController = self->_pulseArrayController;
  if (a3)
  {
    BOOL v6 = a4;
    if (!pulseArrayController)
    {
      id v7 = [[CRLWPHighlightArrayController alloc] initWithZOrder:self delegate:0.0];
      uint64_t v8 = self->_pulseArrayController;
      self->_pulseArrayController = v7;

      pulseArrayController = self->_pulseArrayController;
    }
    [(CRLWPHighlightArrayController *)pulseArrayController setShouldPulsate:1];
    [(CRLWPHighlightArrayController *)self->_pulseArrayController setAutohide:v6];
    long long v9 = self->_pulseArrayController;
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v12[1] = v10;
    v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(CRLWPHighlightArrayController *)v9 setTransform:v12];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    [WeakRetained viewScale];
    -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");
  }
  else if (pulseArrayController)
  {
    self->_pulseArrayController = 0;
  }
}

- (id)p_makeOverlayHighlight
{
  NSUInteger v3 = +[NSMutableArray array];
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    uint64_t v5 = [(CRLWPHighlightArrayController *)highlightArrayController layers];
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = [(CRLWPHighlightArrayController *)self->_highlightArrayController layers];
      uint64_t v8 = +[CRLCanvasRenderable renderablesFromLayers:v7];
      [v3 addObjectsFromArray:v8];
    }
  }
  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController)
  {
    long long v10 = [(CRLWPHighlightArrayController *)pulseArrayController layers];
    id v11 = [v10 count];

    if (v11)
    {
      id v12 = [(CRLWPHighlightArrayController *)self->_pulseArrayController layers];
      id v13 = +[CRLCanvasRenderable renderablesFromLayers:v12];
      [v3 addObjectsFromArray:v13];
    }
  }

  return v3;
}

- (id)p_boardItemsForSearchReference:(id)a3
{
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  id v6 = [WeakRetained selectionModelTranslator];

  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = sub_10024715C(v7, v4);

  long long v9 = [v8 selectionPath];
  long long v10 = [v6 boardItemsForSelectionPath:v9];

  return v10;
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->_searchReferencesToHighlight)
  {
    v2 = [(CRLiOSFreehandDrawingHighlightManager *)self p_makeOverlayHighlight];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (void)didEndZoomingOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [WeakRetained invalidateLayersForDecorator:self];

  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController) {
    [(CRLiOSFreehandDrawingHighlightManager *)self p_updateAnimationWithAnimatingPulse:[(CRLWPHighlightArrayController *)pulseArrayController shouldPulsate]];
  }
  if (self->_highlightArrayController)
  {
    [(CRLiOSFreehandDrawingHighlightManager *)self p_updateHighlights];
  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  id v4 = [(CRLiOSFreehandDrawingHighlightManager *)self p_boardItemsForSearchReference:a3];
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = [v4 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v38;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
        v16 = [WeakRetained layoutForInfo:v14];

        if (v16)
        {
          [v16 frameForCulling];
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          long long v25 = [v16 parent];
          long long v26 = [v25 geometryInRoot];
          long long v27 = v26;
          if (v26) {
            [v26 transform];
          }
          else {
            memset(&v36, 0, sizeof(v36));
          }
          v42.origin.double x = v18;
          v42.origin.double y = v20;
          v42.size.double width = v22;
          v42.size.double height = v24;
          CGRect v43 = CGRectApplyAffineTransform(v42, &v36);
          CGFloat v28 = v43.origin.x;
          CGFloat v29 = v43.origin.y;
          CGFloat v30 = v43.size.width;
          CGFloat v31 = v43.size.height;

          v44.origin.double x = x;
          v44.origin.double y = y;
          v44.size.double width = width;
          v44.size.double height = height;
          v46.origin.double x = v28;
          v46.origin.double y = v29;
          v46.size.double width = v30;
          v46.size.double height = v31;
          CGRect v45 = CGRectUnion(v44, v46);
          double x = v45.origin.x;
          double y = v45.origin.y;
          double width = v45.size.width;
          double height = v45.size.height;
        }
      }
      id v10 = [v4 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v10);
  }
  v32 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", x, y, width, height, *(_OWORD *)&v36.a, *(_OWORD *)&v36.c, *(_OWORD *)&v36.tx);
  v33 = v32;
  if (v32) {
    v34 = CGPathRetain((CGPathRef)[v32 CGPath]);
  }
  else {
    v34 = 0;
  }

  return v34;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  uint64_t v5 = -[CRLiOSFreehandDrawingHighlightManager p_boardItemsForSearchReference:](self, "p_boardItemsForSearchReference:", a3, a4, a5);
  id v6 = +[NSMutableArray array];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v5;
  id v49 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v64;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v64 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
        id v10 = [WeakRetained layoutForInfo:v8];

        if (v10)
        {
          v51 = i;
          uint64_t v11 = (objc_class *)objc_opt_class();
          id v12 = sub_10024715C(v11, v8);
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          v50 = v12;
          id v52 = [v12 allNestedChildrenItemsExcludingGroups];
          id v13 = [v52 countByEnumeratingWithState:&v59 objects:v68 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v53 = *(void *)v60;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v60 != v53) {
                  objc_enumerationMutation(v52);
                }
                v16 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
                uint64_t v17 = objc_opt_class();
                CGFloat v18 = sub_1002469D0(v17, v16);
                double v19 = v18;
                if (v18)
                {
                  long long v57 = 0u;
                  long long v58 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  CGFloat v20 = [v18 pencilKitStrokesInParentSpace];
                  id v21 = [v20 countByEnumeratingWithState:&v55 objects:v67 count:16];
                  if (v21)
                  {
                    id v22 = v21;
                    uint64_t v23 = *(void *)v56;
                    do
                    {
                      for (k = 0; k != v22; k = (char *)k + 1)
                      {
                        if (*(void *)v56 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        long long v25 = *(void **)(*((void *)&v55 + 1) + 8 * (void)k);
                        [v10 transformInRoot];
                        long long v26 = [v25 crl_strokeByAppendingTransform:v54];
                        [v6 addObject:v26];
                      }
                      id v22 = [v20 countByEnumeratingWithState:&v55 objects:v67 count:16];
                    }
                    while (v22);
                  }
                }
              }
              id v14 = [v52 countByEnumeratingWithState:&v59 objects:v68 count:16];
            }
            while (v14);
          }

          i = v51;
        }
      }
      id v49 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v49);
  }

  id v27 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  CGFloat v28 = [v27 canvas];
  [v28 contentsScale];
  double v30 = v29;

  id v31 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v32 = [v31 canvas];
  [v32 viewScale];
  double v34 = v33;

  double v35 = v30 * v34;
  PathBoundingBodouble x = CGPathGetPathBoundingBox(a4);
  double x = PathBoundingBox.origin.x;
  double y = PathBoundingBox.origin.y;
  double v38 = sub_1000646A4(PathBoundingBox.size.width, PathBoundingBox.size.height, v35);
  long long v40 = sub_100455AA8(11, v38, v39);
  CGContextSaveGState(v40);
  CGContextScaleCTM(v40, v35, v35);
  CGContextTranslateCTM(v40, -x, -y);
  id v41 = [v6 copy];
  +[CRLPencilKitRenderer drawStrokes:v41 inContext:v40 overTransparentCanvas:1];

  CGContextRestoreGState(v40);
  Image = CGBitmapContextCreateImage(v40);
  CGRect v43 = +[CRLImage imageWithCGImage:Image];
  CGImageRelease(Image);
  CGContextRelease(v40);

  return v43;
}

- (void)pulseAnimationDidStop:(id)a3
{
  if (self->_pulseArrayController == a3)
  {
    if ([a3 autohide])
    {
      [(CRLiOSFreehandDrawingHighlightManager *)self p_setPulseControllerActive:0 autohide:0];
      if (self->_pulseArrayController)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D86E0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107C868();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D8700);
        }
        id v4 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v4);
        }
        uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingHighlightManager pulseAnimationDidStop:]");
        id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingHighlightManager.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 283, 0, "expected nil value for '%{public}s'", "_pulseArrayController");
      }
      [(CRLiOSFreehandDrawingHighlightManager *)self p_setPrimaryFindResultSearchReference:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      [WeakRetained invalidateLayersForDecorator:self];
    }
    [(CRLSearchReference *)self->_primaryFindResultSearchReference setPulseHighlight:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightArrayController, 0);
  objc_storeStrong((id *)&self->_pulseArrayController, 0);
  objc_storeStrong((id *)&self->_searchReferencesToHighlight, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end