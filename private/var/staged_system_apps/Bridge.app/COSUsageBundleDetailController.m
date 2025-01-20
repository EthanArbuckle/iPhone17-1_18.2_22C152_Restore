@interface COSUsageBundleDetailController
- (NSSManager)nssManager;
- (id)appBundle;
- (id)appSize:(id)a3;
- (id)docsAndData:(id)a3;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (void)confirmDeletion;
- (void)delete;
- (void)setNssManager:(id)a3;
@end

@implementation COSUsageBundleDetailController

- (id)appBundle
{
  v2 = [(COSUsageBundleDetailController *)self specifier];
  v3 = [v2 userInfo];

  return v3;
}

- (id)appSize:(id)a3
{
  v3 = [(COSUsageBundleDetailController *)self appBundle];
  v4 = [v3 size];
  *(float *)&double v5 = (float)(uint64_t)[v4 fixed];
  v6 = +[COSUsageController prettyUsageString:v5];

  return v6;
}

- (id)docsAndData:(id)a3
{
  v3 = [(COSUsageBundleDetailController *)self appBundle];
  v4 = [v3 size];
  *(float *)&double v5 = (float)(uint64_t)[v4 docsAndData];
  v6 = +[COSUsageController prettyUsageString:v5];

  return v6;
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(COSUsageBundleDetailController *)self appBundle];
  double v5 = +[COSUsageBundleHeaderTableCell specifierForAppBundle:v4];
  [v3 addObject:v5];
  v6 = [v4 size];
  uint64_t v7 = (uint64_t)[v6 fixed];

  if (v7 >= 1)
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"APP_SIZE" value:&stru_100249230 table:@"Usage"];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"appSize:" detail:0 cell:4 edit:0];

    [v3 addObject:v10];
  }
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"DOCS_AND_DATA" value:&stru_100249230 table:@"Usage"];
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"docsAndData:" detail:0 cell:4 edit:0];

  [v3 addObject:v13];
  v14 = [v4 bundleIdentifier];
  LODWORD(v12) = [v14 isEqualToString:@"com.apple.NanoSettings"];

  if (v12)
  {
    v15 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v15];

    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"DELETE_BUTTON" value:&stru_100249230 table:@"Usage"];
    v18 = +[PSSpecifier deleteButtonSpecifierWithName:v17 target:self action:"confirmDeletion"];

    [v3 addObject:v18];
  }
  uint64_t v19 = OBJC_IVAR___PSListController__specifiers;
  v20 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v21 = v3;

  v22 = [(COSUsageBundleDetailController *)self navigationItem];
  v23 = [v4 name];
  [v22 setTitle:v23];

  id v24 = *(id *)&self->BPSListController_opaque[v19];
  return v24;
}

- (id)valueForSpecifier:(id)a3
{
  return [a3 propertyForKey:PSValueKey];
}

- (void)confirmDeletion
{
  id v3 = [(COSUsageBundleDetailController *)self appBundle];
  v4 = [v3 bundleIdentifier];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.NanoSettings"];

  if (!v5) {
    abort();
  }
  v6 = +[NSBundle mainBundle];
  v17 = [v6 localizedStringForKey:@"DELETE_UPDATE_CONFIRMATION_DESCRIPTION" value:&stru_100249230 table:@"Usage"];

  [v3 name];
  uint64_t v7 = v18 = v3;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v7);

  id v9 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v19[0] = PSConfirmationTitleKey;
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"DELETE_CONFIRMATION_TITLE" value:&stru_100249230 table:@"Usage"];
  v20[0] = v11;
  v20[1] = v8;
  v19[1] = PSConfirmationPromptKey;
  v19[2] = PSConfirmationOKKey;
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"DELETE_CONFIRMATION_BUTTON" value:&stru_100249230 table:@"Usage"];
  v20[2] = v13;
  v19[3] = PSConfirmationCancelKey;
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Usage"];
  v20[3] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  [v9 setupWithDictionary:v16];

  [v9 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v9 setTarget:self];
  [v9 setConfirmationAction:"delete"];
  [(COSUsageBundleDetailController *)self showConfirmationViewForSpecifier:v9];
}

- (void)delete
{
  id v3 = [(COSUsageBundleDetailController *)self appBundle];
  v4 = [(COSUsageBundleDetailController *)self specifier];
  unsigned int v5 = [v4 target];

  v6 = [(COSUsageBundleDetailController *)self view];
  uint64_t v7 = [v6 window];
  [v7 setUserInteractionEnabled:0];

  v8 = +[PSNavBarSpinnerManager sharedSpinnerManager];
  id v9 = [(COSUsageBundleDetailController *)self navigationItem];
  [v8 startAnimatingInNavItem:v9 forIdentifier:@"softwareUpdateDeletion"];

  v10 = sub_10000DCF4();
  v11 = [v5 nssManager];
  v12 = [v3 bundleIdentifier];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A2F04;
  v16[3] = &unk_100245C70;
  v16[4] = self;
  id v17 = v3;
  id v18 = v10;
  id v19 = v5;
  id v13 = v5;
  id v14 = v10;
  id v15 = v3;
  [v11 purgeUsageBundleWithId:v12 completionHandler:v16];
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end