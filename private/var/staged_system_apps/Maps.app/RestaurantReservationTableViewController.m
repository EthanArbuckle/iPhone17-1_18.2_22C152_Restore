@interface RestaurantReservationTableViewController
- (BOOL)bookingPending;
- (BOOL)bookingsLoading;
- (BOOL)contactRequirementsSatisfiable;
- (BOOL)emailPreferenceAllowEmails;
- (BOOL)guestLoading;
- (BOOL)requirements:(id)a3 satisfiableWithDisplayPreferences:(id)a4 guest:(id)a5;
- (BOOL)shouldDisplayAdvisementSection;
- (BOOL)shouldDisplayContactCell;
- (BOOL)shouldDisplayContactCellForGuestDisplayPreferences:(id)a3 bookingsLoading:(BOOL)a4;
- (BOOL)shouldDisplayOffersSection;
- (BOOL)shouldDisplaySuffix;
- (BOOL)shouldDisplayTermsAndConditions;
- (BOOL)showRemoteView;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)useAvailableHeight;
- (BOOL)useExtensionFlowHeader;
- (BOOL)useTruncatedAdvisement;
- (BOOL)viewHasAppeared;
- (ContactRequirements)inferredContactRequirements;
- (INRestaurantGuest)guest;
- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences;
- (INRestaurantOffer)selectedOffer;
- (INRestaurantReservationBooking)selectedBooking;
- (INTermsAndConditions)termsAndConditions;
- (NSArray)availableBookings;
- (NSArray)sectionTitles;
- (NSDate)date;
- (NSDateFormatter)timeSelectionDateFormatter;
- (NSDateFormatter)timeSuffixDateFormatter;
- (NSDictionary)availableBookingsBySection;
- (NSMutableArray)offers;
- (NSMutableDictionary)heightCache;
- (NSMutableSet)offersSet;
- (NSNumber)offersRowHeight;
- (NSString)appName;
- (NSString)formerSelection;
- (NSString)restaurantAdvisementText;
- (NSString)restaurantDescriptionText;
- (NSString)restaurantName;
- (NSString)specialRequestText;
- (NSTimeZone)restaurantTimeZone;
- (ReservationAnalyticsCaptor)analyticsCaptor;
- (ReservationButtonView)footerButtonView;
- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession;
- (RestaurantReservationRequestController)restaurantReservationRequestController;
- (RestaurantReservationTableViewCell)reservationDetailCell;
- (RestaurantReservationTableViewController)initWithAnalyticsCaptor:(id)a3 analyticsBookingSession:(id)a4;
- (RestaurantReservationTableViewControllerDelegate)delegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UITableView)tableView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contactDisplayColorSatisfied:(BOOL)a3;
- (id)contactDisplayStringSatisfied:(BOOL *)a3;
- (id)descriptionTextForDate:(id)a3 partySize:(unint64_t)a4;
- (id)dimmableIndexPaths;
- (id)noOfferOffer;
- (id)noTablesAvailableTextForDate:(id)a3;
- (id)reservationDetailsIndexPath;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)timeSuffixForDate:(id)a3;
- (int64_t)advisementSection;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)headerSection;
- (int64_t)numberOfNonOptionalSections;
- (int64_t)numberOfOptionalSections;
- (int64_t)numberOfRowsInDetailsSection;
- (int64_t)numberOfRowsInOffersSection;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)offersSection;
- (int64_t)openAppRow;
- (int64_t)openAppSection;
- (int64_t)reservationContactInfoRow;
- (int64_t)reservationDetailsSection;
- (int64_t)reservationSpecialRequestRow;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)termsAndConditionsSection;
- (int64_t)transformedIndexForIndexPath:(id)a3 collectionView:(id)a4;
- (unint64_t)partySize;
- (void)_configureReservationDetails;
- (void)_configureReservationDetailsDateAndPartySize;
- (void)_configureReservationDetailsError;
- (void)_configureReservationDetailsLoadingIndicator;
- (void)_configureReservationDetailsTimeSelction;
- (void)adjustCollectionViewHeightForOffers:(BOOL)a3 animated:(BOOL)a4;
- (void)changeDateButtonTapped:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureButton;
- (void)configureCell:(id)a3 withBooking:(id)a4 row:(int64_t)a5;
- (void)configureSpecialRequestTextCell:(id)a3;
- (void)deselectBooking;
- (void)didReceiveMemoryWarning;
- (void)footerButtonTapped:(id)a3;
- (void)handleCellAppearanceForIndexPath:(id)a3 willDisplay:(BOOL)a4 didDisplay:(BOOL)a5;
- (void)handleSectionAppearanceForSection:(int64_t)a3 willDisplay:(BOOL)a4 didDisplay:(BOOL)a5;
- (void)rebuildCollectionViewSections;
- (void)rebuildOffers;
- (void)rebuildOffersNewOffers:(id)a3 oldOffers:(id)a4;
- (void)registerCells;
- (void)reservationTableViewCellDidSelectPrimaryButton:(id)a3;
- (void)reservationTableViewCellDidSelectSecondaryButton:(id)a3;
- (void)resetForChangedTimeSelection;
- (void)ridesharingAppActionTableViewCellDidPerformAction:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnalyticsBookingSession:(id)a3;
- (void)setAnalyticsCaptor:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAvailableBookings:(id)a3;
- (void)setAvailableBookingsBySection:(id)a3;
- (void)setBookingPending:(BOOL)a3;
- (void)setBookingsLoading:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmailPreferenceAllowEmails:(BOOL)a3;
- (void)setFooterButtonView:(id)a3;
- (void)setFormerSelection:(id)a3;
- (void)setGuest:(id)a3;
- (void)setGuestDisplayPreferences:(id)a3;
- (void)setGuestLoading:(BOOL)a3;
- (void)setHeightCache:(id)a3;
- (void)setOffers:(id)a3;
- (void)setOffersRowHeight:(id)a3;
- (void)setOffersSet:(id)a3;
- (void)setPartySize:(unint64_t)a3;
- (void)setReservationDetailCell:(id)a3;
- (void)setRestaurantAdvisementText:(id)a3;
- (void)setRestaurantDescriptionText:(id)a3;
- (void)setRestaurantDescriptionText:(id)a3 keepExisting:(BOOL)a4;
- (void)setRestaurantName:(id)a3;
- (void)setRestaurantReservationRequestController:(id)a3;
- (void)setRestaurantTimeZone:(id)a3;
- (void)setSectionTitles:(id)a3;
- (void)setSelectedBooking:(id)a3;
- (void)setSelectedOffer:(id)a3;
- (void)setSpecialRequestText:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTermsAndConditions:(id)a3;
- (void)setTimeSelectionDateFormatter:(id)a3;
- (void)setTimeSuffixDateFormatter:(id)a3;
- (void)setUseTruncatedAdvisement:(BOOL)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)setupConstraints;
- (void)setupFooterButtonView;
- (void)setupTableView;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateHeightCacheForOffersSectionDeletion;
- (void)updateHeightCacheForOffersSectionInsertion;
- (void)updateSelectedOffer;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RestaurantReservationTableViewController

- (RestaurantReservationTableViewController)initWithAnalyticsCaptor:(id)a3 analyticsBookingSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RestaurantReservationTableViewController;
  v9 = [(RestaurantReservationTableViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_analyticsCaptor, a3);
    objc_storeStrong((id *)&v10->_analyticsBookingSession, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RestaurantReservationTableViewController;
  [(RestaurantReservationTableViewController *)&v3 viewDidLoad];
  [(RestaurantReservationTableViewController *)self setupTableView];
  [(RestaurantReservationTableViewController *)self setupFooterButtonView];
  [(RestaurantReservationTableViewController *)self setupConstraints];
  [(RestaurantReservationTableViewController *)self registerCells];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RestaurantReservationTableViewController;
  [(RestaurantReservationTableViewController *)&v5 viewWillAppear:a3];
  v4 = [(RestaurantReservationTableViewController *)self analyticsBookingSession];
  [v4 beginSessionIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RestaurantReservationTableViewController;
  [(RestaurantReservationTableViewController *)&v4 viewDidAppear:a3];
  [(RestaurantReservationTableViewController *)self setViewHasAppeared:1];
}

- (void)registerCells
{
  objc_super v3 = [(RestaurantReservationTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  id v7 = [(RestaurantReservationTableViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v7 registerClass:v8 forCellReuseIdentifier:v10];

  v11 = [(RestaurantReservationTableViewController *)self tableView];
  uint64_t v12 = objc_opt_class();
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v11 registerClass:v12 forCellReuseIdentifier:v14];

  v15 = [(RestaurantReservationTableViewController *)self tableView];
  uint64_t v16 = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  [v15 registerClass:v16 forCellReuseIdentifier:v18];

  v19 = [(RestaurantReservationTableViewController *)self tableView];
  uint64_t v20 = objc_opt_class();
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  [v19 registerClass:v20 forCellReuseIdentifier:v22];

  id v26 = [(RestaurantReservationTableViewController *)self tableView];
  uint64_t v23 = objc_opt_class();
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  [v26 registerClass:v23 forCellReuseIdentifier:v25];
}

- (void)setupTableView
{
  id v3 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(RestaurantReservationTableViewController *)self setTableView:v3];

  uint64_t v4 = [(RestaurantReservationTableViewController *)self tableView];
  [v4 setDelegate:self];

  objc_super v5 = [(RestaurantReservationTableViewController *)self tableView];
  [v5 setDataSource:self];

  v6 = [(RestaurantReservationTableViewController *)self tableView];
  [v6 setRowHeight:UITableViewAutomaticDimension];

  id v7 = [(RestaurantReservationTableViewController *)self tableView];
  [v7 setAllowsMultipleSelectionDuringEditing:1];

  uint64_t v8 = [(RestaurantReservationTableViewController *)self tableView];
  [v8 setContentInset:-40.0, 0.0, -40.0, 0.0];

  id v10 = [(RestaurantReservationTableViewController *)self view];
  v9 = [(RestaurantReservationTableViewController *)self tableView];
  [v10 addSubview:v9];
}

- (void)setupFooterButtonView
{
  id v3 = objc_opt_new();
  [(RestaurantReservationTableViewController *)self setFooterButtonView:v3];

  uint64_t v4 = [(RestaurantReservationTableViewController *)self footerButtonView];
  [v4 setTopHairlineHidden:0];

  [(RestaurantReservationTableViewController *)self configureButton];
  objc_super v5 = [(RestaurantReservationTableViewController *)self view];
  v6 = [(RestaurantReservationTableViewController *)self footerButtonView];
  [v5 addSubview:v6];

  id v8 = [(RestaurantReservationTableViewController *)self footerButtonView];
  id v7 = [v8 button];
  [v7 addTarget:self action:"footerButtonTapped:" forControlEvents:64];
}

- (void)setupConstraints
{
  id v3 = [(RestaurantReservationTableViewController *)self tableView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v4 = [(RestaurantReservationTableViewController *)self footerButtonView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v40 = [(RestaurantReservationTableViewController *)self view];
  v38 = [v40 leadingAnchor];
  v39 = [(RestaurantReservationTableViewController *)self footerButtonView];
  v37 = [v39 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v41[0] = v36;
  v35 = [(RestaurantReservationTableViewController *)self view];
  v33 = [v35 trailingAnchor];
  v34 = [(RestaurantReservationTableViewController *)self footerButtonView];
  v32 = [v34 trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v41[1] = v31;
  v30 = [(RestaurantReservationTableViewController *)self view];
  v28 = [v30 bottomAnchor];
  v29 = [(RestaurantReservationTableViewController *)self footerButtonView];
  v27 = [v29 bottomAnchor];
  id v26 = [v28 constraintEqualToAnchor:v27];
  v41[2] = v26;
  v25 = [(RestaurantReservationTableViewController *)self view];
  uint64_t v23 = [v25 leadingAnchor];
  v24 = [(RestaurantReservationTableViewController *)self tableView];
  v22 = [v24 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v41[3] = v21;
  uint64_t v20 = [(RestaurantReservationTableViewController *)self view];
  v18 = [v20 trailingAnchor];
  v19 = [(RestaurantReservationTableViewController *)self tableView];
  v17 = [v19 trailingAnchor];
  uint64_t v16 = [v18 constraintEqualToAnchor:v17];
  v41[4] = v16;
  v15 = [(RestaurantReservationTableViewController *)self view];
  objc_super v5 = [v15 topAnchor];
  v6 = [(RestaurantReservationTableViewController *)self tableView];
  id v7 = [v6 topAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  v41[5] = v8;
  v9 = [(RestaurantReservationTableViewController *)self tableView];
  id v10 = [v9 bottomAnchor];
  v11 = [(RestaurantReservationTableViewController *)self footerButtonView];
  uint64_t v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v41[6] = v13;
  v14 = +[NSArray arrayWithObjects:v41 count:7];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)RestaurantReservationTableViewController;
  [(RestaurantReservationTableViewController *)&v2 didReceiveMemoryWarning];
}

- (void)configureButton
{
  char v36 = 0;
  id v3 = [(RestaurantReservationTableViewController *)self contactDisplayStringSatisfied:&v36];
  uint64_t v4 = [(RestaurantReservationTableViewController *)self inferredContactRequirements];
  objc_super v5 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
  v6 = [(RestaurantReservationTableViewController *)self guest];
  unsigned int v7 = [(RestaurantReservationTableViewController *)self requirements:v4 satisfiableWithDisplayPreferences:v5 guest:v6];

  id v8 = [(RestaurantReservationTableViewController *)self selectedBooking];
  if (v8 && ![(RestaurantReservationTableViewController *)self bookingPending])
  {
    if (v36) {
      unsigned int v10 = v7;
    }
    else {
      unsigned int v10 = 0;
    }
    uint64_t v9 = v10 | v7 ^ 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v11 = [(RestaurantReservationTableViewController *)self footerButtonView];
  uint64_t v12 = [v11 button];
  [v12 setEnabled:v9];

  v13 = [(RestaurantReservationTableViewController *)self footerButtonView];
  v14 = [v13 button];
  if ([v14 isEnabled]) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.200000003;
  }
  uint64_t v16 = [(RestaurantReservationTableViewController *)self footerButtonView];
  v17 = [v16 button];
  [v17 setAlpha:v15];

  unsigned int v18 = [(RestaurantReservationTableViewController *)self bookingPending];
  v19 = [(RestaurantReservationTableViewController *)self selectedBooking];
  uint64_t v20 = v19;
  if (v18)
  {
    unsigned int v21 = [v19 requiresManualRequest];

    v22 = +[NSBundle mainBundle];
    if (v21) {
      CFStringRef v23 = @"reservation_booking_request_pending_title";
    }
    else {
      CFStringRef v23 = @"reservation_booking_pending_title";
    }
    goto LABEL_22;
  }

  if (v20)
  {
    if ((v7 & 1) == 0)
    {
      v28 = +[NSBundle mainBundle];
      v22 = v28;
      CFStringRef v23 = @"reservation_continue_in_app_title_key";
LABEL_23:
      id v26 = [v28 localizedStringForKey:v23 value:@"localized string not found" table:0];

      id v29 = objc_alloc((Class)NSString);
      v30 = [(RestaurantReservationTableViewController *)self appName];
      id v27 = [v29 initWithFormat:v26, v30];

      goto LABEL_24;
    }
    v24 = [(RestaurantReservationTableViewController *)self selectedBooking];
    unsigned int v25 = [v24 requiresManualRequest];

    v22 = +[NSBundle mainBundle];
    if (v25) {
      CFStringRef v23 = @"reservation_request_with_app_title";
    }
    else {
      CFStringRef v23 = @"reservation_book_with_app_title";
    }
LABEL_22:
    v28 = v22;
    goto LABEL_23;
  }
  id v26 = +[NSBundle mainBundle];
  id v27 = [v26 localizedStringForKey:@"reservation_choose_time_button_title" value:@"localized string not found" table:0];
LABEL_24:

  v31 = [(RestaurantReservationTableViewController *)self footerButtonView];
  v32 = [v31 button];
  v33 = [v32 configuration];

  [v33 setTitle:v27];
  v34 = [(RestaurantReservationTableViewController *)self footerButtonView];
  v35 = [v34 button];
  [v35 setConfiguration:v33];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(RestaurantReservationTableViewController *)self heightCache];
  unsigned int v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    [v7 floatValue];
    double v9 = v8;
  }
  else
  {
    unsigned int v10 = [(RestaurantReservationTableViewController *)self reservationDetailsIndexPath];
    unsigned int v11 = [v5 isEqual:v10];

    if (v11) {
      double v9 = 149.0;
    }
    else {
      double v9 = 40.0;
    }
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4 = [(RestaurantReservationTableViewController *)self numberOfNonOptionalSections];
  return [(RestaurantReservationTableViewController *)self numberOfOptionalSections] + v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(RestaurantReservationTableViewController *)self headerSection] == a4
    || [(RestaurantReservationTableViewController *)self advisementSection] == a4
    && [(RestaurantReservationTableViewController *)self shouldDisplayAdvisementSection])
  {
    return 2;
  }
  if ([(RestaurantReservationTableViewController *)self offersSection] == a4
    && [(RestaurantReservationTableViewController *)self shouldDisplayOffersSection])
  {
    return [(RestaurantReservationTableViewController *)self numberOfRowsInOffersSection];
  }
  if ([(RestaurantReservationTableViewController *)self reservationDetailsSection] != a4)
  {
    if ([(RestaurantReservationTableViewController *)self termsAndConditionsSection] != a4
      || ![(RestaurantReservationTableViewController *)self shouldDisplayTermsAndConditions])
    {
      return [(RestaurantReservationTableViewController *)self openAppSection] == a4;
    }
    return 2;
  }

  return [(RestaurantReservationTableViewController *)self numberOfRowsInDetailsSection];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  id v8 = [v7 section];
  if (v8 == (id)[(RestaurantReservationTableViewController *)self headerSection]
    && [v7 row] == (id)1)
  {
    [v22 bounds];
    [v22 setSeparatorInset:0.0, v9, 0.0, 0.0];
  }
  unsigned int v10 = [(RestaurantReservationTableViewController *)self heightCache];

  if (!v10)
  {
    unsigned int v11 = objc_opt_new();
    [(RestaurantReservationTableViewController *)self setHeightCache:v11];
  }
  id v12 = [v7 section];
  if (v12 == (id)[(RestaurantReservationTableViewController *)self offersSection]
    && [(RestaurantReservationTableViewController *)self shouldDisplayOffersSection])
  {
    if (![v7 row])
    {
      [v22 bounds];
      [v22 setSeparatorInset:0.0, v13, 0.0, 0.0];
    }
    [v22 bounds];
    v14 = +[NSNumber numberWithDouble:CGRectGetHeight(v24)];
    [(RestaurantReservationTableViewController *)self setOffersRowHeight:v14];
  }
  id v15 = [v7 section];
  BOOL v16 = v15 == (id)-[RestaurantReservationTableViewController termsAndConditionsSection](self, "termsAndConditionsSection")&& -[RestaurantReservationTableViewController shouldDisplayTermsAndConditions](self, "shouldDisplayTermsAndConditions")&& [v7 row] == 0;
  id v17 = [v7 section];
  BOOL v18 = v17 == (id)[(RestaurantReservationTableViewController *)self advisementSection]
     && -[RestaurantReservationTableViewController shouldDisplayAdvisementSection](self, "shouldDisplayAdvisementSection")&& [v7 row] == 0;
  if (v16 || v18)
  {
    [v22 bounds];
    [v22 setSeparatorInset:0.0, v19, 0.0, 0.0];
  }
  [v22 bounds];
  uint64_t v20 = +[NSNumber numberWithDouble:CGRectGetHeight(v25)];
  unsigned int v21 = [(RestaurantReservationTableViewController *)self heightCache];
  [v21 setObject:v20 forKeyedSubscript:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)[(RestaurantReservationTableViewController *)self headerSection])
  {
    if (![v7 row])
    {
      v64 = (objc_class *)objc_opt_class();
      v65 = NSStringFromClass(v64);
      id v17 = [v6 dequeueReusableCellWithIdentifier:v65];

      [v17 setAutomaticallyHidesChevron:1];
      [v17 setSubtitleType:0];
      v66 = [(RestaurantReservationTableViewController *)self restaurantName];
      v67 = [v17 mainLabel];
      [v67 setText:v66];

      v68 = [(RestaurantReservationTableViewController *)self restaurantDescriptionText];
      v69 = [v17 subLabel];
      [v69 setText:v68];

      v70 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
      v71 = [v17 subLabel];
      [v71 setFont:v70];

      v72 = +[UIColor secondaryLabelColor];
      v73 = [v17 subLabel];
      [v73 setTextColor:v72];

      if ([(RestaurantReservationTableViewController *)self useTruncatedAdvisement]) {
        uint64_t v74 = 2;
      }
      else {
        uint64_t v74 = 0;
      }
      v75 = [v17 subLabel];
      [v75 setNumberOfLines:v74];

      v76 = [v17 contentView];
      [v76 layoutMargins];
      double v78 = v77;
      double v80 = v79;
      double v82 = v81;

      v83 = [v17 contentView];
      [v83 setLayoutMargins:v78, v80, 20.0, v82];

LABEL_40:
      [v17 setAccessoryType:1];
      goto LABEL_51;
    }
    if ([v7 row] == (id)1)
    {
      double v9 = [(RestaurantReservationTableViewController *)self reservationDetailCell];

      if (!v9)
      {
        unsigned int v10 = (objc_class *)objc_opt_class();
        unsigned int v11 = NSStringFromClass(v10);
        id v12 = [v6 dequeueReusableCellWithIdentifier:v11];

        [(RestaurantReservationTableViewController *)self setReservationDetailCell:v12];
        [(RestaurantReservationTableViewController *)self _configureReservationDetails];
      }
      uint64_t v13 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
      goto LABEL_42;
    }
  }
  id v14 = [v7 section];
  if (v14 == (id)[(RestaurantReservationTableViewController *)self advisementSection]
    && [(RestaurantReservationTableViewController *)self shouldDisplayAdvisementSection])
  {
    if (![v7 row])
    {
      v84 = (objc_class *)objc_opt_class();
      v85 = NSStringFromClass(v84);
      id v17 = [v6 dequeueReusableCellWithIdentifier:v85];

      v86 = +[NSBundle mainBundle];
      v53 = [v86 localizedStringForKey:@"reservation_from_restaurant_format_key" value:@"localized string not found" table:0];

      id v87 = objc_alloc((Class)NSString);
      uint64_t v88 = [(RestaurantReservationTableViewController *)self restaurantName];
      goto LABEL_44;
    }
    if ([v7 row] == (id)1)
    {
      id v15 = (objc_class *)objc_opt_class();
      BOOL v16 = NSStringFromClass(v15);
      id v17 = [v6 dequeueReusableCellWithIdentifier:v16];

      BOOL v18 = [(RestaurantReservationTableViewController *)self restaurantAdvisementText];
      [v17 setText:v18];

      [v17 setPrimaryButtonText:0];
      [v17 setSecondaryButtonText:0];
      goto LABEL_51;
    }
  }
  id v19 = [v7 section];
  if (v19 != (id)[(RestaurantReservationTableViewController *)self offersSection]
    || ![(RestaurantReservationTableViewController *)self shouldDisplayOffersSection])
  {
    id v32 = [v7 section];
    if (v32 == (id)[(RestaurantReservationTableViewController *)self reservationDetailsSection])
    {
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      id v17 = [v6 dequeueReusableCellWithIdentifier:v34];

      if (!v17)
      {
        id v35 = objc_alloc((Class)UITableViewCell);
        char v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        id v17 = [v35 initWithStyle:1 reuseIdentifier:v37];
      }
      id v38 = [v7 row];
      if (v38 == (id)[(RestaurantReservationTableViewController *)self reservationContactInfoRow]&& [(RestaurantReservationTableViewController *)self shouldDisplayContactCell])
      {
        unsigned __int8 v111 = 0;
        v39 = +[NSBundle mainBundle];
        v40 = [v39 localizedStringForKey:@"reservation_your_details_key" value:@"localized string not found" table:0];
        v41 = [v17 textLabel];
        [v41 setText:v40];

        v42 = [(RestaurantReservationTableViewController *)self contactDisplayStringSatisfied:&v111];
        v43 = [v17 detailTextLabel];
        [v43 setText:v42];

        v44 = [(RestaurantReservationTableViewController *)self contactDisplayColorSatisfied:v111];
        v45 = [v17 detailTextLabel];
        [v45 setTextColor:v44];
      }
      id v46 = [v7 row];
      if (v46 == (id)[(RestaurantReservationTableViewController *)self reservationSpecialRequestRow])[(RestaurantReservationTableViewController *)self configureSpecialRequestTextCell:v17]; {
      goto LABEL_40;
      }
    }
    id v47 = [v7 section];
    if (v47 == (id)[(RestaurantReservationTableViewController *)self openAppSection]
      && ![v7 row])
    {
      v104 = (objc_class *)objc_opt_class();
      v105 = NSStringFromClass(v104);
      id v17 = [v6 dequeueReusableCellWithIdentifier:v105];

      v106 = [(RestaurantReservationTableViewController *)self appName];
      [v17 setApplicationName:v106 titleType:1];

      [v17 setDelegate:self];
      goto LABEL_51;
    }
    id v48 = [v7 section];
    if (v48 != (id)[(RestaurantReservationTableViewController *)self termsAndConditionsSection]|| ![(RestaurantReservationTableViewController *)self shouldDisplayTermsAndConditions])
    {
      goto LABEL_41;
    }
    if ([v7 row])
    {
      if ([v7 row] == (id)1)
      {
        v49 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v49);
        id v17 = [v6 dequeueReusableCellWithIdentifier:v50];

        v51 = [(RestaurantReservationTableViewController *)self termsAndConditions];
        v52 = [v51 localizedTermsAndConditionsText];
        [v17 setText:v52];

        v53 = +[NSMutableArray arrayWithCapacity:2];
        v54 = [(RestaurantReservationTableViewController *)self termsAndConditions];
        v55 = [v54 privacyPolicyURL];

        if (v55)
        {
          v56 = +[NSBundle mainBundle];
          v57 = [v56 localizedStringForKey:@"reservations_privacy_policy_title" value:@"localized string not found" table:0];
          [v53 addObject:v57];
        }
        v58 = [(RestaurantReservationTableViewController *)self termsAndConditions];
        v59 = [v58 termsAndConditionsURL];

        if (v59)
        {
          v60 = +[NSBundle mainBundle];
          v61 = [v60 localizedStringForKey:@"reservations_terms_of_use_title" value:@"localized string not found" table:0];
          [v53 addObject:v61];
        }
        v62 = [v53 firstObject];
        [v17 setPrimaryButtonText:v62];

        v63 = [v53 lastObject];
        [v17 setSecondaryButtonText:v63];

        [v17 setDelegate:self];
        goto LABEL_45;
      }
LABEL_41:
      uint64_t v13 = objc_opt_new();
LABEL_42:
      id v17 = (id)v13;
      goto LABEL_51;
    }
    v108 = (objc_class *)objc_opt_class();
    v109 = NSStringFromClass(v108);
    id v17 = [v6 dequeueReusableCellWithIdentifier:v109];

    v110 = +[NSBundle mainBundle];
    v53 = [v110 localizedStringForKey:@"reservation_from_provider_format_key" value:@"localized string not found" table:0];

    id v87 = objc_alloc((Class)NSString);
    uint64_t v88 = [(RestaurantReservationTableViewController *)self appName];
LABEL_44:
    v89 = (void *)v88;
    id v90 = [v87 initWithFormat:v53, v88];
    [v17 setText:v90];

    v91 = +[UIColor secondaryLabelColor];
    [v17 setTextColor:v91];

    [v17 setHidesHairline:1];
    v92 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v17 setFont:v92];

LABEL_45:
    goto LABEL_51;
  }
  if ([v7 row])
  {
    uint64_t v20 = (char *)[v7 row] - 1;
    unsigned int v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    id v17 = [v6 dequeueReusableCellWithIdentifier:v22];

    CFStringRef v23 = [(RestaurantReservationTableViewController *)self offers];
    CGRect v24 = (char *)[v23 count];

    if (v20 >= v24)
    {
      v99 = +[NSBundle mainBundle];
      v100 = [v99 localizedStringForKey:@"reservation_no_offer_key" value:@"localized string not found" table:0];
      v101 = [v17 mainLabel];
      [v101 setText:v100];

      id v26 = +[NSBundle mainBundle];
      id v29 = [v26 localizedStringForKey:@"reservation_no_offer_detail_key" value:@"localized string not found" table:0];
      v30 = [v17 subLabel];
      [v30 setText:v29];
    }
    else
    {
      CGRect v25 = [(RestaurantReservationTableViewController *)self offers];
      id v26 = [v25 objectAtIndexedSubscript:v20];

      id v27 = [v26 offerTitleText];
      v28 = [v17 mainLabel];
      [v28 setText:v27];

      id v29 = [v26 offerDetailText];
      v30 = [v29 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      v31 = [v17 subLabel];
      [v31 setText:v30];
    }
    v98 = objc_opt_new();
    v102 = +[UIColor clearColor];
    [v98 setBackgroundColor:v102];

    v103 = +[RestaurantReservationsChooseOfferCell appearance];
    [v103 setSelectedBackgroundView:v98];
  }
  else
  {
    v93 = (objc_class *)objc_opt_class();
    v94 = NSStringFromClass(v93);
    id v17 = [v6 dequeueReusableCellWithIdentifier:v94];

    v95 = +[NSBundle mainBundle];
    v96 = [v95 localizedStringForKey:@"reservation_offers_key" value:@"localized string not found" table:0];
    [v17 setText:v96];

    v97 = +[UIColor secondaryLabelColor];
    [v17 setTextColor:v97];

    [v17 setHidesHairline:1];
    v98 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v17 setFont:v98];
  }

LABEL_51:

  return v17;
}

- (void)configureSpecialRequestTextCell:(id)a3
{
  id v13 = a3;
  int64_t v4 = +[UIColor systemGrayColor];
  id v5 = [v13 detailTextLabel];
  [v5 setTextColor:v4];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"reservation_special_request_key" value:@"localized string not found" table:0];
  id v8 = [v13 textLabel];
  [v8 setText:v7];

  double v9 = [(RestaurantReservationTableViewController *)self specialRequestText];
  id v10 = [v9 length];
  if (v10)
  {
    [(RestaurantReservationTableViewController *)self specialRequestText];
  }
  else
  {
    self = +[NSBundle mainBundle];
    [(RestaurantReservationTableViewController *)self localizedStringForKey:@"reservation_special_request_none_key" value:@"localized string not found" table:0];
  unsigned int v11 = };
  id v12 = [v13 detailTextLabel];
  [v12 setText:v11];

  if (!v10)
  {

    unsigned int v11 = self;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)[(RestaurantReservationTableViewController *)self offersSection])
  {
    double v9 = [(RestaurantReservationTableViewController *)self tableView];
    unsigned int v10 = [v9 isEditing];

    if (v10)
    {
      unsigned int v11 = [(RestaurantReservationTableViewController *)self tableView];
      id v12 = [v11 cellForRowAtIndexPath:v7];

      id v13 = [v12 mainLabel];
      id v14 = [v13 text];
      [(RestaurantReservationTableViewController *)self setFormerSelection:v14];

      id v15 = [v6 indexPathsForSelectedRows];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v42;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v42 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v21 = [v20 section];
            if (v21 == (id)[(RestaurantReservationTableViewController *)self offersSection])
            {
              id v22 = [v20 row];
              if (v22 != [v7 row])
              {
                CFStringRef v23 = [(RestaurantReservationTableViewController *)self tableView];
                [v23 deselectRowAtIndexPath:v20 animated:1];
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v17);
      }
    }
    uint64_t v24 = (uint64_t)[v7 row];
    if (v24 < 2
      || (unint64_t v25 = v24 - 1,
          [(RestaurantReservationTableViewController *)self offers],
          id v26 = objc_claimAutoreleasedReturnValue(),
          id v27 = [v26 count],
          v26,
          v25 >= (unint64_t)v27))
    {
      [(RestaurantReservationTableViewController *)self setSelectedOffer:0];
    }
    else
    {
      v28 = [(RestaurantReservationTableViewController *)self offers];
      id v29 = [v28 objectAtIndexedSubscript:v25];
      [(RestaurantReservationTableViewController *)self setSelectedOffer:v29];
    }
  }
  id v30 = [v7 section];
  if (v30 == (id)-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection"))[v6 deselectRowAtIndexPath:v7 animated:1]; {
  id v31 = [v7 section];
  }
  if (v31 == (id)[(RestaurantReservationTableViewController *)self reservationDetailsSection])
  {
    id v32 = [v7 row];
    if (v32 == (id)[(RestaurantReservationTableViewController *)self reservationContactInfoRow]&& [(RestaurantReservationTableViewController *)self shouldDisplayContactCell])
    {
      v33 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
      [v33 captureSelectTimeEditUserInfo];

      v34 = [(RestaurantReservationTableViewController *)self delegate];
      [v34 userInfoCellSelected];
    }
    id v35 = [v7 row];
    if (v35 == (id)[(RestaurantReservationTableViewController *)self reservationSpecialRequestRow])
    {
      char v36 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
      [v36 captureSelectTimeAddSpecialRequest];

      v37 = [(RestaurantReservationTableViewController *)self delegate];
      [v37 specialRequestCellSelected];
    }
  }
  id v38 = [v7 section];
  if (v38 == (id)[(RestaurantReservationTableViewController *)self headerSection]
    && ![v7 row])
  {
    v39 = [(RestaurantReservationTableViewController *)self tableView];
    [v39 deselectRowAtIndexPath:v7 animated:1];

    v40 = [(RestaurantReservationTableViewController *)self delegate];
    [v40 headerCellSelected];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = [(RestaurantReservationTableViewController *)self tableView];
  unsigned int v6 = [v5 isEditing];

  if (v6) {
    [(RestaurantReservationTableViewController *)self setFormerSelection:&stru_101324E70];
  }
  id v7 = [(RestaurantReservationTableViewController *)self offers];
  id v8 = [v7 count];

  id v10 = [(RestaurantReservationTableViewController *)self tableView];
  double v9 = +[NSIndexPath indexPathForRow:v8 inSection:[(RestaurantReservationTableViewController *)self offersSection]];
  [v10 selectRowAtIndexPath:v9 animated:1 scrollPosition:0];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  if (v6 == (id)[(RestaurantReservationTableViewController *)self offersSection]
    && [v5 row])
  {
    BOOL v7 = [(RestaurantReservationTableViewController *)self shouldDisplayOffersSection];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(RestaurantReservationTableViewController *)self headerSection];
  double result = 35.0;
  if (v5 != a4) {
    return 6.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  int64_t v5 = [(RestaurantReservationTableViewController *)self openAppSection];
  double result = 37.0;
  if (v5 != a4) {
    return 6.0;
  }
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  int64_t v5 = [(RestaurantReservationTableViewController *)self transformedIndexForIndexPath:a4 collectionView:a3];
  if ((v5 & 0x8000000000000000) == 0)
  {
    id v6 = (id)v5;
    BOOL v7 = [(RestaurantReservationTableViewController *)self availableBookings];
    id v8 = [v7 count];

    if (v6 < v8)
    {
      double v9 = [(RestaurantReservationTableViewController *)self availableBookings];
      id v10 = [(RestaurantReservationTableViewController *)self selectedBooking];
      id v11 = [v9 indexOfObject:v10];

      if (v6 == v11)
      {
        [(RestaurantReservationTableViewController *)self deselectBooking];
      }
      else
      {
        id v12 = [(RestaurantReservationTableViewController *)self availableBookings];
        id v17 = [v12 objectAtIndexedSubscript:v6];

        if ([v17 isBookingAvailable])
        {
          id v13 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
          [v13 captureSelectTimeSelected];

          id v14 = [(RestaurantReservationTableViewController *)self analyticsBookingSession];
          [v14 setCurrentView:4];

          [(RestaurantReservationTableViewController *)self setSelectedBooking:v17];
          id v15 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
          id v16 = [v15 timeSelectionCollectionViewLayout];
          [v16 setDimUnselected:1];

          [(RestaurantReservationTableViewController *)self resetForChangedTimeSelection];
        }
      }
    }
  }
}

- (void)deselectBooking
{
  [(RestaurantReservationTableViewController *)self setSelectedBooking:0];
  id v3 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  int64_t v4 = [v3 timeSelectionCollectionViewLayout];
  [v4 setDimUnselected:0];

  [(RestaurantReservationTableViewController *)self resetForChangedTimeSelection];
}

- (void)resetForChangedTimeSelection
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C777E8;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v6 completion:0];
  [(RestaurantReservationTableViewController *)self configureButton];
  [(RestaurantReservationTableViewController *)self rebuildOffers];
  id v3 = [(RestaurantReservationTableViewController *)self tableView];
  int64_t v4 = [(RestaurantReservationTableViewController *)self selectedBooking];
  if (v4) {
    BOOL v5 = [(RestaurantReservationTableViewController *)self shouldDisplayOffersSection];
  }
  else {
    BOOL v5 = 0;
  }
  [v3 setEditing:v5 animated:1];

  [(RestaurantReservationTableViewController *)self updateSelectedOffer];
}

- (void)updateSelectedOffer
{
  id v3 = [(RestaurantReservationTableViewController *)self tableView];
  unsigned int v4 = [v3 isEditing];

  if (v4)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    BOOL v5 = [(RestaurantReservationTableViewController *)self tableView];
    id v6 = [v5 indexPathsForVisibleRows];

    id v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v7) {
      goto LABEL_18;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v30;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v12 = [v11 section];
        if (v12 == (id)[(RestaurantReservationTableViewController *)self offersSection]
          && [v11 row])
        {
          id v13 = [(RestaurantReservationTableViewController *)self tableView];
          id v14 = [v13 cellForRowAtIndexPath:v11];

          id v15 = [(RestaurantReservationTableViewController *)self tableView];
          unsigned int v16 = [v15 isEditing];

          if (v16)
          {
            id v17 = [(RestaurantReservationTableViewController *)self formerSelection];
            id v18 = [v17 length];

            if ((unint64_t)v18 < 2)
            {
              unint64_t v25 = [(RestaurantReservationTableViewController *)self offers];
              id v26 = [v25 firstObject];
              [(RestaurantReservationTableViewController *)self setSelectedOffer:v26];

              uint64_t v24 = [(RestaurantReservationTableViewController *)self tableView];
              id v27 = +[NSIndexPath indexPathForRow:1 inSection:[(RestaurantReservationTableViewController *)self offersSection]];
              [v24 selectRowAtIndexPath:v27 animated:1 scrollPosition:0];

LABEL_14:
            }
            else
            {
              id v19 = [v14 mainLabel];
              uint64_t v20 = [v19 text];
              [(RestaurantReservationTableViewController *)self formerSelection];
              uint64_t v21 = v9;
              CFStringRef v23 = v22 = v6;
              unsigned int v28 = [v20 isEqualToString:v23];

              id v6 = v22;
              uint64_t v9 = v21;

              if (v28)
              {
                uint64_t v24 = [(RestaurantReservationTableViewController *)self tableView];
                [v24 selectRowAtIndexPath:v11 animated:1 scrollPosition:0];
                goto LABEL_14;
              }
            }
          }

          continue;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v8)
      {
LABEL_18:

        return;
      }
    }
  }
}

- (int64_t)transformedIndexForIndexPath:(id)a3 collectionView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((uint64_t)[v5 section] < 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
      v8 += (uint64_t)[v6 numberOfItemsInSection:v7++];
    while (v7 < (uint64_t)[v5 section]);
  }
  uint64_t v9 = (char *)[v5 item] + v8;

  return (int64_t)v9;
}

- (void)reservationTableViewCellDidSelectPrimaryButton:(id)a3
{
  unsigned int v4 = [(RestaurantReservationTableViewController *)self termsAndConditions];
  id v5 = [v4 privacyPolicyURL];

  id v6 = [(RestaurantReservationTableViewController *)self termsAndConditions];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 privacyPolicyURL];
  }
  else
  {
    uint64_t v9 = [v6 termsAndConditionsURL];

    if (!v9) {
      return;
    }
    uint64_t v7 = [(RestaurantReservationTableViewController *)self termsAndConditions];
    uint64_t v8 = [v7 termsAndConditionsURL];
  }
  id v12 = (id)v8;

  if (v12)
  {
    id v10 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
    [v10 captureSelectTimeLearnMore];

    id v11 = +[UIApplication sharedApplication];
    [v11 openURL:v12 options:&__NSDictionary0__struct completionHandler:0];
  }
}

- (void)reservationTableViewCellDidSelectSecondaryButton:(id)a3
{
  unsigned int v4 = [(RestaurantReservationTableViewController *)self termsAndConditions];
  id v5 = [v4 termsAndConditionsURL];

  if (v5)
  {
    id v6 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
    [v6 captureSelectTimeLearnMore];

    id v9 = +[UIApplication sharedApplication];
    uint64_t v7 = [(RestaurantReservationTableViewController *)self termsAndConditions];
    uint64_t v8 = [v7 termsAndConditionsURL];
    [v9 openURL:v8 options:&__NSDictionary0__struct completionHandler:0];
  }
}

- (void)ridesharingAppActionTableViewCellDidPerformAction:(id)a3
{
  unsigned int v4 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
  [v4 captureSelectTimePunchOut];

  id v5 = [(RestaurantReservationTableViewController *)self delegate];
  [v5 bookingSelectionViewControllerDidSelectOpenInApp:self];
}

- (void)footerButtonTapped:(id)a3
{
  unsigned int v4 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
  [v4 captureSelectTimeReserveTable];

  id v9 = [(RestaurantReservationTableViewController *)self delegate];
  id v5 = [(RestaurantReservationTableViewController *)self selectedBooking];
  id v6 = [(RestaurantReservationTableViewController *)self selectedOffer];
  uint64_t v7 = [(RestaurantReservationTableViewController *)self noOfferOffer];
  if ([v6 isEqual:v7])
  {
    [v9 bookingSelectionViewController:self didSelectBooking:v5 offer:0];
  }
  else
  {
    uint64_t v8 = [(RestaurantReservationTableViewController *)self selectedOffer];
    [v9 bookingSelectionViewController:self didSelectBooking:v5 offer:v8];
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a4;
  double left = UIEdgeInsetsZero.left;
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  CGFloat right = UIEdgeInsetsZero.right;
  [v6 headerReferenceSize];
  double v11 = left - v10;
  if (a5 >= 1)
  {
    [v6 minimumInteritemSpacing];
    double v11 = v11 + v12;
  }

  double v13 = 20.0;
  double v14 = v11;
  double v15 = bottom;
  double v16 = right;
  result.CGFloat right = v16;
  result.CGFloat bottom = v15;
  result.double left = v14;
  result.top = v13;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4 < 0) {
    return 0;
  }
  id v6 = [(RestaurantReservationTableViewController *)self sectionTitles];
  id v7 = [v6 count];

  if ((unint64_t)v7 <= a4) {
    return 0;
  }
  uint64_t v8 = [(RestaurantReservationTableViewController *)self sectionTitles];
  id v9 = [v8 objectAtIndexedSubscript:a4];

  double v10 = [(RestaurantReservationTableViewController *)self availableBookingsBySection];
  double v11 = [v10 objectForKeyedSubscript:v9];
  id v12 = [v11 count];

  return (int64_t)v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(RestaurantReservationTableViewController *)self sectionTitles];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  double v11 = v10;
  if (UICollectionElementKindSectionHeader != v9
    || ((unint64_t)[v10 section] & 0x8000000000000000) != 0
    || (id v14 = [v11 section],
        [(RestaurantReservationTableViewController *)self sectionTitles],
        double v15 = objc_claimAutoreleasedReturnValue(),
        id v16 = [v15 count],
        v15,
        v14 >= v16))
  {
    id v12 = objc_opt_new();
  }
  else
  {
    id v17 = [(RestaurantReservationTableViewController *)self sectionTitles];
    id v18 = [v17 objectAtIndexedSubscript:[v11 section]];

    id v19 = +[RestaurantReservationTableViewCell reuseIdentifierForClass:objc_opt_class()];
    id v12 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v19 forIndexPath:v11];

    uint64_t v20 = [v12 label];
    [v20 setText:v18];

    uint64_t v21 = +[UIColor secondaryLabelColor];
    id v22 = [v12 label];
    [v22 setTextColor:v21];

    CFStringRef v23 = [(RestaurantReservationTableViewController *)self tableView];
    [v23 layoutMargins];
    [v12 setLayoutMargins:];

    [v12 setMarginsRequired:(uint64_t)[v11 section] > 0];
  }

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (((unint64_t)[v7 section] & 0x8000000000000000) != 0
    || (id v8 = [v7 section],
        [(RestaurantReservationTableViewController *)self sectionTitles],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 count],
        v9,
        v8 >= v10))
  {
    id v17 = objc_opt_new();
  }
  else
  {
    double v11 = [(RestaurantReservationTableViewController *)self sectionTitles];
    id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    double v13 = [(RestaurantReservationTableViewController *)self availableBookingsBySection];
    id v14 = [v13 objectForKeyedSubscript:v12];

    if (((unint64_t)[v7 row] & 0x8000000000000000) != 0
      || (id v15 = [v7 row], v15 >= objc_msgSend(v14, "count")))
    {
      id v17 = objc_opt_new();
    }
    else
    {
      id v16 = +[RestaurantReservationTableViewCell reuseIdentifierForClass:objc_opt_class()];
      id v17 = [v6 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v7];

      id v18 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      -[RestaurantReservationTableViewController configureCell:withBooking:row:](self, "configureCell:withBooking:row:", v17, v18, [v7 row]);
    }
  }

  return v17;
}

- (void)configureCell:(id)a3 withBooking:(id)a4 row:(int64_t)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = [(RestaurantReservationTableViewController *)self timeSelectionDateFormatter];
  id v9 = [v7 bookingDate];
  id v10 = [v8 stringFromDate:v9];
  [v19 setTitleText:v10];

  double v11 = [v7 offers];
  if ([v11 count])
  {
    unsigned int v12 = [v7 isBookingAvailable];

    if (v12)
    {
      double v13 = +[NSBundle mainBundle];
      id v14 = [v13 localizedStringForKey:@"reservations_number_of_offers_key" value:@"localized string not found" table:0];

      id v15 = [v7 offers];
      id v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, [v15 count]);
      [v19 setSubText:v16];

      goto LABEL_6;
    }
  }
  else
  {
  }
  [v19 setSubText:0];
LABEL_6:
  id v17 = [(RestaurantReservationTableViewController *)self theme];
  if ([v7 isBookingAvailable]) {
    [v17 keyColor];
  }
  else {
  id v18 = [v17 reservationsGrayColor];
  }
  [v19 setColor:v18];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)[(RestaurantReservationTableViewController *)self headerSection]
    && ![v7 row])
  {
    double v13 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LOBYTE(self) = [v13 shouldBeSelectable];
    }
    else {
      LOBYTE(self) = 1;
    }
  }
  else
  {
    id v9 = [v7 section];
    if (v9 == (id)-[RestaurantReservationTableViewController reservationDetailsSection](self, "reservationDetailsSection")&& ![v7 row])
    {
      LODWORD(self) = ![(RestaurantReservationTableViewController *)self guestLoading];
    }
    else
    {
      id v10 = [v7 section];
      if (v10 == (id)[(RestaurantReservationTableViewController *)self headerSection]
        && ![v7 row]
        || (id v11 = [v7 section],
            v11 == (id)[(RestaurantReservationTableViewController *)self offersSection])
        && [(RestaurantReservationTableViewController *)self shouldDisplayOffersSection]
        && [v7 row])
      {
        LOBYTE(self) = 1;
      }
      else
      {
        id v12 = [v7 section];
        LOBYTE(self) = v12 == (id)[(RestaurantReservationTableViewController *)self reservationDetailsSection];
      }
    }
  }

  return (char)self;
}

- (void)_configureReservationDetails
{
  [(RestaurantReservationTableViewController *)self _configureReservationDetailsDateAndPartySize];
  [(RestaurantReservationTableViewController *)self _configureReservationDetailsLoadingIndicator];
  [(RestaurantReservationTableViewController *)self _configureReservationDetailsError];

  [(RestaurantReservationTableViewController *)self _configureReservationDetailsTimeSelction];
}

- (void)_configureReservationDetailsDateAndPartySize
{
  id v3 = [(RestaurantReservationTableViewController *)self date];
  id v4 = [(RestaurantReservationTableViewController *)self descriptionTextForDate:v3 partySize:[(RestaurantReservationTableViewController *)self partySize]];
  id v5 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v5 setDateAndPartySizeText:v4];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"reservations_change_key" value:@"localized string not found" table:0];
  id v8 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v8 setDateAndPartySizeButtonText:v7];

  id v9 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v9 addDateAndPartySizeButtonTouchUpInsideTarget:self action:"changeDateButtonTapped:"];

  id v12 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  id v10 = [(RestaurantReservationTableViewController *)self availableBookings];
  if ([v10 count]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = [(RestaurantReservationTableViewController *)self bookingsLoading] ^ 1;
  }
  [v12 setHideDateAndPartySize:v11 animated:1];
}

- (void)_configureReservationDetailsLoadingIndicator
{
  id v3 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v3 setLoading:[self bookingsLoading] animated:1];

  id v4 = +[NSBundle mainBundle];
  id v9 = [v4 localizedStringForKey:@"reservations_loading_format_key" value:@"localized string not found" table:0];

  id v5 = objc_alloc((Class)NSString);
  id v6 = [(RestaurantReservationTableViewController *)self restaurantName];
  id v7 = [v5 initWithFormat:v9, v6];
  id v8 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v8 setLoadingText:v7];
}

- (void)_configureReservationDetailsError
{
  id v3 = [(RestaurantReservationTableViewController *)self date];
  id v4 = [(RestaurantReservationTableViewController *)self noTablesAvailableTextForDate:v3];
  id v5 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v5 setErrorText:v4];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"reservations_no_tables_action_key" value:@"localized string not found" table:0];
  id v8 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v8 setErrorButtonText:v7];

  id v9 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  id v10 = [(RestaurantReservationTableViewController *)self availableBookings];
  if ([v10 count]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = [(RestaurantReservationTableViewController *)self bookingsLoading] ^ 1;
  }
  [v9 setDisplayError:v11 animated:1];

  id v12 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  [v12 addErrorButtonTouchUpInsideTarget:self action:"changeDateButtonTapped:"];
}

- (void)_configureReservationDetailsTimeSelction
{
  id v3 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  id v9 = [v3 timeSelectionCollectionView];

  id v4 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  id v5 = [v4 timeSelectionCollectionViewLayout];

  [v9 setDataSource:self];
  [v9 setDelegate:self];
  [v9 setAllowsMultipleSelection:0];
  [v9 setAllowsSelection:1];
  [v9 setShowsHorizontalScrollIndicator:0];
  [v9 setLayoutMargins:20.0, 0.0, 0.0, 0.0];
  id v6 = [(RestaurantReservationTableViewController *)self offers];
  BOOL v7 = [v6 count] != 0;

  [(RestaurantReservationTableViewController *)self adjustCollectionViewHeightForOffers:v7 animated:[(RestaurantReservationTableViewController *)self viewHasAppeared]];
  id v8 = [(RestaurantReservationTableViewController *)self dimmableIndexPaths];
  [v5 setDimmableIndexPaths:v8];

  if ([(RestaurantReservationTableViewController *)self bookingsLoading])
  {
    [v5 setDimUnselected:0];
    [v5 invalidateLayout];
  }
}

- (id)dimmableIndexPaths
{
  id v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = self;
  id obj = [(RestaurantReservationTableViewController *)self sectionTitles];
  id v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v4 = 0;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        BOOL v7 = [(RestaurantReservationTableViewController *)v19 availableBookingsBySection];
        id v8 = [v7 objectForKeyedSubscript:v6];

        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v22;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v8);
              }
              if ([*(id *)(*((void *)&v21 + 1) + 8 * (void)j) isBookingAvailable])
              {
                id v14 = +[NSIndexPath indexPathForItem:(char *)j + v11 inSection:v4];
                [v3 addObject:v14];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            v11 += (uint64_t)j;
          }
          while (v10);
        }

        ++v4;
      }
      id v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  id v15 = +[NSSet setWithSet:v3];

  return v15;
}

- (void)adjustCollectionViewHeightForOffers:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    uint64_t v6 = [(RestaurantReservationTableViewController *)self tableView];
    [v6 beginUpdates];

    BOOL v7 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
    [v7 setDisplayOffers:v4];

    id v8 = [(RestaurantReservationTableViewController *)self tableView];
    [v8 endUpdates];
  }
  else
  {
    id v8 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
    [v8 setDisplayOffers:v4];
  }
}

- (id)descriptionTextForDate:(id)a3 partySize:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"reservation_party_size_date_format_key" value:@"localized string not found" table:0];

  id v9 = [(RestaurantReservationTableViewController *)self restaurantTimeZone];
  id v10 = +[NSDate _maps_dayDescriptionStringShortDescription:1 timeZone:v9 bookingDate:v6];

  uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10, a4);

  return v11;
}

- (id)noTablesAvailableTextForDate:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"reservations_no_tables_key" value:@"localized string not found" table:0];

  BOOL v7 = [(RestaurantReservationTableViewController *)self restaurantTimeZone];
  id v8 = +[NSDate _maps_dayDescriptionStringShortDescription:1 timeZone:v7 bookingDate:v4];

  id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);

  return v9;
}

- (BOOL)useAvailableHeight
{
  return 1;
}

- (BOOL)showRemoteView
{
  return 0;
}

- (ContactRequirements)inferredContactRequirements
{
  objc_super v2 = self;
  id v3 = [(RestaurantReservationTableViewController *)self selectedBooking];

  if (v3)
  {
    uint64_t v6 = [(RestaurantReservationTableViewController *)v2 selectedBooking];
    LOBYTE(v4) = [(id)v6 requiresPhoneNumber];

    id v5 = [(RestaurantReservationTableViewController *)v2 selectedBooking];
    LOBYTE(v6) = [v5 requiresName];

    BOOL v7 = [(RestaurantReservationTableViewController *)v2 selectedBooking];
    LOBYTE(v2) = [v7 requiresEmailAddress];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v7 = [(RestaurantReservationTableViewController *)v2 availableBookings];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      LODWORD(v6) = 0;
      LODWORD(v2) = 0;
      int v4 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v4 |= [v12 requiresPhoneNumber];
          LODWORD(v6) = v6 | [v12 requiresName];
          LODWORD(v2) = v2 | [v12 requiresEmailAddress];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    else
    {
      LOBYTE(v6) = 0;
      LOBYTE(v2) = 0;
      LOBYTE(v4) = 0;
    }
  }

  double v13 = [[ContactRequirements alloc] initWithNameRequired:v6 & 1 phoneNumberRequired:v4 & 1 emailAddressRequired:v2 & 1];

  return v13;
}

- (id)timeSuffixForDate:(id)a3
{
  id v4 = a3;
  if ([(RestaurantReservationTableViewController *)self shouldDisplaySuffix])
  {
    id v5 = [(RestaurantReservationTableViewController *)self timeSuffixDateFormatter];
    uint64_t v6 = [v5 stringFromDate:v4];
  }
  else
  {
    uint64_t v6 = &stru_101324E70;
  }

  return v6;
}

- (BOOL)shouldDisplaySuffix
{
  objc_super v2 = +[NSLocale currentLocale];
  id v3 = +[NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:v2];

  LOBYTE(v2) = [v3 rangeOfString:@"a"] != (id)0x7FFFFFFFFFFFFFFFLL;
  return (char)v2;
}

- (NSDateFormatter)timeSelectionDateFormatter
{
  timeSelectionDateFormatter = self->_timeSelectionDateFormatter;
  if (!timeSelectionDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    id v5 = self->_timeSelectionDateFormatter;
    self->_timeSelectionDateFormatter = v4;

    [(NSDateFormatter *)self->_timeSelectionDateFormatter setDateFormat:0];
    [(NSDateFormatter *)self->_timeSelectionDateFormatter setDateStyle:0];
    [(NSDateFormatter *)self->_timeSelectionDateFormatter setTimeStyle:1];
    [(NSDateFormatter *)self->_timeSelectionDateFormatter setAMSymbol:&stru_101324E70];
    [(NSDateFormatter *)self->_timeSelectionDateFormatter setPMSymbol:&stru_101324E70];
    uint64_t v6 = [(RestaurantReservationTableViewController *)self restaurantTimeZone];
    [(NSDateFormatter *)self->_timeSelectionDateFormatter setTimeZone:v6];

    timeSelectionDateFormatter = self->_timeSelectionDateFormatter;
  }

  return timeSelectionDateFormatter;
}

- (NSDateFormatter)timeSuffixDateFormatter
{
  timeSuffixDateFormatter = self->_timeSuffixDateFormatter;
  if (!timeSuffixDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    id v5 = self->_timeSuffixDateFormatter;
    self->_timeSuffixDateFormatter = v4;

    [(NSDateFormatter *)self->_timeSuffixDateFormatter setDateFormat:@"a"];
    uint64_t v6 = [(RestaurantReservationTableViewController *)self restaurantTimeZone];
    [(NSDateFormatter *)self->_timeSuffixDateFormatter setTimeZone:v6];

    timeSuffixDateFormatter = self->_timeSuffixDateFormatter;
  }

  return timeSuffixDateFormatter;
}

- (void)setAvailableBookings:(id)a3
{
  id v12 = a3;
  if ((-[NSArray isEqual:](self->_availableBookings, "isEqual:") & 1) == 0)
  {
    id v5 = [(RestaurantReservationTableViewController *)self sectionTitles];
    id v6 = [v5 count];

    BOOL v7 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v6);
    objc_storeStrong((id *)&self->_availableBookings, a3);
    [(RestaurantReservationTableViewController *)self rebuildCollectionViewSections];
    [(RestaurantReservationTableViewController *)self rebuildOffers];
    id v8 = [(RestaurantReservationTableViewController *)self availableBookings];
    id v9 = [v8 count];

    if (!v9)
    {
      uint64_t v10 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
      uint64_t v11 = [v10 timeSelectionCollectionView];
      [v11 deleteSections:v7];
    }
  }
}

- (void)setBookingsLoading:(BOOL)a3
{
  if (((!self->_bookingsLoading ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    BOOL v5 = !a3;
    if (a3)
    {
      [(RestaurantReservationTableViewController *)self setSelectedOffer:0];
      [(RestaurantReservationTableViewController *)self setSelectedBooking:0];
      id v6 = [(RestaurantReservationTableViewController *)self tableView];
      [v6 setEditing:0 animated:1];

      [(RestaurantReservationTableViewController *)self rebuildOffers];
    }
    self->_bookingsLoading = v3;
    BOOL v7 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
    [(RestaurantReservationTableViewController *)self shouldDisplayContactCellForGuestDisplayPreferences:v7 bookingsLoading:v5];

    id v8 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
    [(RestaurantReservationTableViewController *)self shouldDisplayContactCellForGuestDisplayPreferences:v8 bookingsLoading:v3];

    id v12 = +[NSIndexPath indexPathForRow:[(RestaurantReservationTableViewController *)self reservationContactInfoRow] inSection:[(RestaurantReservationTableViewController *)self reservationDetailsSection]];
    -[RestaurantReservationTableViewController handleCellAppearanceForIndexPath:willDisplay:didDisplay:](self, "handleCellAppearanceForIndexPath:willDisplay:didDisplay:");
    [(RestaurantReservationTableViewController *)self _configureReservationDetails];
    if (!v3)
    {
      id v9 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
      [v9 layoutIfNeeded];

      uint64_t v10 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
      uint64_t v11 = [v10 timeSelectionCollectionView];

      [v11 reloadData];
    }
  }
}

- (void)setBookingPending:(BOOL)a3
{
  if (((!self->_bookingPending ^ a3) & 1) == 0)
  {
    self->_bookingPending = a3;
    [(RestaurantReservationTableViewController *)self configureButton];
  }
}

- (void)setGuest:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_guest] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_guest, a3);
    id v6 = +[NSIndexPath indexPathForRow:[(RestaurantReservationTableViewController *)self reservationContactInfoRow] inSection:[(RestaurantReservationTableViewController *)self reservationDetailsSection]];
    BOOL v7 = [(RestaurantReservationTableViewController *)self tableView];
    id v9 = v6;
    id v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [v7 reloadRowsAtIndexPaths:v8 withRowAnimation:5];

    [(RestaurantReservationTableViewController *)self configureButton];
  }
}

- (void)setGuestDisplayPreferences:(id)a3
{
  id v10 = a3;
  if (([v10 isEqual:self->_guestDisplayPreferences] & 1) == 0)
  {
    id v4 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
    BOOL v5 = [(RestaurantReservationTableViewController *)self shouldDisplayContactCellForGuestDisplayPreferences:v4 bookingsLoading:[(RestaurantReservationTableViewController *)self bookingsLoading]];

    BOOL v6 = [(RestaurantReservationTableViewController *)self shouldDisplayContactCellForGuestDisplayPreferences:v10 bookingsLoading:[(RestaurantReservationTableViewController *)self bookingsLoading]];
    BOOL v7 = (INRestaurantGuestDisplayPreferences *)[v10 copy];
    guestDisplayPreferences = self->_guestDisplayPreferences;
    self->_guestDisplayPreferences = v7;

    id v9 = +[NSIndexPath indexPathForRow:[(RestaurantReservationTableViewController *)self reservationContactInfoRow] inSection:[(RestaurantReservationTableViewController *)self reservationDetailsSection]];
    [(RestaurantReservationTableViewController *)self handleCellAppearanceForIndexPath:v9 willDisplay:v6 didDisplay:v5];
    [(RestaurantReservationTableViewController *)self configureButton];
  }
}

- (void)setSpecialRequestText:(id)a3
{
  id v9 = a3;
  if (([v9 isEqualToString:self->_specialRequestText] & 1) == 0)
  {
    id v4 = (NSString *)[v9 copy];
    specialRequestText = self->_specialRequestText;
    self->_specialRequestText = v4;

    BOOL v6 = +[NSIndexPath indexPathForRow:[(RestaurantReservationTableViewController *)self reservationSpecialRequestRow] inSection:[(RestaurantReservationTableViewController *)self reservationDetailsSection]];
    BOOL v7 = [(RestaurantReservationTableViewController *)self tableView];
    id v8 = [v7 cellForRowAtIndexPath:v6];

    [(RestaurantReservationTableViewController *)self configureSpecialRequestTextCell:v8];
  }
}

- (void)setRestaurantDescriptionText:(id)a3 keepExisting:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if ((!a4 || [v6 length] || !-[NSString length](self->_restaurantDescriptionText, "length"))
    && ([v7 isEqual:self->_restaurantDescriptionText] & 1) == 0)
  {
    id v8 = (NSString *)[v7 copy];
    restaurantDescriptionText = self->_restaurantDescriptionText;
    self->_restaurantDescriptionText = v8;

    id v10 = [(RestaurantReservationTableViewController *)self tableView];
    uint64_t v11 = +[NSIndexPath indexPathForRow:0 inSection:[(RestaurantReservationTableViewController *)self headerSection]];
    double v13 = v11;
    id v12 = +[NSArray arrayWithObjects:&v13 count:1];
    [v10 reloadRowsAtIndexPaths:v12 withRowAnimation:0];
  }
}

- (void)setRestaurantDescriptionText:(id)a3
{
}

- (void)setDate:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToDate:self->_date] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_date, a3);
    id v6 = [(RestaurantReservationTableViewController *)self tableView];
    BOOL v7 = [(RestaurantReservationTableViewController *)self reservationDetailsIndexPath];
    id v9 = v7;
    id v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [v6 reloadRowsAtIndexPaths:v8 withRowAnimation:0];
  }
}

- (void)setPartySize:(unint64_t)a3
{
  if (self->_partySize != a3)
  {
    self->_partySize = a3;
    id v4 = [(RestaurantReservationTableViewController *)self tableView];
    id v5 = [(RestaurantReservationTableViewController *)self reservationDetailsIndexPath];
    BOOL v7 = v5;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v4 reloadRowsAtIndexPaths:v6 withRowAnimation:0];
  }
}

- (id)reservationDetailsIndexPath
{
  int64_t v2 = [(RestaurantReservationTableViewController *)self headerSection];

  return +[NSIndexPath indexPathForRow:1 inSection:v2];
}

- (void)setTermsAndConditions:(id)a3
{
  id v7 = a3;
  if ((-[INTermsAndConditions isEqual:](self->_termsAndConditions, "isEqual:") & 1) == 0)
  {
    BOOL v4 = [(RestaurantReservationTableViewController *)self shouldDisplayTermsAndConditions];
    id v5 = (INTermsAndConditions *)[v7 copy];
    termsAndConditions = self->_termsAndConditions;
    self->_termsAndConditions = v5;

    [(RestaurantReservationTableViewController *)self handleSectionAppearanceForSection:[(RestaurantReservationTableViewController *)self termsAndConditionsSection] willDisplay:[(RestaurantReservationTableViewController *)self shouldDisplayTermsAndConditions] didDisplay:v4];
  }
}

- (void)setRestaurantAdvisementText:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_restaurantAdvisementText] & 1) == 0)
  {
    BOOL v4 = [(RestaurantReservationTableViewController *)self shouldDisplayAdvisementSection];
    id v5 = (NSString *)[v7 copy];
    restaurantAdvisementText = self->_restaurantAdvisementText;
    self->_restaurantAdvisementText = v5;

    [(RestaurantReservationTableViewController *)self handleSectionAppearanceForSection:[(RestaurantReservationTableViewController *)self advisementSection] willDisplay:[(RestaurantReservationTableViewController *)self shouldDisplayAdvisementSection] didDisplay:v4];
  }
}

- (void)handleCellAppearanceForIndexPath:(id)a3 willDisplay:(BOOL)a4 didDisplay:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v6 || v5)
  {
    id v9 = [(RestaurantReservationTableViewController *)self tableView];
    [v9 beginUpdates];

    int v10 = !v6;
    int v11 = !v5;
    if (v6 && (v11 & 1) == 0)
    {
      id v12 = [(RestaurantReservationTableViewController *)self tableView];
      id v21 = v8;
      double v13 = +[NSArray arrayWithObjects:&v21 count:1];
      [v12 reloadRowsAtIndexPaths:v13 withRowAnimation:5];
    }
    if (((v11 | v6) & 1) == 0)
    {
      id v14 = [(RestaurantReservationTableViewController *)self tableView];
      id v20 = v8;
      long long v15 = +[NSArray arrayWithObjects:&v20 count:1];
      [v14 deleteRowsAtIndexPaths:v15 withRowAnimation:0];
    }
    if (((v10 | v5) & 1) == 0)
    {
      long long v16 = [(RestaurantReservationTableViewController *)self tableView];
      id v19 = v8;
      long long v17 = +[NSArray arrayWithObjects:&v19 count:1];
      [v16 insertRowsAtIndexPaths:v17 withRowAnimation:3];
    }
    long long v18 = [(RestaurantReservationTableViewController *)self tableView];
    [v18 endUpdates];
  }
}

- (void)handleSectionAppearanceForSection:(int64_t)a3 willDisplay:(BOOL)a4 didDisplay:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (a4 || a5)
  {
    id v9 = [(RestaurantReservationTableViewController *)self tableView];
    [v9 beginUpdates];

    id v16 = +[NSIndexSet indexSetWithIndex:a3];
    int v10 = !v6;
    int v11 = !v5;
    if (v6 && (v11 & 1) == 0)
    {
      id v12 = [(RestaurantReservationTableViewController *)self tableView];
      [v12 reloadSections:v16 withRowAnimation:5];
    }
    if (((v11 | v6) & 1) == 0)
    {
      double v13 = [(RestaurantReservationTableViewController *)self tableView];
      [v13 deleteSections:v16 withRowAnimation:0];
    }
    if (((v10 | v5) & 1) == 0)
    {
      id v14 = [(RestaurantReservationTableViewController *)self tableView];
      [v14 insertSections:v16 withRowAnimation:3];
    }
    long long v15 = [(RestaurantReservationTableViewController *)self tableView];
    [v15 endUpdates];
  }
}

- (void)rebuildOffers
{
  int64_t v2 = self;
  long long v27 = [(RestaurantReservationTableViewController *)self offers];
  BOOL v3 = +[NSMutableArray array];
  BOOL v4 = objc_opt_new();
  [(RestaurantReservationTableViewController *)v2 setSelectedOffer:0];
  BOOL v5 = [(RestaurantReservationTableViewController *)v2 selectedBooking];

  if (v5)
  {
    BOOL v6 = [(RestaurantReservationTableViewController *)v2 selectedBooking];
    id v7 = [v6 offers];
    [v3 addObjectsFromArray:v7];

    id v8 = [(RestaurantReservationTableViewController *)v2 selectedBooking];
    id v9 = [v8 offers];
    id v10 = [v9 count];

    if (v10)
    {
      int v11 = [(RestaurantReservationTableViewController *)v2 noOfferOffer];
      [v3 addObject:v11];
    }
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v26 = v2;
    id obj = [(RestaurantReservationTableViewController *)v2 availableBookings];
    id v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      uint64_t v28 = *(void *)v36;
      do
      {
        long long v15 = 0;
        id v29 = v13;
        do
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v15);
          if ([v16 isBookingAvailable])
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v17 = [v16 offers];
            id v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v32;
              do
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(void *)v32 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  long long v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                  long long v23 = [v22 offerTitleText];
                  unsigned __int8 v24 = [v4 containsObject:v23];

                  if ((v24 & 1) == 0)
                  {
                    [v3 addObject:v22];
                    long long v25 = [v22 offerTitleText];
                    [v4 addObject:v25];
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v19);
            }

            uint64_t v14 = v28;
            id v13 = v29;
          }
          long long v15 = (char *)v15 + 1;
        }
        while (v15 != v13);
        id v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v13);
    }

    int64_t v2 = v26;
  }
  [(RestaurantReservationTableViewController *)v2 rebuildOffersNewOffers:v3 oldOffers:v27];
}

- (void)rebuildOffersNewOffers:(id)a3 oldOffers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mutableCopy];
  v52 = self;
  [(RestaurantReservationTableViewController *)self setOffers:v8];

  if ([v6 count]) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = [v7 count] != 0;
  }
  if ([v6 count] && !objc_msgSend(v7, "count"))
  {
    id v10 = v52;
    [(RestaurantReservationTableViewController *)v52 updateHeightCacheForOffersSectionInsertion];
    v45 = [(RestaurantReservationTableViewController *)v52 tableView];
    [v45 beginUpdates];

    id v12 = [(RestaurantReservationTableViewController *)v52 tableView];
    id v13 = +[NSIndexSet indexSetWithIndex:[(RestaurantReservationTableViewController *)v52 offersSection]];
    [v12 insertSections:v13 withRowAnimation:3];
    goto LABEL_33;
  }
  if (v9)
  {
    id v10 = v52;
    [(RestaurantReservationTableViewController *)v52 updateHeightCacheForOffersSectionDeletion];
    int v11 = [(RestaurantReservationTableViewController *)v52 tableView];
    [v11 beginUpdates];

    id v12 = [(RestaurantReservationTableViewController *)v52 tableView];
    id v13 = +[NSIndexSet indexSetWithIndex:[(RestaurantReservationTableViewController *)v52 offersSection]];
    [v12 deleteSections:v13 withRowAnimation:0];
LABEL_33:

    id v46 = [(RestaurantReservationTableViewController *)v10 tableView];
    [v46 endUpdates];

    goto LABEL_34;
  }
  uint64_t v14 = objc_opt_new();
  long long v15 = objc_opt_new();
  id v48 = objc_opt_new();
  id v50 = v6;
  v51 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v66;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)v20) offerTitleText];
        [v14 addObject:v21];

        uint64_t v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v18);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v22 = v7;
  id v23 = [v22 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v62;
    do
    {
      long long v26 = 0;
      do
      {
        if (*(void *)v62 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)v26) offerTitleText];
        [v15 addObject:v27];

        long long v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v24);
  }
  id v47 = v16;
  id v49 = v7;

  uint64_t v28 = (char *)[v22 count];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v29 = [v22 reverseObjectEnumerator];
  id v30 = [v29 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v58;
    do
    {
      long long v33 = 0;
      do
      {
        if (*(void *)v58 != v32) {
          objc_enumerationMutation(v29);
        }
        long long v34 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)v33) offerTitleText];
        unsigned __int8 v35 = [v14 containsObject:v34];

        if ((v35 & 1) == 0)
        {
          long long v36 = +[NSIndexPath indexPathForRow:v28 inSection:[(RestaurantReservationTableViewController *)v52 offersSection]];
          long long v37 = [(RestaurantReservationTableViewController *)v52 heightCache];
          [v37 removeObjectForKey:v36];

          [v51 addObject:v36];
        }
        long long v33 = (char *)v33 + 1;
        --v28;
      }
      while (v31 != v33);
      id v31 = [v29 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v31);
  }

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100C7AC48;
  v55[3] = &unk_10131D550;
  id v56 = v15;
  id v38 = v15;
  v39 = [v47 indexesOfObjectsPassingTest:v55];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100C7AC90;
  v53[3] = &unk_10131D578;
  v53[4] = v52;
  id v54 = v48;
  id v40 = v48;
  [v39 enumerateIndexesUsingBlock:v53];
  long long v41 = [(RestaurantReservationTableViewController *)v52 tableView];
  [v41 beginUpdates];

  long long v42 = [(RestaurantReservationTableViewController *)v52 tableView];
  [v42 insertRowsAtIndexPaths:v40 withRowAnimation:3];

  long long v43 = [(RestaurantReservationTableViewController *)v52 tableView];
  [v43 deleteRowsAtIndexPaths:v51 withRowAnimation:0];

  long long v44 = [(RestaurantReservationTableViewController *)v52 tableView];
  [v44 endUpdates];

  id v7 = v49;
  id v6 = v50;
LABEL_34:
}

- (void)updateHeightCacheForOffersSectionInsertion
{
  BOOL v3 = [(RestaurantReservationTableViewController *)self heightCache];
  BOOL v4 = [v3 allKeys];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = [v10 section];
        if (v11 == (id)[(RestaurantReservationTableViewController *)self offersSection])
        {
          id v12 = [NSIndexPath indexPathForRow:[v10 row] inSection:[v10 section] + 1];
          id v13 = [(RestaurantReservationTableViewController *)self heightCache];
          uint64_t v14 = [v13 objectForKeyedSubscript:v10];
          long long v15 = [(RestaurantReservationTableViewController *)self heightCache];
          [v15 setObject:v14 forKeyedSubscript:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  id v16 = [(RestaurantReservationTableViewController *)self offersRowHeight];

  if (v16)
  {
    id v17 = [(RestaurantReservationTableViewController *)self offers];
    id v18 = [v17 count];

    if (v18)
    {
      unint64_t v19 = 0;
      do
      {
        uint64_t v20 = +[NSIndexPath indexPathForRow:v19 inSection:[(RestaurantReservationTableViewController *)self offersSection]];
        id v21 = [(RestaurantReservationTableViewController *)self offersRowHeight];
        id v22 = [(RestaurantReservationTableViewController *)self heightCache];
        [v22 setObject:v21 forKeyedSubscript:v20];

        ++v19;
        id v23 = [(RestaurantReservationTableViewController *)self offers];
        id v24 = [v23 count];
      }
      while (v19 < (unint64_t)v24);
    }
  }
}

- (void)updateHeightCacheForOffersSectionDeletion
{
  BOOL v3 = [(RestaurantReservationTableViewController *)self heightCache];
  BOOL v4 = [v3 allKeys];

  id v5 = [(RestaurantReservationTableViewController *)self heightCache];
  id v6 = [v5 allKeys];
  id v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v14 = [v13 section];
        if (v14 == (id)[(RestaurantReservationTableViewController *)self offersSection])
        {
          long long v15 = [(RestaurantReservationTableViewController *)self heightCache];
          [v15 removeObjectForKey:v13];
        }
        else
        {
          id v16 = (char *)[v13 section];
          if (v16 != (char *)[(RestaurantReservationTableViewController *)self offersSection] + 1) {
            continue;
          }
          long long v15 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v13 row], (char *)objc_msgSend(v13, "row") - 1);
          id v17 = [(RestaurantReservationTableViewController *)self heightCache];
          id v18 = [v17 objectForKeyedSubscript:v13];
          [v7 setObject:v18 forKeyedSubscript:v15];

          unint64_t v19 = [(RestaurantReservationTableViewController *)self heightCache];
          [v19 removeObjectForKey:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  uint64_t v20 = [v7 allKeys];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
        long long v27 = [v7 objectForKeyedSubscript:v26];
        long long v28 = [(RestaurantReservationTableViewController *)self heightCache];
        [v28 setObject:v27 forKeyedSubscript:v26];
      }
      id v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }
}

- (id)noOfferOffer
{
  id v2 = objc_alloc_init((Class)INRestaurantOffer);
  BOOL v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"reservation_no_offer_key" value:@"localized string not found" table:0];
  [v2 setOfferTitleText:v4];

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"reservation_no_offer_detail_key" value:@"localized string not found" table:0];
  [v2 setOfferDetailText:v6];

  [v2 setOfferIdentifier:&stru_101324E70];

  return v2;
}

- (void)changeDateButtonTapped:(id)a3
{
  BOOL v4 = [(RestaurantReservationTableViewController *)self analyticsCaptor];
  [v4 captureSelectTimeEditBooking];

  id v5 = [(RestaurantReservationTableViewController *)self delegate];
  [v5 bookingSelectionViewControllerDidSelectDateRefinement:0];
}

- (void)rebuildCollectionViewSections
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"bookingDate" ascending:1];
  id v6 = [(RestaurantReservationTableViewController *)self availableBookings];
  uint64_t v20 = v5;
  id v26 = v5;
  id v7 = +[NSArray arrayWithObjects:&v26 count:1];
  id v8 = [v6 sortedArrayUsingDescriptors:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v15 = [v14 bookingDate];
        id v16 = [(RestaurantReservationTableViewController *)self timeSuffixForDate:v15];

        id v17 = [v3 objectForKeyedSubscript:v16];
        if (!v17)
        {
          id v17 = objc_opt_new();
          [v3 setObject:v17 forKeyedSubscript:v16];
          [v4 addObject:v16];
        }
        [v17 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v18 = +[NSDictionary dictionaryWithDictionary:v3];
  [(RestaurantReservationTableViewController *)self setAvailableBookingsBySection:v18];

  unint64_t v19 = +[NSArray arrayWithArray:v4];
  [(RestaurantReservationTableViewController *)self setSectionTitles:v19];
}

- (int64_t)headerSection
{
  return 0;
}

- (int64_t)advisementSection
{
  return [(RestaurantReservationTableViewController *)self headerSection] + 1;
}

- (int64_t)offersSection
{
  if ([(RestaurantReservationTableViewController *)self shouldDisplayAdvisementSection])
  {
    return [(RestaurantReservationTableViewController *)self advisementSection] + 1;
  }
  else
  {
    return 1;
  }
}

- (int64_t)reservationDetailsSection
{
  if ([(RestaurantReservationTableViewController *)self shouldDisplayOffersSection])
  {
    int64_t v3 = [(RestaurantReservationTableViewController *)self offersSection];
  }
  else if ([(RestaurantReservationTableViewController *)self shouldDisplayAdvisementSection])
  {
    int64_t v3 = [(RestaurantReservationTableViewController *)self advisementSection];
  }
  else
  {
    int64_t v3 = [(RestaurantReservationTableViewController *)self headerSection];
  }
  return v3 + 1;
}

- (int64_t)termsAndConditionsSection
{
  return [(RestaurantReservationTableViewController *)self reservationDetailsSection] + 1;
}

- (int64_t)openAppSection
{
  if ([(RestaurantReservationTableViewController *)self shouldDisplayTermsAndConditions])
  {
    int64_t v3 = [(RestaurantReservationTableViewController *)self termsAndConditionsSection];
  }
  else
  {
    int64_t v3 = [(RestaurantReservationTableViewController *)self reservationDetailsSection];
  }
  return v3 + 1;
}

- (int64_t)numberOfRowsInOffersSection
{
  if (![(RestaurantReservationTableViewController *)self shouldDisplayOffersSection]) {
    return 0;
  }
  int64_t v3 = [(RestaurantReservationTableViewController *)self offers];
  BOOL v4 = (char *)[v3 count] + 1;

  return (int64_t)v4;
}

- (int64_t)numberOfRowsInDetailsSection
{
  if ([(RestaurantReservationTableViewController *)self shouldDisplayContactCell]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)reservationContactInfoRow
{
  return 0;
}

- (int64_t)reservationSpecialRequestRow
{
  return [(RestaurantReservationTableViewController *)self shouldDisplayContactCell];
}

- (int64_t)openAppRow
{
  if ([(RestaurantReservationTableViewController *)self shouldDisplayContactCell]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)numberOfOptionalSections
{
  LODWORD(v3) = [(RestaurantReservationTableViewController *)self shouldDisplayAdvisementSection];
  unsigned int v4 = [(RestaurantReservationTableViewController *)self shouldDisplayOffersSection];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  if (v4) {
    uint64_t v3 = v5;
  }
  else {
    uint64_t v3 = v3;
  }
  return v3
       + [(RestaurantReservationTableViewController *)self shouldDisplayTermsAndConditions];
}

- (int64_t)numberOfNonOptionalSections
{
  return 3;
}

- (BOOL)shouldDisplayAdvisementSection
{
  id v2 = [(RestaurantReservationTableViewController *)self restaurantAdvisementText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)shouldDisplayOffersSection
{
  id v2 = [(RestaurantReservationTableViewController *)self offers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)shouldDisplayTermsAndConditions
{
  id v2 = [(RestaurantReservationTableViewController *)self termsAndConditions];
  BOOL v3 = [v2 localizedTermsAndConditionsText];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)shouldDisplayContactCell
{
  id v2 = self;
  BOOL v3 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
  LOBYTE(v2) = [(RestaurantReservationTableViewController *)v2 shouldDisplayContactCellForGuestDisplayPreferences:v3 bookingsLoading:[(RestaurantReservationTableViewController *)v2 bookingsLoading]];

  return (char)v2;
}

- (BOOL)shouldDisplayContactCellForGuestDisplayPreferences:(id)a3 bookingsLoading:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    unsigned __int8 v7 = 0;
  }
  else if (!v5 {
         || ([v5 nameFieldShouldBeDisplayed] & 1) != 0
  }
         || ([v6 phoneNumberFieldShouldBeDisplayed] & 1) != 0)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = [v6 emailAddressFieldShouldBeDisplayed];
  }

  return v7;
}

- (BOOL)requirements:(id)a3 satisfiableWithDisplayPreferences:(id)a4 guest:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 nameRequired] && !objc_msgSend(v8, "nameFieldShouldBeDisplayed")) {
    goto LABEL_23;
  }
  if ([v7 nameRequired])
  {
    id v10 = [v9 nameComponents];
    if (v10 || ([v8 nameFieldShouldBeDisplayed] & 1) == 0)
    {
    }
    else if (![v8 nameEditable])
    {
LABEL_23:
      unsigned __int8 v13 = 0;
      goto LABEL_26;
    }
  }
  if ([v7 phoneNumberRequired]
    && ![v8 phoneNumberFieldShouldBeDisplayed])
  {
    goto LABEL_23;
  }
  if ([v7 phoneNumberRequired])
  {
    id v11 = [v9 phoneNumber];
    if (v11 || ([v8 phoneNumberFieldShouldBeDisplayed] & 1) == 0)
    {
    }
    else if (![v8 phoneNumberEditable])
    {
      goto LABEL_23;
    }
  }
  if ([v7 emailAddressRequired]
    && ![v8 emailAddressFieldShouldBeDisplayed])
  {
    goto LABEL_23;
  }
  if (![v7 emailAddressRequired])
  {
LABEL_25:
    unsigned __int8 v13 = 1;
    goto LABEL_26;
  }
  uint64_t v12 = [v9 emailAddress];
  if (v12 || ([v8 emailAddressFieldShouldBeDisplayed] & 1) == 0)
  {

    goto LABEL_25;
  }
  unsigned __int8 v13 = [v8 emailAddressEditable];
LABEL_26:

  return v13;
}

- (BOOL)contactRequirementsSatisfiable
{
  id v2 = self;
  BOOL v3 = [(RestaurantReservationTableViewController *)self inferredContactRequirements];
  BOOL v4 = [(RestaurantReservationTableViewController *)v2 guestDisplayPreferences];
  id v5 = [(RestaurantReservationTableViewController *)v2 guest];
  LOBYTE(v2) = [(RestaurantReservationTableViewController *)v2 requirements:v3 satisfiableWithDisplayPreferences:v4 guest:v5];

  return (char)v2;
}

- (id)contactDisplayStringSatisfied:(BOOL *)a3
{
  id v5 = [(RestaurantReservationTableViewController *)self inferredContactRequirements];
  id v6 = [(RestaurantReservationTableViewController *)self guest];
  id v7 = [v6 nameComponents];
  v51 = a3;
  if (v7)
  {
    id v8 = [(RestaurantReservationTableViewController *)self guest];
    id v9 = [v8 nameComponents];
    id v10 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v9 style:0 options:0];
  }
  else
  {
    id v10 = &stru_101324E70;
  }

  id v11 = [(RestaurantReservationTableViewController *)self guest];
  uint64_t v12 = [v11 phoneNumber];

  unsigned __int8 v13 = [(RestaurantReservationTableViewController *)self guest];
  uint64_t v50 = [v13 emailAddress];

  id v14 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
  unsigned int v15 = [v14 nameFieldFirstNameOptional];

  id v16 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
  uint64_t v17 = (uint64_t)[v16 nameFieldLastNameOptional];

  if ([v5 nameRequired]) {
    int v18 = v17 & ~v15;
  }
  else {
    int v18 = v17;
  }
  char v19 = [v5 nameRequired] ^ 1 | v15;
  if (v19)
  {
    if (([v5 nameRequired] ^ 1 | v18))
    {
      BOOL v20 = 0;
      long long v21 = (void *)v50;
      goto LABEL_18;
    }
LABEL_16:
    [(RestaurantReservationTableViewController *)self guest];
    long long v24 = v5;
    id v26 = v25 = v10;
    long long v27 = [v26 nameComponents];
    [v27 familyName];
    long long v29 = v28 = v12;
    BOOL v20 = [v29 length] == 0;

    uint64_t v12 = v28;
    id v10 = v25;
    id v5 = v24;
    long long v21 = (void *)v50;
    long long v22 = v48;
    if (v19) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  long long v22 = [(RestaurantReservationTableViewController *)self guest];
  long long v23 = [v22 nameComponents];
  uint64_t v17 = [v23 givenName];
  id v49 = v23;
  if ([(id)v17 length])
  {
    if ((([v5 nameRequired] ^ 1 | v18) & 1) == 0)
    {
      id v47 = v22;
      goto LABEL_16;
    }
    BOOL v20 = 0;
  }
  else
  {
    BOOL v20 = 1;
  }
  long long v21 = (void *)v50;
LABEL_17:

LABEL_18:
  if ([v5 phoneNumberRequired]) {
    BOOL v30 = [v12 length] == 0;
  }
  else {
    BOOL v30 = 0;
  }
  if ([v5 emailAddressRequired])
  {
    BOOL v31 = [v21 length] == 0;
    if (!v20) {
      goto LABEL_23;
    }
LABEL_29:
    BOOL *v51 = 0;
    if (!v30 && !v31)
    {
      long long v33 = +[NSBundle mainBundle];
      long long v34 = v33;
      CFStringRef v35 = @"reservation_name_required_key";
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  BOOL v31 = 0;
  if (v20) {
    goto LABEL_29;
  }
LABEL_23:
  BOOL *v51 = !v30 && !v31;
  if (v30 && !v31)
  {
    long long v33 = +[NSBundle mainBundle];
    long long v34 = v33;
    CFStringRef v35 = @"reservation_phone_required_key";
    goto LABEL_34;
  }
  if (!v30 && v31)
  {
    long long v33 = +[NSBundle mainBundle];
    long long v34 = v33;
    CFStringRef v35 = @"reservation_email_required_key";
    goto LABEL_34;
  }
  if (v30 || v31)
  {
LABEL_30:
    long long v33 = +[NSBundle mainBundle];
    long long v34 = v33;
    CFStringRef v35 = @"reservation_multiple_required_key";
LABEL_34:
    long long v36 = [v33 localizedStringForKey:v35 value:@"localized string not found" table:0];

    goto LABEL_35;
  }
  if ([v5 nameRequired])
  {
    long long v32 = v10;
LABEL_42:
    long long v36 = v32;
    goto LABEL_35;
  }
  if ([v5 emailAddressRequired])
  {
    long long v32 = v21;
    goto LABEL_42;
  }
  if ([v5 phoneNumberRequired])
  {
LABEL_41:
    long long v32 = v12;
    goto LABEL_42;
  }
  id v38 = v12;
  if ([(__CFString *)v10 length]
    && ([(RestaurantReservationTableViewController *)self guestDisplayPreferences],
        v39 = objc_claimAutoreleasedReturnValue(),
        unsigned int v40 = [v39 nameFieldShouldBeDisplayed],
        v39,
        v40))
  {
    long long v41 = v10;
  }
  else
  {
    if ([v38 length])
    {
      long long v42 = [(RestaurantReservationTableViewController *)self guestDisplayPreferences];
      unsigned int v43 = [v42 phoneNumberFieldShouldBeDisplayed];

      if (v43)
      {
        uint64_t v12 = v38;
        goto LABEL_41;
      }
    }
    if (![v21 length]
      || ([(RestaurantReservationTableViewController *)self guestDisplayPreferences],
          long long v44 = objc_claimAutoreleasedReturnValue(),
          unsigned int v45 = [v44 emailAddressFieldShouldBeDisplayed],
          v44,
          !v45))
    {
      id v46 = +[NSBundle mainBundle];
      long long v36 = [v46 localizedStringForKey:@"reservation_none_key" value:@"localized string not found" table:0];

      goto LABEL_54;
    }
    long long v41 = v21;
  }
  long long v36 = v41;
LABEL_54:
  uint64_t v12 = v38;
LABEL_35:

  return v36;
}

- (id)contactDisplayColorSatisfied:(BOOL)a3
{
  if (a3) {
    +[UIColor systemGrayColor];
  }
  else {
  BOOL v3 = +[UIColor redColor];
  }

  return v3;
}

- (BOOL)useExtensionFlowHeader
{
  return 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v7 = a3;
  id v8 = [(RestaurantReservationTableViewController *)self reservationDetailCell];
  id v9 = [v8 timeSelectionCollectionView];

  if (v9 == v7)
  {
    [(RestaurantReservationAnalyticsBookingSession *)self->_analyticsBookingSession setSwipedAvailableTimes:1];
    if (x <= 0.0) {
      uint64_t v10 = 12;
    }
    else {
      uint64_t v10 = 13;
    }
    id v11 = +[MKMapService sharedService];
    [v11 captureUserAction:v10 onTarget:633 eventValue:0];
  }
}

- (INRestaurantReservationBooking)selectedBooking
{
  return self->_selectedBooking;
}

- (void)setSelectedBooking:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)partySize
{
  return self->_partySize;
}

- (RestaurantReservationTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RestaurantReservationTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)availableBookings
{
  return self->_availableBookings;
}

- (NSString)restaurantName
{
  return self->_restaurantName;
}

- (void)setRestaurantName:(id)a3
{
}

- (NSTimeZone)restaurantTimeZone
{
  return self->_restaurantTimeZone;
}

- (void)setRestaurantTimeZone:(id)a3
{
}

- (NSString)restaurantDescriptionText
{
  return self->_restaurantDescriptionText;
}

- (NSString)restaurantAdvisementText
{
  return self->_restaurantAdvisementText;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences
{
  return self->_guestDisplayPreferences;
}

- (INTermsAndConditions)termsAndConditions
{
  return self->_termsAndConditions;
}

- (NSString)specialRequestText
{
  return self->_specialRequestText;
}

- (BOOL)useTruncatedAdvisement
{
  return self->_useTruncatedAdvisement;
}

- (void)setUseTruncatedAdvisement:(BOOL)a3
{
  self->_useTruncatedAdvisement = a3;
}

- (BOOL)guestLoading
{
  return self->_guestLoading;
}

- (void)setGuestLoading:(BOOL)a3
{
  self->_guestLoading = a3;
}

- (BOOL)bookingsLoading
{
  return self->_bookingsLoading;
}

- (BOOL)bookingPending
{
  return self->_bookingPending;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (RestaurantReservationTableViewCell)reservationDetailCell
{
  return self->_reservationDetailCell;
}

- (void)setReservationDetailCell:(id)a3
{
}

- (NSDictionary)availableBookingsBySection
{
  return self->_availableBookingsBySection;
}

- (void)setAvailableBookingsBySection:(id)a3
{
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
}

- (void)setTimeSuffixDateFormatter:(id)a3
{
}

- (void)setTimeSelectionDateFormatter:(id)a3
{
}

- (RestaurantReservationRequestController)restaurantReservationRequestController
{
  return self->_restaurantReservationRequestController;
}

- (void)setRestaurantReservationRequestController:(id)a3
{
}

- (NSMutableArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
}

- (NSMutableSet)offersSet
{
  return self->_offersSet;
}

- (void)setOffersSet:(id)a3
{
}

- (INRestaurantOffer)selectedOffer
{
  return self->_selectedOffer;
}

- (void)setSelectedOffer:(id)a3
{
}

- (NSString)formerSelection
{
  return self->_formerSelection;
}

- (void)setFormerSelection:(id)a3
{
}

- (BOOL)emailPreferenceAllowEmails
{
  return self->_emailPreferenceAllowEmails;
}

- (void)setEmailPreferenceAllowEmails:(BOOL)a3
{
  self->_emailPreferenceAllowEmails = a3;
}

- (ReservationButtonView)footerButtonView
{
  return self->_footerButtonView;
}

- (void)setFooterButtonView:(id)a3
{
}

- (NSMutableDictionary)heightCache
{
  return self->_heightCache;
}

- (void)setHeightCache:(id)a3
{
}

- (NSNumber)offersRowHeight
{
  return self->_offersRowHeight;
}

- (void)setOffersRowHeight:(id)a3
{
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
}

- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_offersRowHeight, 0);
  objc_storeStrong((id *)&self->_heightCache, 0);
  objc_storeStrong((id *)&self->_footerButtonView, 0);
  objc_storeStrong((id *)&self->_formerSelection, 0);
  objc_storeStrong((id *)&self->_selectedOffer, 0);
  objc_storeStrong((id *)&self->_offersSet, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_restaurantReservationRequestController, 0);
  objc_storeStrong((id *)&self->_timeSelectionDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeSuffixDateFormatter, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_availableBookingsBySection, 0);
  objc_storeStrong((id *)&self->_reservationDetailCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_specialRequestText, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
  objc_storeStrong((id *)&self->_guestDisplayPreferences, 0);
  objc_storeStrong((id *)&self->_guest, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_restaurantAdvisementText, 0);
  objc_storeStrong((id *)&self->_restaurantDescriptionText, 0);
  objc_storeStrong((id *)&self->_restaurantTimeZone, 0);
  objc_storeStrong((id *)&self->_restaurantName, 0);
  objc_storeStrong((id *)&self->_availableBookings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_selectedBooking, 0);
}

@end