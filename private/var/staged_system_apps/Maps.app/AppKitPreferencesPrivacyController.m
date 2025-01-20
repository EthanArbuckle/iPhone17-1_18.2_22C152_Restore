@interface AppKitPreferencesPrivacyController
- (AppKitPreferencesPrivacyController)initWithBundleIdentifier:(id)a3;
- (UGCAppKitPreferencesPrivacyControllerDelegate)delegate;
- (void)_dismissSplashScreen;
- (void)present;
- (void)setDelegate:(id)a3;
@end

@implementation AppKitPreferencesPrivacyController

- (AppKitPreferencesPrivacyController)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppKitPreferencesPrivacyController;
  v6 = [(AppKitPreferencesPrivacyController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (void)present
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissSplashScreen"];
  v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:self->_bundleIdentifier];
  id v5 = [v4 splashController];
  obkSplashController = self->_obkSplashController;
  self->_obkSplashController = v5;

  v7 = [(OBPrivacySplashController *)self->_obkSplashController navigationItem];
  [v7 setRightBarButtonItem:v3];

  v8 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_obkSplashController];
  navigationController = self->_navigationController;
  self->_navigationController = v8;

  [(UINavigationController *)self->_navigationController setNavigationBarHidden:1];
  v10 = +[UIApplication sharedMapsDelegate];
  v11 = [v10 loadAppKitBundle];
  v12 = (objc_class *)[v11 classNamed:@"MacSceneHostingPreferencesPresentationController"];

  objc_initWeak(&location, self);
  id v13 = [v12 alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A4B218;
  v16[3] = &unk_1013151D0;
  objc_copyWeak(&v17, &location);
  v14 = (MacSceneHostingPreferencesPresentationController *)[v13 initWithSetupBlock:v16];
  presentationController = self->_presentationController;
  self->_presentationController = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_dismissSplashScreen
{
  [(MacSceneHostingPreferencesPresentationController *)self->_presentationController dismissScene];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained preferencesPrivacyControllerDidDismiss:self];
}

- (UGCAppKitPreferencesPrivacyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCAppKitPreferencesPrivacyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_obkSplashController, 0);

  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end