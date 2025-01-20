@interface SoftwareUpdateUsageDetailController
- (id)specifiers;
- (void)confirmDeletion;
- (void)deleteSoftwareUpdate;
- (void)loadView;
@end

@implementation SoftwareUpdateUsageDetailController

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)SoftwareUpdateUsageDetailController;
  [(SoftwareUpdateUsageDetailController *)&v15 loadView];
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v4 = [*(id *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSUsageBundleAppKey];
  v5 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"UPDATE_SIZE" value:&stru_4298 table:@"SoftwareUpdateUsageBundle"];
  [v5 setProperty:v7 forKey:kUsageDetailHeaderSizeTitleKey];

  v8 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
  [v4 totalSize];
  v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v8 setProperty:v9 forKey:kUsageDetailHeaderSizeValueKey];

  id v10 = objc_alloc((Class)ICQUsageDetailHeader);
  +[ICQUsageDetailHeader usageDetailHeaderHeight];
  id v12 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, 0.0, v11);
  [v12 setLabelTextAndIconWithSpecifier:*(void *)&self->PSUsageBundleDetailController_opaque[v3]];
  v13 = [*(id *)&self->PSUsageBundleDetailController_opaque[v3] name];
  [v12 setName:v13];

  v14 = [(SoftwareUpdateUsageDetailController *)self table];
  [v14 setTableHeaderView:v12];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[PSSpecifier emptyGroupSpecifier];
    [v5 setIdentifier:@"SU_USAGE_GROUP"];
    v6 = [*(id *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSUsageBundleAppKey];
    if (([v6 isDeletionRestricted] & 1) == 0)
    {
      [v4 addObject:v5];
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"DELETE_UPDATE_BUTTON" value:&stru_4298 table:@"SoftwareUpdateUsageBundle"];
      v9 = +[PSSpecifier deleteButtonSpecifierWithName:v8 target:self action:"confirmDeletion"];
      [v4 addObject:v9];
    }
    id v10 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
    *(void *)&self->PSUsageBundleDetailController_opaque[v3] = v4;
  }
  double v11 = [(SoftwareUpdateUsageDetailController *)self navigationItem];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_4298 table:@"SoftwareUpdateUsageBundle"];
  [v11 setTitle:v13];

  v14 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];

  return v14;
}

- (void)confirmDeletion
{
  id v15 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v13 localizedStringForKey:@"DELETE_UPDATE_CONFIRMATION_TITLE" value:&stru_4298 table:@"SoftwareUpdateUsageBundle"];
  uint64_t v11 = PSConfirmationTitleKey;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"DELETE_UPDATE_CONFIRMATION_DESCRIPTION" value:&stru_4298 table:@"SoftwareUpdateUsageBundle"];
  uint64_t v4 = PSConfirmationPromptKey;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"DELETE_UPDATE_CONFIRMATION_BUTTON" value:&stru_4298 table:@"SoftwareUpdateUsageBundle"];
  uint64_t v7 = PSConfirmationOKKey;
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_4298 table:@"SoftwareUpdateUsageBundle"];
  id v10 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, v11, v3, v4, v6, v7, v9, PSConfirmationCancelKey, 0);
  [v15 setupWithDictionary:v10];

  [v15 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v15 setTarget:self];
  [v15 setConfirmationAction:"deleteSoftwareUpdate"];
  [(SoftwareUpdateUsageDetailController *)self showConfirmationViewForSpecifier:v15];
}

- (void)deleteSoftwareUpdate
{
  uint64_t v3 = [(SoftwareUpdateUsageDetailController *)self view];
  [v3 setUserInteractionEnabled:0];

  uint64_t v4 = +[PSNavBarSpinnerManager sharedSpinnerManager];
  v5 = [(SoftwareUpdateUsageDetailController *)self navigationItem];
  [v4 startAnimatingInNavItem:v5 forIdentifier:@"softwareUpdateDeletion"];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_24C4;
  id v12 = sub_24D4;
  id v13 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0];
  v6 = (void *)v9[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24DC;
  v7[3] = &unk_4230;
  v7[4] = self;
  v7[5] = &v8;
  [v6 purgeDownload:v7];
  _Block_object_dispose(&v8, 8);
}

@end