@interface SAHASceneAction
+ (id)sceneAction;
- (NSURL)entityId;
- (SAHAAction)action;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setEntityId:(id)a3;
@end

@implementation SAHASceneAction

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"SceneAction";
}

+ (id)sceneAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAHAAction)action
{
  return (SAHAAction *)AceObjectAceObjectForProperty(self, @"action");
}

- (void)setAction:(id)a3
{
}

- (NSURL)entityId
{
  return (NSURL *)AceObjectURLForProperty(self, @"entityId");
}

- (void)setEntityId:(id)a3
{
}

@end