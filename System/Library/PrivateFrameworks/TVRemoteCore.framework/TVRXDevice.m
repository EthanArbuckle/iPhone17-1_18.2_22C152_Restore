@interface TVRXDevice
- (BOOL)_authenticationIsSupported;
- (BOOL)containsIdentifier:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTVRXDevice:(id)a3;
- (BOOL)paired;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsTouchEvents;
- (NSDictionary)alternateIdentifiers;
- (NSMutableSet)deviceImplSet;
- (NSSet)supportedButtons;
- (NSString)conciseDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)idsIdentifier;
- (NSString)model;
- (NSString)name;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRCSiriRemoteInfo)pairedRemoteInfo;
- (TVRXKeyboardController)keyboardController;
- (_TVRCDeviceImpl)_impl;
- (_TVRXDeviceDelegate)delegate;
- (id)_init;
- (id)allIdentifiers;
- (id)preferredImpl;
- (id)stateDictionary;
- (int64_t)attentionState;
- (int64_t)classification;
- (int64_t)connectionState;
- (int64_t)connectionType;
- (int64_t)linkType;
- (int64_t)siriRemoteFindingState;
- (unint64_t)hash;
- (unint64_t)pairingCapability;
- (void)_connectionAttemptSucceeded;
- (void)_deviceUpdateAttentionState;
- (void)_deviceUpdateSiriRemoteFindingState;
- (void)_disconnected:(int64_t)a3 error:(id)a4;
- (void)_enableFindingSession:(BOOL)a3;
- (void)_encounteredAuthenticationChallenge:(id)a3;
- (void)_reevaluate;
- (void)_setActiveEndpoint;
- (void)_setDeviceName:(id)a3;
- (void)_setDeviceSupportsFindMyRemote:(BOOL)a3;
- (void)_setIdentifier:(id)a3 alternateIdentifiers:(id)a4 name:(id)a5 model:(id)a6 supportedButtons:(id)a7;
- (void)_setImpl:(id)a3;
- (void)_setNowPlayingInfo:(id)a3;
- (void)_setPairedRemoteInfo:(id)a3;
- (void)_setSupportedButtons:(id)a3;
- (void)addDeviceImpl:(id)a3;
- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)device:(id)a3 didDisconnectWithReason:(int64_t)a4 error:(id)a5;
- (void)device:(id)a3 didEncounterAuthenticationChallenge:(id)a4;
- (void)device:(id)a3 didUpdateFindMyRemoteSupported:(BOOL)a4;
- (void)device:(id)a3 didUpdateName:(id)a4;
- (void)device:(id)a3 didUpdateNowPlayingInfo:(id)a4;
- (void)device:(id)a3 didUpdatePairedRemoteInfo:(id)a4;
- (void)device:(id)a3 didUpdateSupportedButtons:(id)a4;
- (void)disconnect;
- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4;
- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)playItem:(id)a3 completion:(id)a4;
- (void)removeDeviceImpl:(id)a3;
- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)sendButtonEvent:(id)a3;
- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5;
- (void)sendGameControllerEvent:(id)a3;
- (void)sendTouchEvent:(id)a3;
- (void)setAlternateIdentifiers:(id)a3;
- (void)setClassification:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceImplSet:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setSupportedButtons:(id)a3;
@end

@implementation TVRXDevice

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)TVRXDevice;
  v2 = [(TVRXDevice *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    deviceImplSet = v2->_deviceImplSet;
    v2->_deviceImplSet = v3;
  }
  return v2;
}

- (BOOL)isEmpty
{
  return [(NSMutableSet *)self->_deviceImplSet count] == 0;
}

- (void)addDeviceImpl:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[TVRXDevice addDeviceImpl:]";
    __int16 v8 = 2112;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s impl:%@ %@", (uint8_t *)&v6, 0x20u);
  }

  [(NSMutableSet *)self->_deviceImplSet addObject:v4];
  [(TVRXDevice *)self _reevaluate];
}

- (void)removeDeviceImpl:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[TVRXDevice removeDeviceImpl:]";
    __int16 v8 = 2112;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s impl:%@ %@", (uint8_t *)&v6, 0x20u);
  }

  [(NSMutableSet *)self->_deviceImplSet removeObject:v4];
  [(TVRXDevice *)self _reevaluate];
}

- (id)preferredImpl
{
  v16[1] = *MEMORY[0x263EF8340];
  deviceImplSet = self->_deviceImplSet;
  id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"priority" ascending:1];
  v16[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  int v6 = [(NSMutableSet *)deviceImplSet sortedArrayUsingDescriptors:v5];

  v7 = _TVRCGeneralLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "-[TVRXDevice preferredImpl]";
    __int16 v12 = 2112;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "%s sortedImpls:%@ %@", (uint8_t *)&v10, 0x20u);
  }

  __int16 v8 = [v6 firstObject];

  return v8;
}

- (void)_reevaluate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[TVRXDevice _reevaluate]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [(TVRXDevice *)self _impl];

  if (!v4)
  {
    v5 = [(TVRXDevice *)self preferredImpl];
    [(TVRXDevice *)self _setImpl:v5];
  }
}

- (void)sendButtonEvent:(id)a3
{
  id v7 = a3;
  id v4 = [v7 button];
  int v5 = [v4 isEnabled];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
    [WeakRetained sendButtonEvent:v7];
  }
}

- (void)sendTouchEvent:(id)a3
{
  p_impl = &self->_impl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  [WeakRetained sendTouchEvent:v4];
}

- (void)sendGameControllerEvent:(id)a3
{
  p_impl = &self->_impl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  [WeakRetained sendGameControllerEvent:v4];
}

- (TVRXKeyboardController)keyboardController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  v3 = [WeakRetained keyboardController];

  return (TVRXKeyboardController *)v3;
}

- (unint64_t)pairingCapability
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  unint64_t v3 = [WeakRetained pairingCapability];

  return v3;
}

- (BOOL)supportsDirectCaptionQueries
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v3 = [WeakRetained supportsDirectCaptionQueries];

  return v3;
}

- (BOOL)supportsFindMyRemote
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v3 = [WeakRetained supportsFindMyRemote];

  return v3;
}

- (BOOL)supportsTouchEvents
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v3 = [WeakRetained supportsTouchEvents];

  return v3;
}

- (BOOL)paired
{
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_impl);
  char v6 = [v5 isPaired];

  return v6;
}

- (void)connect
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    __int16 v14 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> was asked to connect.", (uint8_t *)&v13, 0xCu);
  }

  if (self->_connectionState)
  {
    char v4 = _TVRCGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t connectionState = self->_connectionState;
      int v13 = 134218240;
      __int16 v14 = self;
      __int16 v15 = 2048;
      int64_t v16 = connectionState;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is not in the disconnected state, ignoring connect request. Current state is %ld", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    BOOL v6 = [(TVRXDevice *)self _authenticationIsSupported];
    id v7 = _TVRCGeneralLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      __int16 v14 = self;
      __int16 v15 = 1024;
      LODWORD(v16) = v6;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> will allow authentication challenge: %d", (uint8_t *)&v13, 0x12u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
    [WeakRetained setAuthenticationSupported:v6];

    self->_int64_t connectionState = 1;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = _TVRCGeneralLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        __int16 v14 = self;
        _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device began connecting.", (uint8_t *)&v13, 0xCu);
      }

      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 deviceBeganConnecting:self];
    }
    char v4 = objc_loadWeakRetained((id *)&self->_impl);
    [v4 connect];
  }
}

- (void)disconnect
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    char v10 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> was asked to disconnect.", (uint8_t *)&v9, 0xCu);
  }

  if (self->_connectionState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
    [WeakRetained disconnect];

    self->_int64_t connectionState = 0;
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v7 = _TVRCGeneralLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      char v10 = self;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device disconnected (user-initiated).", (uint8_t *)&v9, 0xCu);
    }

    __int16 v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 device:self disconnectedForReason:0 error:0];
  }
  else
  {
    __int16 v8 = _TVRCGeneralLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      char v10 = self;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is already in the disconnected state, ignoring disconnect request.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)allIdentifiers
{
  char v3 = [MEMORY[0x263EFF9C0] setWithObject:self->_identifier];
  char v4 = [(TVRXDevice *)self idsIdentifier];

  if (v4)
  {
    id v5 = [(TVRXDevice *)self idsIdentifier];
    [v3 addObject:v5];
  }
  char v6 = [(NSDictionary *)self->_alternateIdentifiers allValues];
  [v3 addObjectsFromArray:v6];

  id v7 = [MEMORY[0x263EFFA08] setWithSet:v3];

  return v7;
}

- (BOOL)containsIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSString *)self->_identifier isEqualToString:v4]
    || ([(TVRXDevice *)self idsIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:v4],
        v5,
        (v6 & 1) != 0))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    __int16 v8 = [(NSDictionary *)self->_alternateIdentifiers allValues];
    uint64_t v7 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isEqualToString:v4])
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v7;
}

- (int64_t)connectionType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  int64_t v3 = [WeakRetained connectionType];

  return v3;
}

- (int64_t)linkType
{
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_impl);
  int64_t v6 = [v5 linkType];

  return v6;
}

- (int64_t)attentionState
{
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_impl);
  int64_t v6 = [v5 deviceAttentionState];

  return v6;
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_impl);
    int64_t v6 = [v5 pairedRemoteInfo];
  }
  else
  {
    int64_t v6 = 0;
  }

  return (TVRCSiriRemoteInfo *)v6;
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_impl);
    int64_t v6 = [v5 nowPlayingInfo];
  }
  else
  {
    int64_t v6 = 0;
  }

  return (TVRCNowPlayingInfo *)v6;
}

- (NSString)idsIdentifier
{
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_impl);
    int64_t v6 = [v5 idsIdentifier];
  }
  else
  {
    int64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (int64_t)siriRemoteFindingState
{
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_impl);
  int64_t v6 = [v5 siriRemoteFindingState];

  return v6;
}

- (void)_enableFindingSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    __int16 v8 = _TVRCGeneralLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = "no";
      if (v3) {
        uint64_t v9 = "yes";
      }
      int v11 = 134218242;
      long long v12 = self;
      __int16 v13 = 2080;
      long long v14 = v9;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> finding session enabled: %s", (uint8_t *)&v11, 0x16u);
    }

    id v10 = objc_loadWeakRetained((id *)p_impl);
    [v10 enableFindingSession:v3];
  }
}

- (void)_setImpl:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315650;
    v24 = (TVRXDevice *)"-[TVRXDevice _setImpl:]";
    __int16 v25 = 2112;
    id v26 = v4;
    __int16 v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s impl:%@ %@", (uint8_t *)&v23, 0x20u);
  }

  if (!self->_connectionState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
    [WeakRetained setAuthenticationSupported:0];

    id v9 = objc_loadWeakRetained((id *)&self->_impl);
    [v9 setDelegate:0];

    id v10 = objc_storeWeak((id *)&self->_impl, v4);
    [v4 setDelegate:self];

    id v11 = objc_loadWeakRetained((id *)&self->_impl);
    long long v12 = [v11 identifier];
    __int16 v13 = (NSString *)[v12 copy];
    identifier = self->_identifier;
    self->_identifier = v13;

    id v15 = objc_loadWeakRetained((id *)&self->_impl);
    int64_t v16 = [v15 alternateIdentifiers];
    uint64_t v17 = (NSDictionary *)[v16 copy];
    alternateIdentifiers = self->_alternateIdentifiers;
    self->_alternateIdentifiers = v17;

    id v19 = objc_loadWeakRetained((id *)&self->_impl);
    v20 = [v19 model];
    [(TVRXDevice *)self setModel:v20];

    id v21 = objc_loadWeakRetained((id *)&self->_impl);
    v22 = [v21 name];
    [(TVRXDevice *)self _setDeviceName:v22];

    int64_t v6 = objc_loadWeakRetained((id *)&self->_impl);
    char v7 = [v6 supportedButtons];
    [(TVRXDevice *)self _setSupportedButtons:v7];
    goto LABEL_7;
  }
  int64_t v6 = _TVRCGeneralLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = [(TVRXDevice *)self name];
    int v23 = 134218242;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> %{public}@ has an already established connection", (uint8_t *)&v23, 0x16u);
LABEL_7:
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  int64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    int64_t v6 = obj;
  }
}

- (void)_setDeviceName:(id)a3
{
  id v9 = a3;
  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {
    id v4 = (NSString *)[v9 copy];
    name = self->_name;
    self->_name = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 deviceNameChanged:self];
    }
  }
}

- (void)_setSupportedButtons:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSSet *)self->_supportedButtons isEqualToSet:v4])
  {
    id v5 = (NSSet *)[v4 copy];
    supportedButtons = self->_supportedButtons;
    self->_supportedButtons = v5;

    char v7 = _TVRCGeneralLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_supportedButtons;
      int v12 = 134218242;
      __int16 v13 = self;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> has new set of supported buttons: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 device:self updatedSupportedButtons:self->_supportedButtons];
    }
  }
}

- (void)_encounteredAuthenticationChallenge:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    int v12 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> encountered authentication challenge.", (uint8_t *)&v11, 0xCu);
  }

  if (self->_connectionState != 1)
  {
    id WeakRetained = _TVRCGeneralLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      int64_t connectionState = self->_connectionState;
      int v11 = 134218240;
      int v12 = self;
      __int16 v13 = 2048;
      int64_t v14 = connectionState;
      _os_log_impl(&dword_2266D3000, WeakRetained, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is not in the connecting state, ignoring authentication challenge. Current state is %ld", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_10;
  }
  BOOL v6 = [(TVRXDevice *)self _authenticationIsSupported];
  char v7 = _TVRCGeneralLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 134217984;
      int v12 = self;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device encountered authentication challenge.", (uint8_t *)&v11, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained device:self encounteredAuthenticationChallenge:v4];
LABEL_10:

    goto LABEL_14;
  }
  if (v8)
  {
    int v11 = 134217984;
    int v12 = self;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> delegate does not implement authentication method, cancelling authentication challenge.", (uint8_t *)&v11, 0xCu);
  }

  [v4 cancel];
LABEL_14:
}

- (void)_connectionAttemptSucceeded
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int v11 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> underlying connection attempt succeeded.", (uint8_t *)&v10, 0xCu);
  }

  if (self->_connectionState == 1)
  {
    self->_int64_t connectionState = 2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      BOOL v6 = _TVRCGeneralLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        int v11 = self;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device became connected.", (uint8_t *)&v10, 0xCu);
      }

      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 deviceConnected:self];
    }
    [(TVRXDevice *)self _setActiveEndpoint];
  }
  else
  {
    BOOL v8 = _TVRCGeneralLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t connectionState = self->_connectionState;
      int v10 = 134218240;
      int v11 = self;
      __int16 v12 = 2048;
      int64_t v13 = connectionState;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device is not in the connecting state, ignoring notification. Current state is %ld", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_disconnected:(int64_t)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _TVRCGeneralLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218496;
    v18 = self;
    __int16 v19 = 2048;
    int64_t v20 = a3;
    __int16 v21 = 2048;
    uint64_t v22 = [v6 code];
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> underlying connection was disconnected for TVRCDeviceDisconnectReason %ld, TVRCErrorCode %ld.", (uint8_t *)&v17, 0x20u);
  }

  int64_t connectionState = self->_connectionState;
  self->_int64_t connectionState = 0;
  BOOL v9 = [(TVRXDevice *)self _authenticationIsSupported];
  if (a3) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = connectionState == 1;
  }
  if (v10) {
    a3 = 0;
  }
  if (!v10 || v9)
  {
    if (connectionState == 2) {
      [(TVRXDevice *)self _setActiveEndpoint];
    }
  }
  else
  {
    int v11 = _TVRCGeneralLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      v18 = self;
      _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> disconnected for what appears to be an attempt to pair while locked.", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v12 = TVRCMakeError(102, MEMORY[0x263EFFA78]);

    a3 = 4;
    id v6 = (id)v12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = _TVRCGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      v18 = self;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> informing delegate that device disconnected.", (uint8_t *)&v17, 0xCu);
    }

    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 device:self disconnectedForReason:a3 error:v6];
  }
}

- (void)_setActiveEndpoint
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_loadWeakRetained((id *)p_impl);
    id v7 = [v6 alternateIdentifiers];
    BOOL v8 = [v7 objectForKey:@"AirplayID"];

    BOOL v9 = _TVRCGeneralLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        int64_t v13 = self;
        _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> will attempt to update the active MR endpoint", buf, 0xCu);
      }

      BOOL v9 = +[TVRCMediaRemoteEndpointManager sharedInstance];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __32__TVRXDevice__setActiveEndpoint__block_invoke;
      v11[3] = &unk_2647AFAE0;
      v11[4] = self;
      [v9 updateActiveEndpoint:v8 withCompletion:v11];
    }
    else if (v10)
    {
      *(_DWORD *)buf = 134217984;
      int64_t v13 = self;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> cannot update the active MR endpoint since there is no Airplay ID associated with the device", buf, 0xCu);
    }
  }
}

void __32__TVRXDevice__setActiveEndpoint__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _TVRCGeneralLog();
  char v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __32__TVRXDevice__setActiveEndpoint__block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> successfully updated the active MR endpoint", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)_authenticationIsSupported
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    int v7 = [v6 deviceShouldAllowConnectionAuthentication:self];

    uint64_t v8 = _TVRCGeneralLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v12 = self;
      __int16 v13 = 1024;
      int v14 = v7;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> delegate will allow authentication challenge: %d", buf, 0x12u);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  uint64_t v9 = _TVRCGeneralLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = self;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> checking with SpringBoard for locked-state.", buf, 0xCu);
  }

  SBSGetScreenLockStatus();
  return v7;
}

- (void)_deviceUpdateAttentionState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device's attention state was updated", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "device:updatedAttentionState:", self, -[TVRXDevice attentionState](self, "attentionState"));
  }
}

- (void)_deviceUpdateSiriRemoteFindingState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> device's siri remote finding state was updated", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "device:updatedSiriRemoteFindingState:", self, -[TVRXDevice siriRemoteFindingState](self, "siriRemoteFindingState"));
  }
}

- (void)_setPairedRemoteInfo:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    BOOL v10 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> connected remote info was updated", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 device:self updatedPairedRemoteInfo:v4];
  }
}

- (void)_setNowPlayingInfo:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    BOOL v10 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> now playing info was updated", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 device:self updatedNowPlayingInfo:v4];
  }
}

- (void)_setDeviceSupportsFindMyRemote:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "no";
    if (v3) {
      id v6 = "yes";
    }
    int v10 = 134218242;
    uint64_t v11 = self;
    __int16 v12 = 2080;
    __int16 v13 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDevice %p> supports find my remote: %s", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 device:self supportsFindMyRemote:v3];
  }
}

- (NSString)description
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = v3;
  if (self->_name) {
    [v3 appendFormat:@" \"%@\"", self->_name];
  }
  if (self->_identifier) {
    [v4 appendFormat:@"; identifier=%@", self->_identifier];
  }
  char v5 = [(TVRXDevice *)self idsIdentifier];

  if (v5)
  {
    id v6 = [(TVRXDevice *)self idsIdentifier];
    [v4 appendFormat:@"; ids=%@", v6];
  }
  [v4 appendFormat:@"; alternate identifiers=%@", self->_alternateIdentifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_impl);
    [v4 appendFormat:@"; impl=%@", v8];
  }
  [v4 appendFormat:@"; deviceImplSet=%@", self->_deviceImplSet];
  id v9 = TVRCDeviceClassificationDescription([(TVRXDevice *)self classification]);
  [v4 appendFormat:@"; classification=%@", v9];

  [v4 appendString:@">"];
  int v10 = (void *)[v4 copy];

  return (NSString *)v10;
}

- (NSString)conciseDescription
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(TVRXDevice *)self name];
  [v3 appendString:v4 withName:@"name"];

  char v5 = [(TVRXDevice *)self identifier];
  [v3 appendString:v5 withName:@"identifier"];

  id v6 = [(TVRXDevice *)self idsIdentifier];
  [v3 appendString:v6 withName:@"idsIdentifier"];

  char v7 = [(TVRXDevice *)self alternateIdentifiers];
  id v8 = [v7 objectForKeyedSubscript:@"AirplayID"];
  [v3 appendString:v8 withName:@"AirplayID"];

  id v9 = [(TVRXDevice *)self _impl];
  id v10 = (id)[v3 appendClass:objc_opt_class() withName:@"impl"];

  uint64_t v11 = TVRCDeviceClassificationDescription([(TVRXDevice *)self classification]);
  [v3 appendString:v11 withName:@"classification"];

  __int16 v12 = [v3 build];

  return (NSString *)v12;
}

- (id)stateDictionary
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(TVRXDevice *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  char v5 = [(TVRXDevice *)self identifier];
  [v3 setObject:v5 forKeyedSubscript:@"identifier"];

  id v6 = [(TVRXDevice *)self idsIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"idsIdentifier"];

  char v7 = [(TVRXDevice *)self alternateIdentifiers];
  id v8 = [v7 objectForKeyedSubscript:@"AirplayID"];
  [v3 setObject:v8 forKeyedSubscript:@"AirplayID"];

  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVRXDevice connectionState](self, "connectionState"));
  [v3 setObject:v9 forKeyedSubscript:@"connectionState"];

  id v10 = TVRCDeviceClassificationDescription([(TVRXDevice *)self classification]);
  [v3 setObject:v10 forKeyedSubscript:@"classification"];

  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (BOOL)isEqualToTVRXDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "allIdentifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([(TVRXDevice *)self containsIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TVRXDevice *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TVRXDevice *)self isEqualToTVRXDevice:v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(TVRXDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v6 = "-[TVRXDevice dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)TVRXDevice;
  [(TVRXDevice *)&v4 dealloc];
}

- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_impl);
    [v13 sendEvent:v14 options:v8 response:v9];
  }
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_impl);
    [v10 fetchUpNextInfoWithPaginationToken:v11 completion:v6];
  }
  else
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, MEMORY[0x263EFFA78], 0);
  }
}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void))a4;
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_impl);
    [v10 markAsWatchedWithMediaIdentifier:v11 completion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void))a4;
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_impl);
    [v10 addItemWithMediaIdentifier:v11 completion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void))a4;
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_impl);
    [v10 removeItemWithMediaIdentifier:v11 completion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void))a4;
  p_impl = &self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)p_impl);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_impl);
    [v10 playItem:v11 completion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)device:(id)a3 didDisconnectWithReason:(int64_t)a4 error:(id)a5
{
}

- (void)device:(id)a3 didEncounterAuthenticationChallenge:(id)a4
{
}

- (void)device:(id)a3 didUpdateSupportedButtons:(id)a4
{
}

- (void)device:(id)a3 didUpdatePairedRemoteInfo:(id)a4
{
}

- (void)device:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
}

- (void)device:(id)a3 didUpdateFindMyRemoteSupported:(BOOL)a4
{
}

- (void)device:(id)a3 didUpdateName:(id)a4
{
}

- (void)_setIdentifier:(id)a3 alternateIdentifiers:(id)a4 name:(id)a5 model:(id)a6 supportedButtons:(id)a7
{
  id v15 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  [(TVRXDevice *)self setIdentifier:a3];
  [(TVRXDevice *)self setName:v13];

  [(TVRXDevice *)self setModel:v12];
  [(TVRXDevice *)self setAlternateIdentifiers:v14];

  [(TVRXDevice *)self setSupportedButtons:v15];
}

- (_TVRXDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TVRXDeviceDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)alternateIdentifiers
{
  return self->_alternateIdentifiers;
}

- (void)setAlternateIdentifiers:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (NSSet)supportedButtons
{
  return self->_supportedButtons;
}

- (void)setSupportedButtons:(id)a3
{
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (_TVRCDeviceImpl)_impl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);

  return (_TVRCDeviceImpl *)WeakRetained;
}

- (NSMutableSet)deviceImplSet
{
  return self->_deviceImplSet;
}

- (void)setDeviceImplSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImplSet, 0);
  objc_destroyWeak((id *)&self->_impl);
  objc_storeStrong((id *)&self->_supportedButtons, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __32__TVRXDevice__setActiveEndpoint__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "<TVRXDevice %p> could not update active MR endpoint. Error - %@", (uint8_t *)&v4, 0x16u);
}

@end