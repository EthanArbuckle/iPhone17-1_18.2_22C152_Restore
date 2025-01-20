@interface RideBookingRideOptionStatus
+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3;
+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 error:(unint64_t)a4;
+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 loadingRideOptions:(BOOL)a4;
+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 rideOptions:(id)a4 expirationDate:(id)a5 userActivity:(id)a6 rideOptionStatusError:(unint64_t)a7;
- (BOOL)loadingRideOptions;
- (NSArray)rideOptions;
- (NSDate)expirationDate;
- (NSString)errorMessage;
- (NSUserActivity)userActivity;
- (RideBookingApplication)application;
- (id)_init;
- (id)description;
- (unint64_t)rideOptionStatusError;
- (void)setApplication:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setLoadingRideOptions:(BOOL)a3;
- (void)setRideOptionStatusError:(unint64_t)a3;
- (void)setRideOptions:(id)a3;
- (void)setUserActivity:(id)a3;
@end

@implementation RideBookingRideOptionStatus

- (NSString)errorMessage
{
  switch([(RideBookingRideOptionStatus *)self rideOptionStatusError])
  {
    case 1uLL:
    case 4uLL:
    case 5uLL:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"There was a problem communicating with this app.";
      goto LABEL_12;
    case 2uLL:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"A ride is already booked for this app.";
      goto LABEL_12;
    case 3uLL:
      v6 = +[NSBundle mainBundle];
      v4 = v6;
      CFStringRef v7 = @"No rides are currently available from %@";
      goto LABEL_6;
    case 6uLL:
      v6 = +[NSBundle mainBundle];
      v4 = v6;
      CFStringRef v7 = @"%@ requires you to launch their app to view the ride options.";
LABEL_6:
      v8 = [v6 localizedStringForKey:v7 value:@"localized string not found" table:0];
      v9 = [(RideBookingRideOptionStatus *)self application];
      v10 = [v9 name];
      uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10);
      goto LABEL_15;
    case 7uLL:
      v12 = +[NSBundle mainBundle];
      v4 = v12;
      CFStringRef v13 = @"Sign in to %@ to request a ride [Ridesharing]";
      goto LABEL_14;
    case 8uLL:
      v12 = +[NSBundle mainBundle];
      v4 = v12;
      CFStringRef v13 = @"%@ does not offer service [Ridesharing]";
      goto LABEL_14;
    case 9uLL:
      v12 = +[NSBundle mainBundle];
      v4 = v12;
      CFStringRef v13 = @"Service from %@ is temporarily unavailable [Ridesharing]";
      goto LABEL_14;
    case 0xAuLL:
      v12 = +[NSBundle mainBundle];
      v4 = v12;
      CFStringRef v13 = @"Open %@ to verify the state of your previous ride. [Ridesharing]";
      goto LABEL_14;
    case 0xBuLL:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Review your last ride. [Ridesharing]";
LABEL_12:
      v14 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];
      goto LABEL_16;
    case 0xCuLL:
      v12 = +[NSBundle mainBundle];
      v4 = v12;
      CFStringRef v13 = @"Open %@ to request a ride [Ridesharing]";
LABEL_14:
      v8 = [v12 localizedStringForKey:v13 value:@"localized string not found" table:0];
      v9 = [(RideBookingRideOptionStatus *)self application];
      v10 = [v9 name];
      uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10);
LABEL_15:
      v14 = (void *)v11;

LABEL_16:
      break;
    default:
      v14 = 0;
      break;
  }

  return (NSString *)v14;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)RideBookingRideOptionStatus;
  v2 = [(RideBookingRideOptionStatus *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_loadingRideOptions = 0;
    rideOptions = v2->_rideOptions;
    v2->_rideOptions = 0;

    v3->_rideOptionStatusError = 0;
  }
  return v3;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3
{
  id v3 = a3;
  id v4 = [[RideBookingRideOptionStatus alloc] _init];
  [v4 setApplication:v3];

  return (RideBookingRideOptionStatus *)v4;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 loadingRideOptions:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef v5 = +[RideBookingRideOptionStatus statusWithApplication:a3];
  [v5 setLoadingRideOptions:v4];

  return (RideBookingRideOptionStatus *)v5;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 error:(unint64_t)a4
{
  CFStringRef v5 = +[RideBookingRideOptionStatus statusWithApplication:a3];
  [v5 setRideOptionStatusError:a4];

  return (RideBookingRideOptionStatus *)v5;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 rideOptions:(id)a4 expirationDate:(id)a5 userActivity:(id)a6 rideOptionStatusError:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = +[RideBookingRideOptionStatus statusWithApplication:a3];
  [v14 setRideOptions:v13];

  [v14 setExpirationDate:v12];
  [v14 setUserActivity:v11];

  [v14 setRideOptionStatusError:a7];

  return (RideBookingRideOptionStatus *)v14;
}

- (id)description
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  BOOL v4 = +[NSString stringWithFormat:@"Application: %@\nRideOptions: %@\nExpiration Date: %@", WeakRetained, self->_rideOptions, self->_expirationDate];

  return v4;
}

- (RideBookingApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);

  return (RideBookingApplication *)WeakRetained;
}

- (void)setApplication:(id)a3
{
}

- (BOOL)loadingRideOptions
{
  return self->_loadingRideOptions;
}

- (void)setLoadingRideOptions:(BOOL)a3
{
  self->_loadingRideOptions = a3;
}

- (NSArray)rideOptions
{
  return self->_rideOptions;
}

- (void)setRideOptions:(id)a3
{
}

- (unint64_t)rideOptionStatusError
{
  return self->_rideOptionStatusError;
}

- (void)setRideOptionStatusError:(unint64_t)a3
{
  self->_rideOptionStatusError = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_rideOptions, 0);

  objc_destroyWeak((id *)&self->_application);
}

@end