@interface UITableViewCell(SensorKitUI)
+ (id)skui_tableViewCellForDataSample:()SensorKitUI;
+ (id)skui_tableViewCellForSelectionWithInitialValue:()SensorKitUI tableView:;
@end

@implementation UITableViewCell(SensorKitUI)

+ (id)skui_tableViewCellForDataSample:()SensorKitUI
{
  id v3 = (id)[a3 dequeueReusableCellWithIdentifier:@"SRAuthorizationExampleRowReuseIdentifier"];
  if (!v3) {
    id v3 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"SRAuthorizationExampleRowReuseIdentifier"];
  }
  objc_msgSend((id)objc_msgSend(v3, "textLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 8));
  [v3 setAccessoryType:1];
  return v3;
}

+ (id)skui_tableViewCellForSelectionWithInitialValue:()SensorKitUI tableView:
{
  id v5 = (id)[a4 dequeueReusableCellWithIdentifier:@"SRAuthorizationSelectionRowReuseIdentifier"];
  if (!v5)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"SRAuthorizationSelectionRowReuseIdentifier"];
    objc_msgSend((id)objc_msgSend(v5, "textLabel"), "setNumberOfLines:", 0);
    objc_msgSend((id)objc_msgSend(v5, "textLabel"), "setLineBreakMode:", 0);
  }
  if (a3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  objc_msgSend((id)objc_msgSend(v5, "textLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", v6));
  objc_msgSend((id)objc_msgSend(v5, "textLabel"), "setNumberOfLines:", 0);
  objc_msgSend((id)objc_msgSend(v5, "textLabel"), "setLineBreakMode:", 0);
  return v5;
}

@end