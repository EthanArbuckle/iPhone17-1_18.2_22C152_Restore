@interface OfflineMapDeviceDetailsSectionController
+ (id)_keyPathsToObserve;
- (NSDate)lastUpdatedDate;
- (OfflineMapDetailsActionSectionControllerDelegate)actionDelegate;
- (OfflineMapDeviceDetailsSectionController)initWithSubscriptionInfo:(id)a3;
- (OfflineMapDeviceDetailsSectionController)initWithSubscriptionInfo:(id)a3 deviceName:(id)a4;
- (id)_actions;
- (id)_subscriptionState;
- (id)sectionView;
- (void)_commonInit;
- (void)_didStopDownload;
- (void)_registerKVOObservers;
- (void)_unregisterKVOObservers;
- (void)_updateRowViews;
- (void)_updateStateRow;
- (void)_updateWaitingRowWithDownloadState:(int64_t)a3 waitingReasons:(unint64_t)a4 userInfo:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActionDelegate:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
@end

@implementation OfflineMapDeviceDetailsSectionController

+ (id)_keyPathsToObserve
{
  return &off_1013ADD10;
}

- (OfflineMapDeviceDetailsSectionController)initWithSubscriptionInfo:(id)a3
{
  id v4 = a3;
  v5 = +[UIDevice currentDevice];
  v6 = [v5 name];
  v7 = [(OfflineMapDeviceDetailsSectionController *)self initWithSubscriptionInfo:v4 deviceName:v6];

  return v7;
}

- (OfflineMapDeviceDetailsSectionController)initWithSubscriptionInfo:(id)a3 deviceName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OfflineMapDeviceDetailsSectionController;
  v7 = [(OfflineMapSectionController *)&v12 initWithSubscriptionInfo:a3];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    deviceName = v7->_deviceName;
    v7->_deviceName = v8;

    [(OfflineMapDeviceDetailsSectionController *)v7 _commonInit];
    v10 = v7;
  }

  return v7;
}

- (id)_subscriptionState
{
  v2 = [(OfflineMapSectionController *)self subscriptionInfo];
  v3 = [v2 state];

  return v3;
}

- (void)_commonInit
{
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v3;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = GEOResultRefinementSort_ptr;
  if (MapsFeature_IsEnabled_StandaloneWatchOffline())
  {
    id v6 = objc_alloc_init(SectionHeaderView);
    sectionHeader = self->_sectionHeader;
    self->_sectionHeader = v6;

    [(SectionHeaderView *)self->_sectionHeader setTitle:self->_deviceName];
    [(SectionHeaderView *)self->_sectionHeader setFirstNonEmptySection:1];
    [(SectionHeaderView *)self->_sectionHeader setShowsBottomHairline:0];
    [(SectionHeaderView *)self->_sectionHeader setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = objc_alloc_init((Class)UIView);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:self->_sectionHeader];
    v47 = [(SectionHeaderView *)self->_sectionHeader topAnchor];
    v45 = [v8 topAnchor];
    v43 = [v47 constraintEqualToAnchor:v45];
    v51[0] = v43;
    v41 = [(SectionHeaderView *)self->_sectionHeader leadingAnchor];
    v39 = [v8 leadingAnchor];
    v38 = [v41 constraintEqualToAnchor:v39 constant:16.0];
    v51[1] = v38;
    v9 = [(SectionHeaderView *)self->_sectionHeader trailingAnchor];
    v10 = [v8 trailingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v51[2] = v11;
    objc_super v12 = [(SectionHeaderView *)self->_sectionHeader bottomAnchor];
    v13 = [v8 bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v51[3] = v14;
    v15 = +[NSArray arrayWithObjects:v51 count:4];
    +[NSLayoutConstraint activateConstraints:v15];

    v5 = GEOResultRefinementSort_ptr;
    v48 = v8;
    [(UIView *)self->_containerView addSubview:v8];
  }
  else
  {
    v48 = 0;
  }
  v16 = (MUPlaceVerticalCardContainerView *)[objc_alloc((Class)MUPlaceVerticalCardContainerView) initWithShowsSeparators:1];
  stackView = self->_stackView;
  self->_stackView = v16;

  [(MUPlaceVerticalCardContainerView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v18) = 1148846080;
  [(MUPlaceVerticalCardContainerView *)self->_stackView setContentHuggingPriority:1 forAxis:v18];
  v19 = +[MUPlaceSectionView cardShadowSectionViewForContentView:self->_stackView sectionHeaderViewModel:0];
  sectionView = self->_sectionView;
  self->_sectionView = v19;

  [(MUPlaceSectionView *)self->_sectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView addSubview:self->_sectionView];
  v44 = [(MUPlaceSectionView *)self->_sectionView leadingAnchor];
  v42 = [(UIView *)self->_containerView leadingAnchor];
  v40 = [v44 constraintEqualToAnchor:v42];
  v50[0] = v40;
  v21 = [(MUPlaceSectionView *)self->_sectionView trailingAnchor];
  v22 = [(UIView *)self->_containerView trailingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v50[1] = v23;
  v24 = [(MUPlaceSectionView *)self->_sectionView bottomAnchor];
  v25 = [(UIView *)self->_containerView bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v50[2] = v26;
  v27 = [v5[501] arrayWithObjects:v50 count:3];
  id v46 = [v27 mutableCopy];

  if (v48)
  {
    v28 = [v48 topAnchor];
    v29 = [(UIView *)self->_containerView topAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v49[0] = v30;
    v31 = [(MUPlaceSectionView *)self->_sectionView topAnchor];
    v32 = [v48 bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v49[1] = v33;
    v34 = +[NSArray arrayWithObjects:v49 count:2];
    v35 = v46;
    [v46 addObjectsFromArray:v34];
  }
  else
  {
    v28 = [(MUPlaceSectionView *)self->_sectionView topAnchor];
    v29 = [(UIView *)self->_containerView topAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v35 = v46;
    [v46 addObject:v30];
  }

  +[NSLayoutConstraint activateConstraints:v35];
  v36 = -[OfflineMapDeviceStateRowView initWithFrame:]([OfflineMapDeviceStateRowView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  stateRow = self->_stateRow;
  self->_stateRow = v36;

  [(OfflineMapDeviceStateRowView *)self->_stateRow setAccessibilityIdentifier:@"DownloadStateRowView"];
  [(OfflineMapDeviceDetailsSectionController *)self _updateStateRow];
  [(OfflineMapDeviceDetailsSectionController *)self _updateRowViews];
  [(OfflineMapDeviceDetailsSectionController *)self _registerKVOObservers];
}

- (void)dealloc
{
  [(OfflineMapDeviceDetailsSectionController *)self _unregisterKVOObservers];
  v3.receiver = self;
  v3.super_class = (Class)OfflineMapDeviceDetailsSectionController;
  [(OfflineMapDeviceDetailsSectionController *)&v3 dealloc];
}

- (void)_registerKVOObservers
{
  objc_super v3 = [(OfflineMapSectionController *)self subscriptionInfo];
  if (v3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [objc_opt_class() _keyPathsToObserve];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) options:0 context:off_1015E83E8];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_unregisterKVOObservers
{
  objc_super v3 = [(OfflineMapSectionController *)self subscriptionInfo];
  if (v3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [objc_opt_class() _keyPathsToObserve];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) context:off_1015E83E8];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setSubscriptionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(OfflineMapSectionController *)self subscriptionInfo];

  if (v5 != v4)
  {
    [(OfflineMapDeviceDetailsSectionController *)self _unregisterKVOObservers];
    v6.receiver = self;
    v6.super_class = (Class)OfflineMapDeviceDetailsSectionController;
    [(OfflineMapSectionController *)&v6 setSubscriptionInfo:v4];
    [(OfflineMapDeviceDetailsSectionController *)self _registerKVOObservers];
  }
}

- (id)sectionView
{
  return self->_containerView;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, a3);

  [(OfflineMapDeviceDetailsSectionController *)self _updateStateRow];
}

- (void)_updateRowViews
{
  objc_super v3 = +[NSMutableArray array];
  id v4 = [(OfflineMapDeviceDetailsSectionController *)self _subscriptionState];
  id v5 = v4;
  if (v4)
  {
    objc_super v6 = (char *)[v4 loadState];
    if ((unint64_t)(v6 - 1) < 2) {
      goto LABEL_11;
    }
    if (v6 == (char *)3 || !v6)
    {
      unint64_t v7 = (unint64_t)[v5 downloadState];
      if (v7 <= 5)
      {
        if (((1 << v7) & 0x31) != 0)
        {
          p_waitingReasonRow = (id *)&self->_waitingReasonRow;
          if (!self->_waitingReasonRow)
          {
            long long v9 = objc_alloc_init(OfflineMapDeviceExplanatoryRowView);
            id v10 = *p_waitingReasonRow;
            id *p_waitingReasonRow = v9;

            [*p_waitingReasonRow setAccessibilityIdentifier:@"WaitingRowView"];
          }
          id v11 = [v5 downloadState];
          long long v12 = [v5 userInfo];
          v13 = [v12 objectForKeyedSubscript:GEOMapDataSubscriptionStateWaitingReasonKey];
          id v14 = [v13 unsignedIntegerValue];
          v15 = [v5 userInfo];
          [(OfflineMapDeviceDetailsSectionController *)self _updateWaitingRowWithDownloadState:v11 waitingReasons:v14 userInfo:v15];

          goto LABEL_12;
        }
        if (((1 << v7) & 6) == 0) {
          goto LABEL_13;
        }
LABEL_11:
        [(OfflineMapDeviceDetailsSectionController *)self _updateStateRow];
        p_waitingReasonRow = (id *)&self->_stateRow;
LABEL_12:
        [v3 addObject:*p_waitingReasonRow];
      }
    }
  }
LABEL_13:
  v16 = [(OfflineMapDeviceDetailsSectionController *)self _actions];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v25 = [objc_alloc((Class)MUButtonCellRowView) initWithFrame:CGRectZero.origin.x, y, width, height];
        [v25 setViewModel:v24];
        [v3 addObject:v25];
      }
      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);
  }
  [(MUPlaceVerticalCardContainerView *)self->_stackView setRowViews:v3];
}

- (id)_actions
{
  return &__NSArray0__struct;
}

- (void)_updateStateRow
{
  objc_super v3 = [(OfflineMapDeviceDetailsSectionController *)self _subscriptionState];
  id v4 = (char *)[v3 loadState];
  if ((unint64_t)(v4 - 1) < 2)
  {
    if (!self->_dateTimeFormatter)
    {
      id v11 = (NSRelativeDateTimeFormatter *)objc_alloc_init((Class)NSRelativeDateTimeFormatter);
      dateTimeFormatter = self->_dateTimeFormatter;
      self->_dateTimeFormatter = v11;

      v13 = +[NSLocale autoupdatingCurrentLocale];
      [(NSRelativeDateTimeFormatter *)self->_dateTimeFormatter setLocale:v13];

      [(NSRelativeDateTimeFormatter *)self->_dateTimeFormatter setDateTimeStyle:1];
      [(NSRelativeDateTimeFormatter *)self->_dateTimeFormatter setFormattingContext:2];
    }
    id v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"Last Updated [Offline Maps Details]" value:@"localized string not found" table:@"Offline"];
    [(OfflineMapDeviceStateRowView *)self->_stateRow setLabelText:v15];

    unint64_t v7 = [(OfflineMapDeviceDetailsSectionController *)self lastUpdatedDate];
    if (v7)
    {
      v16 = +[NSDate date];
      [v16 timeIntervalSinceDate:v7];
      double v18 = v17;

      if (v18 >= 60.0)
      {
        v30 = self->_dateTimeFormatter;
        v20 = +[NSDate now];
        uint64_t v22 = [(NSRelativeDateTimeFormatter *)v30 localizedStringForDate:v7 relativeToDate:v20];
        goto LABEL_20;
      }
      uint64_t v19 = +[NSBundle mainBundle];
      v20 = v19;
      CFStringRef v21 = @"MAP_DETAILS_LAST_UPDATED_VALUE_JUST_NOW";
    }
    else
    {
      uint64_t v19 = +[NSBundle mainBundle];
      v20 = v19;
      CFStringRef v21 = @"MAP_DETAILS_LAST_UPDATED_VALUE_NEVER";
    }
    uint64_t v22 = [v19 localizedStringForKey:v21 value:@"localized string not found" table:@"Offline"];
LABEL_20:
    v31 = (void *)v22;
    [(OfflineMapDeviceStateRowView *)self->_stateRow setValueText:v22];

    [(OfflineMapDeviceStateRowView *)self->_stateRow setTrailingAccessoryView:0];
LABEL_21:

    goto LABEL_22;
  }
  if ((v4 == (char *)3 || !v4) && (char *)[v3 downloadState] - 1 <= (char *)1)
  {
    id v5 = +[NSBundle mainBundle];
    objc_super v6 = [v5 localizedStringForKey:@"MAP_DETAILS_LOADING_STATE_LABEL" value:@"localized string not found" table:@"Offline"];
    [(OfflineMapDeviceStateRowView *)self->_stateRow setLabelText:v6];

    unint64_t v7 = [v3 downloadProgress];
    id v8 = [v3 downloadState];
    long long v9 = [v7 localizedAdditionalDescription];
    id v10 = v9;
    if (v8 == (id)1 || ![v9 length])
    {
      v23 = +[NSBundle mainBundle];
      uint64_t v24 = [v23 localizedStringForKey:@"MAP_DETAILS_LOADING_STATE_VALUE_WAITING" value:@"localized string not found" table:@"Offline"];
      [(OfflineMapDeviceStateRowView *)self->_stateRow setValueText:v24];
    }
    else
    {
      [(OfflineMapDeviceStateRowView *)self->_stateRow setValueText:v10];
    }
    progressView = self->_progressView;
    if (!progressView)
    {
      long long v26 = (MUCircleProgressObservingView *)objc_alloc_init((Class)MUCircleProgressObservingView);
      long long v27 = self->_progressView;
      self->_progressView = v26;

      [(MUCircleProgressObservingView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
      long long v28 = +[UIImageSymbolConfiguration configurationWithPointSize:10.0];
      long long v29 = +[UIImage systemImageNamed:@"stop.fill" withConfiguration:v28];
      [(MUCircleProgressObservingView *)self->_progressView setImage:v29];

      [(MUCircleProgressObservingView *)self->_progressView setAccessibilityIdentifier:@"DownloadProgress"];
      objc_initWeak(&location, self);
      v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472;
      v34 = sub_100681F30;
      v35 = &unk_1012E6708;
      objc_copyWeak(&v36, &location);
      [(MUCircleProgressObservingView *)self->_progressView setPrimaryAction:&v32];
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      progressView = self->_progressView;
    }
    -[MUCircleProgressObservingView setProgress:](progressView, "setProgress:", v7, v32, v33, v34, v35);
    [(OfflineMapDeviceStateRowView *)self->_stateRow setTrailingAccessoryView:self->_progressView];

    goto LABEL_21;
  }
LABEL_22:
}

- (void)_updateWaitingRowWithDownloadState:(int64_t)a3 waitingReasons:(unint64_t)a4 userInfo:(id)a5
{
  char v5 = a4;
  id v8 = a5;
  if (self->_waitingReasonRow)
  {
    id v25 = v8;
    if (a3 == 4)
    {
      long long v9 = +[NSBundle mainBundle];
      id v10 = v9;
      CFStringRef v11 = @"MAP_DETAILS_STATE_DESCRIPTION_FAILED";
    }
    else
    {
      long long v12 = [v8 objectForKeyedSubscript:GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey];
      id v13 = [v12 unsignedIntegerValue];

      if ((v5 & 8) != 0)
      {
        int v15 = MGGetBoolAnswer();
        id v10 = +[NSBundle mainBundle];
        if (v15) {
          CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_PAIRED_DEVICE_WLAN";
        }
        else {
          CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_PAIRED_DEVICE_WIFI";
        }
      }
      else
      {
        if ((v5 & 4) != 0)
        {
          id v10 = objc_alloc_init((Class)NSNumberFormatter);
          [v10 setNumberStyle:3];
          [v10 setMaximumFractionDigits:0];
          v16 = +[NSLocale autoupdatingCurrentLocale];
          [v10 setLocale:v16];

          double v17 = +[NSNumber numberWithDouble:(double)(unint64_t)v13 / 100.0];
          double v18 = [v10 stringFromNumber:v17];

          LODWORD(v17) = MGGetBoolAnswer();
          uint64_t v19 = +[NSBundle mainBundle];
          v20 = v19;
          if (v17) {
            CFStringRef v21 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WLAN_POWER_MIN_BATTERY";
          }
          else {
            CFStringRef v21 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WIFI_POWER_MIN_BATTERY";
          }
          uint64_t v22 = [v19 localizedStringForKey:v21 value:@"localized string not found" table:@"Offline"];
          v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v18);
          [(OfflineMapDeviceExplanatoryRowView *)self->_waitingReasonRow setText:v23];

          goto LABEL_18;
        }
        if ((~v5 & 3) != 0)
        {
          if ((v5 & 2) != 0)
          {
            long long v9 = +[NSBundle mainBundle];
            id v10 = v9;
            CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_POWER";
            goto LABEL_17;
          }
          if ((v5 & 1) == 0)
          {
            long long v9 = +[NSBundle mainBundle];
            id v10 = v9;
            CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_GENERIC";
            goto LABEL_17;
          }
          int v24 = MGGetBoolAnswer();
          id v10 = +[NSBundle mainBundle];
          if (v24) {
            CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WLAN";
          }
          else {
            CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WIFI";
          }
        }
        else
        {
          int v14 = MGGetBoolAnswer();
          id v10 = +[NSBundle mainBundle];
          if (v14) {
            CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WLAN_POWER";
          }
          else {
            CFStringRef v11 = @"MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WIFI_POWER";
          }
        }
      }
      long long v9 = v10;
    }
LABEL_17:
    double v18 = [v9 localizedStringForKey:v11 value:@"localized string not found" table:@"Offline"];
    [(OfflineMapDeviceExplanatoryRowView *)self->_waitingReasonRow setText:v18];
LABEL_18:

    id v8 = v25;
  }
}

- (void)_didStopDownload
{
  id v4 = [(OfflineMapDeviceDetailsSectionController *)self actionDelegate];
  objc_super v3 = [(OfflineMapSectionController *)self subscriptionInfo];
  [v4 offlineMapDetailsActionSectionControllerDidSelectPauseDownload:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015E83E8 == a6)
  {
    [(OfflineMapDeviceDetailsSectionController *)self _updateRowViews];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)OfflineMapDeviceDetailsSectionController;
    -[OfflineMapDeviceDetailsSectionController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (OfflineMapDetailsActionSectionControllerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (OfflineMapDetailsActionSectionControllerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_waitingReasonRow, 0);
  objc_storeStrong((id *)&self->_dateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_stateRow, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end