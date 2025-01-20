@interface MacVenueControlsViewController
- (BOOL)forceHidden;
- (BOOL)isHidden;
- (BOOL)isOpen;
- (BOOL)isVisible;
- (BOOL)lacksSearchResultsForFloorOrdinal:(id)a3;
- (BOOL)shouldBeHidden;
- (BrowseVenueViewControllerDelegate)browseViewControllerDelegate;
- (MacVenueControlsViewController)initWithVenueFloorViewDelegate:(id)a3 venueBrowseDelegate:(id)a4 venuesManager:(id)a5;
- (NSArray)floorOrdinals;
- (NSDictionary)shortFloorNames;
- (NSNumber)userLocationFloorOrdinal;
- (UIButton)floorPicker;
- (VKVenueFeatureMarker)venue;
- (VenueFloorViewControllerDelegate)floorViewControllerDelegate;
- (VenuesManager)venuesManager;
- (void)browseVenue:(id)a3;
- (void)didChangeConstraints;
- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5;
- (void)didChangeSearchResultsInVenue;
- (void)didClose;
- (void)didFinishHiding;
- (void)didFinishShowing;
- (void)didOpen;
- (void)didStartHiding;
- (void)didStartShowing;
- (void)selectedFloorOrdinal:(id)a3;
- (void)setBrowseViewControllerDelegate:(id)a3;
- (void)setDisplayedFloorOrdinal:(signed __int16)a3;
- (void)setFloorOrdinals:(id)a3;
- (void)setFloorViewControllerDelegate:(id)a3;
- (void)setForceHidden:(BOOL)a3;
- (void)setForceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setHidden:(BOOL)a3;
- (void)setOpen:(BOOL)a3;
- (void)setOpen:(BOOL)a3 animated:(BOOL)a4;
- (void)setShortFloorNames:(id)a3;
- (void)setUserLocationFloorOrdinal:(id)a3;
- (void)setVenue:(id)a3;
- (void)setVenue:(id)a3 focusedBuilding:(id)a4 animated:(BOOL)a5 forceUpdate:(BOOL)a6;
- (void)setVenuesManager:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)toggleHidden;
- (void)updateBrowseVenueText;
- (void)updateDisplayedFloor;
- (void)updateHiddenAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateVenueAndBuildingsAnimated:(BOOL)a3 forced:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MacVenueControlsViewController

- (MacVenueControlsViewController)initWithVenueFloorViewDelegate:(id)a3 venueBrowseDelegate:(id)a4 venuesManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MacVenueControlsViewController;
  v11 = [(MacVenueControlsViewController *)&v16 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_floorViewControllerDelegate, v8);
    objc_storeWeak((id *)&v12->_browseViewControllerDelegate, v9);
    objc_storeWeak((id *)&v12->_venuesManager, v10);
    floorOrdinals = v12->_floorOrdinals;
    v12->_floorOrdinals = (NSArray *)&__NSArray0__struct;

    shortFloorNames = v12->_shortFloorNames;
    v12->_shortFloorNames = (NSDictionary *)&__NSDictionary0__struct;
  }
  return v12;
}

- (void)viewDidLoad
{
  v66.receiver = self;
  v66.super_class = (Class)MacVenueControlsViewController;
  [(MacVenueControlsViewController *)&v66 viewDidLoad];
  v3 = [(MacVenueControlsViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = +[MapsTheme visualEffectViewAllowingBlur:1];
  effectView = self->_effectView;
  self->_effectView = v4;

  [(UIVisualEffectView *)self->_effectView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVisualEffectView *)self->_effectView _setCornerRadius:1 continuous:15 maskedCorners:9.0];
  v6 = [(MacVenueControlsViewController *)self view];
  [v6 addSubview:self->_effectView];

  v7 = [(UIVisualEffectView *)self->_effectView contentView];
  uint64_t v8 = +[UIFont system16];
  uint64_t v9 = +[UIColor colorNamed:@"VenueBrowseFloorPickerTextColor"];
  id v10 = +[UIButton buttonWithType:0];
  browseButton = self->_browseButton;
  self->_browseButton = v10;

  [(UIButton *)self->_browseButton setAccessibilityIdentifier:@"VenueBrowseButton"];
  [(UIButton *)self->_browseButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(UIButton *)self->_browseButton titleLabel];
  [v12 setFont:v8];

  -[UIButton setContentEdgeInsets:](self->_browseButton, "setContentEdgeInsets:", 5.0, 15.0, 5.0, 15.0);
  [(UIButton *)self->_browseButton setTitleColor:v9 forState:0];
  [(UIButton *)self->_browseButton addTarget:self action:"browseVenue:" forControlEvents:64];
  [v7 addSubview:self->_browseButton];
  v13 = objc_alloc_init(HairlineView);
  [(HairlineView *)v13 setVertical:1];
  [(HairlineView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v13];
  v14 = +[MapsRightImageButton buttonWithType:0];
  floorPicker = self->_floorPicker;
  self->_floorPicker = v14;

  [(UIButton *)self->_floorPicker setAccessibilityIdentifier:@"FloorPickerButton"];
  [(UIButton *)self->_floorPicker setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIButton setContentEdgeInsets:](self->_floorPicker, "setContentEdgeInsets:", 5.0, 15.0, 5.0, 15.0);
  v64 = (void *)v9;
  [(UIButton *)self->_floorPicker setTitleColor:v9 forState:0];
  objc_super v16 = [(UIButton *)self->_floorPicker titleLabel];
  v65 = (void *)v8;
  [v16 setFont:v8];

  v17 = self->_floorPicker;
  v18 = +[UIImageSymbolConfiguration configurationWithFont:v8 scale:2];
  v19 = +[UIImage systemImageNamed:@"chevron.up.chevron.down" withConfiguration:v18];
  [(UIButton *)v17 setImage:v19 forState:0];

  [(UIButton *)self->_floorPicker setTintColor:v9];
  [(UIButton *)self->_floorPicker setShowsMenuAsPrimaryAction:1];
  [v7 addSubview:self->_floorPicker];
  v63 = [(MacVenueControlsViewController *)self view];
  v62 = [v63 heightAnchor];
  v61 = [(UIVisualEffectView *)self->_effectView heightAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v67[0] = v60;
  v59 = [(MacVenueControlsViewController *)self view];
  v58 = [v59 widthAnchor];
  v57 = [(UIVisualEffectView *)self->_effectView widthAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v67[1] = v56;
  v55 = [(UIButton *)self->_browseButton leadingAnchor];
  v54 = [v7 leadingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v67[2] = v53;
  v52 = [(UIButton *)self->_browseButton topAnchor];
  v51 = [v7 topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v67[3] = v50;
  v49 = [(UIButton *)self->_browseButton bottomAnchor];
  v48 = [v7 bottomAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v67[4] = v47;
  v45 = [(HairlineView *)v13 leadingAnchor];
  v44 = [(UIButton *)self->_browseButton trailingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v67[5] = v43;
  v42 = [(HairlineView *)v13 centerYAnchor];
  v40 = [v7 centerYAnchor];
  v39 = [v42 constraintEqualToAnchor:v40];
  v67[6] = v39;
  v38 = [(HairlineView *)v13 topAnchor];
  v37 = [v7 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:8.0];
  v67[7] = v36;
  v46 = v13;
  v35 = [(HairlineView *)v13 bottomAnchor];
  v34 = [v7 bottomAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:-8.0];
  v67[8] = v33;
  v32 = [(UIButton *)self->_floorPicker leadingAnchor];
  v31 = [(HairlineView *)v13 trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v67[9] = v30;
  v29 = [(UIButton *)self->_floorPicker trailingAnchor];
  v20 = [v7 trailingAnchor];
  v21 = [v29 constraintEqualToAnchor:v20];
  v67[10] = v21;
  v22 = [(UIButton *)self->_floorPicker topAnchor];
  v41 = v7;
  v23 = [v7 topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v67[11] = v24;
  v25 = [(UIButton *)self->_floorPicker bottomAnchor];
  v26 = [v41 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v67[12] = v27;
  v28 = +[NSArray arrayWithObjects:v67 count:13];
  +[NSLayoutConstraint activateConstraints:v28];

  [(MapsThemeViewController *)self updateTheme];
}

- (void)setOpen:(BOOL)a3
{
}

- (void)setOpen:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_open != a3)
  {
    BOOL v4 = a3;
    self->_open = a3;
    [(MacVenueControlsViewController *)self toggleHidden];
    if (v4)
    {
      [(MacVenueControlsViewController *)self didOpen];
    }
    else
    {
      [(MacVenueControlsViewController *)self didClose];
    }
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MacVenueControlsViewController *)self view];
  unsigned int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    id v7 = [(MacVenueControlsViewController *)self view];
    [v7 setHidden:v3];
  }
}

- (BOOL)isHidden
{
  v2 = [(MacVenueControlsViewController *)self view];
  unsigned __int8 v3 = [v2 isHidden];

  return v3;
}

- (void)setForceHidden:(BOOL)a3
{
}

- (void)setForceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (self->_forceHidden == v6)
  {
    if (!v8) {
      goto LABEL_6;
    }
    id v10 = v8;
    (*((void (**)(id))v8 + 2))(v8);
  }
  else
  {
    self->_forceHidden = v6;
    id v10 = v8;
    [(MacVenueControlsViewController *)self updateHiddenAnimated:v5 completion:v8];
  }
  uint64_t v9 = v10;
LABEL_6:
}

- (BOOL)lacksSearchResultsForFloorOrdinal:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  BOOL v6 = [(MacVenueControlsViewController *)self venue];
  id v7 = [v4 shortValue];

  LOBYTE(v4) = [v5 lacksSearchResultsInVenue:v6 forFloorOrdinal:v7];
  return (char)v4;
}

- (void)didChangeSearchResultsInVenue
{
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  uint64_t v5 = a5;
  [(MacVenueControlsViewController *)self setVenue:a3 focusedBuilding:a4 animated:1 forceUpdate:0];
  if (a3)
  {
    [(MacVenueControlsViewController *)self updateBrowseVenueText];
    [(MacVenueControlsViewController *)self setDisplayedFloorOrdinal:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MacVenueControlsViewController;
  [(MacVenueControlsViewController *)&v4 viewWillAppear:a3];
  [(MacVenueControlsViewController *)self setVisible:1];
  [(MacVenueControlsViewController *)self toggleHidden];
  [(MacVenueControlsViewController *)self updateVenueAndBuildingsAnimated:0 forced:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MacVenueControlsViewController *)self setVisible:0];
  v5.receiver = self;
  v5.super_class = (Class)MacVenueControlsViewController;
  [(MacVenueControlsViewController *)&v5 viewDidDisappear:v3];
}

- (BOOL)shouldBeHidden
{
  if ([(MacVenueControlsViewController *)self forceHidden]) {
    return 1;
  }
  objc_super v4 = [(MacVenueControlsViewController *)self venue];
  if (v4)
  {
    objc_super v5 = [(MacVenueControlsViewController *)self floorOrdinals];
    BOOL v3 = (unint64_t)[v5 count] < 2;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)updateHiddenAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v6 = (void (**)(void))a4;
  unsigned int v7 = [(MacVenueControlsViewController *)self shouldBeHidden];
  if (v7 == [(MacVenueControlsViewController *)self isHidden]) {
    goto LABEL_8;
  }
  if (!a3)
  {
    if (!v7)
    {
      [(MacVenueControlsViewController *)self didStartShowing];
      [(MacVenueControlsViewController *)self setHidden:0];
      [(MacVenueControlsViewController *)self didFinishShowing];
      if (!v6) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    [(MacVenueControlsViewController *)self didStartHiding];
    [(MacVenueControlsViewController *)self setHidden:1];
    [(MacVenueControlsViewController *)self setOpen:0 animated:0];
    [(MacVenueControlsViewController *)self didFinishHiding];
LABEL_8:
    if (!v6) {
      goto LABEL_10;
    }
LABEL_9:
    v6[2](v6);
    goto LABEL_10;
  }
  if ((v7 & 1) == 0)
  {
    id v8 = [(MacVenueControlsViewController *)self view];
    [v8 setAlpha:0.0];

    [(MacVenueControlsViewController *)self setHidden:0];
    uint64_t v9 = [(MacVenueControlsViewController *)self view];
    [v9 layoutIfNeeded];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100A54E8C;
  v13[3] = &unk_1012E6300;
  char v14 = v7;
  v13[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A54F4C;
  v10[3] = &unk_1012FF640;
  v10[4] = self;
  char v12 = v7;
  v11 = v6;
  +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v13 completion:v10];

LABEL_10:
}

- (void)toggleHidden
{
  if ([(MacVenueControlsViewController *)self isVisible])
  {
    uint64_t v3 = [(MacVenueControlsViewController *)self isHidden] ^ 1;
    [(MacVenueControlsViewController *)self setHidden:v3];
  }
}

- (void)updateVenueAndBuildingsAnimated:(BOOL)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v10 = [(MacVenueControlsViewController *)self venuesManager];
  unsigned int v7 = [v10 venueWithFocus];
  id v8 = [(MacVenueControlsViewController *)self venuesManager];
  uint64_t v9 = [v8 venueBuildingWithFocus];
  [(MacVenueControlsViewController *)self setVenue:v7 focusedBuilding:v9 animated:v5 forceUpdate:v4];
}

- (void)setVenue:(id)a3 focusedBuilding:(id)a4 animated:(BOOL)a5 forceUpdate:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = (VKVenueFeatureMarker *)a3;
  uint64_t v11 = [(VKVenueFeatureMarker *)v10 buildings];
  char v12 = (void *)v11;
  v13 = &__NSArray0__struct;
  if (v11) {
    v13 = (void *)v11;
  }
  id v14 = v13;

  if (!a6 && self->_venue == v10)
  {
    objc_super v16 = self;
    uint64_t v17 = v7;
    v15 = 0;
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_venue, a3);
  [(MacVenueControlsViewController *)self updateBrowseVenueText];
  if ([(MacVenueControlsViewController *)self isHidden]
    || ![(MacVenueControlsViewController *)self shouldBeHidden]
    || !v7)
  {
    BOOL v39 = v7;
    v41 = v10;
    v18 = objc_opt_new();
    v19 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v40 = v14;
    id v20 = v14;
    id v21 = [v20 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v26 = [v25 floorOrdinals];
          [v19 addObjectsFromArray:v26];

          v27 = [v25 floorNames];
          [v18 addEntriesFromDictionary:v27];
        }
        id v22 = [v20 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v22);
    }

    v28 = [v19 allObjects];
    v29 = [v28 sortedArrayUsingSelector:"compare:"];
    v30 = [v29 reverseObjectEnumerator];
    v31 = [v30 allObjects];

    if (!a6)
    {
      v32 = [(MacVenueControlsViewController *)self floorOrdinals];
      if (+[NSArray array:v31 isEqualToArray:v32])
      {
        v33 = [(MacVenueControlsViewController *)self shortFloorNames];
        unsigned int v34 = +[NSDictionary dictionary:v18 isEqualToDictionary:v33];

        if (v34)
        {
          [(MacVenueControlsViewController *)self updateHiddenAnimated:v39 completion:0];
          id v14 = v40;
          id v10 = v41;
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {
      }
    }
    objc_storeStrong((id *)&self->_floorOrdinals, v31);
    objc_storeStrong((id *)&self->_shortFloorNames, v18);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100A55560;
    v44[3] = &unk_1012E5D08;
    v44[4] = self;
    v35 = objc_retainBlock(v44);
    v36 = (void (**)(void))v35;
    if (v39)
    {
      if (![(MacVenueControlsViewController *)self isHidden])
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100A55568;
        v42[3] = &unk_1012E6EA8;
        v43 = v36;
        +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v42 completion:0];

        goto LABEL_29;
      }
      v36[2](v36);
      v37 = self;
      uint64_t v38 = 1;
    }
    else
    {
      ((void (*)(void *))v35[2])(v35);
      v37 = self;
      uint64_t v38 = 0;
    }
    [(MacVenueControlsViewController *)v37 updateHiddenAnimated:v38 completion:0];
LABEL_29:
    id v14 = v40;
    id v10 = v41;

    goto LABEL_30;
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100A5554C;
  v49[3] = &unk_1012E6300;
  v49[4] = self;
  BOOL v50 = a6;
  v15 = v49;
  objc_super v16 = self;
  uint64_t v17 = 1;
LABEL_21:
  [(MacVenueControlsViewController *)v16 updateHiddenAnimated:v17 completion:v15];
LABEL_31:
}

- (void)updateDisplayedFloor
{
  uint64_t v3 = [(MacVenueControlsViewController *)self venue];

  if (v3)
  {
    id v5 = [(MacVenueControlsViewController *)self venuesManager];
    BOOL v4 = [(MacVenueControlsViewController *)self venue];
    -[MacVenueControlsViewController setDisplayedFloorOrdinal:](self, "setDisplayedFloorOrdinal:", [v5 displayedFloorOrdinalForBuildingsInVenue:v4]);
  }
}

- (void)updateBrowseVenueText
{
  uint64_t v3 = [(MacVenueControlsViewController *)self venue];
  id v9 = [v3 shortName];

  id v4 = [v9 length];
  id v5 = +[NSBundle mainBundle];
  BOOL v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"Browse [venue with name]" value:@"localized string not found" table:0];

    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
    BOOL v6 = (void *)v7;
  }
  else
  {
    id v8 = [v5 localizedStringForKey:@"Browse [venue without name]" value:@"localized string not found" table:0];
  }

  [(UIButton *)self->_browseButton setTitle:v8 forState:0];
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v20 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(MacVenueControlsViewController *)self floorOrdinals];
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v8);
        id v10 = [(MacVenueControlsViewController *)self shortFloorNames];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100A559EC;
        v21[3] = &unk_1013154B8;
        v21[4] = self;
        v21[5] = v9;
        id v12 = v11;
        id v22 = v12;
        v13 = +[UIAction actionWithTitle:v12 image:0 identifier:v12 handler:v21];
        [v13 setState:[v9 shortValue] == v3];
        if ([(MacVenueControlsViewController *)self lacksSearchResultsForFloorOrdinal:v9])
        {
          [v13 setAttributes:1];
        }
        [v20 addObject:v13];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  id v14 = [(MacVenueControlsViewController *)self shortFloorNames];
  v15 = +[NSNumber numberWithShort:v3];
  objc_super v16 = [v14 objectForKeyedSubscript:v15];

  uint64_t v17 = [(MacVenueControlsViewController *)self floorPicker];
  [v17 setTitle:v16 forState:0];

  v18 = +[UIMenu menuWithTitle:&stru_101324E70 children:v20];
  [(UIButton *)self->_floorPicker setMenu:v18];
}

- (void)selectedFloorOrdinal:(id)a3
{
  id v4 = a3;
  id v5 = [(MacVenueControlsViewController *)self shortFloorNames];
  id v7 = [v5 objectForKeyedSubscript:v4];

  id v6 = [(MacVenueControlsViewController *)self floorPicker];
  [v6 setTitle:v7 forState:0];
}

- (void)browseVenue:(id)a3
{
  id v3 = [(MacVenueControlsViewController *)self browseViewControllerDelegate];
  [v3 viewControllerDidSelectBrowseVenue:0];
}

- (void)didChangeConstraints
{
  id v3 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  [v3 venueFloorViewControllerDidChangeConstraints:self];
}

- (void)didStartHiding
{
  id v3 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  [v3 venueFloorViewControllerDidStartHiding:self];
}

- (void)didFinishHiding
{
  id v3 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  [v3 venueFloorViewControllerDidFinishHiding:self];
}

- (void)didStartShowing
{
  id v3 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  [v3 venueFloorViewControllerDidStartShowing:self];
}

- (void)didFinishShowing
{
  id v3 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  [v3 venueFloorViewControllerDidFinishShowing:self];
}

- (void)didOpen
{
  id v3 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  [v3 venueFloorViewControllerDidOpen:self];
}

- (void)didClose
{
  id v3 = [(MacVenueControlsViewController *)self floorViewControllerDelegate];
  [v3 venueFloorViewControllerDidClose:self];
}

- (BOOL)isOpen
{
  return self->_open;
}

- (NSNumber)userLocationFloorOrdinal
{
  return self->_userLocationFloorOrdinal;
}

- (void)setUserLocationFloorOrdinal:(id)a3
{
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (UIButton)floorPicker
{
  return self->_floorPicker;
}

- (VenueFloorViewControllerDelegate)floorViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floorViewControllerDelegate);

  return (VenueFloorViewControllerDelegate *)WeakRetained;
}

- (void)setFloorViewControllerDelegate:(id)a3
{
}

- (BrowseVenueViewControllerDelegate)browseViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browseViewControllerDelegate);

  return (BrowseVenueViewControllerDelegate *)WeakRetained;
}

- (void)setBrowseViewControllerDelegate:(id)a3
{
}

- (VenuesManager)venuesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_venuesManager);

  return (VenuesManager *)WeakRetained;
}

- (void)setVenuesManager:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (VKVenueFeatureMarker)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
}

- (NSArray)floorOrdinals
{
  return self->_floorOrdinals;
}

- (void)setFloorOrdinals:(id)a3
{
}

- (NSDictionary)shortFloorNames
{
  return self->_shortFloorNames;
}

- (void)setShortFloorNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortFloorNames, 0);
  objc_storeStrong((id *)&self->_floorOrdinals, 0);
  objc_storeStrong((id *)&self->_venue, 0);
  objc_destroyWeak((id *)&self->_venuesManager);
  objc_destroyWeak((id *)&self->_browseViewControllerDelegate);
  objc_destroyWeak((id *)&self->_floorViewControllerDelegate);
  objc_storeStrong((id *)&self->_floorPicker, 0);
  objc_storeStrong((id *)&self->_userLocationFloorOrdinal, 0);
  objc_storeStrong((id *)&self->_browseButton, 0);

  objc_storeStrong((id *)&self->_effectView, 0);
}

@end