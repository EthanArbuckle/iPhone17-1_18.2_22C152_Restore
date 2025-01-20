@interface MapsPushdDebugController
+ (id)navigationDestinationTitle;
+ (void)performAfterDelay:(double)a3 action:(id)a4;
- (void)prepareContent;
@end

@implementation MapsPushdDebugController

+ (id)navigationDestinationTitle
{
  return @"MapsPushd";
}

+ (void)performAfterDelay:(double)a3 action:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v6 = +[UIApplication sharedApplication];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008C59A0;
  v13[3] = &unk_1012E9390;
  v13[4] = &v14;
  id v7 = [v6 beginBackgroundTaskWithExpirationHandler:v13];

  v15[3] = (uint64_t)v7;
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008C5A0C;
  block[3] = &unk_1012E79E8;
  id v11 = v5;
  v12 = &v14;
  id v9 = v5;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v14, 8);
}

- (void)prepareContent
{
  v3 = +[NSString stringWithFormat:@"Notifications (%.0fs delay)", 0x4014000000000000];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1008C5C40;
  v15[3] = &unk_1012FF858;
  v15[4] = 0x4014000000000000;
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:v3 content:v15];

  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Announcements" content:&stru_1012FF878];
  id v6 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Airport Arrival Notification" content:&stru_1012FF8D8];
  id v7 = objc_alloc((Class)NSFileManager);
  dispatch_time_t v8 = [v7 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];

  id v9 = [v8 URLByAppendingPathComponent:@"Library/Caches/Announcements.pbd"];

  v10 = [v9 path];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008C6120;
  v13[3] = &unk_1012EE018;
  id v14 = v9;
  id v11 = v9;
  id v12 = [(MapsDebugValuesViewController *)self addSectionWithTitle:v10 content:v13];
}

@end