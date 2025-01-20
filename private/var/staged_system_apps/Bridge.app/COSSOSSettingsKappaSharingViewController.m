@interface COSSOSSettingsKappaSharingViewController
- (SABundleManagerApp)app;
- (void)disableKappaThirdPartyAppForSpecifier:(id)a3;
- (void)setApp:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSSOSSettingsKappaSharingViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)COSSOSSettingsKappaSharingViewController;
  [(COSSOSSettingsKappaSharingViewController *)&v12 viewDidLoad];
  v3 = [sub_1000515A8() crashDetectionThirdPartyDescription];
  [(COSSOSSettingsKappaSharingViewController *)self setTitle:v3];

  v4 = [(COSSOSSettingsKappaSharingViewController *)self specifier];
  v5 = [v4 propertyForKey:PSValueKey];
  app = self->_app;
  self->_app = v5;

  objc_initWeak(&location, self);
  id v7 = sub_1000515A8();
  v8 = self->_app;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005168C;
  v9[3] = &unk_1002447C8;
  objc_copyWeak(&v10, &location);
  [v7 thirdPartySettingsSpecifiersForRemoteDeviceWithTarget:self forApp:v8 disableAction:"disableKappaThirdPartyAppForSpecifier:" withCompletion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)disableKappaThirdPartyAppForSpecifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = sub_1000515A8();
  app = self->_app;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000517F0;
  v7[3] = &unk_100243810;
  objc_copyWeak(&v8, &location);
  [v5 setKappaThirdPartyActive:0 forApp:app forPairedDevice:1 presentConfirmationOnViewController:self completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (SABundleManagerApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end