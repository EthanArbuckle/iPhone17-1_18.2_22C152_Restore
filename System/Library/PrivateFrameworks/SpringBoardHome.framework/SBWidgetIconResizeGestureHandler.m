@interface SBWidgetIconResizeGestureHandler
- (BOOL)isPointInsideGesturePath:(CGPoint)a3;
- (BOOL)isRTL;
- (CGPoint)iconViewOrigin;
- (CGPoint)nearestPointInsideGesturePathForPoint:(CGPoint)a3;
- (CGPoint)resizeHandlePointForGridSizeClass:(id)a3;
- (CGPoint)startingLocation;
- (CGPoint)stretchingStartLocation;
- (NSArray)sortedGridSizeClasses;
- (NSString)description;
- (NSString)originalGridSizeClass;
- (SBFFluidBehaviorSettings)animationSettings;
- (SBHIconGridSizeClassSet)allowedGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBHWidgetIconResizeViewHelper)viewHelper;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (SBIconListLayout)listLayout;
- (SBIconListView)iconListView;
- (SBIconListViewPlaceholderPositioning)placeholder;
- (SBIconView)iconView;
- (SBWidgetIconResizeGestureHandler)initWithIconView:(id)a3 iconListView:(id)a4 widgetMetricsProvider:(id)a5;
- (SBWidgetIconResizeGestureHandlerDelegate)delegate;
- (SBWidgetIconResizeTransitionViewController)previewViewController;
- (UIView)containerView;
- (double)updateTransitionEndpointAndProgressWithGestureRecognizer:(id)a3;
- (id)effectiveGridSizeClassDomain;
- (id)iconResizeViewHelper:(id)a3 intentForWidget:(id)a4;
- (id)iconResizeViewHelper:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6;
- (id)succinctDescription;
- (int64_t)state;
- (unint64_t)gesturePathVertexCapacity;
- (unint64_t)gesturePathVertexCount;
- (void)appendDescriptionToStream:(id)a3;
- (void)configureForStretching;
- (void)dealloc;
- (void)finishWithGestureRecognizer:(id)a3;
- (void)iconView:(id)a3 resizeGestureRecognizerDidUpdate:(id)a4;
- (void)informDelegateFinishedWithSizeClass:(id)a3;
- (void)setAllowedGridSizeClasses:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGesturePathVertexCapacity:(unint64_t)a3;
- (void)setGesturePathVertexCount:(unint64_t)a3;
- (void)setIconGridSizeClassSizes:(id)a3;
- (void)setIconViewOrigin:(CGPoint)a3;
- (void)setListLayout:(id)a3;
- (void)setOriginalGridSizeClass:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSortedGridSizeClasses:(id)a3;
- (void)setStartingLocation:(CGPoint)a3;
- (void)setState:(int64_t)a3;
- (void)setStretchingStartLocation:(CGPoint)a3;
- (void)setUpWithGestureRecognizer:(id)a3;
- (void)tearDown;
- (void)updatePreviewSizeWithGestureRecognizer:(id)a3;
- (void)updateResizingWithGestureRecognizer:(id)a3;
- (void)updateStretchingWithGestureRecognizer:(id)a3;
- (void)updateWithGestureRecognizer:(id)a3;
@end

@implementation SBWidgetIconResizeGestureHandler

- (SBWidgetIconResizeGestureHandler)initWithIconView:(id)a3 iconListView:(id)a4 widgetMetricsProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBWidgetIconResizeGestureHandler;
  v12 = [(SBWidgetIconResizeGestureHandler *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconView, a3);
    objc_storeStrong((id *)&v13->_iconListView, a4);
    v14 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E4FA5F08]);
    animationSettings = v13->_animationSettings;
    v13->_animationSettings = v14;

    v16 = [v9 listLayout];
    v17 = -[SBHWidgetIconResizeViewHelper initWithDelegate:listLayout:widgetMetricsProvider:orientation:]([SBHWidgetIconResizeViewHelper alloc], "initWithDelegate:listLayout:widgetMetricsProvider:orientation:", v13, v16, v11, [v10 layoutOrientation]);
    viewHelper = v13->_viewHelper;
    v13->_viewHelper = v17;
  }
  return v13;
}

- (void)dealloc
{
  free(self->_gesturePathVertices);
  v3.receiver = self;
  v3.super_class = (Class)SBWidgetIconResizeGestureHandler;
  [(SBWidgetIconResizeGestureHandler *)&v3 dealloc];
}

- (void)iconView:(id)a3 resizeGestureRecognizerDidUpdate:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [v8 state];
  if ((unint64_t)(v5 - 3) < 3)
  {
    [(SBWidgetIconResizeGestureHandler *)self finishWithGestureRecognizer:v8];
LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  if (v5 == 2)
  {
    [(SBWidgetIconResizeGestureHandler *)self updateWithGestureRecognizer:v8];
    goto LABEL_8;
  }
  BOOL v6 = v5 == 1;
  v7 = v8;
  if (v6)
  {
    [(SBWidgetIconResizeGestureHandler *)self setUpWithGestureRecognizer:v8];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setUpWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  BOOL v6 = [(SBWidgetIconResizeGestureHandler *)self iconView];
  v7 = [v6 icon];
  v43 = [v7 activeDataSource];
  uint64_t v8 = [v5 userInterfaceLayoutDirection];
  [(SBWidgetIconResizeGestureHandler *)self setRTL:v8 == 1];
  [v6 frame];
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  if (v8 == 1) {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v9);
  }
  else {
    double MaxX = CGRectGetMinX(*(CGRect *)&v9);
  }
  double v18 = MaxX;
  v47.origin.x = v13;
  v47.origin.y = v14;
  v47.size.width = v15;
  v47.size.height = v16;
  -[SBWidgetIconResizeGestureHandler setIconViewOrigin:](self, "setIconViewOrigin:", v18, CGRectGetMinY(v47));
  v42 = [v7 gridSizeClass];
  [(SBWidgetIconResizeGestureHandler *)self setOriginalGridSizeClass:v42];
  [(SBWidgetIconResizeGestureHandler *)self setState:1];
  [v5 forgetIconView:v6];
  v41 = [v5 addPlaceholderRepresentingIcon:v7 reason:@"resize" options:16];
  v19 = [(SBWidgetIconResizeGestureHandler *)self placeholder];
  [v19 invalidate];

  [(SBWidgetIconResizeGestureHandler *)self setPlaceholder:v41];
  [v4 locationInView:v5];
  double v21 = v20;
  double v23 = v22;

  -[SBWidgetIconResizeGestureHandler setStartingLocation:](self, "setStartingLocation:", v21, v23);
  -[SBWidgetIconResizeGestureHandler setStretchingStartLocation:](self, "setStretchingStartLocation:", v21, v23);
  id v24 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v5 bounds];
  v40 = objc_msgSend(v24, "initWithFrame:");
  [v5 addSubview:v40];
  [v40 addSubview:v6];
  [(SBWidgetIconResizeGestureHandler *)self setContainerView:v40];
  v39 = [v7 supportedGridSizeClasses];
  v25 = [v5 model];
  v38 = [v25 allowedGridSizeClasses];

  v37 = [v39 gridSizeClassSetByIntersectingWithGridSizeClassSet:v38];
  v26 = [v37 gridSizeClassSetByRemovingGridSizeClass:@"SBHIconGridSizeClassDefault"];
  [(SBWidgetIconResizeGestureHandler *)self setAllowedGridSizeClasses:v26];
  v27 = [v6 listLayout];
  [(SBWidgetIconResizeGestureHandler *)self setListLayout:v27];
  v28 = SBHIconListLayoutIconGridSizeClassSizes(v27, [v5 layoutOrientation]);
  [(SBWidgetIconResizeGestureHandler *)self setIconGridSizeClassSizes:v28];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __63__SBWidgetIconResizeGestureHandler_setUpWithGestureRecognizer___block_invoke;
  v44[3] = &unk_1E6AAFC48;
  id v45 = v26;
  id v46 = v29;
  id v30 = v29;
  id v31 = v26;
  [v28 enumerateGridSizesSortedByAreaWithOptions:0 usingBlock:v44];
  [(SBWidgetIconResizeGestureHandler *)self setSortedGridSizeClasses:v30];
  v32 = [(SBWidgetIconResizeGestureHandler *)self viewHelper];
  [v6 gridSizeClassDomain];
  v36 = v5;
  v34 = v33 = v7;
  v35 = [[SBWidgetIconResizeTransitionViewController alloc] initWithLeafIcon:v33 allowedGridSizeClasses:v31 gridSizeClassDomain:v34 viewHelper:v32 options:0];
  [v6 setOverrideCustomIconImageViewController:v35];
  [(SBWidgetIconResizeGestureHandler *)self setPreviewViewController:v35];
  [(SBWidgetIconResizeGestureHandler *)self configureForStretching];
}

void __63__SBWidgetIconResizeGestureHandler_setUpWithGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsGridSizeClass:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)configureForStretching
{
  id v3 = [(SBWidgetIconResizeGestureHandler *)self sortedGridSizeClasses];
  uint64_t v4 = [v3 count];
  uint64_t v5 = v4;
  if (v4 == 2) {
    size_t v6 = 4;
  }
  else {
    size_t v6 = v4;
  }
  v7 = (double *)malloc_type_calloc(v6, 0x10uLL, 0x1000040451B5BE8uLL);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__SBWidgetIconResizeGestureHandler_configureForStretching__block_invoke;
  v10[3] = &unk_1E6AB33A8;
  v10[4] = self;
  v10[5] = v7;
  [v3 enumerateObjectsUsingBlock:v10];
  if (v5 == 2) {
    double RectangleFromLine = SBHPolygonCreateRectangleFromLine(v7, *v7, v7[1], v7[2], v7[3], 10.0);
  }
  if ([(SBWidgetIconResizeGestureHandler *)self gesturePathVertexCapacity] < v6)
  {
    self->_gesturePathVertices = (CGPoint *)reallocf(self->_gesturePathVertices, 16 * v6);
    [(SBWidgetIconResizeGestureHandler *)self setGesturePathVertexCapacity:v6];
  }
  uint64_t ConvexHullPoints = SBHPolygonFindConvexHullPoints(v7, v6, (uint64_t)self->_gesturePathVertices);
  free(v7);
  [(SBWidgetIconResizeGestureHandler *)self setGesturePathVertexCount:ConvexHullPoints];
}

uint64_t __58__SBWidgetIconResizeGestureHandler_configureForStretching__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) resizeHandlePointForGridSizeClass:a2];
  size_t v6 = (void *)(*(void *)(a1 + 40) + 16 * a3);
  *size_t v6 = v7;
  v6[1] = v8;
  return result;
}

- (void)updateWithGestureRecognizer:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SBWidgetIconResizeGestureHandler *)self iconView];
  [v4 layoutIfNeeded];
  [(SBWidgetIconResizeGestureHandler *)self updatePreviewSizeWithGestureRecognizer:v6];
  int64_t v5 = [(SBWidgetIconResizeGestureHandler *)self state];
  if (v5 == 2)
  {
    [(SBWidgetIconResizeGestureHandler *)self updateResizingWithGestureRecognizer:v6];
  }
  else if (v5 == 1)
  {
    [(SBWidgetIconResizeGestureHandler *)self updateStretchingWithGestureRecognizer:v6];
  }
}

- (void)updatePreviewSizeWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBWidgetIconResizeGestureHandler *)self iconView];
  id v6 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;
  [v4 locationInView:v5];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  BOOL v15 = [(SBWidgetIconResizeGestureHandler *)self isRTL];
  [v5 frame];
  double v20 = 0.0;
  if (v15) {
    double v20 = CGRectGetWidth(*(CGRect *)&v16) + -1.0;
  }
  if (!-[SBWidgetIconResizeGestureHandler isPointInsideGesturePath:](self, "isPointInsideGesturePath:", v8, v10))
  {
    -[SBWidgetIconResizeGestureHandler nearestPointInsideGesturePathForPoint:](self, "nearestPointInsideGesturePathForPoint:", v8, v10);
    double v22 = v21;
    double v24 = v23;
    UIDistanceBetweenPoints();
    BSUIConstrainValueWithRubberBand();
    objc_msgSend(v5, "convertPoint:fromView:", v6, SBHPointAtDistanceFromPointToPoint(v22, v24, v8, v10, v25));
    CGFloat v12 = v26;
    CGFloat v14 = v27;
  }
  v60.origin.CGFloat y = 0.0;
  v60.size.double width = 1.0;
  v60.size.double height = 1.0;
  v63.size.double width = 1.0;
  v63.size.double height = 1.0;
  v60.origin.x = v20;
  v63.origin.x = v12;
  v63.origin.CGFloat y = v14;
  CGRect v61 = CGRectUnion(v60, v63);
  rect.origin.x = v61.origin.x;
  CGFloat y = v61.origin.y;
  double width = v61.size.width;
  double height = v61.size.height;
  [v5 iconImageInfo];
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  v35 = [(SBWidgetIconResizeGestureHandler *)self sortedGridSizeClasses];
  v36 = [v35 firstObject];
  [(SBWidgetIconResizeGestureHandler *)self iconImageInfoForGridSizeClass:v36];
  double v39 = height;
  if (width <= v37)
  {
    double v40 = v38;
    double v39 = height;
    if (height <= v38)
    {
      double v41 = v37;
      if ((unint64_t)[v35 count] >= 3) {
        double v39 = width * (v41 / v40);
      }
      else {
        double v39 = height;
      }
    }
  }
  [(SBWidgetIconResizeGestureHandler *)self iconViewOrigin];
  double v43 = v42;
  uint64_t v45 = v44;
  if (v15)
  {
    v62.origin.x = rect.origin.x;
    v62.origin.CGFloat y = y;
    v62.size.double width = width;
    v62.size.double height = height;
    double v43 = v43 - CGRectGetWidth(v62);
  }
  id v46 = [(SBWidgetIconResizeGestureHandler *)self animationSettings];
  CGRect v47 = (void *)MEMORY[0x1E4FB1EB0];
  *(void *)&rect.origin.CGFloat y = MEMORY[0x1E4F143A8];
  *(void *)&rect.size.double width = 3221225472;
  *(void *)&rect.size.double height = __75__SBWidgetIconResizeGestureHandler_updatePreviewSizeWithGestureRecognizer___block_invoke;
  v50 = &unk_1E6AB33D0;
  id v51 = v5;
  double v52 = width;
  double v53 = v39;
  uint64_t v54 = v32;
  uint64_t v55 = v34;
  double v56 = v43;
  uint64_t v57 = v45;
  double v58 = width;
  double v59 = height;
  id v48 = v5;
  objc_msgSend(v47, "sb_animateWithSettings:mode:animations:completion:", v46, 5, &rect.origin.y, 0);
}

uint64_t __75__SBWidgetIconResizeGestureHandler_updatePreviewSizeWithGestureRecognizer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  id v3 = *(void **)(a1 + 32);
  return [v3 layoutIfNeeded];
}

- (void)updateStretchingWithGestureRecognizer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;
  [(SBWidgetIconResizeGestureHandler *)self stretchingStartLocation];
  double v12 = hypot(v7 - v10, v9 - v11);
  if (fabs(v12) >= 20.0)
  {
    [(SBWidgetIconResizeGestureHandler *)self updateTransitionEndpointAndProgressWithGestureRecognizer:v4];
    double v13 = SBLogWidgetResizing();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      double v15 = v12;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "resize went beyond hysteresis for stretching (%f)", (uint8_t *)&v14, 0xCu);
    }

    [(SBWidgetIconResizeGestureHandler *)self setState:2];
  }
}

- (double)updateTransitionEndpointAndProgressWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  [v4 locationInView:v5];
  -[SBWidgetIconResizeGestureHandler nearestPointInsideGesturePathForPoint:](self, "nearestPointInsideGesturePathForPoint:");
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  [(SBWidgetIconResizeGestureHandler *)self stretchingStartLocation];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  int v14 = [(SBWidgetIconResizeGestureHandler *)self previewViewController];
  double v15 = [v14 startingGridSizeClass];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  double v38 = __Block_byref_object_copy__17;
  double v39 = __Block_byref_object_dispose__17;
  id v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v16 = [(SBWidgetIconResizeGestureHandler *)self sortedGridSizeClasses];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__SBWidgetIconResizeGestureHandler_updateTransitionEndpointAndProgressWithGestureRecognizer___block_invoke;
  v20[3] = &unk_1E6AB33F8;
  id v17 = v15;
  id v21 = v17;
  double v22 = self;
  uint64_t v26 = v7;
  uint64_t v27 = v9;
  double v23 = &v35;
  double v24 = v30;
  uint64_t v28 = v11;
  uint64_t v29 = v13;
  double v25 = &v31;
  [v16 enumerateObjectsUsingBlock:v20];
  [v14 setEndingGridSizeClass:v36[5] animated:1];
  [v14 setTransitionProgress:(v32[3] + -0.03) / 0.92];
  double v18 = v32[3];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v18;
}

void __93__SBWidgetIconResizeGestureHandler_updateTransitionEndpointAndProgressWithGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int64_t v5 = v4;
  if (*(id *)(a1 + 32) != v4)
  {
    id v19 = v4;
    char v6 = objc_msgSend(v4, "isEqualToString:");
    int64_t v5 = v19;
    if ((v6 & 1) == 0)
    {
      [*(id *)(a1 + 40) resizeHandlePointForGridSizeClass:v19];
      double v8 = v7;
      double v10 = v9;
      UIDistanceBetweenPoints();
      int64_t v5 = v19;
      double v12 = v11;
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void *)(v13 + 40);
      int v14 = (id *)(v13 + 40);
      if (!v15 || v11 < *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong(v14, a2);
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;
        SBHNearestPointInLine(*(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v8, v10);
        UIDistanceBetweenPoints();
        double v17 = v16;
        UIDistanceBetweenPoints();
        int64_t v5 = v19;
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v18 / v17;
      }
    }
  }
}

- (void)updateResizingWithGestureRecognizer:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  char v6 = [(SBWidgetIconResizeGestureHandler *)self containerView];
  [(SBWidgetIconResizeGestureHandler *)self updateTransitionEndpointAndProgressWithGestureRecognizer:v4];
  double v8 = v7;

  double v9 = [(SBWidgetIconResizeGestureHandler *)self previewViewController];
  double v10 = [v9 startingGridSizeClass];
  uint64_t v11 = [v9 endingGridSizeClass];
  double v12 = (void *)v11;
  if (v8 <= 0.5) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = (void *)v11;
  }
  id v14 = v13;
  uint64_t v15 = SBLogWidgets();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    double v20 = *(double *)&v14;
    _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "setting placeholder grid size class: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  double v16 = [(SBWidgetIconResizeGestureHandler *)self placeholder];
  [v16 setGridSizeClass:v14];
  [v5 layoutIconsIfNeededWithAnimationType:0 options:0];
  [v5 bringSubviewToFront:v6];
  double v17 = SBLogWidgets();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134217984;
    double v20 = v8;
    _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "widget resize progress: %f", (uint8_t *)&v19, 0xCu);
  }

  if (v8 >= 0.95)
  {
    double v18 = SBLogWidgetResizing();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      double v20 = *(double *)&v12;
      _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "resize went beyond 95%%, switching to size class %{public}@", (uint8_t *)&v19, 0xCu);
    }

    [v9 swapViewControllers];
    [v9 setEndingGridSizeClass:0];
    [v9 setTransitionProgress:0.0];
    [(SBWidgetIconResizeGestureHandler *)self resizeHandlePointForGridSizeClass:v12];
    -[SBWidgetIconResizeGestureHandler setStretchingStartLocation:](self, "setStretchingStartLocation:");
  }
  else if (v8 < 0.03)
  {
    [v9 setEndingGridSizeClass:0];
    [v9 setTransitionProgress:0.0];
  }
}

- (void)finishWithGestureRecognizer:(id)a3
{
  id v4 = [(SBWidgetIconResizeGestureHandler *)self iconView];
  int64_t v5 = [v4 extendResizingFinish];
  char v6 = [(SBWidgetIconResizeGestureHandler *)self placeholder];
  double v7 = [v6 gridSizeClass];
  unint64_t v8 = [v6 gridCellIndex];
  [(SBWidgetIconResizeGestureHandler *)self iconImageInfoForGridSizeClass:v7];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [v4 iconImageInfo];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  double v17 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  unint64_t v18 = SBIconCoordinateMakeWithGridCellIndex(v8, [v17 gridSizeForCurrentOrientation]);
  objc_msgSend(v17, "centerForIconCoordinate:", v18, v19);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  double v24 = [(SBWidgetIconResizeGestureHandler *)self previewViewController];
  double v25 = [v24 endingGridSizeClass];
  if (v7 == v25)
  {
    double v26 = 1.0;
  }
  else if ([v7 isEqualToString:v25])
  {
    double v26 = 1.0;
  }
  else
  {
    double v26 = 0.0;
  }
  uint64_t v27 = [(SBWidgetIconResizeGestureHandler *)self animationSettings];
  uint64_t v28 = (void *)MEMORY[0x1E4FB1EB0];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke;
  v37[3] = &unk_1E6AB3420;
  uint64_t v40 = v10;
  uint64_t v41 = v12;
  uint64_t v42 = v14;
  uint64_t v43 = v16;
  uint64_t v44 = v21;
  uint64_t v45 = v23;
  id v38 = v4;
  id v39 = v24;
  double v46 = v26;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke_2;
  v33[3] = &unk_1E6AB3448;
  id v34 = v5;
  uint64_t v35 = self;
  id v36 = v7;
  id v29 = v7;
  id v30 = v5;
  id v31 = v24;
  id v32 = v4;
  objc_msgSend(v28, "sb_animateWithSettings:mode:animations:completion:", v27, 3, v37, v33);
}

uint64_t __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 96);
  return [v2 setTransitionProgress:v3];
}

uint64_t __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) informDelegateFinishedWithSizeClass:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);
  return [v2 tearDown];
}

- (void)tearDown
{
  double v3 = [(SBWidgetIconResizeGestureHandler *)self placeholder];
  [v3 invalidate];

  [(SBWidgetIconResizeGestureHandler *)self setPlaceholder:0];
  id v4 = [(SBWidgetIconResizeGestureHandler *)self containerView];
  [v4 removeFromSuperview];

  [(SBWidgetIconResizeGestureHandler *)self setContainerView:0];
  id v6 = [(SBWidgetIconResizeGestureHandler *)self previewViewController];
  [v6 invalidate];
  int64_t v5 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  [v5 layoutIconsNow];
}

- (void)setState:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    int64_t v5 = SBLogWidgetResizing();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 4) {
        id v6 = 0;
      }
      else {
        id v6 = off_1E6AB3468[a3];
      }
      int v7 = 138543362;
      unint64_t v8 = v6;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "changing resize gesture handler state to %{public}@", (uint8_t *)&v7, 0xCu);
    }

    self->_state = a3;
  }
}

- (void)informDelegateFinishedWithSizeClass:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWidgetIconResizeGestureHandler *)self delegate];
  [v5 resizeGestureHandler:self didFinishWithGridSizeClass:v4];
}

- (id)effectiveGridSizeClassDomain
{
  v2 = [(SBWidgetIconResizeGestureHandler *)self iconView];
  double v3 = [v2 gridSizeClassDomain];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[SBHIconGridSizeClassDomain globalDomain];
  }
  id v6 = v5;

  return v6;
}

- (CGPoint)resizeHandlePointForGridSizeClass:(id)a3
{
  [(SBWidgetIconResizeGestureHandler *)self iconImageInfoForGridSizeClass:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(SBWidgetIconResizeGestureHandler *)self iconViewOrigin];
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(SBWidgetIconResizeGestureHandler *)self isRTL];
  double v15 = -v5;
  double v16 = -v9;
  if (v14) {
    double v16 = v9;
  }
  else {
    double v15 = v5;
  }
  double v17 = v16 + v11 + v15;
  double v18 = -(v9 * 0.707106781);
  if (!v14) {
    double v18 = v9 * 0.707106781;
  }
  double v19 = v18 + v17;
  double v20 = v9 * 0.707106781 + v13 + v7 - v9;
  result.CGFloat y = v20;
  result.x = v19;
  return result;
}

- (BOOL)isPointInsideGesturePath:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(SBWidgetIconResizeGestureHandler *)self gesturePathVertexCount];
  gesturePathVertices = self->_gesturePathVertices;
  return SBHPolygonContainsPoint((uint64_t)gesturePathVertices, v6, x, y);
}

- (CGPoint)nearestPointInsideGesturePathForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(SBWidgetIconResizeGestureHandler *)self gesturePathVertexCount];
  gesturePathVertices = self->_gesturePathVertices;
  double v8 = SBHPolygonNearestPointToPoint((uint64_t)gesturePathVertices, v6, x, y);
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5 = a4;
  uint64_t v6 = [(SBWidgetIconResizeGestureHandler *)self iconListView];
  [v6 iconImageInfoForGridSizeClass:v5];

  return result;
}

- (id)iconResizeViewHelper:(id)a3 intentForWidget:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBWidgetIconResizeGestureHandler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v7 = [v6 resizeGestureHandler:self intentForWidget:v5];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)iconResizeViewHelper:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = [(SBWidgetIconResizeGestureHandler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v13 = [v12 resizeGestureHandler:self viewControllerForIconDataSource:v9 icon:v10 gridSizeClass:v11];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  double v3 = (void *)MEMORY[0x1E4F4F720];
  double v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWidgetIconResizeGestureHandler *)self effectiveGridSizeClassDomain];
  uint64_t v6 = [(SBWidgetIconResizeGestureHandler *)self previewViewController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__SBWidgetIconResizeGestureHandler_appendDescriptionToStream___block_invoke;
  v10[3] = &unk_1E6AADD48;
  id v11 = v4;
  double v12 = self;
  id v13 = v5;
  id v14 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = v4;
  [v9 appendProem:self block:v10];
}

void __62__SBWidgetIconResizeGestureHandler_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) state];
  if (v3 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E6AB3468[v3];
  }
  [v2 appendString:v4 withName:@"state"];
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) originalGridSizeClass];
  id v8 = [v5 descriptionForGridSizeClass:v7];
  [v6 appendString:v8 withName:@"originalGridSizeClass"];

  id v9 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 48);
  id v11 = [*(id *)(a1 + 56) startingGridSizeClass];
  double v12 = [v10 descriptionForGridSizeClass:v11];
  [v9 appendString:v12 withName:@"startingGridSizeClass"];

  id v13 = *(void **)(a1 + 32);
  id v14 = *(void **)(a1 + 48);
  double v15 = [*(id *)(a1 + 56) endingGridSizeClass];
  double v16 = [v14 descriptionForGridSizeClass:v15];
  [v13 appendString:v16 withName:@"endingGridSizeClass"];

  double v17 = *(void **)(a1 + 32);
  id v19 = [*(id *)(a1 + 40) previewViewController];
  id v18 = (id)[v17 appendObject:v19 withName:@"previewViewController"];
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (SBWidgetIconResizeGestureHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBWidgetIconResizeGestureHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (SBIconListViewPlaceholderPositioning)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (SBWidgetIconResizeTransitionViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
}

- (CGPoint)startingLocation
{
  double x = self->_startingLocation.x;
  double y = self->_startingLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingLocation:(CGPoint)a3
{
  self->_startingLocation = a3;
}

- (CGPoint)stretchingStartLocation
{
  double x = self->_stretchingStartLocation.x;
  double y = self->_stretchingStartLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStretchingStartLocation:(CGPoint)a3
{
  self->_stretchingStartLocation = a3;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (void)setIconGridSizeClassSizes:(id)a3
{
}

- (SBHIconGridSizeClassSet)allowedGridSizeClasses
{
  return self->_allowedGridSizeClasses;
}

- (void)setAllowedGridSizeClasses:(id)a3
{
}

- (NSArray)sortedGridSizeClasses
{
  return self->_sortedGridSizeClasses;
}

- (void)setSortedGridSizeClasses:(id)a3
{
}

- (CGPoint)iconViewOrigin
{
  double x = self->_iconViewOrigin.x;
  double y = self->_iconViewOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setIconViewOrigin:(CGPoint)a3
{
  self->_iconViewOrigin = a3;
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (NSString)originalGridSizeClass
{
  return self->_originalGridSizeClass;
}

- (void)setOriginalGridSizeClass:(id)a3
{
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (SBHWidgetIconResizeViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (unint64_t)gesturePathVertexCount
{
  return self->_gesturePathVertexCount;
}

- (void)setGesturePathVertexCount:(unint64_t)a3
{
  self->_gesturePathVertexCount = a3;
}

- (unint64_t)gesturePathVertexCapacity
{
  return self->_gesturePathVertexCapacity;
}

- (void)setGesturePathVertexCapacity:(unint64_t)a3
{
  self->_gesturePathVertexCapacitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHelper, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_originalGridSizeClass, 0);
  objc_storeStrong((id *)&self->_sortedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_allowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end