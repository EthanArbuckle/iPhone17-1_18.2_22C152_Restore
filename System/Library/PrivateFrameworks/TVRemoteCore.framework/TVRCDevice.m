@interface TVRCDevice
- (BOOL)containsIdentifier:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isInEditingSession;
- (BOOL)isPaired;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsTouchEvents;
- (NSSet)supportedButtons;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (TVRCDevice)initWithDeviceIdentifier:(id)a3;
- (TVRCDeviceDelegate)delegate;
- (TVRCDeviceInfo)info;
- (TVRCDeviceState)deviceState;
- (TVRCKeyboardController)keyboardController;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRCSiriRemoteInfo)pairedRemoteInfo;
- (id)_deviceStateDictionary;
- (id)description;
- (int64_t)attentionState;
- (int64_t)classification;
- (int64_t)connectionState;
- (int64_t)connectionType;
- (int64_t)linkType;
- (int64_t)siriRemoteFindingState;
- (unint64_t)pairingCapability;
- (void)_connectWithConnectionContext:(int64_t)a3;
- (void)_deviceEncounteredAuthChallengeType:(int64_t)a3 attributes:(int64_t)a4 codeToEnterOnDevice:(id)a5 throttleSeconds:(int64_t)a6;
- (void)_deviceUpdatedState:(id)a3;
- (void)_disconnectDeviceDueToConnectionInterruption;
- (void)_sendRTIDataPayload:(id)a3;
- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)disconnectWithType:(unint64_t)a3;
- (void)enableFindingSession:(BOOL)a3;
- (void)enableTVRemoteOnLockscreen:(BOOL)a3;
- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4;
- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)playItem:(id)a3 completion:(id)a4;
- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)sendButtonEvent:(id)a3;
- (void)sendGameControllerEvent:(id)a3;
- (void)sendTouchEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfo:(id)a3;
- (void)setKeyboardController:(id)a3;
@end

@implementation TVRCDevice

- (TVRCDevice)initWithDeviceIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TVRCDevice;
  v5 = [(TVRCDevice *)&v15 init];
  if (v5)
  {
    v6 = _TVRCGeneralLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[TVRCDevice initWithDeviceIdentifier:]";
      __int16 v18 = 2114;
      id v19 = v4;
      __int16 v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "%s identifier:%{public}@, %{public}@", buf, 0x20u);
    }

    uint64_t v7 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [[TVRCKeyboardController alloc] _initWithDevice:v5];
    keyboardController = v5->_keyboardController;
    v5->_keyboardController = v9;

    v11 = objc_alloc_init(TVRCDeviceInfo);
    info = v5->_info;
    v5->_info = v11;

    v13 = +[TVRCXPCClient sharedInstance];
    [v13 addEventObserver:v5 forDeviceWithIdentifier:v5->_identifier];
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[TVRCDevice setDelegate:]";
    __int16 v8 = 2114;
    id v9 = v4;
    __int16 v10 = 2114;
    v11 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s delegate:%{public}@, %{public}@", (uint8_t *)&v6, 0x20u);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[TVRCDevice dealloc]";
    __int16 v9 = 2114;
    __int16 v10 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  id v4 = +[TVRCXPCClient sharedInstance];
  v5 = [(TVRCDevice *)self identifier];
  [v4 removeEventObserver:self forDeviceWithIdentifier:v5];

  v6.receiver = self;
  v6.super_class = (Class)TVRCDevice;
  [(TVRCDevice *)&v6 dealloc];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ %p", objc_opt_class(), self];
  uint64_t v4 = [(TVRCDevice *)self name];
  v5 = (void *)v4;
  if (v4) {
    [v3 appendFormat:@" \"%@\"", v4];
  }
  if (self->_identifier) {
    [v3 appendFormat:@"; identifier=%@", self->_identifier];
  }
  if (self->_info) {
    [v3 appendFormat:@"; info=%@", self->_info];
  }
  objc_super v6 = TVRCDeviceConnectionTypeDescription([(TVRCDevice *)self connectionType]);
  [v3 appendFormat:@"; connectionType=%@", v6];

  if ([(TVRCDevice *)self classification])
  {
    uint64_t v7 = TVRCDeviceClassificationDescription([(TVRCDevice *)self classification]);
    [v3 appendFormat:@"; suggestion=%@", v7];
  }
  if ([(TVRCDevice *)self linkType])
  {
    __int16 v8 = TVRCDeviceLinkTypeDescription([(TVRCDevice *)self linkType]);
    [v3 appendFormat:@"; linkType=%@", v8];
  }
  [v3 appendString:@">"];
  __int16 v9 = (void *)[v3 copy];

  return v9;
}

- (id)_deviceStateDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(TVRCDevice *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  v5 = [(TVRCDevice *)self identifier];
  [v3 setObject:v5 forKeyedSubscript:@"identifier"];

  objc_super v6 = [(TVRCDevice *)self model];
  [v3 setObject:v6 forKeyedSubscript:@"model"];

  uint64_t v7 = TVRCDeviceConnectionTypeDescription([(TVRCDevice *)self connectionType]);
  [v3 setObject:v7 forKeyedSubscript:@"connectionType"];

  __int16 v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVRCDevice connectionState](self, "connectionState"));
  [v3 setObject:v8 forKeyedSubscript:@"connectionState"];

  __int16 v9 = objc_msgSend(NSNumber, "numberWithBool:", -[TVRCDevice isPaired](self, "isPaired"));
  [v3 setObject:v9 forKeyedSubscript:@"paired"];

  __int16 v10 = objc_msgSend(NSNumber, "numberWithBool:", -[TVRCDevice supportsDirectCaptionQueries](self, "supportsDirectCaptionQueries"));
  [v3 setObject:v10 forKeyedSubscript:@"supportsDirectCaptionQueries"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[TVRCDevice supportsFindMyRemote](self, "supportsFindMyRemote"));
  [v3 setObject:v11 forKeyedSubscript:@"supportsFindMyRemote"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[TVRCDevice supportsTouchEvents](self, "supportsTouchEvents"));
  [v3 setObject:v12 forKeyedSubscript:@"supportsTouchEvents"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVRCDevice attentionState](self, "attentionState"));
  [v3 setObject:v13 forKeyedSubscript:@"attentionState"];

  v14 = [(TVRCDevice *)self deviceState];
  objc_super v15 = [v14 alternateIdentifiers];
  [v3 setObject:v15 forKeyedSubscript:@"alternateIdentifiers"];

  v16 = (void *)[v3 copy];

  return v16;
}

- (void)connect
{
}

- (void)_connectWithConnectionContext:(int64_t)a3
{
  if (![(TVRCDeviceState *)self->_deviceState connectionState])
  {
    id v5 = +[TVRCXPCClient sharedInstance];
    [v5 openConnectionToDeviceWithIdentifier:self->_identifier connectionContext:a3];
  }
}

- (void)disconnectWithType:(unint64_t)a3
{
  [(TVRCDeviceState *)self->_deviceState setConnectionState:0];
  id v5 = +[TVRCXPCClient sharedInstance];
  [v5 closeConnectionToDeviceWithIdentifier:self->_identifier withType:a3];
}

- (void)sendButtonEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[TVRCXPCClient sharedInstance];
  [v5 sendButtonEvent:v4 toDeviceWithIdentifier:self->_identifier];
}

- (void)sendTouchEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[TVRCXPCClient sharedInstance];
  [v5 sendTouchEvent:v4 toDeviceWithIdentifier:self->_identifier];
}

- (void)sendGameControllerEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[TVRCXPCClient sharedInstance];
  [v5 sendGameControllerEvent:v4 toDeviceWithIdentifier:self->_identifier];
}

- (BOOL)containsIdentifier:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  LOBYTE(identifier) = [(NSString *)identifier isEqualToString:v5];
  uint64_t v6 = [(TVRCDeviceInfo *)self->_info mediaRemoteID];
  char v7 = [(id)v6 isEqualToString:v5];

  __int16 v8 = [(TVRCDeviceInfo *)self->_info airplayID];
  LOBYTE(v6) = [v8 isEqualToString:v5];

  return identifier | v6 | v7;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 info];
  uint64_t v6 = [v4 identifier];

  if ([(TVRCDevice *)self containsIdentifier:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    __int16 v8 = [v5 mediaRemoteID];
    if ([(TVRCDevice *)self containsIdentifier:v8])
    {
      BOOL v7 = 1;
    }
    else
    {
      __int16 v9 = [v5 airplayID];
      BOOL v7 = [(TVRCDevice *)self containsIdentifier:v9];
    }
  }

  return v7;
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TVRCXPCClient sharedInstance];
  [v8 fetchUpNextInfoForDeviceWithIdentifier:self->_identifier paginationToken:v7 completion:v6];
}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TVRCXPCClient sharedInstance];
  [v8 markAsWatchedForDeviceWithIdentifier:self->_identifier mediaIdentifier:v7 completion:v6];
}

- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TVRCXPCClient sharedInstance];
  [v8 addItemForDeviceWithIdentifier:self->_identifier mediaIdentifier:v7 completion:v6];
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TVRCXPCClient sharedInstance];
  [v8 removeItemForDeviceWithIdentifier:self->_identifier mediaIdentifier:v7 completion:v6];
}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TVRCXPCClient sharedInstance];
  [v8 playItem:v7 deviceIdentifier:self->_identifier completion:v6];
}

- (NSString)name
{
  return [(TVRCDeviceState *)self->_deviceState name];
}

- (NSString)model
{
  return [(TVRCDeviceState *)self->_deviceState model];
}

- (NSSet)supportedButtons
{
  return [(TVRCDeviceState *)self->_deviceState supportedButtons];
}

- (BOOL)supportsTouchEvents
{
  return [(TVRCDeviceState *)self->_deviceState supportsTouchEvents];
}

- (BOOL)isPaired
{
  return [(TVRCDeviceState *)self->_deviceState isPaired];
}

- (BOOL)isInEditingSession
{
  v2 = [(TVRCDeviceState *)self->_deviceState keyboardState];
  char v3 = [v2 isEditing];

  return v3;
}

- (unint64_t)pairingCapability
{
  return [(TVRCDeviceState *)self->_deviceState pairingCapability];
}

- (int64_t)connectionState
{
  return [(TVRCDeviceState *)self->_deviceState connectionState];
}

- (BOOL)supportsDirectCaptionQueries
{
  return [(TVRCDeviceState *)self->_deviceState supportsDirectCaptionQueries];
}

- (BOOL)supportsFindMyRemote
{
  if ([(TVRCDeviceState *)self->_deviceState supportsFindMyRemote]) {
    return 1;
  }
  id v4 = [(TVRCDeviceState *)self->_deviceState pairedRemoteInfo];
  char v5 = [v4 supportsFindMy];

  return v5;
}

- (int64_t)attentionState
{
  return [(TVRCDeviceState *)self->_deviceState attentionState];
}

- (int64_t)connectionType
{
  return [(TVRCDeviceState *)self->_deviceState connectionType];
}

- (int64_t)classification
{
  return [(TVRCDeviceState *)self->_deviceState classification];
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return [(TVRCDeviceState *)self->_deviceState nowPlayingInfo];
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return [(TVRCDeviceState *)self->_deviceState pairedRemoteInfo];
}

- (int64_t)linkType
{
  return [(TVRCDeviceState *)self->_deviceState linkType];
}

- (void)_deviceUpdatedState:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _TVRCGeneralLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v96 = "-[TVRCDevice _deviceUpdatedState:]";
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v7 = [v5 alternateIdentifiers];
  id v8 = [v7 allValues];

  identifier = self->_identifier;
  __int16 v10 = [v5 identifier];
  if ([(NSString *)identifier isEqualToString:v10])
  {

    goto LABEL_6;
  }
  char v11 = [v8 containsObject:self->_identifier];

  if (v11)
  {
LABEL_6:
    uint64_t v12 = self->_deviceState;
    objc_storeStrong((id *)&self->_deviceState, a3);
    info = self->_info;
    v14 = [v5 alternateIdentifiers];
    [(TVRCDeviceInfo *)info _populateValidIdentifiers:v14];

    objc_super v15 = _TVRCGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v96 = (const char *)v12;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Old state: %{public}@", buf, 0xCu);
    }

    v16 = _TVRCGeneralLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v96 = (const char *)v5;
      _os_log_impl(&dword_2266D3000, v16, OS_LOG_TYPE_DEFAULT, "New state: %{public}@", buf, 0xCu);
    }

    if (!-[TVRCDeviceState connectionState](v12, "connectionState") && [v5 connectionState] == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        id v19 = objc_loadWeakRetained((id *)&self->_delegate);
        [v19 deviceBeganConnecting:self];
      }
    }
    if (-[TVRCDeviceState connectionState](v12, "connectionState") != 2 && [v5 connectionState] == 2)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        id v22 = objc_loadWeakRetained((id *)&self->_delegate);
        [v22 deviceConnected:self];
      }
      v23 = +[TVRCPreferredDeviceManager sharedInstance];
      [v23 setPreferredDevice:self];
    }
    if (!v12)
    {
      if ([v5 connectionState]) {
        goto LABEL_76;
      }
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      char v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0) {
        goto LABEL_76;
      }
      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v28 = [v5 disconnectReason];
      v29 = [v5 disconnectError];
      [v27 device:self disconnectedForReason:v28 error:v29];

LABEL_75:
LABEL_76:
      keyboardController = self->_keyboardController;
      v94 = [v5 keyboardState];
      [(TVRCKeyboardController *)keyboardController _setCurrentState:v94];

      goto LABEL_77;
    }
    if (-[TVRCDeviceState connectionState](v12, "connectionState") && ![v5 connectionState])
    {
      if ([v5 disconnectReason] == 1)
      {
        v30 = +[TVRCPreferredDeviceManager sharedInstance];
        v31 = [v30 preferredDeviceIdentifier];

        if ([v31 isEqualToString:self->_identifier])
        {
          v32 = +[TVRCPreferredDeviceManager sharedInstance];
          [v32 setPreferredDevice:0];
        }
      }
      goto LABEL_33;
    }
    if (!-[TVRCDeviceState connectionState](v12, "connectionState") && ![v5 connectionState])
    {
      v24 = [v5 disconnectError];
      if (v24)
      {

        goto LABEL_33;
      }
      if ([v5 disconnectReason] < 5)
      {
LABEL_33:
        id v33 = objc_loadWeakRetained((id *)&self->_delegate);
        char v34 = objc_opt_respondsToSelector();

        if (v34)
        {
          id v35 = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v36 = [v5 disconnectReason];
          v37 = [v5 disconnectError];
          [v35 device:self disconnectedForReason:v36 error:v37];
        }
      }
    }
    v38 = [(TVRCDeviceState *)v12 supportedButtons];
    v39 = [v5 supportedButtons];
    char v40 = [v38 isEqualToSet:v39];

    if ((v40 & 1) == 0)
    {
      v41 = [(TVRCDeviceState *)v12 supportedButtons];
      v42 = (void *)[v41 mutableCopy];

      v43 = [v5 supportedButtons];
      [v42 minusSet:v43];

      v44 = [v5 supportedButtons];
      v45 = (void *)[v44 mutableCopy];

      v46 = [(TVRCDeviceState *)v12 supportedButtons];
      [v45 minusSet:v46];

      id v47 = objc_loadWeakRetained((id *)&self->_delegate);
      char v48 = objc_opt_respondsToSelector();

      if (v48)
      {
        id v49 = objc_loadWeakRetained((id *)&self->_delegate);
        [v49 device:self removedSupportedButtons:v42 added:v45];
      }
    }
    v50 = [(TVRCDeviceState *)v12 name];
    v51 = [v5 name];
    char v52 = [v50 isEqualToString:v51];

    if ((v52 & 1) == 0)
    {
      id v53 = objc_loadWeakRetained((id *)&self->_delegate);
      char v54 = objc_opt_respondsToSelector();

      if (v54)
      {
        id v55 = objc_loadWeakRetained((id *)&self->_delegate);
        [v55 deviceNameChanged:self];
      }
    }
    int v56 = [(TVRCDeviceState *)v12 supportsFindMyRemote];
    if (v56 != [v5 supportsFindMyRemote]
      || ([(TVRCDeviceState *)v12 pairedRemoteInfo],
          v57 = objc_claimAutoreleasedReturnValue(),
          [v5 pairedRemoteInfo],
          v58 = objc_claimAutoreleasedReturnValue(),
          char v59 = [v57 isEqualToRemoteInfo:v58],
          v58,
          v57,
          (v59 & 1) == 0))
    {
      v60 = _TVRCGeneralLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        int v61 = [v5 supportsFindMyRemote];
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v61;
        _os_log_impl(&dword_2266D3000, v60, OS_LOG_TYPE_DEFAULT, "Updated supportsFindMyRemote: %d", buf, 8u);
      }

      v62 = _TVRCGeneralLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = [v5 pairedRemoteInfo];
        *(_DWORD *)buf = 138412290;
        v96 = v63;
        _os_log_impl(&dword_2266D3000, v62, OS_LOG_TYPE_DEFAULT, "Updated pairedRemoteInfo: %@", buf, 0xCu);
      }
      if ([v5 supportsFindMyRemote])
      {
        uint64_t v64 = 1;
      }
      else
      {
        v65 = [v5 pairedRemoteInfo];
        uint64_t v64 = [v65 supportsFindMy];
      }
      id v66 = objc_loadWeakRetained((id *)&self->_delegate);
      char v67 = objc_opt_respondsToSelector();

      if (v67)
      {
        id v68 = objc_loadWeakRetained((id *)&self->_delegate);
        [v68 device:self supportsFindMyRemote:v64];
      }
    }
    v69 = [(TVRCDeviceState *)v12 nowPlayingInfo];
    v70 = [v5 nowPlayingInfo];
    char v71 = [v69 isEqualToNowPlayingInfo:v70];

    if ((v71 & 1) == 0)
    {
      v72 = _TVRCGeneralLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = [v5 nowPlayingInfo];
        *(_DWORD *)buf = 138412290;
        v96 = v73;
        _os_log_impl(&dword_2266D3000, v72, OS_LOG_TYPE_DEFAULT, "Updated nowPlayingInfo: %@", buf, 0xCu);
      }
      id v74 = objc_loadWeakRetained((id *)&self->_delegate);
      char v75 = objc_opt_respondsToSelector();

      if (v75)
      {
        id v76 = objc_loadWeakRetained((id *)&self->_delegate);
        v77 = [v5 nowPlayingInfo];
        [v76 device:self updatedNowPlayingInfo:v77];
      }
    }
    uint64_t v78 = [(TVRCDeviceState *)v12 siriRemoteFindingState];
    if (v78 != [v5 siriRemoteFindingState])
    {
      v79 = _TVRCGeneralLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v80 = [v5 siriRemoteFindingState];
        if (v80 < 7 && ((0x77u >> v80) & 1) != 0)
        {
          v83 = off_2647AF878[v80];
        }
        else
        {
          v81 = NSString;
          v82 = [NSNumber numberWithInteger:v80];
          v83 = [v81 stringWithFormat:@"Unknown %@", v82];
        }
        *(_DWORD *)buf = 138543362;
        v96 = (const char *)v83;
        _os_log_impl(&dword_2266D3000, v79, OS_LOG_TYPE_DEFAULT, "Updated siriRemoteFindingState: %{public}@", buf, 0xCu);
      }
      id v84 = objc_loadWeakRetained((id *)&self->_delegate);
      char v85 = objc_opt_respondsToSelector();

      if (v85)
      {
        id v86 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v86, "device:updatedSiriRemoteFindingSessionState:", self, objc_msgSend(v5, "siriRemoteFindingState"));
      }
    }
    uint64_t v87 = [(TVRCDeviceState *)v12 attentionState];
    if (v87 == [v5 attentionState]) {
      goto LABEL_76;
    }
    v88 = _TVRCGeneralLog();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v89 = [v5 attentionState];
      if ((unint64_t)(v89 - 1) >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v89);
        v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v90 = off_2647AF8B0[v89 - 1];
      }
      *(_DWORD *)buf = 138543362;
      v96 = (const char *)v90;
      _os_log_impl(&dword_2266D3000, v88, OS_LOG_TYPE_DEFAULT, "Updated attentionState: %{public}@", buf, 0xCu);
    }
    id v91 = objc_loadWeakRetained((id *)&self->_delegate);
    char v92 = objc_opt_respondsToSelector();

    if ((v92 & 1) == 0) {
      goto LABEL_76;
    }
    id v27 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v27, "device:updatedAttentionState:", self, objc_msgSend(v5, "attentionState"));
    goto LABEL_75;
  }
LABEL_77:
}

- (void)_deviceEncounteredAuthChallengeType:(int64_t)a3 attributes:(int64_t)a4 codeToEnterOnDevice:(id)a5 throttleSeconds:(int64_t)a6
{
  id v10 = a5;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v11 = objc_loadWeakRetained(&to);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [[TVRCDeviceAuthenticationChallenge alloc] _initWithDeviceIdentifier:self->_identifier challengeType:a3 codeToEnterOnDevice:v10];
    [v13 setChallengeAttributes:a4];
    [v13 setThrottleSeconds:a6];
    id v14 = objc_loadWeakRetained(&to);
    [v14 device:self encounteredAuthenticationChallenge:v13];
  }
  else
  {
    v13 = _TVRCGeneralLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[TVRCDevice _deviceEncounteredAuthChallengeType:attributes:codeToEnterOnDevice:throttleSeconds:]((uint64_t)self, v13);
    }
  }

  objc_destroyWeak(&to);
}

- (void)_disconnectDeviceDueToConnectionInterruption
{
  [(TVRCDeviceState *)self->_deviceState setConnectionState:0];
  if ([(TVRCDeviceState *)self->_deviceState connectionState] == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      [v5 device:self disconnectedForReason:4 error:0];
    }
  }
}

- (void)_sendRTIDataPayload:(id)a3
{
  id v4 = a3;
  id v5 = +[TVRCXPCClient sharedInstance];
  [v5 sendInputTextPayload:v4 toDeviceWithIdentifier:self->_identifier];
}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[TVRCXPCClient sharedInstance];
  [v5 enableTVRemoteOnLockscreen:v3 forDeviceIdentifier:self->_identifier];
}

- (void)enableFindingSession:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[TVRCXPCClient sharedInstance];
  [v5 enableFindingSession:v3 forDeviceIdentifier:self->_identifier];
}

- (TVRCDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRCDeviceDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (TVRCKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (void)setKeyboardController:(id)a3
{
}

- (TVRCDeviceInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (TVRCDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(id)a3
{
}

- (int64_t)siriRemoteFindingState
{
  return self->_siriRemoteFindingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_deviceEncounteredAuthChallengeType:(uint64_t)a1 attributes:(NSObject *)a2 codeToEnterOnDevice:throttleSeconds:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2266D3000, a2, OS_LOG_TYPE_FAULT, "There is no delegate for device %@ to receive the auth challenge", (uint8_t *)&v2, 0xCu);
}

@end