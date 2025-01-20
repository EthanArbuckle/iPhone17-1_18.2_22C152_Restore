@interface CUUserNotificationSession
+ (id)cad_sessionWithContent:(id)a3;
@end

@implementation CUUserNotificationSession

+ (id)cad_sessionWithContent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 bundleIdentifier];
  [v5 setBundleID:v6];

  v7 = [v4 categoryIdentifier];
  [v5 setCategoryID:v7];

  v8 = [v4 identifier];
  [v5 setIdentifier:v8];

  [v5 setFlags:[v4 flags]];
  v9 = [v4 iconSystemName];
  [v5 setIconSystemName:v9];

  v10 = [v4 iconName];
  [v5 setIconName:v10];

  v11 = [v4 titleKey];
  [v5 setTitleKey:v11];

  v12 = [v4 titleArguments];
  [v5 setTitleArguments:v12];

  v13 = [v4 bodyKey];
  [v5 setBodyKey:v13];

  v14 = [v4 bodyArguments];

  [v5 setBodyArguments:v14];

  return v5;
}

@end