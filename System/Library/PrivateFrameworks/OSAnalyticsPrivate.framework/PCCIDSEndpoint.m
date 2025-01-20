@interface PCCIDSEndpoint
- (BOOL)isDeviceNearby:(id)a3;
- (PCCIDSEndpoint)init;
- (id)deviceIds;
- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)send:(id)a3 message:(id)a4 error:(id *)a5;
- (id)serviceByDeviceID:(id)a3;
- (id)startService:(id)a3;
- (void)runWithDelegate:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
@end

@implementation PCCIDSEndpoint

- (PCCIDSEndpoint)init
{
  if (objc_opt_class())
  {
    v7.receiver = self;
    v7.super_class = (Class)PCCIDSEndpoint;
    v3 = [(PCCIDSEndpoint *)&v7 init];
    if (v3)
    {
      uint64_t v4 = objc_opt_new();
      serviceByDevice = v3->_serviceByDevice;
      v3->_serviceByDevice = (NSMutableDictionary *)v4;
    }
  }
  else
  {

    return 0;
  }
  return v3;
}

- (void)runWithDelegate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PCCIDSEndpoint;
  [(PCCEndpoint *)&v9 runWithDelegate:a3];
  uint64_t v4 = [(PCCIDSEndpoint *)self startService:@"com.apple.private.alloy.proxiedcrashcopier"];
  pairedWatchService = self->_pairedWatchService;
  self->_pairedWatchService = v4;

  v6 = [(PCCIDSEndpoint *)self startService:@"com.apple.private.alloy.proxiedcrashcopier.icloud"];
  homeDeviceService = self->_homeDeviceService;
  self->_homeDeviceService = v6;

  id v8 = [(PCCIDSEndpoint *)self deviceIds];
  if (*(_OWORD *)&self->_pairedWatchService == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[PCCIDSEndpoint runWithDelegate:]();
  }
}

- (id)startService:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F6AB88]) initWithService:v4];
  v6 = [v5 accounts];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [v5 addDelegate:self queue:MEMORY[0x1E4F14428]];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 accounts];
      int v9 = [v8 count];
      v10 = [v5 devices];
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 1024;
      int v15 = v9;
      __int16 v16 = 1024;
      int v17 = [v10 count];
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "IDS(%@) connected with %d accounts and %d devices", (uint8_t *)&v12, 0x18u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "IDS(%@) connected with no accounts.", (uint8_t *)&v12, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (id)deviceIds
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_serviceByDevice removeAllObjects];
  if (*(_OWORD *)&self->_pairedWatchService == 0)
  {
    v44 = 0;
  }
  else
  {
    id v58 = [MEMORY[0x1E4F1CA48] array];
    v3 = [(IDSService *)self->_pairedWatchService devices];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, " # Name/DeviceID        Model                Build      Near Pair Cntd Actv iCld", buf, 2u);
    }
    v57 = self;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v71 = @"com.apple.private.alloy.proxiedcrashcopier";
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@:", buf, 0xCu);
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obuint64_t j = v3;
    id v4 = v58;
    uint64_t v55 = [obj countByEnumeratingWithState:&v63 objects:v88 count:16];
    if (v55)
    {
      uint64_t v52 = *(void *)v64;
      uint64_t v45 = 138412290;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v64 != v52) {
            objc_enumerationMutation(obj);
          }
          v6 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v7 = (void *)IDSCopyIDForDevice();
          int v8 = [v4 count];
          v87[0] = v7;
          v86[0] = @"id";
          v86[1] = @"name";
          int v9 = [v6 name];
          v87[1] = v9;
          v86[2] = @"model";
          v10 = [v6 modelIdentifier];
          v87[2] = v10;
          v86[3] = @"build";
          v11 = [v6 productBuildVersion];
          v87[3] = v11;
          v86[4] = @"nearby";
          int v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isNearby"));
          v86[5] = @"service";
          v87[4] = v12;
          v87[5] = @"com.apple.private.alloy.proxiedcrashcopier";
          id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:6];
          [v4 addObject:v13];

          [(NSMutableDictionary *)v57->_serviceByDevice setObject:v57->_pairedWatchService forKeyedSubscript:v7];
          __int16 v14 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            v49 = [v6 name];
            id v47 = [v6 modelIdentifier];
            int v15 = [v6 productBuildVersion];
            if ([v6 isNearby]) {
              __int16 v16 = @"YES";
            }
            else {
              __int16 v16 = @" NO";
            }
            if (objc_msgSend(v6, "isLocallyPaired", v45)) {
              int v17 = @"YES";
            }
            else {
              int v17 = @" NO";
            }
            if ([v6 isConnected]) {
              uint64_t v18 = @"YES";
            }
            else {
              uint64_t v18 = @" NO";
            }
            if ([v6 isActive]) {
              v19 = @"YES";
            }
            else {
              v19 = @" NO";
            }
            int v20 = [v6 isCloudConnected];
            *(_DWORD *)buf = 67111170;
            if (v20) {
              v21 = @"YES";
            }
            else {
              v21 = @" NO";
            }
            *(_DWORD *)v71 = v8 + 1;
            *(_WORD *)&v71[4] = 2112;
            *(void *)&v71[6] = v49;
            __int16 v72 = 2112;
            id v73 = v47;
            __int16 v74 = 2112;
            v75 = v15;
            __int16 v76 = 2112;
            v77 = v16;
            __int16 v78 = 2112;
            v79 = v17;
            __int16 v80 = 2112;
            v81 = v18;
            id v4 = v58;
            __int16 v82 = 2112;
            v83 = v19;
            __int16 v14 = MEMORY[0x1E4F14500];
            __int16 v84 = 2112;
            v85 = v21;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%2d %-20@ %-20@ %-10@ %@  %@  %@  %@  %@", buf, 0x58u);
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v45;
            *(void *)v71 = v7;
            _os_log_impl(&dword_1DBFFE000, v14, OS_LOG_TYPE_DEFAULT, "   %@", buf, 0xCu);
          }
        }
        uint64_t v55 = [obj countByEnumeratingWithState:&v63 objects:v88 count:16];
      }
      while (v55);
    }

    v22 = v57;
    v23 = [(IDSService *)v57->_homeDeviceService devices];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v71 = @"com.apple.private.alloy.proxiedcrashcopier.icloud";
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@:", buf, 0xCu);
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v48 = v23;
    uint64_t v54 = [v48 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v60;
      v24 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v60 != v53) {
            objc_enumerationMutation(v48);
          }
          v26 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          v27 = (void *)IDSCopyIDForDevice();
          int v28 = [v58 count];
          v29 = [(NSMutableDictionary *)v22->_serviceByDevice objectForKeyedSubscript:v27];

          if (v29)
          {
            int v56 = -1;
          }
          else
          {
            int v56 = v28 + 1;
            v68[0] = v27;
            v67[0] = @"id";
            v67[1] = @"name";
            v30 = [v26 name];
            v68[1] = v30;
            v67[2] = @"model";
            v31 = [v26 modelIdentifier];
            v68[2] = v31;
            v67[3] = @"build";
            v32 = [v26 productBuildVersion];
            v68[3] = v32;
            v67[4] = @"nearby";
            v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v26, "isNearby"));
            v67[5] = @"service";
            v68[4] = v33;
            v68[5] = @"com.apple.private.alloy.proxiedcrashcopier.icloud";
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:6];
            v35 = v34 = v22;
            [v58 addObject:v35];

            v22 = v34;
            v24 = MEMORY[0x1E4F14500];

            [(NSMutableDictionary *)v22->_serviceByDevice setObject:v22->_homeDeviceService forKeyedSubscript:v27];
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v51 = [v26 name];
            v50 = [v26 modelIdentifier];
            v36 = [v26 productBuildVersion];
            if ([v26 isNearby]) {
              v37 = @"YES";
            }
            else {
              v37 = @" NO";
            }
            if ([v26 isLocallyPaired]) {
              v38 = @"YES";
            }
            else {
              v38 = @" NO";
            }
            if ([v26 isConnected]) {
              v39 = @"YES";
            }
            else {
              v39 = @" NO";
            }
            if ([v26 isActive]) {
              v40 = @"YES";
            }
            else {
              v40 = @" NO";
            }
            int v41 = [v26 isCloudConnected];
            *(_DWORD *)buf = 67111170;
            if (v41) {
              v42 = @"YES";
            }
            else {
              v42 = @" NO";
            }
            *(_DWORD *)v71 = v56;
            *(_WORD *)&v71[4] = 2112;
            *(void *)&v71[6] = v51;
            __int16 v72 = 2112;
            id v73 = v50;
            __int16 v74 = 2112;
            v75 = v36;
            __int16 v76 = 2112;
            v77 = v37;
            __int16 v78 = 2112;
            v79 = v38;
            __int16 v80 = 2112;
            v81 = v39;
            __int16 v82 = 2112;
            v83 = v40;
            v24 = MEMORY[0x1E4F14500];
            v22 = v57;
            __int16 v84 = 2112;
            v85 = v42;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%2d %-20@ %-20@ %-10@ %@  %@  %@  %@  %@", buf, 0x58u);
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v71 = v27;
            _os_log_impl(&dword_1DBFFE000, v24, OS_LOG_TYPE_DEFAULT, "   %@", buf, 0xCu);
          }
        }
        uint64_t v54 = [v48 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }
      while (v54);
    }

    v44 = v58;
  }
  return v44;
}

- (id)serviceByDeviceID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ![v4 isEqualToString:*MEMORY[0x1E4F6A870]])
  {
    homeDeviceService = [(NSMutableDictionary *)self->_serviceByDevice objectForKeyedSubscript:v5];
  }
  else
  {
    homeDeviceService = self->_pairedWatchService;
  }
  uint64_t v7 = homeDeviceService;
  if (!homeDeviceService) {
    homeDeviceService = self->_homeDeviceService;
  }
  int v8 = homeDeviceService;

  return v8;
}

- (BOOL)isDeviceNearby:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PCCIDSEndpoint *)self serviceByDeviceID:v4];
  v6 = v5;
  if (v5)
  {
    [v5 devices];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (v4)
          {
            int v12 = [v11 uniqueID];
            char v13 = [v4 isEqualToString:v12];

            if (v13) {
              goto LABEL_14;
            }
          }
          else if (objc_msgSend(v11, "isDefaultPairedDevice", (void)v15))
          {
LABEL_14:
            LOBYTE(v8) = objc_msgSend(v11, "isNearby", (void)v15);
            goto LABEL_15;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)send:(id)a3 message:(id)a4 error:(id *)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PCCIDSEndpoint *)self serviceByDeviceID:v8];
  if (v10)
  {
    if (v8) {
      id v11 = v8;
    }
    else {
      id v11 = (id)*MEMORY[0x1E4F6A870];
    }
    int v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    pairedWatchService = self->_pairedWatchService;
    if (v10 == pairedWatchService) {
      uint64_t v14 = 200;
    }
    else {
      uint64_t v14 = 300;
    }
    if (v10 == pairedWatchService)
    {
      uint64_t v17 = *MEMORY[0x1E4F6A970];
      v29[0] = *MEMORY[0x1E4F6A9A8];
      v29[1] = v17;
      v30[0] = MEMORY[0x1E4F1CC38];
      v30[1] = MEMORY[0x1E4F1CC38];
      long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    }
    else
    {
      long long v15 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v23 = 0;
    id v24 = 0;
    int v18 = [(IDSService *)v10 sendMessage:v9 toDestinations:v12 priority:v14 options:v15 identifier:&v24 error:&v23];
    id v16 = v24;
    id v19 = v23;
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [v9 objectForKeyedSubscript:@"messageType"];
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        __int16 v27 = 2112;
        id v28 = v16;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "sent %@, tracking: %@", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v9 objectForKeyedSubscript:@"messageType"];
        *(_DWORD *)buf = 138412546;
        v26 = v21;
        __int16 v27 = 2112;
        id v28 = v19;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "sendMessage FAILED for %@: %@", buf, 0x16u);
      }
      if (a5) {
        *a5 = v19;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Attempted to send message before connecting", buf, 2u);
    }
    id v16 = 0;
  }

  return v16;
}

- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [(PCCIDSEndpoint *)self serviceByDeviceID:v10];
  if (v13)
  {
    if (v10) {
      id v14 = v10;
    }
    else {
      id v14 = (id)*MEMORY[0x1E4F6A870];
    }
    long long v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    if (v13 == self->_pairedWatchService) {
      uint64_t v16 = 200;
    }
    else {
      uint64_t v16 = 300;
    }
    uint64_t v32 = *MEMORY[0x1E4F6AA30];
    v33[0] = MEMORY[0x1E4F1CC38];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    int v18 = (void *)[v17 mutableCopy];

    if (v13 == self->_pairedWatchService)
    {
      uint64_t v19 = MEMORY[0x1E4F1CC38];
      [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A9A8]];
      [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F6A970]];
      if ([(PCCEndpoint *)self fileTimeout])
      {
        uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PCCEndpoint fileTimeout](self, "fileTimeout"));
        [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F6AA08]];
      }
    }
    id v26 = 0;
    id v27 = 0;
    int v21 = [(IDSService *)v13 sendResourceAtURL:v11 metadata:v12 toDestinations:v15 priority:v16 options:v18 identifier:&v27 error:&v26];
    id v22 = v27;
    id v23 = v26;
    BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138543618;
        id v29 = v11;
        __int16 v30 = 2114;
        id v31 = v22;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "sent %{public}@, tracking: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v24)
      {
        *(_DWORD *)buf = 138543618;
        id v29 = v11;
        __int16 v30 = 2114;
        id v31 = v23;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "sendFile FAILED for %{public}@: %{public}@", buf, 0x16u);
      }
      if (a6) {
        *a6 = v23;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Attempted to send file before connecting", buf, 2u);
    }
    id v22 = 0;
  }

  return v22;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:incomingResourceAtURL:metadata:fromID:context:](v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained handleFile:v11 from:v13 metadata:v12];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:identifier:hasBeenDeliveredWithContext:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained ack:v7 result:1 error:0];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_serviceByDevice objectForKeyedSubscript:v13];

    if (!v14) {
      [(NSMutableDictionary *)self->_serviceByDevice setObject:v10 forKeyedSubscript:v13];
    }
  }
  long long v15 = [v12 objectForKeyedSubscript:@"messageType"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:incomingMessage:fromID:]((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained handleMessage:v12 from:v13];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = (__CFString *)a7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:identifier:didSendWithSuccess:error:](v8, (uint64_t)v10, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained ack:v10 result:v8 error:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceByDevice, 0);
  objc_storeStrong((id *)&self->_homeDeviceService, 0);
  objc_storeStrong((id *)&self->_pairedWatchService, 0);
}

- (void)runWithDelegate:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "FAIL: no IDS accounts. Ensure the service plist is in place and try restarting identityservicesd.", v0, 2u);
}

- (void)service:(void *)a1 account:incomingResourceAtURL:metadata:fromID:context:.cold.1(void *a1)
{
  v1 = [a1 path];
  v2 = [v1 lastPathComponent];
  OUTLINED_FUNCTION_0_0(&dword_1DBFFE000, MEMORY[0x1E4F14500], v3, "received file '%@'", v4, v5, v6, v7, 2u);
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 identifier:(uint64_t)a5 hasBeenDeliveredWithContext:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingMessage:(uint64_t)a5 fromID:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)service:(__CFString *)a3 account:identifier:didSendWithSuccess:error:.cold.1(char a1, uint64_t a2, __CFString *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "OK";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "FAILED";
  }
  uint64_t v4 = &stru_1F360EEC0;
  int v5 = 136315650;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  if (a3) {
    uint64_t v4 = a3;
  }
  __int16 v9 = 2112;
  id v10 = v4;
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "msg callback %s tracked %@ %@", (uint8_t *)&v5, 0x20u);
}

@end