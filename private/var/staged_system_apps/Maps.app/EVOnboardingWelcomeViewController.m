@interface EVOnboardingWelcomeViewController
- (EVOnboardingWelcomeViewController)initWithVehicles:(id)a3 delegate:(id)a4;
- (id)obViewController;
- (void)_connectPressed;
- (void)_setUpLaterPressed;
@end

@implementation EVOnboardingWelcomeViewController

- (EVOnboardingWelcomeViewController)initWithVehicles:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EVOnboardingWelcomeViewController;
  v8 = [(EVOnboardingBaseViewController *)&v12 initWithDelegate:v7];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    vehicles = v8->_vehicles;
    v8->_vehicles = v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
  }

  return v8;
}

- (id)obViewController
{
  uint64_t v3 = sub_100CDBB04(self->_vehicles);
  v85 = self;
  v4 = self->_vehicles;
  v5 = +[NSMutableSet set];
  id v89 = [(NSArray *)v4 mutableCopy];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v6 = v4;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v90 objects:v98 count:16];
  if (!v7)
  {
    v9 = 0;
    goto LABEL_19;
  }
  id v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v91;
  do
  {
    v11 = 0;
    do
    {
      if (*(void *)v91 != v10) {
        objc_enumerationMutation(v6);
      }
      objc_super v12 = *(void **)(*((void *)&v90 + 1) + 8 * (void)v11);
      v13 = [v12 pairedAppIdentifier];
      if (v13)
      {

LABEL_9:
        v15 = [v12 pairedAppIdentifier];

        if (v15)
        {
          v16 = [v12 pairedAppIdentifier];
          [v5 addObject:v16];
        }
        else
        {
          id v17 = v12;

          [v89 removeObject:v17];
          v16 = [v17 iapIdentifier];
          [v5 addObject:v16];
          v9 = v17;
        }
        goto LABEL_12;
      }
      v14 = [v12 iapIdentifier];

      if (v14) {
        goto LABEL_9;
      }
      v16 = sub_1005761B4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v104 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to get paired app id or iap2 identifier for vehicle: %@", buf, 0xCu);
      }
LABEL_12:

      v11 = (char *)v11 + 1;
    }
    while (v8 != v11);
    id v18 = [(NSArray *)v6 countByEnumeratingWithState:&v90 objects:v98 count:16];
    id v8 = v18;
  }
  while (v18);
LABEL_19:

  id v19 = [v5 count];
  v20 = GEOResultRefinementSort_ptr;
  v21 = +[NSBundle mainBundle];
  v22 = v21;
  v86 = (void *)v3;
  if (v9 && (unint64_t)v19 <= 1)
  {
    v23 = [v21 localizedStringForKey:@"[EV Onboarding] Enable iAP2 subtitle single" value:@"localized string not found" table:0];

    uint64_t v24 = [v9 manufacturer];
    v25 = v85;
    if (v24)
    {
      v26 = (void *)v24;
      goto LABEL_61;
    }
    v45 = [v9 displayName];
    v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v45);

    v26 = 0;
  }
  else
  {
    v25 = v85;
    if (v9)
    {
      v23 = [v21 localizedStringForKey:@"[EV Onboarding] Enable iAp2 and apps subtitle plural" value:@"localized string not found" table:0];

      v27 = [v9 displayName];
      v28 = v27;
      v82 = v6;
      if (v27)
      {
        id v29 = v27;
      }
      else
      {
        id v29 = [v9 manufacturer];
      }
      v26 = v29;

      id v47 = v89;
      if ([v47 count])
      {
        v87 = v26;
        v84 = v23;
        v48 = +[NSMutableSet set];
        v49 = objc_opt_new();
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v81 = v47;
        id v50 = v47;
        id v51 = [v50 countByEnumeratingWithState:&v94 objects:buf count:16];
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)v95;
          do
          {
            for (i = 0; i != v52; i = (char *)i + 1)
            {
              if (*(void *)v95 != v53) {
                objc_enumerationMutation(v50);
              }
              v55 = *(void **)(*((void *)&v94 + 1) + 8 * i);
              v56 = [v55 pairedAppIdentifier];

              if (v56)
              {
                v57 = [v55 pairedAppIdentifier];
                [v48 addObject:v57];

                v58 = [v55 pairedAppIdentifier];
                [v49 setObject:v55 forKeyedSubscript:v58];
              }
              else
              {
                v58 = sub_1005761B4();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v99) = 138412290;
                  *(void *)((char *)&v99 + 4) = v55;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to get paired app id for vehicle: %@", (uint8_t *)&v99, 0xCu);
                }
              }
            }
            id v52 = [v50 countByEnumeratingWithState:&v94 objects:buf count:16];
          }
          while (v52);
        }

        *(void *)&long long v99 = _NSConcreteStackBlock;
        *((void *)&v99 + 1) = 3221225472;
        v100 = sub_100AA286C;
        v101 = &unk_1013163E8;
        id v102 = v49;
        id v59 = v49;
        v60 = sub_100099700(v48, &v99);
        v61 = [v60 componentsJoinedByString:@", "];

        v25 = v85;
        v20 = GEOResultRefinementSort_ptr;
        v23 = v84;
        v26 = v87;
        id v47 = v81;
      }
      else
      {
        v61 = 0;
      }

      v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v26, v61);

      uint64_t v3 = (uint64_t)v86;
      id v6 = v82;
    }
    else
    {
      if ((unint64_t)v19 <= 1) {
        CFStringRef v30 = @"[EV Onboarding] Enable app subtitle single";
      }
      else {
        CFStringRef v30 = @"[EV Onboarding] Enable app subtitle plural";
      }
      v23 = [v21 localizedStringForKey:v30 value:@"localized string not found" table:0];

      id v31 = v89;
      if ([v31 count])
      {
        v83 = v23;
        v88 = +[NSMutableSet set];
        v32 = objc_opt_new();
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v80 = v31;
        id v33 = v31;
        id v34 = [v33 countByEnumeratingWithState:&v94 objects:buf count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v95;
          do
          {
            for (j = 0; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v95 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v94 + 1) + 8 * (void)j);
              v39 = [v38 pairedAppIdentifier];

              if (v39)
              {
                v40 = [v38 pairedAppIdentifier];
                [v88 addObject:v40];

                v41 = [v38 pairedAppIdentifier];
                [v32 setObject:v38 forKeyedSubscript:v41];
              }
              else
              {
                v41 = sub_1005761B4();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v99) = 138412290;
                  *(void *)((char *)&v99 + 4) = v38;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to get paired app id for vehicle: %@", (uint8_t *)&v99, 0xCu);
                }
              }
            }
            id v35 = [v33 countByEnumeratingWithState:&v94 objects:buf count:16];
          }
          while (v35);
        }

        *(void *)&long long v99 = _NSConcreteStackBlock;
        *((void *)&v99 + 1) = 3221225472;
        v100 = sub_100AA286C;
        v101 = &unk_1013163E8;
        id v102 = v32;
        id v42 = v32;
        v43 = sub_100099700(v88, &v99);
        uint64_t v44 = [v43 componentsJoinedByString:@", "];

        v26 = (void *)v44;
        v25 = v85;
        uint64_t v3 = (uint64_t)v86;
        v20 = GEOResultRefinementSort_ptr;
        v23 = v83;
        id v31 = v80;
      }
      else
      {
        v26 = 0;
      }

LABEL_61:
      v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v26);
    }
  }

  if ([(NSArray *)v25->_vehicles count] > 1) {
    +[UIImage imageNamed:@"multipleEV"];
  }
  else {
  v62 = sub_1004BE4A0(1);
  }
  id v63 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v3 detailText:v46 icon:v62];
  v64 = [v63 view];
  [v64 setAccessibilityIdentifier:@"EVOnboardingWelcomeView"];

  [v63 setModalPresentationStyle:2];
  v65 = [v63 headerView];
  [v65 setAllowFullWidthIcon:1];

  v66 = +[OBBoldTrayButton boldButton];
  v67 = [v20[504] mainBundle];
  v68 = [v67 localizedStringForKey:@"[EV Onboarding] Connect" value:@"localized string not found" table:0];
  [v66 setTitle:v68 forState:0];

  [v66 addTarget:v25 action:"_connectPressed" forControlEvents:64];
  [v66 setAccessibilityIdentifier:@"ConnectButton"];
  v69 = [v63 buttonTray];
  [v69 addButton:v66];

  v70 = +[OBLinkTrayButton linkButton];
  v71 = [v20[504] mainBundle];
  [v71 localizedStringForKey:@"[EV Onboarding] Set Up Later" value:@"localized string not found" table:0];
  v73 = v72 = v20;
  [v70 setTitle:v73 forState:0];

  [v70 addTarget:v25 action:"_setUpLaterPressed" forControlEvents:64];
  [v70 setAccessibilityIdentifier:@"SetUpLaterButton"];
  v74 = [v63 buttonTray];
  [v74 addButton:v70];

  v75 = [v63 buttonTray];
  [v75 setAccessibilityIdentifier:@"EVOnboardingButtonTray"];

  v76 = [v63 buttonTray];
  v77 = [v72[504] mainBundle];
  v78 = [v77 localizedStringForKey:@"[EV Onboarding] Welcome screen privacy text" value:@"localized string not found" table:0];
  [v76 setCaptionText:v78];

  return v63;
}

- (void)_connectPressed
{
  uint64_t v3 = +[MKMapService sharedService];
  [v3 captureUserAction:2118 onTarget:659 eventValue:0];

  v4 = sub_1005761B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User pressed connect to Maps.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained welcomeViewControllerDidSelectConnect:self];
}

- (void)_setUpLaterPressed
{
  uint64_t v3 = +[MKMapService sharedService];
  [v3 captureUserAction:2122 onTarget:659 eventValue:0];

  v4 = sub_1005761B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User pressed set up later. Will dismiss.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained welcomeViewControllerDidDismiss:self];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_vehicles, 0);
}

@end