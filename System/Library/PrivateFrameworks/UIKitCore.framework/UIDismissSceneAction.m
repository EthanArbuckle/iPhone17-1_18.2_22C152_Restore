@interface UIDismissSceneAction
- (UIDismissSceneAction)init;
- (int64_t)UIActionType;
@end

@implementation UIDismissSceneAction

- (UIDismissSceneAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIDismissSceneAction;
  return [(UIDismissSceneAction *)&v3 initWithInfo:0 timeout:0 forResponseOnQueue:0 withHandler:0.0];
}

- (int64_t)UIActionType
{
  return 44;
}

@end