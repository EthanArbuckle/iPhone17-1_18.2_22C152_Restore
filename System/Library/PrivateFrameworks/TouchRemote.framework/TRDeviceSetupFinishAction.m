@interface TRDeviceSetupFinishAction
- (TRDeviceSetupFinishAction)init;
@end

@implementation TRDeviceSetupFinishAction

- (TRDeviceSetupFinishAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupFinishAction;
  return (TRDeviceSetupFinishAction *)[(TRDeviceSetupAction *)&v3 _initWithActionType:@"finish" parameters:0];
}

@end