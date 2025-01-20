@interface ReservationRequestRefinementViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSDate)date;
- (NSDate)defaultDate;
- (NSDateFormatter)dateFormatter;
- (NSTimeZone)timeZone;
- (ReservationAnalyticsCaptor)analyticsCaptor;
- (ReservationRequestRefinementViewController)initWithDate:(id)a3 partySize:(unint64_t)a4 minimumPartySize:(unint64_t)a5 maximumPartySize:(unint64_t)a6 analyticsCaptor:(id)a7 timeZone:(id)a8 analyticsBookingSession:(id)a9;
- (ReservationRequestRefinementViewControllerDelegate)refinementDelegate;
- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)defaultPartySize;
- (unint64_t)maximumPartySize;
- (unint64_t)minimumPartySize;
- (unint64_t)partySize;
- (unint64_t)previousPartySize;
- (void)configureNavBar;
- (void)configureTableView;
- (void)datePickerChanged;
- (void)setAnalyticsBookingSession:(id)a3;
- (void)setAnalyticsCaptor:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDefaultDate:(id)a3;
- (void)setDefaultPartySize:(unint64_t)a3;
- (void)setMaximumPartySize:(unint64_t)a3;
- (void)setMinimumPartySize:(unint64_t)a3;
- (void)setPreviousPartySize:(unint64_t)a3;
- (void)setRefinementDelegate:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)stepperChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ReservationRequestRefinementViewController

- (ReservationRequestRefinementViewController)initWithDate:(id)a3 partySize:(unint64_t)a4 minimumPartySize:(unint64_t)a5 maximumPartySize:(unint64_t)a6 analyticsCaptor:(id)a7 timeZone:(id)a8 analyticsBookingSession:(id)a9
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ReservationRequestRefinementViewController;
  v19 = [(ReservationRequestRefinementViewController *)&v22 initWithStyle:1];
  v20 = v19;
  if (v19)
  {
    [(ReservationRequestRefinementViewController *)v19 setDefaultPartySize:a4];
    [(ReservationRequestRefinementViewController *)v20 setDefaultDate:v15];
    [(ReservationRequestRefinementViewController *)v20 setMinimumPartySize:a5];
    [(ReservationRequestRefinementViewController *)v20 setMaximumPartySize:a6];
    [(ReservationRequestRefinementViewController *)v20 setPreviousPartySize:[(ReservationRequestRefinementViewController *)v20 defaultPartySize]];
    [(ReservationRequestRefinementViewController *)v20 setAnalyticsCaptor:v16];
    [(ReservationRequestRefinementViewController *)v20 setTimeZone:v17];
    [(ReservationRequestRefinementViewController *)v20 setAnalyticsBookingSession:v18];
  }

  return v20;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ReservationRequestRefinementViewController;
  [(ReservationRequestRefinementViewController *)&v3 viewDidLoad];
  [(ReservationRequestRefinementViewController *)self configureTableView];
  [(ReservationRequestRefinementViewController *)self configureNavBar];
}

- (void)configureTableView
{
  objc_super v3 = [(ReservationRequestRefinementViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  v7 = [(ReservationRequestRefinementViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v7 registerClass:v8 forCellReuseIdentifier:v10];

  v11 = [(ReservationRequestRefinementViewController *)self tableView];
  uint64_t v12 = objc_opt_class();
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v11 registerClass:v12 forCellReuseIdentifier:v14];

  id v15 = [(ReservationRequestRefinementViewController *)self tableView];
  [v15 setRowHeight:UITableViewAutomaticDimension];

  id v16 = [(ReservationRequestRefinementViewController *)self tableView];
  [v16 setScrollEnabled:0];
}

- (void)configureNavBar
{
  id v4 = +[NSBundle mainBundle];
  objc_super v3 = [v4 localizedStringForKey:@"reservation_date_and_party_size_key" value:@"localized string not found" table:0];
  [(ReservationRequestRefinementViewController *)self setTitle:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ReservationRequestRefinementViewController;
  [(ReservationRequestRefinementViewController *)&v11 viewWillDisappear:a3];
  id v4 = [(ReservationRequestRefinementViewController *)self analyticsCaptor];
  [v4 captureMoreOptionsSubmit];

  v5 = [(ReservationRequestRefinementViewController *)self analyticsBookingSession];
  [v5 setCurrentView:5];

  v6 = [(ReservationRequestRefinementViewController *)self date];
  v7 = [(ReservationRequestRefinementViewController *)self defaultDate];
  if (![v6 isEqualToDate:v7])
  {

    goto LABEL_5;
  }
  unint64_t v8 = [(ReservationRequestRefinementViewController *)self partySize];
  unint64_t v9 = [(ReservationRequestRefinementViewController *)self defaultPartySize];

  if (v8 != v9)
  {
LABEL_5:
    v10 = [(ReservationRequestRefinementViewController *)self refinementDelegate];
    [v10 reservationRequestRefinementViewControllerDidRefine:self];
  }
}

- (void)stepperChanged:(id)a3
{
  id v8 = a3;
  [v8 value];
  if (v4 <= (double)[(ReservationRequestRefinementViewController *)self previousPartySize])
  {
    [v8 value];
    if (v6 >= (double)[(ReservationRequestRefinementViewController *)self previousPartySize]) {
      goto LABEL_6;
    }
    v5 = [(ReservationRequestRefinementViewController *)self analyticsCaptor];
    [v5 captureMoreOptionsDecreaseTableSize];
  }
  else
  {
    v5 = [(ReservationRequestRefinementViewController *)self analyticsCaptor];
    [v5 captureMoreOptionsIncreaseTableSize];
  }

LABEL_6:
  [v8 value];
  [(ReservationRequestRefinementViewController *)self setPreviousPartySize:(unint64_t)v7];
}

- (void)datePickerChanged
{
  objc_super v3 = [(ReservationRequestRefinementViewController *)self analyticsBookingSession];
  [v3 setTappedDatePicker:1];

  id v4 = [(ReservationRequestRefinementViewController *)self analyticsCaptor];
  [v4 captureMoreOptionsSelectDateTime];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 row])
  {
    if ([v4 row] == (id)1) {
      double v5 = 120.0;
    }
    else {
      double v5 = 1000.0;
    }
  }
  else
  {
    double v5 = 120.0;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    v21 = (objc_class *)objc_opt_class();
    objc_super v22 = NSStringFromClass(v21);
    v10 = [v6 dequeueReusableCellWithIdentifier:v22];

    double v23 = (double)[(ReservationRequestRefinementViewController *)self minimumPartySize];
    v24 = [v10 stepperControl];
    [v24 setMinimumValue:v23];

    double v25 = (double)[(ReservationRequestRefinementViewController *)self maximumPartySize];
    v26 = [v10 stepperControl];
    [v26 setMaximumValue:v25];

    [v10 updateStepperValueToValue:[self defaultPartySize]];
    id v18 = [v10 stepperControl];
    v19 = v18;
    v20 = "stepperChanged:";
    goto LABEL_5;
  }
  if ([v7 section] == (id)1)
  {
    id v8 = (objc_class *)objc_opt_class();
    unint64_t v9 = NSStringFromClass(v8);
    v10 = [v6 dequeueReusableCellWithIdentifier:v9];

    objc_super v11 = +[NSDate dateWithTimeIntervalSinceNow:60.0];
    uint64_t v12 = [v10 datePicker];
    [v12 setMinimumDate:v11];

    v13 = [v10 datePicker];
    [v13 setMinuteInterval:30];

    v14 = [(ReservationRequestRefinementViewController *)self timeZone];
    id v15 = [v10 datePicker];
    [v15 setTimeZone:v14];

    id v16 = [(ReservationRequestRefinementViewController *)self defaultDate];
    id v17 = [v10 datePicker];
    [v17 setDate:v16];

    id v18 = [v10 datePicker];
    v19 = v18;
    v20 = "datePickerChanged";
LABEL_5:
    [v18 addTarget:self action:v20 forControlEvents:4096];

    goto LABEL_7;
  }
  v10 = objc_opt_new();
LABEL_7:

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Preferred Date & Time";
    goto LABEL_5;
  }
  if (!a4)
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Table Size";
LABEL_5:
    unint64_t v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];

    goto LABEL_7;
  }
  unint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (unint64_t)partySize
{
  objc_super v3 = [(ReservationRequestRefinementViewController *)self tableView];
  id v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
  id v5 = [v3 cellForRowAtIndexPath:v4];

  objc_opt_class();
  unint64_t defaultPartySize = 0;
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 stepperControl];
    [v7 value];
    unint64_t defaultPartySize = (unint64_t)v8;

    if (!defaultPartySize) {
      unint64_t defaultPartySize = self->_defaultPartySize;
    }
  }

  return defaultPartySize;
}

- (NSDate)date
{
  v2 = [(ReservationRequestRefinementViewController *)self tableView];
  objc_super v3 = +[NSIndexPath indexPathForRow:0 inSection:1];
  id v4 = [v2 cellForRowAtIndexPath:v3];

  objc_opt_class();
  id v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 datePicker];
    id v5 = [v6 date];
  }

  return (NSDate *)v5;
}

- (ReservationRequestRefinementViewControllerDelegate)refinementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refinementDelegate);

  return (ReservationRequestRefinementViewControllerDelegate *)WeakRetained;
}

- (void)setRefinementDelegate:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (unint64_t)defaultPartySize
{
  return self->_defaultPartySize;
}

- (void)setDefaultPartySize:(unint64_t)a3
{
  self->_unint64_t defaultPartySize = a3;
}

- (NSDate)defaultDate
{
  return self->_defaultDate;
}

- (void)setDefaultDate:(id)a3
{
}

- (unint64_t)minimumPartySize
{
  return self->_minimumPartySize;
}

- (void)setMinimumPartySize:(unint64_t)a3
{
  self->_minimumPartySize = a3;
}

- (unint64_t)maximumPartySize
{
  return self->_maximumPartySize;
}

- (void)setMaximumPartySize:(unint64_t)a3
{
  self->_maximumPartySize = a3;
}

- (unint64_t)previousPartySize
{
  return self->_previousPartySize;
}

- (void)setPreviousPartySize:(unint64_t)a3
{
  self->_previousPartySize = a3;
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_defaultDate, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_destroyWeak((id *)&self->_refinementDelegate);
}

@end