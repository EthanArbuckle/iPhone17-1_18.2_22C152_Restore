@interface PUIDPointerRenderingRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_updatePointerWithOptions:(unint64_t)a3 updateHandlerCollection:(id)a4 error:(id *)a5;
- (BOOL)isValidPointerPortalSourceCollection:(id)a3 forClient:(id)a4;
- (BOOL)pointerIsVisible;
- (BOOL)setPointerState:(id)a3 options:(unint64_t)a4 updateHandlerCollection:(id)a5 error:(id *)a6;
- (CATransform3D)transformToLocalWindowForCoordinateSpaceTransformToDisplay:(SEL)a3;
- (CGPoint)_positionForTargetWithCenter:(CGPoint)a3 modelCursorPosition:(CGPoint)a4 slip:(CGPoint)a5;
- (CGRect)_samplingBoundsForPointerShape:(id)a3;
- (NSString)description;
- (PSDisplay)display;
- (PUIDPointerRenderingRootViewController)initWithCoder:(id)a3;
- (PUIDPointerRenderingRootViewController)initWithDisplay:(id)a3 hiddenForPerformanceReasons:(BOOL)a4;
- (PUIDPointerRenderingRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUIDPointerRenderingRootViewControllerDelegate)delegate;
- (id)_createMatchMoveSourceView;
- (id)_createPortalSourceViewWithFrame:(CGRect)a3;
- (id)_positionAnimationCountIncrementingCompletionWrapper:(id)a3;
- (id)createContentMatchMoveSourceForClient:(id)a3;
- (id)createPointerPortalSourceCollectionForClient:(id)a3;
- (void)_debugVisualizationForView:(id)a3;
- (void)_debugVisualizationUpdate:(CATransform3D *)a3;
- (void)_relativePositionAnimationParametersUsingSystemPointerPositionSettings:(id)a3 forTextContent:(BOOL)a4 outXDamping:(double *)a5 outXResponse:(double *)a6 outYDamping:(double *)a7 outYResponse:(double *)a8;
- (void)_transitionFromPointerPortalSourceView:(id)a3 toPointerPortalSourceView:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_updatePointerShapePosition:(double)a3 onAxis:(unint64_t)a4 isModel:(BOOL)a5;
- (void)_updateRampingPropertiesForPointerSlip:(CGPoint)a3 animated:(BOOL)a4;
- (void)hidePointerAnimated:(BOOL)a3;
- (void)invalidateContentMatchMoveSource:(id)a3 forClient:(id)a4;
- (void)invalidateContentMatchMoveSourcesPassingTest:(id)a3 additionalInvalidation:(id)a4;
- (void)invalidateEffectSourcesForPointerClient:(id)a3;
- (void)invalidatePointerPortalSourceCollection:(id)a3 forClient:(id)a4;
- (void)invalidatePointerPortalSourceCollectionsPassingTest:(id)a3 additionalInvalidation:(id)a4;
- (void)pointerShapeViewExpectedSizeParametersDidChange:(id)a3;
- (void)pointerShapeViewVisibilityDidChange:(id)a3;
- (void)removeClippingRegion;
- (void)setClippingRegion:(CGRect)a3 cornerRadius:(double)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUIDPointerRenderingRootViewController

- (PUIDPointerRenderingRootViewController)initWithDisplay:(id)a3 hiddenForPerformanceReasons:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUIDPointerRenderingRootViewController;
  v8 = [(PUIDPointerRenderingRootViewController *)&v17 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_display, a3);
    v9->_visibilityState = 1;
    uint64_t v10 = +[PUIDPointerDomain rootSettings];
    settings = v9->_settings;
    v9->_settings = (PUIDPointerSettings *)v10;

    long long v12 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v9->_previousContentTransform.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&v9->_previousContentTransform.m23 = v12;
    long long v13 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v9->_previousContentTransform.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v9->_previousContentTransform.m13 = v13;
    long long v14 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v9->_previousContentTransform.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v9->_previousContentTransform.m43 = v14;
    long long v15 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&v9->_previousContentTransform.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&v9->_previousContentTransform.m33 = v15;
    v9->_hiddenForPerformanceReasons = a4;
  }

  return v9;
}

- (PUIDPointerRenderingRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PUIDPointerRenderingRootViewController.m" lineNumber:186 description:@"Call initWithDisplay: instead"];

  return [(PUIDPointerRenderingRootViewController *)self init];
}

- (PUIDPointerRenderingRootViewController)initWithCoder:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"PUIDPointerRenderingRootViewController.m" lineNumber:192 description:@"Call initWithDisplay: instead"];

  return [(PUIDPointerRenderingRootViewController *)self init];
}

- (void)viewDidLoad
{
  v54.receiver = self;
  v54.super_class = (Class)PUIDPointerRenderingRootViewController;
  [(PUIDPointerRenderingRootViewController *)&v54 viewDidLoad];
  v3 = +[NSUserDefaults standardUserDefaults];
  self->_isDebugMode = [v3 BOOLForKey:@"DebugScene"];

  v4 = [(PUIDPointerRenderingRootViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 setHidden:self->_hiddenForPerformanceReasons];
  long long v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v6, v8, v10, v12);
  pointerRootView = self->_pointerRootView;
  self->_pointerRootView = v13;

  [v4 addSubview:self->_pointerRootView];
  long long v15 = objc_alloc_init(PUIDPointerShapeView);
  pointerShapeView = self->_pointerShapeView;
  self->_pointerShapeView = v15;

  [(PUIDPointerShapeView *)self->_pointerShapeView setDelegate:self];
  double y = CGPointZero.y;
  -[PUIDPointerShapeView setPosition:](self->_pointerShapeView, "setPosition:", CGPointZero.x, y);
  [(UIView *)self->_pointerRootView addSubview:self->_pointerShapeView];
  v18 = (UIView *)objc_alloc_init((Class)UIView);
  pointerBackgroundSamplingSourceView = self->_pointerBackgroundSamplingSourceView;
  self->_pointerBackgroundSamplingSourceView = v18;

  -[UIView setPosition:](self->_pointerBackgroundSamplingSourceView, "setPosition:", CGPointZero.x, y);
  [v4 addSubview:self->_pointerBackgroundSamplingSourceView];
  v20 = (UIViewFloatAnimatableProperty *)objc_alloc_init((Class)UIViewFloatAnimatableProperty);
  rampingXPropertdouble y = self->_rampingXProperty;
  self->_rampingXPropertdouble y = v20;

  [(UIViewFloatAnimatableProperty *)self->_rampingXProperty setValue:0.0];
  v22 = (UIViewFloatAnimatableProperty *)objc_alloc_init((Class)UIViewFloatAnimatableProperty);
  rampingYPropertdouble y = self->_rampingYProperty;
  self->_rampingYPropertdouble y = v22;

  [(UIViewFloatAnimatableProperty *)self->_rampingYProperty setValue:0.0];
  v24 = (UIViewFloatAnimatableProperty *)objc_alloc_init((Class)UIViewFloatAnimatableProperty);
  pointerShapePositionXPropertdouble y = self->_pointerShapePositionXProperty;
  self->_pointerShapePositionXPropertdouble y = v24;

  [(UIViewFloatAnimatableProperty *)self->_pointerShapePositionXProperty setValue:0.0];
  v26 = (UIViewFloatAnimatableProperty *)objc_alloc_init((Class)UIViewFloatAnimatableProperty);
  pointerShapePositionYPropertdouble y = self->_pointerShapePositionYProperty;
  self->_pointerShapePositionYPropertdouble y = v26;

  [(UIViewFloatAnimatableProperty *)self->_pointerShapePositionYProperty setValue:0.0];
  objc_initWeak(&location, self);
  v56 = self->_pointerShapePositionXProperty;
  v28 = +[NSArray arrayWithObjects:&v56 count:1];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100020794;
  v51[3] = &unk_1000449D0;
  objc_copyWeak(&v52, &location);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10002088C;
  v49[3] = &unk_1000449D0;
  objc_copyWeak(&v50, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:v28 modelValueSetter:v51 presentationValueSetter:v49];

  v55 = self->_pointerShapePositionYProperty;
  v29 = +[NSArray arrayWithObjects:&v55 count:1];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100020984;
  v47[3] = &unk_1000449D0;
  objc_copyWeak(&v48, &location);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100020A7C;
  v45[3] = &unk_1000449D0;
  objc_copyWeak(&v46, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:v29 modelValueSetter:v47 presentationValueSetter:v45];

  v30 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v6, v8, v10, v12);
  specularEffectRootView = self->_specularEffectRootView;
  self->_specularEffectRootView = v30;

  [v4 addSubview:self->_specularEffectRootView];
  v32 = +[NSBundle PUID_mainBundle];
  v33 = +[UIImage imageNamed:@"Specular" inBundle:v32 withConfiguration:0];

  if (v33)
  {
    id v34 = objc_alloc((Class)UIView);
    [(UIView *)self->_specularEffectRootView bounds];
    id v35 = objc_msgSend(v34, "initWithFrame:");
    v36 = objc_alloc_init(PUIDPointerShapeView);
    specularEffectMaskPointerShapeView = self->_specularEffectMaskPointerShapeView;
    self->_specularEffectMaskPointerShapeView = v36;

    -[PUIDPointerShapeView setPosition:](self->_specularEffectMaskPointerShapeView, "setPosition:", 0.0, 0.0);
    v38 = self->_specularEffectMaskPointerShapeView;
    v39 = +[UIColor blackColor];
    [(PUIDPointerShapeView *)v38 setShapeMaterialReplacementColor:v39];

    [(PUIDPointerShapeView *)self->_specularEffectMaskPointerShapeView setIntensity:1.0];
    [v35 addSubview:self->_specularEffectMaskPointerShapeView];
    id v40 = objc_alloc((Class)UIView);
    [(UIView *)self->_specularEffectRootView bounds];
    id v41 = objc_msgSend(v40, "initWithFrame:");
    [v41 setMaskView:v35];
    [(UIView *)self->_specularEffectRootView addSubview:v41];
    v42 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v33];
    specularImageView = self->_specularImageView;
    self->_specularImageView = v42;

    [(UIImageView *)self->_specularImageView setAlpha:0.0];
    [v41 addSubview:self->_specularImageView];
    [(UIView *)self->_specularEffectRootView setHidden:1];
  }
  v44 = [(PUIDPointerRenderingRootViewController *)self view];
  [(PUIDPointerRenderingRootViewController *)self _debugVisualizationForView:v44];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_display withName:@"display"];
  double v5 = [v3 build];

  return (NSString *)v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  double v8 = [(PUIDPointerRenderingRootViewController *)self view];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100020D10;
  v13[3] = &unk_1000453D0;
  objc_copyWeak(v14, &location);
  v14[1] = *(id *)&width;
  v14[2] = *(id *)&height;
  v14[3] = v10;
  v14[4] = v12;
  +[UIView _performWithoutRetargetingAnimations:v13];
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)pointerShapeViewExpectedSizeParametersDidChange:(id)a3
{
}

- (void)pointerShapeViewVisibilityDidChange:(id)a3
{
  self->_pointerIsVisible = [a3 isVisible];
  id v4 = [(PUIDPointerRenderingRootViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PUIDPointerRenderingRootViewController *)self delegate];
    [v6 pointerVisibilityDidChange:self];
  }
}

- (id)createPointerPortalSourceCollectionForClient:(id)a3
{
  id v41 = a3;
  id v4 = [(PUIDPointerRenderingRootViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v13 = -[PUIDPointerRenderingRootViewController _createPortalSourceViewWithFrame:](self, "_createPortalSourceViewWithFrame:");
  long long v14 = [v13 contentPortalView];
  [v14 setSourceView:self->_pointerRootView];

  [v4 addSubview:v13];
  long long v15 = [v13 layer];
  id v16 = objc_alloc((Class)PSPortalSource);
  objc_super v17 = [v15 context];
  v39 = v15;
  id v18 = objc_msgSend(v16, "initWithSourceContextID:sourceLayerRenderID:", objc_msgSend(v17, "contextId"), CALayerGetRenderId());

  v19 = -[PUIDPointerRenderingRootViewController _createPortalSourceViewWithFrame:](self, "_createPortalSourceViewWithFrame:", v6, v8, v10, v12);
  v20 = [v19 contentPortalView];
  [v20 setSourceView:self->_specularEffectRootView];

  id v40 = v4;
  [v4 addSubview:v19];
  v21 = [v19 layer];
  id v22 = objc_alloc((Class)PSPortalSource);
  v23 = [v21 context];
  id v24 = objc_msgSend(v22, "initWithSourceContextID:sourceLayerRenderID:", objc_msgSend(v23, "contextId"), CALayerGetRenderId());

  portalSourceToView = self->_portalSourceToView;
  if (!portalSourceToView)
  {
    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v27 = self->_portalSourceToView;
    self->_portalSourceToView = v26;

    portalSourceToView = self->_portalSourceToView;
  }
  -[NSMutableDictionary setObject:forKey:](portalSourceToView, "setObject:forKey:", v13, v18, v21);
  [(NSMutableDictionary *)self->_portalSourceToView setObject:v19 forKey:v24];
  v28 = [(UIView *)self->_pointerBackgroundSamplingSourceView layer];
  id v29 = objc_alloc((Class)PSMatchMoveSource);
  v30 = [v28 context];
  id v31 = objc_msgSend(v29, "initWithSourceContextID:sourceLayerRenderID:", objc_msgSend(v30, "contextId"), CALayerGetRenderId());

  [v31 setShouldBeInvalidatedIfPointerLeavesDisplay:0];
  id v32 = [objc_alloc((Class)PSPointerPortalSourceCollection) initWithPointerPortalSource:v18 overlayEffectPortalSource:v24 samplingMatchMoveSource:v31];
  v33 = [(NSMapTable *)self->_pointerClientToSourceContainerMap objectForKey:v41];
  if (!v33)
  {
    v33 = objc_alloc_init(_PUIDPointerRenderingClientSourceContainer);
    pointerClientToSourceContainerMap = self->_pointerClientToSourceContainerMap;
    if (!pointerClientToSourceContainerMap)
    {
      id v35 = +[NSMapTable strongToStrongObjectsMapTable];
      v36 = self->_pointerClientToSourceContainerMap;
      self->_pointerClientToSourceContainerMap = v35;

      pointerClientToSourceContainerMap = self->_pointerClientToSourceContainerMap;
    }
    [(NSMapTable *)pointerClientToSourceContainerMap setObject:v33 forKey:v41];
  }
  [(_PUIDPointerRenderingClientSourceContainer *)v33 addPointerPortalSourceCollection:v32];

  return v32;
}

- (void)invalidatePointerPortalSourceCollection:(id)a3 forClient:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  double v7 = [(NSMapTable *)self->_pointerClientToSourceContainerMap objectForKey:v6];
  double v8 = [v7 pointerPortalSourceCollections];
  unsigned int v9 = [v8 containsObject:v18];

  if (v9)
  {
    double v10 = [v18 pointerPortalSource];
    if (v10)
    {
      double v11 = [(NSMutableDictionary *)self->_portalSourceToView objectForKey:v10];
      if (v11)
      {
        double v12 = v11;
        [v11 removeFromSuperview];
        [(NSMutableDictionary *)self->_portalSourceToView removeObjectForKey:v10];
      }
    }
    long long v13 = [v18 overlayEffectPortalSource];
    if (v13)
    {
      long long v14 = [(NSMutableDictionary *)self->_portalSourceToView objectForKey:v13];
      if (v14)
      {
        long long v15 = v14;
        [v14 removeFromSuperview];
        [(NSMutableDictionary *)self->_portalSourceToView removeObjectForKey:v13];
      }
    }
    if (![(NSMutableDictionary *)self->_portalSourceToView count])
    {
      portalSourceToView = self->_portalSourceToView;
      self->_portalSourceToView = 0;
    }
    [v7 removePointerPortalSourceCollection:v18];
    if ([v7 isEmpty])
    {
      [(NSMapTable *)self->_pointerClientToSourceContainerMap removeObjectForKey:v6];
      if (![(NSMapTable *)self->_pointerClientToSourceContainerMap count])
      {
        pointerClientToSourceContainerMap = self->_pointerClientToSourceContainerMap;
        self->_pointerClientToSourceContainerMap = 0;
      }
    }
  }
}

- (BOOL)isValidPointerPortalSourceCollection:(id)a3 forClient:(id)a4
{
  pointerClientToSourceContainerMap = self->_pointerClientToSourceContainerMap;
  id v6 = a3;
  double v7 = [(NSMapTable *)pointerClientToSourceContainerMap objectForKey:a4];
  double v8 = [v7 pointerPortalSourceCollections];
  unsigned __int8 v9 = [v8 containsObject:v6];

  return v9;
}

- (void)invalidatePointerPortalSourceCollectionsPassingTest:(id)a3 additionalInvalidation:(id)a4
{
  id v6 = (unsigned int (**)(id, uint64_t, void))a3;
  double v7 = (void (**)(id, uint64_t, uint64_t))a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v23 = self;
  double v8 = [(NSMapTable *)self->_pointerClientToSourceContainerMap keyEnumerator];
  unsigned __int8 v9 = [v8 allObjects];

  id obj = v9;
  id v20 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v10;
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        v21 = [(NSMapTable *)v23->_pointerClientToSourceContainerMap objectForKey:v11];
        double v12 = [v21 pointerPortalSourceCollections];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              if (!v6 || v6[2](v6, v11, *(void *)(*((void *)&v24 + 1) + 8 * i)))
              {
                [(PUIDPointerRenderingRootViewController *)v23 invalidatePointerPortalSourceCollection:v17 forClient:v11];
                v7[2](v7, v11, v17);
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v22 + 1;
      }
      while ((id)(v22 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }
}

- (id)createContentMatchMoveSourceForClient:(id)a3
{
  id v4 = a3;
  double v5 = [(PUIDPointerRenderingRootViewController *)self _createMatchMoveSourceView];
  id v6 = [v5 layer];
  id v7 = objc_alloc((Class)PSMatchMoveSource);
  double v8 = [(PUIDPointerRenderingRootViewController *)self view];
  unsigned __int8 v9 = [v8 window];
  id v10 = objc_msgSend(v7, "initWithSourceContextID:sourceLayerRenderID:", objc_msgSend(v9, "_contextId"), CALayerGetRenderId());

  matchMoveSourceToView = self->_matchMoveSourceToView;
  if (!matchMoveSourceToView)
  {
    double v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v13 = self->_matchMoveSourceToView;
    self->_matchMoveSourceToView = v12;

    matchMoveSourceToView = self->_matchMoveSourceToView;
  }
  [(NSMutableDictionary *)matchMoveSourceToView setObject:v5 forKey:v10];
  id v14 = [(NSMapTable *)self->_pointerClientToSourceContainerMap objectForKey:v4];
  if (!v14)
  {
    id v14 = objc_alloc_init(_PUIDPointerRenderingClientSourceContainer);
    pointerClientToSourceContainerMap = self->_pointerClientToSourceContainerMap;
    if (!pointerClientToSourceContainerMap)
    {
      id v16 = +[NSMapTable strongToStrongObjectsMapTable];
      uint64_t v17 = self->_pointerClientToSourceContainerMap;
      self->_pointerClientToSourceContainerMap = v16;

      pointerClientToSourceContainerMap = self->_pointerClientToSourceContainerMap;
    }
    [(NSMapTable *)pointerClientToSourceContainerMap setObject:v14 forKey:v4];
  }
  [(_PUIDPointerRenderingClientSourceContainer *)v14 addContentMatchMoveSource:v10];

  return v10;
}

- (void)invalidateContentMatchMoveSource:(id)a3 forClient:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_pointerClientToSourceContainerMap objectForKey:v6];
  double v8 = [v7 contentMatchMoveSources];
  unsigned int v9 = [v8 containsObject:v14];

  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_matchMoveSourceToView objectForKey:v14];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 removeFromSuperview];
      [(NSMutableDictionary *)self->_matchMoveSourceToView removeObjectForKey:v14];
    }
    if (![(NSMutableDictionary *)self->_matchMoveSourceToView count])
    {
      matchMoveSourceToView = self->_matchMoveSourceToView;
      self->_matchMoveSourceToView = 0;
    }
    [v7 removeContentMatchMoveSource:v14];
    if ([v7 isEmpty])
    {
      [(NSMapTable *)self->_pointerClientToSourceContainerMap removeObjectForKey:v6];
      if (![(NSMapTable *)self->_pointerClientToSourceContainerMap count])
      {
        pointerClientToSourceContainerMap = self->_pointerClientToSourceContainerMap;
        self->_pointerClientToSourceContainerMap = 0;
      }
    }
  }
}

- (void)invalidateContentMatchMoveSourcesPassingTest:(id)a3 additionalInvalidation:(id)a4
{
  id v6 = (unsigned int (**)(id, uint64_t, void))a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v23 = self;
  double v8 = [(NSMapTable *)self->_pointerClientToSourceContainerMap keyEnumerator];
  unsigned int v9 = [v8 allObjects];

  id obj = v9;
  id v20 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v10;
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        v21 = [(NSMapTable *)v23->_pointerClientToSourceContainerMap objectForKey:v11];
        double v12 = [v21 contentMatchMoveSources];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              if (!v6 || v6[2](v6, v11, *(void *)(*((void *)&v24 + 1) + 8 * i)))
              {
                [(PUIDPointerRenderingRootViewController *)v23 invalidateContentMatchMoveSource:v17 forClient:v11];
                v7[2](v7, v11, v17);
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v22 + 1;
      }
      while ((id)(v22 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void)invalidateEffectSourcesForPointerClient:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_pointerClientToSourceContainerMap objectForKey:v4];
  id v6 = [v5 contentMatchMoveSources];
  id v7 = [v5 pointerPortalSourceCollections];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(PUIDPointerRenderingRootViewController *)self invalidateContentMatchMoveSource:*(void *)(*((void *)&v22 + 1) + 8 * (void)v12) forClient:v4];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[PUIDPointerRenderingRootViewController invalidatePointerPortalSourceCollection:forClient:](self, "invalidatePointerPortalSourceCollection:forClient:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v17), v4, (void)v18);
        uint64_t v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (BOOL)setPointerState:(id)a3 options:(unint64_t)a4 updateHandlerCollection:(id)a5 error:(id *)a6
{
  uint64_t v11 = (PUIDPointerState *)a3;
  p_pointerState = &self->_pointerState;
  pointerState = self->_pointerState;
  id v14 = a5;
  id v15 = v14;
  if (pointerState == v11)
  {
    BOOL v20 = 1;
    [v14 performAllHandlersWithFinished:1 retargeted:0];
  }
  else
  {
    uint64_t v16 = [(PUIDPointerState *)v11 pointerShape];
    if ([v16 shapeType] == (id)5)
    {
      uint64_t v17 = [(PUIDPointerState *)*p_pointerState pointerShape];
      id v18 = [v17 shapeType];

      unint64_t v19 = a4 & 0xFFFFFFFFFFFFFFFELL;
      if (v18 == (id)5) {
        a4 &= ~1uLL;
      }
    }
    else
    {

      unint64_t v19 = a4 & 0xFFFFFFFFFFFFFFFELL;
    }
    if (self->_visibilityState == 1)
    {
      [(PUIDPointerState *)*p_pointerState pointerVisualIntensity];
      if (v21 == 0.0) {
        a4 = v19;
      }
    }
    objc_storeStrong((id *)&self->_pointerState, a3);
    id v24 = 0;
    BOOL v20 = [(PUIDPointerRenderingRootViewController *)self _updatePointerWithOptions:a4 updateHandlerCollection:v15 error:&v24];

    id v22 = v24;
    id v15 = v22;
    if (a6 && !v20)
    {
      id v15 = v22;
      *a6 = v15;
    }
  }

  return v20;
}

- (BOOL)_updatePointerWithOptions:(unint64_t)a3 updateHandlerCollection:(id)a4 error:(id *)a5
{
  id v159 = a4;
  id v6 = [(PUIDPointerRenderingRootViewController *)self view];
  memset(&v210[1], 0, sizeof(CATransform3D));
  pointerState = self->_pointerState;
  if (pointerState) {
    [(PUIDPointerState *)pointerState clientCoordinateSpaceTransformToDisplay];
  }
  memset(v210, 0, 128);
  *(CATransform3D *)a = v210[1];
  [(PUIDPointerRenderingRootViewController *)self transformToLocalWindowForCoordinateSpaceTransformToDisplay:a];
  CATransform3DGetDecomposition_();
  memset(&v209, 0, sizeof(v209));
  CATransform3DMakeRotation(&v209, v213, 0.0, 0.0, 1.0);
  int v8 = sub_10001AE14();
  id v9 = [(PUIDPointerState *)self->_pointerState pointerPortalSourceCollection];
  uint64_t v10 = [v9 pointerPortalSource];
  uint64_t v11 = [(PSPointerPortalSourceCollection *)self->_previousPointerPortalSourceCollection pointerPortalSource];
  double v12 = (void *)v11;
  v149 = (void *)v10;
  if (v10)
  {
    v158 = -[NSMutableDictionary objectForKey:](self->_portalSourceToView, "objectForKey:");
    if (v12)
    {
LABEL_5:
      v157 = [(NSMutableDictionary *)self->_portalSourceToView objectForKey:v12];
      goto LABEL_8;
    }
  }
  else
  {
    v158 = 0;
    if (v11) {
      goto LABEL_5;
    }
  }
  v157 = 0;
LABEL_8:
  uint64_t v13 = [v9 overlayEffectPortalSource];
  uint64_t v156 = [(PSPointerPortalSourceCollection *)self->_previousPointerPortalSourceCollection overlayEffectPortalSource];
  v148 = (void *)v13;
  if (v13)
  {
    v161 = [(NSMutableDictionary *)self->_portalSourceToView objectForKey:v13];
  }
  else
  {
    v161 = 0;
  }
  id v14 = (void *)v156;
  if (v156)
  {
    id v15 = [(NSMutableDictionary *)self->_portalSourceToView objectForKey:v156];
  }
  else
  {
    id v15 = 0;
  }
  v160 = v12;
  if (v161 != v15)
  {
    uint64_t v16 = [v15 contentPortalView];
    [v16 setAlpha:0.0];

    uint64_t v17 = [v161 contentPortalView];
    [v17 setAlpha:1.0];
  }
  v147 = v15;
  objc_storeStrong((id *)&self->_previousPointerPortalSourceCollection, v9);
  id v18 = [(PUIDPointerState *)self->_pointerState contentMatchMoveSource];
  if (v18)
  {
    unint64_t v19 = [(NSMutableDictionary *)self->_matchMoveSourceToView objectForKey:v18];
  }
  else
  {
    unint64_t v19 = 0;
  }
  if (self->_previousContentMatchMoveSource)
  {
    v155 = -[NSMutableDictionary objectForKey:](self->_matchMoveSourceToView, "objectForKey:");
  }
  else
  {
    v155 = 0;
  }
  objc_storeStrong((id *)&self->_previousContentMatchMoveSource, v18);
  [(PUIDPointerState *)self->_pointerState modelPointerReferencePosition];
  double v21 = v20;
  double v23 = v22;
  sub_1000233BC(@"pointerStateModelReferencePosition", self->_pointerState, v20, v22);
  objc_msgSend(v6, "convertPoint:fromView:", 0, v21, v23);
  double v25 = v24;
  double v27 = v26;
  sub_1000233BC(@"relativeModelPosition", self->_pointerState, v24, v26);
  [(PUIDPointerState *)self->_pointerState contentBounds];
  CGFloat y = CGPointZero.y;
  uint64_t v29 = [(PUIDPointerState *)self->_pointerState pointerSlipValue];
  v150 = (void *)v29;
  double v151 = v27;
  double v152 = v25;
  if (v29)
  {
    long long v30 = (void *)v29;
    UIRectGetCenter();
    *(CATransform3D *)a = v210[0];
    CA_CGPointApplyTransform();
    double x = v31;
    double v34 = v33;
    sub_1000233BC(@"contentBoundsCenterInLocalWindowCoordinates", self->_pointerState, v31, v33);
    [v30 CGPointValue];
    double v36 = v35;
    double v38 = v37;
    sub_1000233BC(@"pointerSlipValue", self->_pointerState, v35, v37);
    if (v8) {
      double v39 = v36;
    }
    else {
      double v39 = v38;
    }
    if (!v8) {
      double v38 = v36;
    }
    sub_1000233BC(@"pointerSlipValue post transform", self->_pointerState, v38, v39);
    -[PUIDPointerRenderingRootViewController _positionForTargetWithCenter:modelCursorPosition:slip:](self, "_positionForTargetWithCenter:modelCursorPosition:slip:", x, v34, v152, v151, v38, v39);
    double v41 = v40;
    double v43 = v42;
  }
  else
  {
    double v39 = 1.0;
    double v41 = v25;
    double v43 = v27;
    double v38 = 1.0;
    double v34 = y;
    double x = CGPointZero.x;
  }
  char v146 = sub_1000233BC(@"relativeEffectedPosition", self->_pointerState, v41, v43);
  if (v146)
  {
    v145 = v6;
    v44 = [v6 window];
    v45 = [v44 screen];
    id v46 = v45;
    double v138 = v39;
    if (v45)
    {
      id v47 = v45;
    }
    else
    {
      id v47 = +[UIScreen mainScreen];
    }
    id v50 = v47;

    [v50 scale];
    BSPointRoundForScale();
    double v137 = v51;
    double v53 = v52;
    objc_super v54 = [(PUIDPointerState *)self->_pointerState contentSlipValue];
    v55 = v54;
    CGFloat v56 = CGPointZero.x;
    CGFloat v142 = y;
    if (v54)
    {
      [v54 CGPointValue];
      if (v8) {
        double v59 = v58;
      }
      else {
        double v59 = v57;
      }
      if (v8) {
        double v60 = v57;
      }
      else {
        double v60 = v58;
      }
      -[PUIDPointerRenderingRootViewController _positionForTargetWithCenter:modelCursorPosition:slip:](self, "_positionForTargetWithCenter:modelCursorPosition:slip:", x, v34, v152, v151, v59, v60);
      *(CATransform3D *)a = v209;
      CATransform3DInvert(&v208, (CATransform3D *)a);
      CA_CGPointApplyTransform();
      CGFloat v56 = v61;
      CGFloat v142 = v62;
    }
    v63 = [(PUIDPointerState *)self->_pointerState pointerShape];
    v64 = (char *)[v63 shapeType];
    v65 = v64;
    v141 = v9;
    v143 = v19;
    v139 = v55;
    v140 = v50;
    if (v64 == (char *)5)
    {
      [v63 pinnedPoint];
      *(CATransform3D *)a = v210[0];
      CA_CGPointApplyTransform();
      BSPointRoundForScale();
      double v67 = v66;
      double v69 = v68;
      [(PUIDPointerSettings *)self->_settings systemPointerSize];
      double v71 = v70;
      [(PUIDPointerSettings *)self->_settings systemPointerPressedScale];
      double v73 = v71 * v72;
      double v134 = v71 * v72 * 0.5;
      double v74 = v137;
      if (v67 >= v137) {
        double v75 = v137;
      }
      else {
        double v75 = v67;
      }
      if (v69 >= v53) {
        double v76 = v53;
      }
      else {
        double v76 = v69;
      }
      double v77 = vabdd_f64(v67, v137);
      double v78 = vabdd_f64(v69, v53);
      CGRect v217 = CGRectInset(*(CGRect *)&v75, -(v73 * 0.5), -(v73 * 0.5));
      CGFloat v79 = v217.origin.x;
      CGFloat v80 = v217.origin.y;
      CGFloat width = v217.size.width;
      *(double *)&CGPathRef path = v38;
      double v82 = v56;
      CGFloat height = v217.size.height;
      CGFloat v84 = CGRectGetMinX(v217) - v137;
      v218.origin.double x = v79;
      v218.origin.CGFloat y = v80;
      v218.size.CGFloat width = width;
      v218.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v218);
      double v86 = width;
      double v87 = v53;
      double v88 = height;
      CGFloat v56 = v82;
      double v38 = *(double *)&path;
      uint64_t v89 = +[PSPointerShape roundedRectWithBounds:cornerRadius:](PSPointerShape, "roundedRectWithBounds:cornerRadius:", v84, MinY - v53, v86, v88, v134);

      v63 = (void *)v89;
      double v91 = v151;
      double v90 = v152;
      double v92 = v138;
      goto LABEL_65;
    }
    double v87 = v53;
    if ((unint64_t)(v64 - 2) <= 2)
    {
      *(CATransform3D *)a = v210[0];
      CA_CGPointApplyTransform();
      double v94 = v93;
      double v96 = v95;
      CATransform3D v207 = v210[0];
      if (![(PUIDPointerState *)self->_pointerState isPointerUnderlayingContent])
      {
        *(CATransform3D *)a = v210[0];
        CATransform3DScale(&v207, (CATransform3D *)a, 1.0 / v214, 1.0 / v215, 1.0 / v216);
      }
      memset(&v206, 0, sizeof(v206));
      CATransform3DMakeTranslation(&b, -v94, -v96, 0.0);
      *(CATransform3D *)a = v207;
      CATransform3DConcat(&v206, (CATransform3D *)a, &b);
      if ([v63 shapeType] == (id)2)
      {
        [v63 bounds];
        *(CATransform3D *)a = v206;
        CA_CGRectApplyTransform();
        uint64_t v97 = +[PSPointerShape circleWithBounds:](PSPointerShape, "circleWithBounds:");

LABEL_63:
        v63 = (void *)v97;
        goto LABEL_64;
      }
      if ([v63 shapeType] == (id)3)
      {
        [v63 bounds];
        *(CATransform3D *)a = v206;
        CA_CGRectApplyTransform();
        double v99 = v98;
        double v101 = v100;
        double v103 = v102;
        double v105 = v104;
        [v63 cornerRadius];
        double v106 = v56;
        double v108 = v107;
        v109 = [v63 cornerCurve];
        double v110 = v105;
        double v87 = v53;
        double v111 = v108;
        CGFloat v56 = v106;
        uint64_t v112 = +[PSPointerShape roundedRectWithBounds:cornerRadius:cornerCurve:](PSPointerShape, "roundedRectWithBounds:cornerRadius:cornerCurve:", v109, v99, v101, v103, v110, v111);

        v63 = (void *)v112;
      }
      else if ([v63 shapeType] == (id)4)
      {
        patha = (const CGPath *)[v63 path];
        CATransform3D v204 = v206;
        Mutable = CGPathCreateMutable();
        *(void *)a = _NSConcreteStackBlock;
        *(void *)&a[8] = 3221225472;
        *(void *)&a[16] = sub_10002712C;
        *(void *)&a[24] = &unk_100045750;
        *(CATransform3D *)&a[32] = v204;
        v212 = Mutable;
        CGPathApplyWithBlock(patha, a);
        CopCGFloat y = CGPathCreateCopy(Mutable);
        CGPathRelease(Mutable);
        uint64_t v97 = +[PSPointerShape customShapeWithPath:usesEvenOddFillRule:](PSPointerShape, "customShapeWithPath:usesEvenOddFillRule:", Copy, [v63 usesEvenOddFillRule]);

        CGPathRelease(Copy);
        goto LABEL_63;
      }
    }
LABEL_64:
    double v91 = v151;
    double v90 = v152;
    double v74 = v137;
    double v92 = v138;
LABEL_65:
    unsigned int v115 = [(PUIDPointerState *)self->_pointerState suppressPointerMirroring];
    v116 = [(UIView *)self->_pointerRootView layer];
    v117 = v116;
    if (v115) {
      uint64_t v118 = 18;
    }
    else {
      uint64_t v118 = 0;
    }
    [v116 setDisableUpdateMask:v118];

    -[PUIDPointerRenderingRootViewController _updateRampingPropertiesForPointerSlip:animated:](self, "_updateRampingPropertiesForPointerSlip:animated:", a3 & 1, v38, v92);
    v196[0] = _NSConcreteStackBlock;
    v196[1] = 3221225472;
    v196[2] = sub_100023520;
    v196[3] = &unk_100045470;
    v196[4] = self;
    id v119 = v63;
    id v197 = v119;
    double v198 = v90;
    double v199 = v91;
    double v200 = v74;
    double v201 = v87;
    char v203 = a3 & 1;
    unint64_t v202 = a3;
    +[SBC2GroupCompletion perform:v196 finalCompletion:&stru_1000454B0];
    unsigned int v120 = [(PUIDPointerState *)self->_pointerState isPointerAutoHidden];
    if (v120) {
      int64_t v121 = 1;
    }
    else {
      int64_t v121 = 3;
    }
    if (v65 != (char *)5 && (v120 & 1) == 0)
    {
      if ([(PUIDPointerState *)self->_pointerState isPressed]) {
        int64_t v121 = 2;
      }
      else {
        int64_t v121 = 0;
      }
    }
    int64_t visibilityState = self->_visibilityState;
    self->_int64_t visibilityState = v121;
    v191[0] = _NSConcreteStackBlock;
    v191[1] = 3221225472;
    v191[2] = sub_100023C18;
    v191[3] = &unk_1000454D8;
    id v192 = v158;
    id v193 = v157;
    v194 = self;
    char v195 = a3 & 1;
    v189[0] = _NSConcreteStackBlock;
    v189[1] = 3221225472;
    v189[2] = sub_100023CBC;
    v189[3] = &unk_100044D78;
    id v122 = v159;
    id v190 = v122;
    +[SBC2GroupCompletion perform:v191 finalCompletion:v189];
    v186[0] = _NSConcreteStackBlock;
    v186[1] = 3221225472;
    v186[2] = sub_100023D14;
    v186[3] = &unk_100044A48;
    v186[4] = self;
    id v123 = v119;
    id v187 = v123;
    char v188 = a3 & 1;
    v184[0] = _NSConcreteStackBlock;
    v184[1] = 3221225472;
    v184[2] = sub_100023E00;
    v184[3] = &unk_100044D78;
    id v124 = v122;
    id v185 = v124;
    +[SBC2GroupCompletion perform:v186 finalCompletion:v184];
    v178[0] = _NSConcreteStackBlock;
    v178[1] = 3221225472;
    v178[2] = sub_100023E58;
    v178[3] = &unk_100045578;
    int64_t v180 = v121;
    v178[4] = self;
    id v125 = v123;
    id v179 = v125;
    int64_t v181 = visibilityState;
    BOOL v183 = (a3 & 2) != 0;
    unint64_t v182 = a3;
    v176[0] = _NSConcreteStackBlock;
    v176[1] = 3221225472;
    v176[2] = sub_1000247CC;
    v176[3] = &unk_100044D78;
    id v126 = v124;
    id v177 = v126;
    +[SBC2GroupCompletion perform:v178 finalCompletion:v176];
    v169[0] = _NSConcreteStackBlock;
    v169[1] = 3221225472;
    v169[2] = sub_100024824;
    v169[3] = &unk_1000455F0;
    v169[4] = self;
    CGFloat v173 = v56;
    CGFloat v174 = v142;
    id v170 = v19;
    id v171 = v155;
    id v172 = v145;
    char v175 = a3 & 1;
    v167[0] = _NSConcreteStackBlock;
    v167[1] = 3221225472;
    v167[2] = sub_100024C84;
    v167[3] = &unk_100044D78;
    id v127 = v126;
    id v168 = v127;
    +[SBC2GroupCompletion perform:v169 finalCompletion:v167];
    v164[0] = _NSConcreteStackBlock;
    v164[1] = 3221225472;
    v164[2] = sub_100024CDC;
    v164[3] = &unk_100044A48;
    v164[4] = self;
    id v128 = v125;
    id v165 = v128;
    char v166 = a3 & 1;
    v162[0] = _NSConcreteStackBlock;
    v162[1] = 3221225472;
    v162[2] = sub_100024FFC;
    v162[3] = &unk_100044D78;
    id v163 = v127;
    +[SBC2GroupCompletion perform:v164 finalCompletion:v162];
    v129 = [(PUIDPointerState *)self->_pointerState accessories];
    id v9 = v141;
    double v12 = v160;
    id v14 = (void *)v156;
    if ([v129 count])
    {
      accessoryContainerView = self->_accessoryContainerView;
      if (!accessoryContainerView)
      {
        v131 = (PUIDPointerAccessoryContainerView *)objc_opt_new();
        v132 = self->_accessoryContainerView;
        self->_accessoryContainerView = v131;

        [(UIView *)self->_pointerRootView insertSubview:self->_accessoryContainerView atIndex:0];
        accessoryContainerView = self->_accessoryContainerView;
      }
      *(CATransform3D *)a = v209;
      [(PUIDPointerAccessoryContainerView *)accessoryContainerView setTransform3D:a];
    }
    [(PUIDPointerAccessoryContainerView *)self->_accessoryContainerView setAccessories:v129 animated:1];
    *(CATransform3D *)a = v210[0];
    [(PUIDPointerRenderingRootViewController *)self _debugVisualizationUpdate:a];

    v49 = v159;
    unint64_t v19 = v143;
    id v6 = v145;
    goto LABEL_81;
  }
  id v48 = PSLogCommon();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    sub_10002861C(v48);
  }

  v49 = v159;
  if (a5)
  {
    *a5 = +[NSError errorWithDomain:@"PUIDPointerRenderingRootViewControllerErrorDomain" code:-1002 userInfo:0];
  }
LABEL_81:

  return v146;
}

- (CATransform3D)transformToLocalWindowForCoordinateSpaceTransformToDisplay:(SEL)a3
{
  id v6 = [(PUIDPointerRenderingRootViewController *)self view];
  id v7 = [v6 window];
  int v8 = [v7 screen];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[UIScreen mainScreen];
  }
  uint64_t v11 = v10;

  [v11 scale];
  sdouble x = v12;
  [v11 _referenceBounds];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v6 window];
  id v18 = [v17 windowScene];

  unint64_t v19 = [v18 _FBSScene];
  double v20 = [v19 settings];
  long long v54 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (objc_opt_respondsToSelector())
  {
    if (v20)
    {
      [v20 rootWindowTransform];
      double m11 = m.m11;
      double m12 = m.m12;
      double m13 = m.m13;
      double m14 = m.m14;
    }
    else
    {
      memset(&m, 0, 48);
      double m14 = 0.0;
      double m13 = 0.0;
      double m12 = 0.0;
      double m11 = 0.0;
    }
    long long v54 = *(_OWORD *)&m.m21;
  }
  else
  {
    double m11 = CGAffineTransformIdentity.a;
    double m12 = CGAffineTransformIdentity.b;
    double m13 = CGAffineTransformIdentity.c;
    double m14 = CGAffineTransformIdentity.d;
  }
  double v41 = v14;
  double v25 = (v14 - (v16 * m13 + m11 * v14)) * 0.5;
  double v26 = (v16 - (v16 * m14 + m12 * v14)) * 0.5;
  m.double m11 = m11;
  m.double m12 = m12;
  m.double m13 = m13;
  m.double m14 = m14;
  *(_OWORD *)&m.m21 = v54;
  CGAffineTransformInvert(&v53, (CGAffineTransform *)&m);
  double a = v53.a;
  double v43 = v53.b;
  double v44 = v26 * v53.c;
  double v42 = v26 * v53.d;
  [v11 _rotation];
  memset(&v52, 0, sizeof(v52));
  CGAffineTransformMakeRotation(&v51, -v28);
  UIIntegralTransform();
  CGAffineTransform t1 = v52;
  CGAffineTransformScale((CGAffineTransform *)&m, &t1, sx, sx);
  *(_OWORD *)&v52.double a = *(_OWORD *)&m.m11;
  *(_OWORD *)&v52.c = *(_OWORD *)&m.m13;
  *(_OWORD *)&v52.tdouble x = *(_OWORD *)&m.m21;
  m.double m11 = m11;
  m.double m12 = m12;
  m.double m13 = m13;
  m.double m14 = m14;
  *(_OWORD *)&m.m21 = v54;
  if (!CGAffineTransformIsIdentity((CGAffineTransform *)&m))
  {
    CGAffineTransform t1 = v52;
    t2.double a = m11;
    t2.CATransform3D b = m12;
    t2.c = m13;
    t2.d = m14;
    *(_OWORD *)&t2.tdouble x = v54;
    CGAffineTransformConcat((CGAffineTransform *)&m, &t1, &t2);
    *(_OWORD *)&v52.double a = *(_OWORD *)&m.m11;
    *(_OWORD *)&v52.c = *(_OWORD *)&m.m13;
    *(_OWORD *)&v52.tdouble x = *(_OWORD *)&m.m21;
  }
  double x = v44 + a * v25;
  double v30 = v42 + v43 * v25;
  if (BSFloatEqualToFloat())
  {
    double v30 = -v16 - v30;
  }
  else if (BSFloatEqualToFloat())
  {
    double x = -v41 - x;
  }
  else
  {
    double y = CGPointZero.y;
    int v32 = BSFloatEqualToFloat();
    if (v32) {
      double x = -v41 - x;
    }
    else {
      double x = CGPointZero.x;
    }
    if (v32) {
      double v30 = -v16 - v30;
    }
    else {
      double v30 = y;
    }
  }
  CGAffineTransform t1 = v52;
  CGAffineTransformTranslate((CGAffineTransform *)&m, &t1, x, v30);
  long long v34 = *(_OWORD *)&m.m13;
  long long v33 = *(_OWORD *)&m.m21;
  *(_OWORD *)&v52.c = *(_OWORD *)&m.m13;
  *(_OWORD *)&v52.tdouble x = *(_OWORD *)&m.m21;
  long long v35 = *(_OWORD *)&m.m11;
  *(_OWORD *)&v52.double a = *(_OWORD *)&m.m11;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->double m11 = 0u;
  *(_OWORD *)&retstr->double m13 = 0u;
  *(_OWORD *)&m.double m11 = v35;
  *(_OWORD *)&m.double m13 = v34;
  *(_OWORD *)&m.m21 = v33;
  CATransform3DMakeAffineTransform(&v47, (CGAffineTransform *)&m);
  CATransform3DInvert(&b, &v47);
  long long v36 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&m.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&m.m33 = v36;
  long long v37 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&m.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&m.m43 = v37;
  long long v38 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&m.double m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&m.double m13 = v38;
  long long v39 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&m.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&m.m23 = v39;
  CATransform3DConcat(retstr, &m, &b);

  return result;
}

- (void)hidePointerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(PUIDPointerState *)self->_pointerState mutableCopy];
  [v6 setPointerAutoHidden:1];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [(PUIDPointerRenderingRootViewController *)self setPointerState:v6 options:v5 updateHandlerCollection:0 error:0];
}

- (void)setClippingRegion:(CGRect)a3 cornerRadius:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  pointerShapeView = self->_pointerShapeView;
  uint64_t v11 = [(PUIDPointerRenderingRootViewController *)self view];
  double v12 = [v11 window];
  -[PUIDPointerShapeView convertRect:fromCoordinateSpace:](pointerShapeView, "convertRect:fromCoordinateSpace:", v12, x, y, width, height);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v23.origin.double x = v14;
  v23.origin.double y = v16;
  v23.size.double width = v18;
  v23.size.double height = v20;
  double v21 = CGPathCreateWithRoundedRect(v23, a4, a4, 0);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(PUIDPointerShapeView *)self->_pointerShapeView setMaskPath:v21];
  +[CATransaction commit];
  CGPathRelease(v21);
}

- (void)removeClippingRegion
{
  if ([(PUIDPointerShapeView *)self->_pointerShapeView maskPath])
  {
    pointerShapeView = self->_pointerShapeView;
    [(PUIDPointerShapeView *)pointerShapeView setMaskPath:0];
  }
}

- (id)_positionAnimationCountIncrementingCompletionWrapper:(id)a3
{
  id v4 = a3;
  ++self->_positionAnimationCount;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000256E4;
  v9[3] = &unk_100044A20;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = objc_retainBlock(v9);
  id v7 = objc_retainBlock(v6);

  return v7;
}

- (void)_updateRampingPropertiesForPointerSlip:(CGPoint)a3 animated:(BOOL)a4
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100025844;
  v14[3] = &unk_100045668;
  BOOL v15 = a4;
  v14[4] = self;
  id v5 = objc_retainBlock(v14);
  rampingXPropertdouble y = self->_rampingXProperty;
  if (BSFloatLessThanFloat()) {
    v7.n128_f64[0] = 1.0;
  }
  else {
    v7.n128_f64[0] = 0.0;
  }
  ((void (*)(void *, UIViewFloatAnimatableProperty *, __n128))v5[2])(v5, rampingXProperty, v7);
  int v8 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
  id v9 = self->_rampingXProperty;
  self->_rampingXPropertdouble y = v8;

  rampingYPropertdouble y = self->_rampingYProperty;
  if (BSFloatLessThanFloat()) {
    v11.n128_f64[0] = 1.0;
  }
  else {
    v11.n128_f64[0] = 0.0;
  }
  ((void (*)(void *, UIViewFloatAnimatableProperty *, __n128))v5[2])(v5, rampingYProperty, v11);
  double v12 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
  double v13 = self->_rampingYProperty;
  self->_rampingYPropertdouble y = v12;
}

- (void)_relativePositionAnimationParametersUsingSystemPointerPositionSettings:(id)a3 forTextContent:(BOOL)a4 outXDamping:(double *)a5 outXResponse:(double *)a6 outYDamping:(double *)a7 outYResponse:(double *)a8
{
  BOOL v12 = a4;
  id v36 = a3;
  if (a5)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    int v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PUIDPointerRenderingRootViewController.m", 1220, @"Invalid parameter not satisfying: %@", @"outXDamping != NULL" object file lineNumber description];

    if (a6)
    {
LABEL_3:
      if (a7) {
        goto LABEL_4;
      }
LABEL_22:
      long long v34 = +[NSAssertionHandler currentHandler];
      [v34 handleFailureInMethod:a2, self, @"PUIDPointerRenderingRootViewController.m", 1222, @"Invalid parameter not satisfying: %@", @"outYDamping != NULL" object file lineNumber description];

      if (a8) {
        goto LABEL_5;
      }
      goto LABEL_23;
    }
  }
  long long v33 = +[NSAssertionHandler currentHandler];
  [v33 handleFailureInMethod:a2, self, @"PUIDPointerRenderingRootViewController.m", 1221, @"Invalid parameter not satisfying: %@", @"outXResponse != NULL" object file lineNumber description];

  if (!a7) {
    goto LABEL_22;
  }
LABEL_4:
  if (a8) {
    goto LABEL_5;
  }
LABEL_23:
  long long v35 = +[NSAssertionHandler currentHandler];
  [v35 handleFailureInMethod:a2, self, @"PUIDPointerRenderingRootViewController.m", 1223, @"Invalid parameter not satisfying: %@", @"outYResponse != NULL" object file lineNumber description];

LABEL_5:
  [(UIViewFloatAnimatableProperty *)self->_rampingXProperty presentationValue];
  double v16 = v15;
  [(UIViewFloatAnimatableProperty *)self->_rampingYProperty presentationValue];
  if (v12)
  {
    CGFloat v18 = [(PUIDPointerSettings *)self->_settings textContentPointerPositionAnimationSettings];
    [v18 dampingRatio];
    uint64_t v20 = v19;
    [v18 response];
    double v22 = v21;
    *(void *)a5 = v20;
    *(void *)a7 = v20;
    *a6 = v21;
  }
  else
  {
    double v23 = v17;
    [v36 dampingRatio];
    double v25 = v24;
    [v36 response];
    double v22 = v26;
    CGFloat v18 = [(PUIDPointerSettings *)self->_settings focusedPointerPositionAnimationSettings];
    [v18 dampingRatio];
    double v28 = v27;
    [v18 response];
    double v30 = v29;
    if (BSFloatIsZero())
    {
      *a5 = v25;
      double v31 = v22;
    }
    else if (BSFloatIsOne())
    {
      *a5 = v28;
      double v31 = v30;
    }
    else
    {
      *a5 = v16 * v28 + (1.0 - v16) * v25;
      double v31 = v16 * v30 + (1.0 - v16) * v22;
    }
    *a6 = v31;
    if (BSFloatIsZero())
    {
      *a7 = v25;
    }
    else if (BSFloatIsOne())
    {
      *a7 = v28;
      double v22 = v30;
    }
    else
    {
      *a7 = v23 * v28 + (1.0 - v23) * v25;
      double v22 = v23 * v30 + (1.0 - v23) * v22;
    }
  }
  *a8 = v22;
}

- (id)_createMatchMoveSourceView
{
  id v2 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
  return v2;
}

- (CGRect)_samplingBoundsForPointerShape:(id)a3
{
  [(PUIDPointerShapeView *)self->_pointerShapeView expectedShapeBoundsForPointerShape:a3];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  [(PUIDPointerSettings *)self->_settings systemPointerSize];
  UIRectCenteredRect();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = v5;
  uint64_t v21 = v7;
  uint64_t v22 = v9;
  uint64_t v23 = v11;
  return CGRectUnion(*(CGRect *)&v20, *(CGRect *)&v13);
}

- (id)_createPortalSourceViewWithFrame:(CGRect)a3
{
  BOOL v3 = -[_PUIDPointerPortalSourceView initWithFrame:]([_PUIDPointerPortalSourceView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

- (CGPoint)_positionForTargetWithCenter:(CGPoint)a3 modelCursorPosition:(CGPoint)a4 slip:(CGPoint)a5
{
  double v5 = a3.x - (a3.x - a4.x) * a5.x;
  double v6 = a3.y - (a3.y - a4.y) * a5.y;
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (void)_transitionFromPointerPortalSourceView:(id)a3 toPointerPortalSourceView:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [a3 contentPortalView];
  uint64_t v13 = [v11 contentPortalView];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000262FC;
  v63[3] = &unk_100044C88;
  id v14 = v12;
  id v64 = v14;
  id v15 = v13;
  id v65 = v15;
  uint64_t v16 = objc_retainBlock(v63);
  uint64_t v17 = v16;
  if (v6)
  {
    double v43 = self;
    id v45 = v14;
    id v46 = v10;
    id v18 = v14;
    uint64_t v19 = [v18 layer];
    id v44 = v15;
    id v20 = v15;
    uint64_t v21 = [v20 layer];
    uint64_t v40 = [v20 _velocityForKey:@"opacity"];
    if (v18)
    {
      uint64_t v22 = [v19 filters];
      if ((objc_msgSend(v22, "bs_containsObjectPassingTest:", &stru_1000456A8) & 1) == 0)
      {
        id v23 = [v22 mutableCopy];
        if (!v23) {
          id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
        }
        double v24 = +[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterOpacityPair, v40);
        [v24 setName:@"opacityPair"];
        [v23 addObject:v24];
        [v19 setFilters:v23];
      }
    }
    if (v20)
    {
      double v25 = [v21 filters];
      id v26 = [v25 indexOfObjectPassingTest:&stru_1000456E8];
      if (v26 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v27 = v26;
        id v28 = [v25 mutableCopy];
        [v28 removeObjectAtIndex:v27];
        [v21 setFilters:v28];
      }
    }
    double v29 = +[NSUUID UUID];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100026448;
    v57[3] = &unk_100045710;
    id v30 = v19;
    id v58 = v30;
    id v31 = v29;
    id v59 = v31;
    id v60 = v21;
    id v61 = v18;
    id v62 = v41;
    id v42 = v41;
    id v32 = v18;
    long long v33 = v21;
    +[UIView _performWithoutRetargetingAnimations:v57];
    long long v34 = [(PUIDPointerSettings *)v43->_settings zTransitionOpacityAnimationSettings];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000264FC;
    v53[3] = &unk_100045000;
    id v56 = v17;
    id v54 = v30;
    id v55 = v20;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100026584;
    v49[3] = &unk_1000455C8;
    id v50 = v54;
    id v51 = v31;
    long long v35 = v46;
    id v52 = v46;
    id v36 = v17;
    id v37 = v31;
    id v38 = v54;
    id v39 = v20;
    +[UIView _animateUsingSpringBehavior:v34 tracking:0 animations:v53 completion:v49];

    id v15 = v44;
    id v14 = v45;
  }
  else
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100026700;
    v47[3] = &unk_100045210;
    id v48 = v16;
    long long v33 = v16;
    +[UIView _performWithoutRetargetingAnimations:v47];
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
    id v32 = v48;
    long long v35 = v10;
  }
}

- (void)_updatePointerShapePosition:(double)a3 onAxis:(unint64_t)a4 isModel:(BOOL)a5
{
  BOOL v5 = a5;
  char v6 = a4;
  sub_1000267BC(a3, (uint64_t)self, self->_pointerShapeView, a4, a5);
  sub_1000267BC(a3, v9, self->_accessoryContainerView, v6, v5);
  sub_1000267BC(a3, v10, self->_pointerBackgroundSamplingSourceView, v6, v5);
  specularEffectMaskPointerShapeView = self->_specularEffectMaskPointerShapeView;
  sub_1000267BC(a3, v11, specularEffectMaskPointerShapeView, v6, v5);
}

- (PSDisplay)display
{
  return self->_display;
}

- (PUIDPointerRenderingRootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIDPointerRenderingRootViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)pointerIsVisible
{
  return self->_pointerIsVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_debugHoverRegion, 0);
  objc_storeStrong((id *)&self->_accessoryContainerView, 0);
  objc_storeStrong((id *)&self->_specularEffectRootView, 0);
  objc_storeStrong((id *)&self->_specularEffectMaskPointerShapeView, 0);
  objc_storeStrong((id *)&self->_specularImageView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_pointerShapePositionYProperty, 0);
  objc_storeStrong((id *)&self->_pointerShapePositionXProperty, 0);
  objc_storeStrong((id *)&self->_rampingYProperty, 0);
  objc_storeStrong((id *)&self->_rampingXProperty, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pointerBackgroundSamplingSourceView, 0);
  objc_storeStrong((id *)&self->_pointerShapeView, 0);
  objc_storeStrong((id *)&self->_pointerRootView, 0);
  objc_storeStrong((id *)&self->_previousPointerPortalSourceCollection, 0);
  objc_storeStrong((id *)&self->_previousContentMatchMoveSource, 0);
  objc_storeStrong((id *)&self->_portalSourceToView, 0);
  objc_storeStrong((id *)&self->_matchMoveSourceToView, 0);
  objc_storeStrong((id *)&self->_pointerState, 0);
  objc_storeStrong((id *)&self->_pointerClientToSourceContainerMap, 0);
}

- (void)_debugVisualizationForView:(id)a3
{
  if (self->_isDebugMode)
  {
    id v8 = [a3 layer];
    id v4 = +[UIColor colorWithRed:1.0 green:0.01 blue:0.5 alpha:0.200000003];
    objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

    id v5 = +[UIColor blueColor];
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v5, "CGColor"));

    [v8 setBorderWidth:1.0];
    char v6 = +[CALayer layer];
    debugHoverRegion = self->_debugHoverRegion;
    self->_debugHoverRegion = v6;

    [(CALayer *)self->_debugHoverRegion setBackgroundColor:CGColorCreateSRGB(1.0, 1.0, 0.0, 0.1)];
    [v8 addSublayer:self->_debugHoverRegion];
  }
}

- (void)_debugVisualizationUpdate:(CATransform3D *)a3
{
  if (self->_isDebugMode)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(PUIDPointerState *)self->_pointerState contentBounds];
    CATransform3D v5 = *a3;
    CA_CGRectApplyTransform();
    -[CALayer setFrame:](self->_debugHoverRegion, "setFrame:", *(_OWORD *)&v5.m11, *(_OWORD *)&v5.m13, *(_OWORD *)&v5.m21, *(_OWORD *)&v5.m23, *(_OWORD *)&v5.m31, *(_OWORD *)&v5.m33, *(_OWORD *)&v5.m41, *(_OWORD *)&v5.m43);
    +[CATransaction commit];
  }
}

@end