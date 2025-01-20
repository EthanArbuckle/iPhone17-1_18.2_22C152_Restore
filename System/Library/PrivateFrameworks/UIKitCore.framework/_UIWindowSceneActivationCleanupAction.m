@interface _UIWindowSceneActivationCleanupAction
+ (id)actionWithInteractionIdentifier:(id)a3 responseHandler:(id)a4;
- (NSString)interactionIdentifier;
- (int64_t)UIActionType;
@end

@implementation _UIWindowSceneActivationCleanupAction

+ (id)actionWithInteractionIdentifier:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setObject:v7 forSetting:1];

  id v9 = objc_alloc((Class)a1);
  v10 = [MEMORY[0x1E4F4F670] responderWithHandler:v6];

  v11 = (void *)[v9 initWithInfo:v8 responder:v10];
  return v11;
}

- (NSString)interactionIdentifier
{
  v2 = [(_UIWindowSceneActivationCleanupAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

- (int64_t)UIActionType
{
  return 41;
}

@end