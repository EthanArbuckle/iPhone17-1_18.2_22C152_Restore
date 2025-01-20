@interface TRDeviceSetupCancelAction
- (NSError)error;
- (TRDeviceSetupCancelAction)init;
- (TRDeviceSetupCancelAction)initWithError:(id)a3;
@end

@implementation TRDeviceSetupCancelAction

- (TRDeviceSetupCancelAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupCancelAction;
  return (TRDeviceSetupCancelAction *)[(TRDeviceSetupAction *)&v3 _initWithActionType:@"cancel" parameters:0];
}

- (TRDeviceSetupCancelAction)initWithError:(id)a3
{
  id v5 = a3;
  v6 = [(TRDeviceSetupCancelAction *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end