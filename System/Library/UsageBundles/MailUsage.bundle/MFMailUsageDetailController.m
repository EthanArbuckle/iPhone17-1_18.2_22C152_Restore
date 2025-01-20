@interface MFMailUsageDetailController
- (id)specifiers;
- (void)launchMail:(id)a3;
- (void)loadView;
@end

@implementation MFMailUsageDetailController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailUsageDetailController;
  [(MFMailUsageDetailController *)&v3 loadView];
  [(MFMailUsageDetailController *)self setEditingButtonHidden:1 animated:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)MFMailUsageDetailController;
    v5 = [(MFMailUsageDetailController *)&v15 specifiers];
    id v6 = [v5 mutableCopy];

    v7 = +[PSSpecifier preferenceSpecifierNamed:&stru_4218 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"OPEN_MAIL" value:&stru_4218 table:@"MailUsage"];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v10 setButtonAction:"launchMail:"];
    v16[0] = v7;
    v16[1] = v10;
    v11 = +[NSArray arrayWithObjects:v16 count:2];
    [v6 addObjectsFromArray:v11];

    v12 = (void **)&self->PSUsageBundleDetailController_opaque[v3];
    v13 = *v12;
    *v12 = v6;

    v4 = *v12;
  }

  return v4;
}

- (void)launchMail:(id)a3
{
  uint64_t v5 = FBSOpenApplicationOptionKeyActivateSuspended;
  id v6 = &__kCFBooleanFalse;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v4 = +[FBSSystemService sharedService];
  [v4 openApplication:kMFMobileMailBundleIdentifier options:v3 withResult:&stru_41A8];
}

@end