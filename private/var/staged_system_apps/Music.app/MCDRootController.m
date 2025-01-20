@interface MCDRootController
- (MCDRootController)initWithWindow:(id)a3;
- (NSArray)tabIdentifiers;
- (UIWindow)carDisplayWindow;
- (void)reloadTabsContent;
- (void)sceneDidDisconnect;
- (void)setTabIdentifiers:(id)a3;
- (void)showNowPlaying:(BOOL)a3;
- (void)showSharePlayTogetherSettings;
@end

@implementation MCDRootController

- (MCDRootController)initWithWindow:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCDRootController;
  v6 = [(MCDRootController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_carDisplayWindow, a3);
    [(UIWindow *)v7->_carDisplayWindow setHidden:0];
    tabIdentifiers = v7->_tabIdentifiers;
    v7->_tabIdentifiers = (NSArray *)&__NSArray0__struct;

    uint64_t v9 = objc_opt_new();
    browserViewController = v7->_browserViewController;
    v7->_browserViewController = (MCDBrowserViewController *)v9;

    [(UIWindow *)v7->_carDisplayWindow setRootViewController:v7->_browserViewController];
  }

  return v7;
}

- (void)sceneDidDisconnect
{
}

- (void)showNowPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v5 = (void (*)(void))off_1010D7018;
  objc_super v12 = off_1010D7018;
  if (!off_1010D7018)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B0E98;
    v8[3] = &unk_100FC34A0;
    v8[4] = &v9;
    sub_1000B0E98((uint64_t)v8);
    id v5 = (void (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v5)
  {
    v7 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  v6 = v5();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Launching to Now Playing", (uint8_t *)v8, 2u);
  }

  [(MCDBrowserViewController *)self->_browserViewController pushNowPlaying:v3];
}

- (void)showSharePlayTogetherSettings
{
}

- (void)setTabIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_tabIdentifiers, a3);
  id v5 = a3;
  [(MCDBrowserViewController *)self->_browserViewController setTabIdentifiers:v5];
}

- (void)reloadTabsContent
{
}

- (UIWindow)carDisplayWindow
{
  return self->_carDisplayWindow;
}

- (NSArray)tabIdentifiers
{
  return self->_tabIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIdentifiers, 0);
  objc_storeStrong((id *)&self->_carDisplayWindow, 0);

  objc_storeStrong((id *)&self->_browserViewController, 0);
}

@end