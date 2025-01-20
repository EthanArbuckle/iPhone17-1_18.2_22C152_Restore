@interface UIQuickLookSceneConfigurationAction
+ (id)actionWithSceneConfiguration:(id)a3;
- (id)loadSceneConfiguration;
- (int64_t)UIActionType;
@end

@implementation UIQuickLookSceneConfigurationAction

+ (id)actionWithSceneConfiguration:(id)a3
{
  id v5 = a3;
  v6 = [v5 role];
  char v7 = [v6 isEqualToString:@"UISceneSessionRoleQuickLook"];

  if ((v7 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [v5 role];
    [v12 handleFailureInMethod:a2, a1, @"UIQuickLookSceneConfigurationAction.m", 19, @"UIInternalSceneConfigurationAction should only be used to configure scenes with the role UISceneSessionRoleQuickLook. Provided Role: %@", v13 object file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  [v8 setObject:v9 forSetting:1];
  v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v8 responder:0];

  return v10;
}

- (id)loadSceneConfiguration
{
  v2 = [(UIQuickLookSceneConfigurationAction *)self info];
  v3 = [v2 objectForSetting:1];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)UIActionType
{
  return 42;
}

@end