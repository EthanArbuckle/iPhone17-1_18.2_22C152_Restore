@interface RichMapsActivity
- (BOOL)coldLaunch;
- (BOOL)didLaunchWithExplicitIntent;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isTestingAction;
- (BOOL)needsUIReset;
- (BOOL)shouldResetUI;
- (MapsAction)action;
- (MapsActivity)mapsActivity;
- (RichMapsActivity)initWithMapsAction:(id)a3;
- (RichMapsActivity)initWithMapsActivity:(id)a3;
- (RichMapsActivity)initWithMapsActivity:(id)a3 mapsAction:(id)a4;
- (id)description;
- (id)shortDescription;
- (void)setAction:(id)a3;
- (void)setColdLaunch:(BOOL)a3;
- (void)setMapsActivity:(id)a3;
@end

@implementation RichMapsActivity

- (RichMapsActivity)initWithMapsActivity:(id)a3 mapsAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RichMapsActivity;
  v9 = [(RichMapsActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapsActivity, a3);
    objc_storeStrong((id *)&v10->_action, a4);
  }

  return v10;
}

- (RichMapsActivity)initWithMapsActivity:(id)a3
{
  return [(RichMapsActivity *)self initWithMapsActivity:a3 mapsAction:0];
}

- (RichMapsActivity)initWithMapsAction:(id)a3
{
  return [(RichMapsActivity *)self initWithMapsActivity:0 mapsAction:a3];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p action:%@ activity:%@", v4, self, self->_action, self->_mapsActivity];

  return v5;
}

- (id)shortDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p action:%@", v4, self, self->_action];

  return v5;
}

- (BOOL)didLaunchWithExplicitIntent
{
  uint64_t v2 = objc_opt_class();
  return v2 != objc_opt_class();
}

- (BOOL)isCompatibleWithNavigation
{
  return [(MapsAction *)self->_action isCompatibleWithNavigation];
}

- (BOOL)isTestingAction
{
  return [(MapsAction *)self->_action isTestingAction];
}

- (BOOL)shouldResetUI
{
  return [(MapsAction *)self->_action shouldResetUI];
}

- (BOOL)needsUIReset
{
  if (self->_coldLaunch)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    BOOL v2 = [(RichMapsActivity *)self shouldResetUI];
    if (v2) {
      LOBYTE(v2) = ![(RichMapsActivity *)self isCompatibleWithNavigation];
    }
  }
  return v2;
}

- (MapsActivity)mapsActivity
{
  return self->_mapsActivity;
}

- (void)setMapsActivity:(id)a3
{
}

- (MapsAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)coldLaunch
{
  return self->_coldLaunch;
}

- (void)setColdLaunch:(BOOL)a3
{
  self->_coldLaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_mapsActivity, 0);
}

@end