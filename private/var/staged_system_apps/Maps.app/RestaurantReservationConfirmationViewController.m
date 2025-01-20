@interface RestaurantReservationConfirmationViewController
- (BOOL)useAvailableHeight;
- (BOOL)useExtensionFlowHeader;
- (ExtensionsActionsFooterView)openAppView;
- (ExtensionsPrimaryDetailsView)primaryDetailsView;
- (ExtensionsSecondaryDetailsView)secondaryDetailsView;
- (INRestaurantReservationUserBooking)userBooking;
- (MKMapItem)mapItem;
- (NSArray)buttons;
- (NSArray)sections;
- (NSDateFormatter)dateFormatter;
- (NSNumberFormatter)numberFormatter;
- (NSString)appName;
- (ReservationAnalyticsCaptor)analyticsCaptor;
- (RestaurantReservationConfirmationViewController)initWithUserBooking:(id)a3 mapItem:(id)a4 appName:(id)a5 analyticsCaptor:(id)a6;
- (RestaurantReservationConfirmationViewControllerDelegate)reservationDelegate;
- (UITableView)tableView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)confirmationSubtitleTextForUserBooking:(id)a3;
- (id)dayAndRestaurantDescriptionForUserBooking:(id)a3;
- (id)headerTextForUserBookingStatus:(unint64_t)a3;
- (id)tableDescriptionForUserBooking:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)timeAndTableDescriptionForUserBooking:(id)a3;
- (id)userInfoStringForGuest:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)buildSections;
- (void)checkUserBookingForRefresh:(id)a3;
- (void)configureHeaderCell:(id)a3;
- (void)configureTableView;
- (void)registerCellClasses;
- (void)requestRefresh;
- (void)reservationConfirmationHeaderCellAccessoryButtonWasTapped:(id)a3;
- (void)setAnalyticsCaptor:(id)a3;
- (void)setAppName:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setOpenAppView:(id)a3;
- (void)setPrimaryDetailsView:(id)a3;
- (void)setReservationDelegate:(id)a3;
- (void)setSecondaryDetailsView:(id)a3;
- (void)setSections:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUserBooking:(id)a3;
- (void)setupConstraints;
- (void)updateTheme;
- (void)viewDidLoad;
@end

@implementation RestaurantReservationConfirmationViewController

- (RestaurantReservationConfirmationViewController)initWithUserBooking:(id)a3 mapItem:(id)a4 appName:(id)a5 analyticsCaptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RestaurantReservationConfirmationViewController;
  v14 = [(RestaurantReservationConfirmationViewController *)&v17 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    [(RestaurantReservationConfirmationViewController *)v14 setUserBooking:v10];
    [(RestaurantReservationConfirmationViewController *)v15 setMapItem:v11];
    [(RestaurantReservationConfirmationViewController *)v15 setAppName:v12];
    [(RestaurantReservationConfirmationViewController *)v15 setAnalyticsCaptor:v13];
  }

  return v15;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RestaurantReservationConfirmationViewController;
  [(RestaurantReservationConfirmationViewController *)&v3 viewDidLoad];
  [(RestaurantReservationConfirmationViewController *)self configureTableView];
  [(RestaurantReservationConfirmationViewController *)self registerCellClasses];
  [(RestaurantReservationConfirmationViewController *)self setupConstraints];
  [(RestaurantReservationConfirmationViewController *)self buildSections];
}

- (void)configureTableView
{
  id v3 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(RestaurantReservationConfirmationViewController *)self setTableView:v3];

  v4 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v4 setDelegate:self];

  v5 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v5 setDataSource:self];

  v6 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v6 setRowHeight:UITableViewAutomaticDimension];

  v7 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v7 setSectionHeaderHeight:UITableViewAutomaticDimension];

  v8 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v8 setEstimatedSectionHeaderHeight:0.0];

  v9 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v9 setSeparatorStyle:0];

  id v10 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v10 setAllowsSelection:0];

  id v12 = [(RestaurantReservationConfirmationViewController *)self view];
  id v11 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v12 addSubview:v11];
}

- (void)registerCellClasses
{
  id v3 = [(RestaurantReservationConfirmationViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  v7 = [(RestaurantReservationConfirmationViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  [v7 registerClass:v8 forCellReuseIdentifier:v10];

  id v14 = [(RestaurantReservationConfirmationViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  [v14 registerClass:v11 forCellReuseIdentifier:v13];
}

- (void)setupConstraints
{
  id v3 = [(RestaurantReservationConfirmationViewController *)self tableView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(RestaurantReservationConfirmationViewController *)self tableView];
  v22 = [v24 leadingAnchor];
  v23 = [(RestaurantReservationConfirmationViewController *)self view];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  v19 = [(RestaurantReservationConfirmationViewController *)self tableView];
  objc_super v17 = [v19 trailingAnchor];
  v18 = [(RestaurantReservationConfirmationViewController *)self view];
  v16 = [v18 trailingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v25[1] = v15;
  id v14 = [(RestaurantReservationConfirmationViewController *)self tableView];
  uint64_t v4 = [v14 bottomAnchor];
  v5 = [(RestaurantReservationConfirmationViewController *)self view];
  v6 = [v5 bottomAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  v25[2] = v7;
  uint64_t v8 = [(RestaurantReservationConfirmationViewController *)self tableView];
  v9 = [v8 topAnchor];
  id v10 = [(RestaurantReservationConfirmationViewController *)self view];
  uint64_t v11 = [v10 topAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v25[3] = v12;
  id v13 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)buildSections
{
  id v40 = +[NSMutableArray arrayWithCapacity:5];
  id v3 = [(RestaurantReservationConfirmationViewController *)self userBooking];
  uint64_t v4 = [v3 advisementText];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = objc_opt_new();
    v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"reservations_from_restaurant_key" value:@"localized string not found" table:0];
    [v6 setSectionTitle:v8];

    v9 = [(RestaurantReservationConfirmationViewController *)self userBooking];
    id v10 = [v9 advisementText];
    [v6 setSectionText:v10];

    [v40 addObject:v6];
  }
  uint64_t v11 = [(RestaurantReservationConfirmationViewController *)self userBooking];
  id v12 = [v11 guest];
  id v13 = [(RestaurantReservationConfirmationViewController *)self userInfoStringForGuest:v12];
  id v14 = [v13 length];

  if (v14)
  {
    v15 = objc_opt_new();
    v16 = +[NSBundle mainBundle];
    objc_super v17 = [v16 localizedStringForKey:@"reservations_your_info_key" value:@"localized string not found" table:0];
    [v15 setSectionTitle:v17];

    v18 = [(RestaurantReservationConfirmationViewController *)self userBooking];
    v19 = [v18 guest];
    v20 = [(RestaurantReservationConfirmationViewController *)self userInfoStringForGuest:v19];
    [v15 setSectionText:v20];

    [v40 addObject:v15];
  }
  v21 = [(RestaurantReservationConfirmationViewController *)self userBooking];
  v22 = [v21 selectedOffer];
  v23 = [v22 offerDetailText];
  id v24 = [v23 length];

  if (v24)
  {
    v25 = objc_opt_new();
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"reservations_selected_offer_key" value:@"localized string not found" table:0];
    [v25 setSectionTitle:v27];

    v28 = [(RestaurantReservationConfirmationViewController *)self userBooking];
    v29 = [v28 selectedOffer];
    v30 = [v29 offerTitleText];
    [v25 setSectionText:v30];

    [v40 addObject:v25];
  }
  v31 = [(RestaurantReservationConfirmationViewController *)self userBooking];
  v32 = [v31 guestProvidedSpecialRequestText];
  id v33 = [v32 length];

  if (v33)
  {
    v34 = objc_opt_new();
    v35 = +[NSBundle mainBundle];
    v36 = [v35 localizedStringForKey:@"reservations_special_request_key" value:@"localized string not found" table:0];
    [v34 setSectionTitle:v36];

    v37 = [(RestaurantReservationConfirmationViewController *)self userBooking];
    v38 = [v37 guestProvidedSpecialRequestText];
    [v34 setSectionText:v38];

    [v40 addObject:v34];
  }
  v39 = +[NSArray arrayWithArray:v40];
  [(RestaurantReservationConfirmationViewController *)self setSections:v39];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(RestaurantReservationConfirmationViewController *)self sections];
  uint64_t v4 = (char *)[v3 count] + 1;

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v16 = [v6 dequeueReusableCellWithIdentifier:v20];

    [(RestaurantReservationConfirmationViewController *)self configureHeaderCell:v16];
    goto LABEL_13;
  }
  uint64_t v8 = (uint64_t)[v7 section];
  unint64_t v9 = v8 - 1;
  if (v8 < 1
    || ([(RestaurantReservationConfirmationViewController *)self sections],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 count],
        v10,
        v9 >= (unint64_t)v11))
  {
    v16 = objc_opt_new();
    goto LABEL_13;
  }
  id v12 = [(RestaurantReservationConfirmationViewController *)self sections];
  id v13 = [v12 objectAtIndexedSubscript:v9];

  if ([v7 row])
  {
    if ([v7 row] != (id)1)
    {
      v16 = objc_opt_new();
      goto LABEL_12;
    }
    id v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [v6 dequeueReusableCellWithIdentifier:v15];

    objc_super v17 = [v13 sectionText];
    v18 = [v16 details];
    [v18 setText:v17];
  }
  else
  {
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v16 = [v6 dequeueReusableCellWithIdentifier:v22];

    v23 = [v13 sectionTitle];
    [v16 setText:v23];

    objc_super v17 = +[UIColor secondaryLabelColor];
    [v16 setTextColor:v17];
  }

LABEL_12:
LABEL_13:

  return v16;
}

- (void)configureHeaderCell:(id)a3
{
  id v4 = a3;
  [v4 setSubtitleType:1];
  id v5 = [(RestaurantReservationConfirmationViewController *)self userBooking];
  id v6 = -[RestaurantReservationConfirmationViewController headerTextForUserBookingStatus:](self, "headerTextForUserBookingStatus:", [v5 status]);
  id v7 = [v4 mainLabel];
  [v7 setText:v6];

  uint64_t v8 = [(RestaurantReservationConfirmationViewController *)self userBooking];
  unint64_t v9 = [(RestaurantReservationConfirmationViewController *)self confirmationSubtitleTextForUserBooking:v8];
  id v10 = [v4 subLabel];
  [v10 setText:v9];

  [v4 setActionDelegate:self];
  id v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"reservation_change_reservation_key" value:@"localized string not found" table:0];
  [v4 setAccessoryButtonTitle:v12];

  id v13 = [v4 contentView];
  [v13 layoutMargins];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  id v20 = [v4 contentView];

  [v20 setLayoutMargins:v15, v17, 30.0, v19];
}

- (void)updateTheme
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(RestaurantReservationConfirmationViewController *)self buttons];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        unint64_t v9 = [(RestaurantReservationConfirmationViewController *)self theme];
        id v10 = [v9 controlTintColor];
        [v8 setTintColor:v10];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)reservationConfirmationHeaderCellAccessoryButtonWasTapped:(id)a3
{
  id v4 = [(RestaurantReservationConfirmationViewController *)self analyticsCaptor];
  [v4 captureBookedChangeReservation];

  id v5 = [(RestaurantReservationConfirmationViewController *)self reservationDelegate];
  [v5 restaurantReservationConfirmationViewControllerDidSelectEditReservation:self];
}

- (id)headerTextForUserBookingStatus:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"reservations_denied_text_key";
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_8;
      }
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"reservations_completion_text_key";
    }
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"reservation_request_sent_key";
  }
  id v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

LABEL_8:

  return v3;
}

- (id)userInfoStringForGuest:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 nameComponents];

  if (v5)
  {
    CFStringRef v6 = [v3 nameComponents];
    id v7 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v6 style:3 options:0];

    if ([v7 length]) {
      [v4 addObject:v7];
    }
  }
  uint64_t v8 = [v3 phoneNumber];
  id v9 = [v8 length];

  if (v9)
  {
    id v10 = [v3 phoneNumber];
    [v4 addObject:v10];
  }
  long long v11 = [v3 emailAddress];
  id v12 = [v11 length];

  if (v12)
  {
    long long v13 = [v3 emailAddress];
    [v4 addObject:v13];
  }
  long long v14 = [v4 componentsJoinedByString:@"\n"];

  return v14;
}

- (id)confirmationSubtitleTextForUserBooking:(id)a3
{
  id v4 = a3;
  id v5 = [(RestaurantReservationConfirmationViewController *)self dayAndRestaurantDescriptionForUserBooking:v4];
  CFStringRef v6 = [(RestaurantReservationConfirmationViewController *)self timeAndTableDescriptionForUserBooking:v4];

  id v7 = +[NSString stringWithFormat:@"%@\n%@", v5, v6];

  return v7;
}

- (id)timeAndTableDescriptionForUserBooking:(id)a3
{
  id v4 = a3;
  id v5 = [(RestaurantReservationConfirmationViewController *)self mapItem];
  CFStringRef v6 = [v5 timeZone];
  id v7 = [(RestaurantReservationConfirmationViewController *)self dateFormatter];
  [v7 setTimeZone:v6];

  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"reservation_date_table_size_key" value:@"localized string not found" table:0];

  id v10 = [(RestaurantReservationConfirmationViewController *)self dateFormatter];
  long long v11 = [v4 bookingDate];
  id v12 = [v10 stringFromDate:v11];

  id v13 = objc_alloc((Class)NSString);
  id v14 = [v4 partySize];

  id v15 = [v13 initWithFormat:v9, v12, v14];

  return v15;
}

- (id)dayAndRestaurantDescriptionForUserBooking:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  CFStringRef v6 = [v5 localizedStringForKey:@"reservation_day_restaurant_name_format_key" value:@"localized string not found" table:0];

  id v7 = objc_alloc((Class)NSString);
  uint64_t v8 = [(RestaurantReservationConfirmationViewController *)self mapItem];
  id v9 = [v8 timeZone];
  id v10 = [v4 bookingDate];

  long long v11 = +[NSDate _maps_dayDescriptionStringShortDescription:1 timeZone:v9 bookingDate:v10];
  id v12 = [(RestaurantReservationConfirmationViewController *)self mapItem];
  id v13 = [v12 name];
  id v14 = [v7 initWithFormat:v6, v11, v13];

  return v14;
}

- (id)tableDescriptionForUserBooking:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  CFStringRef v6 = [v5 localizedStringForKey:@"reservation_name_table_format" value:@"localized string not found" table:0];

  id v7 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
  [v7 setStyle:0];
  uint64_t v8 = [v4 guest];
  id v9 = [v8 nameComponents];
  id v10 = [v7 stringFromPersonNameComponents:v9];

  id v11 = objc_alloc((Class)NSString);
  id v12 = [(RestaurantReservationConfirmationViewController *)self numberFormatter];
  id v13 = [v4 partySize];

  id v14 = +[NSNumber numberWithUnsignedInteger:v13];
  id v15 = [v12 stringFromNumber:v14];
  id v16 = [v11 initWithFormat:v6, v10, v15];

  return v16;
}

- (void)setMapItem:(id)a3
{
  id v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    CFStringRef v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    id v5 = v6;
  }
}

- (void)setUserBooking:(id)a3
{
  id v6 = a3;
  [(RestaurantReservationConfirmationViewController *)self checkUserBookingForRefresh:v6];
  if (([v6 isEqual:self->_userBooking] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userBooking, a3);
    id v5 = [(RestaurantReservationConfirmationViewController *)self tableView];
    [v5 reloadData];
  }
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:1];
    [(NSDateFormatter *)self->_dateFormatter setDateStyle:0];
    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    id v4 = (NSNumberFormatter *)objc_opt_new();
    id v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (void)checkUserBookingForRefresh:(id)a3
{
  if (![a3 status])
  {
    [(RestaurantReservationConfirmationViewController *)self performSelector:"requestRefresh" withObject:0 afterDelay:20.0];
  }
}

- (void)requestRefresh
{
  id v3 = [(RestaurantReservationConfirmationViewController *)self reservationDelegate];
  [v3 restaurantReservationConfirmationViewControllerRequestStatusUpdateForUserBooking:self];
}

- (BOOL)useExtensionFlowHeader
{
  return 1;
}

- (BOOL)useAvailableHeight
{
  return 1;
}

- (INRestaurantReservationUserBooking)userBooking
{
  return self->_userBooking;
}

- (RestaurantReservationConfirmationViewControllerDelegate)reservationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reservationDelegate);

  return (RestaurantReservationConfirmationViewControllerDelegate *)WeakRetained;
}

- (void)setReservationDelegate:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (ExtensionsPrimaryDetailsView)primaryDetailsView
{
  return self->_primaryDetailsView;
}

- (void)setPrimaryDetailsView:(id)a3
{
}

- (ExtensionsSecondaryDetailsView)secondaryDetailsView
{
  return self->_secondaryDetailsView;
}

- (void)setSecondaryDetailsView:(id)a3
{
}

- (ExtensionsActionsFooterView)openAppView
{
  return self->_openAppView;
}

- (void)setOpenAppView:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void)setNumberFormatter:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_openAppView, 0);
  objc_storeStrong((id *)&self->_secondaryDetailsView, 0);
  objc_storeStrong((id *)&self->_primaryDetailsView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_reservationDelegate);

  objc_storeStrong((id *)&self->_userBooking, 0);
}

@end