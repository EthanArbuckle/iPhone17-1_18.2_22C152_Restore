@interface COSPartnerAppInstallRowViewController
- (BOOL)showsOnGizmoEnabled;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (COSPartnerAppAMSDelegate)amsDelegate;
- (COSPartnerAppInstallRowViewController)init;
- (Class)installRowClass;
- (id)customSpecifiers;
- (id)installRowIdentifier;
- (id)partnerAppBundleIdentifier;
- (id)partnerAppStoreIdentifier;
- (void)dealloc;
- (void)setAmsDelegate:(id)a3;
@end

@implementation COSPartnerAppInstallRowViewController

- (COSPartnerAppInstallRowViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSPartnerAppInstallRowViewController;
  v2 = [(COSSockPuppetAppListController *)&v6 init];
  if (v2)
  {
    v3 = [[COSPartnerAppAMSDelegate alloc] initWithPresentingViewController:v2];
    amsDelegate = v2->_amsDelegate;
    v2->_amsDelegate = v3;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSPartnerAppInstallRowViewController;
  [(COSSockPuppetAppListController *)&v4 dealloc];
}

- (id)installRowIdentifier
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPartnerAppInstallRowViewController installRowIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (Class)installRowClass
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPartnerAppInstallRowViewController installRowClass]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)partnerAppBundleIdentifier
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPartnerAppInstallRowViewController partnerAppBundleIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)partnerAppStoreIdentifier
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPartnerAppInstallRowViewController partnerAppStoreIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)customSpecifiers
{
  v3 = +[NSMutableArray array];
  int v4 = +[PSSpecifier emptyGroupSpecifier];
  v5 = [(COSPartnerAppInstallRowViewController *)self installRowIdentifier];
  [v4 setIdentifier:v5];

  objc_super v6 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:1 edit:0];
  v7 = [(COSPartnerAppInstallRowViewController *)self installRowClass];
  [v6 setProperty:v7 forKey:PSCellClassKey];
  [v6 setProperty:&off_10025C028 forKey:PSTableCellHeightKey];
  [v3 insertObject:v6 atIndex:0];
  [v3 insertObject:v4 atIndex:0];

  return v3;
}

- (BOOL)showsOnGizmoEnabled
{
  v3 = [COSAppInstallationController alloc];
  int v4 = [(COSPartnerAppInstallRowViewController *)self partnerAppBundleIdentifier];
  v5 = [(COSPartnerAppInstallRowViewController *)self partnerAppStoreIdentifier];
  objc_super v6 = [(COSAppInstallationController *)v3 initWithBundleID:v4 andStoreIdentifier:v5];

  uint64_t v7 = OBJC_IVAR___PSViewController__specifier;
  v8 = [*(id *)&self->super.PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSSockPuppetInstallationState"];
  id v9 = [v8 integerValue];

  v10 = [*(id *)&self->super.PSAppListController_opaque[v7] propertyForKey:@"applicationMode"];
  id v11 = [v10 integerValue];

  if (v9 == (id)2 && v11 == (id)2) {
    unsigned __int8 v13 = 1;
  }
  else {
    unsigned __int8 v13 = [(COSAppInstallationController *)v6 isInstalled];
  }

  return v13;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [a4 section] != 0;
}

- (COSPartnerAppAMSDelegate)amsDelegate
{
  return self->_amsDelegate;
}

- (void)setAmsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end