@interface PUIDPointerShapeView
- (BOOL)_shouldShowAxCenterPointForPointerShape:(id)a3;
- (BOOL)_shouldShowAxColorStrokeForPointerShape:(id)a3 color:(id *)a4;
- (BOOL)isVisible;
- (CGPath)maskPath;
- (CGRect)_colorStrokeShapeBoundsForPointerShape:(id)a3;
- (CGRect)_shapeMorphingBackdropFrameForShape:(id)a3;
- (CGRect)expectedShapeBoundsForPointerShape:(id)a3;
- (PSPointerShape)pointerShape;
- (PUIDPointerShapeView)initWithFrame:(CGRect)a3;
- (PUIDPointerShapeViewDelegate)delegate;
- (UIColor)shapeMaterialReplacementColor;
- (double)_axColorStrokeWidthForPointerShape:(id)a3;
- (double)_axPointerZoomScaleFactor;
- (double)_cornerRadiusForPointerShape:(id)a3;
- (double)blurRadius;
- (double)feather;
- (double)intensity;
- (double)presentationFeather;
- (double)presentationIntensity;
- (id)_bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
- (id)_colorMatrixForTraitCollection:(id)a3;
- (id)_cornerCurveForPointerShape:(id)a3;
- (id)_currentPointerViewBezierPath;
- (id)_debug_Material_descForStyle:(unint64_t)a3 intensity:(double)a4;
- (id)_debug_Material_nameForMaterialStyle:(unint64_t)a3;
- (unint64_t)materialStyle;
- (void)_applyAXPointerStyleForPointerShape:(id)a3;
- (void)_axRegisterForZoomUpdatesIfNecessary;
- (void)_axUpdateDoubleInvertFilterOnView:(id)a3;
- (void)_axUpdateInvertColorsFilters;
- (void)_beginRequiringShapeMorphingViewForReason:(id)a3;
- (void)_endRequiringShapeMorphingViewForReason:(id)a3;
- (void)_handleAccessibilityPointerPreferencesDidChange;
- (void)_setShapeMorphingViewPath:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updatePointerMaterial;
- (void)_updatePointerViewCornerCurve;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)setBlurRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFeather:(double)a3;
- (void)setIntensity:(double)a3;
- (void)setMaskPath:(CGPath *)a3;
- (void)setMaterialStyle:(unint64_t)a3;
- (void)setPointerShape:(id)a3;
- (void)setPointerShape:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setShapeMaterialReplacementColor:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PUIDPointerShapeView

- (PUIDPointerShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v42.receiver = self;
  v42.super_class = (Class)PUIDPointerShapeView;
  v7 = -[PUIDPointerShapeView initWithFrame:](&v42, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    v7->_blurRadius = 0.0;
    v7->_feather = 0.0;
    uint64_t v9 = +[PUIDPointerDomain rootSettings];
    settings = v8->_settings;
    v8->_settings = (PUIDPointerSettings *)v9;

    [(PUIDPointerSettings *)v8->_settings addKeyPathObserver:v8];
    v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    pointerMaterialContainerView = v8->_pointerMaterialContainerView;
    v8->_pointerMaterialContainerView = v11;

    [(PUIDPointerShapeView *)v8 addSubview:v8->_pointerMaterialContainerView];
    v13 = -[PUIDPointerView initWithFrame:]([PUIDPointerView alloc], "initWithFrame:", x, y, width, height);
    pointerView = v8->_pointerView;
    v8->_pointerView = v13;

    v15 = [(PUIDPointerShapeBackdropView *)v8->_pointerView backdropLayer];
    [v15 setAllowsInPlaceFiltering:1];

    [(UIView *)v8->_pointerMaterialContainerView addSubview:v8->_pointerView];
    v16 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
    [v16 setValue:&off_100048120 forKey:kCAFilterInputRadius];
    [v16 setName:@"gaussianBlur"];
    v17 = [(PUIDPointerShapeView *)v8 layer];
    v46 = v16;
    v18 = +[NSArray arrayWithObjects:&v46 count:1];
    [v17 setFilters:v18];

    v36 = +[CAFilter filterWithType:kCAFilterColorMatrix];
    [v36 setName:@"colorMatrix"];
    v19 = [(PUIDPointerView *)v8->_pointerView layer];
    v45 = v36;
    v20 = +[NSArray arrayWithObjects:&v45 count:1];
    [v19 setFilters:v20];

    v21 = (UIViewFloatAnimatableProperty *)objc_alloc_init((Class)UIViewFloatAnimatableProperty);
    cornerCurveAnimatablePropertdouble y = v8->_cornerCurveAnimatableProperty;
    v8->_cornerCurveAnimatablePropertdouble y = v21;

    [(UIViewFloatAnimatableProperty *)v8->_cornerCurveAnimatableProperty setValue:0.0];
    v23 = (UIViewFloatAnimatableProperty *)objc_alloc_init((Class)UIViewFloatAnimatableProperty);
    intensityAnimatablePropertdouble y = v8->_intensityAnimatableProperty;
    v8->_intensityAnimatablePropertdouble y = v23;

    [(UIViewFloatAnimatableProperty *)v8->_intensityAnimatableProperty setValue:0.0];
    v25 = (UIViewFloatAnimatableProperty *)objc_alloc_init((Class)UIViewFloatAnimatableProperty);
    featherAnimatablePropertdouble y = v8->_featherAnimatableProperty;
    v8->_featherAnimatablePropertdouble y = v25;

    [(UIViewFloatAnimatableProperty *)v8->_featherAnimatableProperty setValue:0.0];
    objc_initWeak(&location, v8);
    v44 = v8->_cornerCurveAnimatableProperty;
    v27 = +[NSArray arrayWithObjects:&v44 count:1];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000048B0;
    v39[3] = &unk_1000449D0;
    objc_copyWeak(&v40, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v27 presentationValueChangedCallback:v39];

    v8->_isVisible = 0;
    v43[0] = v8->_intensityAnimatableProperty;
    v43[1] = v8->_featherAnimatableProperty;
    v28 = +[NSArray arrayWithObjects:v43 count:2];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000048F0;
    v37[3] = &unk_1000449D0;
    objc_copyWeak(&v38, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v28 presentationValueChangedCallback:v37];

    [(PUIDPointerShapeView *)v8 _updatePointerMaterial];
    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v8 selector:"_accessibilityInvertColorsStatusDidChange:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)sub_1000049B4, kAXSPointerIncreasedContrastPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v31 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v31, v8, (CFNotificationCallback)sub_1000049B4, kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v32 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v32, v8, (CFNotificationCallback)sub_1000049B4, kAXSPointerStrokeColorPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v33 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v33, v8, (CFNotificationCallback)sub_1000049B4, kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v34 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v34, v8, (CFNotificationCallback)sub_1000049B4, kAXSZoomTouchEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(PUIDPointerShapeView *)v8 _axRegisterForZoomUpdatesIfNecessary];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)PUIDPointerShapeView;
  [(PUIDPointerShapeView *)&v2 didMoveToSuperview];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  if (self->_zoomRegistrationIdentifier)
  {
    v4 = [sub_100007668() sharedInstance];
    [v4 removeZoomAttributesChangedHandler:self->_zoomRegistrationIdentifier];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSPointerIncreasedContrastPreferenceDidChangeNotification, 0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, kAXSPointerStrokeColorPreferenceDidChangeNotification, 0);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification, 0);
  uint64_t v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v9, self, kAXSZoomTouchEnabledNotification, 0);
  CGPathRelease(self->_maskPath);
  v10.receiver = self;
  v10.super_class = (Class)PUIDPointerShapeView;
  [(PUIDPointerShapeView *)&v10 dealloc];
}

- (CGRect)expectedShapeBoundsForPointerShape:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [v4 shapeType];

  if (v13 == (id)1)
  {
    [(PUIDPointerSettings *)self->_settings systemPointerSize];
    double v15 = v14;
    _AXSPointerSizeMultiplier();
    double v17 = v15 * v16;
    [(PUIDPointerShapeView *)self _axPointerZoomScaleFactor];
    double v10 = v18 * v17;
    double v6 = v10 * -0.5;
    double v8 = v10 * -0.5;
    double v12 = v10;
  }
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (double)presentationIntensity
{
  v3 = [(PUIDPointerShapeView *)self layer];
  id v4 = [v3 presentationLayer];
  double v5 = v4;
  if (v4)
  {
    [v4 opacity];
    float v7 = v6;
  }
  else
  {
    double v8 = [(PUIDPointerShapeView *)self layer];
    [v8 opacity];
    float v7 = v9;
  }
  return v7;
}

- (id)_debug_Material_nameForMaterialStyle:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Undefined";
  }
  else {
    return (id)*((void *)&off_100044B60 + a3);
  }
}

- (id)_debug_Material_descForStyle:(unint64_t)a3 intensity:(double)a4
{
  double v5 = [(PUIDPointerShapeView *)self _debug_Material_nameForMaterialStyle:a3];
  float v6 = +[NSString stringWithFormat:@"(%@ @ %f)", v5, *(void *)&a4];

  return v6;
}

- (void)setIntensity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    double v5 = [(PUIDPointerShapeView *)self _debug_Material_descForStyle:self->_materialStyle intensity:a3];
    float v6 = PSLogMaterial();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100027EB4((uint64_t)v5, v6);
    }

    self->_intensitdouble y = a3;
    [(UIViewFloatAnimatableProperty *)self->_intensityAnimatableProperty setValue:a3];
    [(PUIDPointerShapeView *)self _updatePointerMaterial];
  }
}

- (double)presentationFeather
{
  [(UIViewFloatAnimatableProperty *)self->_featherAnimatableProperty presentationValue];
  return result;
}

- (void)setFeather:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_feather = a3;
    featherAnimatablePropertdouble y = self->_featherAnimatableProperty;
    [(UIViewFloatAnimatableProperty *)featherAnimatableProperty setValue:a3];
  }
}

- (void)setBlurRadius:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_blurRadius = a3;
    id v5 = +[NSNumber numberWithDouble:a3];
    [(PUIDPointerShapeView *)self setValue:v5 forKeyPath:@"layer.filters.gaussianBlur.inputRadius"];
  }
}

- (void)setMaterialStyle:(unint64_t)a3
{
  if (self->_materialStyle != a3)
  {
    id v5 = -[PUIDPointerShapeView _debug_Material_descForStyle:intensity:](self, "_debug_Material_descForStyle:intensity:", self->_intensity);
    float v6 = PSLogMaterial();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100027F2C((uint64_t)v5, v6);
    }

    self->_materialStyle = a3;
    [(PUIDPointerShapeView *)self _updatePointerMaterial];
  }
}

- (void)setPointerShape:(id)a3
{
}

- (void)setPointerShape:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  float v9 = (PSPointerShape *)a3;
  double v10 = (void (**)(id, uint64_t, void))a5;
  if (!self->_axVisualSettingsDidChange
    && ((pointerShape = self->_pointerShape, pointerShape == v9)
     || ([(PSPointerShape *)pointerShape isEqual:v9] & 1) != 0))
  {
    if (v10) {
      v10[2](v10, 1, 0);
    }
  }
  else
  {
    double v11 = [(PUIDPointerShapeView *)self _cornerCurveForPointerShape:self->_pointerShape];
    previousPointerShapeCornerCurve = self->_previousPointerShapeCornerCurve;
    self->_previousPointerShapeCornerCurve = v11;

    objc_storeStrong((id *)&self->_pointerShape, a3);
    self->_axVisualSettingsDidChange = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000051B4;
    v16[3] = &unk_100044A48;
    double v17 = v9;
    double v18 = self;
    BOOL v19 = a4;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000558C;
    v14[3] = &unk_100044A70;
    double v15 = v10;
    +[SBC2GroupCompletion perform:v16 finalCompletion:v14];
  }
}

- (void)setShapeMaterialReplacementColor:(id)a3
{
  id v4 = (UIColor *)a3;
  shapeMaterialReplacementColor = self->_shapeMaterialReplacementColor;
  if (shapeMaterialReplacementColor != v4)
  {
    double v8 = v4;
    if (([(UIColor *)shapeMaterialReplacementColor isEqual:v4] & 1) == 0)
    {
      float v6 = (UIColor *)[(UIColor *)v8 copy];
      float v7 = self->_shapeMaterialReplacementColor;
      self->_shapeMaterialReplacementColor = v6;

      [(PUIDPointerShapeView *)self _updatePointerMaterial];
    }
  }
  _objc_release_x1();
}

- (void)setMaskPath:(CGPath *)a3
{
  if (!CGPathEqualToPath(a3, self->_maskPath))
  {
    CGPathRelease(self->_maskPath);
    self->_maskPath = a3;
    CGPathRetain(a3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUIDPointerShapeView;
  id v4 = a3;
  [(PUIDPointerShapeView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(PUIDPointerShapeView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PUIDPointerShapeView *)self _updatePointerMaterial];
  }
}

- (void)_beginRequiringShapeMorphingViewForReason:(id)a3
{
  id v5 = a3;
  id v43 = v5;
  if (!v5)
  {
    objc_super v42 = +[NSAssertionHandler currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PUIDPointerShapeView.m", 462, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  shapeMorphingViewRequiringReasons = self->_shapeMorphingViewRequiringReasons;
  if (!shapeMorphingViewRequiringReasons)
  {
    id v7 = +[NSMutableSet set];
    objc_super v8 = self->_shapeMorphingViewRequiringReasons;
    self->_shapeMorphingViewRequiringReasons = v7;

    id v5 = v43;
    shapeMorphingViewRequiringReasons = self->_shapeMorphingViewRequiringReasons;
  }
  [(NSMutableSet *)shapeMorphingViewRequiringReasons addObject:v5];
  if (self->_shapeMorphingView)
  {
    [(PUIDPointerShapeView *)self _shapeMorphingBackdropFrameForShape:self->_pointerShape];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(PUIDPointerShapeFilterBackgroundView *)self->_shapeBackgroundView currentShapeFrame];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [(PUIDPointerView *)self->_pointerView frame];
    v48.origin.double x = v25;
    v48.origin.double y = v26;
    v48.size.double width = v27;
    v48.size.double height = v28;
    v45.origin.double x = v10;
    v45.origin.double y = v12;
    v45.size.double width = v14;
    v45.size.double height = v16;
    CGRect v46 = CGRectUnion(v45, v48);
    v49.origin.double x = v18;
    v49.origin.double y = v20;
    v49.size.double width = v22;
    v49.size.double height = v24;
    CGRect v47 = CGRectUnion(v46, v49);
    -[PUIDPointerShapeFilterBackgroundView updateShapeFrame:](self->_shapeBackgroundView, "updateShapeFrame:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
  }
  else
  {
    v29 = objc_alloc_init(PUIDPointerShapeMorphingView);
    shapeMorphingView = self->_shapeMorphingView;
    self->_shapeMorphingView = v29;

    v31 = [(PUIDPointerShapeMorphingView *)self->_shapeMorphingView layer];
    [v31 setName:@"pointer custom shape layer"];

    v32 = self->_shapeMorphingView;
    v33 = [(PUIDPointerShapeView *)self _currentPointerViewBezierPath];
    [(PUIDPointerShapeMorphingView *)v32 setPath:v33 animated:0 completion:0];

    [(PUIDPointerShapeView *)self _shapeMorphingBackdropFrameForShape:self->_pointerShape];
    id v38 = -[PUIDPointerShapeFilterBackgroundView initWithShapeFrame:]([PUIDPointerShapeFilterBackgroundView alloc], "initWithShapeFrame:", v34, v35, v36, v37);
    shapeBackgroundView = self->_shapeBackgroundView;
    self->_shapeBackgroundView = v38;

    id v40 = [(PUIDPointerShapeFilterBackgroundView *)self->_shapeBackgroundView layer];
    v41 = [(PUIDPointerShapeMorphingView *)self->_shapeMorphingView layer];
    [v40 setMask:v41];

    [(UIView *)self->_pointerMaterialContainerView addSubview:self->_shapeBackgroundView];
    [(PUIDPointerShapeView *)self _updatePointerMaterial];
    [(PUIDPointerView *)self->_pointerView setHidden:1];
    [(UIView *)self->_axCenterDot setHidden:1];
    [(UIView *)self->_axColorStroke setHidden:1];
  }
}

- (void)_endRequiringShapeMorphingViewForReason:(id)a3
{
  id v5 = a3;
  id v20 = v5;
  if (!v5)
  {
    double v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUIDPointerShapeView.m", 502, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_shapeMorphingViewRequiringReasons removeObject:v5];
  if (![(NSMutableSet *)self->_shapeMorphingViewRequiringReasons count] && self->_shapeMorphingView)
  {
    [(PUIDPointerShapeView *)self expectedShapeBoundsForPointerShape:self->_pointerShape];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(PUIDPointerShapeView *)self _cornerRadiusForPointerShape:self->_pointerShape];
    double v15 = v14;
    -[PUIDPointerView setFrame:](self->_pointerView, "setFrame:", v7, v9, v11, v13);
    CGFloat v16 = [(PUIDPointerView *)self->_pointerView layer];
    [v16 setCornerRadius:v15];

    [(PUIDPointerView *)self->_pointerView setHidden:0];
    [(UIView *)self->_axCenterDot setHidden:0];
    [(UIView *)self->_axColorStroke setHidden:0];
    [(PUIDPointerShapeMorphingView *)self->_shapeMorphingView removeFromSuperview];
    shapeMorphingView = self->_shapeMorphingView;
    self->_shapeMorphingView = 0;

    [(PUIDPointerShapeFilterBackgroundView *)self->_shapeBackgroundView removeFromSuperview];
    shapeBackgroundView = self->_shapeBackgroundView;
    self->_shapeBackgroundView = 0;
  }
}

- (void)_setShapeMorphingViewPath:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = +[NSUUID UUID];
  double v11 = [v10 UUIDString];
  double v12 = [@"Animations" stringByAppendingFormat:@"-%@", v11];

  [(PUIDPointerShapeView *)self _beginRequiringShapeMorphingViewForReason:v12];
  [(PUIDPointerShapeView *)self _applyAXPointerStyleForPointerShape:self->_pointerShape];
  objc_initWeak(&location, self);
  shapeMorphingView = self->_shapeMorphingView;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005D98;
  v16[3] = &unk_100044A98;
  objc_copyWeak(&v19, &location);
  id v14 = v12;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  [(PUIDPointerShapeMorphingView *)shapeMorphingView setPath:v8 animated:v6 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  if (self->_settings == a3) {
    [(PUIDPointerShapeView *)self _updatePointerMaterial];
  }
}

- (id)_colorMatrixForTraitCollection:(id)a3
{
  id v4 = a3;
  shapeMaterialReplacementColor = self->_shapeMaterialReplacementColor;
  if (shapeMaterialReplacementColor)
  {
    double v29 = 0.0;
    double v30 = 0.0;
    double v27 = 0.0;
    double v28 = 0.0;
    [(UIColor *)shapeMaterialReplacementColor getRed:&v30 green:&v29 blue:&v28 alpha:&v27];
    float v6 = v30;
    float v7 = v29;
    float v8 = v28;
    float v9 = v27;
    float v13 = v6;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    int v16 = 0;
    float v17 = v7;
    uint64_t v19 = 0;
    uint64_t v18 = 0;
    int v20 = 0;
    float v21 = v8;
    uint64_t v23 = 0;
    uint64_t v22 = 0;
    int v24 = 0;
    float v25 = v9;
    int v26 = 0;
    uint64_t v10 = +[NSValue valueWithCAColorMatrix:&v13];
  }
  else
  {
    if (!self->_materialStyle) {
      [v4 userInterfaceStyle];
    }
    uint64_t v10 = PSPointerVibrantColorMatrixForLuminance();
  }
  double v11 = (void *)v10;

  return v11;
}

- (void)_updatePointerMaterial
{
  v3 = [(PUIDPointerShapeView *)self traitCollection];
  id v6 = [(PUIDPointerShapeView *)self _colorMatrixForTraitCollection:v3];

  [(PUIDPointerView *)self->_pointerView setValue:v6 forKeyPath:@"layer.filters.colorMatrix.inputColorMatrix"];
  [(PUIDPointerShapeFilterBackgroundView *)self->_shapeBackgroundView updateFilter:v6];
  [(UIView *)self->_pointerMaterialContainerView setAlpha:self->_intensity];
  double v4 = 0.5;
  if (self->_intensity > 0.0)
  {
    double v5 = 1.0;
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }
  [(UIView *)self->_axCenterDot setAlpha:v4];
  [(UIView *)self->_axColorStroke setAlpha:v5];
  [(PUIDPointerShapeView *)self _axUpdateInvertColorsFilters];
}

- (void)_handleAccessibilityPointerPreferencesDidChange
{
  self->_axVisualSettingsDidChange = 1;
  [(UIView *)self->_pointerMaterialContainerView alpha];
  if (v3 > 0.00000011920929)
  {
    [(PUIDPointerShapeView *)self _updatePointerMaterial];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained pointerShapeViewExpectedSizeParametersDidChange:self];
    }
  }
}

- (CGRect)_shapeMorphingBackdropFrameForShape:(id)a3
{
  [(PUIDPointerShapeView *)self expectedShapeBoundsForPointerShape:a3];
  return CGRectInset(*(CGRect *)&v3, -1.0, -1.0);
}

- (id)_bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (id)_currentPointerViewBezierPath
{
  [(PUIDPointerView *)self->_pointerView frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PUIDPointerView *)self->_pointerView layer];
  [v11 cornerRadius];
  double v13 = v12;

  if (self->_pointerViewAnimationCount)
  {
    uint64_t v14 = [(PUIDPointerView *)self->_pointerView layer];
    uint64_t v15 = [v14 presentationLayer];

    [v15 frame];
    double v4 = v16;
    double v6 = v17;
    double v8 = v18;
    double v10 = v19;
    [v15 cornerRadius];
    double v13 = v20;
  }
  return -[PUIDPointerShapeView _bezierPathWithRoundedRect:cornerRadius:](self, "_bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v13);
}

- (double)_cornerRadiusForPointerShape:(id)a3
{
  id v4 = a3;
  [v4 cornerRadius];
  double v6 = v5;
  id v7 = [v4 shapeType];
  if (v7 == (id)2)
  {
    [v4 bounds];
    if (v9 >= v10) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    double v6 = v11 * 0.5;
  }
  else if (v7 == (id)1)
  {
    [(PUIDPointerShapeView *)self expectedShapeBoundsForPointerShape:v4];
    double v6 = v8 * 0.5;
  }

  return v6;
}

- (id)_cornerCurveForPointerShape:(id)a3
{
  id v3 = a3;
  id v4 = kCACornerCurveCircular;
  if ([v3 shapeType] == (id)3)
  {
    uint64_t v5 = [v3 cornerCurve];

    id v4 = (NSString *)v5;
  }

  return v4;
}

- (void)_updatePointerViewCornerCurve
{
  if (qword_100055FE8 != -1) {
    dispatch_once(&qword_100055FE8, &stru_100044AD8);
  }
  id v14 = [(PUIDPointerView *)self->_pointerView layer];
  id v3 = [(PUIDPointerShapeView *)self _cornerCurveForPointerShape:self->_pointerShape];
  if ([v3 isEqualToString:kCACornerCurveCircular]
    && [(NSString *)self->_previousPointerShapeCornerCurve isEqualToString:kCACornerCurveCircular])
  {
    id v4 = kCACornerCurveCircular;
  }
  else
  {
    uint64_t v5 = [v14 presentationLayer];
    [v5 cornerRadius];
    double v7 = v6;
    [v5 bounds];
    if (v8 >= v9) {
      double v10 = v9;
    }
    else {
      double v10 = v8;
    }
    CALayerCornerCurve v11 = kCACornerCurveContinuous;
    if (v7 * *(double *)&qword_1000558C0 >= v10 * 0.5) {
      CALayerCornerCurve v11 = kCACornerCurveCircular;
    }
    id v4 = v11;
  }
  double v12 = [v14 cornerCurve];
  unsigned __int8 v13 = [v12 isEqualToString:v4];

  if ((v13 & 1) == 0) {
    [v14 setCornerCurve:v4];
  }
}

- (double)_axPointerZoomScaleFactor
{
  if (!_AXSZoomTouchEnabled()) {
    return 1.0;
  }
  if (_AXSPointerScaleWithZoomLevelEnabled()) {
    return 1.0;
  }
  id v3 = [sub_100007668() sharedInstance];
  id v4 = [(PUIDPointerShapeView *)self window];
  uint64_t v5 = [v4 screen];
  double v6 = [v5 displayIdentity];
  unsigned __int8 v7 = objc_msgSend(v3, "inStandbyModeOnDisplay:", objc_msgSend(v6, "displayID"));

  if (v7) {
    return 1.0;
  }
  double v8 = [sub_100007668() sharedInstance];
  [v8 zoomLevel];
  double v10 = v9;

  if (self->_inDockedZoomMode || v10 <= 0.00000011920929) {
    return 1.0;
  }
  else {
    return 1.0 / v10;
  }
}

- (void)_applyAXPointerStyleForPointerShape:(id)a3
{
  id v4 = a3;
  id v48 = 0;
  unsigned int v5 = [(PUIDPointerShapeView *)self _shouldShowAxColorStrokeForPointerShape:v4 color:&v48];
  id v6 = v48;
  if (v5)
  {
    [(PUIDPointerShapeView *)self _colorStrokeShapeBoundsForPointerShape:v4];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(PUIDPointerShapeView *)self _axColorStrokeWidthForPointerShape:v4];
    double v16 = v15;
    [(PUIDPointerShapeView *)self _cornerRadiusForPointerShape:v4];
    double v18 = v16 + v17;
    axColorStroke = self->_axColorStroke;
    if (!axColorStroke)
    {
      double v20 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
      float v21 = self->_axColorStroke;
      self->_axColorStroke = v20;

      uint64_t v22 = self->_axColorStroke;
      uint64_t v23 = +[UIColor clearColor];
      [(UIView *)v22 setBackgroundColor:v23];

      [(PUIDPointerShapeView *)self addSubview:self->_axColorStroke];
      axColorStroke = self->_axColorStroke;
    }
    -[UIView setFrame:](axColorStroke, "setFrame:", v8, v10, v12, v14);
    int v24 = [(UIView *)self->_axColorStroke layer];
    [v24 setCornerRadius:v18];

    float v25 = [(UIView *)self->_axColorStroke layer];
    objc_msgSend(v25, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    int v26 = [(UIView *)self->_axColorStroke layer];
    [v26 setBorderWidth:v16];
  }
  else
  {
    double v27 = self->_axColorStroke;
    if (!v27) {
      goto LABEL_8;
    }
    [(UIView *)v27 removeFromSuperview];
    int v26 = self->_axColorStroke;
    self->_axColorStroke = 0;
  }

LABEL_8:
  if ([(PUIDPointerShapeView *)self _shouldShowAxCenterPointForPointerShape:v4])
  {
    [(PUIDPointerSettings *)self->_settings axLargeSystemPointerCenterDotSize];
    double v29 = v28;
    [(PUIDPointerShapeView *)self _axPointerZoomScaleFactor];
    double v31 = v29 * v30;
    double v32 = v29 * v30 * 0.5;
    v33 = -[PUIDPointerShapeView _bezierPathWithRoundedRect:cornerRadius:](self, "_bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v31, v31, v32);
    if (!self->_axCenterDot)
    {
      double v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v31, v31);
      double v35 = +[UIColor clearColor];
      [(UIView *)v34 setBackgroundColor:v35];

      double v36 = +[CAShapeLayer layer];
      [(CAShapeLayer *)v36 setLineCap:kCALineCapRound];
      double v37 = [(UIView *)v34 layer];
      [v37 addSublayer:v36];

      [(PUIDPointerShapeView *)self addSubview:v34];
      axCenterDot = self->_axCenterDot;
      self->_axCenterDot = v34;
      v39 = v34;

      axCenterDotShapeLayer = self->_axCenterDotShapeLayer;
      self->_axCenterDotShapeLayer = v36;
    }
    [(PUIDPointerShapeView *)self expectedShapeBoundsForPointerShape:v4];
    -[UIView setFrame:](self->_axCenterDot, "setFrame:", 0.0, 0.0, v31, v31);
    v41 = self->_axCenterDot;
    UIRectGetCenter();
    -[UIView setCenter:](v41, "setCenter:");
    objc_super v42 = [(UIView *)self->_axCenterDot layer];
    [v42 setCornerRadius:v32];

    id v43 = self->_axCenterDotShapeLayer;
    v44 = v6;
    if (!v6)
    {
      v44 = +[UIColor whiteColor];
    }
    -[CAShapeLayer setFillColor:](v43, "setFillColor:", [v44 CGColor]);
    if (!v6) {

    }
    CGRect v45 = self->_axCenterDotShapeLayer;
    CGRect v46 = v33;
    [(CAShapeLayer *)v45 setPath:[(UIView *)v46 CGPath]];
    goto LABEL_18;
  }
  if (self->_axCenterDot)
  {
    [(CAShapeLayer *)self->_axCenterDotShapeLayer removeFromSuperlayer];
    CGRect v47 = self->_axCenterDotShapeLayer;
    self->_axCenterDotShapeLayer = 0;

    [(UIView *)self->_axCenterDot removeFromSuperview];
    CGRect v46 = self->_axCenterDot;
    self->_axCenterDot = 0;
LABEL_18:
  }
  [(PUIDPointerShapeView *)self _axUpdateInvertColorsFilters];
}

- (double)_axColorStrokeWidthForPointerShape:(id)a3
{
  id v4 = a3;
  _AXSPointerStrokeColorWidth();
  double v6 = v5;
  id v7 = [v4 shapeType];

  if (v7 == (id)1)
  {
    [(PUIDPointerShapeView *)self _axPointerZoomScaleFactor];
    return v8 * v6;
  }
  return v6;
}

- (BOOL)_shouldShowAxColorStrokeForPointerShape:(id)a3 color:(id *)a4
{
  if ((char *)[a3 shapeType] - 1 > (char *)2) {
    return 0;
  }
  _AXSPointerStrokeColor();
  int v5 = _AXSPointerStrokeColorValues();
  BOOL v6 = v5 != 0;
  if (a4 && v5)
  {
    *a4 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  }
  return v6;
}

- (BOOL)_shouldShowAxCenterPointForPointerShape:(id)a3
{
  id v3 = a3;
  if (_AXSPointerShouldShowCenterPoint()) {
    BOOL v4 = (char *)[v3 shapeType] - 1 < (char *)2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (CGRect)_colorStrokeShapeBoundsForPointerShape:(id)a3
{
  id v4 = a3;
  [(PUIDPointerShapeView *)self expectedShapeBoundsForPointerShape:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PUIDPointerShapeView *)self _axColorStrokeWidthForPointerShape:v4];
  double v14 = v13;

  double v15 = v6 - v14;
  double v16 = v8 - v14;
  double v17 = v10 + v14 * 2.0;
  double v18 = v12 + v14 * 2.0;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)_axUpdateDoubleInvertFilterOnView:(id)a3
{
  if (!a3) {
    return;
  }
  id v11 = [a3 layer];
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    id v3 = [v11 valueForKeyPath:@"filters.InvertColorsDoubleInvert"];

    id v4 = v11;
    if (!v3)
    {
      double v5 = [v11 filters];
      id v6 = [v5 mutableCopy];

      if (!v6)
      {
        id v6 = +[NSMutableArray array];
      }
      double v7 = +[CAFilter filterWithType:kCAFilterColorInvert];
      [v7 setName:@"InvertColorsDoubleInvert"];
      [v7 setAccessibility:1];
      [v6 addObject:v7];
      [v11 setFilters:v6];

      goto LABEL_10;
    }
  }
  else
  {
    double v8 = [v11 filters];
    id v9 = [v8 indexOfObjectPassingTest:&stru_100044B18];

    id v4 = v11;
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      double v10 = [v11 filters];
      id v6 = [v10 mutableCopy];

      [v6 removeObjectAtIndex:v9];
      [v11 setFilters:v6];
LABEL_10:

      id v4 = v11;
    }
  }
}

- (void)_axUpdateInvertColorsFilters
{
  [(PUIDPointerShapeView *)self _axUpdateDoubleInvertFilterOnView:self->_axCenterDot];
  axColorStroke = self->_axColorStroke;
  [(PUIDPointerShapeView *)self _axUpdateDoubleInvertFilterOnView:axColorStroke];
}

- (void)_axRegisterForZoomUpdatesIfNecessary
{
  if (!self->_zoomRegistrationIdentifier)
  {
    if (_AXSZoomTouchEnabled())
    {
      id v3 = [sub_100007668() sharedInstance];
      [v3 registerInterestInZoomAttributes];

      objc_initWeak(&location, self);
      id v4 = [sub_100007668() sharedInstance];
      double v5 = sub_1000078E4();
      v24[0] = v5;
      id v6 = sub_100007A58();
      v24[1] = v6;
      double v7 = +[NSArray arrayWithObjects:v24 count:2];
      double v8 = [(PUIDPointerShapeView *)self window];
      id v9 = [v8 screen];
      double v10 = [v9 displayIdentity];
      id v11 = [v10 displayID];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000070F0;
      v21[3] = &unk_100044B40;
      objc_copyWeak(&v22, &location);
      double v12 = [v4 registerForZoomAttributes:v7 onDisplay:v11 updatesImmediatelyWithChangedHandler:v21];
      zoomRegistrationIdentifier = self->_zoomRegistrationIdentifier;
      self->_zoomRegistrationIdentifier = v12;

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100007178;
      v19[3] = &unk_1000449D0;
      objc_copyWeak(&v20, &location);
      double v14 = objc_retainBlock(v19);
      double v15 = [sub_100007C98() sharedInstance];
      [v15 registerUpdateBlock:v14 forRetrieveSelector:"zoomPreferredCurrentLensMode" withListener:self];

      double v16 = [sub_100007C98() sharedInstance];
      double v17 = [v16 zoomPreferredCurrentLensMode];
      double v18 = sub_100007F14();
      self->_inDockedZoomMode = [v17 isEqualToString:v18];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
}

- (PUIDPointerShapeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIDPointerShapeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)materialStyle
{
  return self->_materialStyle;
}

- (UIColor)shapeMaterialReplacementColor
{
  return self->_shapeMaterialReplacementColor;
}

- (double)intensity
{
  return self->_intensity;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (double)feather
{
  return self->_feather;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (PSPointerShape)pointerShape
{
  return self->_pointerShape;
}

- (CGPath)maskPath
{
  return self->_maskPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerShape, 0);
  objc_storeStrong((id *)&self->_shapeMaterialReplacementColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_featherAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_intensityAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cornerCurveAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_previousPointerShapeCornerCurve, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_shapeMorphingViewRequiringReasons, 0);
  objc_storeStrong((id *)&self->_zoomRegistrationIdentifier, 0);
  objc_storeStrong((id *)&self->_axColorStroke, 0);
  objc_storeStrong((id *)&self->_axCenterDotShapeLayer, 0);
  objc_storeStrong((id *)&self->_axCenterDot, 0);
  objc_storeStrong((id *)&self->_shapeMorphingView, 0);
  objc_storeStrong((id *)&self->_shapeBackgroundView, 0);
  objc_storeStrong((id *)&self->_pointerView, 0);
  objc_storeStrong((id *)&self->_pointerMaterialContainerView, 0);
}

@end