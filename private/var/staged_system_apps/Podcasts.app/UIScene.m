@interface UIScene
+ (id)isMainWindowSceneSessionKey;
@end

@implementation UIScene

+ (id)isMainWindowSceneSessionKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

@end