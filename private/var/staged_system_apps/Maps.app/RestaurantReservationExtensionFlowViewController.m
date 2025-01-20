@interface RestaurantReservationExtensionFlowViewController
- (RestaurantReservationAnalyticsBookingSession)bookingSession;
- (RestaurantReservationExtensionFlowViewController)initWithRestaurantReservationRequester:(id)a3;
- (RestaurantReservationRequestController)restaurantRequestController;
- (RestaurantReservationRequester)reservationRequester;
- (void)restaurantReservationRequestControllerDidComplete:(id)a3 contentRefresh:(BOOL)a4;
- (void)setBookingSession:(id)a3;
- (void)setReservationRequester:(id)a3;
- (void)setRestaurantRequestController:(id)a3;
- (void)viewDidLoad;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation RestaurantReservationExtensionFlowViewController

- (RestaurantReservationExtensionFlowViewController)initWithRestaurantReservationRequester:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RestaurantReservationExtensionFlowViewController;
  v5 = [(ExtensionFlowViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(RestaurantReservationExtensionFlowViewController *)v5 setReservationRequester:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)RestaurantReservationExtensionFlowViewController;
  [(ExtensionFlowViewController *)&v10 viewDidLoad];
  v3 = [RestaurantReservationRequestController alloc];
  id v4 = [(RestaurantReservationExtensionFlowViewController *)self reservationRequester];
  v5 = [(RestaurantReservationRequestController *)v3 initWithFlowController:self reservationRequester:v4];
  [(RestaurantReservationExtensionFlowViewController *)self setRestaurantRequestController:v5];

  v6 = [(RestaurantReservationExtensionFlowViewController *)self restaurantRequestController];
  [v6 setDelegate:self];

  v7 = [(RestaurantReservationExtensionFlowViewController *)self bookingSession];
  objc_super v8 = [(RestaurantReservationExtensionFlowViewController *)self restaurantRequestController];
  [v8 setAnalyticsBookingSession:v7];

  v9 = [(RestaurantReservationExtensionFlowViewController *)self restaurantRequestController];
  [v9 present];
}

- (void)willResignCurrent:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(RestaurantReservationExtensionFlowViewController *)self restaurantRequestController];
  [v5 willResignCurrent:v3];

  v6.receiver = self;
  v6.super_class = (Class)RestaurantReservationExtensionFlowViewController;
  [(ContaineeViewController *)&v6 willResignCurrent:v3];
}

- (void)restaurantReservationRequestControllerDidComplete:(id)a3 contentRefresh:(BOOL)a4
{
  if (a4)
  {
    v5 = [(ExtensionFlowViewController *)self contentUpdateDelegate];
    [v5 extensionContentDidChange];
  }
  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 dismiss:1];
}

- (RestaurantReservationAnalyticsBookingSession)bookingSession
{
  return self->_bookingSession;
}

- (void)setBookingSession:(id)a3
{
}

- (RestaurantReservationRequestController)restaurantRequestController
{
  return self->_restaurantRequestController;
}

- (void)setRestaurantRequestController:(id)a3
{
}

- (RestaurantReservationRequester)reservationRequester
{
  return self->_reservationRequester;
}

- (void)setReservationRequester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationRequester, 0);
  objc_storeStrong((id *)&self->_restaurantRequestController, 0);

  objc_storeStrong((id *)&self->_bookingSession, 0);
}

@end