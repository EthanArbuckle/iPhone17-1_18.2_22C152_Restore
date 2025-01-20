@interface RideBookingAction
- (NSString)title;
- (NSUserActivity)activity;
- (RideBookingAction)initWithActivity:(id)a3 application:(id)a4;
- (RideBookingApplication)application;
- (void)perform;
- (void)setActivity:(id)a3;
- (void)setApplication:(id)a3;
@end

@implementation RideBookingAction

- (RideBookingAction)initWithActivity:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RideBookingAction;
  v8 = [(RideBookingAction *)&v12 init];
  if (v8)
  {
    v9 = (NSUserActivity *)[v6 copy];
    activity = v8->_activity;
    v8->_activity = v9;

    objc_storeWeak((id *)&v8->_application, v7);
  }

  return v8;
}

- (NSString)title
{
  return [(NSUserActivity *)self->_activity title];
}

- (void)perform
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  [WeakRetained openWithActivity:self->_activity];
}

- (NSUserActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (RideBookingApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);

  return (RideBookingApplication *)WeakRetained;
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_application);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end