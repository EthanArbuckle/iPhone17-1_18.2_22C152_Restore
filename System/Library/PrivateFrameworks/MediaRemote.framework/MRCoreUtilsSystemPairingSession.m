@interface MRCoreUtilsSystemPairingSession
+ (BOOL)systemPairingAvailable;
+ (id)globalPairingQueue;
+ (id)pairingManager;
- (BOOL)shouldAutoRetryPairingExchange:(id)a3;
- (MRDeviceInfo)_createPeerDeviceFromPairedPeer:(uint64_t)a1;
- (id)addPeer;
- (id)initializePairingSession:(PairingSessionPrivate *)a3;
- (id)mediaRemotePairedDevices;
- (id)pairedPeerDevice;
- (id)pairedPeerDevices;
- (id)removePeer;
- (id)updateMediaRemotePairedDevice:(id)a1;
- (id)updatePeer;
@end

@implementation MRCoreUtilsSystemPairingSession

- (id)initializePairingSession:(PairingSessionPrivate *)a3
{
  return 0;
}

- (BOOL)shouldAutoRetryPairingExchange:(id)a3
{
  return 0;
}

- (id)addPeer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRCryptoPairingSession *)self device];
    int v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils-System)] Pairing Device %@", (uint8_t *)&v11, 0xCu);
  }
  v5 = [MRCoreUtilsPairingSession alloc];
  v6 = [(MRCryptoPairingSession *)self device];
  v7 = [(MRCoreUtilsPairingSession *)v5 initWithRole:0 device:v6];

  [(MRCoreUtilsPairingSession *)v7 open];
  id v8 = [(MRCoreUtilsPairingSession *)v7 removePeer];
  v9 = [(MRCoreUtilsSystemPairingSession *)self updatePeer];

  return v9;
}

- (id)removePeer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRCryptoPairingSession *)self device];
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils-System)] Unpairing Device %@", (uint8_t *)&v8, 0xCu);
  }
  v5 = [(MRCryptoPairingSession *)self device];

  if (v5) {
    -[MRCoreUtilsSystemPairingSession updateMediaRemotePairedDevice:](self, 0);
  }
  else {
  v6 = MRCreateCryptoError(@"Cannot remove peer, No device available");
  }

  return v6;
}

- (id)updateMediaRemotePairedDevice:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy_;
    v54 = __Block_byref_object_dispose_;
    id v55 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    id v49 = 0;
    v4 = [(id)objc_opt_class() pairingManager];
    if (v4)
    {
      v5 = [a1 peerIdentifier];
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke;
      v41[3] = &unk_1E57D0590;
      v43 = &v50;
      v7 = v6;
      v42 = v7;
      [v4 setInvalidationHandler:v41];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_2;
      v38[3] = &unk_1E57D0590;
      v40 = &v50;
      int v8 = v7;
      v39 = v8;
      [v4 setInterruptionHandler:v38];
      v9 = [a1 device];
      uint64_t v10 = [v9 identifier];

      int v11 = [a1 device];
      v12 = [v11 name];

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_3;
      v31[3] = &unk_1E57D05B8;
      id v13 = v10;
      id v32 = v13;
      id v14 = v5;
      id v33 = v14;
      id v15 = v3;
      id v34 = v15;
      id v16 = v12;
      id v35 = v16;
      v37 = &v44;
      v17 = v8;
      v36 = v17;
      [v4 getPairedPeersWithOptions:4 completion:v31];
      dispatch_time_t v18 = dispatch_time(0, 7000000000);
      dispatch_semaphore_wait(v17, v18);
      if (v45[5])
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        v27 = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_4;
        v28 = &unk_1E57D05E0;
        v30 = &v50;
        v19 = v17;
        v29 = v19;
        v20 = (void *)MEMORY[0x1997190F0](&v25);
        uint64_t v21 = v45[5];
        if (v15) {
          objc_msgSend(v4, "savePairedPeer:options:completion:", v21, 4, v20, v25, v26, v27, v28);
        }
        else {
          objc_msgSend(v4, "removePairedPeer:options:completion:", v21, 4, v20, v25, v26, v27, v28);
        }
        dispatch_time_t v23 = dispatch_time(0, 7000000000);
        dispatch_semaphore_wait(v19, v23);
      }
      [v4 setInterruptionHandler:0];
      [v4 setInvalidationHandler:0];
      [v4 invalidate];
    }
    else
    {
      uint64_t v22 = MRCreateCryptoError(@"Does not have required entitlements");
      id v14 = (id)v51[5];
      v51[5] = v22;
    }

    a1 = (id)v51[5];
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(&v50, 8);
  }

  return a1;
}

- (id)updatePeer
{
  id v3 = [(MRCryptoPairingSession *)self device];

  if (v3)
  {
    v4 = [(MRCryptoPairingSession *)self device];
    v5 = -[MRCoreUtilsSystemPairingSession updateMediaRemotePairedDevice:](self, v4);
  }
  else
  {
    v5 = MRCreateCryptoError(@"Cannot update peer, No device available");
  }

  return v5;
}

- (id)pairedPeerDevice
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v3 = [(MRCoreUtilsSystemPairingSession *)self pairedPeerDevices];
  v4 = [(MRCoreUtilsSystemPairingSession *)self mediaRemotePairedDevices];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MRCoreUtilsSystemPairingSession_pairedPeerDevice__block_invoke;
  v8[3] = &unk_1E57D04F0;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = &v11;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __51__MRCoreUtilsSystemPairingSession_pairedPeerDevice__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) device];
  uint64_t v10 = [v9 identifier];
  uint64_t v11 = [v8 identifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    uint64_t v21 = a4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          dispatch_time_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v19 = [v18 identifier];
          int v20 = [v19 isEqualToString:v7];

          if (v20)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v18);
            *uint64_t v21 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)pairedPeerDevices
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  long long v22 = __Block_byref_object_dispose_;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(id)objc_opt_class() pairingManager];
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke;
    v16[3] = &unk_1E57D0518;
    id v5 = v4;
    v17 = v5;
    [v3 setInvalidationHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_2;
    v14[3] = &unk_1E57D0518;
    id v6 = v5;
    uint64_t v15 = v6;
    [v3 setInterruptionHandler:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_3;
    v11[3] = &unk_1E57D0540;
    id v13 = &v18;
    v11[4] = self;
    id v7 = v6;
    int v12 = v7;
    [v3 getPairedPeersWithOptions:4 completion:v11];
    dispatch_time_t v8 = dispatch_time(0, 7000000000);
    dispatch_semaphore_wait(v7, v8);
    [v3 setInterruptionHandler:0];
    [v3 setInvalidationHandler:0];
    [v3 invalidate];
  }
  id v9 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v9;
}

intptr_t __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_time_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v9 = -[MRCoreUtilsSystemPairingSession _createPeerDeviceFromPairedPeer:](*(void *)(a1 + 32), *(void **)(*((void *)&v10 + 1) + 8 * v7));
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (MRDeviceInfo)_createPeerDeviceFromPairedPeer:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    uint64_t v5 = objc_alloc_init(MRDeviceInfo);
    uint64_t v6 = [v4 identifier];
    uint64_t v7 = [v6 UUIDString];
    [(MRDeviceInfo *)v5 setIdentifier:v7];

    dispatch_time_t v8 = [v4 name];
    [(MRDeviceInfo *)v5 setName:v8];

    id v9 = [v4 model];
    [(MRDeviceInfo *)v5 setLocalizedModelName:v9];
  }
  return v5;
}

- (id)mediaRemotePairedDevices
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [(id)objc_opt_class() pairingManager];
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke;
    v18[3] = &unk_1E57D0518;
    uint64_t v5 = v4;
    v19 = v5;
    [v3 setInvalidationHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_2;
    v16[3] = &unk_1E57D0518;
    uint64_t v6 = v5;
    v17 = v6;
    [v3 setInterruptionHandler:v16];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_3;
    long long v13 = &unk_1E57D0568;
    id v14 = v2;
    uint64_t v15 = v6;
    uint64_t v7 = v6;
    [v3 getPairedPeersWithOptions:4 completion:&v10];
    dispatch_time_t v8 = dispatch_time(0, 7000000000);
    dispatch_semaphore_wait(v7, v8);
    objc_msgSend(v3, "setInterruptionHandler:", 0, v10, v11, v12, v13);
    [v3 setInvalidationHandler:0];
    [v3 invalidate];
  }

  return v2;
}

intptr_t __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a2;
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v16 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v6 = [v5 info];
        uint64_t v7 = [v6 objectForKey:@"MediaRemote_ExtendedInfo"];
        dispatch_time_t v8 = [v7 objectForKey:@"MediaRemote_PeerIdentifier"];
        id v9 = [v7 objectForKey:@"MediaRemote_PeerName"];
        if (v8)
        {
          uint64_t v10 = objc_alloc_init(MRDeviceInfo);
          [(MRDeviceInfo *)v10 setIdentifier:v8];
          [(MRDeviceInfo *)v10 setName:v9];
          uint64_t v11 = *(void **)(a1 + 32);
          long long v12 = [v5 identifier];
          long long v13 = [v12 UUIDString];
          [v11 setObject:v10 forKey:v13];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = MRCreateCryptoError(@"CUPairingManager Invalidation");
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v5);
}

intptr_t __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = MRCreateCryptoError(@"CUPairingManager Interuption");
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v5);
}

void __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v16 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v7 = [v6 info];
        dispatch_time_t v8 = [v7 objectForKey:@"MediaRemote_ExtendedInfo"];
        id v9 = [v8 objectForKey:@"MediaRemote_PeerIdentifier"];
        if ([v9 isEqualToString:*(void *)(a1 + 32)]) {
          goto LABEL_21;
        }
        uint64_t v10 = *(void **)(a1 + 40);
        uint64_t v11 = [v6 identifier];
        long long v12 = [v11 UUIDString];
        LODWORD(v10) = [v10 isEqualToString:v12];

        if (v10)
        {
LABEL_21:
          if (*(void *)(a1 + 48))
          {
            id v13 = (id)[v7 mutableCopy];
            if (!v13) {
              id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            id v14 = (id)[v8 mutableCopy];
            if (!v14) {
              id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            [v14 setObject:*(void *)(a1 + 32) forKey:@"MediaRemote_PeerIdentifier"];
            [v14 setObject:*(void *)(a1 + 56) forKey:@"MediaRemote_PeerName"];
            [v13 setObject:v14 forKey:@"MediaRemote_ExtendedInfo"];
            [v6 setInfo:v13];
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v6);

          goto LABEL_18;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  if (!v6) {
    objc_storeStrong(v5, a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)systemPairingAvailable
{
  if (systemPairingAvailable___once != -1) {
    dispatch_once(&systemPairingAvailable___once, &__block_literal_global_2);
  }
  return systemPairingAvailable_supportsSystemPairing;
}

uint64_t __57__MRCoreUtilsSystemPairingSession_systemPairingAvailable__block_invoke()
{
  if (MRProcessIsMediaRemoteDaemon())
  {
    uint64_t result = 1;
  }
  else
  {
    v1 = (void *)MRGetSharedService();
    uint64_t result = MRMediaRemoteServiceSupportsSystemPairing(v1);
  }
  systemPairingAvailable_supportsSystemPairing = result;
  return result;
}

+ (id)pairingManager
{
  if ([a1 systemPairingAvailable])
  {
    id v2 = objc_alloc_init((Class)MSVWeakLinkClass());
    uint64_t v3 = +[MRCoreUtilsSystemPairingSession globalPairingQueue]();
    [v2 setDispatchQueue:v3];
  }
  else
  {
    uint64_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils-System)] Pairing Manager not available due to lacking entitlements", v6, 2u);
    }

    id v2 = 0;
  }

  return v2;
}

+ (id)globalPairingQueue
{
  self;
  if (globalPairingQueue___once != -1) {
    dispatch_once(&globalPairingQueue___once, &__block_literal_global_32);
  }
  v0 = (void *)globalPairingQueue___queue;

  return v0;
}

void __53__MRCoreUtilsSystemPairingSession_globalPairingQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaRemote.MRCoreUtilsSystemPairingSession.GlobalQueue", v2);
  v1 = (void *)globalPairingQueue___queue;
  globalPairingQueue___queue = (uint64_t)v0;
}

@end