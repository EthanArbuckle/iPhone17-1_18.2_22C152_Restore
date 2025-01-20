@interface InterruptionManager
+ (id)localizedLocationAuthorizationMessage;
+ (id)localizedLocationAuthorizationTitle;
- (BOOL)isShowingLocationServicesAlert;
- (UIViewController)chromeViewController;
- (id)presentNavSafetyAlertWithUserInfo:(id)a3 completion:(id)a4;
- (id)presentUnhandledInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (void)_locationAuthorizationDismissed:(id)a3;
- (void)displayAlertWithTitle:(id)a3 message:(id)a4 postAlertSearchType:(unsigned int)a5;
- (void)reportCurrentLocationFailure;
- (void)setChromeViewController:(id)a3;
@end

@implementation InterruptionManager

+ (id)localizedLocationAuthorizationMessage
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"];

  return v3;
}

+ (id)localizedLocationAuthorizationTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Allow '%@' to use your location?" value:@"localized string not found" table:0];

  v4 = +[NSBundle mainBundle];
  v5 = [v4 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
}

- (void)setChromeViewController:(id)a3
{
  id v4 = a3;
  v5 = sub_1003EE33C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349314;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Setting new chrome VC: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_storeWeak((id *)&self->_chromeViewController, v4);
}

- (id)presentNavSafetyAlertWithUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [v7 objectForKeyedSubscript:@"kMapsInterruptionTitle"];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v11 = +[NSBundle mainBundle];
    id v10 = [v11 localizedStringForKey:@"Maps Safety Warning Title" value:@"localized string not found" table:0];
  }
  v12 = [v7 objectForKeyedSubscript:@"kMapsInterruptionMessage"];

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    v14 = +[NSBundle mainBundle];
    id v13 = [v14 localizedStringForKey:@"Maps Safety Warning Message" value:@"localized string not found" table:0];
  }
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"OK" value:@"localized string not found" table:0];

  v17 = +[UIAlertController alertControllerWithTitle:v10 message:v13 preferredStyle:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1003EE5D0;
  v22[3] = &unk_1012E6E08;
  id v23 = v6;
  id v18 = v6;
  v19 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v22];
  [v17 addAction:v19];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained _maps_topMostPresentViewController:v17 animated:1 completion:0];

  return v17;
}

- (id)presentUnhandledInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v103 = a4;
  id v102 = a5;
  id v8 = 0;
  switch(a3)
  {
    case 1:
      v154[0] = _NSConcreteStackBlock;
      v154[1] = 3221225472;
      v154[2] = sub_1003EF82C;
      v154[3] = &unk_1012E6EA8;
      id v32 = v102;
      id v155 = v32;
      [(InterruptionManager *)self presentNavSafetyAlertWithUserInfo:v103 completion:v154];
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472;
      v151[2] = sub_1003EF840;
      v151[3] = &unk_1012E76E8;
      id v152 = (id)objc_claimAutoreleasedReturnValue();
      id v153 = v32;
      id v33 = v152;
      id v8 = [v151 copy];

      break;
    case 2:
    case 3:
    case 12:
    case 16:
    case 17:
    case 23:
      id v9 = [v103 objectForKeyedSubscript:@"kMapsInterruptionTitle"];
      id v10 = [v103 objectForKeyedSubscript:@"kMapsInterruptionMessage"];
      v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];

      v12 = [v103 objectForKeyedSubscript:@"kMapsInterruptionActions"];
      if (![v12 count])
      {
        id v13 = +[NSBundle mainBundle];
        v14 = [v13 localizedStringForKey:@"OK" value:@"localized string not found" table:0];
        v15 = +[MapsInterruptionAction actionWithTitle:v14 cancels:0 handler:0];
        v162 = v15;
        uint64_t v16 = +[NSArray arrayWithObjects:&v162 count:1];

        v12 = (void *)v16;
      }
      v17 = +[UIDevice currentDevice];
      id v18 = [v17 userInterfaceIdiom];

      BOOL v19 = v18 != (id)5;
      if (a3 == 17) {
        BOOL v19 = 0;
      }
      v146[0] = _NSConcreteStackBlock;
      v146[1] = 3221225472;
      v146[2] = sub_1003EF890;
      v146[3] = &unk_1012E8D40;
      BOOL v149 = v19;
      id v20 = v102;
      id v148 = v20;
      id v21 = v11;
      id v147 = v21;
      BOOL v150 = v18 == (id)5;
      [v12 enumerateObjectsUsingBlock:v146];
      if (a3 == 17)
      {
        BOOL v22 = v18 == (id)5;
        id v23 = +[NSBundle mainBundle];
        v24 = [v23 localizedStringForKey:@"AddressCorrection_Permission_LearnMore" value:@"localized string not found" table:0];
        v143[0] = _NSConcreteStackBlock;
        v143[1] = 3221225472;
        v143[2] = sub_1003EFA0C;
        v143[3] = &unk_1012E8D68;
        id v145 = v20;
        id v144 = v12;
        v25 = +[UIAlertAction actionWithTitle:v24 style:v22 handler:v143];
        [v21 addAction:v25];
      }
      v140[0] = _NSConcreteStackBlock;
      v140[1] = 3221225472;
      v140[2] = sub_1003EFA50;
      v140[3] = &unk_1012E76E8;
      id v141 = v21;
      id v142 = v20;
      id v26 = v21;
      id v8 = [v140 copy];
      v27 = sub_1003EE33C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
        *(_DWORD *)buf = 134349570;
        v157 = self;
        __int16 v158 = 2048;
        int64_t v159 = a3;
        __int16 v160 = 2112;
        id v161 = WeakRetained;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Presenting interruption alert of kind (%ld) on chrome VC: (%@)", buf, 0x20u);
      }
      id v29 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      [v29 _maps_topMostPresentViewController:v26 animated:1 completion:0];

      break;
    case 5:
      if (self->_isShowingLocationServicesAuthorizationPrompt) {
        goto LABEL_19;
      }
      v34 = +[MKLocationManager sharedLocationManager];
      unsigned int v35 = [v34 isLocationServicesAuthorizationNeeded];

      if (!v35) {
        goto LABEL_19;
      }
      v36 = +[NSNotificationCenter defaultCenter];
      [v36 addObserver:self selector:"_locationAuthorizationDismissed:" name:@"LocationAuthorizationDismissedNotification" object:0];

      self->_isShowingLocationServicesAuthorizationPrompt = 1;
      v37 = +[MKLocationManager sharedLocationManager];
      [v37 requestWhenInUseAuthorization];

      objc_initWeak((id *)buf, self);
      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472;
      v138[2] = sub_1003EFAF4;
      v138[3] = &unk_1012E6708;
      objc_copyWeak(&v139, (id *)buf);
      v38 = objc_retainBlock(v138);
      v135[0] = _NSConcreteStackBlock;
      v135[1] = 3221225472;
      v135[2] = sub_1003EFB40;
      v135[3] = &unk_1012E8D90;
      id v136 = v102;
      v39 = v38;
      id v137 = v39;
      id v40 = [v135 copy];
      id locationServicesAlertDismissalBlock = self->_locationServicesAlertDismissalBlock;
      self->_id locationServicesAlertDismissalBlock = v40;

      id v8 = objc_retainBlock(self->_locationServicesAlertDismissalBlock);
      objc_destroyWeak(&v139);
      objc_destroyWeak((id *)buf);
      break;
    case 6:
      if ([(InterruptionManager *)self isShowingLocationServicesAlert])
      {
LABEL_19:
        id v8 = 0;
      }
      else
      {
        v60 = [v103 objectForKeyedSubscript:@"kMapsInterruptionError"];
        v61 = [v103 objectForKeyedSubscript:@"kMapsInterruptionTitle"];
        v62 = [v103 objectForKeyedSubscript:@"kMapsInterruptionMessage"];
        v63 = +[UIAlertController alertControllerWithTitle:v61 message:v62 preferredStyle:1];
        locationServicesAlertView = self->_locationServicesAlertView;
        self->_locationServicesAlertView = v63;

        objc_initWeak((id *)buf, self);
        v133[0] = _NSConcreteStackBlock;
        v133[1] = 3221225472;
        v133[2] = sub_1003EFBBC;
        v133[3] = &unk_1012E6708;
        objc_copyWeak(&v134, (id *)buf);
        v65 = objc_retainBlock(v133);
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472;
        v129[2] = sub_1003EFC2C;
        v129[3] = &unk_1012E8DB8;
        id v97 = v60;
        id v130 = v97;
        id v66 = v102;
        id v131 = v66;
        v67 = v65;
        id v132 = v67;
        v101 = objc_retainBlock(v129);
        v126[0] = _NSConcreteStackBlock;
        v126[1] = 3221225472;
        v126[2] = sub_1003EFCC4;
        v126[3] = &unk_1012E8DE0;
        id v68 = v66;
        id v127 = v68;
        v69 = v67;
        id v128 = v69;
        v99 = objc_retainBlock(v126);
        v70 = self->_locationServicesAlertView;
        v71 = +[NSBundle mainBundle];
        v72 = [v71 localizedStringForKey:@"LocationServiceAlert_Settings" value:@"localized string not found" table:0];
        v73 = +[UIAlertAction actionWithTitle:v72 style:0 handler:v101];
        [(UIAlertController *)v70 addAction:v73];

        v74 = self->_locationServicesAlertView;
        v75 = +[NSBundle mainBundle];
        v76 = [v75 localizedStringForKey:@"LocationServiceAlert_Don'tUse" value:@"localized string not found" table:0];
        v77 = +[UIAlertAction actionWithTitle:v76 style:0 handler:v99];
        [(UIAlertController *)v74 addAction:v77];

        id v78 = objc_loadWeakRetained((id *)&self->_chromeViewController);
        [v78 _maps_topMostPresentViewController:self->_locationServicesAlertView animated:1 completion:0];

        v79 = self->_locationServicesAlertView;
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472;
        v122[2] = sub_1003EFD14;
        v122[3] = &unk_1012E8E08;
        v80 = v79;
        v123 = v80;
        id v124 = v68;
        v81 = v69;
        id v125 = v81;
        id v82 = [v122 copy];
        id v84 = self->_locationServicesAlertDismissalBlock;
        p_id locationServicesAlertDismissalBlock = &self->_locationServicesAlertDismissalBlock;
        *p_id locationServicesAlertDismissalBlock = v82;

        id v8 = objc_retainBlock(*p_locationServicesAlertDismissalBlock);
        objc_destroyWeak(&v134);
        objc_destroyWeak((id *)buf);
      }
      break;
    case 7:
      v42 = +[NSBundle mainBundle];
      v43 = [v42 localizedStringForKey:@"Route in Progress" value:@"localized string not found" table:0];
      v44 = +[NSBundle mainBundle];
      v45 = [v44 localizedStringForKey:@"Are you sure you want to end navigation?" value:@"localized string not found" table:0];
      v46 = +[UIAlertController alertControllerWithTitle:v43 message:v45 preferredStyle:1];

      v47 = +[NSBundle mainBundle];
      v48 = [v47 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
      v120[0] = _NSConcreteStackBlock;
      v120[1] = 3221225472;
      v120[2] = sub_1003EFD78;
      v120[3] = &unk_1012E6E08;
      id v49 = v102;
      id v121 = v49;
      v50 = +[UIAlertAction actionWithTitle:v48 style:1 handler:v120];
      [v46 addAction:v50];

      v51 = +[NSBundle mainBundle];
      v52 = [v51 localizedStringForKey:@"End Navigation" value:@"localized string not found" table:0];
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472;
      v118[2] = sub_1003EFDBC;
      v118[3] = &unk_1012E6E08;
      id v53 = v49;
      id v119 = v53;
      v54 = +[UIAlertAction actionWithTitle:v52 style:0 handler:v118];
      [v46 addAction:v54];

      v115[0] = _NSConcreteStackBlock;
      v115[1] = 3221225472;
      v115[2] = sub_1003EFDD0;
      v115[3] = &unk_1012E76E8;
      id v55 = v46;
      id v116 = v55;
      id v117 = v53;
      id v8 = [v115 copy];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003EFE24;
      block[3] = &unk_1012E5D58;
      block[4] = self;
      id v114 = v55;
      id v56 = v55;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      break;
    case 22:
      v100 = [v103 objectForKeyedSubscript:@"kMapsInterruptionRouteNameKey"];
      v57 = +[NSBundle mainBundle];
      v98 = [v57 localizedStringForKey:@"[RouteCreation] Conversion failure title" value:@"localized string not found" table:0];

      v58 = +[NSBundle mainBundle];
      if (v100)
      {
        v59 = [v58 localizedStringForKey:@"[RouteCreation] Conversion failure named message" value:@"localized string not found" table:0];
        v96 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v59, v100);
      }
      else
      {
        v96 = [v58 localizedStringForKey:@"[RouteCreation] Conversion failure no name message" value:@"localized string not found" table:0];
      }

      v85 = +[UIAlertController alertControllerWithTitle:v98 message:v96 preferredStyle:1];
      v86 = +[NSBundle mainBundle];
      v87 = [v86 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472;
      v111[2] = sub_1003EFE80;
      v111[3] = &unk_1012E6E08;
      id v88 = v102;
      id v112 = v88;
      v89 = +[UIAlertAction actionWithTitle:v87 style:1 handler:v111];
      [v85 addAction:v89];

      v90 = [v103 objectForKeyedSubscript:@"kMapsInterruptionRouteStorageIDKey"];
      if (v90)
      {
        v91 = +[NSBundle mainBundle];
        v92 = [v91 localizedStringForKey:@"[RouteCreation] Delete Route" value:@"localized string not found" table:0];
        v109[0] = _NSConcreteStackBlock;
        v109[1] = 3221225472;
        v109[2] = sub_1003EFE94;
        v109[3] = &unk_1012E6E08;
        id v110 = v88;
        v93 = +[UIAlertAction actionWithTitle:v92 style:2 handler:v109];
        [v85 addAction:v93];
      }
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472;
      v106[2] = sub_1003EFEA8;
      v106[3] = &unk_1012E76E8;
      id v94 = v85;
      id v107 = v94;
      id v108 = v88;
      id v8 = [v106 copy];
      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_1003EFEFC;
      v104[3] = &unk_1012E5D58;
      v104[4] = self;
      id v105 = v94;
      id v95 = v94;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v104);

      break;
    default:
      break;
  }
  id v30 = objc_retainBlock(v8);

  return v30;
}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4 postAlertSearchType:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_displayingError)
  {
    self->_postAlertSearchType = a5;
    self->_displayingError = 1;
    id v10 = +[NSMutableDictionary dictionary];
    v11 = v10;
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:@"kMapsInterruptionTitle"];
    }
    if (v9) {
      [v11 setObject:v9 forKeyedSubscript:@"kMapsInterruptionMessage"];
    }
    v12 = +[UIApplication sharedMapsDelegate];
    id v13 = v12;
    if (a5 == 1) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 3;
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003F0084;
    v15[3] = &unk_1012E8E50;
    v15[4] = self;
    [v12 interruptApplicationWithKind:v14 userInfo:v11 completionHandler:v15];
  }
}

- (void)reportCurrentLocationFailure
{
  if (!self->_isShowingCurrentLocationError
    && ![(InterruptionManager *)self isShowingLocationServicesAlert])
  {
    self->_isShowingCurrentLocationError = 1;
    id v6 = +[NSBundle mainBundle];
    v3 = [v6 localizedStringForKey:@"Current Location Not Available" value:@"localized string not found" table:0];
    id v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"Your current location cannot be determined at this time." value:@"localized string not found" table:0];
    [(InterruptionManager *)self displayAlertWithTitle:v3 message:v5 postAlertSearchType:0];
  }
}

- (BOOL)isShowingLocationServicesAlert
{
  return self->_locationServicesAlertView != 0;
}

- (void)_locationAuthorizationDismissed:(id)a3
{
  id v6 = a3;
  if (self->_isShowingLocationServicesAuthorizationPrompt)
  {
    self->_isShowingLocationServicesAuthorizationPrompt = 0;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"LocationAuthorizationDismissedNotification" object:0];

    id locationServicesAlertDismissalBlock = (void (**)(id, uint64_t))self->_locationServicesAlertDismissalBlock;
    if (locationServicesAlertDismissalBlock) {
      locationServicesAlertDismissalBlock[2](locationServicesAlertDismissalBlock, 1);
    }
  }
}

- (UIViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_locationServicesAlertDismissalBlock, 0);

  objc_storeStrong((id *)&self->_locationServicesAlertView, 0);
}

@end