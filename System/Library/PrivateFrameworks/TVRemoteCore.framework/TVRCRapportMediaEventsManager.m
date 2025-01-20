@interface TVRCRapportMediaEventsManager
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)volumeSupported;
- (NSMutableSet)mediaCommands;
- (NSSet)supportedMediaCommands;
- (NSSet)volumeCommands;
- (RPMediaControlSession)mediaSession;
- (TVRCRapportMediaEventsManager)initWithCompanionLinkClient:(id)a3 supportsDirectCaptionQueries:(BOOL)a4 eventHandler:(id)a5;
- (id)eventHandler;
- (id)supportedCaptionEvents;
- (int)_captionSettingForButtonEvent:(id)a3;
- (int)_commandForMediaButtonEvent:(id)a3;
- (int)currentSetting;
- (void)_refreshCaptionState;
- (void)_setupMediaCommands:(unint64_t)a3;
- (void)invalidate;
- (void)sendMediaEvent:(id)a3;
- (void)setCurrentSetting:(int)a3;
- (void)setEventHandler:(id)a3;
- (void)setMediaCommands:(id)a3;
- (void)setMediaSession:(id)a3;
- (void)setSupportsDirectCaptionQueries:(BOOL)a3;
- (void)setVolumeCommands:(id)a3;
@end

@implementation TVRCRapportMediaEventsManager

- (TVRCRapportMediaEventsManager)initWithCompanionLinkClient:(id)a3 supportsDirectCaptionQueries:(BOOL)a4 eventHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TVRCRapportMediaEventsManager;
  v10 = [(TVRCRapportMediaEventsManager *)&v26 init];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F62BB0]);
    [(TVRCRapportMediaEventsManager *)v10 setMediaSession:v11];

    v12 = [(TVRCRapportMediaEventsManager *)v10 mediaSession];
    [v12 setMessenger:v8];

    uint64_t v13 = [v9 copy];
    id eventHandler = v10->_eventHandler;
    v10->_id eventHandler = (id)v13;

    v10->_supportsDirectCaptionQueries = a4;
    objc_initWeak(&location, v10);
    v15 = [(TVRCRapportMediaEventsManager *)v10 mediaSession];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke;
    v22[3] = &unk_2647AEC00;
    objc_copyWeak(&v24, &location);
    id v16 = v8;
    id v23 = v16;
    [v15 setMediaControlFlagsChangedHandler:v22];

    v17 = [(TVRCRapportMediaEventsManager *)v10 mediaSession];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3;
    v19[3] = &unk_2647AFCE0;
    id v20 = v16;
    objc_copyWeak(&v21, &location);
    [v17 activateWithCompletion:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = _TVRCMediaEventsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v4;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "MediaControlFlagsChangedHandler called for companionLinkClient <%{public}@>", buf, 0xCu);
    }

    v5 = [WeakRetained mediaSession];
    uint64_t v6 = [v5 mediaControlFlags];

    v7 = _TVRCMediaEventsLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v6 & 0x100) != 0)
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v10;
        _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "RPMediaControlFlagsVolume available for <%{public}@>", buf, 0xCu);
      }

      id v11 = [[TVRCButton alloc] _initWithButtonType:10];
      id v12 = [[TVRCButton alloc] _initWithButtonType:11];
      id v13 = [[TVRCButton alloc] _initWithButtonType:29];
      v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v11, v12, v13, 0);
      [WeakRetained setVolumeCommands:v14];
    }
    else
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v9;
        _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "RPMediaControlFlagsVolume not available for companionLinkClient <%{public}@>", buf, 0xCu);
      }

      [WeakRetained setVolumeCommands:0];
    }
    [WeakRetained _setupMediaCommands:v6];
    v15 = [WeakRetained eventHandler];

    if (v15)
    {
      id v16 = [WeakRetained eventHandler];
      v16[2]();
    }
  }
}

void __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _TVRCMediaEventsLog();
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2266D3000, WeakRetained, OS_LOG_TYPE_DEFAULT, "MediaSession activated for companionLinkClient <%{public}@>", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _refreshCaptionState];
  }
}

- (void)invalidate
{
  id v3 = [(TVRCRapportMediaEventsManager *)self mediaSession];
  [v3 invalidate];

  [(TVRCRapportMediaEventsManager *)self setMediaSession:0];
  uint64_t v4 = _TVRCRapportLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated MediaManager", v5, 2u);
  }
}

- (NSSet)supportedMediaCommands
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v4 = [(TVRCRapportMediaEventsManager *)self volumeCommands];

  if (v4)
  {
    v5 = [(TVRCRapportMediaEventsManager *)self volumeCommands];
    [v3 unionSet:v5];
  }
  uint64_t v6 = [(TVRCRapportMediaEventsManager *)self mediaCommands];

  if (v6)
  {
    int v7 = [(TVRCRapportMediaEventsManager *)self mediaCommands];
    [v3 unionSet:v7];
  }
  uint64_t v8 = [(TVRCRapportMediaEventsManager *)self supportedCaptionEvents];
  [v3 unionSet:v8];

  uint64_t v9 = [MEMORY[0x263EFFA08] setWithSet:v3];

  return (NSSet *)v9;
}

- (BOOL)volumeSupported
{
  v2 = [(TVRCRapportMediaEventsManager *)self volumeCommands];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sendMediaEvent:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 button];
  uint64_t v6 = [v5 buttonType];

  if ((unint64_t)(v6 - 16) > 2)
  {
    uint64_t v9 = [(TVRCRapportMediaEventsManager *)self _commandForMediaButtonEvent:v4];
    if (v9 == 7)
    {
      if (v6 == 31)
      {
        double v10 = -9999999.0;
      }
      else
      {
        v14 = [v4 button];
        v15 = [v14 properties];
        id v16 = [v15 objectForKey:@"TVRCButtonSkipInterval"];

        double v10 = 10.0;
        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v16 doubleValue];
            double v10 = v17;
          }
        }
      }
      uint64_t v18 = _TVRCMediaEventsLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315394;
        *(void *)&location[4] = "SkipBy";
        __int16 v28 = 2048;
        double v29 = v10;
        _os_log_impl(&dword_2266D3000, v18, OS_LOG_TYPE_DEFAULT, "Sending %s with skipInterval=%f", location, 0x16u);
      }

      uint64_t v19 = [(TVRCRapportMediaEventsManager *)self mediaSession];
      uint64_t v20 = *MEMORY[0x263F62C08];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7;
      v23[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
      int v24 = 7;
      [v19 mediaSkipBySeconds:v20 destinationID:v23 completion:v10];
    }
    else
    {
      uint64_t v11 = v9;
      id v12 = [(TVRCRapportMediaEventsManager *)self mediaSession];
      uint64_t v13 = *MEMORY[0x263F62C08];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_8;
      v21[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
      int v22 = v11;
      [v12 mediaCommand:v11 destinationID:v13 completion:v21];
    }
  }
  else
  {
    uint64_t v7 = [(TVRCRapportMediaEventsManager *)self _captionSettingForButtonEvent:v4];
    objc_initWeak((id *)location, self);
    uint64_t v8 = [(TVRCRapportMediaEventsManager *)self mediaSession];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke;
    v25[3] = &unk_2647AFA68;
    objc_copyWeak(&v26, (id *)location);
    [v8 mediaCaptionSettingSet:v7 destinationID:*MEMORY[0x263F62C08] completion:v25];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = _TVRCMediaEventsLog();
    uint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_cold_1((uint64_t)v3, v6);
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Media caption setting set for RPDestinationIdentifierDirectPeer", v7, 2u);
      }

      [WeakRetained _refreshCaptionState];
    }
  }
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRCMediaEventsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7_cold_1();
    }
  }
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRCMediaEventsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7_cold_1();
    }
  }
}

- (void)_setupMediaCommands:(unint64_t)a3
{
  __int16 v3 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v5 = _TVRCMediaEventsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[TVRCRapportMediaEventsManager _setupMediaCommands:]";
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  mediaCommands = self->_mediaCommands;
  self->_mediaCommands = v6;

  v34[0] = @"_TVRCButtonLongPressBeginAction";
  v34[1] = @"_TVRCButtonLongPressEndAction";
  v35[0] = &unk_26DA62EE0;
  v35[1] = &unk_26DA62EF8;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  if ((v3 & 0x200) != 0)
  {
    uint64_t v9 = [TVRCButton alloc];
    v32 = @"TVRCButtonSkipInterval";
    v33 = &unk_26DA62FF8;
    double v10 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v11 = [(TVRCButton *)v9 _initWithButtonType:6 hasTapAction:1 properties:v10];

    id v12 = [(TVRCRapportMediaEventsManager *)self mediaCommands];
    [v12 addObject:v11];

    if ((v3 & 0x400) == 0)
    {
LABEL_5:
      if ((v3 & 4) == 0) {
        goto LABEL_6;
      }
LABEL_10:
      double v17 = [TVRCButton alloc];
      if ((v3 & 0x10) != 0) {
        uint64_t v18 = v8;
      }
      else {
        uint64_t v18 = (void *)MEMORY[0x263EFFA78];
      }
      id v19 = [(TVRCButton *)v17 _initWithButtonType:8 hasTapAction:1 properties:v18];
      uint64_t v20 = [(TVRCRapportMediaEventsManager *)self mediaCommands];
      [v20 addObject:v19];

      if ((v3 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x400) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v13 = [TVRCButton alloc];
  uint64_t v30 = @"TVRCButtonSkipInterval";
  v31 = &unk_26DA63008;
  v14 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id v15 = [(TVRCButton *)v13 _initWithButtonType:7 hasTapAction:1 properties:v14];

  id v16 = [(TVRCRapportMediaEventsManager *)self mediaCommands];
  [v16 addObject:v15];

  if ((v3 & 4) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if ((v3 & 8) != 0)
  {
LABEL_14:
    id v21 = [TVRCButton alloc];
    if ((v3 & 0x20) != 0)
    {
      uint64_t v23 = 1;
      int v22 = v8;
    }
    else
    {
      int v22 = (void *)MEMORY[0x263EFFA78];
      uint64_t v23 = 0;
    }
    id v24 = [(TVRCButton *)v21 _initWithButtonType:9 hasTapAction:v23 properties:v22];
    v25 = [(TVRCRapportMediaEventsManager *)self mediaCommands];
    [v25 addObject:v24];
  }
LABEL_18:
  id v26 = _TVRCMediaEventsLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [(TVRCRapportMediaEventsManager *)self mediaCommands];
    __int16 v28 = [v27 allObjects];
    double v29 = [v28 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v37 = v29;
    _os_log_impl(&dword_2266D3000, v26, OS_LOG_TYPE_DEFAULT, "Supported media commands \n%{public}@", buf, 0xCu);
  }
}

- (int)_commandForMediaButtonEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 button];
  v5 = [v4 properties];

  switch([v3 eventType])
  {
    case 0:
    case 3:
      uint64_t v6 = [v3 button];
      uint64_t v7 = [v6 buttonType];
      goto LABEL_7;
    case 1:
      uint64_t v9 = _TVRCButtonLongPressBeginActionKey;
      goto LABEL_6;
    case 2:
      uint64_t v9 = _TVRCButtonLongPressEndActionKey;
LABEL_6:
      uint64_t v6 = [v5 objectForKey:*v9];
      uint64_t v7 = [v6 integerValue];
LABEL_7:
      uint64_t v10 = v7;

      if (v10 <= 199)
      {
        switch(v10)
        {
          case 6:
          case 7:
            int v11 = 7;
            break;
          case 8:
            int v11 = 3;
            break;
          case 9:
            int v11 = 4;
            break;
          default:
            if (v10 == 31) {
              int v11 = 7;
            }
            else {
              int v11 = 0;
            }
            break;
        }
LABEL_24:
        id v12 = _TVRCMediaEventsLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = off_2647AFDB8[v11];
          int v15 = 136315650;
          id v16 = "-[TVRCRapportMediaEventsManager _commandForMediaButtonEvent:]";
          __int16 v17 = 2114;
          id v18 = v3;
          __int16 v19 = 2080;
          uint64_t v20 = v13;
          _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "%s event=%{public}@, command=%s", (uint8_t *)&v15, 0x20u);
        }

        int v8 = v11;
      }
      else
      {
        switch(v10)
        {
          case 200:
            int v11 = 8;
            goto LABEL_24;
          case 201:
            int v11 = 9;
            goto LABEL_24;
          case 202:
            int v11 = 10;
            goto LABEL_24;
          case 203:
            int v11 = 11;
            goto LABEL_24;
          case 204:
            int v11 = 1;
            goto LABEL_24;
          case 205:
            int v11 = 2;
            goto LABEL_24;
          default:
            int v11 = 0;
            int v8 = 0;
            if (v10 != 9999) {
              goto LABEL_24;
            }
            break;
        }
      }
      break;
    default:
      int v8 = 0;
      break;
  }

  return v8;
}

- (int)_captionSettingForButtonEvent:(id)a3
{
  id v3 = [a3 button];
  uint64_t v4 = [v3 buttonType];

  if ((unint64_t)(v4 - 16) > 2) {
    return 0;
  }
  else {
    return dword_226798B18[v4 - 16];
  }
}

- (void)_refreshCaptionState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (![(TVRCRapportMediaEventsManager *)self supportsDirectCaptionQueries])
  {
    id v3 = _TVRCMediaEventsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v8 = "-[TVRCRapportMediaEventsManager _refreshCaptionState]";
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    uint64_t v4 = [(TVRCRapportMediaEventsManager *)self mediaSession];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke;
    v5[3] = &unk_2647AFD28;
    objc_copyWeak(&v6, (id *)buf);
    [v4 mediaCaptionSettingGetFromDestinationID:*MEMORY[0x263F62C08] completion:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _TVRCMediaEventsLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke_cold_1((uint64_t)v5, v7);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 4) {
      int v8 = "?";
    }
    else {
      int v8 = off_2647AFE18[(int)a2];
    }
    int v12 = 136315138;
    uint64_t v13 = v8;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Current caption setting is %s", (uint8_t *)&v12, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    [WeakRetained setCurrentSetting:a2];
    uint64_t v10 = [v7 eventHandler];

    if (v10)
    {
      int v11 = [v7 eventHandler];
      v11[2]();
    }
    goto LABEL_4;
  }
LABEL_5:
}

- (id)supportedCaptionEvents
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  int v4 = [(TVRCRapportMediaEventsManager *)self currentSetting];
  if (v4 <= 3)
  {
    id v5 = [[TVRCButton alloc] _initWithButtonType:qword_226798B28[v4] hasTapAction:1 properties:0];
    [v3 addObject:v5];
  }
  id v6 = _TVRCMediaEventsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(TVRCRapportMediaEventsManager *)self currentSetting];
    if (v7 > 4) {
      int v8 = "?";
    }
    else {
      int v8 = off_2647AFE18[v7];
    }
    uint64_t v9 = [v3 allObjects];
    uint64_t v10 = [v9 componentsJoinedByString:@"\n"];
    int v13 = 136315394;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Supported Caption Events for current settings=%s, events=\n%{public}@", (uint8_t *)&v13, 0x16u);
  }
  int v11 = [MEMORY[0x263EFFA08] setWithSet:v3];

  return v11;
}

- (NSSet)volumeCommands
{
  return self->_volumeCommands;
}

- (void)setVolumeCommands:(id)a3
{
}

- (NSMutableSet)mediaCommands
{
  return self->_mediaCommands;
}

- (void)setMediaCommands:(id)a3
{
}

- (RPMediaControlSession)mediaSession
{
  return self->_mediaSession;
}

- (void)setMediaSession:(id)a3
{
}

- (BOOL)supportsDirectCaptionQueries
{
  return self->_supportsDirectCaptionQueries;
}

- (void)setSupportsDirectCaptionQueries:(BOOL)a3
{
  self->_supportsDirectCaptionQueries = a3;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (int)currentSetting
{
  return self->_currentSetting;
}

- (void)setCurrentSetting:(int)a3
{
  self->_currentSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_storeStrong((id *)&self->_mediaCommands, 0);

  objc_storeStrong((id *)&self->_volumeCommands, 0);
}

void __103__TVRCRapportMediaEventsManager_initWithCompanionLinkClient_supportsDirectCaptionQueries_eventHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Could not create mediaSession for companionLinkClient <%{public}@>, error - %{public}@");
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Could not set media caption setting for companionLinkClient, error - %{public}@", (uint8_t *)&v2, 0xCu);
}

void __48__TVRCRapportMediaEventsManager_sendMediaEvent___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Could not send %s, error=%{public}@");
}

void __53__TVRCRapportMediaEventsManager__refreshCaptionState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Could not get current caption settings error= %{public}@", (uint8_t *)&v2, 0xCu);
}

@end