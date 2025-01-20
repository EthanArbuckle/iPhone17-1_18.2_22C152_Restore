@interface COSSampleApplicationListController
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)awesomeFeatureEnabled:(id)a3;
- (id)linkListSelection:(id)a3;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (void)setAwesomeFeatureEnabled:(id)a3 specifier:(id)a4;
- (void)setLinkListSelection:(id)a3 specifier:(id)a4;
@end

@implementation COSSampleApplicationListController

- (id)applicationBundleIdentifier
{
  return @"com.apple.foo-app";
}

- (id)applicationGroupSpecifiers
{
  v3 = +[NSMutableArray array];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Settings My Subclass Adds..." value:&stru_100249230 table:@"Localizable"];
  v28 = +[PSSpecifier groupSpecifierWithName:v5];

  [v3 addObject:v28];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Feature" value:&stru_100249230 table:@"Localizable"];
  v27 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setAwesomeFeatureEnabled:specifier:" get:"awesomeFeatureEnabled:" detail:0 cell:6 edit:0];

  v25 = v3;
  [v3 addObject:v27];
  v26 = +[PSSpecifier emptyGroupSpecifier];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Link lists are a commons Settings UI convention" value:&stru_100249230 table:@"Localizable"];
  [v26 setProperty:v9 forKey:PSFooterTextGroupKey];

  [v3 addObject:v26];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Japan" value:&stru_100249230 table:@"Localizable"];
  v24 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setLinkListSelection:specifier:" get:"linkListSelection:" detail:objc_opt_class() cell:2 edit:0];

  v23 = +[NSBundle mainBundle];
  v12 = [v23 localizedStringForKey:@"Hokkaido" value:&stru_100249230 table:@"Localizable"];
  v29[0] = v12;
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Honshu" value:&stru_100249230 table:@"Localizable"];
  v29[1] = v14;
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"Shikoku" value:&stru_100249230 table:@"Localizable"];
  v29[2] = v16;
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Kyushu" value:&stru_100249230 table:@"Localizable"];
  v29[3] = v18;
  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"Okinawa" value:&stru_100249230 table:@"Localizable"];
  v29[4] = v20;
  v21 = +[NSArray arrayWithObjects:v29 count:5];

  [v24 setValues:&off_10025BC68 titles:v21];
  [v25 addObject:v24];

  return v25;
}

- (id)localizedMirroringDetailFooter
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"• Defaults Favorites List\n• Display Order: Default\n• Alerts: Yes" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)setAwesomeFeatureEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"MyAwesomeFeatureKey", a3, @"com.apple.nano-sample-app");
  CFPreferencesAppSynchronize(@"com.apple.nano-sample-app");
  id v6 = +[UIAlertController alertControllerWithTitle:@"Bridge called your method!" message:&stru_100249230 preferredStyle:1];
  v5 = +[UIAlertAction actionWithTitle:@"Okay" style:1 handler:0];
  [v6 addAction:v5];

  [(COSSampleApplicationListController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)awesomeFeatureEnabled:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue(@"MyAwesomeFeatureKey", @"com.apple.nano-sample-app");

  return v3;
}

- (void)setLinkListSelection:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"MyLinkListKey", a3, @"com.apple.nano-sample-app");

  CFPreferencesAppSynchronize(@"com.apple.nano-sample-app");
}

- (id)linkListSelection:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue(@"MyLinkListKey", @"com.apple.nano-sample-app");
  if (!v3)
  {
    v3 = +[NSNumber numberWithUnsignedInteger:1];
  }

  return v3;
}

- (id)localizedPaneTitle
{
  return @"Great Test App";
}

@end