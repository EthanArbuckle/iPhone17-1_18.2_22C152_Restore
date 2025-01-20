@interface UGCInformedConsentViewController
+ (void)presentIfNeededWithPresentingViewController:(id)a3 presentationContext:(int64_t)a4 completion:(id)a5;
- (UGCInformedConsentViewController)initWithCompletion:(id)a3;
- (int64_t)presentationContext;
- (void)_captureUserAction:(int)a3 withValue:(id)a4;
- (void)_continuePressed;
- (void)_invokeCompletionWithHasGivenConsent:(BOOL)a3;
- (void)_notNowPressed;
- (void)_setupPrivacyController;
- (void)setPresentationContext:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation UGCInformedConsentViewController

+ (void)presentIfNeededWithPresentingViewController:(id)a3 presentationContext:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, void))a5;
  if (v8)
  {
    if (MKGetHasUserConsentedToAddingContributions() == 1)
    {
      v8[2](v8, 1, 0);
    }
    else
    {
      v9 = [[UGCInformedConsentViewController alloc] initWithCompletion:v8];
      [(UGCInformedConsentViewController *)v9 setModalPresentationStyle:2];
      [(UGCInformedConsentViewController *)v9 setPresentationContext:a4];
      if (sub_1000BBB44(v9) == 5) {
        [v7 presentViewController:v9 animated:1 completion:0];
      }
      else {
        [v7 _maps_topMostPresentViewController:v9 animated:1 completion:0];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", v10, 2u);
  }
}

- (UGCInformedConsentViewController)initWithCompletion:(id)a3
{
  id v4 = a3;
  int IsEnabled_ARPCommunityID = MapsFeature_IsEnabled_ARPCommunityID();
  v6 = +[NSBundle mainBundle];
  id v7 = v6;
  if (IsEnabled_ARPCommunityID) {
    CFStringRef v8 = @"Contributing Photos to Maps [UGC]";
  }
  else {
    CFStringRef v8 = @"Introducing Ratings and Photos [UGC]";
  }
  v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];

  v14.receiver = self;
  v14.super_class = (Class)UGCInformedConsentViewController;
  v10 = [(UGCInformedConsentViewController *)&v14 initWithTitle:v9 detailText:0 icon:0];
  if (v10)
  {
    id v11 = [v4 copy];
    id completion = v10->_completion;
    v10->_id completion = v11;
  }
  return v10;
}

- (void)_captureUserAction:(int)a3 withValue:(id)a4
{
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)UGCInformedConsentViewController;
  [(UGCInformedConsentViewController *)&v6 viewDidLoad];
  [(UGCInformedConsentViewController *)self _setupPrivacyController];
  int64_t v3 = [(UGCInformedConsentViewController *)self presentationContext];
  CFStringRef v4 = @"placecard";
  if (v3 != 1) {
    CFStringRef v4 = 0;
  }
  if (v3 == 2) {
    CFStringRef v5 = @"suggestion";
  }
  else {
    CFStringRef v5 = v4;
  }
  [(UGCInformedConsentViewController *)self _captureUserAction:45 withValue:v5];
}

- (void)_setupPrivacyController
{
  int64_t v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"Share Your Experience [UGC]" value:@"localized string not found" table:0];

  CFStringRef v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"Share Your Experience Description [UGC]" value:@"localized string not found" table:0];

  uint64_t v7 = +[UIImage systemImageNamed:@"hand.thumbsup"];
  if ((MapsFeature_IsEnabled_ARPCommunityID() & 1) == 0) {
    [(UGCInformedConsentViewController *)self addBulletedListItemWithTitle:v4 description:v6 image:v7];
  }
  v37 = (void *)v7;
  v38 = (void *)v6;
  v39 = (void *)v4;
  CFStringRef v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"Siri Suggestions [UGC]" value:@"localized string not found" table:0];

  v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 localizedStringForKey:@"Siri Suggestions Description [UGC]" value:@"localized string not found" table:0];

  +[UIImage systemImageNamed:@"location"];
  v35 = (void *)v11;
  v34 = v36 = (void *)v9;
  -[UGCInformedConsentViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v9, v11);
  v12 = +[NSBundle mainBundle];
  uint64_t v13 = [v12 localizedStringForKey:@"Photo Credit [UGC]" value:@"localized string not found" table:0];

  objc_super v14 = +[NSBundle mainBundle];
  uint64_t v15 = [v14 localizedStringForKey:@"Photo Credit Description [UGC]" value:@"localized string not found" table:0];

  v16 = +[UIImage systemImageNamed:@"camera.badge.ellipsis"];
  v32 = (void *)v15;
  v33 = (void *)v13;
  [(UGCInformedConsentViewController *)self addBulletedListItemWithTitle:v13 description:v15 image:v16];
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Community Safety [UGC]" value:@"localized string not found" table:0];

  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"Community Safety Description [UGC]" value:@"localized string not found" table:0];

  v21 = +[UIImage systemImageNamed:@"person.3"];
  if ((MapsFeature_IsEnabled_ARPCommunityID() & 1) == 0) {
    [(UGCInformedConsentViewController *)self addBulletedListItemWithTitle:v18 description:v20 image:v21];
  }
  v22 = +[OBBoldTrayButton boldButton];
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"Continue [UGC]" value:@"localized string not found" table:0];
  [v22 setTitle:v24 forState:0];

  [v22 addTarget:self action:"_continuePressed" forControlEvents:64];
  v25 = +[OBLinkTrayButton linkButton];
  v26 = +[NSBundle mainBundle];
  v27 = [v26 localizedStringForKey:@"Not Now [UGC]" value:@"localized string not found" table:0];
  [v25 setTitle:v27 forState:0];

  [v25 addTarget:self action:"_notNowPressed" forControlEvents:64];
  v28 = [(UGCInformedConsentViewController *)self buttonTray];
  CFStringRef v40 = @"com.apple.onboarding.ratingsAndPhotos";
  v29 = +[NSArray arrayWithObjects:&v40 count:1];
  [v28 setPrivacyLinkForBundles:v29];

  v30 = [(UGCInformedConsentViewController *)self buttonTray];
  [v30 addButton:v22];

  v31 = [(UGCInformedConsentViewController *)self buttonTray];
  [v31 addButton:v25];
}

- (void)_continuePressed
{
  [(UGCInformedConsentViewController *)self _captureUserAction:98 withValue:0];

  [(UGCInformedConsentViewController *)self _invokeCompletionWithHasGivenConsent:1];
}

- (void)_notNowPressed
{
  [(UGCInformedConsentViewController *)self _captureUserAction:25 withValue:0];

  [(UGCInformedConsentViewController *)self _invokeCompletionWithHasGivenConsent:0];
}

- (void)_invokeCompletionWithHasGivenConsent:(BOOL)a3
{
  uint64_t HasUserConsentedToAddingContributions = MKGetHasUserConsentedToAddingContributions();
  MKSetHasUserConsentedToAddingContributions();
  +[RatingRequestHomeAvailability setHasShownTipKitAlertOnProactiveTray];
  BOOL v6 = HasUserConsentedToAddingContributions != 2 || a3;
  char v7 = ((HasUserConsentedToAddingContributions != 1) | ~a3) & v6;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A85AF4;
  v8[3] = &unk_1012E9EC8;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3;
  char v11 = v7;
  [(UGCInformedConsentViewController *)self dismissViewControllerAnimated:1 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(int64_t)a3
{
  self->_presentationContext = a3;
}

- (void).cxx_destruct
{
}

@end