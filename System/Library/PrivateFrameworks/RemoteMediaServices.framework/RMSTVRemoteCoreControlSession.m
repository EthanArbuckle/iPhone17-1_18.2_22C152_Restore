@interface RMSTVRemoteCoreControlSession
- (BOOL)deviceShouldAllowConnectionAuthentication:(id)a3;
- (RMSControlSessionDelegate)delegate;
- (RMSService)service;
- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5;
- (void)connectToService:(id)a3 pairingGUID:(id)a4 allowPairing:(BOOL)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5;
- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4;
- (void)deviceConnected:(id)a3;
- (void)logout;
- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4;
- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4;
- (void)sendNavigationCommand:(int64_t)a3;
- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4;
- (void)sendText:(id)a3 completionHandler:(id)a4;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6;
- (void)setVolume:(float)a3 completionHandler:(id)a4;
@end

@implementation RMSTVRemoteCoreControlSession

- (void)dealloc
{
  [(TVRCDevice *)self->_device disconnectWithType:0];
  v3.receiver = self;
  v3.super_class = (Class)RMSTVRemoteCoreControlSession;
  [(RMSTVRemoteCoreControlSession *)&v3 dealloc];
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 allowPairing:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  objc_storeStrong((id *)&self->_service, a3);
  self->_allowPairing = a5;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __93__RMSTVRemoteCoreControlSession_connectToService_pairingGUID_allowPairing_completionHandler___block_invoke;
  v23[3] = &unk_264E74AB8;
  id v12 = v11;
  BOOL v25 = a5;
  v23[4] = self;
  id v24 = v12;
  v13 = (void (**)(void, void))MEMORY[0x23ECE8BF0](v23);
  v14 = [v10 device];

  if (v14)
  {
    v15 = [v10 device];
    ((void (**)(void, void *))v13)[2](v13, v15);
  }
  else
  {
    v16 = RMSLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v10 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl(&dword_23C83A000, v16, OS_LOG_TYPE_DEFAULT, "Will discoverDeviceWithIdentifier: %@", buf, 0xCu);
    }
    v18 = +[RMSTVRemoteCoreDeviceController sharedController];
    v19 = [v10 uniqueIdentifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __93__RMSTVRemoteCoreControlSession_connectToService_pairingGUID_allowPairing_completionHandler___block_invoke_1;
    v20[3] = &unk_264E74AE0;
    id v21 = v10;
    v22 = v13;
    [v18 discoverDeviceWithIdentifier:v19 timeout:v20 completionHandler:5.0];

    v15 = v21;
  }
}

void __93__RMSTVRemoteCoreControlSession_connectToService_pairingGUID_allowPairing_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  v5 = v4;
  if (v4)
  {
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_9;
    }
    if ([v4 pairingCapability])
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6)
      {
        v7 = *(void (**)(void))(v6 + 16);
LABEL_14:
        v7();
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (!*(unsigned char *)(a1 + 48))
    {
LABEL_9:
      if (([v5 isPaired] & 1) == 0)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        if (v12)
        {
          v7 = *(void (**)(void))(v12 + 16);
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 16) setDelegate:0];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
    uint64_t v9 = MEMORY[0x23ECE8BF0](*(void *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = v9;

    if ([v5 connectionState] == 2)
    {
      [*(id *)(a1 + 32) deviceConnected:v5];
    }
    else
    {
      v13 = RMSLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        v15 = v5;
        _os_log_impl(&dword_23C83A000, v13, OS_LOG_TYPE_DEFAULT, "device: %@ connect", (uint8_t *)&v14, 0xCu);
      }

      [v5 connect];
    }
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    v7 = *(void (**)(void))(v8 + 16);
    goto LABEL_14;
  }
LABEL_15:
}

void __93__RMSTVRemoteCoreControlSession_connectToService_pairingGUID_allowPairing_completionHandler___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = RMSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "Did discoverDeviceWithIdentifier: %@ device: %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)logout
{
}

- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)setVolume:(float)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, float))a4 + 2))(a4, 0, a3);
  }
}

- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6
{
  if (a6) {
    (*((void (**)(id, void))a6 + 2))(a6, 0);
  }
}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_23C8C1DB0[a3];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(TVRCDevice *)self->_device supportedButtons];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v6 == [v12 buttonType])
        {
          v13 = [MEMORY[0x263F7C990] buttonEventForButton:v12 eventType:0];

          if (v13)
          {
            if (a4 + 1 < 3) {
              uint64_t v14 = a4 + 1;
            }
            else {
              uint64_t v14 = 3;
            }
            if (v14)
            {
              do
              {
                [(TVRCDevice *)self->_device sendButtonEvent:v13];
                --v14;
              }
              while (v14);
            }
          }
          goto LABEL_19;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v13 = 0;
LABEL_19:
}

- (void)sendNavigationCommand:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_23C8C1DD0[a3];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(TVRCDevice *)self->_device supportedButtons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if (v4 == [v10 buttonType]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_6;
        }
        goto LABEL_15;
      }
    }
    uint64_t v11 = [MEMORY[0x263F7C990] buttonEventForButton:v10 eventType:0];

    if (!v11) {
      return;
    }
    [(TVRCDevice *)self->_device sendButtonEvent:v11];
    v5 = (void *)v11;
  }
LABEL_15:
}

- (void)sendText:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (BOOL)deviceShouldAllowConnectionAuthentication:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "deviceShouldAllowConnectionAuthentication: %@", (uint8_t *)&v8, 0xCu);
  }

  BOOL allowPairing = self->_allowPairing;
  return allowPairing;
}

- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "device: %@ encounteredAuthenticationChallenge: %@", buf, 0x16u);
  }

  id v9 = objc_alloc_init(RMSPairingCredentials);
  [(RMSPairingCredentials *)v9 setRequirementType:1];
  [(RMSPairingCredentials *)v9 setCharacterCount:4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__RMSTVRemoteCoreControlSession_device_encounteredAuthenticationChallenge___block_invoke;
  v12[3] = &unk_264E74B08;
  id v13 = v7;
  id v11 = v7;
  [WeakRetained controlSession:self didReceivePairingChallengeRequestWithCredentials:v9 completionHandler:v12];
}

void __75__RMSTVRemoteCoreControlSession_device_encounteredAuthenticationChallenge___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = RMSLogger();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "challenge: %@ cancel", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) cancel];
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "challenge: %@ userEnteredCodeLocally: %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) userEnteredCodeLocally:v5];
  }
}

- (void)deviceConnected:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "deviceConnected: %@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_connectionResponseBlock)
  {
    id v6 = objc_alloc_init(RMSControlInterface);
    [(RMSControlInterface *)v6 setSupportsSpeakerSelection:0];
    [(RMSControlInterface *)v6 setSupportsVolumeControl:0];
    [(RMSControlInterface *)v6 setSupportsDirectionalControl:1];
    (*((void (**)(void))self->_connectionResponseBlock + 2))();
    id connectionResponseBlock = self->_connectionResponseBlock;
    self->_id connectionResponseBlock = 0;
  }
}

- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = RMSLogger();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412802;
      id v18 = v8;
      __int16 v19 = 2048;
      int64_t v20 = a4;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl(&dword_23C83A000, v11, OS_LOG_TYPE_ERROR, "device: %@ disconnectedForReason: %ld error: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "device: %@ disconnectedForReason: %ld", (uint8_t *)&v17, 0x16u);
  }

  if (self->_connectionResponseBlock)
  {
    switch(a4)
    {
      case 4:
        id v13 = [v9 domain];
        int v14 = [v13 isEqualToString:*MEMORY[0x263F7CA50]];

        if (v14 && [v9 code] == 201)
        {
          id v15 = [v9 userInfo];
          __int16 v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F7CA58]];
          [v16 intValue];
        }
        break;
      default:
        break;
    }
    (*((void (**)(void))self->_connectionResponseBlock + 2))();
    id connectionResponseBlock = self->_connectionResponseBlock;
    self->_id connectionResponseBlock = 0;
  }
  else
  {
    id connectionResponseBlock = objc_loadWeakRetained((id *)&self->_delegate);
    [connectionResponseBlock controlSessionDidEnd:self];
  }
}

- (RMSControlSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSControlSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RMSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_connectionResponseBlock, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end