@interface _SBUIBiometricKitInterfaceOperationStateTracker
- (_SBUIBiometricKitInterfaceOperationStateTracker)init;
- (_SBUIBiometricKitInterfaceOperationStateTracker)initWithState:(int64_t)a3;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation _SBUIBiometricKitInterfaceOperationStateTracker

- (_SBUIBiometricKitInterfaceOperationStateTracker)init
{
  return [(_SBUIBiometricKitInterfaceOperationStateTracker *)self initWithState:0];
}

- (_SBUIBiometricKitInterfaceOperationStateTracker)initWithState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBUIBiometricKitInterfaceOperationStateTracker;
  result = [(_SBUIBiometricKitInterfaceOperationStateTracker *)&v5 init];
  if (result) {
    result->_state = a3;
  }
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end