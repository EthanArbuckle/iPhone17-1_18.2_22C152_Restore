@interface RAPWebBundleBaseViewController
- (BOOL)_shouldShowNutritionLabel;
- (NSString)entryPointString;
- (RAPWebBundleBaseViewController)initWithReport:(id)a3;
- (RAPWebBundleQuestion)webBundleQuestion;
- (RAPWebBundleViewControllerDelegate)delegate;
- (WKWebView)webView;
- (id)_photoPickerAnchoringViewForBoundingBox:(CGRect)a3;
- (id)_photoPickerReplyHandler:(id)a3;
- (void)_addAnalyticsEventToCombinedUserPath:(id)a3;
- (void)_presentPrivacyView;
- (void)_removePhotoWithId:(id)a3;
- (void)_saveInlineCardHeightIfNeeded:(double)a3;
- (void)_setupConstraints;
- (void)_submitButtonEnabled:(BOOL)a3;
- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5;
- (void)loadWebView;
- (void)presentAccessoryViewController:(id)a3;
- (void)removeAllPhotos;
- (void)saveImage:(id)a3 withIdentifier:(id)a4;
- (void)saveImageData:(id)a3 withIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEntryPointString:(id)a3;
- (void)setWebView:(id)a3;
- (void)setupViews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RAPWebBundleBaseViewController

- (RAPWebBundleBaseViewController)initWithReport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPWebBundleBaseViewController;
  v6 = [(RAPWebBundleBaseViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_report, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleBaseViewController;
  [(RAPWebBundleBaseViewController *)&v14 viewDidLoad];
  v3 = objc_alloc_init(RAPWebBundleConfigurationManager);
  v4 = [(RAPWebBundleConfigurationManager *)v3 configuration];
  configuration = self->_configuration;
  self->_configuration = v4;

  v6 = [WebBundleManager alloc];
  v7 = [(RAPWebBundleConfigurationManager *)v3 configuration];
  v8 = [(WebBundleManager *)v6 initWithConfiguration:v7 delegate:self];
  webBundleManager = self->_webBundleManager;
  self->_webBundleManager = v8;

  v10 = [(RAPWebBundleBaseViewController *)self entryPointString];

  if (v10)
  {
    v11 = [(RAPWebBundleBaseViewController *)self entryPointString];
    [(WebBundleManager *)self->_webBundleManager setEntryPointString:v11];
  }
  [(RAPWebBundleBaseViewController *)self setupViews];
  [(RAPWebBundleBaseViewController *)self _setupConstraints];
  v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  photoIdentifiers = self->_photoIdentifiers;
  self->_photoIdentifiers = v12;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleBaseViewController;
  [(RAPWebBundleBaseViewController *)&v4 viewWillDisappear:a3];
  [(WebBundleManager *)self->_webBundleManager cancelLoadRequest];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleBaseViewController;
  [(RAPWebBundleBaseViewController *)&v4 viewSafeAreaInsetsDidChange];
  v3 = [(RAPWebBundleBaseViewController *)self delegate];
  [v3 updatePreferredContentSize];
}

- (void)loadWebView
{
}

- (void)presentAccessoryViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPWebBundleBaseViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5)
  {
    id v9 = [(RAPWebBundleBaseViewController *)self navigationController];
    [v9 pushViewController:v4 animated:1];
  }
  else
  {
    [v4 setModalInPresentation:1];
    id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
    [v9 setModalPresentationStyle:2];
    v7 = [(RAPWebBundleBaseViewController *)self navigationController];
    objc_msgSend(v9, "setOverrideUserInterfaceStyle:", objc_msgSend(v7, "overrideUserInterfaceStyle"));

    v8 = [(RAPWebBundleBaseViewController *)self navigationController];
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v8, "overrideUserInterfaceStyle"));

    [(RAPWebBundleBaseViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (RAPWebBundleQuestion)webBundleQuestion
{
  v3 = [(RAPReport *)self->_report initialQuestion];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(RAPReport *)self->_report initialQuestion];
  }
  else
  {
    id v5 = 0;
  }

  return (RAPWebBundleQuestion *)v5;
}

- (void)saveImageData:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_1000B8184();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(WebBundleConfiguration *)self->_configuration webBundleDirectory];
    v10 = [v9 absoluteString];
    v11 = [(WebBundleConfiguration *)self->_configuration absoluteCachedWebBundleDirectory];
    int v18 = 138412802;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will try to save icon with data: %@, at path: %@ and path: %@", (uint8_t *)&v18, 0x20u);
  }
  v12 = [(WebBundleConfiguration *)self->_configuration webBundleDirectory];
  unsigned __int8 v13 = +[RAPImageStorage saveImageWithImageIdentifier:v7 imageData:v6 directory:v12];

  if ((v13 & 1) == 0)
  {
    objc_super v14 = sub_10057670C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to save image.", (uint8_t *)&v18, 2u);
    }
  }
  v15 = [(WebBundleConfiguration *)self->_configuration absoluteCachedWebBundleDirectory];
  unsigned __int8 v16 = +[RAPImageStorage saveImageWithImageIdentifier:v7 imageData:v6 directory:v15];

  if ((v16 & 1) == 0)
  {
    v17 = sub_10057670C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to save image in on-device writable directory.", (uint8_t *)&v18, 2u);
    }
  }
  [(NSMutableSet *)self->_photoIdentifiers addObject:v7];
}

- (void)saveImage:(id)a3 withIdentifier:(id)a4
{
  id v6 = (UIImage *)a3;
  id v7 = a4;
  v8 = UIImagePNGRepresentation(v6);
  if (v8)
  {
    [(RAPWebBundleBaseViewController *)self saveImageData:v8 withIdentifier:v7];
  }
  else
  {
    id v9 = sub_1000B8184();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to create imageData from image: %@.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)removeAllPhotos
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  id v4 = [v3 geotaggedPhotoCommentQuestion];
  id v5 = [v4 photos];

  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = [v10 identifier];
        [(RAPWebBundleBaseViewController *)self _removePhotoWithId:v11];

        photoIdentifiers = self->_photoIdentifiers;
        unsigned __int8 v13 = [v10 identifier];
        [(NSMutableSet *)photoIdentifiers removeObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v14 = self->_photoIdentifiers;
  id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[RAPWebBundleBaseViewController _removePhotoWithId:](self, "_removePhotoWithId:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), (void)v19);
      }
      id v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)setupViews
{
  v3 = +[MapsTheme visualEffectViewAllowingBlur:1];
  blurView = self->_blurView;
  self->_blurView = v3;

  [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(RAPWebBundleBaseViewController *)self view];
  [v5 addSubview:self->_blurView];

  id v6 = [(WebBundleManager *)self->_webBundleManager webView];
  [(RAPWebBundleBaseViewController *)self setWebView:v6];

  id v7 = [(RAPWebBundleBaseViewController *)self webView];
  [v7 setAccessibilityIdentifier:@"RAPWebView"];

  uint64_t v8 = [(RAPWebBundleBaseViewController *)self webView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = [(RAPWebBundleBaseViewController *)self view];
  int v10 = [(RAPWebBundleBaseViewController *)self webView];
  [v9 addSubview:v10];

  id v31 = +[UserInformationManager sharedInstance];
  if ([(RAPWebBundleBaseViewController *)self _shouldShowNutritionLabel])
  {
    v11 = [[UGCUserInformationCell alloc] initWithEmphasis:0];
    nutritionLabelView = self->_nutritionLabelView;
    self->_nutritionLabelView = v11;

    [(UGCUserInformationCell *)self->_nutritionLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
    unsigned __int8 v13 = self->_nutritionLabelView;
    objc_super v14 = +[UIFont _maps_systemFontWithSize:12.0];
    id v15 = +[UIColor secondaryLabelColor];
    [(UGCUserInformationCell *)v13 setOverallFont:v14 overallColor:v15];

    id v16 = self->_nutritionLabelView;
    uint64_t v17 = +[UIFont _maps_systemFontWithSize:12.0];
    int v18 = +[UIColor secondaryLabelColor];
    [(UGCUserInformationCell *)v16 setOverallFont:v17 overallColor:v18];

    long long v19 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v20 = v19;
    }
    else {
      long long v20 = 0;
    }
    long long v21 = v20;

    if (v21)
    {
      long long v22 = [(RAPWebBundleBaseViewController *)v21 footerView];
      long long v23 = [v22 accessoryView];
      [v23 addSubview:self->_nutritionLabelView];
    }
    else
    {
      long long v22 = [(RAPWebBundleBaseViewController *)v19 view];
      [v22 addSubview:self->_nutritionLabelView];
    }

    long long v24 = objc_alloc_init(UGCUserInformationViewModel);
    long long v25 = +[NSBundle mainBundle];
    long long v26 = [v25 localizedStringForKey:@"[RAP Web UI] Reporting As User's Information" value:@"localized string not found" table:0];

    v27 = [v31 userName];
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27);
    [(UGCUserInformationViewModel *)v24 setUserName:v28];

    v29 = [v31 userEmail];
    [(UGCUserInformationViewModel *)v24 setUserEmail:v29];

    v30 = [v31 userIcon];
    [(UGCUserInformationViewModel *)v24 setUserIcon:v30];

    [(UGCUserInformationCell *)self->_nutritionLabelView setViewModel:v24];
  }
  [(RAPWebBundleBaseViewController *)self _submitButtonEnabled:0];
}

- (BOOL)_shouldShowNutritionLabel
{
  if (sub_100523AA0())
  {
    unsigned __int8 v3 = 0;
  }
  else
  {
    id v4 = +[UserInformationManager sharedInstance];
    unsigned __int8 v3 = [v4 loggedIn];
  }
  id v5 = [(RAPReport *)self->_report initialQuestion];
  unsigned __int8 v6 = [v5 isAnonymous];

  return v3 & ~v6;
}

- (void)_setupConstraints
{
  id v117 = objc_alloc_init((Class)NSMutableArray);
  v111 = [(UIVisualEffectView *)self->_blurView topAnchor];
  v115 = [(RAPWebBundleBaseViewController *)self view];
  v109 = [v115 topAnchor];
  v105 = [v111 constraintEqualToAnchor:v109];
  v124[0] = v105;
  v99 = [(UIVisualEffectView *)self->_blurView leadingAnchor];
  v102 = [(RAPWebBundleBaseViewController *)self view];
  v96 = [v102 leadingAnchor];
  v93 = [v99 constraintEqualToAnchor:v96];
  v124[1] = v93;
  v88 = [(UIVisualEffectView *)self->_blurView trailingAnchor];
  v90 = [(RAPWebBundleBaseViewController *)self view];
  v86 = [v90 trailingAnchor];
  v84 = [v88 constraintEqualToAnchor:v86];
  v124[2] = v84;
  v80 = [(UIVisualEffectView *)self->_blurView bottomAnchor];
  v82 = [(RAPWebBundleBaseViewController *)self view];
  v78 = [v82 bottomAnchor];
  v76 = [v80 constraintEqualToAnchor:v78];
  v124[3] = v76;
  v74 = [(RAPWebBundleBaseViewController *)self webView];
  v70 = [v74 topAnchor];
  v72 = [(RAPWebBundleBaseViewController *)self view];
  v68 = [v72 safeAreaLayoutGuide];
  v66 = [v68 topAnchor];
  v64 = [v70 constraintEqualToAnchor:v66];
  v124[4] = v64;
  v62 = [(RAPWebBundleBaseViewController *)self webView];
  v60 = [v62 leadingAnchor];
  unsigned __int8 v3 = [(RAPWebBundleBaseViewController *)self view];
  id v4 = [v3 leadingAnchor];
  id v5 = [v60 constraintEqualToAnchor:v4];
  v124[5] = v5;
  unsigned __int8 v6 = [(RAPWebBundleBaseViewController *)self webView];
  id v7 = [v6 trailingAnchor];
  uint64_t v8 = [(RAPWebBundleBaseViewController *)self view];
  id v9 = [v8 trailingAnchor];
  int v10 = [v7 constraintEqualToAnchor:v9];
  v124[6] = v10;
  v11 = +[NSArray arrayWithObjects:v124 count:7];
  [v117 addObjectsFromArray:v11];

  uint64_t v12 = sub_1000BBB44(self);
  unsigned __int8 v13 = [(RAPWebBundleBaseViewController *)self view];
  objc_super v14 = v13;
  if (v12 == 5)
  {
    id v15 = [v13 safeAreaLayoutGuide];
    id v16 = [v15 bottomAnchor];
  }
  else
  {
    id v16 = [v13 bottomAnchor];
  }

  if (MapsFeature_IsEnabled_RAPCommunityID()
    && ![(RAPWebBundleBaseViewController *)self _shouldShowNutritionLabel])
  {
    long long v19 = [(RAPWebBundleBaseViewController *)self webView];
    id v31 = [(RAPWebBundleBaseViewController *)v19 bottomAnchor];
    v34 = [v31 constraintEqualToAnchor:v16];
    v123 = v34;
    v32 = +[NSArray arrayWithObjects:&v123 count:1];
    v33 = v117;
    [v117 addObjectsFromArray:v32];
  }
  else
  {
    uint64_t v17 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    long long v19 = v18;

    nutritionLabelView = v17->_nutritionLabelView;
    if (nutritionLabelView)
    {
      v116 = v16;
      if (v19)
      {
        v83 = [(RAPWebBundleBaseViewController *)v17 webView];
        v112 = [v83 bottomAnchor];
        v81 = [(RAPWebBundleBaseViewController *)v17 view];
        v75 = [v81 safeAreaLayoutGuide];
        v110 = [v75 bottomAnchor];
        v106 = [v112 constraintEqualToAnchor:v110];
        v121[0] = v106;
        v100 = [(UGCUserInformationCell *)v17->_nutritionLabelView leadingAnchor];
        v103 = [(RAPWebBundleBaseViewController *)v19 footerView];
        v97 = [v103 accessoryView];
        v94 = [v97 leadingAnchor];
        v91 = [v100 constraintEqualToAnchor:v94];
        v121[1] = v91;
        v87 = [(UGCUserInformationCell *)v17->_nutritionLabelView trailingAnchor];
        v89 = [(RAPWebBundleBaseViewController *)v19 footerView];
        v85 = [v89 accessoryView];
        v79 = [v85 trailingAnchor];
        v77 = [v87 constraintEqualToAnchor:v79];
        v121[2] = v77;
        v73 = [(UGCUserInformationCell *)v17->_nutritionLabelView layoutMarginsGuide];
        v69 = [v73 topAnchor];
        v71 = [(RAPWebBundleBaseViewController *)v19 footerView];
        v67 = [v71 accessoryView];
        v65 = [v67 topAnchor];
        v63 = [v69 constraintGreaterThanOrEqualToAnchor:v65];
        v121[3] = v63;
        v61 = [(UGCUserInformationCell *)v17->_nutritionLabelView layoutMarginsGuide];
        v58 = [v61 bottomAnchor];
        v59 = [(RAPWebBundleBaseViewController *)v19 footerView];
        v57 = [v59 accessoryView];
        v56 = [v57 bottomAnchor];
        long long v21 = [v58 constraintLessThanOrEqualToAnchor:v56];
        v121[4] = v21;
        long long v22 = [(UGCUserInformationCell *)v17->_nutritionLabelView layoutMarginsGuide];
        long long v23 = [v22 centerYAnchor];
        long long v24 = [(RAPWebBundleBaseViewController *)v19 footerView];
        [v24 accessoryView];
        v26 = long long v25 = v19;
        v27 = [v26 centerYAnchor];
        v28 = [v23 constraintEqualToAnchor:v27];
        v121[5] = v28;
        v29 = +[NSArray arrayWithObjects:v121 count:6];
        [v117 addObjectsFromArray:v29];

        v30 = v75;
        id v31 = v83;

        long long v19 = v25;
        v32 = v81;

        v33 = v117;
        v34 = v112;
      }
      else
      {
        v107 = [(UGCUserInformationCell *)nutritionLabelView topAnchor];
        v113 = [(RAPWebBundleBaseViewController *)v17 webView];
        v104 = [v113 bottomAnchor];
        v101 = [v107 constraintEqualToAnchor:v104 constant:8.0];
        v120[0] = v101;
        v95 = [(UGCUserInformationCell *)v17->_nutritionLabelView leadingAnchor];
        v98 = [(RAPWebBundleBaseViewController *)v17 view];
        v92 = [v98 safeAreaLayoutGuide];
        v35 = [v92 leadingAnchor];
        v36 = [v95 constraintEqualToAnchor:v35];
        v120[1] = v36;
        v37 = [(UGCUserInformationCell *)v17->_nutritionLabelView trailingAnchor];
        v38 = [(RAPWebBundleBaseViewController *)v17 view];
        v39 = [v38 safeAreaLayoutGuide];
        v40 = [v39 trailingAnchor];
        v41 = [v37 constraintEqualToAnchor:v40];
        v120[2] = v41;
        v42 = +[NSArray arrayWithObjects:v120 count:3];
        [v117 addObjectsFromArray:v42];

        v43 = [(RAPWebBundleBaseViewController *)v17 webBundleQuestion];
        v44 = (char *)[v43 questionType] - 13;

        id v31 = [(UGCUserInformationCell *)v17->_nutritionLabelView bottomAnchor];
        v34 = [(RAPWebBundleBaseViewController *)v17 view];
        v32 = [v34 safeAreaLayoutGuide];
        v30 = [v32 bottomAnchor];
        if ((unint64_t)v44 > 7)
        {
          v54 = [v31 constraintEqualToAnchor:v30];
          v118 = v54;
          v55 = +[NSArray arrayWithObjects:&v118 count:1];
          [v117 addObjectsFromArray:v55];

          v33 = v117;
        }
        else
        {
          v108 = [v31 constraintLessThanOrEqualToAnchor:v30];
          v119[0] = v108;
          v45 = [(UGCUserInformationCell *)v17->_nutritionLabelView bottomAnchor];
          [(RAPWebBundleBaseViewController *)v17 view];
          v46 = v114 = v34;
          v47 = [v46 keyboardLayoutGuide];
          [v47 topAnchor];
          v49 = v48 = v32;
          LODWORD(v50) = 1144750080;
          v51 = [v45 constraintEqualToAnchor:v49 constant:-8.0 priority:v50];
          v119[1] = v51;
          +[NSArray arrayWithObjects:v119 count:2];
          v53 = v52 = v30;
          v33 = v117;
          [v117 addObjectsFromArray:v53];

          v30 = v52;
          v32 = v48;

          v34 = v114;
        }
        id v16 = v116;
        long long v19 = 0;
      }
    }
    else
    {
      id v31 = [(RAPWebBundleBaseViewController *)v17 webView];
      v34 = [v31 bottomAnchor];
      v32 = [v34 constraintEqualToAnchor:v16];
      v122 = v32;
      v30 = +[NSArray arrayWithObjects:&v122 count:1];
      v33 = v117;
      [v117 addObjectsFromArray:v30];
    }
  }
  +[NSLayoutConstraint activateConstraints:v33];
}

- (void)_removePhotoWithId:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBundleConfiguration *)self->_configuration webBundleDirectory];
  unsigned __int8 v6 = +[RAPImageStorage removeImageWithImageIdentifier:v4 directory:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = sub_1000B8184();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Cannot remove image from device with id: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v8 = [(WebBundleConfiguration *)self->_configuration absoluteCachedWebBundleDirectory];
  unsigned __int8 v9 = +[RAPImageStorage removeImageWithImageIdentifier:v4 directory:v8];

  if ((v9 & 1) == 0)
  {
    int v10 = sub_1000B8184();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot remove image in on-device directory from device with id: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  v11 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  uint64_t v12 = [v11 geotaggedPhotoCommentQuestion];
  unsigned __int8 v13 = [v12 removePhotoForIdentifier:v4];

  if ((v13 & 1) == 0)
  {
    objc_super v14 = sub_1000B8184();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cannot remove image from rap question with id: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_submitButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RAPWebBundleBaseViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)_presentPrivacyView
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.mapsrap"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)_addAnalyticsEventToCombinedUserPath:(id)a3
{
  report = self->_report;
  id v4 = a3;
  id v5 = [(RAPReport *)report combinedUserPath];
  [v5 addWebPath:v4];
}

- (void)_saveInlineCardHeightIfNeeded:(double)a3
{
  if (self->_needsCardHeightSave)
  {
    self->_needsCardHeightSave = 0;
    id v4 = [(RAPWebBundleBaseViewController *)self delegate];
    [v4 saveInitialCardHeight:a3];
  }
}

- (id)_photoPickerAnchoringViewForBoundingBox:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!self->_photoPickerAnchoringView)
  {
    uint64_t v8 = [(UIView *)objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    photoPickerAnchoringView = self->_photoPickerAnchoringView;
    self->_photoPickerAnchoringView = v8;

    [(UIView *)self->_photoPickerAnchoringView setUserInteractionEnabled:0];
    int v10 = [(RAPWebBundleBaseViewController *)self view];
    [v10 addSubview:self->_photoPickerAnchoringView];
  }
  v11 = [(RAPWebBundleBaseViewController *)self view];
  uint64_t v12 = [(RAPWebBundleBaseViewController *)self webView];
  [v11 convertRect:v12 fromView:x, y, width, height];
  -[UIView setFrame:](self->_photoPickerAnchoringView, "setFrame:");

  unsigned __int8 v13 = self->_photoPickerAnchoringView;

  return v13;
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned __int8 v9 = [v7 objectForKeyedSubscript:@"name"];
  unsigned int v10 = [v9 isEqualToString:@"setValid"];

  if (v10)
  {
    v11 = [v7 objectForKeyedSubscript:@"isValid"];
    -[RAPWebBundleBaseViewController _submitButtonEnabled:](self, "_submitButtonEnabled:", [v11 BOOLValue]);
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [v7 objectForKeyedSubscript:@"name"];
  unsigned int v13 = [v12 isEqualToString:@"getPhotos"];

  if (v13)
  {
    v11 = [(RAPWebBundleBaseViewController *)self view];
    objc_super v14 = [v7 objectForKeyedSubscript:@"boundingBox"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = [v7 objectForKeyedSubscript:@"boundingBox"];

      if (!v15)
      {
LABEL_8:
        v29 = [(RAPWebBundleBaseViewController *)self _photoPickerReplyHandler:v8];
        [(RAPPhotoPickerController *)v29 setAnchoringView:v11];
        [(RAPPhotoPickerController *)v29 setPresentingViewController:self];
        [(RAPPhotoPickerController *)v29 startPicking];
        photoPicker = self->_photoPicker;
        self->_photoPicker = v29;

        goto LABEL_11;
      }
      objc_super v14 = [v7 objectForKeyedSubscript:@"boundingBox"];
      id v16 = [v14 objectForKeyedSubscript:@"xCoordinate"];
      [v16 doubleValue];
      double v18 = v17;
      long long v19 = [v14 objectForKeyedSubscript:@"yCoordinate"];
      [v19 doubleValue];
      double v21 = v20;
      long long v22 = [v14 objectForKeyedSubscript:@"width"];
      [v22 doubleValue];
      double v24 = v23;
      long long v25 = [v14 objectForKeyedSubscript:@"height"];
      [v25 doubleValue];
      double v27 = v26;

      uint64_t v28 = -[RAPWebBundleBaseViewController _photoPickerAnchoringViewForBoundingBox:](self, "_photoPickerAnchoringViewForBoundingBox:", v18, v21, v24, v27);

      v11 = (void *)v28;
    }

    goto LABEL_8;
  }
  id v31 = [v7 objectForKeyedSubscript:@"name"];
  unsigned int v32 = [v31 isEqualToString:@"removePhoto"];

  if (v32)
  {
    v11 = [v7 objectForKeyedSubscript:@"id"];
    [(RAPWebBundleBaseViewController *)self _removePhotoWithId:v11];
    goto LABEL_11;
  }
  v33 = [v7 objectForKeyedSubscript:@"name"];
  unsigned int v34 = [v33 isEqualToString:@"showPrivacy"];

  if (v34)
  {
    [(RAPWebBundleBaseViewController *)self _presentPrivacyView];
    goto LABEL_12;
  }
  v35 = [v7 objectForKeyedSubscript:@"name"];
  unsigned int v36 = [v35 isEqualToString:@"sendAnalyticsEvent"];

  if (v36)
  {
    v11 = [v7 objectForKeyedSubscript:@"values"];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v37 = [v11 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v69;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v69 != v39) {
            objc_enumerationMutation(v11);
          }
          [(RAPWebBundleBaseViewController *)self _addAnalyticsEventToCombinedUserPath:*(void *)(*((void *)&v68 + 1) + 8 * i)];
        }
        id v38 = [v11 countByEnumeratingWithState:&v68 objects:v74 count:16];
      }
      while (v38);
    }
    goto LABEL_11;
  }
  v41 = [v7 objectForKeyedSubscript:@"name"];
  unsigned int v42 = [v41 isEqualToString:@"pageShown"];

  if (v42)
  {
    v43 = [v7 objectForKeyedSubscript:@"success"];
    id v44 = [v43 BOOLValue];

    [(WebBundleManager *)self->_webBundleManager didLoadPageWithSuccess:v44];
    self->_needsCardHeightSave = 1;
    goto LABEL_12;
  }
  v45 = [v7 objectForKeyedSubscript:@"name"];
  unsigned int v46 = [v45 isEqualToString:@"pageResized"];

  if (!v46)
  {
    v55 = [v7 objectForKeyedSubscript:@"name"];
    unsigned int v56 = [v55 isEqualToString:@"logWebBundleMsg"];

    if (v56)
    {
      v57 = [v7 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_12;
      }
      v59 = [v7 objectForKeyedSubscript:@"value"];
      v60 = sub_1000B8184();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v59;
        v61 = "Message from WebBundle: %@";
        v62 = v60;
        os_log_type_t v63 = OS_LOG_TYPE_INFO;
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, v62, v63, v61, buf, 0xCu);
      }
    }
    else
    {
      v64 = [v7 objectForKeyedSubscript:@"name"];
      unsigned int v65 = [v64 isEqualToString:@"logWebBundleError"];

      if (!v65) {
        goto LABEL_12;
      }
      v66 = [v7 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      char v67 = objc_opt_isKindOfClass();

      if ((v67 & 1) == 0) {
        goto LABEL_12;
      }
      v59 = [v7 objectForKeyedSubscript:@"value"];
      v60 = sub_1000B8184();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v59;
        v61 = "Error from WebBundle: %@";
        v62 = v60;
        os_log_type_t v63 = OS_LOG_TYPE_ERROR;
        goto LABEL_43;
      }
    }

    goto LABEL_12;
  }
  v47 = [v7 objectForKeyedSubscript:@"pageHeight"];
  [v47 cgFloatValue];
  double v49 = v48;

  if ((MapsFeature_IsEnabled_RAPCommunityID() & 1) == 0)
  {
    double v50 = self;
    objc_opt_class();
    v51 = (objc_opt_isKindOfClass() & 1) != 0 ? v50 : 0;
    v52 = v51;

    nutritionLabelView = v50->_nutritionLabelView;
    if (nutritionLabelView)
    {
      if (!v52)
      {
        [(UGCUserInformationCell *)nutritionLabelView frame];
        double v49 = v49 + CGRectGetHeight(v75) + 8.0;
      }
    }
  }
  v54 = [(RAPWebBundleBaseViewController *)self delegate];
  [v54 updateCardHeight:v49];

  [(RAPWebBundleBaseViewController *)self _saveInlineCardHeightIfNeeded:v49];
LABEL_12:
}

- (id)_photoPickerReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = [[RAPPhotoPickerController alloc] initWithInitialPhoto:0];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100103FF8;
  v10[4] = sub_100104888;
  id v11 = objc_retainBlock(v4);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100816480;
  v7[3] = &unk_1012F9D48;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v7[5] = v10;
  [(RAPPhotoPickerController *)v5 addObserver:self changeHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v10, 8);

  return v5;
}

- (NSString)entryPointString
{
  return self->_entryPointString;
}

- (void)setEntryPointString:(id)a3
{
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (RAPWebBundleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPWebBundleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_entryPointString, 0);
  objc_storeStrong((id *)&self->_photoIdentifiers, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_photoPickerAnchoringView, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_nutritionLabelView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_webBundleManager, 0);
}

@end