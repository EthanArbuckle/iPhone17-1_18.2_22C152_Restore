@interface ReservationErrorAlertController
- (RestaurantReservationAnalyticsBookingSession)bookingSession;
- (int64_t)displayView;
- (void)setBookingSession:(id)a3;
- (void)setDisplayView:(int64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ReservationErrorAlertController

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ReservationErrorAlertController;
  [(ReservationErrorAlertController *)&v7 viewWillAppear:a3];
  int64_t v4 = [(ReservationErrorAlertController *)self displayView];
  v5 = [(ReservationErrorAlertController *)self bookingSession];
  [v5 setCurrentView:v4];

  v6 = [(ReservationErrorAlertController *)self bookingSession];
  [v6 beginSessionIfNeeded];
}

- (RestaurantReservationAnalyticsBookingSession)bookingSession
{
  return self->_bookingSession;
}

- (void)setBookingSession:(id)a3
{
}

- (int64_t)displayView
{
  return self->_displayView;
}

- (void)setDisplayView:(int64_t)a3
{
  self->_displayView = a3;
}

- (void).cxx_destruct
{
}

@end