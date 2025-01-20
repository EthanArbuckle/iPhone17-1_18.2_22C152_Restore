@interface MFCategorizationConfirmationViewController
- (BOOL)isAuthenticated;
- (ECEmailAddressConvertible)sender;
- (EMCachingContactStore)contactStore;
- (EMCategory)category;
- (MFCategorizationConfirmationViewController)initWithSender:(id)a3 category:(id)a4 displayName:(id)a5 businessLogoID:(id)a6 bucket:(int64_t)a7 avatarGenerator:(id)a8 isAuthenticated:(BOOL)a9 contactStore:(id)a10 continueActionHandler:(id)a11 cancelActionHandler:(id)a12;
- (MUIAvatarImageGenerator)avatarGenerator;
- (NSString)businessLogoID;
- (NSString)displayName;
- (UIImageView)avatarImageView;
- (double)preferredHeightForWidth:(double)a3;
- (id)_explainationLabelTextForBucket:(int64_t)a3;
- (id)_titleLabelTextForBucket:(int64_t)a3;
- (id)cancelActionHandler;
- (id)continueActionHandler;
- (int64_t)bucket;
- (void)_updateAvatar;
- (void)loadView;
- (void)resizeSheet;
- (void)setAvatarGenerator:(id)a3;
- (void)setAvatarImageView:(id)a3;
- (void)setBucket:(int64_t)a3;
- (void)setBusinessLogoID:(id)a3;
- (void)setCancelActionHandler:(id)a3;
- (void)setCategory:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContinueActionHandler:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)updateSizeForLayoutChange;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MFCategorizationConfirmationViewController

- (MFCategorizationConfirmationViewController)initWithSender:(id)a3 category:(id)a4 displayName:(id)a5 businessLogoID:(id)a6 bucket:(int64_t)a7 avatarGenerator:(id)a8 isAuthenticated:(BOOL)a9 contactStore:(id)a10 continueActionHandler:(id)a11 cancelActionHandler:(id)a12
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a8;
  id v28 = a10;
  id v19 = a11;
  id v20 = a12;
  v34.receiver = self;
  v34.super_class = (Class)MFCategorizationConfirmationViewController;
  v21 = [(MFCategorizationConfirmationViewController *)&v34 initWithNibName:0 bundle:0];
  v22 = v21;
  if (v21)
  {
    v21->_bucket = a7;
    objc_storeStrong((id *)&v21->_sender, a3);
    objc_storeStrong((id *)&v22->_category, a4);
    objc_storeStrong((id *)&v22->_displayName, a5);
    objc_storeStrong((id *)&v22->_businessLogoID, a6);
    objc_storeStrong((id *)&v22->_avatarGenerator, a8);
    id v23 = objc_retainBlock(v19);
    id continueActionHandler = v22->_continueActionHandler;
    v22->_id continueActionHandler = v23;

    id v25 = objc_retainBlock(v20);
    id cancelActionHandler = v22->_cancelActionHandler;
    v22->_id cancelActionHandler = v25;

    v22->_isAuthenticated = a9;
    objc_storeStrong((id *)&v22->_contactStore, a10);
  }

  return v22;
}

- (void)loadView
{
  id v57 = objc_alloc_init((Class)UIView);
  -[MFCategorizationConfirmationViewController setView:](self, "setView:");
  v50 = +[UIBlurEffect effectWithStyle:9];
  id v41 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v50];
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v57 addSubview:v41];
  [v41 mf_pinToView:v57 usingLayoutMargins:0];
  v56 = objc_opt_new();
  v40 = +[UIImageSymbolConfiguration configurationWithPointSize:80.0];
  v42 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", MFImageGlyphSearchPeople);
  [v56 setImage:];
  +[MUIAvatarImageGenerator roundAvatarView:v56 withBorder:0 size:80.0];
  [(MFCategorizationConfirmationViewController *)self setAvatarImageView:v56];
  [(MFCategorizationConfirmationViewController *)self _updateAvatar];
  id v54 = objc_alloc_init((Class)UILabel);
  v3 = [(MFCategorizationConfirmationViewController *)self _titleLabelTextForBucket:[(MFCategorizationConfirmationViewController *)self bucket]];
  [v54 setText:v3];

  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  [v4 pointSize];
  v5 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  [v54 setFont:v5];

  [v54 setNumberOfLines:0];
  [v54 setTextAlignment:1];
  id v53 = objc_alloc_init((Class)UILabel);
  v6 = [(MFCategorizationConfirmationViewController *)self _explainationLabelTextForBucket:[(MFCategorizationConfirmationViewController *)self bucket]];
  [v53 setText:v6];

  v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v53 setFont:v7];

  [v53 setNumberOfLines:0];
  [v53 setTextAlignment:1];
  v55 = +[OBBoldTrayButton boldButton];
  v8 = _EFLocalizedStringFromTable();
  [v55 setTitle:v8 forState:0];

  v9 = [(MFCategorizationConfirmationViewController *)self continueActionHandler];
  v10 = +[UIAction actionWithHandler:v9];
  [v55 addAction:v10 forControlEvents:64];

  v52 = +[OBLinkTrayButton linkButton];
  v11 = _EFLocalizedStringFromTable();
  [v52 setTitle:v11 forState:0];

  v12 = [(MFCategorizationConfirmationViewController *)self cancelActionHandler];
  v13 = +[UIAction actionWithHandler:v12];
  [v52 addAction:v13 forControlEvents:64];

  LODWORD(v14) = 1148846080;
  [v52 setContentHuggingPriority:1 forAxis:v14];
  id v15 = objc_alloc((Class)UIStackView);
  v61[0] = v56;
  v61[1] = v54;
  v61[2] = v53;
  v16 = +[NSArray arrayWithObjects:v61 count:3];
  id v51 = [v15 initWithArrangedSubviews:v16];

  [v51 setAxis:1];
  [v51 setAlignment:3];
  [v51 setSpacing:16.0];
  id v17 = objc_alloc((Class)UIStackView);
  v60[0] = v55;
  v60[1] = v52;
  v18 = +[NSArray arrayWithObjects:v60 count:2];
  id v49 = [v17 initWithArrangedSubviews:v18];

  [v49 setAxis:1];
  [v49 setAlignment:3];
  [v49 setDistribution:1];
  [v49 setSpacing:8.0];
  id v19 = objc_alloc((Class)UIStackView);
  v59[0] = v51;
  v59[1] = v49;
  id v20 = +[NSArray arrayWithObjects:v59 count:2];
  id v21 = [v19 initWithArrangedSubviews:v20];

  [v21 setAxis:1];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 setAlignment:3];
  [v21 setSpacing:40.0];
  [v57 addSubview:v21];
  v48 = [v21 topAnchor];
  v39 = [v57 topAnchor];
  v38 = [v48 constraintEqualToAnchor:24.0];
  v58[0] = v38;
  v47 = [v21 leadingAnchor];
  v37 = [v57 leadingAnchor];
  v36 = [v47 constraintEqualToAnchor:28.0];
  v58[1] = v36;
  v46 = [v21 trailingAnchor];
  v35 = [v57 trailingAnchor];
  objc_super v34 = [v46 constraintEqualToAnchor:-28.0];
  v58[2] = v34;
  v45 = [v21 bottomAnchor];
  id v33 = [v57 bottomAnchor];
  id v32 = [v45 constraintEqualToAnchor:-24.0];
  v58[3] = v32;
  v44 = [v55 leadingAnchor];
  id v31 = [v21 leadingAnchor];
  id v30 = [v44 constraintEqualToAnchor:];
  v58[4] = v30;
  v43 = [v55 trailingAnchor];
  v22 = [v21 trailingAnchor];
  id v23 = [v43 constraintEqualToAnchor:v22];
  v58[5] = v23;
  v24 = [v56 widthAnchor];
  id v25 = [v24 constraintEqualToConstant:80.0];
  v58[6] = v25;
  v26 = [v56 heightAnchor];
  v27 = [v56 widthAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27];
  v58[7] = v28;
  id v29 = +[NSArray arrayWithObjects:v58 count:8];
  +[NSLayoutConstraint activateConstraints:v29];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)MFCategorizationConfirmationViewController;
  [(MFCategorizationConfirmationViewController *)&v10 viewDidLoad];
  v3 = [(MFCategorizationConfirmationViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = [(MFCategorizationConfirmationViewController *)self presentingViewController];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v11 count:2];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017B2DC;
  v7[3] = &unk_100608AC8;
  objc_copyWeak(&v8, &location);
  id v6 = [v4 registerForTraitChanges:v5 withHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFCategorizationConfirmationViewController;
  [(MFCategorizationConfirmationViewController *)&v4 viewWillAppear:a3];
  [(MFCategorizationConfirmationViewController *)self updateSizeForLayoutChange];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MFCategorizationConfirmationViewController;
  -[MFCategorizationConfirmationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017B520;
  v8[3] = &unk_100606048;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)updateSizeForLayoutChange
{
  v3 = [(MFCategorizationConfirmationViewController *)self sheetPresentationController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10017B5F4;
  v5[3] = &unk_1006047A0;
  v5[4] = self;
  [v3 animateChanges:v5];

  [(MFCategorizationConfirmationViewController *)self preferredHeightForWidth:388.0];
  -[MFCategorizationConfirmationViewController setPreferredContentSize:](self, "setPreferredContentSize:", 388.0, v4);
}

- (void)resizeSheet
{
  v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017B754;
  v8[3] = &unk_10060AC48;
  v8[4] = self;
  v5 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:v4 resolver:v8];
  objc_super v9 = v5;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = [(MFCategorizationConfirmationViewController *)self sheetPresentationController];
  [v7 setDetents:v6];
}

- (id)_explainationLabelTextForBucket:(int64_t)a3
{
  double v4 = [(MFCategorizationConfirmationViewController *)self displayName];
  if (a3) {
    +[MUILocalizedBlackPearlStrings allCurrentAndFutureMessagesFromDisplayName:v4 willBeCategorizedInBucket:a3];
  }
  else {
  v5 = +[MUILocalizedBlackPearlStrings allCurrentAndFutureMessagesAutomaticallyCategorizedForDisplayName:v4];
  }

  return v5;
}

- (id)_titleLabelTextForBucket:(int64_t)a3
{
  v5 = [(MFCategorizationConfirmationViewController *)self displayName];
  if (a3) {
    +[MUILocalizedBlackPearlStrings titleForManuallyCategorizingMessagesFromDisplayName:v5 toBucket:[(MFCategorizationConfirmationViewController *)self bucket]];
  }
  else {
  id v6 = +[MUILocalizedBlackPearlStrings titleForRestoringAutomaticCategorizationForDisplayName:v5];
  }

  return v6;
}

- (void)_updateAvatar
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)MUIAvatarImageContext);
  double v4 = [(MFCategorizationConfirmationViewController *)self category];
  v5 = [(MFCategorizationConfirmationViewController *)self sender];
  id v6 = [v5 emailAddressValue];
  id v7 = [(MFCategorizationConfirmationViewController *)self businessLogoID];
  BOOL v8 = [(MFCategorizationConfirmationViewController *)self isAuthenticated];
  objc_super v9 = [(MFCategorizationConfirmationViewController *)self contactStore];
  id v10 = [v3 initWithCategory:v4 emailAddress:v6 businessLogoID:v7 isAuthenticated:v8 contactStore:v9 brandIndicatorFuture:0];

  v11 = [(MFCategorizationConfirmationViewController *)self avatarGenerator];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10017BAEC;
  v13[3] = &unk_10060AC70;
  objc_copyWeak(&v14, &location);
  id v12 = [v11 avatarImageForContext:v10 handler:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (double)preferredHeightForWidth:(double)a3
{
  double height = UILayoutFittingCompressedSize.height;
  v5 = [(MFCategorizationConfirmationViewController *)self view];
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  [v5 systemLayoutSizeFittingSize:a3 withHorizontalFittingPriority:height verticalFittingPriority:v6 v7];
  double v9 = v8;

  return v9;
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (void)setBucket:(int64_t)a3
{
  self->_bucket = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)businessLogoID
{
  return self->_businessLogoID;
}

- (void)setBusinessLogoID:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (id)continueActionHandler
{
  return self->_continueActionHandler;
}

- (void)setContinueActionHandler:(id)a3
{
}

- (id)cancelActionHandler
{
  return self->_cancelActionHandler;
}

- (void)setCancelActionHandler:(id)a3
{
}

- (ECEmailAddressConvertible)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (EMCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (void)setAvatarImageView:(id)a3
{
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong(&self->_cancelActionHandler, 0);
  objc_storeStrong(&self->_continueActionHandler, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_businessLogoID, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end