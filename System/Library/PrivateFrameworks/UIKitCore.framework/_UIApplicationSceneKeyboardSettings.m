@interface _UIApplicationSceneKeyboardSettings
+ (id)protocol;
+ (void)configureSetting:(id)a3;
@end

@implementation _UIApplicationSceneKeyboardSettings

+ (void)configureSetting:(id)a3
{
  id v3 = a3;
  if ([v3 matchesProperty:sel_hardwareKeyboardExclusivityIdentifier])
  {
    [v3 setPropagating:1];
    [v3 setNullPreserving:1];
  }
}

+ (id)protocol
{
  return &unk_1ED700630;
}

@end