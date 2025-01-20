@interface PKTransactionNotificationContentViewController
- (BOOL)_shouldShowAwardsForTransaction:(id)a3;
- (BOOL)_shouldShowViewInThirdPartyAppAction;
- (BOOL)_transactionHasLocation:(id)a3;
- (PKTransactionNotificationContentViewController)init;
- (id)_descriptionForTransaction:(id)a3 pass:(id)a4;
- (id)_paymentRewardsRedemptionBadge;
- (id)_personContact;
- (id)_subtitleForTransaction:(id)a3 pass:(id)a4;
- (id)_transactionURLForIssuerApp;
- (void)_handlePeerPaymentAccountChanged:(id)a3;
- (void)_setupWithTransaction:(id)a3 monthlySummary:(id)a4;
- (void)accountChanged:(id)a3;
- (void)dealloc;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKTransactionNotificationContentViewController

- (PKTransactionNotificationContentViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)PKTransactionNotificationContentViewController;
  v2 = [(PKTransactionNotificationContentViewController *)&v15 init];
  if (v2)
  {
    v3 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;

    uint64_t v5 = +[PKPeerPaymentService sharedInstance];
    peerPaymentService = v2->_peerPaymentService;
    v2->_peerPaymentService = (PKPeerPaymentService *)v5;

    uint64_t v7 = +[PKPassLibrary sharedInstance];
    passLibrary = v2->_passLibrary;
    v2->_passLibrary = (PKPassLibrary *)v7;

    uint64_t v9 = +[PKAccountService sharedInstance];
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v9;

    [(PKAccountService *)v2->_accountService registerObserver:v2];
    v11 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    transactionDateFormatter = v2->_transactionDateFormatter;
    v2->_transactionDateFormatter = v11;

    [(NSDateFormatter *)v2->_transactionDateFormatter setDateStyle:3];
    [(NSDateFormatter *)v2->_transactionDateFormatter setTimeStyle:1];
    v13 = PKCurrentRegion();
    v2->_isChinaRegion = [v13 caseInsensitiveCompare:@"CN"] == 0;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionNotificationContentViewController;
  [(PKTransactionNotificationContentViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v50.receiver = self;
  v50.super_class = (Class)PKTransactionNotificationContentViewController;
  [(PKTransactionNotificationContentViewController *)&v50 viewDidLoad];
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v3;

  uint64_t v5 = [(PKTransactionNotificationContentViewController *)self view];
  [v5 addSubview:self->_containerView];

  v6 = (PKTransactionMapView *)objc_alloc_init((Class)PKTransactionMapView);
  mapView = self->_mapView;
  self->_mapView = v6;

  v8 = (UIView *)objc_alloc_init((Class)UIView);
  mapHairline = self->_mapHairline;
  self->_mapHairline = v8;

  v10 = self->_mapHairline;
  v11 = +[UIColor separatorColor];
  [(UIView *)v10 setBackgroundColor:v11];

  v12 = (UILabel *)objc_alloc_init((Class)UILabel);
  amountLabel = self->_amountLabel;
  self->_amountLabel = v12;

  v14 = self->_amountLabel;
  objc_super v15 = PKRoundedSystemFontOfSizeAndWeight();
  [(UILabel *)v14 setFont:v15];

  [(UILabel *)self->_amountLabel setTextAlignment:1];
  [(UILabel *)self->_amountLabel setNumberOfLines:1];
  [(UILabel *)self->_amountLabel setAdjustsFontSizeToFitWidth:1];
  v16 = (UILabel *)objc_alloc_init((Class)UILabel);
  cardNameLabel = self->_cardNameLabel;
  self->_cardNameLabel = v16;

  v18 = self->_cardNameLabel;
  v19 = PKFontForDefaultDesign();
  [(UILabel *)v18 setFont:v19];

  [(UILabel *)self->_cardNameLabel setTextAlignment:1];
  v20 = (UILabel *)objc_alloc_init((Class)UILabel);
  awardsLabel = self->_awardsLabel;
  self->_awardsLabel = v20;

  v22 = self->_awardsLabel;
  v23 = PKFontForDefaultDesign(UIFontTextStyleSubheadline, 0);
  [(UILabel *)v22 setFont:v23];

  [(UILabel *)self->_awardsLabel setTextAlignment:1];
  [(UILabel *)self->_awardsLabel setNumberOfLines:2];
  v24 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v24;

  v26 = self->_subtitleLabel;
  v27 = PKFontForDefaultDesign();
  [(UILabel *)v26 setFont:v27];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
  v28 = (UILabel *)objc_alloc_init((Class)UILabel);
  personLabel = self->_personLabel;
  self->_personLabel = v28;

  v30 = self->_personLabel;
  v31 = PKFontForDefaultDesign(UIFontTextStyleSubheadline, 0);
  [(UILabel *)v30 setFont:v31];

  [(UILabel *)self->_personLabel setTextAlignment:1];
  [(UILabel *)self->_personLabel setNumberOfLines:2];
  v32 = (UILabel *)objc_alloc_init((Class)UILabel);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v32;

  v34 = self->_descriptionLabel;
  v35 = PKFontForDefaultDesign();
  [(UILabel *)v34 setFont:v35];

  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:2];
  v36 = (UILabel *)objc_alloc_init((Class)UILabel);
  dateLabel = self->_dateLabel;
  self->_dateLabel = v36;

  v38 = self->_dateLabel;
  v39 = PKFontForDefaultDesign(UIFontTextStyleSubheadline, 0);
  [(UILabel *)v38 setFont:v39];

  [(UILabel *)self->_dateLabel setTextAlignment:1];
  v40 = (UIView *)objc_alloc_init((Class)UIView);
  bottomRule = self->_bottomRule;
  self->_bottomRule = v40;

  v42 = self->_bottomRule;
  v43 = +[UIColor separatorColor];
  [(UIView *)v42 setBackgroundColor:v43];

  v44 = (UILabel *)objc_alloc_init((Class)UILabel);
  balanceLabel = self->_balanceLabel;
  self->_balanceLabel = v44;

  [(UILabel *)self->_balanceLabel setNumberOfLines:2];
  v46 = self->_balanceLabel;
  v47 = PKFontForDefaultDesign(UIFontTextStyleSubheadline, 0);
  [(UILabel *)v46 setFont:v47];

  [(UILabel *)self->_balanceLabel setTextAlignment:1];
  v48 = self->_balanceLabel;
  v49 = +[UIColor secondaryLabelColor];
  [(UILabel *)v48 setTextColor:v49];
}

- (void)viewDidLayoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PKTransactionNotificationContentViewController;
  [(PKTransactionNotificationContentViewController *)&v46 viewDidLayoutSubviews];
  v3 = [(PKTransactionNotificationContentViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  double Width = CGRectGetWidth(v47);
  v13 = [(PKTransactionMapView *)self->_mapView superview];

  if (v13)
  {
    v48.origin.x = v5;
    v48.origin.y = v7;
    v48.size.width = v9;
    v48.size.height = v11;
    double v14 = CGRectGetWidth(v48);
    -[PKTransactionMapView setFrame:](self->_mapView, "setFrame:", 0.0, 0.0, v14, 120.0);
    v49.origin.x = 0.0;
    v49.origin.y = 0.0;
    v49.size.width = v14;
    v49.size.height = 120.0;
    double MaxY = CGRectGetMaxY(v49);
    v50.origin.x = v5;
    v50.origin.y = v7;
    v50.size.width = v9;
    v50.size.height = v11;
    -[UIView setFrame:](self->_mapHairline, "setFrame:", 0.0, MaxY, CGRectGetWidth(v50), 1.0);
    [(UIView *)self->_mapHairline frame];
    double v16 = CGRectGetMaxY(v51);
  }
  else
  {
    double v16 = 0.0;
  }
  double v17 = Width + -32.0;
  v18 = [(UILabel *)self->_amountLabel superview];

  if (v18)
  {
    [(UILabel *)self->_amountLabel sizeToFit];
    CGFloat v19 = v16 + 10.0;
    [(UILabel *)self->_amountLabel frame];
    double Height = CGRectGetHeight(v52);
    -[UILabel setFrame:](self->_amountLabel, "setFrame:", 16.0, v19, v17, Height);
    v53.origin.x = 16.0;
    v53.origin.y = v19;
    v53.size.width = v17;
    v53.size.height = Height;
    double v16 = CGRectGetMaxY(v53);
    double v21 = 3.0;
  }
  else
  {
    double v21 = 10.0;
  }
  v22 = [(UILabel *)self->_cardNameLabel superview];

  if (v22)
  {
    [(UILabel *)self->_cardNameLabel sizeToFit];
    CGFloat v23 = v21 + v16;
    [(UILabel *)self->_cardNameLabel frame];
    double v24 = CGRectGetHeight(v54);
    -[UILabel setFrame:](self->_cardNameLabel, "setFrame:", 16.0, v23, v17, v24);
    v55.origin.x = 16.0;
    v55.origin.y = v23;
    v55.size.width = v17;
    v55.size.height = v24;
    double v16 = CGRectGetMaxY(v55);
    double v21 = 3.0;
  }
  v25 = [(UILabel *)self->_subtitleLabel superview];

  if (v25)
  {
    [(UILabel *)self->_subtitleLabel sizeToFit];
    CGFloat v26 = v21 + v16;
    [(UILabel *)self->_subtitleLabel frame];
    double v27 = CGRectGetHeight(v56);
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 16.0, v26, v17, v27);
    v57.origin.x = 16.0;
    v57.origin.y = v26;
    v57.size.width = v17;
    v57.size.height = v27;
    double v16 = CGRectGetMaxY(v57);
    double v21 = 3.0;
  }
  v28 = [(UILabel *)self->_personLabel superview];

  if (v28)
  {
    [(UILabel *)self->_personLabel sizeToFit];
    CGFloat v29 = v21 + v16;
    [(UILabel *)self->_personLabel frame];
    double v30 = CGRectGetHeight(v58);
    -[UILabel setFrame:](self->_personLabel, "setFrame:", 16.0, v29, v17, v30);
    v59.origin.x = 16.0;
    v59.origin.y = v29;
    v59.size.width = v17;
    v59.size.height = v30;
    double v16 = CGRectGetMaxY(v59);
    double v21 = 3.0;
  }
  v31 = [(UILabel *)self->_awardsLabel superview];

  if (v31)
  {
    [(UILabel *)self->_awardsLabel sizeToFit];
    CGFloat v32 = v21 + v16;
    [(UILabel *)self->_awardsLabel frame];
    double v33 = CGRectGetHeight(v60);
    -[UILabel setFrame:](self->_awardsLabel, "setFrame:", 16.0, v32, v17, v33);
    v61.origin.x = 16.0;
    v61.origin.y = v32;
    v61.size.width = v17;
    v61.size.height = v33;
    double v16 = CGRectGetMaxY(v61);
    double v21 = 3.0;
  }
  v34 = [(UILabel *)self->_descriptionLabel superview];

  if (v34)
  {
    [(UILabel *)self->_descriptionLabel sizeToFit];
    CGFloat v35 = v21 + v16;
    [(UILabel *)self->_descriptionLabel frame];
    double v36 = CGRectGetHeight(v62);
    -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", 16.0, v35, v17, v36);
    v63.origin.x = 16.0;
    v63.origin.y = v35;
    v63.size.width = v17;
    v63.size.height = v36;
    double v16 = CGRectGetMaxY(v63);
    double v21 = 3.0;
  }
  v37 = [(UILabel *)self->_dateLabel superview];

  if (v37)
  {
    [(UILabel *)self->_dateLabel sizeToFit];
    CGFloat v38 = v21 + v16;
    [(UILabel *)self->_dateLabel frame];
    double v39 = CGRectGetHeight(v64);
    -[UILabel setFrame:](self->_dateLabel, "setFrame:", 16.0, v38, v17, v39);
    v65.origin.x = 16.0;
    v65.origin.y = v38;
    v65.size.width = v17;
    v65.size.height = v39;
    double v16 = CGRectGetMaxY(v65);
  }
  v40 = [(UILabel *)self->_balanceLabel superview];

  if (v40)
  {
    v66.origin.x = v5;
    v66.origin.y = v7;
    v66.size.width = v9;
    v66.size.height = v11;
    -[UIView setFrame:](self->_bottomRule, "setFrame:", 0.0, v16 + 23.0, CGRectGetWidth(v66), 1.0);
    [(UIView *)self->_bottomRule frame];
    double v41 = CGRectGetMaxY(v67);
    [(UILabel *)self->_balanceLabel sizeToFit];
    double v42 = 16.0;
    v68.origin.x = v5;
    v68.origin.y = v7;
    v68.size.width = v9;
    v68.size.height = v11;
    double v43 = CGRectGetWidth(v68);
    [(UILabel *)self->_balanceLabel frame];
    -[UILabel setFrame:](self->_balanceLabel, "setFrame:", 0.0, v41 + 16.0, v43, CGRectGetHeight(v69));
    [(UILabel *)self->_balanceLabel frame];
    double v16 = CGRectGetMaxY(v70);
  }
  else
  {
    double v42 = 23.0;
  }
  v71.origin.x = v5;
  v71.origin.y = v7;
  v71.size.width = v9;
  v71.size.height = v11;
  -[UIView setFrame:](self->_containerView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v71), v42 + v16);
  if (v16 > 0.0)
  {
    [(UIView *)self->_containerView frame];
    -[PKTransactionNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v44, v45);
  }
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 request];
  double v6 = [v5 content];
  CGFloat v7 = [v6 userInfo];

  double v8 = [v7 objectForKeyedSubscript:PKUserNotificationTransactionIdentifierContextKey];
  CGFloat v9 = [v7 objectForKeyedSubscript:PKUserNotificationPassUniqueIdentifierContextKey];
  double v10 = [v7 objectForKeyedSubscript:PKUserNotificationAltDSIDKey];
  CGFloat v38 = [v7 objectForKeyedSubscript:PKUserNotificationAccountIdentifier];
  CGFloat v11 = [v7 objectForKeyedSubscript:PKUserNotificationAccountType];
  id v12 = [v11 integerValue];

  if ([v8 length])
  {
    if (v12 == (id)3) {
      goto LABEL_7;
    }
    if ([v9 length])
    {
      if (!self->_pass)
      {
        v13 = [(PKPassLibrary *)self->_passLibrary passWithUniqueID:v9];
        pass = self->_pass;
        self->_pass = v13;
      }
      paymentService = self->_paymentService;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100004844;
      v62[3] = &unk_10000C410;
      v62[4] = self;
      [(PKPaymentService *)paymentService balancesForPaymentPassWithUniqueIdentifier:v9 completion:v62];
LABEL_7:
      if (!self->_transactionIdentifier)
      {
        objc_storeStrong((id *)&self->_transactionIdentifier, v8);
        double v16 = [(PKPeerPaymentService *)self->_peerPaymentService account];
        double v17 = [v16 associatedPassUniqueID];
        v18 = v9;
        CGFloat v19 = v17;
        v37 = v18;
        self->_isPeerPaymentPass = [v17 isEqualToString:];

        v20 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
        id v21 = v38;
        id v22 = v20;
        CGFloat v23 = v22;
        if (v21 == v22)
        {
          unsigned __int8 v24 = 1;
        }
        else
        {
          unsigned __int8 v24 = 0;
          if (v21 && v22) {
            unsigned __int8 v24 = [v21 isEqualToString:v22];
          }
        }

        if (v12 == (id)2) {
          BOOL v25 = v24;
        }
        else {
          BOOL v25 = 0;
        }
        self->_isBroadwayPass = v25;

        CGFloat v9 = v37;
        if (self->_isPeerPaymentPass)
        {
          CGFloat v26 = +[NSNotificationCenter defaultCenter];
          [v26 addObserver:self selector:"_handlePeerPaymentAccountChanged:" name:PKPeerPaymentServiceAccountChangedNotification object:self->_peerPaymentService];
        }
      }
      double v27 = self->_transactionIdentifier;
      v28 = v8;
      CGFloat v29 = v28;
      if (v27 == v28)
      {
      }
      else
      {
        if (!v28 || !v27)
        {

LABEL_28:
          goto LABEL_29;
        }
        unsigned int v30 = [(NSString *)v27 isEqualToString:v28];

        if (!v30) {
          goto LABEL_29;
        }
      }
      if (self->_isPeerPaymentPass)
      {
        v31 = [(PKPeerPaymentService *)self->_peerPaymentService account];
        peerPaymentAccount = self->_peerPaymentAccount;
        self->_peerPaymentAccount = v31;
      }
      double v27 = (NSString *)objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x3032000000;
      v60[3] = sub_1000049A0;
      v60[4] = sub_1000049B0;
      id v61 = 0;
      objc_initWeak(&location, self);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1000049B8;
      v54[3] = &unk_10000C488;
      objc_copyWeak(&v58, &location);
      id v33 = v10;
      id v55 = v33;
      id v34 = v38;
      id v56 = v34;
      CGRect v57 = self;
      [(NSString *)v27 addOperation:v54];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100004D04;
      v50[3] = &unk_10000C500;
      objc_copyWeak(&v53, &location);
      id v51 = v33;
      CGRect v52 = self;
      [(NSString *)v27 addOperation:v50];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100005108;
      v46[3] = &unk_10000C500;
      objc_copyWeak(&v49, &location);
      CGRect v47 = v29;
      CGRect v48 = self;
      [(NSString *)v27 addOperation:v46];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100005398;
      v44[3] = &unk_10000C5C8;
      objc_copyWeak(&v45, &location);
      v44[4] = self;
      v44[5] = v60;
      [(NSString *)v27 addOperation:v44];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100005834;
      v41[3] = &unk_10000C618;
      objc_copyWeak(&v43, &location);
      id v42 = v34;
      [(NSString *)v27 addOperation:v41];
      CGFloat v35 = +[NSNull null];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100005A4C;
      v39[3] = &unk_10000C668;
      objc_copyWeak(&v40, &location);
      v39[4] = v60;
      id v36 = [(NSString *)v27 evaluateWithInput:v35 completion:v39];

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&v45);

      objc_destroyWeak(&v49);
      objc_destroyWeak(&v53);

      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);
      _Block_object_dispose(v60, 8);

      goto LABEL_28;
    }
  }
LABEL_29:
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  CGFloat v26 = (void (**)(id, uint64_t))a4;
  double v6 = [a3 actionIdentifier];
  CGFloat v7 = v6;
  if (v6 == @"PKTransitTransactionNotificationAddMoney") {
    goto LABEL_4;
  }
  if (!v6) {
    goto LABEL_7;
  }
  unsigned int v8 = [(__CFString *)v6 isEqualToString:@"PKTransitTransactionNotificationAddMoney"];

  if (v8)
  {
LABEL_4:
    CGFloat v9 = +[LSApplicationWorkspace defaultWorkspace];
    double v10 = [(PKPaymentPass *)self->_pass addValueURL];
    [v9 openSensitiveURL:v10 withOptions:0];

    goto LABEL_8;
  }
  CGFloat v11 = v7;
  if (v11 == @"openTransactionDetails") {
    goto LABEL_7;
  }
  id v12 = v11;
  unsigned int v13 = [(__CFString *)v11 isEqualToString:@"openTransactionDetails"];

  if (v13) {
    goto LABEL_7;
  }
  double v14 = v12;
  if (v14 == @"viewInIssuerApp"
    || (objc_super v15 = v14,
        unsigned int v16 = [(__CFString *)v14 isEqualToString:@"viewInIssuerApp"],
        v15,
        v16))
  {
    id v17 = [(PKTransactionNotificationContentViewController *)self _transactionURLForIssuerApp];
    if (v17)
    {
      v18 = +[LSApplicationWorkspace defaultWorkspace];
      [v18 openSensitiveURL:v17 withOptions:0];
    }
    v26[2](v26, 1);
  }
  else
  {
    CGFloat v19 = v15;
    if (v19 != @"editAutoReload")
    {
      v20 = v19;
      unsigned int v21 = [(__CFString *)v19 isEqualToString:@"editAutoReload"];

      if (!v21)
      {
LABEL_7:
        v26[2](v26, 2);
        goto LABEL_8;
      }
    }
    id v17 = objc_alloc_init((Class)NSURLComponents);
    if (+[PKWalletVisibility isWalletVisible])
    {
      [v17 setScheme:PKWalletURLScheme];
      [v17 setHost:PKURLActionRoutePeerPaymentPass];
      +[NSString stringWithFormat:@"/%@", PKURLActionRouteAutoReload, v25];
    }
    else
    {
      [v17 setScheme:PKSettingsURLScheme];
      [v17 setHost:PKWalletSettingsHostName];
      +[NSString stringWithFormat:@"/%@/%@", PKURLActionRoutePeerPaymentPass, PKURLActionRouteAutoReload];
    id v22 = };
    [v17 setPath:v22];

    CGFloat v23 = [v17 URL];
    if (v23)
    {
      unsigned __int8 v24 = +[LSApplicationWorkspace defaultWorkspace];
      [v24 openSensitiveURL:v23 withOptions:0];
    }
    v26[2](v26, 1);
  }
LABEL_8:
}

- (void)_setupWithTransaction:(id)a3 monthlySummary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v192 = [v6 transactionType];
  v198 = v6;
  unsigned int v8 = [(PKTransactionNotificationContentViewController *)self _transactionHasLocation:v6];
  mapView = self->_mapView;
  if (v8)
  {
    double v10 = [(PKTransactionMapView *)mapView superview];

    if (!v10) {
      [(UIView *)self->_containerView addSubview:self->_mapView];
    }
    CGFloat v11 = [(UIView *)self->_mapHairline superview];

    if (!v11) {
      [(UIView *)self->_containerView addSubview:self->_mapHairline];
    }
    [(PKTransactionMapView *)self->_mapView setTransaction:v6];
  }
  else
  {
    [(PKTransactionMapView *)mapView removeFromSuperview];
    [(UIView *)self->_mapHairline removeFromSuperview];
  }
  uint64_t v12 = [v6 amount];
  unsigned int v193 = [v6 isZeroTransaction];
  if (v193)
  {
    if ([v6 transitType] != (id)517
      || ([(PKPaymentPass *)self->_pass shouldSuppressNoChargeAmount] & 1) != 0)
    {
      id v13 = 0;
      goto LABEL_20;
    }
    uint64_t v16 = PKLocalizedPaymentString(@"TRANSIT_TRANSACTION_FARE_FREE");
    goto LABEL_17;
  }
  if (!v12)
  {
    uint64_t v16 = [v6 formattedStringForMultipleAmountsForPass:self->_pass];
LABEL_17:
    id v13 = (id)v16;
    goto LABEL_20;
  }
  double v14 = [v6 formattedBalanceAdjustmentSubtotalAmount];
  objc_super v15 = v14;
  if (v14)
  {
    id v13 = v14;
  }
  else
  {
    id v13 = [v6 formattedBalanceAdjustmentAmount];
  }
LABEL_20:
  v190 = v13;
  [(UILabel *)self->_amountLabel setText:v13];
  id v17 = [(PKPaymentPass *)self->_pass localizedDescription];
  if (!v17)
  {
LABEL_24:
    [(UILabel *)self->_cardNameLabel removeFromSuperview];
    goto LABEL_25;
  }
  v18 = [(PKPaymentPass *)self->_pass notificationCenterTitle];
  if ([v17 isEqualToString:v18])
  {

    goto LABEL_24;
  }
  CGFloat v19 = [v6 awards];
  id v20 = [v19 count];

  if (v20) {
    goto LABEL_24;
  }
  [(UILabel *)self->_cardNameLabel setText:v17];
  v86 = [(UILabel *)self->_cardNameLabel superview];

  if (!v86) {
    [(UIView *)self->_containerView addSubview:self->_cardNameLabel];
  }
LABEL_25:
  uint64_t v21 = [(PKTransactionNotificationContentViewController *)self _personContact];
  v191 = (void *)v12;
  v189 = (void *)v21;
  if ((self->_isPeerPaymentPass || self->_isBroadwayPass) && v21)
  {
    personLabel = self->_personLabel;
    CGFloat v23 = +[PKPaymentTransaction transactionNotificationStatusStringForTransaction:self->_transaction personContact:v21];
    [(UILabel *)personLabel setText:v23];

    unsigned __int8 v24 = [(UILabel *)self->_personLabel superview];

    if (!v24) {
      [(UIView *)self->_containerView addSubview:self->_personLabel];
    }
  }
  else
  {
    [(UILabel *)self->_personLabel removeFromSuperview];
  }
  unsigned int v25 = [(PKTransactionNotificationContentViewController *)self _shouldShowAwardsForTransaction:v198];
  awardsLabel = self->_awardsLabel;
  if (v25)
  {
    double v27 = [v198 formattedAwards];
    [(UILabel *)awardsLabel setText:v27];

    v28 = [(UILabel *)self->_awardsLabel superview];

    CGFloat v29 = v7;
    if (!v28) {
      [(UIView *)self->_containerView addSubview:self->_awardsLabel];
    }
  }
  else
  {
    [(UILabel *)awardsLabel removeFromSuperview];
    CGFloat v29 = v7;
  }
  id v30 = [(PKPaymentTransaction *)self->_transaction transactionStatus];
  subtitleLabel = self->_subtitleLabel;
  if (v30 == (id)2)
  {
    if (self->_isChinaRegion) {
      +[UIColor systemGreenColor];
    }
    else {
    uint64_t v32 = +[UIColor systemRedColor];
    }
  }
  else
  {
    uint64_t v32 = +[UIColor labelColor];
  }
  id v33 = (void *)v32;
  [(UILabel *)subtitleLabel setTextColor:v32];

  v197 = [(PKTransactionNotificationContentViewController *)self _subtitleForTransaction:v198 pass:self->_pass];
  -[UILabel setText:](self->_subtitleLabel, "setText:");
  id v34 = [(UILabel *)self->_subtitleLabel superview];

  if (!v34) {
    [(UIView *)self->_containerView addSubview:self->_subtitleLabel];
  }
  uint64_t v35 = [(PKTransactionNotificationContentViewController *)self _descriptionForTransaction:v198 pass:self->_pass];
  descriptionLabel = self->_descriptionLabel;
  v188 = (void *)v35;
  if (v35)
  {
    [(UILabel *)descriptionLabel setText:v35];
    v37 = [(UILabel *)self->_descriptionLabel superview];

    if (!v37) {
      [(UIView *)self->_containerView addSubview:self->_descriptionLabel];
    }
  }
  else
  {
    [(UILabel *)descriptionLabel removeFromSuperview];
  }
  dateLabel = self->_dateLabel;
  transactionDateFormatter = self->_transactionDateFormatter;
  id v40 = [v198 transactionDate];
  double v41 = [(NSDateFormatter *)transactionDateFormatter stringFromDate:v40];
  [(UILabel *)dateLabel setText:v41];

  id v42 = [(UILabel *)self->_dateLabel superview];

  if (!v42) {
    [(UIView *)self->_containerView addSubview:self->_dateLabel];
  }
  id v43 = &CGRectGetHeight_ptr;
  if (v192 != (id)2)
  {
    if (!self->_isPeerPaymentPass)
    {
      if (self->_isBroadwayPass)
      {
        v76 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        v77 = +[NSDate date];
        v78 = [v76 components:8 fromDate:v77];
        id v79 = [v78 month];

        v80 = [v29 startDate];
        v81 = [v76 components:8 fromDate:v80];
        id v82 = [v81 month];

        v83 = [v29 totalSpending];
        v84 = [v83 formattedStringValue];

        accountUser = self->_accountUser;
        if (v79 == v82)
        {
          if (accountUser && ([(PKAccountUser *)accountUser isCurrentUser] & 1) == 0)
          {
            v116 = [(PKTransactionNotificationContentViewController *)self _personContact];
            [v116 givenName];
            v178 = v176 = v84;
            PKLocalizedFeatureString();
            v117 = v17;
            uint64_t v119 = v118 = v29;

            v72 = (__CFString *)v119;
            CGFloat v29 = v118;
            id v17 = v117;
          }
          else
          {
            v176 = v84;
            PKLocalizedFeatureString();
            v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else if (accountUser && ([(PKAccountUser *)accountUser isCurrentUser] & 1) == 0)
        {
          v204 = [(PKTransactionNotificationContentViewController *)self _personContact];
          v120 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
          [v204 givenName];
          v178 = v176 = v84;
          PKLocalizedFeatureString();
          v121 = v17;
          uint64_t v123 = v122 = v29;

          v72 = (__CFString *)v123;
          CGFloat v29 = v122;
          id v17 = v121;
        }
        else
        {
          v103 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
          v176 = v84;
          uint64_t v104 = PKLocalizedFeatureString();

          v72 = (__CFString *)v104;
        }

        unsigned int v44 = 0;
        v196 = 0;
        id v43 = &CGRectGetHeight_ptr;
        if (v72) {
          goto LABEL_106;
        }
LABEL_111:
        v124 = [(PKPaymentTransaction *)self->_transaction paymentRewardsRedemption];

        if (v124
          && ([(PKTransactionNotificationContentViewController *)self _paymentRewardsRedemptionBadge], (uint64_t v125 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v72 = (__CFString *)v125;
          if (!v44) {
            goto LABEL_114;
          }
LABEL_107:
          v195 = v72;
          -[UILabel setText:](self->_amountLabel, "setText:", v196, v176, v178);
          v114 = self->_subtitleLabel;
          v115 = PKLocalizedPaymentString(@"TRANSIT_NOTIFICATION_CURRENT_BALANCE");
          [(UILabel *)v114 setText:v115];

          [(UIView *)self->_bottomRule removeFromSuperview];
          [(UILabel *)self->_balanceLabel removeFromSuperview];
          [(UILabel *)self->_dateLabel removeFromSuperview];
          [(UILabel *)self->_personLabel removeFromSuperview];
        }
        else
        {
          [(UIView *)self->_bottomRule removeFromSuperview];
          [(UILabel *)self->_balanceLabel removeFromSuperview];
          v195 = 0;
          if (v193) {
            goto LABEL_119;
          }
        }
        goto LABEL_121;
      }
      if ([(PKAccount *)self->_account type] != (id)4)
      {
        v196 = 0;
        unsigned int v44 = 0;
        goto LABEL_111;
      }
      v95 = [(PKAccount *)self->_account savingsDetails];
      v96 = [v95 accountSummary];
      v203 = [v96 currentBalance];

      v97 = [v95 currencyCode];
      v98 = PKCurrencyAmountMake();

      v176 = [v98 formattedStringValue];
      PKLocalizedFeatureString();
      v99 = v17;
      uint64_t v101 = v100 = v29;

      v72 = (__CFString *)v101;
      CGFloat v29 = v100;
      id v17 = v99;
      unsigned int v44 = 0;
LABEL_71:
      v196 = 0;
      if (v72) {
        goto LABEL_106;
      }
      goto LABEL_111;
    }
    unsigned int v44 = 0;
LABEL_68:
    familyMember = self->_familyMember;
    peerPaymentAccount = self->_peerPaymentAccount;
    if (familyMember)
    {
      CGRect v64 = [(PKFamilyMember *)familyMember altDSID];
      [(PKPeerPaymentAccount *)peerPaymentAccount peerPaymentAccountWithAltDSID:v64];
      CGRect v65 = v17;
      v67 = CGRect v66 = v29;

      CGRect v68 = [(PKFamilyMember *)self->_familyMember firstName];
      [v67 currentBalance];
      v70 = unsigned int v69 = v44;
      CGRect v71 = [v70 formattedStringValue];
      PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_TRANSACTION_USER_BALANCE", @"%@%@", v68, v71);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v43 = &CGRectGetHeight_ptr;
      unsigned int v44 = v69;

      CGFloat v29 = v66;
      id v17 = v65;
    }
    else
    {
      v73 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
      v74 = [v73 formattedStringValue];
      uint64_t v75 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_IN_APP_BALANCE_FORMAT", @"%@", v74);

      v72 = (__CFString *)v75;
    }
    goto LABEL_71;
  }
  unsigned int v44 = [v197 isEqualToString:&stru_10000C7B0] & (v193 ^ 1);
  if (self->_isPeerPaymentPass) {
    goto LABEL_68;
  }
  id v45 = [(PKPaymentPass *)self->_pass transitProperties];
  transitBalanceModel = self->_transitBalanceModel;
  unsigned int v181 = v44;
  v180 = v45;
  if (!transitBalanceModel)
  {
    if (!v45) {
      goto LABEL_92;
    }
    uint64_t v87 = [v45 balance];
    if (!v87) {
      goto LABEL_92;
    }
    v88 = (void *)v87;
    v89 = [v45 balanceAmount];
    v90 = [v89 currency];

    if (v90)
    {
      v91 = [v180 balance];
      v92 = [v180 balanceAmount];
      v93 = [v92 currency];
      uint64_t v94 = PKFormattedCurrencyStringFromNumber();

      v196 = (__CFString *)v94;
      uint64_t v177 = v94;
      unsigned int v44 = v181;
      PKLocalizedPaymentString(@"NOTIFICATION_BALANCE_FORMAT", @"%@", v177);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_92:
      v72 = &stru_10000C7B0;
      v196 = &stru_10000C7B0;
    }
    goto LABEL_105;
  }
  v182 = v29;
  v186 = v17;
  CGRect v47 = [(PKTransitBalanceModel *)transitBalanceModel displayableBalances];
  id v202 = objc_alloc_init((Class)NSMutableArray);
  v184 = self;
  v200 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayablePointsBalances];
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  id obj = v47;
  id v48 = [obj countByEnumeratingWithState:&v215 objects:v221 count:16];
  if (!v48) {
    goto LABEL_64;
  }
  id v49 = v48;
  uint64_t v50 = *(void *)v216;
  do
  {
    for (i = 0; i != v49; i = (char *)i + 1)
    {
      if (*(void *)v216 != v50) {
        objc_enumerationMutation(obj);
      }
      CGRect v52 = *(void **)(*((void *)&v215 + 1) + 8 * i);
      id v53 = [v52 currencyValue];
      CGRect v54 = v53;
      if (v53)
      {
        uint64_t v55 = [v53 formattedStringValue];
      }
      else
      {
        v214[0] = _NSConcreteStackBlock;
        v214[1] = 3221225472;
        v214[2] = sub_100007558;
        v214[3] = &unk_10000C690;
        v214[4] = v52;
        if (objc_msgSend(v200, "pk_containsObjectPassingTest:", v214)) {
          goto LABEL_62;
        }
        uint64_t v55 = [v52 formattedValue];
      }
      id v56 = (void *)v55;
      [v202 addObject:v55];

LABEL_62:
    }
    id v49 = [obj countByEnumeratingWithState:&v215 objects:v221 count:16];
  }
  while (v49);
LABEL_64:

  CGRect v57 = +[NSLocale currentLocale];
  id v58 = [v57 objectForKey:NSLocaleGroupingSeparator];
  uint64_t v59 = +[NSString stringWithFormat:@"%@ ", v58];

  CGRect v60 = v202;
  v179 = (void *)v59;
  v196 = [v202 componentsJoinedByString:v59];
  if ((unint64_t)[v202 count] > 1)
  {
    id v61 = @"NOTIFICATION_BALANCES_FORMAT";
    unsigned int v44 = v181;
    goto LABEL_88;
  }
  unsigned int v44 = v181;
  if ([v202 count] == (id)1)
  {
    id v61 = @"NOTIFICATION_BALANCE_FORMAT";
LABEL_88:
    v102 = v200;
    PKLocalizedPaymentString(&v61->isa, @"%@", v196);
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v43 = &CGRectGetHeight_ptr;
  }
  else
  {
    v72 = 0;
    id v43 = &CGRectGetHeight_ptr;
    v102 = v200;
  }
  if ([v102 count])
  {
    v194 = v72;
    id v105 = objc_alloc_init((Class)NSMutableString);
    long long v210 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    id v199 = v102;
    id v106 = [v199 countByEnumeratingWithState:&v210 objects:v220 count:16];
    if (v106)
    {
      id v107 = v106;
      uint64_t v108 = *(void *)v211;
      do
      {
        for (j = 0; j != v107; j = (char *)j + 1)
        {
          if (*(void *)v211 != v108) {
            objc_enumerationMutation(v199);
          }
          v110 = *(void **)(*((void *)&v210 + 1) + 8 * (void)j);
          [v105 appendString:@"\n"];
          v111 = [v110 localizedTitle];
          v112 = [v110 formattedValue];
          v113 = PKLocalizedPaymentString(@"NOTIFICATION_LABELLED_BALANCE_FORMAT", @"%@%@", v111, v112);
          [v105 appendString:v113];
        }
        id v107 = [v199 countByEnumeratingWithState:&v210 objects:v220 count:16];
      }
      while (v107);
    }

    v72 = [(__CFString *)v72 stringByAppendingString:v105];

    self = v184;
    id v17 = v186;
    id v43 = &CGRectGetHeight_ptr;
    unsigned int v44 = v181;
    CGRect v60 = v202;
    v102 = v200;
  }

  CGFloat v29 = v182;
LABEL_105:

  if (!v72) {
    goto LABEL_111;
  }
LABEL_106:
  if (v44) {
    goto LABEL_107;
  }
LABEL_114:
  v195 = v72;
  -[UILabel setText:](self->_balanceLabel, "setText:", v72, v176);
  v126 = [(UIView *)self->_bottomRule superview];

  if (!v126) {
    [(UIView *)self->_containerView addSubview:self->_bottomRule];
  }
  v127 = [(UILabel *)self->_balanceLabel superview];

  if (!v127) {
    [(UIView *)self->_containerView addSubview:self->_balanceLabel];
  }
  if (v193)
  {
LABEL_119:
    [(UILabel *)self->_amountLabel removeFromSuperview];
    goto LABEL_123;
  }
LABEL_121:
  v128 = [(UILabel *)self->_amountLabel superview];

  if (!v128) {
    [(UIView *)self->_containerView addSubview:self->_amountLabel];
  }
LABEL_123:
  id v129 = objc_alloc_init((Class)v43[80]);
  v130 = [v198 plans];
  id v131 = [v130 count];

  if (!v131)
  {
    v185 = self;
    v187 = v17;
    v132 = [v198 currencyAmount];
    v133 = [v132 currency];
    v134 = (void *)PKNoCurrencyCode;
    id v135 = v133;
    id v136 = v134;
    if (v135 == v136)
    {

      goto LABEL_151;
    }
    v137 = v136;
    if (v135 && v136)
    {
      unsigned __int8 v138 = [v135 isEqualToString:v136];

      if (v138)
      {
        self = v185;
        goto LABEL_152;
      }
    }
    else
    {
    }
    v205 = v132;
    v183 = v29;
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v135 = [v198 amounts];
    id v139 = [v135 countByEnumeratingWithState:&v206 objects:v219 count:16];
    if (v139)
    {
      id v140 = v139;
      uint64_t v141 = *(void *)v207;
      while (2)
      {
        for (k = 0; k != v140; k = (char *)k + 1)
        {
          if (*(void *)v207 != v141) {
            objc_enumerationMutation(v135);
          }
          v143 = [*(id *)(*((void *)&v206 + 1) + 8 * (void)k) amount];
          id v144 = [v143 currency];
          id v145 = v137;
          v146 = v145;
          if (v144 == v145)
          {

LABEL_150:
            CGFloat v29 = v183;
            self = v185;
            v132 = v205;
            goto LABEL_151;
          }
          if (v137 && v144)
          {
            unsigned __int8 v147 = [v144 isEqualToString:v145];

            if (v147) {
              goto LABEL_150;
            }
          }
          else
          {
          }
        }
        id v140 = [v135 countByEnumeratingWithState:&v206 objects:v219 count:16];
        if (v140) {
          continue;
        }
        break;
      }
    }

    CGFloat v29 = v183;
    self = v185;
    id v17 = v187;
    if (v192 == (id)2)
    {
      if (![(PKPaymentPass *)v185->_pass isAutoTopEnabled]
        || ([(PKPaymentPass *)v185->_pass devicePrimaryPaymentApplication],
            v148 = objc_claimAutoreleasedReturnValue(),
            id v149 = [v148 paymentNetworkIdentifier],
            v148,
            v149 != (id)136))
      {
        v150 = [(PKPaymentPass *)v185->_pass devicePrimaryPaymentApplication];
        if ([v150 supportsTransitHistory])
        {

          goto LABEL_162;
        }
        v166 = [(PKPaymentPass *)v185->_pass devicePrimaryPaymentApplication];
        v167 = [v166 appletDataFormat];
        int v168 = PKEqualObjects();

        if (v168)
        {
LABEL_162:
          v169 = [v198 currencyCode];
          if ([v169 isEqualToString:@"JPY"])
          {

            goto LABEL_165;
          }
          v170 = [v198 currencyCode];
          unsigned int v171 = [v170 isEqualToString:@"CNY"];

          if (v171)
          {
LABEL_165:
            CFStringRef v172 = @"yensign.circle";
          }
          else
          {
            v174 = [v198 currencyCode];
            unsigned int v175 = [v174 isEqualToString:@"KRW"];

            if (v175) {
              CFStringRef v172 = @"wonsign.circle";
            }
            else {
              CFStringRef v172 = @"dollarsign.circle";
            }
          }
          v132 = +[UNNotificationActionIcon iconWithSystemImageName:v172];
          v173 = PKLocalizedPaymentString(@"NOTIFICATION_ACTION_ADD_MONEY_TO_CARD");
          id v135 = +[UNNotificationAction actionWithIdentifier:@"PKTransitTransactionNotificationAddMoney" title:v173 options:1 icon:v132];

          [v129 addObject:v135];
LABEL_151:

LABEL_152:
          id v17 = v187;
        }
      }
    }
  }
  if ([(PKTransactionNotificationContentViewController *)self _shouldShowViewInThirdPartyAppAction])
  {
    v151 = v17;
    v152 = +[UNNotificationActionIcon iconWithSystemImageName:@"questionmark.square"];
    v153 = PKLocalizedAquamanString(@"TRANSACTION_NOTIFICATION_ACTION_TITLE_OPEN_TRANSACTION_DETAILS");
    v154 = +[UNNotificationAction actionWithIdentifier:@"openTransactionDetails" title:v153 options:1 icon:v152];

    v155 = [(PKPaymentPass *)self->_pass organizationName];
    v156 = PKLocalizedPeerPaymentString(@"TRANSACTION_DETAIL_ACTION_VIEW_IN_ISSUER_APP_FORMAT", @"%@", v155);

    v157 = +[UNNotificationActionIcon iconWithSystemImageName:@"arrow.up.right.square"];
    v158 = +[UNNotificationAction actionWithIdentifier:@"viewInIssuerApp" title:v156 options:1 icon:v157];
    [v129 addObject:v154];
    [v129 addObject:v158];

    id v17 = v151;
  }
  if ([v198 accountType] == (id)1)
  {
    v159 = [v198 recurringPeerPayment];
    id v160 = [v159 type];

    if (v160 == (id)3)
    {
      v161 = PKLocalizedPeerPaymentRecurringString(@"TRANSACTION_DETAIL_ACTION_VIEW_AUTO_RELOAD");
      v162 = +[UNNotificationAction actionWithIdentifier:@"editAutoReload" title:v161 options:0 icon:0];
      [v129 addObject:v162];
    }
  }
  if ([v129 count])
  {
    v163 = [(PKTransactionNotificationContentViewController *)self extensionContext];
    id v164 = [v129 copy];
    [v163 setNotificationActions:v164];
  }
  v165 = [(PKTransactionNotificationContentViewController *)self view];
  [v165 setNeedsLayout];
}

- (BOOL)_shouldShowAwardsForTransaction:(id)a3
{
  id v4 = [(PKPaymentTransaction *)self->_transaction barcodeIdentifier];
  if (v4)
  {
    CGFloat v5 = [(PKPaymentTransaction *)self->_transaction awards];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowViewInThirdPartyAppAction
{
  v3 = [(PKPaymentTransaction *)self->_transaction barcodeIdentifier];
  if (v3)
  {
    id v4 = [(PKTransactionNotificationContentViewController *)self _transactionURLForIssuerApp];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_transactionURLForIssuerApp
{
  paymentService = self->_paymentService;
  id v4 = [(PKPaymentPass *)self->_pass uniqueID];
  BOOL v5 = [(PKPaymentService *)paymentService transactionsAppLaunchTokenForPassWithUniqueIdentifier:v4];

  BOOL v6 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:self->_transaction pass:self->_pass appLaunchToken:v5];

  return v6;
}

- (id)_subtitleForTransaction:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  switch((unint64_t)[v5 transactionType])
  {
    case 2uLL:
      uint64_t v7 = [v5 formattedTransitTransactionMessageForPass:v6 suppressNoChargeAmount:[v6 shouldSuppressNoChargeAmount]];
      goto LABEL_17;
    case 5uLL:
      id v8 = [v5 secondaryFundingSourceType];
      if (v8)
      {
        if (v8 == (id)2)
        {
          CGFloat v9 = @"TRANSACTION_TYPE_WITHDRAWAL_DEBIT";
        }
        else
        {
          if (v8 != (id)1)
          {
            CGFloat v11 = 0;
            goto LABEL_18;
          }
          CGFloat v9 = @"TRANSACTION_TYPE_WITHDRAWAL_BANK_ACCOUNT";
        }
      }
      else
      {
        CGFloat v9 = @"TRANSACTION_TYPE_WITHDRAWAL_GENERIC";
      }
LABEL_16:
      uint64_t v7 = PKLocalizedPaymentString(&v9->isa);
LABEL_17:
      CGFloat v11 = (void *)v7;
LABEL_18:
      id v12 = [v5 transactionStatus];
      if (v12 == (id)2)
      {
        id v13 = @"TRANSACTION_DETAIL_DECLINED";
      }
      else
      {
        if (v12 != (id)3)
        {
          id v15 = 0;
          goto LABEL_27;
        }
        id v13 = @"TRANSACTION_DETAIL_REFUNDED";
      }
      double v14 = PKLocalizedPeerPaymentString(&v13->isa);
      id v15 = v14;
      if (v14)
      {
        if (v11)
        {
          uint64_t v16 = PKLocalizedPaymentString(@"PAYMENT_PASS_DETAILS_TRANSACTION_CELL_TIME_AND_STATUS_FORMAT", @"%@%@", v14, v11);

          CGFloat v11 = (void *)v16;
        }
        else
        {
          id v15 = v14;
          CGFloat v11 = v15;
        }
      }
LABEL_27:

      return v11;
    case 6uLL:
      CGFloat v9 = @"TRANSACTION_TYPE_TOP_UP";
      goto LABEL_16;
    case 7uLL:
      if ([v5 featureIdentifier] == (id)5) {
        goto LABEL_11;
      }
      CGFloat v9 = @"TRANSACTION_TYPE_ADJUSTMENT";
      goto LABEL_16;
    case 0xBuLL:
      if ([v5 featureIdentifier] != (id)5) {
        goto LABEL_12;
      }
LABEL_11:
      uint64_t v7 = PKLocalizedFeatureString();
      goto LABEL_17;
    default:
LABEL_12:
      double v10 = [v5 merchant];
      CGFloat v11 = [v10 displayName];

      goto LABEL_18;
  }
}

- (id)_descriptionForTransaction:(id)a3 pass:(id)a4
{
  id v4 = a3;
  if ([v4 transactionStatus] == (id)2)
  {
    [v4 transactionDeclinedReason];
    PKPaymentTransactionDeclinedReasonLocalizedString();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [v4 merchantProvidedDescription];
  uint64_t v7 = v6;
  if (!v5 && v6)
  {
    if ([v6 length]) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)_handlePeerPaymentAccountChanged:(id)a3
{
  if (self->_isPeerPaymentPass)
  {
    id v4 = [(PKPeerPaymentService *)self->_peerPaymentService account];
    peerPaymentAccount = self->_peerPaymentAccount;
    self->_peerPaymentAccount = v4;

    balanceLabel = self->_balanceLabel;
    id v9 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
    uint64_t v7 = [v9 formattedStringValue];
    id v8 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_IN_APP_BALANCE_FORMAT", @"%@", v7);
    [(UILabel *)balanceLabel setText:v8];
  }
}

- (BOOL)_transactionHasLocation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 merchant];
  id v5 = [v4 mapsMerchant];

  id v6 = [v5 postalAddress];
  if (v6)
  {
    uint64_t v7 = [v5 location];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  id v9 = [v3 startStationLocation];

  double v10 = [v3 endStationLocation];

  if (v9) {
    char v11 = 1;
  }
  else {
    char v11 = v8;
  }
  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11;
  }

  return v12;
}

- (id)_personContact
{
  familyMember = self->_familyMember;
  id v3 = [(PKAccountUser *)self->_accountUser nameComponents];
  id v4 = +[PKContactResolver contactForFamilyMember:familyMember nameComponents:v3 imageData:0];

  return v4;
}

- (id)_paymentRewardsRedemptionBadge
{
  id v3 = [(PKPaymentTransaction *)self->_transaction paymentRewardsRedemption];
  id v4 = v3;
  if (v3)
  {
    paymentService = self->_paymentService;
    id v6 = [v3 balanceIdentifier];
    uint64_t v7 = [(PKPaymentService *)paymentService paymentRewardsBalanceWithIdentifier:v6];

    uint64_t v8 = [v7 programName];
    id v9 = (void *)v8;
    if (v8) {
      PKLocalizedPayWithPointsString(@"TRANSACTION_NOTIFICATION_CONTENT_REWARDS_BADGE_FMT", @"%@", v8);
    }
    else {
    double v10 = PKLocalizedPayWithPointsString(@"TRANSACTION_NOTIFICATION_CONTENT_REWARDS_BADGE_FALLBACK");
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007E04;
  block[3] = &unk_10000C3E8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_balanceLabel, 0);
  objc_storeStrong((id *)&self->_bottomRule, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_awardsLabel, 0);
  objc_storeStrong((id *)&self->_personLabel, 0);
  objc_storeStrong((id *)&self->_cardNameLabel, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_mapHairline, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_transactionDateFormatter, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end