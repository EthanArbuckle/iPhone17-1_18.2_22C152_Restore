@interface COSShortcutController
+ (id)sharedController;
- (BOOL)issueActionForShortcut:(id)a3;
- (id)shortcutItems;
@end

@implementation COSShortcutController

- (id)shortcutItems
{
  v2 = +[NSMutableArray array];
  if (PBIsInternalInstall() && sub_100005E20())
  {
    v3 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"applewatch.radiowaves.left.and.right"];
    id v4 = [objc_alloc((Class)UIMutableApplicationShortcutItem) initWithType:@"com.apple.Bridge.InternalPingShortcut" localizedTitle:@"Ping Apple Watch [Internal-Only]" localizedSubtitle:0 icon:v3 userInfo:0];
    [v2 addObject:v4];
  }
  v13 = 0;
  int v5 = sub_10000A2A4(0, (const __CFString **)&v13);
  v6 = v13;
  if (v5)
  {
    v7 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"applewatch.side.right"];
    id v8 = objc_alloc((Class)UIMutableApplicationShortcutItem);
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"PAIR_A_WATCH" value:&stru_100249230 table:@"Localizable"];
    id v11 = [v8 initWithType:@"com.apple.Bridge.PairWatchShortcut" localizedTitle:v10 localizedSubtitle:0 icon:v7 userInfo:0];

    [v2 addObject:v11];
  }
  else
  {
    v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not offering pairing shortcut: %@", buf, 0xCu);
    }
  }

  return v2;
}

+ (id)sharedController
{
  if (qword_10029B218 != -1) {
    dispatch_once(&qword_10029B218, &stru_100246C68);
  }
  v2 = (void *)qword_10029B210;

  return v2;
}

- (BOOL)issueActionForShortcut:(id)a3
{
  v3 = [a3 type];
  if ([v3 isEqualToString:@"com.apple.Bridge.PairWatchShortcut"])
  {
    +[PBBridgeCAReporter incrementSuccessType:19];
    [UIApp presentNewPairingFlowIfPossible];
LABEL_6:
    BOOL v4 = 1;
    goto LABEL_10;
  }
  if (PBIsInternalInstall()
    && [v3 isEqualToString:@"com.apple.Bridge.InternalPingShortcut"])
  {
    [UIApp pingWatch];
    goto LABEL_6;
  }
  int v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unsupported Shortcut action! %@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v4 = 0;
LABEL_10:

  return v4;
}

@end