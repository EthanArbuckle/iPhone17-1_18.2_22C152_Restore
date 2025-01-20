@interface _UIUserDefaultsHostActivity
- (UIViewController)presentableActivityViewController;
- (id)activityViewController;
- (void)_cleanup;
- (void)_prepareActivityViewControllerIfNeeded;
- (void)_settingsViewControllerDidDismiss:(id)a3;
- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5;
- (void)setPresentableActivityViewController:(id)a3;
@end

@implementation _UIUserDefaultsHostActivity

- (id)activityViewController
{
  [(_UIUserDefaultsHostActivity *)self _prepareActivityViewControllerIfNeeded];
  return [(_UIUserDefaultsHostActivity *)self presentableActivityViewController];
}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)_UIUserDefaultsHostActivity;
  [(UIActivity *)&v8 activityDidFinish:a3 items:a4 error:a5];
  v6 = [(_UIUserDefaultsHostActivity *)self presentableActivityViewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___UIUserDefaultsHostActivity_activityDidFinish_items_error___block_invoke;
  v7[3] = &unk_1E5A21900;
  v7[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v7];
}

- (void)_settingsViewControllerDidDismiss:(id)a3
{
}

- (void)_cleanup
{
}

- (void)_prepareActivityViewControllerIfNeeded
{
  v3 = [(_UIUserDefaultsHostActivity *)self presentableActivityViewController];

  if (!v3)
  {
    v4 = [_UIActivityUserDefaultsViewController alloc];
    v5 = [(_UIUserDefaultsActivity *)self availableActivities];
    v6 = [(_UIUserDefaultsActivity *)self userDefaults];
    v12 = [(_UIActivityUserDefaultsViewController *)v4 initWithActivities:v5 userDefaults:v6];

    v7 = _ShareSheetBundle();
    objc_super v8 = [v7 localizedStringForKey:@"Activities" value:@"Activities" table:@"Localizable"];
    [(_UIActivityUserDefaultsViewController *)v12 setTitle:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__settingsViewControllerDidDismiss_];
    v10 = [(_UIActivityUserDefaultsViewController *)v12 navigationItem];
    [v10 setRightBarButtonItem:v9];

    v11 = [[_UIUserDefaultsActivityPresentableViewController alloc] initWithUserDefaultsViewController:v12];
    [(_UIUserDefaultsHostActivity *)self setPresentableActivityViewController:v11];
  }
}

- (UIViewController)presentableActivityViewController
{
  return self->_presentableActivityViewController;
}

- (void)setPresentableActivityViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end