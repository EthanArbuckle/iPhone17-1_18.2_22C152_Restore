@interface OfflineMapDetailsViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (GEOMapDataSubscriptionManager)subscriptionManager;
- (MUScrollableStackView)contentStackView;
- (MapDataSubscriptionInfo)subscriptionInfo;
- (ModalCardHeaderView)titleHeaderView;
- (OfflineMapDetailsSectionController)detailsSectionController;
- (OfflineMapDetailsViewController)initWithSubscriptionInfo:(id)a3;
- (OfflineMapDeviceDetailsSectionController)currentDeviceDetailsController;
- (OfflineMapFooterActionsSectionController)footerSectionController;
- (OfflineMapPairedDeviceDetailsSectionController)activeWatchDetailsController;
- (OfflineMapsManagementActionCoordination)delegate;
- (UILabel)legalDisclaimerLabel;
- (void)_dismiss;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateActiveWatchSection:(BOOL)a3;
- (void)_updateCurrentSubscriptionInfo:(id)a3;
- (void)lastUpdatedDateDidChange:(id)a3;
- (void)lastUpdatedDateForPairedDeviceDidChange:(id)a3;
- (void)offlineMapDetailsActionSectionControllerDidSelectAddToPairedDevice:(id)a3;
- (void)offlineMapDetailsActionSectionControllerDidSelectDeleteMap:(id)a3;
- (void)offlineMapDetailsActionSectionControllerDidSelectDownloadNowOnPairedDevice:(id)a3;
- (void)offlineMapDetailsActionSectionControllerDidSelectPauseDownload:(id)a3;
- (void)offlineMapDetailsActionSectionControllerDidSelectRemoveFromPairedDevice:(id)a3;
- (void)offlineMapDetailsActionSectionControllerDidSelectRenameMap:(id)a3 completionHandler:(id)a4;
- (void)offlineMapDetailsActionSectionControllerDidSelectResizeMap:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActiveWatchDetailsController:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setCurrentDeviceDetailsController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsSectionController:(id)a3;
- (void)setFooterSectionController:(id)a3;
- (void)setLegalDisclaimerLabel:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)subscriptionInfosDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation OfflineMapDetailsViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (OfflineMapDetailsViewController)initWithSubscriptionInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OfflineMapDetailsViewController;
  v6 = [(OfflineMapDetailsViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
    id v8 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    [(OfflineMapDetailsViewController *)v7 setSubscriptionManager:v8];
  }
  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OfflineMapDetailsViewController;
  [(ContaineeViewController *)&v3 viewDidLoad];
  [(OfflineMapDetailsViewController *)self _setupViews];
  [(OfflineMapDetailsViewController *)self _setupConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapDetailsViewController;
  [(ContaineeViewController *)&v5 viewWillAppear:a3];
  v4 = +[MapsOfflineUIHelper sharedHelper];
  [v4 addObserver:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapDetailsViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  v4 = +[MapsOfflineUIHelper sharedHelper];
  [v4 removeObserver:self];
}

- (void)_setupViews
{
  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setPresentedModally:1];

  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setTakesAvailableHeight:1];

  v6 = +[UIColor clearColor];
  v7 = [(OfflineMapDetailsViewController *)self view];
  [v7 setBackgroundColor:v6];

  id v8 = [ModalCardHeaderView alloc];
  v9 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  objc_super v10 = [(ModalCardHeaderView *)v8 initWithConfiguration:v9];
  [(OfflineMapDetailsViewController *)self setTitleHeaderView:v10];

  v11 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
  v13 = [v12 subscription];
  v14 = [v13 displayName];
  id v15 = [v14 length];
  if (v15)
  {
    v16 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    v2 = [v16 subscription];
    [v2 displayName];
  }
  else
  {
    v16 = +[NSBundle mainBundle];
    [v16 localizedStringForKey:@"Offline Map" value:@"localized string not found" table:@"Offline"];
  v17 = };
  v18 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  [v18 setTitle:v17];

  if (v15)
  {

    v17 = v2;
  }

  v19 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v20 = [v19 titleLabel];
  [v20 setAlpha:0.0];

  v21 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v22 = [v21 bottomHairline];
  [v22 setAlpha:0.0];

  v23 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  [v23 setUseAdaptiveFont:1];

  v24 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v25 = [v24 titleLabel];
  [v25 setAccessibilityElementsHidden:1];

  v26 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v27 = [v26 leadingButton];
  [v27 setAccessibilityElementsHidden:1];

  v28 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v29 = [v28 trailingButton];
  v30 = sub_100AEBDC4();
  [v29 setTitle:v30 forState:0];

  v31 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v32 = [v31 trailingButton];
  [v32 addTarget:self action:"_dismiss" forControlEvents:0x2000];

  v33 = [(ContaineeViewController *)self headerView];
  v34 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  [v33 addSubview:v34];

  id v35 = [objc_alloc((Class)MUScrollableStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(OfflineMapDetailsViewController *)self setContentStackView:v35];

  v36 = [(OfflineMapDetailsViewController *)self contentStackView];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

  v37 = [(OfflineMapDetailsViewController *)self contentStackView];
  [v37 setSpacing:16.0];

  v38 = [(OfflineMapDetailsViewController *)self contentStackView];
  [v38 setAlwaysBounceVertical:1];

  v39 = [(OfflineMapDetailsViewController *)self contentStackView];
  [v39 setScrollEnabled:1];

  v40 = [(OfflineMapDetailsViewController *)self contentStackView];
  [v40 setDelegate:self];

  v41 = [(OfflineMapDetailsViewController *)self contentStackView];
  [v41 setClipsToBounds:0];

  v42 = [(ContaineeViewController *)self contentView];
  v43 = [(OfflineMapDetailsViewController *)self contentStackView];
  [v42 addSubview:v43];

  id v44 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v45 = [OfflineMapDetailsSectionController alloc];
  v46 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
  v47 = [(OfflineMapDetailsSectionController *)v45 initWithSubscriptionInfo:v46];
  [(OfflineMapDetailsViewController *)self setDetailsSectionController:v47];

  v48 = [(OfflineMapDetailsViewController *)self detailsSectionController];
  [v48 setActionDelegate:self];

  v49 = [(OfflineMapDetailsViewController *)self detailsSectionController];
  [v44 addObject:v49];

  v50 = [OfflineMapDeviceDetailsSectionController alloc];
  v51 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
  v52 = [(OfflineMapDeviceDetailsSectionController *)v50 initWithSubscriptionInfo:v51];
  [(OfflineMapDetailsViewController *)self setCurrentDeviceDetailsController:v52];

  v53 = +[MapsOfflineUIHelper sharedHelper];
  v54 = [v53 lastUpdatedDate];
  v55 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
  [v55 setLastUpdatedDate:v54];

  v56 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
  [v44 addObject:v56];

  [(OfflineMapDetailsViewController *)self _updateActiveWatchSection:0];
  v57 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];

  if (v57)
  {
    v58 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];
    [v44 addObject:v58];
  }
  v59 = [OfflineMapFooterActionsSectionController alloc];
  v60 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
  v61 = [(OfflineMapFooterActionsSectionController *)v59 initWithSubscriptionInfo:v60];
  [(OfflineMapDetailsViewController *)self setFooterSectionController:v61];

  v62 = [(OfflineMapDetailsViewController *)self footerSectionController];
  [v62 setActionDelegate:self];

  v63 = [(OfflineMapDetailsViewController *)self footerSectionController];
  [v44 addObject:v63];

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v64 = v44;
  id v65 = [v64 countByEnumeratingWithState:&v109 objects:v114 count:16];
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = *(void *)v110;
    do
    {
      for (i = 0; i != v66; i = (char *)i + 1)
      {
        if (*(void *)v110 != v67) {
          objc_enumerationMutation(v64);
        }
        contentStackView = self->_contentStackView;
        v70 = [*(id *)(*((void *)&v109 + 1) + 8 * i) sectionView];
        [(MUScrollableStackView *)contentStackView addArrangedSubview:v70];
      }
      id v66 = [v64 countByEnumeratingWithState:&v109 objects:v114 count:16];
    }
    while (v66);
  }

  v71 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];

  if (v71)
  {
    v72 = self->_contentStackView;
    v73 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
    v74 = [v73 sectionView];
    [(MUScrollableStackView *)v72 setCustomSpacing:v74 afterView:24.0];
  }
  if (GEOConfigGetBOOL())
  {
    id v75 = objc_alloc_init((Class)UIView);
    id v76 = objc_alloc_init((Class)UILabel);
    [(OfflineMapDetailsViewController *)self setLegalDisclaimerLabel:v76];

    v77 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote compatibleWithTraitCollection:0];
    v78 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    [v78 setFont:v77];

    v79 = +[UIColor secondaryLabelColor];
    v80 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    [v80 setTextColor:v79];

    v81 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    [v81 setNumberOfLines:0];

    v82 = +[NSBundle mainBundle];
    v83 = [v82 localizedStringForKey:@"REGION_DETAILS_FOOTER_TEXT" value:@"localized string not found" table:@"Offline"];
    v84 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    [v84 setText:v83];

    v85 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    [v85 setTranslatesAutoresizingMaskIntoConstraints:0];

    v86 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    [v75 addSubview:v86];

    v108 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    v107 = [v108 topAnchor];
    v106 = [v75 topAnchor];
    v105 = [v107 constraintEqualToAnchor:v106];
    v113[0] = v105;
    v104 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    v103 = [v104 leadingAnchor];
    v102 = [v75 leadingAnchor];
    v101 = [v103 constraintEqualToAnchor:v102 constant:32.0];
    v113[1] = v101;
    v99 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    v98 = [v99 trailingAnchor];
    v87 = v75;
    v100 = v75;
    v88 = [v75 trailingAnchor];
    v89 = [v98 constraintEqualToAnchor:v88 constant:-32.0];
    v113[2] = v89;
    v90 = [(OfflineMapDetailsViewController *)self legalDisclaimerLabel];
    v91 = [v90 bottomAnchor];
    v92 = [v87 bottomAnchor];
    v93 = [v91 constraintEqualToAnchor:v92];
    v113[3] = v93;
    v94 = +[NSArray arrayWithObjects:v113 count:4];
    +[NSLayoutConstraint activateConstraints:v94];

    [(MUScrollableStackView *)self->_contentStackView addArrangedSubview:v100];
    v95 = self->_contentStackView;
    v96 = [v64 lastObject];
    v97 = [v96 sectionView];
    [(MUScrollableStackView *)v95 setCustomSpacing:v97 afterView:8.0];
  }
  [(OfflineMapDetailsViewController *)self setAccessibilityIdentifier:@"OfflineMapDetailsView"];
}

- (void)_updateActiveWatchSection:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    objc_super v5 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];

    if (v5)
    {
      contentStackView = self->_contentStackView;
      v7 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];
      id v8 = [v7 sectionView];
      [(MUScrollableStackView *)contentStackView removeArrangedSubview:v8];
    }
    if ((MapsFeature_IsEnabled_StandaloneWatchOffline() & 1) == 0)
    {
      v9 = self->_contentStackView;
      objc_super v10 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
      v11 = [v10 sectionView];
      [(MUScrollableStackView *)v9 setCustomSpacing:v11 afterView:3.40282347e38];

LABEL_11:
      [(OfflineMapDetailsViewController *)self setActiveWatchDetailsController:0];
      return;
    }
  }
  else if ((MapsFeature_IsEnabled_StandaloneWatchOffline() & 1) == 0)
  {
    goto LABEL_11;
  }
  v12 = +[NRPairedDeviceRegistry sharedInstance];
  id v35 = [v12 getActivePairedDeviceExcludingAltAccount];

  if (v35
    && (id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"], v14 = objc_msgSend(v35, "supportsCapability:", v13), v13, v14))
  {
    id v15 = [OfflineMapPairedDeviceDetailsSectionController alloc];
    v16 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    v17 = [(OfflineMapPairedDeviceDetailsSectionController *)v15 initWithSubscriptionInfo:v16 device:v35];
    [(OfflineMapDetailsViewController *)self setActiveWatchDetailsController:v17];

    v18 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];
    [v18 setActionDelegate:self];

    v19 = +[MapsOfflineUIHelper sharedHelper];
    v20 = [v19 lastUpdatedDateForPairedDevice];
    v21 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];
    [v21 setLastUpdatedDate:v20];

    if (v3)
    {
      v22 = [(MUScrollableStackView *)self->_contentStackView arrangedSubviews];
      v23 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
      v24 = [v23 sectionView];
      v25 = (char *)[v22 indexOfObject:v24] + 1;

      v26 = self->_contentStackView;
      v27 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];
      v28 = [v27 sectionView];
      [(MUScrollableStackView *)v26 insertArrangedSubview:v28 atIndex:v25];

      v29 = self->_contentStackView;
      v30 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
      v31 = [v30 sectionView];
      [(MUScrollableStackView *)v29 setCustomSpacing:v31 afterView:24.0];
    }
  }
  else
  {
    if (v3)
    {
      v32 = self->_contentStackView;
      v33 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
      v34 = [v33 sectionView];
      [(MUScrollableStackView *)v32 setCustomSpacing:v34 afterView:3.40282347e38];
    }
    [(OfflineMapDetailsViewController *)self setActiveWatchDetailsController:0];
  }
}

- (void)_setupConstraints
{
  v43 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v41 = [v43 topAnchor];
  v42 = [(ContaineeViewController *)self headerView];
  v40 = [v42 topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v44[0] = v39;
  v38 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v36 = [v38 leadingAnchor];
  v37 = [(ContaineeViewController *)self headerView];
  id v35 = [v37 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v44[1] = v34;
  v33 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v31 = [v33 trailingAnchor];
  v32 = [(ContaineeViewController *)self headerView];
  v30 = [v32 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v44[2] = v29;
  v28 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v26 = [v28 bottomAnchor];
  v27 = [(ContaineeViewController *)self headerView];
  v25 = [v27 bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v44[3] = v24;
  v23 = [(OfflineMapDetailsViewController *)self contentStackView];
  v21 = [v23 topAnchor];
  v22 = [(ContaineeViewController *)self contentView];
  v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v44[4] = v19;
  v18 = [(OfflineMapDetailsViewController *)self contentStackView];
  v16 = [v18 leadingAnchor];
  v17 = [(ContaineeViewController *)self contentView];
  id v15 = [v17 leadingAnchor];
  unsigned int v14 = [v16 constraintEqualToAnchor:v15];
  v44[5] = v14;
  id v13 = [(OfflineMapDetailsViewController *)self contentStackView];
  BOOL v3 = [v13 trailingAnchor];
  v4 = [(ContaineeViewController *)self contentView];
  objc_super v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v44[6] = v6;
  v7 = [(OfflineMapDetailsViewController *)self contentStackView];
  id v8 = [v7 bottomAnchor];
  v9 = [(ContaineeViewController *)self contentView];
  objc_super v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v44[7] = v11;
  v12 = +[NSArray arrayWithObjects:v44 count:8];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_dismiss
{
  id v2 = [(OfflineMapDetailsViewController *)self delegate];
  [v2 closeOfflineMapDetails];
}

- (void)_updateCurrentSubscriptionInfo:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
        v9 = [v8 subscription];
        objc_super v10 = [v9 identifier];
        v11 = [v7 subscription];
        v12 = [v11 identifier];
        unsigned int v13 = [v10 isEqualToString:v12];

        if (v13)
        {
          [(OfflineMapDetailsViewController *)self setSubscriptionInfo:v7];
          goto LABEL_11;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setSubscriptionInfo:(id)a3
{
  v6 = (MapDataSubscriptionInfo *)a3;
  if (self->_subscriptionInfo != v6)
  {
    v22 = v6;
    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    v7 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    id v8 = [v7 subscription];
    v9 = [v8 displayName];
    id v10 = [v9 length];
    if (v10)
    {
      v11 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
      id v3 = [v11 subscription];
      [v3 displayName];
    }
    else
    {
      v11 = +[NSBundle mainBundle];
      [v11 localizedStringForKey:@"Offline Map" value:@"localized string not found" table:@"Offline"];
    v12 = };
    unsigned int v13 = [(OfflineMapDetailsViewController *)self titleHeaderView];
    [v13 setTitle:v12];

    if (v10)
    {

      v12 = v3;
    }

    unsigned int v14 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    id v15 = [(OfflineMapDetailsViewController *)self detailsSectionController];
    [v15 setSubscriptionInfo:v14];

    long long v16 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    long long v17 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
    [v17 setSubscriptionInfo:v16];

    long long v18 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    long long v19 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];
    [v19 setSubscriptionInfo:v18];

    v20 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    v21 = [(OfflineMapDetailsViewController *)self footerSectionController];
    [v21 setSubscriptionInfo:v20];

    v6 = v22;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  unsigned int v7 = [v4 clipsToBounds];
  if (v6 <= 0.0)
  {
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ((v7 & 1) == 0) {
LABEL_5:
  }
    [v4 setClipsToBounds:v6 > 0.0];
LABEL_6:
  [v4 contentOffset];
  double v9 = v8;
  id v10 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  [v10 setScrollViewOffset:v9];

  [v4 contentOffset];
  double v12 = v11;
  unsigned int v13 = [(OfflineMapDetailsViewController *)self detailsSectionController];
  unsigned int v14 = [v13 sectionView];
  [v14 frame];
  double MinY = CGRectGetMinY(v24);
  long long v16 = [(OfflineMapDetailsViewController *)self detailsSectionController];
  [v16 regionNameBottomOffsetFromTop];
  double v18 = MinY + v17;

  long long v19 = [(OfflineMapDetailsViewController *)self titleHeaderView];
  v20 = [v19 titleLabel];
  [v20 alpha];
  LODWORD(v16) = v21 <= 0.0;

  if ((((v12 >= v18) ^ v16) & 1) == 0)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100B5D1E0;
    v22[3] = &unk_1012E6300;
    v22[4] = self;
    BOOL v23 = v12 >= v18;
    +[UIView animateWithDuration:v22 animations:0.2];
  }
}

- (void)offlineMapDetailsActionSectionControllerDidSelectDeleteMap:(id)a3
{
  id v4 = a3;
  double v5 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
  double v6 = [v5 subscription];
  unsigned int v7 = [v6 displayName];
  if ([v7 length])
  {
    double v8 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    double v9 = [v8 subscription];
    v31 = [v9 displayName];
  }
  else
  {
    double v8 = +[NSBundle mainBundle];
    v31 = [v8 localizedStringForKey:@"Offline Map" value:@"localized string not found" table:@"Offline"];
  }

  id v10 = [v4 pairedDeviceState];

  if (!v10) {
    goto LABEL_7;
  }
  double v11 = +[NRPairedDeviceRegistry sharedInstance];
  double v12 = [v11 getActivePairedDevice];

  if (!v12) {
    goto LABEL_7;
  }
  unsigned int v13 = [v12 valueForProperty:NRDevicePropertyName];
  unsigned int v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"DELETE_OFFLINE_MAP_CONFIRMATION_MESSAGE_PAIRED_DEVICE" value:@"localized string not found" table:@"Offline"];
  long long v16 = +[UIDevice currentDevice];
  double v17 = [v16 name];
  double v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v31, v17, v13);

  if (!v18)
  {
LABEL_7:
    long long v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"DELETE_OFFLINE_MAP_CONFIRMATION_MESSAGE" value:@"localized string not found" table:@"Offline"];
    double v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v31);
  }
  double v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"DELETE_OFFLINE_MAP_CONFIRMATION_TITLE" value:@"localized string not found" table:@"Offline"];
  BOOL v23 = +[UIAlertController alertControllerWithTitle:v22 message:v18 preferredStyle:1];

  CGRect v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"DELETE_OFFLINE_MAP_CONFIRMATION_ACTION_CANCEL" value:@"localized string not found" table:@"Offline"];
  v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:0];

  [v23 addAction:v26];
  objc_initWeak(&location, self);
  v27 = +[NSBundle mainBundle];
  v28 = [v27 localizedStringForKey:@"DELETE_OFFLINE_MAP_CONFIRMATION_ACTION_DELETE" value:@"localized string not found" table:@"Offline"];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100B5D6C8;
  v32[3] = &unk_101313470;
  objc_copyWeak(&v34, &location);
  id v29 = v4;
  id v33 = v29;
  v30 = +[UIAlertAction actionWithTitle:v28 style:2 handler:v32];

  [v23 addAction:v30];
  [v23 setPreferredAction:v30];
  [(OfflineMapDetailsViewController *)self presentViewController:v23 animated:1 completion:0];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (void)offlineMapDetailsActionSectionControllerDidSelectRenameMap:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(OfflineMapDetailsViewController *)self delegate];
  [v8 presentRenameOfflineMapForSubscriptionInfo:v7 completionHandler:v6];
}

- (void)offlineMapDetailsActionSectionControllerDidSelectResizeMap:(id)a3
{
  id v4 = a3;
  id v5 = [(OfflineMapDetailsViewController *)self delegate];
  [v5 presentOfflineMapRegionSelectorForSubscriptionInfo:v4];
}

- (void)offlineMapDetailsActionSectionControllerDidSelectPauseDownload:(id)a3
{
  id v4 = a3;
  id v7 = [(OfflineMapDetailsViewController *)self subscriptionManager];
  id v5 = [v4 subscription];

  id v6 = [v5 identifier];
  [v7 cancelDownloadForSubscriptionIdentifier:v6];
}

- (void)offlineMapDetailsActionSectionControllerDidSelectAddToPairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(OfflineMapDetailsViewController *)self subscriptionManager];
  id v6 = [v4 subscription];
  id v7 = [v6 identifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B5DB64;
  v9[3] = &unk_1012EB010;
  id v10 = v4;
  id v8 = v4;
  [v5 setSubscriptionWithIdentifier:v7 shouldSyncToPairedDevice:1 callbackQueue:&_dispatch_main_q completionHandler:v9];
}

- (void)offlineMapDetailsActionSectionControllerDidSelectRemoveFromPairedDevice:(id)a3
{
  id v28 = a3;
  id v4 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
  id v5 = [v4 subscription];
  id v6 = [v5 displayName];
  if ([v6 length])
  {
    id v7 = [(OfflineMapDetailsViewController *)self subscriptionInfo];
    id v8 = [v7 subscription];
    uint64_t v9 = [v8 displayName];
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    uint64_t v9 = [v7 localizedStringForKey:@"Offline Map" value:@"localized string not found" table:@"Offline"];
  }

  id v10 = +[NRPairedDeviceRegistry sharedInstance];
  double v11 = [v10 getActivePairedDevice];

  v26 = v11;
  double v12 = [v11 valueForProperty:NRDevicePropertyName];
  unsigned int v13 = +[NSBundle mainBundle];
  unsigned int v14 = [v13 localizedStringForKey:@"REMOVE_OFFLINE_MAP_FROM_PAIRED_DEVICE_CONFIRMATION_MESSAGE" value:@"localized string not found" table:@"Offline"];
  v27 = (void *)v9;
  id v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v9, v12);

  long long v16 = +[NSBundle mainBundle];
  double v17 = [v16 localizedStringForKey:@"REMOVE_OFFLINE_MAP_FROM_PAIRED_DEVICE_CONFIRMATION_TITLE" value:@"localized string not found" table:@"Offline"];
  double v18 = +[UIAlertController alertControllerWithTitle:v17 message:v15 preferredStyle:1];

  long long v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"REMOVE_OFFLINE_MAP_FROM_PAIRED_DEVICE_CONFIRMATION_ACTION_CANCEL" value:@"localized string not found" table:@"Offline"];
  double v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:0];

  [v18 addAction:v21];
  objc_initWeak(&location, self);
  v22 = +[NSBundle mainBundle];
  BOOL v23 = [v22 localizedStringForKey:@"REMOVE_OFFLINE_MAP_FROM_PAIRED_DEVICE_CONFIRMATION_ACTION_REMOVE" value:@"localized string not found" table:@"Offline"];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100B5DFF0;
  v29[3] = &unk_101313470;
  objc_copyWeak(&v31, &location);
  id v24 = v28;
  id v30 = v24;
  v25 = +[UIAlertAction actionWithTitle:v23 style:2 handler:v29];

  [v18 addAction:v25];
  [v18 setPreferredAction:v25];
  [(OfflineMapDetailsViewController *)self presentViewController:v18 animated:1 completion:0];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)offlineMapDetailsActionSectionControllerDidSelectDownloadNowOnPairedDevice:(id)a3
{
  id v4 = a3;
  id v7 = [(OfflineMapDetailsViewController *)self subscriptionManager];
  id v5 = [v4 subscription];

  id v6 = [v5 identifier];
  [v7 startDownloadForPairedDeviceSubscriptionIdentifier:v6 mode:1];
}

- (void)subscriptionInfosDidChange:(id)a3
{
}

- (void)lastUpdatedDateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(OfflineMapDetailsViewController *)self currentDeviceDetailsController];
  [v5 setLastUpdatedDate:v4];
}

- (void)lastUpdatedDateForPairedDeviceDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(OfflineMapDetailsViewController *)self activeWatchDetailsController];
  [v5 setLastUpdatedDate:v4];
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (OfflineMapsManagementActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OfflineMapsManagementActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ModalCardHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (MUScrollableStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (OfflineMapDetailsSectionController)detailsSectionController
{
  return self->_detailsSectionController;
}

- (void)setDetailsSectionController:(id)a3
{
}

- (OfflineMapDeviceDetailsSectionController)currentDeviceDetailsController
{
  return self->_currentDeviceDetailsController;
}

- (void)setCurrentDeviceDetailsController:(id)a3
{
}

- (OfflineMapPairedDeviceDetailsSectionController)activeWatchDetailsController
{
  return self->_activeWatchDetailsController;
}

- (void)setActiveWatchDetailsController:(id)a3
{
}

- (OfflineMapFooterActionsSectionController)footerSectionController
{
  return self->_footerSectionController;
}

- (void)setFooterSectionController:(id)a3
{
}

- (UILabel)legalDisclaimerLabel
{
  return self->_legalDisclaimerLabel;
}

- (void)setLegalDisclaimerLabel:(id)a3
{
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_legalDisclaimerLabel, 0);
  objc_storeStrong((id *)&self->_footerSectionController, 0);
  objc_storeStrong((id *)&self->_activeWatchDetailsController, 0);
  objc_storeStrong((id *)&self->_currentDeviceDetailsController, 0);
  objc_storeStrong((id *)&self->_detailsSectionController, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end