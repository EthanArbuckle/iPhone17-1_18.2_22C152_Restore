@interface VenueFloorViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)delayConstraintSetup;
- (BOOL)floorsDirty;
- (BOOL)forceHidden;
- (BOOL)isFocusedOnVenue:(id)a3;
- (BOOL)isHidden;
- (BOOL)isOpen;
- (BOOL)isVisible;
- (BOOL)lacksSearchResultsForFloorOrdinal:(id)a3;
- (BOOL)shouldBeHidden;
- (BOOL)updateHiddenAnimationActive;
- (BOOL)visualEffectDisabled;
- (CardView)cardView;
- (NSArray)closedConstraints;
- (NSArray)floorOrdinals;
- (NSArray)openConstraints;
- (NSDictionary)shortFloorNames;
- (NSLayoutConstraint)floorOptimalOpenHeightConstraint;
- (NSLayoutConstraint)floorWidthConstraint;
- (NSMutableArray)updateHiddenAnimationCompletionBlocks;
- (NSNumber)userLocationFloorOrdinal;
- (NSString)blurGroupName;
- (UIButton)closeButton;
- (UICollectionView)floorCollectionView;
- (UIStackView)stackView;
- (UITapGestureRecognizer)openGestureRecognizer;
- (UITapGestureRecognizer)pressGestureRecognizer;
- (UIView)closedPlaceholderView;
- (VKVenueFeatureMarker)venue;
- (VenueFloorViewController)initWithCoder:(id)a3;
- (VenueFloorViewController)initWithDelegate:(id)a3 venuesManager:(id)a4 visualEffectDisabled:(BOOL)a5;
- (VenueFloorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VenueFloorViewControllerDelegate)delegate;
- (VenuesManager)venuesManager;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)keyCommands;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)delayConstraintSetupWhileExecuting:(id)a3;
- (void)didChangeConstraints;
- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5;
- (void)didChangeSearchResultsInVenue;
- (void)didClose;
- (void)didFinishHiding;
- (void)didFinishShowing;
- (void)didOpen;
- (void)didStartHiding;
- (void)didStartShowing;
- (void)handleCloseButtonTap;
- (void)handleTap:(id)a3;
- (void)loadView;
- (void)scrollToDisplayedFloorAnimated:(BOOL)a3;
- (void)scrollToFloorOrdinal:(signed __int16)a3 animated:(BOOL)a4;
- (void)setBlurGroupName:(id)a3;
- (void)setCardView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setClosedConstraints:(id)a3;
- (void)setDelayConstraintSetup:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedFloorOrdinal:(signed __int16)a3 animated:(BOOL)a4;
- (void)setFloorCollectionView:(id)a3;
- (void)setFloorOptimalOpenHeightConstraint:(id)a3;
- (void)setFloorOrdinals:(id)a3;
- (void)setFloorWidthConstraint:(id)a3;
- (void)setFloorsDirty:(BOOL)a3;
- (void)setForceHidden:(BOOL)a3;
- (void)setForceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setHidden:(BOOL)a3;
- (void)setOpen:(BOOL)a3;
- (void)setOpen:(BOOL)a3 animated:(BOOL)a4;
- (void)setOpenConstraints:(id)a3;
- (void)setOpenGestureRecognizer:(id)a3;
- (void)setPressGestureRecognizer:(id)a3;
- (void)setShortFloorNames:(id)a3;
- (void)setStackView:(id)a3;
- (void)setUpdateHiddenAnimationActive:(BOOL)a3;
- (void)setUpdateHiddenAnimationCompletionBlocks:(id)a3;
- (void)setUserLocationFloorOrdinal:(id)a3;
- (void)setVenue:(id)a3;
- (void)setVenue:(id)a3 focusedBuilding:(id)a4 animated:(BOOL)a5 forceUpdate:(BOOL)a6;
- (void)setVenuesManager:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisualEffectDisabled:(BOOL)a3;
- (void)setupGestures;
- (void)updateCloseButtonVisibility;
- (void)updateDisplayedFloorAnimated:(BOOL)a3;
- (void)updateFloorOptimalOpenHeightConstraint;
- (void)updateForOpenChangedAnimated:(BOOL)a3;
- (void)updateHiddenAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateShowSelection;
- (void)updateShowSelectionWithForceClipCorners:(BOOL)a3;
- (void)updateVenueAndBuildingsAnimated:(BOOL)a3 forced:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VenueFloorViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (VenueFloorViewController)initWithCoder:(id)a3
{
  return 0;
}

- (VenueFloorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (VenueFloorViewController)initWithDelegate:(id)a3 venuesManager:(id)a4 visualEffectDisabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VenueFloorViewController;
  v10 = [(VenueFloorViewController *)&v19 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeWeak((id *)&v11->_venuesManager, v9);
    v11->_visualEffectDisabled = a5;
    openConstraints = v11->_openConstraints;
    v11->_openConstraints = (NSArray *)&__NSArray0__struct;

    closedConstraints = v11->_closedConstraints;
    v11->_closedConstraints = (NSArray *)&__NSArray0__struct;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    updateHiddenAnimationCompletionBlocks = v11->_updateHiddenAnimationCompletionBlocks;
    v11->_updateHiddenAnimationCompletionBlocks = v14;

    floorOrdinals = v11->_floorOrdinals;
    v11->_floorOrdinals = (NSArray *)&__NSArray0__struct;

    shortFloorNames = v11->_shortFloorNames;
    v11->_shortFloorNames = (NSDictionary *)&__NSDictionary0__struct;
  }
  return v11;
}

- (id)keyCommands
{
  v2 = +[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"handleCloseButtonTap"];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (UIView)closedPlaceholderView
{
  closedPlaceholderView = self->_closedPlaceholderView;
  if (!closedPlaceholderView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->_closedPlaceholderView;
    self->_closedPlaceholderView = v4;

    [(UIView *)self->_closedPlaceholderView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(UIView *)self->_closedPlaceholderView heightAnchor];
    v7 = [v6 constraintEqualToConstant:44.0];
    [v7 setActive:1];

    id v8 = [(UIView *)self->_closedPlaceholderView widthAnchor];
    id v9 = [v8 constraintEqualToConstant:44.0];
    [v9 setActive:1];

    closedPlaceholderView = self->_closedPlaceholderView;
  }

  return closedPlaceholderView;
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIStackView);
  [(VenueFloorViewController *)self setStackView:v3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAxis:1];
  [(VenueFloorViewController *)self setView:v3];
  v4 = +[UIColor colorNamed:@"VenueCloseBackgroundColor"];
  v5 = [(VenueFloorViewController *)self view];
  [v5 setTintColor:v4];

  v6 = +[UIButton buttonWithType:0];
  [v6 setAccessibilityIdentifier:@"LevelSwitcherCloseButton"];
  v7 = +[UIImage systemImageNamed:@"xmark.circle.fill"];
  [v6 setImage:v7 forState:0];

  id v8 = +[UIImageSymbolConfiguration configurationWithPointSize:25.0];
  [v6 setPreferredSymbolConfiguration:v8 forImageInState:0];

  [(VenueFloorViewController *)self setCloseButton:v6];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addTarget:self action:"handleCloseButtonTap" forControlEvents:64];
  [v3 addArrangedSubview:v6];
  id v9 = +[UIColor colorNamed:@"VenueCloseBackgroundColor"];
  v94 = v6;
  [v6 setTintColor:v9];

  id v10 = [[CardView alloc] initAllowingBlurredForButton:[(VenueFloorViewController *)self visualEffectDisabled] ^ 1];
  [(VenueFloorViewController *)self setCardView:v10];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setLayoutStyle:6];
  v11 = [(VenueFloorViewController *)self blurGroupName];
  [v10 setBlurGroupName:v11];

  [v3 addArrangedSubview:v10];
  +[VenueFloorPickerCell cellHeight];
  double v13 = fmax(v12, 44.0);
  v14 = [(VenueFloorViewController *)self view];
  v15 = [v14 window];
  v16 = [v15 screen];
  if (v16)
  {
    v17 = [v14 window];
    v18 = [v17 screen];
    [v18 nativeScale];
    double v20 = v19;
  }
  else
  {
    v17 = +[UIScreen mainScreen];
    [v17 nativeScale];
    double v20 = v21;
  }

  double v22 = 1.0;
  if (v20 > 0.0) {
    double v22 = 1.0 / v20;
  }
  double v23 = v13 + v22;

  id v24 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v24 setItemSize:44.0 v23];
  [v24 setMinimumLineSpacing:0.0];
  v90 = v24;
  id v25 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height collectionViewLayout:v24];
  [(VenueFloorViewController *)self setFloorCollectionView:v25];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v25 setShowsVerticalScrollIndicator:0];
  v26 = +[UIColor clearColor];
  [v25 setBackgroundColor:v26];

  [v25 setDataSource:self];
  [v25 setDelegate:self];
  uint64_t v27 = objc_opt_class();
  v28 = +[VenueFloorPickerCell reuseIdentifier];
  [v25 registerClass:v27 forCellWithReuseIdentifier:v28];

  v29 = [v10 contentView];
  [v29 addSubview:v25];

  v30 = [v25 heightAnchor];
  LODWORD(v31) = 1144750080;
  v93 = [v30 constraintEqualToConstant:0.0 priority:v31];

  v32 = [v25 widthAnchor];
  LODWORD(v33) = 1148829696;
  uint64_t v34 = [v32 constraintGreaterThanOrEqualToConstant:0.0 priority:v33];

  v84 = [v3 widthAnchor];
  LODWORD(v35) = 1148829696;
  v82 = [v84 constraintGreaterThanOrEqualToConstant:44.0 priority:v35];
  v97[0] = v82;
  v97[1] = v34;
  v89 = (void *)v34;
  v36 = [v25 topAnchor];
  v78 = [v10 topAnchor];
  v80 = v36;
  v76 = [v36 constraintEqualToAnchor:v78];
  v97[2] = v76;
  v37 = [v25 bottomAnchor];
  uint64_t v38 = [v10 bottomAnchor];
  v39 = [(VenueFloorViewController *)self view];
  v40 = [v39 window];
  v41 = [v40 screen];
  v91 = v3;
  v88 = self;
  v74 = v39;
  if (v41)
  {
    v42 = [v39 window];
    v43 = [v42 screen];
    [v43 nativeScale];
    double v45 = v44;
  }
  else
  {
    v42 = +[UIScreen mainScreen];
    [v42 nativeScale];
    double v45 = v46;
  }

  double v47 = 1.0;
  if (v45 > 0.0) {
    double v47 = 1.0 / v45;
  }
  v48 = [v37 constraintEqualToAnchor:v38 constant:v47];
  v97[3] = v48;
  [v25 leadingAnchor];
  v49 = v72 = (void *)v38;
  v50 = [v10 leadingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  v97[4] = v51;
  v52 = [v25 trailingAnchor];
  v53 = [v10 trailingAnchor];
  [v52 constraintEqualToAnchor:v53];
  v54 = v92 = v10;
  v97[5] = v54;
  v55 = [v94 heightAnchor];
  LODWORD(v56) = 1148829696;
  [v55 constraintEqualToConstant:44.0 priority:v56];
  v57 = v87 = v25;
  v97[6] = v57;
  v86 = +[NSArray arrayWithObjects:v97 count:7];

  v96 = v93;
  v58 = +[NSArray arrayWithObjects:&v96 count:1];
  id v85 = [v58 mutableCopy];

  v59 = [(VenueFloorViewController *)v88 delegate];
  v60 = [v59 venueFloorViewControllerConstraintsForViewWhenOpen:v88];
  [v85 addObjectsFromArray:v60];

  [(VenueFloorViewController *)v88 setOpenConstraints:v85];
  v81 = [v92 leadingAnchor];
  v83 = [(VenueFloorViewController *)v88 closedPlaceholderView];
  v79 = [v83 leadingAnchor];
  v77 = [v81 constraintEqualToAnchor:v79];
  v95[0] = v77;
  v73 = [v92 trailingAnchor];
  v75 = [(VenueFloorViewController *)v88 closedPlaceholderView];
  v71 = [v75 trailingAnchor];
  v61 = [v73 constraintEqualToAnchor:v71];
  v95[1] = v61;
  v62 = [v92 topAnchor];
  v63 = [(VenueFloorViewController *)v88 closedPlaceholderView];
  v64 = [v63 topAnchor];
  v65 = [v62 constraintEqualToAnchor:v64];
  v95[2] = v65;
  v66 = [v92 bottomAnchor];
  v67 = [(VenueFloorViewController *)v88 closedPlaceholderView];
  v68 = [v67 bottomAnchor];
  v69 = [v66 constraintEqualToAnchor:v68];
  v95[3] = v69;
  v70 = +[NSArray arrayWithObjects:v95 count:4];

  [(VenueFloorViewController *)v88 setClosedConstraints:v70];
  [(VenueFloorViewController *)v88 setFloorOptimalOpenHeightConstraint:v93];
  +[NSLayoutConstraint activateConstraints:v86];
  [(VenueFloorViewController *)v88 setupGestures];
  [(MapsThemeViewController *)v88 updateTheme];
}

- (void)delayConstraintSetupWhileExecuting:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(VenueFloorViewController *)self delayConstraintSetup])
  {
    v4[2]();
  }
  else
  {
    [(VenueFloorViewController *)self setDelayConstraintSetup:1];
    v4[2]();
    [(VenueFloorViewController *)self setDelayConstraintSetup:0];
    [(VenueFloorViewController *)self updateForOpenChangedAnimated:0];
  }
}

- (void)setupGestures
{
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  [(VenueFloorViewController *)self setOpenGestureRecognizer:v3];

  v4 = [(VenueFloorViewController *)self cardView];
  v5 = [(VenueFloorViewController *)self openGestureRecognizer];
  [v4 addGestureRecognizer:v5];

  uint64_t v6 = [(VenueFloorViewController *)self isOpen] ^ 1;
  v7 = [(VenueFloorViewController *)self openGestureRecognizer];
  [v7 setEnabled:v6];

  id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  [(VenueFloorViewController *)self setPressGestureRecognizer:v8];

  id v9 = [(VenueFloorViewController *)self pressGestureRecognizer];
  [v9 setAllowedPressTypes:&off_1013AE160];

  id v10 = [(VenueFloorViewController *)self pressGestureRecognizer];
  [v10 setAllowedTouchTypes:&__NSArray0__struct];

  v11 = [(VenueFloorViewController *)self cardView];
  double v12 = [(VenueFloorViewController *)self pressGestureRecognizer];
  [v11 addGestureRecognizer:v12];

  uint64_t v13 = [(VenueFloorViewController *)self isOpen] ^ 1;
  id v14 = [(VenueFloorViewController *)self pressGestureRecognizer];
  [v14 setEnabled:v13];
}

- (void)setBlurGroupName:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v5;

  id v7 = [(VenueFloorViewController *)self cardView];
  [v7 setBlurGroupName:v4];
}

- (void)setOpen:(BOOL)a3
{
}

- (void)setOpen:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_open != a3)
  {
    BOOL v4 = a4;
    self->_open = a3;
    BOOL v6 = !a3;
    id v7 = [(VenueFloorViewController *)self openGestureRecognizer];
    [v7 setEnabled:v6];

    id v8 = [(VenueFloorViewController *)self pressGestureRecognizer];
    [v8 setEnabled:v6];

    [(VenueFloorViewController *)self updateForOpenChangedAnimated:v4];
    if (v6)
    {
      [(VenueFloorViewController *)self didClose];
    }
    else
    {
      [(VenueFloorViewController *)self didOpen];
    }
  }
}

- (BOOL)isHidden
{
  v2 = [(VenueFloorViewController *)self view];
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
  id v9 = v8;
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
    [(VenueFloorViewController *)self updateHiddenAnimated:v5 completion:v8];
  }
  id v9 = v10;
LABEL_6:
}

- (void)setUserLocationFloorOrdinal:(id)a3
{
  id v5 = a3;
  if (!+[NSNumber number:self->_userLocationFloorOrdinal isEqualToNumber:v5])
  {
    objc_storeStrong((id *)&self->_userLocationFloorOrdinal, a3);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v6 = [(VenueFloorViewController *)self floorCollectionView];
    id v7 = [v6 preparedCells];

    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [v12 floorOrdinal];
            id v14 = [(VenueFloorViewController *)self userLocationFloorOrdinal];
            BOOL v15 = +[NSNumber number:v13 isEqualToNumber:v14];

            [v12 setIsUserLocation:v15];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)lacksSearchResultsForFloorOrdinal:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(VenueFloorViewController *)self delegate];
  BOOL v6 = [(VenueFloorViewController *)self venue];
  id v7 = [v4 shortValue];

  LOBYTE(v4) = [v5 lacksSearchResultsInVenue:v6 forFloorOrdinal:v7];
  return (char)v4;
}

- (void)didChangeSearchResultsInVenue
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned __int8 v3 = [(VenueFloorViewController *)self floorCollectionView];
  id v4 = [v3 preparedCells];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 floorOrdinal];
          [v9 setLacksSearchResults:[self lacksSearchResultsForFloorOrdinal:v10]];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  uint64_t v5 = a5;
  [(VenueFloorViewController *)self setVenue:a3 focusedBuilding:a4 animated:1 forceUpdate:0];
  if (a3)
  {
    [(VenueFloorViewController *)self setDisplayedFloorOrdinal:v5 animated:1];
  }
}

- (BOOL)isFocusedOnVenue:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(VenueFloorViewController *)self venue];
  id v6 = [v5 venueID];
  id v7 = [v4 venueID];

  BOOL v8 = v6 == v7;
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(VenueFloorViewController *)self setVisible:1];
  [(VenueFloorViewController *)self updateForOpenChangedAnimated:0];
  [(VenueFloorViewController *)self updateVenueAndBuildingsAnimated:0 forced:1];
  v5.receiver = self;
  v5.super_class = (Class)VenueFloorViewController;
  [(VenueFloorViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(VenueFloorViewController *)self setVisible:0];
  v5.receiver = self;
  v5.super_class = (Class)VenueFloorViewController;
  [(VenueFloorViewController *)&v5 viewDidDisappear:v3];
}

- (void)handleCloseButtonTap
{
  [(VenueFloorViewController *)self captureUserAction:32 onTarget:644 eventValue:0];

  [(VenueFloorViewController *)self setOpen:0 animated:1];
}

- (void)handleTap:(id)a3
{
  if (![(VenueFloorViewController *)self isOpen])
  {
    [(VenueFloorViewController *)self captureUserAction:31 onTarget:644 eventValue:0];
    [(VenueFloorViewController *)self setOpen:1 animated:1];
  }
}

- (BOOL)shouldBeHidden
{
  if ([(VenueFloorViewController *)self forceHidden]) {
    return 1;
  }
  id v4 = [(VenueFloorViewController *)self venue];
  if (v4)
  {
    objc_super v5 = [(VenueFloorViewController *)self floorOrdinals];
    BOOL v3 = (unint64_t)[v5 count] < 2;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(VenueFloorViewController *)self view];
  unsigned int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    id v7 = [(VenueFloorViewController *)self view];
    [v7 setHidden:v3];

    id v8 = [(VenueFloorViewController *)self closedPlaceholderView];
    [v8 setHidden:v3];
  }
}

- (void)updateHiddenAnimated:(BOOL)a3 completion:(id)a4
{
  unsigned int v6 = (void (**)(void))a4;
  if ([(VenueFloorViewController *)self updateHiddenAnimationActive])
  {
    if (v6)
    {
      id v7 = [(VenueFloorViewController *)self updateHiddenAnimationCompletionBlocks];
      id v8 = objc_retainBlock(v6);
      [v7 addObject:v8];
    }
    goto LABEL_15;
  }
  unsigned int v9 = [(VenueFloorViewController *)self shouldBeHidden];
  if (v9 == [(VenueFloorViewController *)self isHidden]) {
    goto LABEL_11;
  }
  if (!a3)
  {
    if (!v9)
    {
      [(VenueFloorViewController *)self didStartShowing];
      [(VenueFloorViewController *)self setHidden:0];
      [(VenueFloorViewController *)self didFinishShowing];
      if (!v6) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
    [(VenueFloorViewController *)self didStartHiding];
    [(VenueFloorViewController *)self setHidden:1];
    [(VenueFloorViewController *)self setOpen:0 animated:0];
    [(VenueFloorViewController *)self didFinishHiding];
LABEL_11:
    if (!v6) {
      goto LABEL_15;
    }
LABEL_12:
    v6[2](v6);
    goto LABEL_15;
  }
  [(VenueFloorViewController *)self setUpdateHiddenAnimationActive:1];
  uint64_t v10 = [(VenueFloorViewController *)self view];
  long long v11 = v10;
  if (v9)
  {
    long long v12 = [v10 superview];

    if (v12)
    {
      long long v13 = [(VenueFloorViewController *)self closedPlaceholderView];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = [(VenueFloorViewController *)self closedPlaceholderView];
      [v12 convertRect:v22 fromView:v15];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;

      v50 = [(VenueFloorViewController *)self cardView];
      v49 = [v50 leftAnchor];
      v48 = [v12 leftAnchor];
      v57.origin.x = v24;
      v57.origin.y = v26;
      v57.size.width = v28;
      v57.size.height = v30;
      double v47 = [v49 constraintEqualToAnchor:v48 constant:CGRectGetMinX(v57)];
      v56[0] = v47;
      double v46 = [(VenueFloorViewController *)self cardView];
      double v45 = [v46 rightAnchor];
      double v44 = [v12 leftAnchor];
      v58.origin.x = v24;
      v58.origin.y = v26;
      v58.size.width = v28;
      v58.size.height = v30;
      v43 = [v45 constraintEqualToAnchor:v44 constant:CGRectGetMaxX(v58)];
      v56[1] = v43;
      v42 = [(VenueFloorViewController *)self cardView];
      v41 = [v42 topAnchor];
      double v31 = [v12 topAnchor];
      v59.origin.x = v24;
      v59.origin.y = v26;
      v59.size.width = v28;
      v59.size.height = v30;
      v32 = [v41 constraintEqualToAnchor:v31 constant:CGRectGetMinY(v59)];
      v56[2] = v32;
      double v33 = [(VenueFloorViewController *)self cardView];
      uint64_t v34 = [v33 bottomAnchor];
      double v35 = [v12 topAnchor];
      v60.origin.x = v24;
      v60.origin.y = v26;
      v60.size.width = v28;
      v60.size.height = v30;
      v36 = [v34 constraintEqualToAnchor:v35 constant:CGRectGetMaxY(v60)];
      v56[3] = v36;
      uint64_t v37 = +[NSArray arrayWithObjects:v56 count:4];
      uint64_t v38 = (void *)qword_10160FE18;
      qword_10160FE18 = v37;

      v39 = [(VenueFloorViewController *)self closedConstraints];
      +[NSLayoutConstraint deactivateConstraints:v39];

      v40 = [(VenueFloorViewController *)self openConstraints];
      +[NSLayoutConstraint deactivateConstraints:v40];

      +[NSLayoutConstraint activateConstraints:qword_10160FE18];
    }
  }
  else
  {
    [v10 setAlpha:0.0];

    [(VenueFloorViewController *)self setHidden:0];
    long long v12 = [(VenueFloorViewController *)self view];
    [v12 layoutIfNeeded];
  }

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1008BD314;
  v54[3] = &unk_1012E6300;
  char v55 = v9;
  v54[4] = self;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1008BD3D4;
  v51[3] = &unk_1012FF640;
  v51[4] = self;
  char v53 = v9;
  v52 = v6;
  +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v54 completion:v51];

LABEL_15:
}

- (void)updateForOpenChangedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VenueFloorViewController *)self isVisible]
    && ![(VenueFloorViewController *)self delayConstraintSetup])
  {
    if ([(VenueFloorViewController *)self isOpen])
    {
      objc_super v5 = [(VenueFloorViewController *)self closedConstraints];
      +[NSLayoutConstraint deactivateConstraints:v5];

      unsigned int v6 = [(VenueFloorViewController *)self openConstraints];
      +[NSLayoutConstraint activateConstraints:v6];

      [(VenueFloorViewController *)self updateFloorOptimalOpenHeightConstraint];
    }
    else
    {
      id v7 = [(VenueFloorViewController *)self openConstraints];
      +[NSLayoutConstraint deactivateConstraints:v7];

      id v8 = [(VenueFloorViewController *)self closedConstraints];
      +[NSLayoutConstraint activateConstraints:v8];
    }
    BOOL v9 = [(VenueFloorViewController *)self isOpen];
    uint64_t v10 = [(VenueFloorViewController *)self floorCollectionView];
    [v10 setScrollEnabled:v9];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1008BD914;
    v16[3] = &unk_1012E5D08;
    v16[4] = self;
    long long v11 = objc_retainBlock(v16);
    long long v12 = v11;
    if (v3)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1008BD974;
      v14[3] = &unk_1012E5F78;
      v14[4] = self;
      double v15 = v11;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1008BD9BC;
      v13[3] = &unk_1012E7D28;
      v13[4] = self;
      +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v14 completion:v13];
    }
    else
    {
      ((void (*)(void *))v11[2])(v11);
      [(VenueFloorViewController *)self updateShowSelection];
    }
  }
}

- (void)updateCloseButtonVisibility
{
  if ([(VenueFloorViewController *)self isOpen]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [(VenueFloorViewController *)self closeButton];
  [v4 setAlpha:v3];

  uint64_t v5 = [(VenueFloorViewController *)self isOpen] ^ 1;
  id v6 = [(VenueFloorViewController *)self closeButton];
  [v6 setHidden:v5];
}

- (void)updateFloorOptimalOpenHeightConstraint
{
  double v3 = [(VenueFloorViewController *)self floorCollectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;
  id v7 = [(VenueFloorViewController *)self floorOptimalOpenHeightConstraint];
  [v7 setConstant:v6];

  id v8 = [(VenueFloorViewController *)self floorCollectionView];
  [v8 setNeedsLayout];
}

- (void)updateShowSelection
{
}

- (void)updateShowSelectionWithForceClipCorners:(BOOL)a3
{
  uint64_t v4 = [(VenueFloorViewController *)self isOpen] | a3;
  if (v4) {
    double v5 = 10.0;
  }
  else {
    double v5 = 0.0;
  }
  double v6 = [(VenueFloorViewController *)self floorCollectionView];
  [v6 _setContinuousCornerRadius:v5];

  id v7 = [(VenueFloorViewController *)self floorCollectionView];
  [v7 setClipsToBounds:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(VenueFloorViewController *)self floorCollectionView];
  BOOL v9 = [v8 preparedCells];

  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v14 setShowSelection:[self isOpen]];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)updateVenueAndBuildingsAnimated:(BOOL)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v10 = [(VenueFloorViewController *)self venuesManager];
  id v7 = [v10 venueWithFocus];
  id v8 = [(VenueFloorViewController *)self venuesManager];
  BOOL v9 = [v8 venueBuildingWithFocus];
  [(VenueFloorViewController *)self setVenue:v7 focusedBuilding:v9 animated:v5 forceUpdate:v4];
}

- (void)setVenue:(id)a3 focusedBuilding:(id)a4 animated:(BOOL)a5 forceUpdate:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = (VKVenueFeatureMarker *)a3;
  uint64_t v11 = [(VKVenueFeatureMarker *)v10 buildings];
  uint64_t v12 = (void *)v11;
  long long v13 = &__NSArray0__struct;
  if (v11) {
    long long v13 = (void *)v11;
  }
  id v14 = v13;

  if (![(VenueFloorViewController *)self floorsDirty] && !a6 && self->_venue == v10)
  {
    long long v16 = self;
    uint64_t v17 = v7;
    long long v15 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_venue, a3);
  [(VenueFloorViewController *)self setFloorsDirty:1];
  if ([(VenueFloorViewController *)self isHidden]
    || ![(VenueFloorViewController *)self shouldBeHidden]
    || !v7)
  {
    BOOL v38 = v7;
    v40 = v10;
    long long v18 = objc_opt_new();
    double v19 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v39 = v14;
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
          double v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          CGFloat v26 = [v25 floorOrdinals];
          [v19 addObjectsFromArray:v26];

          double v27 = [v25 shortFloorNames];
          [v18 addEntriesFromDictionary:v27];
        }
        id v22 = [v20 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v22);
    }

    CGFloat v28 = [v19 allObjects];
    double v29 = [v28 sortedArrayUsingSelector:"compare:"];
    CGFloat v30 = [v29 reverseObjectEnumerator];
    double v31 = [v30 allObjects];

    if (!a6)
    {
      v32 = [(VenueFloorViewController *)self floorOrdinals];
      if (+[NSArray array:v31 isEqualToArray:v32])
      {
        double v33 = [(VenueFloorViewController *)self shortFloorNames];
        unsigned int v34 = +[NSDictionary dictionary:v18 isEqualToDictionary:v33];

        if (v34)
        {
          [(VenueFloorViewController *)self updateHiddenAnimated:v38 completion:0];
          id v14 = v39;
          id v10 = v40;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
      }
    }
    objc_storeStrong((id *)&self->_floorOrdinals, v31);
    objc_storeStrong((id *)&self->_shortFloorNames, v18);
    [(VenueFloorViewController *)self setFloorsDirty:0];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1008BE2AC;
    v44[3] = &unk_1012E5D08;
    v44[4] = self;
    double v35 = objc_retainBlock(v44);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1008BE2F8;
    v43[3] = &unk_1012E5D08;
    v43[4] = self;
    v36 = objc_retainBlock(v43);
    if (v38)
    {
      id v14 = v39;
      id v10 = v40;
      if ([(VenueFloorViewController *)self shouldBeHidden])
      {
        ((void (*)(void *))v35[2])(v35);
        ((void (*)(void *))v36[2])(v36);
      }
      else
      {
        unsigned int v37 = [(VenueFloorViewController *)self isHidden];
        ((void (*)(void *))v35[2])(v35);
        if (v37)
        {
          ((void (*)(void *))v36[2])(v36);
          [(VenueFloorViewController *)self updateHiddenAnimated:1 completion:0];
        }
        else
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1008BE348;
          v41[3] = &unk_1012E6EA8;
          v42 = v36;
          +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v41 completion:0];
        }
      }
    }
    else
    {
      ((void (*)(void *))v35[2])(v35);
      ((void (*)(void *))v36[2])(v36);
      [(VenueFloorViewController *)self updateHiddenAnimated:0 completion:0];
      id v14 = v39;
      id v10 = v40;
    }

    goto LABEL_32;
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1008BE298;
  v49[3] = &unk_1012E6300;
  v49[4] = self;
  BOOL v50 = a6;
  long long v15 = v49;
  long long v16 = self;
  uint64_t v17 = 1;
LABEL_22:
  [(VenueFloorViewController *)v16 updateHiddenAnimated:v17 completion:v15];
LABEL_33:
}

- (void)updateDisplayedFloorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(VenueFloorViewController *)self venue];

  if (v5)
  {
    id v7 = [(VenueFloorViewController *)self venuesManager];
    double v6 = [(VenueFloorViewController *)self venue];
    -[VenueFloorViewController setDisplayedFloorOrdinal:animated:](self, "setDisplayedFloorOrdinal:animated:", [v7 displayedFloorOrdinalForBuildingsInVenue:v6], v3);
  }
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  id v7 = [(VenueFloorViewController *)self floorOrdinals];
  id v8 = +[NSNumber numberWithShort:v5];
  id v9 = [v7 indexOfObject:v8];

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = +[NSIndexPath indexPathForItem:v9 inSection:0];
    if (v10)
    {
      id v15 = v10;
      uint64_t v11 = [(VenueFloorViewController *)self floorCollectionView];
      uint64_t v12 = [v11 indexPathsForSelectedItems];
      unsigned __int8 v13 = [v12 containsObject:v15];

      if ((v13 & 1) == 0)
      {
        id v14 = [(VenueFloorViewController *)self floorCollectionView];
        [v14 selectItemAtIndexPath:v15 animated:v4 scrollPosition:2];
      }
      id v10 = v15;
    }
  }
}

- (void)scrollToDisplayedFloorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(VenueFloorViewController *)self venue];

  if (v5)
  {
    id v7 = [(VenueFloorViewController *)self venuesManager];
    double v6 = [(VenueFloorViewController *)self venue];
    -[VenueFloorViewController scrollToFloorOrdinal:animated:](self, "scrollToFloorOrdinal:animated:", [v7 displayedFloorOrdinalForBuildingsInVenue:v6], v3);
  }
}

- (void)scrollToFloorOrdinal:(signed __int16)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  id v7 = [(VenueFloorViewController *)self floorOrdinals];
  id v8 = +[NSNumber numberWithShort:v5];
  id v9 = [v7 indexOfObject:v8];

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = +[NSIndexPath indexPathForItem:v9 inSection:0];
    id v10 = [(VenueFloorViewController *)self floorCollectionView];
    [v10 scrollToItemAtIndexPath:v11 atScrollPosition:2 animated:v4];
  }
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v12 = objc_alloc_init((Class)GEOPlaceActionDetails);
  id v9 = [(VenueFloorViewController *)self venue];
  id v10 = [v9 businessID];

  if (v10) {
    [v12 setBusinessID:v10];
  }
  id v11 = +[MKMapService sharedService];
  [v11 captureUserAction:v6 onTarget:v5 eventValue:v8 placeActionDetails:v12];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  BOOL v4 = [(VenueFloorViewController *)self floorOrdinals];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (((unint64_t)[v7 row] & 0x8000000000000000) != 0
    || (id v8 = [v7 item],
        [(VenueFloorViewController *)self floorOrdinals],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 count],
        v9,
        v8 >= v10))
  {
    id v14 = objc_opt_new();
  }
  else
  {
    id v11 = [(VenueFloorViewController *)self floorOrdinals];
    id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

    if (v12)
    {
      unsigned __int8 v13 = +[VenueFloorPickerCell reuseIdentifier];
      id v14 = [v6 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v7];

      id v15 = [(VenueFloorViewController *)self shortFloorNames];
      long long v16 = [v15 objectForKeyedSubscript:v12];

      [v14 setFloorOrdinal:v12];
      [v14 setFloorName:v16];
      uint64_t v17 = [(VenueFloorViewController *)self userLocationFloorOrdinal];
      [v14 setIsUserLocation:[NSNumber number:isEqualToNumber:v12, v17]];

      [v14 setShowSelection:[self isOpen]];
      [v14 setLacksSearchResults:[self lacksSearchResultsForFloorOrdinal:v12]];
    }
    else
    {
      id v14 = objc_opt_new();
    }
  }

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(VenueFloorViewController *)self floorOrdinals];
  id v7 = [v5 item];

  id v15 = [v6 objectAtIndexedSubscript:v7];

  id v8 = [(VenueFloorViewController *)self shortFloorNames];
  id v9 = [v8 objectForKeyedSubscript:v15];

  [(VenueFloorViewController *)self captureUserAction:4006 onTarget:644 eventValue:v9];
  id v10 = [(VenueFloorViewController *)self venuesManager];
  id v11 = [v15 shortValue];
  id v12 = [(VenueFloorViewController *)self venue];
  [v10 setDisplayedFloorOrdinal:v11 forBuildingsInVenue:v12];

  unsigned __int8 v13 = [(VenueFloorViewController *)self venuesManager];
  id v14 = [v13 mapView];
  [v14 setUserTrackingMode:0];
}

- (void)didChangeConstraints
{
  id v3 = [(VenueFloorViewController *)self delegate];
  [v3 venueFloorViewControllerDidChangeConstraints:self];
}

- (void)didStartHiding
{
  id v3 = [(VenueFloorViewController *)self delegate];
  [v3 venueFloorViewControllerDidStartHiding:self];
}

- (void)didFinishHiding
{
  id v3 = [(VenueFloorViewController *)self delegate];
  [v3 venueFloorViewControllerDidFinishHiding:self];
}

- (void)didStartShowing
{
  id v3 = [(VenueFloorViewController *)self delegate];
  [v3 venueFloorViewControllerDidStartShowing:self];
}

- (void)didFinishShowing
{
  id v3 = [(VenueFloorViewController *)self delegate];
  [v3 venueFloorViewControllerDidFinishShowing:self];
}

- (void)didOpen
{
  id v3 = [(VenueFloorViewController *)self delegate];
  [v3 venueFloorViewControllerDidOpen:self];
}

- (void)didClose
{
  id v3 = [(VenueFloorViewController *)self delegate];
  [v3 venueFloorViewControllerDidClose:self];
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (NSNumber)userLocationFloorOrdinal
{
  return self->_userLocationFloorOrdinal;
}

- (VenueFloorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VenueFloorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (BOOL)delayConstraintSetup
{
  return self->_delayConstraintSetup;
}

- (void)setDelayConstraintSetup:(BOOL)a3
{
  self->_delayConstraintSetup = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)visualEffectDisabled
{
  return self->_visualEffectDisabled;
}

- (void)setVisualEffectDisabled:(BOOL)a3
{
  self->_visualEffectDisabled = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (CardView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
}

- (UICollectionView)floorCollectionView
{
  return self->_floorCollectionView;
}

- (void)setFloorCollectionView:(id)a3
{
}

- (NSArray)openConstraints
{
  return self->_openConstraints;
}

- (void)setOpenConstraints:(id)a3
{
}

- (NSArray)closedConstraints
{
  return self->_closedConstraints;
}

- (void)setClosedConstraints:(id)a3
{
}

- (NSLayoutConstraint)floorOptimalOpenHeightConstraint
{
  return self->_floorOptimalOpenHeightConstraint;
}

- (void)setFloorOptimalOpenHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)floorWidthConstraint
{
  return self->_floorWidthConstraint;
}

- (void)setFloorWidthConstraint:(id)a3
{
}

- (BOOL)updateHiddenAnimationActive
{
  return self->_updateHiddenAnimationActive;
}

- (void)setUpdateHiddenAnimationActive:(BOOL)a3
{
  self->_updateHiddenAnimationActive = a3;
}

- (NSMutableArray)updateHiddenAnimationCompletionBlocks
{
  return self->_updateHiddenAnimationCompletionBlocks;
}

- (void)setUpdateHiddenAnimationCompletionBlocks:(id)a3
{
}

- (UITapGestureRecognizer)openGestureRecognizer
{
  return self->_openGestureRecognizer;
}

- (void)setOpenGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void)setPressGestureRecognizer:(id)a3
{
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

- (BOOL)floorsDirty
{
  return self->_floorsDirty;
}

- (void)setFloorsDirty:(BOOL)a3
{
  self->_floorsDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortFloorNames, 0);
  objc_storeStrong((id *)&self->_floorOrdinals, 0);
  objc_storeStrong((id *)&self->_venue, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_openGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_updateHiddenAnimationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_floorWidthConstraint, 0);
  objc_storeStrong((id *)&self->_floorOptimalOpenHeightConstraint, 0);
  objc_storeStrong((id *)&self->_closedConstraints, 0);
  objc_storeStrong((id *)&self->_openConstraints, 0);
  objc_storeStrong((id *)&self->_floorCollectionView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_venuesManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userLocationFloorOrdinal, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);

  objc_storeStrong((id *)&self->_closedPlaceholderView, 0);
}

@end