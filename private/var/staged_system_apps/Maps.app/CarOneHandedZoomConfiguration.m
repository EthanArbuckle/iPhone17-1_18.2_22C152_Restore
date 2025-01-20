@interface CarOneHandedZoomConfiguration
- (CarOneHandedZoomConfiguration)initWithGestureRecongizer:(id)a3;
- (double)decelerationThreshold;
- (double)maximumZoomInVelocity;
- (double)maximumZoomOutVelocity;
- (double)valueWithKey:(id)a3 defaultValue:(double)a4;
- (double)zoomDraggingResistance;
- (double)zoomOutFrictionScale;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_refreshSetting;
- (void)dealloc;
@end

@implementation CarOneHandedZoomConfiguration

- (CarOneHandedZoomConfiguration)initWithGestureRecongizer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarOneHandedZoomConfiguration;
  v5 = [(CarOneHandedZoomConfiguration *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_gestureRecognizer, v4);
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_refreshSetting" name:@"CarPlayOneHandedZoomingSettingDidChangeNotification" object:0];

    [(CarOneHandedZoomConfiguration *)v6 _refreshSetting];
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarOneHandedZoomConfiguration;
  [(CarOneHandedZoomConfiguration *)&v4 dealloc];
}

- (void)_refreshSetting
{
  [(CarOneHandedZoomConfiguration *)self valueWithKey:@"__internal__CarPlayOneHandedZoomInMaximumVelocity" defaultValue:10.0];
  self->_maximumZoomInVelocity = v3;
  [(CarOneHandedZoomConfiguration *)self valueWithKey:@"__internal__CarPlayOneHandedZoomOutMaximumVelocity" defaultValue:1.5];
  self->_maximumZoomOutVelocity = -v4;
  [(CarOneHandedZoomConfiguration *)self valueWithKey:@"__internal__CarPlayOneHandedZoomOutFrictionScale" defaultValue:2.5];
  self->_zoomOutFrictionScale = v5;
  [(CarOneHandedZoomConfiguration *)self valueWithKey:@"__internal__CarPlayOneHandedZoomDraggingResistance" defaultValue:1.0];
  self->_double zoomDraggingResistance = v6 * 200.0;
  [(CarOneHandedZoomConfiguration *)self valueWithKey:@"__internal__CarPlayOneHandedZoomMinimumVelocity" defaultValue:1.5];
  self->_decelerationThreshold = v7;
  double zoomDraggingResistance = self->_zoomDraggingResistance;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizer);
  objc_super v9 = [WeakRetained panGestureRecognizer];
  [v9 setZoomDraggingResistance:zoomDraggingResistance];
}

- (double)valueWithKey:(id)a3 defaultValue:(double)a4
{
  id v5 = a3;
  double v6 = +[NSUserDefaults standardUserDefaults];
  double v7 = [v6 objectForKey:v5];

  if (v7)
  {
    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 floatForKey:v5];
    a4 = v9;
  }
  return a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizer);
  id v6 = [v4 initWithGestureRecongizer:WeakRetained];

  return v6;
}

- (double)decelerationThreshold
{
  return self->_decelerationThreshold;
}

- (double)maximumZoomInVelocity
{
  return self->_maximumZoomInVelocity;
}

- (double)maximumZoomOutVelocity
{
  return self->_maximumZoomOutVelocity;
}

- (double)zoomOutFrictionScale
{
  return self->_zoomOutFrictionScale;
}

- (double)zoomDraggingResistance
{
  return self->_zoomDraggingResistance;
}

- (void).cxx_destruct
{
}

@end