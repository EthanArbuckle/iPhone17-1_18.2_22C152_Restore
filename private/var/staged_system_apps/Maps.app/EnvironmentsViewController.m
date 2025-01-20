@interface EnvironmentsViewController
- (BOOL)_isSectionForEnvironments:(int64_t)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (EnvironmentsViewController)initWithStyle:(int64_t)a3;
- (GEOEnvironmentInfo)requestedEnvironment;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_environmentForIndexPath:(id)a3;
- (id)_featureForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSimpleEnvironmentFor:(id)a3 atIndexPath:(id)a4;
- (void)_done:(id)a3;
- (void)_toggleUseProductionURLs:(id)a3;
- (void)dealloc;
- (void)environmentsController:(id)a3 didUpdateEnvironmentInfo:(id)a4 inSection:(int64_t)a5;
- (void)environmentsController:(id)a3 didUpdateEnvironmentsSection:(int64_t)a4;
- (void)errorButtonTapped:(id)a3 withEvent:(id)a4;
- (void)featuresControllerDidReloadFeatureList:(id)a3;
- (void)mapsAuthTokenRequestDidFinish:(id)a3;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)setRequestedEnvironment:(id)a3;
- (void)switchToRequestedEnvironment;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EnvironmentsViewController

- (EnvironmentsViewController)initWithStyle:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)EnvironmentsViewController;
  v3 = [(EnvironmentsViewController *)&v15 initWithStyle:a3];
  v4 = v3;
  if (v3)
  {
    [(EnvironmentsViewController *)v3 setTitle:@"Environments"];
    v5 = [(EnvironmentsViewController *)v4 tableView];
    [v5 setRowHeight:UITableViewAutomaticDimension];

    v6 = [(EnvironmentsViewController *)v4 tableView];
    [v6 setSectionFooterHeight:UITableViewAutomaticDimension];

    v7 = [(EnvironmentsViewController *)v4 tableView];
    [v7 setSectionHeaderHeight:UITableViewAutomaticDimension];

    v8 = +[NSUserDefaults standardUserDefaults];
    v4->_showingCustomEnvironments = [v8 BOOLForKey:@"EnableCustomEnvironmentsInSettings"];

    v9 = (GEOEnvironmentsController *)[objc_alloc((Class)GEOEnvironmentsController) initEnablingCustomEnvironments:v4->_showingCustomEnvironments];
    environmentsController = v4->_environmentsController;
    v4->_environmentsController = v9;

    [(GEOEnvironmentsController *)v4->_environmentsController setDelegate:v4];
    v11 = (GEOFeaturesController *)objc_alloc_init((Class)GEOFeaturesController);
    featuresController = v4->_featuresController;
    v4->_featuresController = v11;

    [(GEOFeaturesController *)v4->_featuresController setDelegate:v4];
    _GEOConfigAddDelegateListenerForKey();
    v13 = v4;
  }

  return v4;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  [(GEOEnvironmentsController *)self->_environmentsController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)EnvironmentsViewController;
  [(EnvironmentsViewController *)&v3 dealloc];
}

- (void)_done:(id)a3
{
  id v3 = [(EnvironmentsViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EnvironmentsViewController;
  [(EnvironmentsViewController *)&v9 viewWillAppear:a3];
  self->_hasAttemptedAuth = 0;
  [(GEOEnvironmentsController *)self->_environmentsController reloadEnvironments];
  v4 = [(EnvironmentsViewController *)self tableView];
  [v4 reloadData];

  v5 = [(EnvironmentsViewController *)self presentingViewController];

  if (v5)
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_done:"];
    v7 = [(EnvironmentsViewController *)self navigationItem];
    [v7 setRightBarButtonItem:v6];
  }
  else
  {
    id v6 = [(EnvironmentsViewController *)self navigationItem];
    [v6 setRightBarButtonItem:0];
  }

  v8 = +[GEOResourceManifestManager modernManager];
  [v8 addTileGroupObserver:self queue:&_dispatch_main_q];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EnvironmentsViewController;
  [(EnvironmentsViewController *)&v5 viewWillDisappear:a3];
  v4 = +[GEOResourceManifestManager modernManager];
  [v4 removeTileGroupObserver:self];
}

- (id)_environmentForIndexPath:(id)a3
{
  environmentsController = self->_environmentsController;
  id v4 = a3;
  objc_super v5 = -[GEOEnvironmentsController environmentInfosForSection:](environmentsController, "environmentInfosForSection:", [v4 section]);
  id v6 = [v4 row];

  v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (id)_featureForIndexPath:(id)a3
{
  featuresController = self->_featuresController;
  id v4 = a3;
  objc_super v5 = [(GEOFeaturesController *)featuresController features];
  id v6 = [v4 row];

  v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (BOOL)_isSectionForEnvironments:(int64_t)a3
{
  if (!a3) {
    return 1;
  }
  return a3 == 1 && self->_showingCustomEnvironments;
}

- (void)errorButtonTapped:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(EnvironmentsViewController *)self tableView];
  objc_super v9 = [v6 touchesForView:v7];

  v10 = [v9 anyObject];
  v11 = [(EnvironmentsViewController *)self tableView];
  [v10 locationInView:v11];
  [v8 indexPathForRowAtPoint:];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v12 = [(EnvironmentsViewController *)self tableView];
    [(EnvironmentsViewController *)self tableView:v12 accessoryButtonTappedForRowWithIndexPath:v13];
  }
}

- (void)_toggleUseProductionURLs:(id)a3
{
  [a3 isOn];
  GEOConfigSetSyncBOOL();
  _GEOConfigRemoveValueSync();
  _GEOConfigRemoveValueSync();
  _GEOConfigRemoveValueSync();
  _GEOConfigRemoveValueSync();
  id v3 = +[GEONetworkDefaults sharedNetworkDefaults];
  [v3 updateNetworkDefaults:0];
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v4 = [@"com.apple.geoservices" stringByAppendingString:@".siri_data_changed"];
  notify_post((const char *)[v4 UTF8String]);

  id v5 = [(EnvironmentsViewController *)self tableView];
  [v5 reloadData];
}

- (void)mapsAuthTokenRequestDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:GEOMapsAuthRequestTypeKey];

  id v7 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
  [v7 removeMapsAuthDidFinishObserver:self forRequestType:v6];

  v8 = [v4 userInfo];
  objc_super v9 = [v8 objectForKeyedSubscript:GEOMapsAuthSuccessKey];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    if (![v6 isEqualToString:GEOMapsAuthACToken])
    {
      if ([v6 isEqualToString:GEOMapsAuthEnvironmentSwitch])
      {
        v17 = [(EnvironmentsViewController *)self requestedEnvironment];
        [v17 makeActive];
      }
      else
      {
        if (![v6 isEqualToString:GEOMapsAuthFeatureFlags]) {
          goto LABEL_25;
        }
        v17 = [(EnvironmentsViewController *)self tableView];
        [v17 reloadData];
      }

      goto LABEL_25;
    }
    [(EnvironmentsViewController *)self switchToRequestedEnvironment];
  }
  else if ([v6 isEqualToString:GEOMapsAuthEnvironmentSwitch])
  {
    v11 = [v4 userInfo];
    v12 = [v11 objectForKeyedSubscript:GEOMapsAuthFailReasonKey];
    id v13 = [v12 integerValue];

    if (v13 == (id)4 || self->_hasAttemptedAuth)
    {
      v14 = [v4 userInfo];
      objc_super v15 = [v14 objectForKeyedSubscript:GEOMapsAuthEnvironmentKey];

      switch((unint64_t)v13)
      {
        case 0xFFFFFFFFFFFFFFFFLL:
        case 6uLL:
          v16 = @"Invalid error";
          break;
        case 0uLL:
          v16 = @"Authentication failed for an unknown reason";
          break;
        case 1uLL:
          v16 = @"Invalid Authentication Session (MAT)";
          break;
        case 2uLL:
          v16 = @"Invalid Authentication Session (MRT)";
          break;
        case 3uLL:
          v16 = @"You do not have permissions to access this environment";
          break;
        case 4uLL:
          +[NSString stringWithFormat:@"You are missing the required group access for %@. You can request access and try again when granted access.", v15];
          goto LABEL_21;
        case 5uLL:
          +[NSString stringWithFormat:@"The environment %@ does not have the proper URL(s)", v15];
LABEL_21:
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          v16 = 0;
          break;
      }
      v26 = +[UIAlertController alertControllerWithTitle:@"Environment Auth Failed" message:v16 preferredStyle:1];
      v27 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
      [v26 addAction:v27];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100D206BC;
      v28[3] = &unk_1012E5D08;
      v28[4] = self;
      [(EnvironmentsViewController *)self presentViewController:v26 animated:1 completion:v28];
    }
    else
    {
      self->_hasAttemptedAuth = 1;
      v18 = +[GEOResourceManifestManager modernManager];
      objc_super v15 = [v18 activeTileGroup];

      v19 = [(EnvironmentsViewController *)self requestedEnvironment];
      v20 = [v19 resourceManifest];
      v21 = [v20 resources];
      v22 = [v15 dataSet];
      v16 = [v21 preferedURLSetFor:v22];

      v23 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
      [v23 addMapsAuthDidFinishObserver:self forRequestType:GEOMapsAuthACToken];

      v24 = [(__CFString *)v16 authProxyURL];
      v25 = [v24 nsURL];
      +[MapsAppleConnectAuthViewController presentAppleConnectAuthControllerFrom:self withProxyURL:v25];
    }
  }
LABEL_25:
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == GeoServicesConfig_ClientAuthFeatureFlagsStateInfo
    && a3.var1 == (void *)*((void *)&GeoServicesConfig_ClientAuthFeatureFlagsStateInfo + 1))
  {
    id v4 = [(EnvironmentsViewController *)self tableView];
    [v4 reloadData];
  }
}

- (void)environmentsController:(id)a3 didUpdateEnvironmentsSection:(int64_t)a4
{
  id v6 = [(EnvironmentsViewController *)self tableView];
  id v5 = +[NSIndexSet indexSetWithIndex:a4];
  [v6 reloadSections:v5 withRowAnimation:100];
}

- (void)environmentsController:(id)a3 didUpdateEnvironmentInfo:(id)a4 inSection:(int64_t)a5
{
  environmentsController = self->_environmentsController;
  id v8 = a4;
  objc_super v9 = [(GEOEnvironmentsController *)environmentsController environmentInfosForSection:a5];
  id v10 = [v9 indexOfObject:v8];

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [(EnvironmentsViewController *)self tableView];
    v12 = +[NSIndexPath indexPathForRow:v10 inSection:a5];
    v14 = v12;
    id v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v11 reloadRowsAtIndexPaths:v13 withRowAnimation:100];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_showingCustomEnvironments) {
    return 3;
  }
  else {
    return 2;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(EnvironmentsViewController *)self _isSectionForEnvironments:a4])
  {
    id v6 = [(GEOEnvironmentsController *)self->_environmentsController environmentInfosForSection:a4];
    id v7 = (char *)[v6 count];
    if (a4)
    {
      unsigned int v9 = a4 == 1 && self->_showingCustomEnvironments;
    }
    else
    {
      v11 = +[GEOPlatform sharedPlatform];
      unsigned int v9 = [v11 isInternalInstall];
    }
    id v10 = &v7[v9];
  }
  else
  {
    id v6 = [(GEOFeaturesController *)self->_featuresController features];
    id v10 = (char *)[v6 count];
  }

  return (int64_t)v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 2) {
    return @"If you have questions about features, please contact Maps Feature Delivery (Maps-Feature-Delivery@group.apple.com).";
  }
  else {
    return &stru_101324E70;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_showingCustomEnvironments && [v7 section] == (id)1)
  {
    unsigned int v9 = [v8 row];
    if (v9 == (char *)[(EnvironmentsViewController *)self tableView:v6 numberOfRowsInSection:1]- 1)
    {
      id v10 = (EnvironmentTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
      v11 = [(EnvironmentTableViewCell *)v10 textLabel];
      [v11 setText:@"Add Environment"];

      id v12 = +[UIButton buttonWithType:5];
      id v13 = +[UIColor systemGreenColor];
      [v12 setTintColor:v13];

      [v12 setUserInteractionEnabled:0];
      [(EnvironmentTableViewCell *)v10 setAccessoryView:v12];
      goto LABEL_20;
    }
  }
  if (![v8 section])
  {
    v14 = +[GEOPlatform sharedPlatform];
    if ([v14 isInternalInstall])
    {
      objc_super v15 = (char *)[v8 row];
      v16 = (char *)[(EnvironmentsViewController *)self tableView:v6 numberOfRowsInSection:0]- 1;

      if (v15 == v16)
      {
        id v10 = (EnvironmentTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
        [(EnvironmentTableViewCell *)v10 setSelectionStyle:0];
        id v12 = objc_alloc_init((Class)UILabel);
        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v12 setText:@"Use Production URLs"];
        v17 = [(EnvironmentTableViewCell *)v10 contentView];
        [v17 addSubview:v12];

        id v18 = [objc_alloc((Class)UISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        [v18 setOn:GEOConfigGetBOOL()];
        [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v18 addTarget:self action:"_toggleUseProductionURLs:" forControlEvents:4096];
        v19 = [(EnvironmentTableViewCell *)v10 contentView];
        [v19 addSubview:v18];

        v20 = [(EnvironmentTableViewCell *)v10 contentView];
        v21 = _NSDictionaryOfVariableBindings(@"useProductionSwitch, titleLabel", v18, v12, 0);
        v22 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:[useProductionSwitch]-[titleLabel]", 0, 0, v21);
        [v20 addConstraints:v22];

        v23 = [(EnvironmentTableViewCell *)v10 contentView];
        v24 = [(EnvironmentTableViewCell *)v10 contentView];
        v25 = +[NSLayoutConstraint constraintWithItem:v18 attribute:5 relatedBy:0 toItem:v24 attribute:17 multiplier:1.0 constant:0.0];
        [v23 addConstraint:v25];

        v26 = [(EnvironmentTableViewCell *)v10 contentView];
        v27 = [(EnvironmentTableViewCell *)v10 contentView];
        v28 = +[NSLayoutConstraint constraintWithItem:v18 attribute:10 relatedBy:0 toItem:v27 attribute:10 multiplier:1.0 constant:0.0];
        [v26 addConstraint:v28];

        v29 = [(EnvironmentTableViewCell *)v10 contentView];
        v30 = [(EnvironmentTableViewCell *)v10 contentView];
        v31 = +[NSLayoutConstraint constraintWithItem:v12 attribute:10 relatedBy:0 toItem:v30 attribute:10 multiplier:1.0 constant:0.0];
        [v29 addConstraint:v31];

        v32 = [(EnvironmentTableViewCell *)v10 contentView];
        v33 = [(EnvironmentTableViewCell *)v10 contentView];
        v34 = +[NSLayoutConstraint constraintWithItem:v12 attribute:6 relatedBy:-1 toItem:v33 attribute:18 multiplier:1.0 constant:0.0];
        [v32 addConstraint:v34];

        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  if (-[EnvironmentsViewController _isSectionForEnvironments:](self, "_isSectionForEnvironments:", [v8 section]))
  {
    id v12 = [(EnvironmentsViewController *)self _environmentForIndexPath:v8];
    if (v12)
    {
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"EnvironmentCell"];
      if (!v10)
      {
        id v10 = [[EnvironmentTableViewCell alloc] initWithReuseIdentifier:@"EnvironmentCell"];
        v35 = [(EnvironmentTableViewCell *)v10 errorButton];
        [v35 addTarget:self action:"errorButtonTapped:withEvent:" forControlEvents:64];
      }
      v36 = [v12 displayName];
      v37 = [(EnvironmentTableViewCell *)v10 textLabel];
      [v37 setText:v36];

      v38 = [v12 releaseName];
      v39 = [(EnvironmentTableViewCell *)v10 detailTextLabel];
      [v39 setText:v38];

      [(EnvironmentTableViewCell *)v10 configureFromEnvironment:v12];
      goto LABEL_20;
    }
LABEL_19:
    id v10 = 0;
    goto LABEL_20;
  }
  id v12 = [(EnvironmentsViewController *)self _featureForIndexPath:v8];
  if (!v12) {
    goto LABEL_19;
  }
  id v10 = [v6 dequeueReusableCellWithIdentifier:@"FeatureCell"];
  if (!v10) {
    id v10 = [[FeatureTableViewCell alloc] initWithReuseIdentifier:@"FeatureCell"];
  }
  [(EnvironmentTableViewCell *)v10 configureFromFeature:v12];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100D2108C;
  v41[3] = &unk_1012E5D08;
  id v42 = v12;
  [(EnvironmentTableViewCell *)v10 setToggleFeatureBlock:v41];

LABEL_20:

  return v10;
}

- (void)switchToRequestedEnvironment
{
  id v3 = +[GEOResourceManifestManager modernManager];
  id v15 = [v3 activeTileGroup];

  id v4 = [(EnvironmentsViewController *)self requestedEnvironment];
  id v5 = [v4 resourceManifest];
  id v6 = [v5 resources];
  id v7 = [v15 dataSet];
  id v8 = [v6 preferedURLSetFor:v7];

  unsigned int v9 = GEOConfigGetString();
  if (([v9 isEqualToString:GEOMapsAuthUseProxyNever] & 1) == 0
    && (([v8 hasAuthProxyURL] & 1) != 0
     || [v9 isEqualToString:GEOMapsAuthUseProxyAlways]))
  {
    id v10 = [v8 authProxyURL];
    v11 = [v10 nsURL];

    id v12 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    [v12 addMapsAuthDidFinishObserver:self forRequestType:GEOMapsAuthEnvironmentSwitch];
    id v13 = [(EnvironmentsViewController *)self requestedEnvironment];
    v14 = [v13 name];
    [v12 doEnvironmentSwitchCheck:v14 authProxyURL:v11 suppressNotification:1];
  }
  else
  {
    v11 = [(EnvironmentsViewController *)self requestedEnvironment];
    [v11 makeActive];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (![v6 section])
  {
    id v7 = +[GEOPlatform sharedPlatform];
    if ([v7 isInternalInstall])
    {
      id v8 = (char *)[v6 row];
      unsigned int v9 = (char *)[(EnvironmentsViewController *)self tableView:v14 numberOfRowsInSection:0]- 1;

      if (v8 == v9) {
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  if (self->_showingCustomEnvironments
    && [v6 section] == (id)1
    && (id v10 = [v6 row],
        v10 == (char *)[(EnvironmentsViewController *)self tableView:v14 numberOfRowsInSection:1]- 1))
  {
    [(EnvironmentsViewController *)self _addSimpleEnvironmentFor:v14 atIndexPath:v6];
  }
  else if (-[EnvironmentsViewController _isSectionForEnvironments:](self, "_isSectionForEnvironments:", [v6 section]))
  {
    v11 = [(EnvironmentsViewController *)self _environmentForIndexPath:v6];
    [(EnvironmentsViewController *)self setRequestedEnvironment:v11];

    id v12 = [(EnvironmentsViewController *)self requestedEnvironment];
    id v13 = [v12 state];

    if (v13 == (id)2) {
      [(EnvironmentsViewController *)self switchToRequestedEnvironment];
    }
  }
LABEL_13:
}

- (void)_addSimpleEnvironmentFor:(id)a3 atIndexPath:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D21528;
  v9[3] = &unk_1012E78C8;
  v9[4] = self;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[EnvironmentsCreationAlertController alertControllerWithTitle:@"Add Environment" message:@"What's the name of the environment you would like to add?" nameSelectionHandler:v9];
  [(EnvironmentsViewController *)self presentViewController:v8 animated:1 completion:0];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v13 = a4;
  unsigned int v5 = -[EnvironmentsViewController _isSectionForEnvironments:](self, "_isSectionForEnvironments:", [v13 section]);
  id v6 = v13;
  if (v5)
  {
    id v7 = [(EnvironmentsViewController *)self _environmentForIndexPath:v13];
    if ([v7 state] == (id)3)
    {
      id v8 = [v7 lastLoadingError];
      unsigned int v9 = [(EnvironmentInfoViewController *)v8 description];
      id v10 = +[UIAlertController alertControllerWithTitle:@"Error" message:v9 preferredStyle:1];

      v11 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
      [v10 addAction:v11];

      [(EnvironmentsViewController *)self presentViewController:v10 animated:1 completion:0];
    }
    else
    {
      if ([v7 state] != (id)2)
      {
LABEL_10:

        id v6 = v13;
        goto LABEL_11;
      }
      BOOL v12 = self->_showingCustomEnvironments && [v13 section] == (id)1;
      id v8 = [[EnvironmentInfoViewController alloc] initWithStyle:1 environment:v7 editable:v12];
      id v10 = [(EnvironmentsViewController *)self navigationController];
      [v10 pushViewController:v8 animated:1];
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_showingCustomEnvironments && [v7 section] == (id)1)
  {
    unsigned int v9 = [(GEOEnvironmentsController *)self->_environmentsController environmentInfosForSection:1];
    id v10 = [v8 row];
    BOOL v11 = v10 < [v9 count];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    if (a5)
    {
      id v6 = a5;
      id v7 = [(EnvironmentsViewController *)self tableView];
      [v7 beginUpdates];

      id v8 = [(GEOEnvironmentsController *)self->_environmentsController environmentInfosForSection:1];
      unsigned int v9 = [v8 objectAtIndexedSubscript:[v6 row]];
      [v9 delete];
      [(GEOEnvironmentsController *)self->_environmentsController removeCustomEnvironment:v9];
      id v10 = [(EnvironmentsViewController *)self tableView];
      id v13 = v6;
      BOOL v11 = +[NSArray arrayWithObjects:&v13 count:1];

      [v10 deleteRowsAtIndexPaths:v11 withRowAnimation:100];
      BOOL v12 = [(EnvironmentsViewController *)self tableView];
      [v12 endUpdates];
    }
  }
}

- (void)featuresControllerDidReloadFeatureList:(id)a3
{
  if (self->_showingCustomEnvironments) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v5 = [(EnvironmentsViewController *)self tableView];
  id v4 = +[NSIndexSet indexSetWithIndex:v3];
  [v5 reloadSections:v4 withRowAnimation:100];
}

- (GEOEnvironmentInfo)requestedEnvironment
{
  return self->_requestedEnvironment;
}

- (void)setRequestedEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedEnvironment, 0);
  objc_storeStrong((id *)&self->_featuresController, 0);

  objc_storeStrong((id *)&self->_environmentsController, 0);
}

@end