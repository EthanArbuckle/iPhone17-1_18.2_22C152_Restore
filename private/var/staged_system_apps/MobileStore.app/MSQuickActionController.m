@interface MSQuickActionController
+ (id)sharedInstance;
+ (void)processShortcutItem:(id)a3 applicationController:(id)a4 completionHandler:(id)a5;
+ (void)updateShortcutItems;
- (MSQuickActionController)init;
- (id)_shortcutItems;
- (void)_accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)processShortcutItem:(id)a3 applicationController:(id)a4 completionHandler:(id)a5;
@end

@implementation MSQuickActionController

- (MSQuickActionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSQuickActionController;
  v2 = [(MSQuickActionController *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = SSAccountStoreChangedNotification;
    v5 = +[SSAccountStore defaultStore];
    [v3 addObserver:v2 selector:"_accountStoreDidChange:" name:v4 object:v5];
  }
  return v2;
}

+ (void)updateShortcutItems
{
  v2 = [(id)objc_opt_class() sharedInstance];
  id v4 = [v2 _shortcutItems];

  v3 = +[UIApplication sharedApplication];
  [v3 setShortcutItems:v4];
}

- (id)_shortcutItems
{
  v2 = +[NSMutableArray array];
  uint64_t v3 = +[UIApplicationShortcutIcon iconWithType:5];
  id v4 = objc_alloc((Class)UIApplicationShortcutItem);
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"QUICK_ACTION_SEARCH" value:&stru_1000107F8 table:0];
  v27 = (void *)v3;
  id v7 = [v4 initWithType:@"com.apple.MobileStore.search" localizedTitle:v6 localizedSubtitle:0 icon:v3 userInfo:0];

  [v2 addObject:v7];
  v8 = +[SSAccountStore defaultStore];
  v9 = [v8 activeAccount];

  if (([v9 isManagedAppleID] & 1) == 0)
  {
    v10 = +[UIApplicationShortcutIcon iconWithTemplateImageName:@"RedeemMusicCodeQuickAction"];
    id v11 = objc_alloc((Class)UIApplicationShortcutItem);
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"QUICK_ACTION_REDEEM" value:&stru_1000107F8 table:0];
    id v14 = [v11 initWithType:@"com.apple.MobileStore.redeem" localizedTitle:v13 localizedSubtitle:0 icon:v10 userInfo:0];

    [v2 addObject:v14];
  }
  v15 = +[UIApplicationShortcutIcon iconWithType:28];
  id v16 = objc_alloc((Class)UIApplicationShortcutItem);
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"QUICK_ACTION_VIEW_DOWNLOADS" value:&stru_1000107F8 table:0];
  id v19 = [v16 initWithType:@"com.apple.MobileStore.viewdownloads" localizedTitle:v18 localizedSubtitle:0 icon:v15 userInfo:0];

  [v2 addObject:v19];
  v20 = +[UIApplicationShortcutIcon iconWithTemplateImageName:@"QuickActionPurchased"];
  id v21 = objc_alloc((Class)UIApplicationShortcutItem);
  v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"QUICK_ACTION_PURCHASED" value:&stru_1000107F8 table:0];
  id v24 = [v21 initWithType:@"com.apple.MobileStore.purchased" localizedTitle:v23 localizedSubtitle:0 icon:v20 userInfo:0];

  [v2 addObject:v24];
  id v25 = [v2 copy];

  return v25;
}

+ (id)sharedInstance
{
  if (qword_100015E10 != -1) {
    dispatch_once(&qword_100015E10, &stru_100010448);
  }
  v2 = (void *)qword_100015E08;

  return v2;
}

+ (void)processShortcutItem:(id)a3 applicationController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() sharedInstance];
  [v10 processShortcutItem:v9 applicationController:v8 completionHandler:v7];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = SSAccountStoreChangedNotification;
  v5 = +[SSAccountStore defaultStore];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)MSQuickActionController;
  [(MSQuickActionController *)&v6 dealloc];
}

- (void)processShortcutItem:(id)a3 applicationController:(id)a4 completionHandler:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006C8C;
  block[3] = &unk_1000104E8;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_accountStoreDidChange:(id)a3
{
  uint64_t v3 = objc_opt_class();

  [v3 updateShortcutItems];
}

@end