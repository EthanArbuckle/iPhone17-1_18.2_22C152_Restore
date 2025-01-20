@interface VenueFloorCardViewController
- (BOOL)isUserLocation;
- (MapsThemeLabel)floorNameLabel;
- (UILabel)venueNameLabel;
- (VenueFloorCardViewController)initWithCoder:(id)a3;
- (VenueFloorCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VenueFloorCardViewController)initWithVenuesManager:(id)a3;
- (VenuesManager)venuesManager;
- (double)heightForLabel:(id)a3;
- (double)heightForLayout:(unint64_t)a3;
- (id)keyCommands;
- (id)nameForFloorWithOrdinal:(signed __int16)a3 inBuilding:(id)a4;
- (id)nameForFloorWithOrdinal:(signed __int16)a3 inBuildings:(id)a4;
- (int64_t)floatingControlsOptions;
- (void)handleCloseButtonTap;
- (void)setFloorNameLabel:(id)a3;
- (void)setIsUserLocation:(BOOL)a3;
- (void)setVenueNameLabel:(id)a3;
- (void)updateContents;
- (void)viewDidLoad;
@end

@implementation VenueFloorCardViewController

- (VenueFloorCardViewController)initWithVenuesManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VenueFloorCardViewController;
  v5 = [(VenueFloorCardViewController *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_venuesManager, v4);
    v7 = [(ContaineeViewController *)v6 cardPresentationController];
    [v7 setPresentedModally:1];

    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    [v8 setAllowsSwipeToDismiss:0];

    v9 = [(ContaineeViewController *)v6 cardPresentationController];
    [v9 setShouldHidePreviousCards:1];
  }
  return v6;
}

- (VenueFloorCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (VenueFloorCardViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)handleCloseButtonTap
{
  id v3 = [(VenueFloorCardViewController *)self venuesManager];
  v2 = [v3 venueFloorViewController];
  [v2 setOpen:0];
}

- (id)keyCommands
{
  v2 = +[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"handleCloseButtonTap"];
  v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)VenueFloorCardViewController;
  [(ContaineeViewController *)&v36 viewDidLoad];
  v32 = [(ContaineeViewController *)self headerView];
  v2 = objc_opt_new();
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = +[UIColor clearColor];
  [v2 setBackgroundColor:v3];

  +[DynamicTypeWizard autorefreshLabel:v2 withFontProvider:&stru_101321480];
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1009B98EC;
  v33[3] = &unk_101313138;
  objc_copyWeak(&v34, &location);
  [v2 setTextColorProvider:v33];
  [v2 setAdjustsFontSizeToFitWidth:1];
  [v2 setMinimumScaleFactor:0.5];
  [(VenueFloorCardViewController *)self setFloorNameLabel:v2];
  [v32 addSubview:v2];
  id v4 = objc_opt_new();
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];

  +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:&stru_101321340];
  v6 = +[UIColor secondaryLabelColor];
  [v4 setTextColor:v6];

  [v4 setAdjustsFontSizeToFitWidth:1];
  [v4 setMinimumScaleFactor:0.5];
  [(VenueFloorCardViewController *)self setVenueNameLabel:v4];
  [v32 addSubview:v4];
  v30 = [v2 topAnchor];
  v29 = [v32 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:17.0];
  v37[0] = v28;
  v27 = [v2 leadingAnchor];
  v26 = [v32 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:20.0];
  v37[1] = v25;
  v24 = [v2 trailingAnchor];
  v23 = [v32 trailingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:-20.0];
  v37[2] = v22;
  v21 = [v4 topAnchor];
  v20 = [v2 bottomAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:2.0];
  v37[3] = v19;
  v18 = [v4 leadingAnchor];
  v17 = [v32 leadingAnchor];
  v7 = [v18 constraintEqualToAnchor:v17 constant:20.0];
  v37[4] = v7;
  v8 = [v4 trailingAnchor];
  v9 = [v32 trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:-20.0];
  v37[5] = v10;
  objc_super v11 = [v4 bottomAnchor];
  v12 = [v32 bottomAnchor];
  v13 = [v11 constraintLessThanOrEqualToAnchor:v12 constant:-17.0];
  v37[6] = v13;
  v14 = +[NSArray arrayWithObjects:v37 count:7];
  +[NSLayoutConstraint activateConstraints:v14];

  v15 = [(VenueFloorCardViewController *)self view];
  [v15 setNeedsLayout];

  v16 = [(VenueFloorCardViewController *)self view];
  [v16 layoutIfNeeded];

  [(VenueFloorCardViewController *)self updateContents];
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 == 5)
  {
    v5 = [(VenueFloorCardViewController *)self venueNameLabel];
    [(VenueFloorCardViewController *)self heightForLabel:v5];
    double v7 = v6 + 17.0 + 2.0;
    v8 = [(VenueFloorCardViewController *)self floorNameLabel];
    [(VenueFloorCardViewController *)self heightForLabel:v8];
    double v10 = v7 + v9;
    objc_super v11 = [(ContaineeViewController *)self cardPresentationController];
    [v11 bottomSafeOffset];
    double v3 = v10 + v12 + 17.0;
  }
  return v3;
}

- (int64_t)floatingControlsOptions
{
  return 64;
}

- (id)nameForFloorWithOrdinal:(signed __int16)a3 inBuilding:(id)a4
{
  uint64_t v4 = a3;
  v5 = [a4 floorNames];
  double v6 = +[NSNumber numberWithShort:v4];
  double v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)nameForFloorWithOrdinal:(signed __int16)a3 inBuildings:(id)a4
{
  uint64_t v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[VenueFloorCardViewController nameForFloorWithOrdinal:inBuilding:](self, "nameForFloorWithOrdinal:inBuilding:", v4, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11)
        {
          double v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (double)heightForLabel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 font];
  [v4 ascender];
  double v6 = v5;
  id v7 = [v3 font];

  [v7 descender];
  double v9 = v6 - v8;

  return v9;
}

- (void)updateContents
{
  uint64_t v4 = [(VenueFloorCardViewController *)self venuesManager];
  id v18 = [v4 venueWithFocus];

  double v5 = [(VenueFloorCardViewController *)self venuesManager];
  id v6 = [v5 displayedFloorOrdinalForBuildingsInVenue:v18];

  id v7 = [v18 name];
  double v8 = [(VenueFloorCardViewController *)self venueNameLabel];
  [v8 setText:v7];

  double v9 = [(VenueFloorCardViewController *)self venuesManager];
  double v10 = [v9 venueBuildingWithFocus];
  uint64_t v11 = [(VenueFloorCardViewController *)self nameForFloorWithOrdinal:v6 inBuilding:v10];
  double v12 = v11;
  if (!v11)
  {
    v2 = [v18 buildings];
    double v12 = [(VenueFloorCardViewController *)self nameForFloorWithOrdinal:v6 inBuildings:v2];
  }
  v13 = [(VenueFloorCardViewController *)self floorNameLabel];
  [v13 setText:v12];

  if (!v11)
  {
  }
  long long v14 = [(VenueFloorCardViewController *)self venuesManager];
  long long v15 = [v14 userLocationFloorOrdinal];

  if (v15) {
    BOOL v16 = [v15 shortValue] == v6;
  }
  else {
    BOOL v16 = 0;
  }
  [(VenueFloorCardViewController *)self setIsUserLocation:v16];
  long long v17 = [(VenueFloorCardViewController *)self floorNameLabel];
  [v17 updateTheme];
}

- (VenuesManager)venuesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venuesManager);

  return (VenuesManager *)WeakRetained;
}

- (MapsThemeLabel)floorNameLabel
{
  return self->_floorNameLabel;
}

- (void)setFloorNameLabel:(id)a3
{
}

- (UILabel)venueNameLabel
{
  return self->_venueNameLabel;
}

- (void)setVenueNameLabel:(id)a3
{
}

- (BOOL)isUserLocation
{
  return self->_isUserLocation;
}

- (void)setIsUserLocation:(BOOL)a3
{
  self->_isUserLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueNameLabel, 0);
  objc_storeStrong((id *)&self->_floorNameLabel, 0);

  objc_destroyWeak((id *)&self->_venuesManager);
}

@end