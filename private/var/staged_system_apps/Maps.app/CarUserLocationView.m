@interface CarUserLocationView
+ (double)baseDiameter;
+ (double)innerDiameter;
- (BOOL)_isLocationStale:(id)a3;
- (BOOL)_isSelectable;
- (BOOL)overrideIsStale;
- (CarUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (void)setOverrideIsStale:(BOOL)a3;
@end

@implementation CarUserLocationView

+ (double)baseDiameter
{
  return 24.0;
}

+ (double)innerDiameter
{
  return 16.0;
}

- (CarUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CarUserLocationView;
  v4 = [(UserLocationView *)&v9 initWithAnnotation:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CarUserLocationView *)v4 setCanShowCallout:0];
    [(CarUserLocationView *)v5 setCanShowHeadingIndicator:0];
    v6 = +[UIColor _maps_keyColor];
    [(CarUserLocationView *)v5 setTintColor:v6];

    LODWORD(v7) = 1.0;
    [(CarUserLocationView *)v5 setZPriority:v7];
    [(CarUserLocationView *)v5 setAccessibilityIdentifier:@"CarUserLocationView"];
  }
  return v5;
}

- (BOOL)_isLocationStale:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarUserLocationView;
  BOOL v5 = [(CarUserLocationView *)&v9 _isLocationStale:v4];
  if (!v5 && ![(CarUserLocationView *)self overrideIsStale])
  {
    [v4 course];
    if (v6 != -1.0 && self->super._mode == 1) {
      [(CarUserLocationView *)self setOverrideIsStale:1];
    }
  }
  if (self->super._mode == 1)
  {
    [v4 course];
    if (v7 != -1.0 && [(CarUserLocationView *)self overrideIsStale]) {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_isSelectable
{
  return 0;
}

- (BOOL)overrideIsStale
{
  return self->_overrideIsStale;
}

- (void)setOverrideIsStale:(BOOL)a3
{
  self->_overrideIsStale = a3;
}

@end