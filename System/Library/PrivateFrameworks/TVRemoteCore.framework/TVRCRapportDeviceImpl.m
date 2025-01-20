@interface TVRCRapportDeviceImpl
+ (id)implWithDevice:(id)a3;
- (BOOL)isConnected;
- (BOOL)isPaired;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsTouchEvents;
- (NSString)description;
- (TVRCRPCompanionLinkClientWrapper)deviceWrapper;
- (TVRCRapportDeviceImpl)initWithDevice:(id)a3;
- (TVRCRapportRemoteTextInputKeyboardImpl)keyboardImpl;
- (TVRXKeyboardController)keyboardController;
- (_TVRCDeviceImplDelegate)delegate;
- (id)alternateIdentifiers;
- (id)identifier;
- (id)idsIdentifier;
- (id)model;
- (id)name;
- (id)nowPlayingInfo;
- (id)pairedRemoteInfo;
- (id)supportedButtons;
- (int64_t)connectionType;
- (int64_t)deviceAttentionState;
- (int64_t)linkType;
- (int64_t)siriRemoteFindingState;
- (unint64_t)pairingCapability;
- (unint64_t)priority;
- (void)_setupKeyboardController;
- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)connect;
- (void)connectedToDevice:(id)a3;
- (void)dealloc;
- (void)deviceEncounteredAuthenticationChallenge:(id)a3;
- (void)deviceSupportsFindMyRemote:(BOOL)a3;
- (void)deviceUpdateSiriRemoteFindingState;
- (void)deviceUpdatedAttentionState;
- (void)deviceUpdatedNowPlayingInfo:(id)a3;
- (void)deviceUpdatedPairedRemoteInfo:(id)a3;
- (void)deviceUpdatedSupportedButtons:(id)a3;
- (void)disconnect;
- (void)disconnectedFromDevice:(id)a3 error:(id)a4;
- (void)enableFindingSession:(BOOL)a3;
- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4;
- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)playItem:(id)a3 completion:(id)a4;
- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)sendButtonEvent:(id)a3;
- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5;
- (void)sendTouchEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceWrapper:(id)a3;
- (void)setKeyboardController:(id)a3;
- (void)setKeyboardImpl:(id)a3;
@end

@implementation TVRCRapportDeviceImpl

+ (id)implWithDevice:(id)a3
{
  id v3 = a3;
  v4 = [[TVRCRapportDeviceImpl alloc] initWithDevice:v3];

  return v4;
}

- (TVRCRapportDeviceImpl)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCRapportDeviceImpl;
  v6 = [(TVRCRapportDeviceImpl *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceWrapper, a3);
    [(TVRCRPCompanionLinkClientWrapper *)v7->_deviceWrapper setDelegate:v7];
    v7->_priority = 0;
    v8 = [[TVRXKeyboardController alloc] _init];
    keyboardController = v7->_keyboardController;
    v7->_keyboardController = v8;
  }
  return v7;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(TVRCRapportDeviceImpl *)self name];
  [v3 appendString:v4 withName:@"name"];

  id v5 = [v3 build];

  return (NSString *)v5;
}

- (BOOL)supportsDirectCaptionQueries
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper supportsDirectCaptionQueries];
}

- (BOOL)supportsFindMyRemote
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper supportsFindMyRemote];
}

- (BOOL)supportsTouchEvents
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper supportsTouchEvents];
}

- (id)name
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper name];
}

- (id)identifier
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper name];
}

- (id)idsIdentifier
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper idsIdentifier];
}

- (id)alternateIdentifiers
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper alternateIdentifiers];
}

- (id)model
{
  v2 = [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper model];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)supportedButtons
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper supportedButtons];
}

- (void)connect
{
}

- (void)disconnect
{
}

- (void)sendButtonEvent:(id)a3
{
  id v10 = a3;
  v4 = [v10 button];
  uint64_t v5 = [v4 buttonType];

  if ((unint64_t)(v5 - 17) <= 1)
  {
    v6 = [(TVRCRapportDeviceImpl *)self nowPlayingInfo];
    v7 = [v6 captionsEnabled];

    if (v7)
    {
      v8 = [NSNumber numberWithInt:v5 == 17];
      v9 = [(TVRCRapportDeviceImpl *)self nowPlayingInfo];
      [v9 setCaptionsEnabled:v8];
    }
  }
  [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper sendButtonEvent:v10];
}

- (void)sendTouchEvent:(id)a3
{
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
}

- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
}

- (void)playItem:(id)a3 completion:(id)a4
{
}

- (TVRXKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (unint64_t)pairingCapability
{
  return 0;
}

- (int64_t)connectionType
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper connectionType];
}

- (BOOL)isPaired
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper isPaired];
}

- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5
{
}

- (int64_t)deviceAttentionState
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper attentionState];
}

- (id)pairedRemoteInfo
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper pairedRemoteInfo];
}

- (id)nowPlayingInfo
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper nowPlayingInfo];
}

- (int64_t)siriRemoteFindingState
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper siriRemoteFindingSessionState];
}

- (int64_t)linkType
{
  return [(TVRCRPCompanionLinkClientWrapper *)self->_deviceWrapper linkType];
}

- (void)enableFindingSession:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TVRCRapportDeviceImpl *)self deviceWrapper];
  [v4 enableFindingSession:v3];
}

- (void)connectedToDevice:(id)a3
{
  self->_isConnected = 1;
  [(TVRCRapportDeviceImpl *)self _setupKeyboardController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didConnectWithDevice:self];
}

- (void)disconnectedFromDevice:(id)a3 error:(id)a4
{
  self->_isConnected = 0;
  uint64_t v5 = 4 * (a4 != 0);
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained device:self didDisconnectWithReason:v5 error:v7];
}

- (void)deviceEncounteredAuthenticationChallenge:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained device:self didEncounterAuthenticationChallenge:v5];
}

- (void)deviceUpdatedSupportedButtons:(id)a3
{
  id v6 = a3;
  if ([v6 connected])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [v6 supportedButtons];
    [WeakRetained device:self didUpdateSupportedButtons:v5];
  }
}

- (void)deviceUpdatedAttentionState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didUpdateAttentionStateWithDevice:self];
}

- (void)deviceUpdatedPairedRemoteInfo:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v6 = [v5 pairedRemoteInfo];

  [WeakRetained device:self didUpdatePairedRemoteInfo:v6];
}

- (void)deviceUpdatedNowPlayingInfo:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v6 = [v5 nowPlayingInfo];

  [WeakRetained device:self didUpdateNowPlayingInfo:v6];
}

- (void)deviceUpdateSiriRemoteFindingState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didUpdateSiriRemoteFindingStateWithDevice:self];
}

- (void)deviceSupportsFindMyRemote:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained device:self didUpdateFindMyRemoteSupported:v3];
}

- (void)_setupKeyboardController
{
  BOOL v3 = objc_alloc_init(TVRCRapportRemoteTextInputKeyboardImpl);
  keyboardImpl = self->_keyboardImpl;
  self->_keyboardImpl = v3;

  [(TVRCRapportRemoteTextInputKeyboardImpl *)self->_keyboardImpl setCompanionLinkWrapper:self->_deviceWrapper];
  keyboardController = self->_keyboardController;
  id v6 = self->_keyboardImpl;

  [(TVRXKeyboardController *)keyboardController _setKeyboardImpl:v6];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[TVRCRapportDeviceImpl dealloc]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)TVRCRapportDeviceImpl;
  [(TVRCRapportDeviceImpl *)&v4 dealloc];
}

- (unint64_t)priority
{
  return self->_priority;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (_TVRCDeviceImplDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TVRCDeviceImplDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRCRPCompanionLinkClientWrapper)deviceWrapper
{
  return self->_deviceWrapper;
}

- (void)setDeviceWrapper:(id)a3
{
}

- (void)setKeyboardController:(id)a3
{
}

- (TVRCRapportRemoteTextInputKeyboardImpl)keyboardImpl
{
  return self->_keyboardImpl;
}

- (void)setKeyboardImpl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardImpl, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_deviceWrapper, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end