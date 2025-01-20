@interface NSUserDefaults
- (void)wf_loadValuesFromCloudKitWithCompletion:(id)a3;
@end

@implementation NSUserDefaults

- (void)wf_loadValuesFromCloudKitWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[CKContainer wf_shortcutsContainer];
  id v6 = objc_alloc((Class)WFCloudKitItemRequest);
  v7 = [v5 publicCloudDatabase];
  id v8 = [v6 initWithContainer:v5 database:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000087FC;
  v11[3] = &unk_1000E80D0;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  id v10 = [v8 fetchConfigurationAssetWithType:@"com.apple.shortcuts.defaults" completionHandler:v11];
}

@end