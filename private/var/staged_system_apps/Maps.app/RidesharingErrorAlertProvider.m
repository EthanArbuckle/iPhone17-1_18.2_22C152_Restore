@interface RidesharingErrorAlertProvider
- (NSString)dismissCommandTitle;
- (NSString)message;
- (NSString)openAppCommandTitle;
- (NSString)title;
- (id)_initWithCause:(int64_t)a3 application:(id)a4 activity:(id)a5;
- (id)description;
- (id)didSupersede;
- (int64_t)cause;
- (void)_supersede;
- (void)openApp;
- (void)setDidSupersede:(id)a3;
@end

@implementation RidesharingErrorAlertProvider

- (id)_initWithCause:(int64_t)a3 application:(id)a4 activity:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingErrorAlertProvider;
  v11 = [(RidesharingErrorAlertProvider *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_application, a4);
    objc_storeStrong((id *)&v12->_activity, a5);
    v12->_cause = a3;
  }

  return v12;
}

- (NSString)title
{
  p_isa = (id *)&self->super.isa;
  switch([(RidesharingErrorAlertProvider *)self cause])
  {
    case 0:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"There was a problem booking your ride [ridesharing booking error alert]";
      goto LABEL_4;
    case 1:
    case 3:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"There was a problem updating your ride status [ridesharing status error alert]";
LABEL_4:
      p_isa = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];
      goto LABEL_6;
    case 2:
      v6 = +[NSBundle mainBundle];
      v4 = [v6 localizedStringForKey:@"Set pickup location in %@ [ridesharing API error alert]" value:@"localized string not found" table:0];

      id v7 = objc_alloc((Class)NSString);
      v8 = [p_isa[1] name];
      p_isa = [v7 initWithFormat:v4 v8];

LABEL_6:
      break;
    default:
      break;
  }

  return p_isa;
}

- (NSString)message
{
  switch([(RidesharingErrorAlertProvider *)self cause])
  {
    case 0:
      v4 = +[NSBundle mainBundle];
      CFStringRef v5 = v4;
      CFStringRef v6 = @"Open %@ to check your booking [ridesharing booking error alert]";
      goto LABEL_5;
    case 1:
    case 3:
      v4 = +[NSBundle mainBundle];
      CFStringRef v5 = v4;
      CFStringRef v6 = @"Open %@ to check your ride status [ridesharing status error alert]";
      goto LABEL_5;
    case 2:
      v4 = +[NSBundle mainBundle];
      CFStringRef v5 = v4;
      CFStringRef v6 = @"Open %@ to set the pickup location for this ride. [ridesharing API error alert]";
LABEL_5:
      id v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

      id v8 = objc_alloc((Class)NSString);
      id v9 = [(RideBookingApplication *)self->_application name];
      id v2 = [v8 initWithFormat:v7, v9];

      break;
    default:
      break;
  }

  return (NSString *)v2;
}

- (NSString)openAppCommandTitle
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Open %@ [ridesharing booking error alert]" value:@"localized string not found" table:0];

  id v5 = objc_alloc((Class)NSString);
  CFStringRef v6 = [(RideBookingApplication *)self->_application name];
  id v7 = [v5 initWithFormat:v4, v6];

  return (NSString *)v7;
}

- (NSString)dismissCommandTitle
{
  unint64_t v3 = [(RidesharingErrorAlertProvider *)self cause];
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Cancel [ridesharing confirmation error alert]";
      goto LABEL_6;
    }
    if (v3 != 3) {
      goto LABEL_7;
    }
  }
  v4 = +[NSBundle mainBundle];
  id v5 = v4;
  CFStringRef v6 = @"OK [ridesharing booking error alert]";
LABEL_6:
  id v2 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

LABEL_7:

  return (NSString *)v2;
}

- (void)openApp
{
  if (!self->_superseded) {
    [(RideBookingApplication *)self->_application openWithActivity:self->_activity];
  }
}

- (void)_supersede
{
  if (!self->_superseded)
  {
    self->_superseded = 1;
    unint64_t v3 = [(RidesharingErrorAlertProvider *)self didSupersede];

    if (v3)
    {
      v4 = [(RidesharingErrorAlertProvider *)self didSupersede];
      v4[2](v4, self);
    }
  }
}

- (id)description
{
  unint64_t v3 = [(RidesharingErrorAlertProvider *)self title];
  v4 = [(RidesharingErrorAlertProvider *)self message];
  id v5 = +[NSString stringWithFormat:@"Title: %@, message: %@", v3, v4];

  return v5;
}

- (int64_t)cause
{
  return self->_cause;
}

- (id)didSupersede
{
  return self->_didSupersede;
}

- (void)setDidSupersede:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didSupersede, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end