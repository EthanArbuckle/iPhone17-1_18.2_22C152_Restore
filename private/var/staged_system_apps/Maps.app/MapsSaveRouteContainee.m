@interface MapsSaveRouteContainee
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)_doneEnabled;
- (BOOL)shouldCollapseOnMapGesture;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (GEOMapServiceTraits)traits;
- (MapsSaveRouteContainee)initWithDelegate:(id)a3 isEditing:(BOOL)a4 showInitialKeyboard:(BOOL)a5;
- (double)heightForLayout:(unint64_t)a3;
- (void)_pressedCancel;
- (void)_pressedSave;
- (void)_startFetchingAddressIfNeeded;
- (void)_textValuesDidChange;
- (void)didBecomeCurrent;
- (void)setTraits:(id)a3;
- (void)viewDidLoad;
- (void)willBecomeCurrent:(BOOL)a3;
@end

@implementation MapsSaveRouteContainee

- (MapsSaveRouteContainee)initWithDelegate:(id)a3 isEditing:(BOOL)a4 showInitialKeyboard:(BOOL)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MapsSaveRouteContainee;
  v9 = [(MapsSaveRouteContainee *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_isEditing = a4;
    v10->_showInitialKeyboard = a5;
    v11 = [(ContaineeViewController *)v10 cardPresentationController];
    [v11 setHideGrabber:1];

    v12 = [(ContaineeViewController *)v10 cardPresentationController];
    [v12 setPresentedModally:1];

    v13 = [(ContaineeViewController *)v10 cardPresentationController];
    [v13 setAllowsSwipeToDismiss:0];

    v14 = [v8 routeData];
    v15 = [v14 userProvidedName];
    if ([(__CFString *)v15 length]) {
      v16 = v15;
    }
    else {
      v16 = &stru_101324E70;
    }
    objc_storeStrong((id *)&v10->_originalName, v16);
    v17 = [v14 userProvidedNotes];
    if ([(__CFString *)v17 length]) {
      v18 = v17;
    }
    else {
      v18 = &stru_101324E70;
    }
    objc_storeStrong((id *)&v10->_originalNotes, v18);
    dispatch_group_t v19 = dispatch_group_create();
    fetchAddressDispatchGroup = v10->_fetchAddressDispatchGroup;
    v10->_fetchAddressDispatchGroup = (OS_dispatch_group *)v19;
  }
  return v10;
}

- (void)viewDidLoad
{
  v185.receiver = self;
  v185.super_class = (Class)MapsSaveRouteContainee;
  [(ContaineeViewController *)&v185 viewDidLoad];
  [(MapsSaveRouteContainee *)self _startFetchingAddressIfNeeded];
  v3 = [(MapsSaveRouteContainee *)self view];
  [v3 setAccessibilityIdentifier:@"SaveToLibraryView"];

  v4 = [(ContaineeViewController *)self headerView];
  v5 = [ModalCardHeaderView alloc];
  v6 = +[ModalCardHeaderConfiguration libraryCenteredConfiguration];
  v7 = [(ModalCardHeaderView *)v5 initWithConfiguration:v6];

  [(ModalCardHeaderView *)v7 setUseAdaptiveFont:1];
  [(ModalCardHeaderView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = self->_isEditing;
  id v8 = +[NSBundle mainBundle];
  v9 = v8;
  if (v5) {
    CFStringRef v10 = @"[Route Creation] Edit Route Title";
  }
  else {
    CFStringRef v10 = @"[Route Creation] Save Route Title";
  }
  v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
  [(ModalCardHeaderView *)v7 setTitle:v11];

  v12 = [(ModalCardHeaderView *)v7 leadingButton];
  v13 = sub_100AEBD5C();
  [v12 setTitle:v13 forState:0];

  v14 = [(ModalCardHeaderView *)v7 leadingButton];
  [v14 addTarget:self action:"_pressedCancel" forControlEvents:64];

  v15 = [(ModalCardHeaderView *)v7 trailingButton];
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"[Route Creation] Done" value:@"localized string not found" table:0];
  [v15 setTitle:v17 forState:0];

  v18 = [(ModalCardHeaderView *)v7 trailingButton];
  [v18 addTarget:self action:"_pressedSave" forControlEvents:64];

  dispatch_group_t v19 = [(ModalCardHeaderView *)v7 bottomHairline];
  [v19 setHidden:1];

  v184 = v4;
  [v4 addSubview:v7];
  v183 = v7;
  objc_storeStrong((id *)&self->_modalHeaderView, v7);
  v20 = (UIView *)objc_opt_new();
  contentContainer = self->_contentContainer;
  self->_contentContainer = v20;

  [(UIView *)self->_contentContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v22 = [(ContaineeViewController *)self contentView];
  [v22 addSubview:self->_contentContainer];

  v23 = objc_opt_new();
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = +[UIColor secondarySystemGroupedBackgroundColor];
  [v23 setBackgroundColor:v24];

  [v23 _setContinuousCornerRadius:10.0];
  [(UIView *)self->_contentContainer addSubview:v23];
  v25 = (UITextField *)objc_opt_new();
  nameField = self->_nameField;
  self->_nameField = v25;

  [(UITextField *)self->_nameField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_nameField setAccessibilityIdentifier:@"RouteNameTextField"];
  v27 = +[NSBundle mainBundle];
  v28 = [v27 localizedStringForKey:@"[Route Creation] Route Name" value:@"localized string not found" table:0];
  [(UITextField *)self->_nameField setPlaceholder:v28];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v31 = [WeakRetained routeData];

  v32 = [v31 userProvidedName];
  v180 = v31;
  if ([v32 length]) {
    [v31 userProvidedName];
  }
  else {
  v33 = [v31 routeName];
  }
  [(UITextField *)self->_nameField setText:v33];

  v34 = +[UIFont system17SemiBold];
  [(UITextField *)self->_nameField setFont:v34];

  [(UITextField *)self->_nameField setClearButtonMode:1];
  [(UITextField *)self->_nameField setAutocapitalizationType:1];
  [v23 addSubview:self->_nameField];
  v35 = +[NSNotificationCenter defaultCenter];
  [v35 addObserver:self selector:"_textValuesDidChange" name:UITextFieldTextDidChangeNotification object:self->_nameField];

  v36 = objc_opt_new();
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v37) = 1148846080;
  [v36 setContentHuggingPriority:1 forAxis:v37];
  LODWORD(v38) = 1148846080;
  [v36 setContentCompressionResistancePriority:1 forAxis:v38];
  v182 = v36;
  [v23 addSubview:v36];
  v39 = (TextViewWithPlaceholderText *)objc_opt_new();
  notesField = self->_notesField;
  self->_notesField = v39;

  [(TextViewWithPlaceholderText *)self->_notesField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TextViewWithPlaceholderText *)self->_notesField setAccessibilityIdentifier:@"RouteNotesTextView"];
  v41 = +[UIColor clearColor];
  [(TextViewWithPlaceholderText *)self->_notesField setBackgroundColor:v41];

  v42 = +[NSBundle mainBundle];
  [v42 localizedStringForKey:@"[Route Creation] Add notes" value:@"localized string not found" table:0];
  v43 = v181 = v23;
  v44 = [(TextViewWithPlaceholderText *)self->_notesField placeholderLabel];
  [v44 setText:v43];

  v45 = +[UIColor secondaryLabelColor];
  v46 = [(TextViewWithPlaceholderText *)self->_notesField placeholderLabel];
  [v46 setTextColor:v45];

  v47 = +[UIFont system17];
  v48 = [(TextViewWithPlaceholderText *)self->_notesField placeholderLabel];
  [v48 setFont:v47];

  v49 = +[UIFont system17];
  [(TextViewWithPlaceholderText *)self->_notesField setFont:v49];

  [(TextViewWithPlaceholderText *)self->_notesField setDelegate:self];
  v50 = +[UIColor labelColor];
  [(TextViewWithPlaceholderText *)self->_notesField setTextColor:v50];

  id v51 = objc_loadWeakRetained((id *)p_delegate);
  v52 = [v51 routeData];
  v53 = [v52 userProvidedNotes];
  [(TextViewWithPlaceholderText *)self->_notesField setText:v53];

  v54 = v181;
  [v181 addSubview:self->_notesField];
  v55 = +[NSNotificationCenter defaultCenter];
  [v55 addObserver:self selector:"_textValuesDidChange" name:UITextViewTextDidChangeNotification object:self->_notesField];

  if (!self->_isEditing)
  {
    if (GEOSupportsOfflineMaps())
    {
      v56 = +[MapsOfflineUIHelper sharedHelper];
      unsigned __int8 v57 = [v56 isUsingOfflineMaps];

      if ((v57 & 1) == 0)
      {
        id v58 = objc_loadWeakRetained((id *)p_delegate);
        v59 = [v58 routeData];
        v60 = [v59 boundingMapRegion];

        v61 = +[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:v60];
        uint64_t v176 = +[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:v60];
        v62 = +[MapsOfflineUIHelper sharedHelper];
        v63 = [v62 subscriptionInfoForRegion:v176];
        existingOfflineSubscription = self->_existingOfflineSubscription;
        self->_existingOfflineSubscription = v63;

        v65 = [[MapsSaveRouteOfflineDownloadView alloc] initWithRegion:v61 existingSubscription:self->_existingOfflineSubscription];
        offlineDownloadView = self->_offlineDownloadView;
        self->_offlineDownloadView = v65;

        [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView setTranslatesAutoresizingMaskIntoConstraints:0];
        v67 = +[UIColor secondarySystemGroupedBackgroundColor];
        [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView setBackgroundColor:v67];

        [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView _setContinuousCornerRadius:10.0];
        [(UIView *)self->_contentContainer addSubview:self->_offlineDownloadView];
        v68 = (void *)v176;
        if (!self->_existingOfflineSubscription)
        {
          v69 = (UILabel *)objc_alloc_init((Class)UILabel);
          offlineDownloadFooter = self->_offlineDownloadFooter;
          self->_offlineDownloadFooter = v69;

          v71 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote compatibleWithTraitCollection:0];
          [(UILabel *)self->_offlineDownloadFooter setFont:v71];

          v72 = +[UIColor secondaryLabelColor];
          [(UILabel *)self->_offlineDownloadFooter setTextColor:v72];

          [(UILabel *)self->_offlineDownloadFooter setAccessibilityIdentifier:@"DownloadMapFooter"];
          [(UILabel *)self->_offlineDownloadFooter setTranslatesAutoresizingMaskIntoConstraints:0];
          [(UILabel *)self->_offlineDownloadFooter setNumberOfLines:0];
          if (GEOConfigGetBOOL()
            && (+[NSUserDefaults standardUserDefaults],
                v73 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v74 = [v73 BOOLForKey:@"OfflineMapsAutoUpdateDisclaimerDisplayed"], v73, (v74 & 1) == 0))
          {
            v75 = +[NSBundle mainBundle];
            v76 = v75;
            CFStringRef v77 = @"SAVE_ROUTE_DOWNLOAD_MAP_FOOTER_AUTO_UPDATES_DISCLAIMER";
          }
          else
          {
            v75 = +[NSBundle mainBundle];
            v76 = v75;
            CFStringRef v77 = @"SAVE_ROUTE_DOWNLOAD_MAP_FOOTER";
          }
          v78 = [v75 localizedStringForKey:v77 value:@"localized string not found" table:@"Offline"];
          [(UILabel *)self->_offlineDownloadFooter setText:v78];

          [(UIView *)self->_contentContainer addSubview:self->_offlineDownloadFooter];
          v68 = (void *)v176;
        }

        v54 = v181;
      }
    }
  }
  v177 = [(ModalCardHeaderView *)v7 leadingAnchor];
  v173 = [v4 leadingAnchor];
  v171 = [v177 constraintEqualToAnchor:v173];
  v189[0] = v171;
  v169 = [(ModalCardHeaderView *)v7 topAnchor];
  v168 = [v4 topAnchor];
  v167 = [v169 constraintEqualToAnchor:v168];
  v189[1] = v167;
  v166 = [(ModalCardHeaderView *)v7 trailingAnchor];
  v165 = [v4 trailingAnchor];
  v164 = [v166 constraintEqualToAnchor:v165];
  v189[2] = v164;
  v163 = [(ModalCardHeaderView *)v7 bottomAnchor];
  v162 = [v4 bottomAnchor];
  v161 = [v163 constraintEqualToAnchor:v162];
  v189[3] = v161;
  v159 = [(UIView *)self->_contentContainer leadingAnchor];
  v160 = [(ContaineeViewController *)self contentView];
  v158 = [v160 leadingAnchor];
  v157 = [v159 constraintEqualToAnchor:v158];
  v189[4] = v157;
  v155 = [(UIView *)self->_contentContainer trailingAnchor];
  v156 = [(ContaineeViewController *)self contentView];
  v154 = [v156 trailingAnchor];
  v153 = [v155 constraintEqualToAnchor:v154];
  v189[5] = v153;
  v151 = [(UIView *)self->_contentContainer topAnchor];
  v152 = [(ContaineeViewController *)self headerView];
  v150 = [v152 bottomAnchor];
  v149 = [v151 constraintEqualToAnchor:v150];
  v189[6] = v149;
  v148 = [v54 leadingAnchor];
  v147 = [(UIView *)self->_contentContainer leadingAnchor];
  v146 = [v148 constraintEqualToAnchor:v147 constant:16.0];
  v189[7] = v146;
  v145 = [v54 trailingAnchor];
  v144 = [(UIView *)self->_contentContainer trailingAnchor];
  v143 = [v145 constraintEqualToAnchor:v144 constant:-16.0];
  v189[8] = v143;
  v142 = [v54 topAnchor];
  v141 = [(UIView *)self->_contentContainer topAnchor];
  v140 = [v142 constraintEqualToAnchor:v141];
  v189[9] = v140;
  v139 = [(UITextField *)self->_nameField leadingAnchor];
  v138 = [v54 leadingAnchor];
  v137 = [v139 constraintEqualToAnchor:v138 constant:15.0];
  v189[10] = v137;
  v136 = [(UITextField *)self->_nameField trailingAnchor];
  v135 = [v54 trailingAnchor];
  v134 = [v136 constraintEqualToAnchor:v135 constant:-10.0];
  v189[11] = v134;
  v133 = [(UITextField *)self->_nameField topAnchor];
  v132 = [v54 topAnchor];
  v131 = [v133 constraintEqualToAnchor:v132 constant:-1.0];
  v189[12] = v131;
  v130 = [(UITextField *)self->_nameField heightAnchor];
  v129 = [v130 constraintEqualToConstant:48.0];
  v189[13] = v129;
  v128 = [v182 leadingAnchor];
  v127 = [v54 leadingAnchor];
  v126 = [v128 constraintEqualToAnchor:v127 constant:16.0];
  v189[14] = v126;
  v125 = [v182 trailingAnchor];
  v124 = [v54 trailingAnchor];
  v123 = [v125 constraintEqualToAnchor:v124];
  v189[15] = v123;
  v122 = [v182 topAnchor];
  v121 = [(UITextField *)self->_nameField bottomAnchor];
  v120 = [v122 constraintEqualToAnchor:v121];
  v189[16] = v120;
  v119 = [(TextViewWithPlaceholderText *)self->_notesField leadingAnchor];
  v118 = [v54 leadingAnchor];
  v117 = [v119 constraintEqualToAnchor:v118 constant:10.0];
  v189[17] = v117;
  v116 = [(TextViewWithPlaceholderText *)self->_notesField trailingAnchor];
  v115 = [v54 trailingAnchor];
  v114 = [v116 constraintEqualToAnchor:v115 constant:-16.0];
  v189[18] = v114;
  v113 = [(TextViewWithPlaceholderText *)self->_notesField topAnchor];
  v112 = [v182 bottomAnchor];
  v111 = [v113 constraintEqualToAnchor:v112 constant:6.0];
  v189[19] = v111;
  v110 = [(TextViewWithPlaceholderText *)self->_notesField heightAnchor];
  v79 = [v110 constraintEqualToConstant:92.0];
  v189[20] = v79;
  v80 = [(TextViewWithPlaceholderText *)self->_notesField bottomAnchor];
  v81 = [v54 bottomAnchor];
  v82 = [v80 constraintEqualToAnchor:v81 constant:6.0];
  v189[21] = v82;
  v83 = [(UIView *)self->_contentContainer bottomAnchor];
  v84 = [v54 bottomAnchor];
  [v83 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v84 multiplier:1.0];
  v86 = v85 = v54;
  v189[22] = v86;
  v87 = +[NSArray arrayWithObjects:v189 count:23];
  +[NSLayoutConstraint activateConstraints:v87];

  v88 = self->_offlineDownloadView;
  if (v88)
  {
    v178 = [(MapsSaveRouteOfflineDownloadView *)v88 leadingAnchor];
    v174 = [(UIView *)self->_contentContainer leadingAnchor];
    v89 = [v178 constraintEqualToAnchor:v174 constant:16.0];
    v188[0] = v89;
    v90 = [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView trailingAnchor];
    v91 = [(UIView *)self->_contentContainer trailingAnchor];
    v92 = [v90 constraintEqualToAnchor:v91 constant:-16.0];
    v188[1] = v92;
    v93 = [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView topAnchor];
    v94 = [v85 bottomAnchor];
    v95 = [v93 constraintEqualToAnchor:v94 constant:16.0];
    v188[2] = v95;
    v96 = +[NSArray arrayWithObjects:v188 count:3];
    +[NSLayoutConstraint activateConstraints:v96];

    v97 = self->_offlineDownloadFooter;
    if (v97)
    {
      v179 = [(UILabel *)v97 leadingAnchor];
      uint64_t v172 = [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView leadingAnchor];
      uint64_t v170 = [v179 constraintEqualToAnchor:v172 constant:16.0];
      v187[0] = v170;
      v98 = [(UILabel *)self->_offlineDownloadFooter trailingAnchor];
      v175 = [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView trailingAnchor];
      v99 = [v98 constraintEqualToAnchor:v175 constant:-16.0];
      v187[1] = v99;
      v100 = [(UILabel *)self->_offlineDownloadFooter topAnchor];
      v101 = [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView bottomAnchor];
      v102 = [v100 constraintEqualToSystemSpacingBelowAnchor:v101 multiplier:1.0];
      v187[2] = v102;
      v103 = [(UIView *)self->_contentContainer bottomAnchor];
      v104 = [(UILabel *)self->_offlineDownloadFooter bottomAnchor];
      v105 = [v103 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v104 multiplier:1.0];
      v187[3] = v105;
      v106 = +[NSArray arrayWithObjects:v187 count:4];
      +[NSLayoutConstraint activateConstraints:v106];

      v107 = (void *)v172;
      v108 = (void *)v170;

      v109 = v179;
    }
    else
    {
      v109 = [(UIView *)self->_contentContainer bottomAnchor];
      v107 = [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView bottomAnchor];
      v108 = [v109 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v107 multiplier:1.0];
      v186 = v108;
      v98 = +[NSArray arrayWithObjects:&v186 count:1];
      +[NSLayoutConstraint activateConstraints:v98];
    }

    v85 = v181;
  }
}

- (void)_startFetchingAddressIfNeeded
{
  if (!self->_isEditing)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = [WeakRetained routeData];

    uint64_t v5 = [v4 address];
    if (!v5
      || (v6 = (void *)v5,
          [v4 iso3166CountryCode],
          v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 length],
          v7,
          v6,
          (unint64_t)v8 <= 1))
    {
      v9 = [v4 boundingMapRegion];
      CFStringRef v10 = v9;
      if (v9)
      {
        [v9 centerLat];
        double v12 = v11;
        [v10 centerLng];
        double v14 = v13;
        v15 = +[GEOMapService sharedService];
        v16 = [v15 ticketForReverseGeocodeCoordinate:0 shiftLocationsIfNeeded:self->_traits traits:v12 v14];

        v17 = self->_fetchAddressDispatchGroup;
        dispatch_group_enter((dispatch_group_t)v17);
        objc_initWeak(&location, self);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100CCF310;
        v19[3] = &unk_1012EA198;
        objc_copyWeak(&v22, &location);
        v18 = v17;
        v20 = v18;
        id v21 = v4;
        [v16 submitWithHandler:v19 networkActivity:0];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
    }
  }
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 - 3 <= 2)
  {
    double height = UILayoutFittingCompressedSize.height;
    -[ModalCardHeaderView systemLayoutSizeFittingSize:](self->_modalHeaderView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    double v7 = v6;
    -[UIView systemLayoutSizeFittingSize:](self->_contentContainer, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    double v9 = v7 + v8;
    CFStringRef v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 bottomSafeOffset];
    double v3 = v9 + v11;
  }
  return v3;
}

- (BOOL)shouldCollapseOnMapGesture
{
  return 0;
}

- (void)_pressedCancel
{
  double v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed cancel", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained popContainee];
}

- (void)_pressedSave
{
  double v3 = sub_10057683C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "pressed save", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained routeData];

  double v6 = [(UITextField *)self->_nameField text];
  if ([v6 length]) {
    [(UITextField *)self->_nameField text];
  }
  else {
  double v7 = [v5 routeName];
  }

  [v5 setUserProvidedName:v7];
  uint64_t v8 = [(TextViewWithPlaceholderText *)self->_notesField text];
  double v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_101324E70;
  }
  [v5 setUserProvidedNotes:v10];

  dispatch_group_t v11 = dispatch_group_create();
  if (self->_isEditing) {
    goto LABEL_10;
  }
  offlineDownloadView = self->_offlineDownloadView;
  if (!offlineDownloadView
    || ![(MapsSaveRouteOfflineDownloadView *)offlineDownloadView shouldDownload])
  {
    goto LABEL_10;
  }
  int64_t v13 = [(MapsSaveRouteOfflineDownloadView *)self->_offlineDownloadView estimatedRegionSizeInBytes];
  double v14 = +[MapsOfflineUIHelper sharedHelper];
  v15 = [v14 alertControllerForInsufficientDiskSpaceForDownloadSize:v13];

  if (!v15)
  {
    int64_t v36 = v13;
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    dispatch_group_t v19 = [v18 routeData];
    v20 = [v19 boundingMapRegion];
    id v21 = +[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:v20];

    id v22 = sub_10057683C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      int64_t v62 = (int64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Adding offline region: %{private}@", buf, 0xCu);
    }

    if (GEOConfigGetBOOL())
    {
      v23 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v24 = [v23 BOOLForKey:@"OfflineMapsAutoUpdateDisclaimerDisplayed"];

      if ((v24 & 1) == 0)
      {
        v25 = +[NSUserDefaults standardUserDefaults];
        [v25 setBool:1 forKey:@"OfflineMapsAutoUpdateDisclaimerDisplayed"];
      }
    }
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100CCFEEC;
    v58[3] = &unk_101320E78;
    v26 = v11;
    v59 = v26;
    id v27 = v21;
    id v60 = v27;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100CD0184;
    v53[3] = &unk_101320EC8;
    int64_t v57 = v36;
    double v37 = objc_retainBlock(v58);
    id v56 = v37;
    v28 = v26;
    v54 = v28;
    v55 = self;
    v29 = objc_retainBlock(v53);
    dispatch_group_enter(v28);
    v30 = +[GEOMapService sharedService];
    v31 = [v30 ticketForOfflineRegionNameSuggestionWithRegion:v27 traits:0];

    v32 = sub_10057683C();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      int64_t v62 = (int64_t)v31;
      __int16 v63 = 2112;
      id v64 = v27;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Looking up name with ticket %@, region %@", buf, 0x16u);
    }

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100CD03D0;
    v48[3] = &unk_101320EF0;
    id v49 = v27;
    id v50 = v7;
    id v52 = v29;
    id v51 = v28;
    v33 = v29;
    id v34 = v27;
    GEOConfigGetDouble();
    [v31 submitWithHandler:v48 timeout:(uint64_t)v35 networkActivity:0 queue:&_dispatch_main_q];

LABEL_10:
    dispatch_group_enter(v11);
    if (self->_isEditing)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100CD05CC;
      v45[3] = &unk_1012EAC50;
      id v46 = v5;
      v47 = v11;
      +[MapsSavedRoutesManager saveRouteData:v46 completion:v45];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      fetchAddressDispatchGroup = self->_fetchAddressDispatchGroup;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100CD06D0;
      block[3] = &unk_1012E9340;
      objc_copyWeak(&v44, (id *)buf);
      v42 = v11;
      id v43 = v5;
      dispatch_group_notify(fetchAddressDispatchGroup, (dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }
    objc_initWeak((id *)buf, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100CD08AC;
    v38[3] = &unk_1012E6690;
    objc_copyWeak(&v40, (id *)buf);
    id v39 = v5;
    dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v38);

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
    goto LABEL_20;
  }
  v16 = sub_1000493C0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v62 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Displaying insufficient disk space alert for attempted download of %{bytes}llu", buf, 0xCu);
  }

  [(MapsSaveRouteContainee *)self _maps_topMostPresentViewController:v15 animated:1 completion:0];
LABEL_20:
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MapsSaveRouteContainee;
  [(ContaineeViewController *)&v6 willBecomeCurrent:a3];
  BOOL v4 = [(MapsSaveRouteContainee *)self _doneEnabled];
  uint64_t v5 = [(ModalCardHeaderView *)self->_modalHeaderView trailingButton];
  [v5 setEnabled:v4];
}

- (void)didBecomeCurrent
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSaveRouteContainee;
  [(ContaineeViewController *)&v3 didBecomeCurrent];
  if (self->_showInitialKeyboard) {
    [(UITextField *)self->_nameField becomeFirstResponder];
  }
}

- (void)_textValuesDidChange
{
  BOOL v3 = [(MapsSaveRouteContainee *)self _doneEnabled];
  id v4 = [(ModalCardHeaderView *)self->_modalHeaderView trailingButton];
  [v4 setEnabled:v3];
}

- (BOOL)_doneEnabled
{
  BOOL v3 = [(UITextField *)self->_nameField text];
  if ([v3 length])
  {
    id v4 = [(UITextField *)self->_nameField text];
  }
  else
  {
    id v4 = &stru_101324E70;
  }

  uint64_t v5 = [(TextViewWithPlaceholderText *)self->_notesField text];
  if ([v5 length])
  {
    objc_super v6 = [(TextViewWithPlaceholderText *)self->_notesField text];
  }
  else
  {
    objc_super v6 = &stru_101324E70;
  }

  BOOL isEditing = self->_isEditing;
  id v8 = [(__CFString *)v4 length];
  if (isEditing)
  {
    if (v8)
    {
      if ([(NSString *)self->_originalName isEqualToString:v4]) {
        unsigned int v9 = ![(NSString *)self->_originalNotes isEqualToString:v6];
      }
      else {
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = v8 != 0;
  }

  return v9;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  unsigned int v9 = [a3 text];
  CFStringRef v10 = [v9 stringByReplacingCharactersInRange:location length:length withString:v8];

  LOBYTE(location) = (unint64_t)[v10 length] < 0x2711;
  return location;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_offlineDownloadFooter, 0);
  objc_storeStrong((id *)&self->_offlineDownloadView, 0);
  objc_storeStrong((id *)&self->_existingOfflineSubscription, 0);
  objc_storeStrong((id *)&self->_fetchAddressDispatchGroup, 0);
  objc_storeStrong((id *)&self->_originalNotes, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_notesField, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end