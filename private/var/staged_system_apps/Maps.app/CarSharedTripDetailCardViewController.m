@interface CarSharedTripDetailCardViewController
- (BOOL)_updateWithTrip:(id)a3;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (CarSharedTripDetailCardViewController)initWithSharedTrip:(id)a3 delegate:(id)a4;
- (GEOSharedNavState)sharedTrip;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (void)_directionsButtonPressed:(id)a3;
- (void)_refreshSubscriptionToken;
- (void)_setupConstraints;
- (void)_updateContent;
- (void)_updateDirectionsButtonVisibility;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4;
- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CarSharedTripDetailCardViewController

- (void)dealloc
{
  v3 = +[MKLocationManager sharedLocationManager];
  [v3 stopListeningForLocationUpdates:self];

  v4.receiver = self;
  v4.super_class = (Class)CarSharedTripDetailCardViewController;
  [(CarSharedTripDetailCardViewController *)&v4 dealloc];
}

- (CarSharedTripDetailCardViewController)initWithSharedTrip:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CarSharedTripDetailCardViewController;
  v9 = [(CarSharedTripDetailCardViewController *)&v13 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharedTrip, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = +[MKLocationManager sharedLocationManager];
    [v11 listenForLocationUpdates:v10];
  }
  return v10;
}

- (void)viewDidLoad
{
  v51.receiver = self;
  v51.super_class = (Class)CarSharedTripDetailCardViewController;
  [(CarSharedTripDetailCardViewController *)&v51 viewDidLoad];
  v3 = [(CarSharedTripDetailCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarSharedTripDetailCard"];

  id v4 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
  handleLabel = self->_handleLabel;
  self->_handleLabel = v8;

  [(UILabel *)self->_handleLabel setAccessibilityIdentifier:@"HandleLabel"];
  [(UILabel *)self->_handleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = +[UIFont systemFontOfSize:12.0];
  [(UILabel *)self->_handleLabel setFont:v10];

  v11 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_handleLabel setTextColor:v11];

  [(UILabel *)self->_handleLabel setNumberOfLines:1];
  [(UILabel *)self->_handleLabel setLineBreakMode:5];
  LODWORD(v12) = 1148846080;
  [(UILabel *)self->_handleLabel setContentHuggingPriority:1 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [(UILabel *)self->_handleLabel setContentCompressionResistancePriority:1 forAxis:v13];
  v14 = [(CarSharedTripDetailCardViewController *)self view];
  [v14 addSubview:self->_handleLabel];

  v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  etaLabel = self->_etaLabel;
  self->_etaLabel = v15;

  [(UILabel *)self->_etaLabel setAccessibilityIdentifier:@"ETALabel"];
  [(UILabel *)self->_etaLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = +[UIFont systemFontOfSize:12.0];
  [(UILabel *)self->_etaLabel setFont:v17];

  v18 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_etaLabel setTextColor:v18];

  [(UILabel *)self->_etaLabel setNumberOfLines:0];
  LODWORD(v19) = 1148846080;
  [(UILabel *)self->_etaLabel setContentHuggingPriority:1 forAxis:v19];
  LODWORD(v20) = 1148846080;
  [(UILabel *)self->_etaLabel setContentCompressionResistancePriority:1 forAxis:v20];
  v21 = [(CarSharedTripDetailCardViewController *)self view];
  [v21 addSubview:self->_etaLabel];

  v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  destinationLabel = self->_destinationLabel;
  self->_destinationLabel = v22;

  [(UILabel *)self->_destinationLabel setAccessibilityIdentifier:@"DestinationLabel"];
  [(UILabel *)self->_destinationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = +[UIFont systemFontOfSize:12.0];
  [(UILabel *)self->_destinationLabel setFont:v24];

  v25 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_destinationLabel setTextColor:v25];

  [(UILabel *)self->_destinationLabel setNumberOfLines:5];
  [(UILabel *)self->_destinationLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_destinationLabel setMinimumScaleFactor:0.833333333];
  LODWORD(v26) = 1148846080;
  [(UILabel *)self->_destinationLabel setContentHuggingPriority:1 forAxis:v26];
  LODWORD(v27) = 1148829696;
  [(UILabel *)self->_destinationLabel setContentCompressionResistancePriority:1 forAxis:v27];
  v28 = [(CarSharedTripDetailCardViewController *)self view];
  [v28 addSubview:self->_destinationLabel];

  v29 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  directionsButton = self->_directionsButton;
  self->_directionsButton = &v29->super;

  [(CarFocusableButton *)self->_directionsButton setAccessibilityIdentifier:@"DirectionsButton"];
  [(CarFocusableButton *)self->_directionsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = self->_directionsButton;
  v32 = +[NSBundle mainBundle];
  v33 = [v32 localizedStringForKey:@"CarPlay_SharedTrip_Detail_Directions" value:@"localized string not found" table:0];
  [(CarFocusableButton *)v31 setTitle:v33 forState:0];

  [(CarFocusableButton *)self->_directionsButton addTarget:self action:"_directionsButtonPressed:" forControlEvents:64];
  v34 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  stopUpdatesButton = self->_stopUpdatesButton;
  self->_stopUpdatesButton = &v34->super;

  [(CarFocusableButton *)self->_stopUpdatesButton setAccessibilityIdentifier:@"StopUpdatesButton"];
  [(CarFocusableButton *)self->_stopUpdatesButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = +[UIColor whiteColor];
  [(CarFocusableButton *)self->_stopUpdatesButton setNonFocusedTintColor:v36];

  v37 = +[UIColor externalSystemRedColor];
  [(CarFocusableButton *)self->_stopUpdatesButton setNonFocusedBackgroundColor:v37];

  v38 = self->_stopUpdatesButton;
  v39 = +[NSBundle mainBundle];
  v40 = [v39 localizedStringForKey:@"CarPlay_SharedTrip_Detail_Stop_Update" value:@"localized string not found" table:0];
  [(CarFocusableButton *)v38 setTitle:v40 forState:0];

  v41 = [(CarFocusableButton *)self->_stopUpdatesButton titleLabel];
  +[CarCardRoundedButton buttonMetrics];
  v42 = +[UIFont systemFontOfSize:v50 weight:UIFontWeightSemibold];
  [v41 setFont:v42];

  [(CarFocusableButton *)self->_stopUpdatesButton addTarget:self action:"_blockUpdatesButtonPressed:" forControlEvents:64];
  id v43 = objc_alloc((Class)UIStackView);
  v44 = self->_stopUpdatesButton;
  v52[0] = self->_directionsButton;
  v52[1] = v44;
  v45 = +[NSArray arrayWithObjects:v52 count:2];
  v46 = (UIStackView *)[v43 initWithArrangedSubviews:v45];
  stackView = self->_stackView;
  self->_stackView = v46;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAlignment:0];
  [(UIStackView *)self->_stackView setDistribution:1];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setSpacing:2.0];
  LODWORD(v48) = 1148846080;
  [(UIStackView *)self->_stackView setContentHuggingPriority:1 forAxis:v48];
  v49 = [(CarSharedTripDetailCardViewController *)self view];
  [v49 addSubview:self->_stackView];

  [(CarSharedTripDetailCardViewController *)self _setupConstraints];
  [(CarSharedTripDetailCardViewController *)self _updateDirectionsButtonVisibility];
  [(CarSharedTripDetailCardViewController *)self _updateContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarSharedTripDetailCardViewController;
  [(CarSharedTripDetailCardViewController *)&v4 viewWillAppear:a3];
  self->_isVisible = 1;
  [(CarSharedTripDetailCardViewController *)self _refreshSubscriptionToken];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarSharedTripDetailCardViewController;
  [(CarSharedTripDetailCardViewController *)&v5 viewDidDisappear:a3];
  self->_isVisible = 0;
  id subscriptionToken = self->_subscriptionToken;
  self->_id subscriptionToken = 0;
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarSharedTripDetailCardViewController;
  [(CarSharedTripDetailCardViewController *)&v4 didMoveToParentViewController:a3];
  [(CarSharedTripDetailCardViewController *)self _refreshSubscriptionToken];
}

- (void)_setupConstraints
{
  v3 = [(CarSharedTripDetailCardViewController *)self view];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  objc_super v5 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  textLayoutGuide = self->_textLayoutGuide;
  self->_textLayoutGuide = v5;

  id v7 = [(CarSharedTripDetailCardViewController *)self view];
  [v7 addLayoutGuide:self->_textLayoutGuide];

  id v8 = [(UILabel *)self->_handleLabel topAnchor];
  v9 = [v3 topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v4 addObject:v10];

  v11 = [(UILabel *)self->_handleLabel leadingAnchor];
  double v12 = [v3 leadingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12 constant:10.0];
  [v4 addObject:v13];

  v14 = [v3 trailingAnchor];
  v15 = [(UILabel *)self->_handleLabel trailingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:10.0];
  [v4 addObject:v16];

  v17 = [(UILabel *)self->_etaLabel topAnchor];
  v18 = [(UILabel *)self->_handleLabel bottomAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18];
  [v4 addObject:v19];

  double v20 = [(UILabel *)self->_etaLabel leadingAnchor];
  v21 = [v3 leadingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:10.0];
  [v4 addObject:v22];

  v23 = [v3 trailingAnchor];
  v24 = [(UILabel *)self->_etaLabel trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:10.0];
  [v4 addObject:v25];

  double v26 = [(UILayoutGuide *)self->_textLayoutGuide topAnchor];
  double v27 = [(UILabel *)self->_etaLabel bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:10.0];
  [v4 addObject:v28];

  v29 = [(UILayoutGuide *)self->_textLayoutGuide leadingAnchor];
  v30 = [v3 leadingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:10.0];
  [v4 addObject:v31];

  v32 = [v3 trailingAnchor];
  v33 = [(UILayoutGuide *)self->_textLayoutGuide trailingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:10.0];
  [v4 addObject:v34];

  v35 = [(UILabel *)self->_destinationLabel centerYAnchor];
  v36 = [(UILayoutGuide *)self->_textLayoutGuide centerYAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v4 addObject:v37];

  v38 = [(UILabel *)self->_destinationLabel leadingAnchor];
  v39 = [(UILayoutGuide *)self->_textLayoutGuide leadingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v4 addObject:v40];

  v41 = [(UILayoutGuide *)self->_textLayoutGuide trailingAnchor];
  v42 = [(UILabel *)self->_destinationLabel trailingAnchor];
  id v43 = [v41 constraintEqualToAnchor:v42];
  [v4 addObject:v43];

  v44 = [(UIStackView *)self->_stackView topAnchor];
  v45 = [(UILayoutGuide *)self->_textLayoutGuide bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45 constant:4.0];
  [v4 addObject:v46];

  v47 = [(UIStackView *)self->_stackView leadingAnchor];
  double v48 = [(UILayoutGuide *)self->_textLayoutGuide leadingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v4 addObject:v49];

  double v50 = [(UILayoutGuide *)self->_textLayoutGuide trailingAnchor];
  objc_super v51 = [(UIStackView *)self->_stackView trailingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v4 addObject:v52];

  v53 = [v3 bottomAnchor];
  v54 = [(UIStackView *)self->_stackView bottomAnchor];
  v55 = [v53 constraintEqualToAnchor:v54 constant:10.0];
  [v4 addObject:v55];

  v56 = [(CarFocusableButton *)self->_stopUpdatesButton heightAnchor];
  +[CarCardRoundedButton buttonMetrics];
  v57 = [v56 constraintEqualToConstant:v61];
  [v4 addObject:v57];

  v58 = [(UILabel *)self->_destinationLabel heightAnchor];
  v59 = [(UILayoutGuide *)self->_textLayoutGuide heightAnchor];
  v60 = [v58 constraintLessThanOrEqualToAnchor:v59];
  [v4 addObject:v60];

  +[NSLayoutConstraint activateConstraints:v4];
}

- (void)_updateDirectionsButtonVisibility
{
  v3 = [(CarSharedTripDetailCardViewController *)self sharedTrip];
  id v12 = [v3 destinationWaypointMapItem];

  id v4 = objc_alloc((Class)CLLocation);
  [v12 coordinate];
  double v6 = v5;
  [v12 coordinate];
  id v7 = [v4 initWithLatitude:v6];
  id v8 = +[MKLocationManager sharedLocationManager];
  v9 = [v8 lastLocation];
  [v9 distanceFromLocation:v7];
  double v11 = v10;

  if (v11 <= 500.0 != [(CarFocusableButton *)self->_directionsButton isHidden])
  {
    [(CarFocusableButton *)self->_directionsButton setHidden:v11 <= 500.0];
    [(CarSharedTripDetailCardViewController *)self setNeedsFocusUpdate];
  }
}

- (void)_updateContent
{
  v3 = [(GEOSharedNavState *)self->_sharedTrip etaInfo];
  [v3 etaTimestamp];
  +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NSTimeZone localTimeZone];
  double v5 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v17 inTimeZone:v4 canIncludeDate:0];

  double v6 = [(GEOSharedNavState *)self->_sharedTrip routeInfo];
  id v7 = [v6 chargingStations];
  id v8 = [v7 count];

  v9 = +[NSBundle mainBundle];
  double v10 = [v9 localizedStringForKey:@"CarPlay_SharedTrip_Detail_ETA" value:@"localized string not found" table:0];

  double v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8, v5);
  [(UILabel *)self->_etaLabel setText:v11];

  id v12 = [(GEOSharedNavState *)self->_sharedTrip senderInfo];
  if ([v12 hasLocalContactIdentifier])
  {
    [(UILabel *)self->_handleLabel setText:&stru_101324E70];
  }
  else
  {
    double v13 = [(GEOSharedNavState *)self->_sharedTrip senderInfo];
    v14 = [v13 fromIdentifier];
    [(UILabel *)self->_handleLabel setText:v14];
  }
  v15 = [(GEOSharedNavState *)self->_sharedTrip destinationWaypointMapItem];
  v16 = navDisplayAddressForMapItem();
  [(UILabel *)self->_destinationLabel setText:v16];
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarSharedTripDetailCardViewController *)self isViewLoaded])
  {
    if ([(CarFocusableButton *)self->_directionsButton isHidden])
    {
      stopUpdatesButton = self->_stopUpdatesButton;
      p_stopUpdatesButton = &stopUpdatesButton;
      uint64_t v4 = 1;
    }
    else
    {
      double v6 = self->_stopUpdatesButton;
      directionsButton = self->_directionsButton;
      v9 = v6;
      p_stopUpdatesButton = &directionsButton;
      uint64_t v4 = 2;
    }
    double v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_stopUpdatesButton, v4, directionsButton, v9, stopUpdatesButton);
  }
  else
  {
    double v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (NSArray)focusOrderSubItems
{
  if ([(CarSharedTripDetailCardViewController *)self isViewLoaded])
  {
    if ([(CarFocusableButton *)self->_directionsButton isHidden])
    {
      stopUpdatesButton = self->_stopUpdatesButton;
      p_stopUpdatesButton = &stopUpdatesButton;
      uint64_t v4 = 1;
    }
    else
    {
      double v6 = self->_stopUpdatesButton;
      directionsButton = self->_directionsButton;
      v9 = v6;
      p_stopUpdatesButton = &directionsButton;
      uint64_t v4 = 2;
    }
    double v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_stopUpdatesButton, v4, directionsButton, v9, stopUpdatesButton);
  }
  else
  {
    double v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (void)_refreshSubscriptionToken
{
  id v9 = [(CarSharedTripDetailCardViewController *)self _maps_uiScene];
  v3 = [(CarSharedTripDetailCardViewController *)self sharedTrip];
  if (v3 && self->_isVisible)
  {

    if (v9)
    {
      uint64_t v4 = [SharedTripSceneAwareSubscription alloc];
      double v5 = [(CarSharedTripDetailCardViewController *)self sharedTrip];
      double v6 = [v5 groupIdentifier];
      id v7 = [(SharedTripSceneAwareSubscription *)v4 initWithTripIdentifier:v6 scene:v9];
      id subscriptionToken = self->_subscriptionToken;
      self->_id subscriptionToken = v7;

      goto LABEL_7;
    }
  }
  else
  {
  }
  double v5 = self->_subscriptionToken;
  self->_id subscriptionToken = 0;
LABEL_7:
}

- (void)_directionsButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sharedTripDetailCard:self didSelectAction:0];
}

- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3
{
  [a3 receivedTrips];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = [v9 groupIdentifier];
        double v11 = [(CarSharedTripDetailCardViewController *)self sharedTrip];
        id v12 = [v11 groupIdentifier];
        unsigned int v13 = [v10 isEqualToString:v12];

        if (v13)
        {
          if ([(CarSharedTripDetailCardViewController *)self _updateWithTrip:v9]) {
            [(CarSharedTripDetailCardViewController *)self _updateContent];
          }
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  if ([(CarSharedTripDetailCardViewController *)self _updateWithTrip:a4])
  {
    [(CarSharedTripDetailCardViewController *)self _updateContent];
  }
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  if ([(CarSharedTripDetailCardViewController *)self _updateWithTrip:a4])
  {
    [(CarSharedTripDetailCardViewController *)self _updateContent];
  }
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
  if ([(CarSharedTripDetailCardViewController *)self _updateWithTrip:a4])
  {
    [(CarSharedTripDetailCardViewController *)self _updateContent];
  }
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  if ([(CarSharedTripDetailCardViewController *)self _updateWithTrip:a4])
  {
    [(CarSharedTripDetailCardViewController *)self _updateContent];
  }
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  if ([(CarSharedTripDetailCardViewController *)self _updateWithTrip:a4])
  {
    [(CarSharedTripDetailCardViewController *)self _updateContent];
  }
}

- (BOOL)_updateWithTrip:(id)a3
{
  id v4 = a3;
  id v5 = [v4 groupIdentifier];
  id v6 = [(GEOSharedNavState *)self->_sharedTrip groupIdentifier];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7) {
    [(GEOSharedNavState *)self->_sharedTrip mergeFrom:v4];
  }

  return v7;
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_stopUpdatesButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_destinationLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);

  objc_storeStrong((id *)&self->_handleLabel, 0);
}

@end