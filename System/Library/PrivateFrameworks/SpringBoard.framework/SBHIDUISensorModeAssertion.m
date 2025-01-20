@interface SBHIDUISensorModeAssertion
- (BOOL)pocketTouchesExpected;
- (BOOL)suspendProximitySensor;
- (NSString)description;
- (NSString)reason;
- (SBHIDUISensorModeController)sensorModeController;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)digitizerMode;
- (int64_t)displayState;
- (int64_t)source;
- (void)invalidate;
- (void)setDigitizerMode:(int64_t)a3;
- (void)setDisplayState:(int64_t)a3;
- (void)setPocketTouchesExpected:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setSensorModeController:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setSuspendProximitySensor:(BOOL)a3;
@end

@implementation SBHIDUISensorModeAssertion

- (void)invalidate
{
  p_sensorModeController = &self->_sensorModeController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sensorModeController);
  [WeakRetained _removeHIDUISensorModeAssertion:self];

  objc_storeWeak((id *)p_sensorModeController, 0);
}

- (NSString)description
{
  return (NSString *)[(SBHIDUISensorModeAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHIDUISensorModeAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHIDUISensorModeAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHIDUISensorModeAssertion *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendBool:self->_suspendProximitySensor withName:@"suspendProximitySensor"];
  id v6 = (id)[v4 appendBool:self->_pocketTouchesExpected withName:@"pocketTouchesExpected"];
  v7 = NSStringFromSBDisabledDigitizerMode(self->_digitizerMode);
  [v4 appendString:v7 withName:@"digitizerMode"];

  v8 = NSStringFromBKSHIDUISensorDisplayState();
  [v4 appendString:v8 withName:@"displayState"];

  v9 = SBSBacklightChangeSourceDescription(self->_source);
  [v4 appendString:v9 withName:@"source"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sensorModeController);
  id v11 = (id)[v4 appendPointer:WeakRetained withName:@"sensorModeController"];

  [v4 appendString:self->_reason withName:@"reason"];
  return v4;
}

- (SBHIDUISensorModeController)sensorModeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sensorModeController);
  return (SBHIDUISensorModeController *)WeakRetained;
}

- (void)setSensorModeController:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(int64_t)a3
{
  self->_displayState = a3;
}

- (int64_t)digitizerMode
{
  return self->_digitizerMode;
}

- (void)setDigitizerMode:(int64_t)a3
{
  self->_digitizerMode = a3;
}

- (BOOL)suspendProximitySensor
{
  return self->_suspendProximitySensor;
}

- (void)setSuspendProximitySensor:(BOOL)a3
{
  self->_suspendProximitySensor = a3;
}

- (BOOL)pocketTouchesExpected
{
  return self->_pocketTouchesExpected;
}

- (void)setPocketTouchesExpected:(BOOL)a3
{
  self->_pocketTouchesExpected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_sensorModeController);
}

@end