@interface RoutePlanningOptionsDataSource
+ (BOOL)_isGarage:(id)a3 significantlyDifferentFromGarage:(id)a4;
+ (void)registerCellsInCollectionView:(id)a3;
- (BOOL)_hasUnsavedChanges;
- (BOOL)automaticallySaveChanges;
- (BOOL)hasUnsavedChanges;
- (CyclePreferences)cyclePreferences;
- (DrivePreferences)drivePreferences;
- (NSNumber)usesPreferredNetworksForRouting;
- (TransitPreferences)transitPreferences;
- (TransitPreferencesViewControllerDataSource)transitDataSource;
- (VGVehicle)selectedVehicle;
- (VGVirtualGarage)virtualGarage;
- (WalkPreferences)walkPreferences;
- (id)analyticsTargetProvider;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)dataCoordinator;
- (int)analyticsTarget;
- (int64_t)collectionViewListLayoutAppearanceStyle;
- (int64_t)observedRoutePlanningData;
- (int64_t)transportType;
- (void)_autosaveIfNeeded;
- (void)_commitSelectedVehicle;
- (void)_commitUsesPreferredNetworksForRouting;
- (void)_configureForCurrentState;
- (void)_performAutomaticSave:(id)a3;
- (void)_prepareForCycling;
- (void)_prepareForDrive;
- (void)_prepareForTransit;
- (void)_prepareForWalk;
- (void)_scheduleAutomaticSave;
- (void)_updateAnalyticsTarget;
- (void)_updateCoordinatorWithPreferences;
- (void)_updateFromCoordinator;
- (void)_updateHasUnsavedChanges;
- (void)_updateVirtualGarage:(id)a3;
- (void)commitPreferences;
- (void)configureWithTransportType:(int64_t)a3 displayHints:(id)a4 virtualGarage:(id)a5;
- (void)dealloc;
- (void)prepareContent;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateCyclePreferences:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateDrivePreferences:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransitPreferences:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateVirtualGarage:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateWalkPreferences:(id)a4;
- (void)setAnalyticsTarget:(int)a3;
- (void)setAnalyticsTargetProvider:(id)a3;
- (void)setAutomaticallySaveChanges:(BOOL)a3;
- (void)setCyclePreferences:(id)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setDrivePreferences:(id)a3;
- (void)setHasUnsavedChanges:(BOOL)a3;
- (void)setSelectedVehicle:(id)a3;
- (void)setTransitDataSource:(id)a3;
- (void)setUsesPreferredNetworksForRouting:(id)a3;
- (void)setWalkPreferences:(id)a3;
@end

@implementation RoutePlanningOptionsDataSource

- (void)dealloc
{
  if (self->_countryObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_countryObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOptionsDataSource;
  [(RoutePlanningOptionsDataSource *)&v4 dealloc];
}

- (BOOL)_hasUnsavedChanges
{
  if (self->_transportType != 1) {
    goto LABEL_7;
  }
  id originalSelectedVehicle = self->_originalSelectedVehicle;
  uint64_t v4 = [(RoutePlanningOptionsDataSource *)self selectedVehicle];
  if (originalSelectedVehicle != (id)v4)
  {
    v5 = (void *)v4;
    LOBYTE(v6) = 1;
LABEL_18:

    return v6;
  }
  id originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
  v8 = [(RoutePlanningOptionsDataSource *)self usesPreferredNetworksForRouting];
  unint64_t v9 = (unint64_t)originalUsesPreferredNetworksForRouting;
  unint64_t v10 = v8;
  if (!(v9 | v10))
  {

    goto LABEL_7;
  }
  v11 = (void *)v10;
  unsigned __int8 v12 = [(id)v9 isEqual:v10];

  if (v12)
  {
LABEL_7:
    if (self->_originalPreferences)
    {
      v13 = [(RoutePlanningOptionsDataSource *)self drivePreferences];

      if (v13)
      {
        v14 = [(RoutePlanningOptionsDataSource *)self drivePreferences];
LABEL_17:
        v5 = v14;
        unsigned int v6 = [v14 isEqual:self->_originalPreferences] ^ 1;
        goto LABEL_18;
      }
      v15 = [(RoutePlanningOptionsDataSource *)self walkPreferences];

      if (v15)
      {
        v14 = [(RoutePlanningOptionsDataSource *)self walkPreferences];
        goto LABEL_17;
      }
      v16 = [(RoutePlanningOptionsDataSource *)self transitDataSource];

      if (v16)
      {
        v14 = [(RoutePlanningOptionsDataSource *)self transitPreferences];
        goto LABEL_17;
      }
      v17 = [(RoutePlanningOptionsDataSource *)self cyclePreferences];

      if (v17)
      {
        v14 = [(RoutePlanningOptionsDataSource *)self cyclePreferences];
        goto LABEL_17;
      }
    }
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = 1;
  return v6;
}

- (void)_updateHasUnsavedChanges
{
  BOOL v3 = [(RoutePlanningOptionsDataSource *)self _hasUnsavedChanges];

  [(RoutePlanningOptionsDataSource *)self setHasUnsavedChanges:v3];
}

- (void)setHasUnsavedChanges:(BOOL)a3
{
  if (self->_hasUnsavedChanges == a3)
  {
    if (self->_automaticSaveTimer) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = !a3;
    }
    if (!v4)
    {
      v5 = sub_1005768D4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[Options] Rescheduling autosave timer", buf, 2u);
      }

      [(RoutePlanningOptionsDataSource *)self _scheduleAutomaticSave];
    }
  }
  else
  {
    self->_hasUnsavedChanges = a3;
    if (a3)
    {
      [(RoutePlanningOptionsDataSource *)self _scheduleAutomaticSave];
    }
    else if (self->_automaticSaveTimer)
    {
      unsigned int v6 = sub_1005768D4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[Options] Cancelling autosave timer, no longer have unsaved changes", v8, 2u);
      }

      [(NSTimer *)self->_automaticSaveTimer invalidate];
      automaticSaveTimer = self->_automaticSaveTimer;
      self->_automaticSaveTimer = 0;
    }
  }
}

- (void)setAutomaticallySaveChanges:(BOOL)a3
{
  if (self->_automaticallySaveChanges != a3)
  {
    BOOL v3 = a3;
    self->_automaticallySaveChanges = a3;
    v5 = sub_1005768D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unsigned int v6 = "disable";
      if (v3) {
        unsigned int v6 = "enable";
      }
      int v8 = 136315138;
      unint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Options] Will %s autosave", (uint8_t *)&v8, 0xCu);
    }

    if (!v3)
    {
      [(NSTimer *)self->_automaticSaveTimer invalidate];
      automaticSaveTimer = self->_automaticSaveTimer;
      self->_automaticSaveTimer = 0;
    }
  }
}

- (void)_scheduleAutomaticSave
{
  automaticSaveTimer = self->_automaticSaveTimer;
  if (automaticSaveTimer)
  {
    [(NSTimer *)automaticSaveTimer invalidate];
    BOOL v4 = self->_automaticSaveTimer;
    self->_automaticSaveTimer = 0;
  }
  if ([(RoutePlanningOptionsDataSource *)self automaticallySaveChanges])
  {
    GEOConfigGetDouble();
    double v6 = v5;
    v7 = sub_1005768D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      double v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Options] Will autosave in %#.1fs", (uint8_t *)&v10, 0xCu);
    }

    int v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_performAutomaticSave:" selector:0 userInfo:0 repeats:v6];
    unint64_t v9 = self->_automaticSaveTimer;
    self->_automaticSaveTimer = v8;
  }
}

- (void)_performAutomaticSave:(id)a3
{
  if (self->_automaticSaveTimer != a3) {
    return;
  }
  [a3 invalidate];
  automaticSaveTimer = self->_automaticSaveTimer;
  self->_automaticSaveTimer = 0;

  if ([(RoutePlanningOptionsDataSource *)self hasUnsavedChanges])
  {
    objc_storeStrong(&self->_originalSelectedVehicle, self->_selectedVehicle);
    objc_storeStrong(&self->_originalUsesPreferredNetworksForRouting, self->_usesPreferredNetworksForRouting);
    drivePreferences = self->_drivePreferences;
    if (drivePreferences
      || (drivePreferences = self->_walkPreferences) != 0
      || (drivePreferences = self->_cyclePreferences) != 0)
    {
      id v6 = drivePreferences;
      originalPreferences = self->_originalPreferences;
      self->_originalPreferences = v6;
    }
    else
    {
      transitDataSource = self->_transitDataSource;
      if (!transitDataSource) {
        goto LABEL_8;
      }
      originalPreferences = [(TransitPreferencesViewControllerDataSource *)transitDataSource preferences];
      id v13 = [originalPreferences copy];
      id v14 = self->_originalPreferences;
      self->_originalPreferences = v13;
    }
LABEL_8:
    [(RoutePlanningOptionsDataSource *)self setHasUnsavedChanges:[(RoutePlanningOptionsDataSource *)self _hasUnsavedChanges]];
    int v8 = [(RoutePlanningOptionsDataSource *)self dataCoordinator];

    unint64_t v9 = sub_1005768D4();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[Options] Autosaving to coordinator", buf, 2u);
      }

      [(RoutePlanningOptionsDataSource *)self _updateCoordinatorWithPreferences];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[Options] Autosaving to defaults", v15, 2u);
      }

      [(RoutePlanningOptionsDataSource *)self commitPreferences];
    }
    [(PreferenceValuesDataSource *)self rebuildSections];
    return;
  }
  double v11 = sub_1005768D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Options] Autosave timer fired but no changes to save", v17, 2u);
  }
}

- (void)_autosaveIfNeeded
{
  if (self->_automaticSaveTimer)
  {
    BOOL v3 = sub_1005768D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Options] Forcing existing autosave timer to fire before reconfiguring", v4, 2u);
    }

    [(NSTimer *)self->_automaticSaveTimer fire];
  }
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v4 = a3;
  +[RoutePlanningVehicleCheckmarkRow registerCellsInCollectionView:v4];
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___RoutePlanningOptionsDataSource;
  [super registerCellsInCollectionView:v4];
}

- (void)configureWithTransportType:(int64_t)a3 displayHints:(id)a4 virtualGarage:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  [(RoutePlanningOptionsDataSource *)self _autosaveIfNeeded];
  if (self->_transportType == a3)
  {
    switch(a3)
    {
      case 3:
        displayHints = self->_displayHints;
        unint64_t v15 = (unint64_t)v9;
        id v16 = displayHints;
        if (v15 | (unint64_t)v16)
        {
          v17 = v16;
          unsigned __int8 v18 = [(id)v15 isEqual:v16];

          if ((v18 & 1) == 0)
          {
            v19 = sub_1005768D4();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              LOWORD(v30) = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[Options] Reloading transit options for displayHints change", (uint8_t *)&v30, 2u);
            }

            objc_storeStrong((id *)&self->_displayHints, a4);
            v20 = [TransitPreferencesViewControllerDataSource alloc];
            v21 = [(TransitPreferencesViewControllerDataSource *)self->_transitDataSource preferences];
            v22 = [(TransitPreferencesViewControllerDataSource *)v20 initWithPreferences:v21 displayHints:v15];
            transitDataSource = self->_transitDataSource;
            self->_transitDataSource = v22;

            goto LABEL_20;
          }
        }
        break;
      case 2:
        v24 = sub_1005768D4();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[Options] Reloading walking options", (uint8_t *)&v30, 2u);
        }

        goto LABEL_20;
      case 1:
        if (+[RoutePlanningOptionsDataSource _isGarage:v10 significantlyDifferentFromGarage:self->_virtualGarage])
        {
          double v11 = sub_1005768D4();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v30) = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Options] Reloading drive options for significant virtual garage change", (uint8_t *)&v30, 2u);
          }

          objc_storeStrong((id *)&self->_virtualGarage, a5);
LABEL_20:
          [(PreferenceValuesDataSource *)self rebuildSections];
        }
        break;
      default:
        v29 = sub_1005768D4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[Options] No significant change, skipping any rebuild", (uint8_t *)&v30, 2u);
        }

        break;
    }
  }
  else
  {
    unsigned __int8 v12 = sub_1005768D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 4) {
        CFStringRef v13 = @"Undefined";
      }
      else {
        CFStringRef v13 = *(&off_1012FA428 + a3 - 1);
      }
      int v30 = 138412802;
      CFStringRef v31 = v13;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[Options] Configuring with transportType:%@, displayHints:%@, garage:%@", (uint8_t *)&v30, 0x20u);
    }

    self->_transportType = a3;
    objc_storeStrong((id *)&self->_displayHints, a4);
    objc_storeStrong((id *)&self->_virtualGarage, a5);
    v25 = [v10 selectedVehicle];
    selectedVehicle = self->_selectedVehicle;
    self->_selectedVehicle = v25;

    v27 = self->_selectedVehicle;
    if (v27)
    {
      v28 = +[NSNumber numberWithBool:[(VGVehicle *)v27 usesPreferredNetworksForRouting]];
    }
    else
    {
      v28 = 0;
    }
    objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, v28);
    if (v27) {

    }
    [(RoutePlanningOptionsDataSource *)self _configureForCurrentState];
    [(RoutePlanningOptionsDataSource *)self _updateAnalyticsTarget];
  }
}

- (void)_configureForCurrentState
{
  drivePreferences = self->_drivePreferences;
  self->_drivePreferences = 0;

  walkPreferences = self->_walkPreferences;
  self->_walkPreferences = 0;

  transitDataSource = self->_transitDataSource;
  self->_transitDataSource = 0;

  cyclePreferences = self->_cyclePreferences;
  self->_cyclePreferences = 0;

  id originalPreferences = self->_originalPreferences;
  self->_id originalPreferences = 0;

  id originalSelectedVehicle = self->_originalSelectedVehicle;
  self->_id originalSelectedVehicle = 0;

  id originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
  self->_id originalUsesPreferredNetworksForRouting = 0;

  switch(self->_transportType)
  {
    case 1:
      id v10 = [DrivePreferences alloc];
      double v11 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v12 = [(DrivePreferences *)v10 initWithDefaults:v11];
      CFStringRef v13 = self->_drivePreferences;
      self->_drivePreferences = v12;

      id v14 = sub_1005768D4();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      unint64_t v15 = self->_drivePreferences;
      *(_DWORD *)id v35 = 138412290;
      *(void *)&v35[4] = v15;
      break;
    case 2:
      id v16 = [WalkPreferences alloc];
      v17 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v18 = [(WalkPreferences *)v16 initWithDefaults:v17];
      v19 = self->_walkPreferences;
      self->_walkPreferences = v18;

      id v14 = sub_1005768D4();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      v20 = self->_walkPreferences;
      *(_DWORD *)id v35 = 138412290;
      *(void *)&v35[4] = v20;
      break;
    case 3:
      v21 = [TransitPreferences alloc];
      v22 = +[NSUserDefaults standardUserDefaults];
      id v14 = [(WatchSyncedPreferences *)v21 initWithDefaults:v22];

      v23 = self->_displayHints;
      v24 = [[TransitPreferencesViewControllerDataSource alloc] initWithPreferences:v14 displayHints:v23];
      v25 = self->_transitDataSource;
      self->_transitDataSource = v24;

      v26 = [(TransitPreferencesViewControllerDataSource *)self->_transitDataSource preferences];
      id v27 = [v26 copy];
      id v28 = self->_originalPreferences;
      self->_id originalPreferences = v27;

      v29 = sub_1005768D4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v35 = 138412290;
        *(void *)&v35[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[Options] Loaded %@", v35, 0xCu);
      }

      goto LABEL_12;
    case 5:
      int v30 = [CyclePreferences alloc];
      CFStringRef v31 = +[NSUserDefaults standardUserDefaults];
      __int16 v32 = [(CyclePreferences *)v30 initWithDefaults:v31];
      id v33 = self->_cyclePreferences;
      self->_cyclePreferences = v32;

      id v14 = sub_1005768D4();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      __int16 v34 = self->_cyclePreferences;
      *(_DWORD *)id v35 = 138412290;
      *(void *)&v35[4] = v34;
      break;
    default:
      goto LABEL_13;
  }
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[Options] Loaded %@", v35, 0xCu);
LABEL_12:

LABEL_13:
  [(PreferenceValuesDataSource *)self rebuildSections];
}

- (void)_commitSelectedVehicle
{
  if (self->_transportType == 1)
  {
    v2 = [(RoutePlanningOptionsDataSource *)self selectedVehicle];
    BOOL v3 = sub_1005768D4();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      CFStringRef v13 = +[VGVirtualGarageService sharedService];
      [v13 virtualGarageSelectVehicle:v2];

      return;
    }
    id v4 = v2;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_11;
    }
    objc_super v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [v4 performSelector:"accessibilityIdentifier"];
      int v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_9;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_9:

LABEL_11:
    uint64_t v10 = [v4 displayName];
    double v11 = (void *)v10;
    CFStringRef v12 = @"[Any]";
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    *(_DWORD *)buf = 138412547;
    unint64_t v15 = v9;
    __int16 v16 = 2113;
    CFStringRef v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Options] Saving selected vehicle: %@ \"%{private}@\"", buf, 0x16u);

    goto LABEL_14;
  }
}

- (void)_commitUsesPreferredNetworksForRouting
{
  if (self->_transportType == 1)
  {
    BOOL v3 = [(RoutePlanningOptionsDataSource *)self selectedVehicle];

    if (v3)
    {
      id v4 = [(RoutePlanningOptionsDataSource *)self usesPreferredNetworksForRouting];
      objc_super v5 = sub_1005768D4();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
LABEL_23:

        v23 = +[VGVirtualGarageService sharedService];
        id v24 = [v4 BOOLValue];
        v25 = [(RoutePlanningOptionsDataSource *)self selectedVehicle];
        [v23 virtualGarageSetShouldUsePreferredNetworks:v24 forVehicle:v25];

        return;
      }
      id v6 = v4;
      if (!v6)
      {
        double v11 = @"<nil>";
LABEL_12:

        CFStringRef v12 = v11;
        id v13 = [(RoutePlanningOptionsDataSource *)self selectedVehicle];
        if (!v13)
        {
          unsigned __int8 v18 = @"<nil>";
          goto LABEL_20;
        }
        id v14 = (objc_class *)objc_opt_class();
        unint64_t v15 = NSStringFromClass(v14);
        if (objc_opt_respondsToSelector())
        {
          __int16 v16 = [v13 performSelector:"accessibilityIdentifier"];
          CFStringRef v17 = v16;
          if (v16 && ![v16 isEqualToString:v15])
          {
            unsigned __int8 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

            goto LABEL_18;
          }
        }
        unsigned __int8 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_18:

LABEL_20:
        v19 = [(RoutePlanningOptionsDataSource *)self selectedVehicle];
        uint64_t v20 = [v19 displayName];
        v21 = (void *)v20;
        CFStringRef v22 = @"[Any]";
        *(_DWORD *)buf = 138412803;
        id v27 = v12;
        if (v20) {
          CFStringRef v22 = (const __CFString *)v20;
        }
        __int16 v28 = 2112;
        v29 = v18;
        __int16 v30 = 2113;
        CFStringRef v31 = v22;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Options] Saving uses preferred networks for routing: %@ vehicle: %@ \"%{private}@\"", buf, 0x20u);

        goto LABEL_23;
      }
      v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      if (objc_opt_respondsToSelector())
      {
        id v9 = [v6 performSelector:"accessibilityIdentifier"];
        uint64_t v10 = v9;
        if (v9 && ![v9 isEqualToString:v8])
        {
          double v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

          goto LABEL_10;
        }
      }
      double v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

      goto LABEL_12;
    }
  }
}

- (void)commitPreferences
{
  switch(self->_transportType)
  {
    case 1:
      [(RoutePlanningOptionsDataSource *)self _commitSelectedVehicle];
      [(RoutePlanningOptionsDataSource *)self _commitUsesPreferredNetworksForRouting];
      BOOL v3 = [(RoutePlanningOptionsDataSource *)self drivePreferences];
      goto LABEL_6;
    case 2:
      BOOL v3 = [(RoutePlanningOptionsDataSource *)self walkPreferences];
      goto LABEL_6;
    case 3:
      BOOL v3 = [(RoutePlanningOptionsDataSource *)self transitPreferences];
      goto LABEL_6;
    case 5:
      BOOL v3 = [(RoutePlanningOptionsDataSource *)self cyclePreferences];
LABEL_6:
      id v4 = v3;
      [v3 synchronize];

      break;
    default:
      return;
  }
}

- (TransitPreferences)transitPreferences
{
  return (TransitPreferences *)[(TransitPreferencesViewControllerDataSource *)self->_transitDataSource preferences];
}

- (void)setDrivePreferences:(id)a3
{
  id v4 = (DrivePreferences *)a3;
  if (!self->_originalPreferences || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    objc_storeStrong(&self->_originalPreferences, self->_drivePreferences);
  }
  drivePreferences = self->_drivePreferences;
  self->_drivePreferences = v4;
}

- (void)setWalkPreferences:(id)a3
{
  id v4 = (WalkPreferences *)a3;
  if (!self->_originalPreferences || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    objc_storeStrong(&self->_originalPreferences, self->_walkPreferences);
  }
  walkPreferences = self->_walkPreferences;
  self->_walkPreferences = v4;
}

- (void)setCyclePreferences:(id)a3
{
  id v4 = (CyclePreferences *)a3;
  if (!self->_originalPreferences || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    objc_storeStrong(&self->_originalPreferences, self->_cyclePreferences);
  }
  cyclePreferences = self->_cyclePreferences;
  self->_cyclePreferences = v4;
}

- (void)setSelectedVehicle:(id)a3
{
  id v5 = a3;
  id v6 = sub_1005768D4();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_13;
  }
  id v7 = v5;
  if (!v7)
  {
    CFStringRef v12 = @"<nil>";
    goto LABEL_10;
  }
  int v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v7 performSelector:"accessibilityIdentifier"];
    double v11 = v10;
    if (v10 && ![v10 isEqualToString:v9])
    {
      CFStringRef v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

      goto LABEL_8;
    }
  }
  CFStringRef v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
  uint64_t v13 = [v7 displayName];
  id v14 = (void *)v13;
  CFStringRef v15 = @"[Any]";
  if (v13) {
    CFStringRef v15 = (const __CFString *)v13;
  }
  *(_DWORD *)buf = 138412547;
  CFStringRef v22 = v12;
  __int16 v23 = 2113;
  CFStringRef v24 = v15;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] Selecting vehicle: %@ \"%{private}@\"", buf, 0x16u);

LABEL_13:
  if (!self->_originalSelectedVehicle)
  {
    selectedVehicle = self->_selectedVehicle;
    if (selectedVehicle)
    {
      CFStringRef v17 = selectedVehicle;
    }
    else
    {
      CFStringRef v17 = +[NSNull null];
    }
    id originalSelectedVehicle = self->_originalSelectedVehicle;
    self->_id originalSelectedVehicle = v17;
  }
  objc_storeStrong((id *)&self->_selectedVehicle, a3);
  v19 = self->_selectedVehicle;
  if (v19)
  {
    uint64_t v20 = +[NSNumber numberWithBool:[(VGVehicle *)v19 usesPreferredNetworksForRouting]];
  }
  else
  {
    uint64_t v20 = 0;
  }
  objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, v20);
  if (v19) {

  }
  objc_storeStrong(&self->_originalUsesPreferredNetworksForRouting, self->_usesPreferredNetworksForRouting);
}

- (void)setUsesPreferredNetworksForRouting:(id)a3
{
  id v4 = (NSNumber *)a3;
  id v5 = sub_1005768D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = [(NSNumber *)v4 intValue];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Options] Uses preferred networks for routing: %d", (uint8_t *)v10, 8u);
  }

  if (!self->_originalUsesPreferredNetworksForRouting)
  {
    usesPreferredNetworksForRouting = self->_usesPreferredNetworksForRouting;
    if (usesPreferredNetworksForRouting)
    {
      id v7 = usesPreferredNetworksForRouting;
    }
    else
    {
      id v7 = +[NSNull null];
    }
    id originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
    self->_id originalUsesPreferredNetworksForRouting = v7;
  }
  id v9 = self->_usesPreferredNetworksForRouting;
  self->_usesPreferredNetworksForRouting = v4;
}

- (void)_updateVirtualGarage:(id)a3
{
  id v5 = a3;
  if ([(id)objc_opt_class() _isGarage:self->_virtualGarage significantlyDifferentFromGarage:v5])
  {
    id v6 = sub_1005768D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] Using updated garage: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)&self->_virtualGarage, a3);
    id originalSelectedVehicle = self->_originalSelectedVehicle;
    self->_id originalSelectedVehicle = 0;

    int v8 = [v5 selectedVehicle];
    selectedVehicle = self->_selectedVehicle;
    self->_selectedVehicle = v8;

    id originalUsesPreferredNetworksForRouting = self->_originalUsesPreferredNetworksForRouting;
    self->_id originalUsesPreferredNetworksForRouting = 0;

    double v11 = self->_selectedVehicle;
    if (v11)
    {
      CFStringRef v12 = +[NSNumber numberWithBool:[(VGVehicle *)v11 usesPreferredNetworksForRouting]];
    }
    else
    {
      CFStringRef v12 = 0;
    }
    objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, v12);
    if (v11) {

    }
    if (self->_transportType == 1) {
      [(PreferenceValuesDataSource *)self rebuildSections];
    }
  }
}

- (void)prepareContent
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningOptionsDataSource;
  [(PreferenceValuesDataSource *)&v6 prepareContent];
  int64_t transportType = self->_transportType;
  if (transportType)
  {
    if (self->_countryObserver)
    {
      id v4 = +[NSNotificationCenter defaultCenter];
      [v4 removeObserver:self->_countryObserver];

      countryObserver = self->_countryObserver;
      self->_countryObserver = 0;
    }
    switch(transportType)
    {
      case 1:
        [(RoutePlanningOptionsDataSource *)self _prepareForDrive];
        break;
      case 2:
        [(RoutePlanningOptionsDataSource *)self _prepareForWalk];
        break;
      case 3:
        [(RoutePlanningOptionsDataSource *)self _prepareForTransit];
        break;
      case 5:
        [(RoutePlanningOptionsDataSource *)self _prepareForCycling];
        break;
      default:
        return;
    }
  }
}

- (void)_prepareForDrive
{
  objc_initWeak(&location, self);
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Avoid Tolls" value:@"localized string not found" table:0];

  id v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Avoid Highways" value:@"localized string not found" table:0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008396D8;
  v9[3] = &unk_1012FA2D8;
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  [(PreferenceValuesDataSource *)self addSectionWithTitle:0 content:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_prepareForWalk
{
  objc_initWeak(&location, self);
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Avoid Hills" value:@"localized string not found" table:0];

  id v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Avoid Busy Roads" value:@"localized string not found" table:0];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Avoid Stairs" value:@"localized string not found" table:0];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100839F50;
  v12[3] = &unk_1012FA360;
  id v9 = v4;
  id v13 = v9;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v14 = v10;
  id v11 = v8;
  id v15 = v11;
  [(PreferenceValuesDataSource *)self addSectionWithTitle:0 content:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_prepareForTransit
{
  id v3 = objc_initWeak(&location, self);
  id v4 = [(RoutePlanningOptionsDataSource *)self transitDataSource];

  uint64_t v5 = (uint64_t)[v4 numberOfSections];
  if (v5 >= 1)
  {
    objc_super v6 = 0;
    do
    {
      id v7 = [v4 numberOfRowsInSection:v6];
      if ([v4 normalizedSectionIndex:v6]) {
        break;
      }
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10083A978;
      v8[3] = &unk_1012FA3A8;
      id v9 = v4;
      v10[1] = v6;
      _DWORD v10[2] = 0;
      v10[3] = v7;
      objc_copyWeak(v10, &location);
      [(PreferenceValuesDataSource *)self addSectionWithTitle:0 content:v8];
      objc_destroyWeak(v10);

      ++v6;
    }
    while ((char *)v5 != v6);
  }

  objc_destroyWeak(&location);
}

- (void)_prepareForCycling
{
  objc_initWeak(&location, self);
  if (!self->_countryObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    id v4 = +[NSOperationQueue mainQueue];
    uint64_t v5 = GEOCountryConfigurationCountryCodeDidChangeNotification;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10083B168;
    v18[3] = &unk_1012E6730;
    objc_copyWeak(&v19, &location);
    objc_super v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v18];
    countryObserver = self->_countryObserver;
    self->_countryObserver = v6;

    objc_destroyWeak(&v19);
  }
  if (sub_10050B784())
  {
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Avoid Hills" value:@"localized string not found" table:0];

    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Avoid Busy Roads" value:@"localized string not found" table:0];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10083B1A8;
    v14[3] = &unk_1012FA2D8;
    id v12 = v9;
    id v15 = v12;
    objc_copyWeak(&v17, &location);
    id v13 = v11;
    id v16 = v13;
    [(PreferenceValuesDataSource *)self addSectionWithTitle:0 content:v14];

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);
}

- (void)_updateFromCoordinator
{
  id v3 = [(RoutePlanningDataCoordination *)self->_dataCoordinator desiredTransportType];
  id v7 = [(RoutePlanningDataCoordination *)self->_dataCoordinator routeCollection];
  id v4 = [v7 currentRoute];
  uint64_t v5 = [v4 displayHints];
  objc_super v6 = [(RoutePlanningDataCoordination *)self->_dataCoordinator virtualGarage];
  [(RoutePlanningOptionsDataSource *)self configureWithTransportType:v3 displayHints:v5 virtualGarage:v6];
}

- (void)_updateCoordinatorWithPreferences
{
  switch(self->_transportType)
  {
    case 0:
      id v3 = sub_1005768D4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Options] Coordinator has no current session, updating defaults instead", (uint8_t *)&v15, 2u);
      }

      [(RoutePlanningOptionsDataSource *)self commitPreferences];
      return;
    case 1:
      id v4 = sub_1005768D4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = [(RoutePlanningOptionsDataSource *)self drivePreferences];
        int v15 = 138412290;
        int64_t v16 = (int64_t)v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v15, 0xCu);
      }
      [(RoutePlanningOptionsDataSource *)self _commitSelectedVehicle];
      [(RoutePlanningOptionsDataSource *)self _commitUsesPreferredNetworksForRouting];
      objc_super v6 = [(RoutePlanningOptionsDataSource *)self dataCoordinator];
      id v7 = [(RoutePlanningOptionsDataSource *)self drivePreferences];
      [v6 updateDrivePreferences:v7];
      goto LABEL_19;
    case 2:
      id v8 = sub_1005768D4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(RoutePlanningOptionsDataSource *)self walkPreferences];
        int v15 = 138412290;
        int64_t v16 = (int64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v15, 0xCu);
      }
      objc_super v6 = [(RoutePlanningOptionsDataSource *)self dataCoordinator];
      id v7 = [(RoutePlanningOptionsDataSource *)self walkPreferences];
      [v6 updateWalkPreferences:v7];
      goto LABEL_19;
    case 3:
      id v10 = sub_1005768D4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(RoutePlanningOptionsDataSource *)self transitPreferences];
        int v15 = 138412290;
        int64_t v16 = (int64_t)v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v15, 0xCu);
      }
      objc_super v6 = [(RoutePlanningOptionsDataSource *)self dataCoordinator];
      id v7 = [(RoutePlanningOptionsDataSource *)self transitPreferences];
      [v6 updateTransitPreferences:v7];
      goto LABEL_19;
    case 5:
      id v13 = sub_1005768D4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [(RoutePlanningOptionsDataSource *)self cyclePreferences];
        int v15 = 138412290;
        int64_t v16 = (int64_t)v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Options] Updating coordinator with %@", (uint8_t *)&v15, 0xCu);
      }
      objc_super v6 = [(RoutePlanningOptionsDataSource *)self dataCoordinator];
      id v7 = [(RoutePlanningOptionsDataSource *)self cyclePreferences];
      [v6 updateCyclePreferences:v7];
LABEL_19:

      break;
    default:
      objc_super v6 = sub_1005768D4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int64_t transportType = self->_transportType;
        int v15 = 134217984;
        int64_t v16 = transportType;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Options] Unsupported transport type %lu", (uint8_t *)&v15, 0xCu);
      }
      break;
  }
}

+ (BOOL)_isGarage:(id)a3 significantlyDifferentFromGarage:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    id v7 = [(id)v5 selectedVehicle];
    id v8 = [(id)v6 selectedVehicle];
    unint64_t v9 = v7;
    unint64_t v10 = v8;
    if (v9 | v10)
    {
      id v11 = (void *)v10;
      unsigned int v12 = [(id)v9 isEqual:v10];

      if (!v12) {
        goto LABEL_5;
      }
    }
    id v13 = [(id)v5 selectedVehicle];
    unsigned int v14 = [v13 usesPreferredNetworksForRouting];
    int v15 = [(id)v6 selectedVehicle];
    unsigned int v16 = [v15 usesPreferredNetworksForRouting];

    if (v14 == v16)
    {
      unsigned __int8 v18 = [(id)v5 vehicles];
      id v19 = [v18 count];
      uint64_t v20 = [(id)v6 vehicles];
      BOOL v17 = v19 != [v20 count];
    }
    else
    {
LABEL_5:
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)setAnalyticsTargetProvider:(id)a3
{
  id v4 = [a3 copy];
  id analyticsTargetProvider = self->_analyticsTargetProvider;
  self->_id analyticsTargetProvider = v4;

  [(RoutePlanningOptionsDataSource *)self _updateAnalyticsTarget];
}

- (void)_updateAnalyticsTarget
{
  id v3 = [(RoutePlanningOptionsDataSource *)self analyticsTargetProvider];

  if (v3)
  {
    id v4 = [(RoutePlanningOptionsDataSource *)self analyticsTargetProvider];
    self->_analyticsTarget = v4[2](v4, self->_transportType);
  }
  else
  {
    self->_analyticsTarget = 0;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningOptionsDataSource;
  id v5 = a3;
  unint64_t v6 = [(PreferenceValuesDataSource *)&v10 collectionView:v5 cellForItemAtIndexPath:a4];
  uint64_t v7 = sub_1000BBB44(v5);

  if (v7 == 5)
  {
    id v8 = +[UIBackgroundConfiguration clearConfiguration];
    [v6 setBackgroundConfiguration:v8];
  }

  return v6;
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2;
}

- (BOOL)hasUnsavedChanges
{
  return self->_hasUnsavedChanges;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (BOOL)automaticallySaveChanges
{
  return self->_automaticallySaveChanges;
}

- (id)analyticsTargetProvider
{
  return self->_analyticsTargetProvider;
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (DrivePreferences)drivePreferences
{
  return self->_drivePreferences;
}

- (WalkPreferences)walkPreferences
{
  return self->_walkPreferences;
}

- (TransitPreferencesViewControllerDataSource)transitDataSource
{
  return self->_transitDataSource;
}

- (void)setTransitDataSource:(id)a3
{
}

- (CyclePreferences)cyclePreferences
{
  return self->_cyclePreferences;
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (VGVehicle)selectedVehicle
{
  return self->_selectedVehicle;
}

- (NSNumber)usesPreferredNetworksForRouting
{
  return self->_usesPreferredNetworksForRouting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usesPreferredNetworksForRouting, 0);
  objc_storeStrong((id *)&self->_selectedVehicle, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_cyclePreferences, 0);
  objc_storeStrong((id *)&self->_transitDataSource, 0);
  objc_storeStrong((id *)&self->_walkPreferences, 0);
  objc_storeStrong((id *)&self->_drivePreferences, 0);
  objc_storeStrong(&self->_analyticsTargetProvider, 0);
  objc_storeStrong(&self->_originalUsesPreferredNetworksForRouting, 0);
  objc_storeStrong(&self->_originalSelectedVehicle, 0);
  objc_storeStrong(&self->_originalPreferences, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_automaticSaveTimer, 0);
  objc_storeStrong((id *)&self->_countryObserver, 0);

  objc_storeStrong((id *)&self->_dataCoordinator, 0);
}

- (id)dataCoordinator
{
  return self->_dataCoordinator;
}

- (void)setDataCoordinator:(id)a3
{
  id v5 = (RoutePlanningDataCoordination *)a3;
  dataCoordinator = self->_dataCoordinator;
  if (dataCoordinator != v5)
  {
    uint64_t v7 = v5;
    [(RoutePlanningDataCoordination *)dataCoordinator removeObserver:self];
    objc_storeStrong((id *)&self->_dataCoordinator, a3);
    [(RoutePlanningDataCoordination *)self->_dataCoordinator addObserver:self];
    [(RoutePlanningOptionsDataSource *)self _updateFromCoordinator];
    id v5 = v7;
  }
}

- (int64_t)observedRoutePlanningData
{
  return 94608;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateDrivePreferences:(id)a4
{
  id v6 = a4;
  if (self->_transportType == 1)
  {
    id v8 = v6;
    unsigned __int8 v7 = [(WatchSyncedPreferences *)self->_drivePreferences isEqual:v6];
    id v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_drivePreferences, a4);
      [(PreferenceValuesDataSource *)self rebuildSections];
      id v6 = v8;
    }
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateWalkPreferences:(id)a4
{
  id v6 = a4;
  if (self->_transportType == 2)
  {
    id v8 = v6;
    unsigned __int8 v7 = [(WatchSyncedPreferences *)self->_walkPreferences isEqual:v6];
    id v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_walkPreferences, a4);
      [(PreferenceValuesDataSource *)self rebuildSections];
      id v6 = v8;
    }
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransitPreferences:(id)a4
{
  if (self->_transportType == 3)
  {
    id v5 = a4;
    id v6 = [[TransitPreferencesViewControllerDataSource alloc] initWithPreferences:v5 displayHints:self->_displayHints];

    transitDataSource = self->_transitDataSource;
    self->_transitDataSource = v6;

    [(PreferenceValuesDataSource *)self rebuildSections];
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateCyclePreferences:(id)a4
{
  id v6 = a4;
  if (self->_transportType == 5)
  {
    id v8 = v6;
    unsigned __int8 v7 = [(WatchSyncedPreferences *)self->_cyclePreferences isEqual:v6];
    id v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cyclePreferences, a4);
      [(PreferenceValuesDataSource *)self rebuildSections];
      id v6 = v8;
    }
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateVirtualGarage:(id)a4
{
}

@end