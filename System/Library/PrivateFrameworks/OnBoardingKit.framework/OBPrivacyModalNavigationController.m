@interface OBPrivacyModalNavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)isDarkMode;
- (id)dismissButtonPressedHandler;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_doneButtonPressed;
- (void)addDismissButtonWithPressedHandler:(id)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setDismissButtonPressedHandler:(id)a3;
@end

@implementation OBPrivacyModalNavigationController

- (void)addDismissButtonWithPressedHandler:(id)a3
{
  id v4 = a3;
  v5 = [(OBPrivacyModalNavigationController *)self viewControllers];
  v6 = [v5 firstObject];

  if (v6)
  {
    [(OBPrivacyModalNavigationController *)self setDismissButtonPressedHandler:v4];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonPressed];
    v8 = [(OBPrivacyModalNavigationController *)self viewControllers];
    v9 = [v8 firstObject];
    v10 = [v9 navigationItem];
    [v10 setRightBarButtonItem:v7];
  }
  else
  {
    v11 = _OBLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19BF0F000, v11, OS_LOG_TYPE_DEFAULT, "addDismissButtonWithHandler: Need a view controller before we can add a button.", v12, 2u);
    }
  }
}

- (void)_doneButtonPressed
{
  v3 = [(OBPrivacyModalNavigationController *)self dismissButtonPressedHandler];

  if (v3)
  {
    id v4 = [(OBPrivacyModalNavigationController *)self dismissButtonPressedHandler];
    v4[2]();

    [(OBPrivacyModalNavigationController *)self setDismissButtonPressedHandler:0];
  }
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
  [(OBPrivacyModalNavigationController *)self setNeedsUserInterfaceAppearanceUpdate];
}

- (int64_t)preferredUserInterfaceStyle
{
  if (self->_darkMode) {
    return 2;
  }
  v3.receiver = self;
  v3.super_class = (Class)OBPrivacyModalNavigationController;
  return [(OBPrivacyModalNavigationController *)&v3 preferredUserInterfaceStyle];
}

- (unint64_t)supportedInterfaceOrientations
{
  v10.receiver = self;
  v10.super_class = (Class)OBPrivacyModalNavigationController;
  if ([(OBNavigationController *)&v10 supportedInterfaceOrientations]) {
    return [(OBNavigationController *)&v9 supportedInterfaceOrientations];
  }
  v5 = [(OBPrivacyModalNavigationController *)self presentingViewController];

  if (v5)
  {
    v6 = [(OBPrivacyModalNavigationController *)self presentingViewController];
    unint64_t v4 = [v6 supportedInterfaceOrientations];

    return v4;
  }
  return [(OBNavigationController *)&v8 supportedInterfaceOrientations];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isDarkMode
{
  return self->_darkMode;
}

- (id)dismissButtonPressedHandler
{
  return objc_getProperty(self, a2, 1432, 1);
}

- (void)setDismissButtonPressedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end