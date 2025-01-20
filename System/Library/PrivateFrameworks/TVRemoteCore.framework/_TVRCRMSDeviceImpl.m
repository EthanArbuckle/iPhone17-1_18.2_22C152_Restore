@interface _TVRCRMSDeviceImpl
+ (id)implWithDevice:(id)a3;
- (BOOL)isPaired;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsTouchEvents;
- (_TVRCDeviceImplDelegate)delegate;
- (_TVRCRMSDeviceImpl)initWithDevice:(id)a3;
- (_TVRCRMSDeviceWrapper)deviceWrapper;
- (id)alternateIdentifiers;
- (id)identifier;
- (id)keyboardController;
- (id)model;
- (id)name;
- (id)supportedButtons;
- (int64_t)connectionType;
- (unint64_t)pairingCapability;
- (unint64_t)priority;
- (void)connect;
- (void)connectedToDevice:(id)a3;
- (void)deviceEncounteredAuthenticationChallenge:(id)a3;
- (void)deviceUpdatedSupportedButtons:(id)a3;
- (void)disconnect;
- (void)disconnectedFromDevice:(id)a3 error:(id)a4;
- (void)sendButtonEvent:(id)a3;
- (void)sendTouchEvent:(id)a3;
- (void)setAuthenticationSupported:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceWrapper:(id)a3;
@end

@implementation _TVRCRMSDeviceImpl

+ (id)implWithDevice:(id)a3
{
  id v3 = a3;
  v4 = [[_TVRCRMSDeviceImpl alloc] initWithDevice:v3];

  return v4;
}

- (_TVRCRMSDeviceImpl)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVRCRMSDeviceImpl;
  v6 = [(_TVRCRMSDeviceImpl *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceWrapper, a3);
    [(_TVRCRMSDeviceWrapper *)v7->_deviceWrapper setDelegate:v7];
    v7->_priority = 2;
  }

  return v7;
}

- (BOOL)supportsTouchEvents
{
  return [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper supportsTouchEvents];
}

- (id)name
{
  return [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper name];
}

- (id)identifier
{
  v2 = [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper identifier];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)alternateIdentifiers
{
  return [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper alternateIdentifiers];
}

- (id)model
{
  v2 = [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper model];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)supportedButtons
{
  return [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper supportedButtons];
}

- (void)setAuthenticationSupported:(BOOL)a3
{
}

- (void)connect
{
}

- (void)disconnect
{
}

- (void)sendButtonEvent:(id)a3
{
}

- (void)sendTouchEvent:(id)a3
{
}

- (id)keyboardController
{
  return [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper keyboardController];
}

- (unint64_t)pairingCapability
{
  return 0;
}

- (int64_t)connectionType
{
  return [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper connectionType];
}

- (BOOL)isPaired
{
  return [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper isPaired];
}

- (BOOL)supportsDirectCaptionQueries
{
  return 0;
}

- (BOOL)supportsFindMyRemote
{
  return 0;
}

- (void)connectedToDevice:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didConnectWithDevice:self];
}

- (void)disconnectedFromDevice:(id)a3 error:(id)a4
{
  uint64_t v5 = 4 * (a4 != 0);
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained device:self didDisconnectWithReason:v5 error:v7];
}

- (void)deviceUpdatedSupportedButtons:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [(_TVRCRMSDeviceWrapper *)self->_deviceWrapper supportedButtons];
  [WeakRetained device:self didUpdateSupportedButtons:v4];
}

- (void)deviceEncounteredAuthenticationChallenge:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained device:self didEncounterAuthenticationChallenge:v5];
}

- (unint64_t)priority
{
  return self->_priority;
}

- (_TVRCDeviceImplDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TVRCDeviceImplDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TVRCRMSDeviceWrapper)deviceWrapper
{
  return self->_deviceWrapper;
}

- (void)setDeviceWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceWrapper, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end