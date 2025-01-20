@interface UGCThirdPartyPhotoSharingSplashViewController
+ (void)checkShouldPresentPhotoSharingSplash:(id)a3;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreference;
- (id)_obViewController;
- (void)_noThanksPressed;
- (void)_setThirdPartyPhotoShareEnabled:(BOOL)a3;
- (void)_sharePressed;
- (void)setThirdPartyPhotoSharingPreference:(id)a3;
- (void)viewDidLoad;
@end

@implementation UGCThirdPartyPhotoSharingSplashViewController

+ (void)checkShouldPresentPhotoSharingSplash:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D24EE4;
  v4[3] = &unk_1013225F0;
  id v5 = a3;
  id v3 = v5;
  +[UGCReviewedPlaceManager fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:v4];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)UGCThirdPartyPhotoSharingSplashViewController;
  [(UGCThirdPartyPhotoSharingSplashViewController *)&v13 viewDidLoad];
  id v3 = [(UGCThirdPartyPhotoSharingSplashViewController *)self presentationController];
  [v3 setDelegate:self];

  v4 = [(UGCThirdPartyPhotoSharingSplashViewController *)self _obViewController];
  [(UGCThirdPartyPhotoSharingSplashViewController *)self addChildViewController:v4];
  id v5 = [(UGCThirdPartyPhotoSharingSplashViewController *)self view];
  v6 = [v4 view];
  [v5 addSubview:v6];

  [v4 didMoveToParentViewController:self];
  v7 = [v4 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [v4 view];
  v9 = [(UGCThirdPartyPhotoSharingSplashViewController *)self view];
  LODWORD(v10) = 1148846080;
  v11 = [v8 _maps_constraintsEqualToEdgesOfView:v9 priority:v10];
  v12 = [v11 allConstraints];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (id)_obViewController
{
  id v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[UGC] Third Party Photo Sharing title" value:@"localized string not found" table:0];

  id v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"[UGC] Third Party Photo Sharing subtitle" value:@"localized string not found" table:0];

  v7 = +[UIImage systemImageNamed:@"photo.on.rectangle.angled"];
  id v8 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v4 detailText:v6 icon:v7];
  [v8 setModalPresentationStyle:2];
  v9 = +[OBBoldTrayButton boldButton];
  double v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"[UGC] Allow button" value:@"localized string not found" table:0];
  [v9 setTitle:v11 forState:0];

  [v9 addTarget:self action:"_sharePressed" forControlEvents:64];
  v12 = [v8 buttonTray];
  [v12 addButton:v9];

  objc_super v13 = +[OBLinkTrayButton linkButton];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"[UGC] Don’t Allow button" value:@"localized string not found" table:0];
  [v13 setTitle:v15 forState:0];

  [v13 addTarget:self action:"_noThanksPressed" forControlEvents:64];
  v16 = [v8 buttonTray];
  [v16 addButton:v13];

  return v8;
}

- (void)_sharePressed
{
}

- (void)_noThanksPressed
{
}

- (void)_setThirdPartyPhotoShareEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  id v5 = +[UGCThirdPartyPhotoSharingPreferencesManager sharedManager];
  v6 = [(UGCThirdPartyPhotoSharingSplashViewController *)self thirdPartyPhotoSharingPreference];
  v7 = [v6 version];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D25540;
  v8[3] = &unk_1012F7218;
  objc_copyWeak(&v9, &location);
  [v5 updateThirdPartyPhotoSharingPreferences:v3 versionID:v7 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreference
{
  return self->_thirdPartyPhotoSharingPreference;
}

- (void)setThirdPartyPhotoSharingPreference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end