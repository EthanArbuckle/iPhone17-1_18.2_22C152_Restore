@interface MapsAppleConnectAuthViewController
+ (void)presentAppleConnectAuthControllerFrom:(id)a3 withProxyURL:(id)a4;
- (BOOL)alreadyDisplayedACAuth;
- (MapsAppleConnectAuthViewController)initWithProxyURL:(id)a3;
- (NSString)personID;
- (NSURL)authProxyURL;
- (void)_dismissViewController;
- (void)_doAppleConnectAuthentication;
- (void)_updateStatus:(BOOL)a3 message:(id)a4;
- (void)authenticator:(id)a3 didCompleteWithError:(id)a4;
- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4;
- (void)setAlreadyDisplayedACAuth:(BOOL)a3;
- (void)setAuthProxyURL:(id)a3;
- (void)setPersonID:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MapsAppleConnectAuthViewController

- (MapsAppleConnectAuthViewController)initWithProxyURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MapsAppleConnectAuthViewController;
  id v3 = a3;
  v4 = [(MapsAppleConnectAuthViewController *)&v6 init];
  -[MapsAppleConnectAuthViewController setAuthProxyURL:](v4, "setAuthProxyURL:", v3, v6.receiver, v6.super_class);

  return v4;
}

+ (void)presentAppleConnectAuthControllerFrom:(id)a3 withProxyURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 presentedViewController];

  if (v7)
  {
    do
    {
      id v12 = [v5 presentedViewController];

      v8 = [v12 presentedViewController];

      id v9 = v12;
      id v5 = v12;
    }
    while (v8);
  }
  else
  {
    id v9 = v5;
  }
  id v13 = v9;
  if (v6
    || (GEOGetURL(), (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || (GEOGetURL(), (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = [[MapsAppleConnectAuthViewController alloc] initWithProxyURL:v6];
    id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
    if ([v13 isViewLoaded])
    {
      [v11 setModalPresentationStyle:2];
      [v13 presentViewController:v11 animated:1 completion:0];
    }
  }
  else
  {
    id v6 = +[UIAlertController alertControllerWithTitle:@"I'm afraid I can't do that" message:@"No Maps Authentication URL found. Refusing to attempt Apple Connect Auth. Try switching to a secure environment before re-attempting." preferredStyle:1];
    v10 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
    [v6 addAction:v10];
    [v13 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)viewDidLoad
{
  v79.receiver = self;
  v79.super_class = (Class)MapsAppleConnectAuthViewController;
  [(MapsAppleConnectAuthViewController *)&v79 viewDidLoad];
  id v3 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismissViewController"];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v3;

  [(UIBarButtonItem *)self->_cancelButton setEnabled:0];
  id v5 = self->_cancelButton;
  id v6 = [(MapsAppleConnectAuthViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  v7 = +[UIColor systemBackgroundColor];
  v8 = [(MapsAppleConnectAuthViewController *)self view];
  [v8 setBackgroundColor:v7];

  id v9 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 setText:@"AppleConnect for Maps Environment Authentication"];
  v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v13 setFont:v14];

  [v13 setTextAlignment:1];
  [v13 setLineBreakMode:0];
  [v13 setNumberOfLines:0];
  id v15 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  statusLabel = self->_statusLabel;
  self->_statusLabel = v16;

  [(UILabel *)self->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_statusLabel setFont:v18];

  [(UILabel *)self->_statusLabel setTextAlignment:1];
  [(UILabel *)self->_statusLabel setNumberOfLines:0];
  [(UILabel *)self->_statusLabel setLineBreakMode:0];
  v19 = +[UIButton buttonWithType:1];
  reAuthButton = self->_reAuthButton;
  self->_reAuthButton = v19;

  [(UIButton *)self->_reAuthButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_reAuthButton setTitle:@"Retry" forState:0];
  [(UIButton *)self->_reAuthButton addTarget:self action:"_doAppleConnectAuthentication" forControlEvents:64];
  [(UIButton *)self->_reAuthButton setHidden:1];
  id v21 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 addSubview:v13];
  [v21 addSubview:v15];
  [v21 addSubview:self->_statusLabel];
  [v21 addSubview:self->_reAuthButton];
  v22 = [(MapsAppleConnectAuthViewController *)self view];
  [v22 addSubview:v21];

  v76 = [v21 topAnchor];
  v78 = [(MapsAppleConnectAuthViewController *)self view];
  v77 = [v78 layoutMarginsGuide];
  v75 = [v77 topAnchor];
  v74 = [v76 constraintEqualToSystemSpacingBelowAnchor:v75 multiplier:3.0];
  v80[0] = v74;
  v73 = [(MapsAppleConnectAuthViewController *)self view];
  v72 = [v73 layoutMarginsGuide];
  v71 = [v72 bottomAnchor];
  v70 = [v21 bottomAnchor];
  v69 = [v71 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v70 multiplier:5.0];
  v80[1] = v69;
  v66 = [v21 leadingAnchor];
  v68 = [(MapsAppleConnectAuthViewController *)self view];
  v67 = [v68 layoutMarginsGuide];
  v65 = [v67 leadingAnchor];
  v64 = [v66 constraintEqualToSystemSpacingAfterAnchor:v65 multiplier:1.0];
  v80[2] = v64;
  v63 = [(MapsAppleConnectAuthViewController *)self view];
  v62 = [v63 layoutMarginsGuide];
  v61 = [v62 trailingAnchor];
  v60 = [v21 trailingAnchor];
  v59 = [v61 constraintEqualToSystemSpacingAfterAnchor:v60 multiplier:1.0];
  v80[3] = v59;
  v57 = [v13 topAnchor];
  v56 = [v21 topAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v80[4] = v55;
  v53 = [v15 topAnchor];
  v52 = [v13 bottomAnchor];
  v51 = [v53 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v52 multiplier:1.0];
  v80[5] = v51;
  v50 = [(UILabel *)self->_statusLabel topAnchor];
  v58 = v15;
  v49 = [v15 bottomAnchor];
  v48 = [v50 constraintEqualToSystemSpacingBelowAnchor:v49 multiplier:3.0];
  v80[6] = v48;
  v47 = [(UIButton *)self->_reAuthButton topAnchor];
  v46 = [(UILabel *)self->_statusLabel bottomAnchor];
  v45 = [v47 constraintEqualToSystemSpacingBelowAnchor:v46 multiplier:3.0];
  v80[7] = v45;
  v44 = [v21 bottomAnchor];
  v43 = [(UIButton *)self->_reAuthButton bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v80[8] = v42;
  v41 = [v15 centerXAnchor];
  v40 = [v21 centerXAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v80[9] = v39;
  v54 = v13;
  v38 = [v13 leadingAnchor];
  v37 = [v21 leadingAnchor];
  v36 = [v38 constraintEqualToSystemSpacingAfterAnchor:v37 multiplier:1.0];
  v80[10] = v36;
  v35 = [v21 trailingAnchor];
  v34 = [v13 trailingAnchor];
  v33 = [v35 constraintEqualToSystemSpacingAfterAnchor:v34 multiplier:1.0];
  v80[11] = v33;
  v32 = [(UILabel *)self->_statusLabel leadingAnchor];
  v23 = [v21 leadingAnchor];
  v24 = [v32 constraintEqualToSystemSpacingAfterAnchor:v23 multiplier:1.0];
  v80[12] = v24;
  v25 = [v21 trailingAnchor];
  v26 = [(UILabel *)self->_statusLabel trailingAnchor];
  v27 = [v25 constraintEqualToSystemSpacingAfterAnchor:v26 multiplier:1.0];
  v80[13] = v27;
  v28 = [(UIButton *)self->_reAuthButton centerXAnchor];
  v29 = [v21 centerXAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v80[14] = v30;
  v31 = +[NSArray arrayWithObjects:v80 count:15];
  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsAppleConnectAuthViewController;
  [(MapsAppleConnectAuthViewController *)&v5 viewDidAppear:a3];
  if (!self->_alreadyDisplayedACAuth)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100850150;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateStatus:(BOOL)a3 message:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10085022C;
  block[3] = &unk_1012E5CE0;
  BOOL v7 = a3;
  block[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_dismissViewController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100850354;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_doAppleConnectAuthentication
{
  [(MapsAppleConnectAuthViewController *)self _updateStatus:1 message:@"Authenticating..."];
  int BOOL = GEOConfigGetBOOL();
  id v4 = objc_alloc_init(AppleConnectSSOAuthenticator);
  appleConnectAuthenticator = self->_appleConnectAuthenticator;
  self->_appleConnectAuthenticator = v4;

  [(AppleConnectSSOAuthenticator *)self->_appleConnectAuthenticator setDelegate:self];
  [(AppleConnectSSOAuthenticator *)self->_appleConnectAuthenticator setAppIdentifier:@"135828"];
  id v6 = &off_101315DE0;
  if (!BOOL) {
    id v6 = &off_101315DE8;
  }
  [(AppleConnectSSOAuthenticator *)self->_appleConnectAuthenticator setEnvIdentifier:*v6];
  [(AppleConnectSSOAuthenticator *)self->_appleConnectAuthenticator authenticate];
  self->_state = 0;
  dispatch_time_t v7 = dispatch_time(0, 15000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008504A0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4
{
  id v5 = a4;
  self->_state = 2;
  id v6 = [v5 token];
  if (![v6 length])
  {

    goto LABEL_7;
  }
  dispatch_time_t v7 = [v5 personId];
  id v8 = [v7 length];

  if (!v8)
  {
LABEL_7:
    id v15 = +[NSString stringWithFormat:@"Failed: missing token or personID"];
    [(MapsAppleConnectAuthViewController *)self _updateStatus:0 message:v15];

    [(MapsAppleConnectAuthViewController *)self setPersonID:0];
    goto LABEL_8;
  }
  id v9 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [v5 username];
    int v16 = 138412290;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Apple Connect Authentication Success for User: %@", (uint8_t *)&v16, 0xCu);
  }
  [(MapsAppleConnectAuthViewController *)self _updateStatus:1 message:@"Complete"];
  id v11 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
  id v12 = [v5 token];
  id v13 = [(MapsAppleConnectAuthViewController *)self authProxyURL];
  [v11 renewMapsAuthProxyToken:0 fromToken:v12 authProxyURL:v13 suppressNotification:0];

  v14 = [v5 personId];
  [(MapsAppleConnectAuthViewController *)self setPersonID:v14];

  [(MapsAppleConnectAuthViewController *)self _dismissViewController];
LABEL_8:
}

- (void)authenticator:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = a4;
  self->_state = 2;
  id v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = MapsAuthDidFinishNotification;
  uint64_t v18 = GEOMapsAuthSuccessKey;
  v19 = &__kCFBooleanFalse;
  id v8 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v6 postNotificationName:v7 object:self userInfo:v8];

  id v9 = [v5 domain];
  LODWORD(v7) = [v9 isEqualToString:@"AppleConnectErrorDomain"];

  if (!v7)
  {
    id v12 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      id v13 = "Apple Connect Authentication failed with error: %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    }
LABEL_11:

    v14 = [v5 localizedDescription];
    id v15 = +[NSString stringWithFormat:@"Failed with error: %@", v14];
    [(MapsAppleConnectAuthViewController *)self _updateStatus:0 message:v15];

    goto LABEL_12;
  }
  id v10 = [v5 code];
  id v11 = GEOGetMapsProxyAuthLog();
  id v12 = v11;
  if (v10 != (id)-100)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v17 = v10;
      id v13 = "Apple Connect Authentication failed with error %ld";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Apple Connect Authentication cancelled", buf, 2u);
  }

  [(MapsAppleConnectAuthViewController *)self _updateStatus:0 message:@"Canceled"];
LABEL_12:
  [(MapsAppleConnectAuthViewController *)self setPersonID:0];
}

- (NSString)personID
{
  return (NSString *)GEOConfigGetString();
}

- (void)setPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MapsAppleConnectAuthViewController *)self personID];
  if ((id)v5 == v4)
  {
  }
  else
  {
    id v6 = (void *)v5;
    unsigned __int8 v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      id v8 = sub_100576EC4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating AppleConnect ID", v9, 2u);
      }

      if (v4) {
        GEOConfigSetString();
      }
      else {
        _GEOConfigRemoveValue();
      }
    }
  }
}

- (NSURL)authProxyURL
{
  return self->_authProxyURL;
}

- (void)setAuthProxyURL:(id)a3
{
}

- (BOOL)alreadyDisplayedACAuth
{
  return self->_alreadyDisplayedACAuth;
}

- (void)setAlreadyDisplayedACAuth:(BOOL)a3
{
  self->_alreadyDisplayedACAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_reAuthButton, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);

  objc_storeStrong((id *)&self->_appleConnectAuthenticator, 0);
}

@end