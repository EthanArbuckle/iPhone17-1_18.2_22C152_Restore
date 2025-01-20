@interface COSTinkerWiFiPickerOptinViewContoller
+ (BOOL)controllerNeedsToRun;
- (COSTinkerWiFiPickerOptinViewContoller)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)okayButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)okayButtonPressed:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSTinkerWiFiPickerOptinViewContoller

+ (BOOL)controllerNeedsToRun
{
  v2 = [UIApp bridgeController];
  v3 = [v2 currentWiFiNetworkName];

  return v3 != 0;
}

- (COSTinkerWiFiPickerOptinViewContoller)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerWiFiPickerOptinViewContoller;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSTinkerWiFiPickerOptinViewContoller *)v2 setStyle:74];
  }
  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = SFLocalizableWAPIStringKeyForKey();
  v4 = [v2 localizedStringForKey:v3 value:&stru_100249230 table:@"Localizable-tinker"];
  objc_super v5 = [UIApp setupController];
  v6 = [v5 tinkerUserName];
  v7 = [v6 localizedCapitalizedString];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v7);

  return v8;
}

- (id)detailString
{
  id v2 = UIApp;
  v3 = [v2 bridgeController];
  v4 = [v3 currentWiFiNetworkName];

  objc_super v5 = [v2 setupController];

  v6 = [v5 tinkerUserName];
  v7 = [v6 localizedCapitalizedString];

  v8 = +[NSBundle mainBundle];
  v9 = SFLocalizableWAPIStringKeyForKey();
  v10 = [v8 localizedStringForKey:v9 value:&stru_100249230 table:@"Localizable-tinker"];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v4, v7, v7);

  return v11;
}

- (id)imageResource
{
  return sub_1000328FC(@"Screen-WiFi");
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = +[UIApplication sharedApplication];
  objc_super v5 = [v4 bridgeController];
  [v5 sendAllTinkerWirelessCredentials:0];

  id v6 = [(COSTinkerWiFiPickerOptinViewContoller *)self delegate];
  [v6 buddyControllerDone:self];
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(COSTinkerWiFiPickerOptinViewContoller *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)okayButtonPressed:(id)a3
{
  id v4 = [(COSTinkerWiFiPickerOptinViewContoller *)self delegate];
  [v4 buddyControllerDone:self];
}

- (id)suggestedButtonTitle
{
  id v2 = [UIApp bridgeController];
  v3 = [v2 currentWiFiNetworkName];

  if ([v3 length])
  {
    id v4 = +[NSBundle mainBundle];
    objc_super v5 = [v4 localizedStringForKey:@"WIFI_TINKER_NAMED_%@" value:&stru_100249230 table:@"Localizable-tinker"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    objc_super v5 = SFLocalizableWAPIStringKeyForKey();
    [v4 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable-tinker"];
  id v6 = };

  return v6;
}

- (id)okayButtonTitle
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"WIFI_TINKER_SHARE_SKIP" value:&stru_100249230 table:@"Localizable-tinker"];

  return v3;
}

@end