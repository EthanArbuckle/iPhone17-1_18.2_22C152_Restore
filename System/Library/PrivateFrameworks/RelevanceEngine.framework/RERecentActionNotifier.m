@interface RERecentActionNotifier
- (void)performedAction:(id)a3;
@end

@implementation RERecentActionNotifier

- (void)performedAction:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v13[0] = @"RERecentDonatedActionBundleIdentifierKey";
    id v3 = a3;
    v4 = [v3 donationIdentifier];
    v5 = [v4 dataSource];
    v14[0] = v5;
    v13[1] = @"RERecentDonatedActionIdentifierKey";
    v6 = NSNumber;
    v7 = [v3 actionTypeIdentifier];
    v8 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "re_actionIdentifierHashValue"));
    v14[1] = v8;
    v13[2] = @"RERecentDonatedActionDateKey";
    v9 = [v3 creationDate];

    v10 = v9;
    if (!v9)
    {
      v10 = [MEMORY[0x263EFF910] date];
    }
    v14[2] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    if (!v9) {

    }
    v12 = [MEMORY[0x263F087C8] defaultCenter];
    [v12 postNotificationName:@"RERecentDonatedActionWasPerformedNotification" object:0 userInfo:v11];
  }
}

@end