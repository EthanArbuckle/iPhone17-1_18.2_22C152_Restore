@interface PUIDSystemPointerRootViewController
- (BOOL)_canShowWhileLocked;
- (NSString)description;
- (PSDisplay)display;
- (PSPointerPortalSourceCollection)systemPointerPortalSourceCollection;
- (PUIDSystemPointerRootViewController)initWithCoder:(id)a3;
- (PUIDSystemPointerRootViewController)initWithDisplay:(id)a3;
- (PUIDSystemPointerRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_addMatchMoveAnimationFromSource:(id)a3 toView:(id)a4;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)setLumaChangedHandlerBlock:(id)a3;
- (void)setSamplingLuma:(BOOL)a3 seedingWithLumaLevel:(unint64_t)a4;
- (void)setSystemPointerPortalSourceCollection:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUIDSystemPointerRootViewController

- (PUIDSystemPointerRootViewController)initWithDisplay:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIDSystemPointerRootViewController;
  v6 = [(PUIDSystemPointerRootViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_display, a3);
  }

  return v7;
}

- (PUIDSystemPointerRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PUIDSystemPointerRootViewController.m" lineNumber:47 description:@"Call initWithDisplay: instead"];

  return [(PUIDSystemPointerRootViewController *)self init];
}

- (PUIDSystemPointerRootViewController)initWithCoder:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"PUIDSystemPointerRootViewController.m" lineNumber:53 description:@"Call initWithDisplay: instead"];

  return [(PUIDSystemPointerRootViewController *)self init];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)PUIDSystemPointerRootViewController;
  [(PUIDSystemPointerRootViewController *)&v20 viewDidLoad];
  v3 = [(PUIDSystemPointerRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = +[UIColor clearColor];
  [v3 setBackgroundColor:v12];

  v13 = (_UILumaTrackingBackdropView *)objc_msgSend(objc_alloc((Class)_UILumaTrackingBackdropView), "initWithTransitionBoundaries:delegate:frame:", self, 0.45, 0.55, 0.0, 0.0, 19.0, 19.0);
  pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
  self->_pointerLumaMeasurementView = v13;

  [(_UILumaTrackingBackdropView *)self->_pointerLumaMeasurementView setPaused:1];
  [(_UILumaTrackingBackdropView *)self->_pointerLumaMeasurementView setHidden:1];
  [v3 addSubview:self->_pointerLumaMeasurementView];
  v15 = [(PSPointerPortalSourceCollection *)self->_systemPointerPortalSourceCollection samplingMatchMoveSource];
  [(PUIDSystemPointerRootViewController *)self _addMatchMoveAnimationFromSource:v15 toView:self->_pointerLumaMeasurementView];
  v16 = (_UIPortalView *)objc_msgSend(objc_alloc((Class)_UIPortalView), "initWithFrame:", v5, v7, v9, v11);
  systemPointerPortalView = self->_systemPointerPortalView;
  self->_systemPointerPortalView = v16;

  v18 = [(PSPointerPortalSourceCollection *)self->_systemPointerPortalSourceCollection pointerPortalSource];
  if (v18)
  {
    v19 = [(_UIPortalView *)self->_systemPointerPortalView portalLayer];
    objc_msgSend(v19, "setSourceContextId:", objc_msgSend(v18, "sourceContextID"));
    objc_msgSend(v19, "setSourceLayerRenderId:", objc_msgSend(v18, "sourceLayerRenderID"));
  }
  [(_UIPortalView *)self->_systemPointerPortalView setMatchesAlpha:1];
  [(_UIPortalView *)self->_systemPointerPortalView setHidesSourceView:0];
  [(_UIPortalView *)self->_systemPointerPortalView setMatchesTransform:1];
  [(_UIPortalView *)self->_systemPointerPortalView setMatchesPosition:1];
  [v3 addSubview:self->_systemPointerPortalView];
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_display withName:@"display"];
  double v5 = [v3 build];

  return (NSString *)v5;
}

- (void)setSystemPointerPortalSourceCollection:(id)a3
{
  id v4 = (PSPointerPortalSourceCollection *)a3;
  systemPointerPortalSourceCollection = self->_systemPointerPortalSourceCollection;
  if (systemPointerPortalSourceCollection != v4)
  {
    v12 = v4;
    if (([(PSPointerPortalSourceCollection *)systemPointerPortalSourceCollection isEqual:v4] & 1) == 0)
    {
      double v6 = (PSPointerPortalSourceCollection *)[(PSPointerPortalSourceCollection *)v12 copy];
      double v7 = self->_systemPointerPortalSourceCollection;
      self->_systemPointerPortalSourceCollection = v6;

      systemPointerPortalView = self->_systemPointerPortalView;
      if (systemPointerPortalView)
      {
        double v9 = [(_UIPortalView *)systemPointerPortalView portalLayer];
        double v10 = [(PSPointerPortalSourceCollection *)v12 pointerPortalSource];
        objc_msgSend(v9, "setSourceContextId:", objc_msgSend(v10, "sourceContextID"));
        objc_msgSend(v9, "setSourceLayerRenderId:", objc_msgSend(v10, "sourceLayerRenderID"));
      }
      if (self->_pointerLumaMeasurementView)
      {
        double v11 = [(PSPointerPortalSourceCollection *)v12 samplingMatchMoveSource];
        [(PUIDSystemPointerRootViewController *)self _addMatchMoveAnimationFromSource:v11 toView:self->_pointerLumaMeasurementView];
      }
    }
  }
  _objc_release_x1();
}

- (void)setSamplingLuma:(BOOL)a3 seedingWithLumaLevel:(unint64_t)a4
{
  if (self->_sampling == a3) {
    return;
  }
  self->_sampling = a3;
  pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
  if (a3)
  {
    [(_UILumaTrackingBackdropView *)pointerLumaMeasurementView setHidden:0];
    double v7 = self->_pointerLumaMeasurementView;
    if (a4)
    {
      [(_UILumaTrackingBackdropView *)v7 unpauseAfterSeedingWithLumaLevel:a4];
      return;
    }
    uint64_t v8 = 0;
  }
  else
  {
    -[_UILumaTrackingBackdropView setHidden:](pointerLumaMeasurementView, "setHidden:", 1, a4);
    double v7 = self->_pointerLumaMeasurementView;
    uint64_t v8 = 1;
  }
  [(_UILumaTrackingBackdropView *)v7 setPaused:v8];
}

- (void)setLumaChangedHandlerBlock:(id)a3
{
  self->_lumaChangedHandlerBlock = [a3 copy];
  _objc_release_x1();
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  lumaChangedHandlerBlock = (void (**)(id, unint64_t))self->_lumaChangedHandlerBlock;
  if (lumaChangedHandlerBlock) {
    lumaChangedHandlerBlock[2](lumaChangedHandlerBlock, a4);
  }
}

- (void)_addMatchMoveAnimationFromSource:(id)a3 toView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v5 layer];
  [v7 removeAnimationForKey:@"PUIDSamplingMatchMoveAnimationKey"];

  uint64_t v8 = +[CAMatchMoveAnimation animation];
  objc_msgSend(v8, "setSourceContextId:", objc_msgSend(v6, "sourceContextID"));
  id v9 = [v6 sourceLayerRenderID];

  [v8 setSourceLayerRenderId:v9];
  [v8 setFillMode:kCAFillModeBoth];
  [v8 setRemovedOnCompletion:0];
  [v8 setDuration:INFINITY];
  [v8 setUsesNormalizedCoordinates:1];
  double v10 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -0.5, -0.5);
  v16[0] = v10;
  double v11 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.5, -0.5);
  v16[1] = v11;
  v12 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.5, 0.5);
  v16[2] = v12;
  v13 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -0.5, 0.5);
  v16[3] = v13;
  v14 = +[NSArray arrayWithObjects:v16 count:4];
  [v8 setSourcePoints:v14];

  v15 = [v5 layer];

  [v15 addAnimation:v8 forKey:@"PUIDSamplingMatchMoveAnimationKey"];
}

- (PSDisplay)display
{
  return self->_display;
}

- (PSPointerPortalSourceCollection)systemPointerPortalSourceCollection
{
  return self->_systemPointerPortalSourceCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPointerPortalSourceCollection, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_systemPointerPortalView, 0);
  objc_storeStrong((id *)&self->_pointerLumaMeasurementView, 0);
  objc_storeStrong(&self->_lumaChangedHandlerBlock, 0);
}

@end