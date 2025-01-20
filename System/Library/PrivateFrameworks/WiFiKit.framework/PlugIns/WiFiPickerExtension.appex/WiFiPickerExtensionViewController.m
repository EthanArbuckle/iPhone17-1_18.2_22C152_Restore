@interface WiFiPickerExtensionViewController
- (BOOL)userDismissed;
- (WFClient)wifiClient;
- (WFNetworkListController)airportController;
- (WFPickerViewController)viewController;
- (WFPickerViewProvider)viewProvider;
- (id)completionBlock;
- (unsigned)notificationId;
- (void)configureWithCompletion:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)openSettingsForScanRecord:(id)a3;
- (void)setAirportController:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setNotificationId:(unsigned int)a3;
- (void)setUserDismissed:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setViewProvider:(id)a3;
- (void)setWifiClient:(id)a3;
- (void)viewDidLoad;
@end

@implementation WiFiPickerExtensionViewController

- (void)loadView
{
  v3 = [(WiFiPickerExtensionViewController *)self extensionContext];
  v4 = [v3 inputItems];

  v5 = WFLogForCategory();
  os_log_type_t v6 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[WiFiPickerExtensionViewController loadView]";
    __int16 v44 = 2112;
    v45 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s inputItems %@", buf, 0x16u);
  }

  id v7 = objc_alloc_init((Class)WFClient);
  [(WiFiPickerExtensionViewController *)self setWifiClient:v7];

  if (v4 && [v4 count])
  {
    v8 = [v4 firstObject];
    v9 = [v8 userInfo];
    v10 = v9;
    if (!v9
      || ([v9 objectForKey:@"notificationId"],
          v11 = objc_claimAutoreleasedReturnValue(),
          BOOL v12 = v11 == 0,
          v11,
          v12))
    {
      v14 = WFLogForCategory();
      os_log_type_t v19 = OSLogForWFLogLevel();
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v19))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[WiFiPickerExtensionViewController loadView]";
        _os_log_impl((void *)&_mh_execute_header, v14, v19, "%s: notificationId not present in extension context userInfo", buf, 0xCu);
      }
    }
    else
    {
      v13 = [v10 objectForKey:@"notificationId"];
      -[WiFiPickerExtensionViewController setNotificationId:](self, "setNotificationId:", [v13 intValue]);

      v14 = WFLogForCategory();
      os_log_type_t v15 = OSLogForWFLogLevel();
      if (WFCurrentLogLevel() && v14)
      {
        v14 = v14;
        if (os_log_type_enabled(v14, v15))
        {
          unsigned int v16 = [(WiFiPickerExtensionViewController *)self notificationId];
          *(_DWORD *)buf = 136315394;
          v43 = "-[WiFiPickerExtensionViewController loadView]";
          __int16 v44 = 1024;
          LODWORD(v45) = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s: notificationId %d", buf, 0x12u);
        }
      }
    }

LABEL_24:
    goto LABEL_25;
  }
  v8 = WFLogForCategory();
  os_log_type_t v17 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v17))
    {
      v18 = [(WiFiPickerExtensionViewController *)self extensionContext];
      *(_DWORD *)buf = 136315394;
      v43 = "-[WiFiPickerExtensionViewController loadView]";
      __int16 v44 = 2112;
      v45 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, v17, "%s: extension items is nil (context %@)", buf, 0x16u);
    }
    v8 = v10;
    goto LABEL_24;
  }
LABEL_25:

  id v20 = [objc_alloc((Class)WFPickerViewProvider) initWithRootViewController:self];
  [(WiFiPickerExtensionViewController *)self setViewProvider:v20];

  v21 = [(WiFiPickerExtensionViewController *)self viewProvider];
  [v21 setDelegate:self];

  id v22 = objc_alloc_init((Class)WFPickerViewController);
  [(WiFiPickerExtensionViewController *)self setViewController:v22];

  id v23 = objc_alloc((Class)WFNetworkListController);
  v24 = [(WiFiPickerExtensionViewController *)self viewController];
  v25 = [(WiFiPickerExtensionViewController *)self viewProvider];
  v26 = [(WiFiPickerExtensionViewController *)self wifiClient];
  id v27 = [v23 initWithViewController:v24 viewProvider:v25 client:v26];
  [(WiFiPickerExtensionViewController *)self setAirportController:v27];

  v28 = [(WiFiPickerExtensionViewController *)self airportController];
  [v28 startScanning];

  id v29 = objc_alloc_init((Class)UIView);
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, 300.0, 300.0);
  [(WiFiPickerExtensionViewController *)self setView:v29];
  objc_initWeak((id *)buf, self);
  v30 = +[NSNotificationCenter defaultCenter];
  v31 = [(WiFiPickerExtensionViewController *)self airportController];
  v32 = +[NSOperationQueue mainQueue];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100001C64;
  v40[3] = &unk_100004188;
  objc_copyWeak(&v41, (id *)buf);
  v40[4] = self;
  id v33 = [v30 addObserverForName:WFNetworkListControllerAssociationDidFinishNotification object:v31 queue:v32 usingBlock:v40];

  v34 = +[NSNotificationCenter defaultCenter];
  v35 = [(WiFiPickerExtensionViewController *)self airportController];
  v36 = +[NSOperationQueue mainQueue];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100001E90;
  v38[3] = &unk_100004188;
  objc_copyWeak(&v39, (id *)buf);
  v38[4] = self;
  id v37 = [v34 addObserverForName:WFNetworkListControllerScanDidFinishNotification object:v35 queue:v36 usingBlock:v38];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)WiFiPickerExtensionViewController;
  [(WiFiPickerExtensionViewController *)&v47 viewDidLoad];
  v3 = WFLogForCategory();
  os_log_type_t v4 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[WiFiPickerExtensionViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", buf, 0xCu);
  }

  v5 = [(WiFiPickerExtensionViewController *)self viewController];
  [v5 willMoveToParentViewController:self];

  os_log_type_t v6 = [(WiFiPickerExtensionViewController *)self view];
  id v7 = [(WiFiPickerExtensionViewController *)self viewController];
  v8 = [v7 view];
  [v6 addSubview:v8];

  v9 = [(WiFiPickerExtensionViewController *)self viewController];
  v10 = [v9 view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  os_log_type_t v19 = [(WiFiPickerExtensionViewController *)self viewController];
  id v20 = [v19 view];
  objc_msgSend(v20, "setFrame:", v12, v14, v16, v18);

  v21 = [(WiFiPickerExtensionViewController *)self viewController];
  id v22 = [v21 view];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v23 = [(WiFiPickerExtensionViewController *)self viewController];
  v24 = [v23 view];
  v25 = [v24 leftAnchor];
  v26 = [(WiFiPickerExtensionViewController *)self view];
  id v27 = [v26 leftAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  id v29 = [(WiFiPickerExtensionViewController *)self viewController];
  v30 = [v29 view];
  v31 = [v30 topAnchor];
  v32 = [(WiFiPickerExtensionViewController *)self view];
  id v33 = [v32 topAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = [(WiFiPickerExtensionViewController *)self viewController];
  v36 = [v35 view];
  id v37 = [v36 rightAnchor];
  v38 = [(WiFiPickerExtensionViewController *)self view];
  id v39 = [v38 rightAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  id v41 = [(WiFiPickerExtensionViewController *)self viewController];
  v42 = [v41 view];
  v43 = [v42 bottomAnchor];
  __int16 v44 = [(WiFiPickerExtensionViewController *)self view];
  v45 = [v44 bottomAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  -[WiFiPickerExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 300.0, 300.0);
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = WFLogForCategory();
  os_log_type_t v6 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 136315138;
    v8 = "-[WiFiPickerExtensionViewController configureWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s", (uint8_t *)&v7, 0xCu);
  }

  [(WiFiPickerExtensionViewController *)self setCompletionBlock:v4];
}

- (void)invalidate
{
  v3 = WFLogForCategory();
  os_log_type_t v4 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      int v12 = 136315650;
      double v13 = "-[WiFiPickerExtensionViewController invalidate]";
      __int16 v14 = 2112;
      double v15 = self;
      __int16 v16 = 1024;
      unsigned int v17 = [(WiFiPickerExtensionViewController *)self userDismissed];
      _os_log_impl((void *)&_mh_execute_header, v5, v4, "%s: %@ (userDismissed %d)", (uint8_t *)&v12, 0x1Cu);
    }
  }
  os_log_type_t v6 = [(WiFiPickerExtensionViewController *)self airportController];
  [v6 stopScanning];

  int v7 = [(WiFiPickerExtensionViewController *)self airportController];
  v8 = [(WiFiPickerExtensionViewController *)self viewController];
  [v7 networkListViewControllerDidFinish:v8];

  [(WiFiPickerExtensionViewController *)self setWifiClient:0];
  [(WiFiPickerExtensionViewController *)self setAirportController:0];
  [(WiFiPickerExtensionViewController *)self setViewController:0];
  [(WiFiPickerExtensionViewController *)self setViewProvider:0];
  if (![(WiFiPickerExtensionViewController *)self userDismissed])
  {
    v9 = WFLogForCategory();
    os_log_type_t v10 = OSLogForWFLogLevel();
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v12 = 136315138;
      double v13 = "-[WiFiPickerExtensionViewController invalidate]";
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s: user cancelled picker", (uint8_t *)&v12, 0xCu);
    }

    double v11 = [(WiFiPickerExtensionViewController *)self wifiClient];
    objc_msgSend(v11, "dispatchAskToJoinAction:notificationId:network:", 0, -[WiFiPickerExtensionViewController notificationId](self, "notificationId"), 0);
  }
}

- (void)openSettingsForScanRecord:(id)a3
{
  id v4 = a3;
  v5 = WFLogForCategory();
  os_log_type_t v6 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    int v9 = 136315394;
    os_log_type_t v10 = "-[WiFiPickerExtensionViewController openSettingsForScanRecord:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: opening settings for network %@", (uint8_t *)&v9, 0x16u);
  }

  [(WiFiPickerExtensionViewController *)self setUserDismissed:1];
  int v7 = [(WiFiPickerExtensionViewController *)self viewController];
  [v7 setDismissed:1];

  v8 = [(WiFiPickerExtensionViewController *)self wifiClient];
  objc_msgSend(v8, "dispatchAskToJoinAction:notificationId:network:", 2, -[WiFiPickerExtensionViewController notificationId](self, "notificationId"), v4);
}

- (WFNetworkListController)airportController
{
  return self->_airportController;
}

- (void)setAirportController:(id)a3
{
}

- (WFPickerViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (WFPickerViewProvider)viewProvider
{
  return self->_viewProvider;
}

- (void)setViewProvider:(id)a3
{
}

- (WFClient)wifiClient
{
  return self->_wifiClient;
}

- (void)setWifiClient:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (unsigned)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(unsigned int)a3
{
  self->_notificationId = a3;
}

- (BOOL)userDismissed
{
  return self->_userDismissed;
}

- (void)setUserDismissed:(BOOL)a3
{
  self->_userDismissed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_wifiClient, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_airportController, 0);
}

@end