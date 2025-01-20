@interface RestaurantReservationErrorController
+ (BOOL)shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:(int64_t)a3;
+ (BOOL)shouldDisplayAlertForResponseWithBookReservationIntentCode:(int64_t)a3;
- (NSString)appName;
- (NSString)restaurantName;
- (RestaurantReservationErrorController)initWithAppName:(id)a3 restaurantName:(id)a4 cancelAction:(id)a5 activityAction:(id)a6;
- (id)activityAction;
- (id)alertActionsForAvailableBookingsIntentResponse:(id)a3 error:(id)a4;
- (id)alertActionsForBookReservationIntentResponse:(id)a3 error:(id)a4;
- (id)alertControllerForAvailableBookingsResponse:(id)a3 error:(id)a4;
- (id)alertControllerForBookReservationResponse:(id)a3 error:(id)a4;
- (id)cancelAction;
- (id)cancelAlertAction;
- (id)errorBodyForAvailableBookingsIntentCode:(int64_t)a3;
- (id)errorBodyForBookReservationIntentCode:(int64_t)a3;
- (id)punchOutAlertActionForIntentResponse:(id)a3;
- (void)setActivityAction:(id)a3;
- (void)setAppName:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setRestaurantName:(id)a3;
@end

@implementation RestaurantReservationErrorController

- (RestaurantReservationErrorController)initWithAppName:(id)a3 restaurantName:(id)a4 cancelAction:(id)a5 activityAction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RestaurantReservationErrorController;
  v14 = [(RestaurantReservationErrorController *)&v24 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    appName = v14->_appName;
    v14->_appName = v15;

    v17 = (NSString *)[v11 copy];
    restaurantName = v14->_restaurantName;
    v14->_restaurantName = v17;

    id v19 = objc_retainBlock(v12);
    id cancelAction = v14->_cancelAction;
    v14->_id cancelAction = v19;

    id v21 = objc_retainBlock(v13);
    id activityAction = v14->_activityAction;
    v14->_id activityAction = v21;
  }
  return v14;
}

- (id)alertControllerForAvailableBookingsResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  uint64_t v9 = 3;
  if (v6 && !v7) {
    uint64_t v9 = (uint64_t)[v6 code];
  }
  if (+[RestaurantReservationErrorController shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:v9])
  {
    id v10 = [(RestaurantReservationErrorController *)self errorBodyForAvailableBookingsIntentCode:v9];
    id v11 = +[UIAlertController alertControllerWithTitle:0 message:v10 preferredStyle:1];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = -[RestaurantReservationErrorController alertActionsForAvailableBookingsIntentResponse:error:](self, "alertActionsForAvailableBookingsIntentResponse:error:", v6, v8, 0);
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [v11 addAction:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)alertControllerForBookReservationResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  uint64_t v9 = 3;
  if (v6 && !v7) {
    uint64_t v9 = (uint64_t)[v6 code];
  }
  if (+[RestaurantReservationErrorController shouldDisplayAlertForResponseWithBookReservationIntentCode:v9])
  {
    id v10 = [(RestaurantReservationErrorController *)self errorBodyForBookReservationIntentCode:v9];
    id v11 = +[UIAlertController alertControllerWithTitle:0 message:v10 preferredStyle:1];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = -[RestaurantReservationErrorController alertActionsForBookReservationIntentResponse:error:](self, "alertActionsForBookReservationIntentResponse:error:", v6, v8, 0);
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [v11 addAction:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

+ (BOOL)shouldDisplayAlertForResponseWithBookReservationIntentCode:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 5;
}

- (id)punchOutAlertActionForIntentResponse:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"reservation_error_continue_in_key" value:@"localized string not found" table:0];

  id v7 = objc_alloc((Class)NSString);
  v8 = [(RestaurantReservationErrorController *)self appName];
  id v9 = [v7 initWithFormat:v6, v8];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100826C18;
  v13[3] = &unk_1012E9640;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  id v11 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v13];

  return v11;
}

- (id)cancelAlertAction
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"reservation_error_cancel_key" value:@"localized string not found" table:0];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100826D74;
  v7[3] = &unk_1012E6DE0;
  v7[4] = self;
  v5 = +[UIAlertAction actionWithTitle:v4 style:1 handler:v7];

  return v5;
}

- (id)alertActionsForAvailableBookingsIntentResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = [(RestaurantReservationErrorController *)self punchOutAlertActionForIntentResponse:v6];
  v8 = [(RestaurantReservationErrorController *)self cancelAlertAction];
  if (v6 && !a4 && (char *)[v6 code] - 1 > (char *)2)
  {
    id v9 = &__NSArray0__struct;
  }
  else
  {
    v11[0] = v7;
    v11[1] = v8;
    id v9 = +[NSArray arrayWithObjects:v11 count:2];
  }

  return v9;
}

- (id)alertActionsForBookReservationIntentResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = [(RestaurantReservationErrorController *)self punchOutAlertActionForIntentResponse:v6];
  v8 = [(RestaurantReservationErrorController *)self cancelAlertAction];
  if (!v6 || a4 || (id v9 = (char *)[v6 code], (unint64_t)(v9 - 3) < 3))
  {
    id v14 = v7;
    uint64_t v15 = v8;
    id v10 = &v14;
    uint64_t v11 = 2;
LABEL_5:
    id v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, v11, v14, v15, v16);
    goto LABEL_6;
  }
  if ((unint64_t)(v9 - 1) <= 1)
  {
    v16 = v8;
    id v10 = &v16;
    uint64_t v11 = 1;
    goto LABEL_5;
  }
  id v12 = &__NSArray0__struct;
LABEL_6:

  return v12;
}

- (id)errorBodyForAvailableBookingsIntentCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v9 = 0;
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"reservation_get_available_bookings_alert_body_error_failure_key" value:@"localized string not found" table:0];

    id v6 = objc_alloc((Class)NSString);
    id v7 = [(RestaurantReservationErrorController *)self restaurantName];
    v8 = [(RestaurantReservationErrorController *)self appName];
    id v9 = [v6 initWithFormat:v5, v7, v8];
  }

  return v9;
}

- (id)errorBodyForBookReservationIntentCode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"reservation_book_reservation_alert_body_error_denied_key");
      goto LABEL_6;
    case 2:
      v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"reservation_book_reservation_alert_body_error_failed_key");
LABEL_6:
      uint64_t v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

      id v12 = objc_alloc((Class)NSString);
      id v13 = [(RestaurantReservationErrorController *)self restaurantName];
      id v7 = [v12 initWithFormat:v11, v13];
      goto LABEL_9;
    case 3:
    case 5:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"reservation_book_reservation_alert_body_error_failed_app_launch_key");
      goto LABEL_8;
    case 4:
      id v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"reservation_book_reservation_alert_body_error_failed_credentials_key");
LABEL_8:
      uint64_t v11 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

      id v14 = objc_alloc((Class)NSString);
      id v13 = [(RestaurantReservationErrorController *)self restaurantName];
      uint64_t v15 = [(RestaurantReservationErrorController *)self appName];
      id v7 = [v14 initWithFormat:v11, v13, v15];

LABEL_9:
      break;
    default:
      id v7 = 0;
      break;
  }

  return v7;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)restaurantName
{
  return self->_restaurantName;
}

- (void)setRestaurantName:(id)a3
{
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (id)activityAction
{
  return self->_activityAction;
}

- (void)setActivityAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityAction, 0);
  objc_storeStrong(&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_restaurantName, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end