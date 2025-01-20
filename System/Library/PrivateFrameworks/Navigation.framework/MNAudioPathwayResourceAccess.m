@interface MNAudioPathwayResourceAccess
- (BOOL)_otherAudioIsPlaying;
- (BOOL)_routeIsAirTunes:(id)a3;
- (BOOL)_routeIsBluetooth:(id)a3;
- (BOOL)_routeIsForVehicle:(id)a3;
- (BOOL)_routeIsHFP:(id)a3;
- (BOOL)_routeIsOverride:(id)a3;
- (BOOL)_routeIsUsable:(id)a3;
- (BOOL)_routeIsWireless:(id)a3;
- (BOOL)enableHFPUse;
- (BOOL)wantsVolumeControl;
- (MNAudioPathwayResourceAccess)initWithHFPEnabled:(BOOL)a3;
- (id)_pickableRoutesDescription:(id)a3;
- (id)_usableHFPRoute;
- (void)_mediaServerConnectionDied;
- (void)_registerForObservation;
- (void)_setHfpRoute:(id)a3;
- (void)_unregisterForObservation;
- (void)_updateHFPRoute;
- (void)dealloc;
- (void)setEnableHFPUse:(BOOL)a3;
- (void)setWantsVolumeControl:(BOOL)a3;
@end

@implementation MNAudioPathwayResourceAccess

- (MNAudioPathwayResourceAccess)initWithHFPEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)MNAudioPathwayResourceAccess;
  v4 = [(MNAudioPathwayResourceAccess *)&v20 init];
  v5 = v4;
  if (v4)
  {
    v4->_forLoggingOnly_pickableRoutesCount = 0x7FFFFFFFFFFFFFFFLL;
    v6 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = @"NO";
      if (v3) {
        v7 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Initialization : enableHFP=%@", buf, 0xCu);
    }

    uint64_t v8 = geo_dispatch_queue_create();
    pickableRoutesQueue = v5->_pickableRoutesQueue;
    v5->_pickableRoutesQueue = (OS_dispatch_queue *)v8;

    v10 = v5->_pickableRoutesQueue;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __51__MNAudioPathwayResourceAccess_initWithHFPEnabled___block_invoke;
    v17 = &unk_1E60F6D08;
    v11 = v5;
    v18 = v11;
    BOOL v19 = v3;
    dispatch_async(v10, &v14);
    [(MNAudioPathwayResourceAccess *)v11 _registerForObservation];
    v12 = v11;
  }
  return v5;
}

uint64_t __51__MNAudioPathwayResourceAccess_initWithHFPEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _updateHFPRoute];
}

- (void)dealloc
{
  [(MNAudioPathwayResourceAccess *)self _unregisterForObservation];
  [(MNAudioPathwayResourceAccess *)self setWantsVolumeControl:0];
  if (self->_hfpRoute)
  {
    BOOL v3 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    [v3 setBTHFPRoute:0 availableForVoicePrompts:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MNAudioPathwayResourceAccess;
  [(MNAudioPathwayResourceAccess *)&v4 dealloc];
}

- (void)_registerForObservation
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "Registering for observation", buf, 2u);
  }

  objc_super v4 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  v5 = (void *)MEMORY[0x1E4F74C58];
  v26[0] = *MEMORY[0x1E4F74C58];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v7 = (uint64_t *)MEMORY[0x1E4F74EA8];
  uint64_t v8 = *MEMORY[0x1E4F74EA8];
  id v19 = 0;
  [v4 setAttribute:v6 forKey:v8 error:&v19];
  id v9 = v19;
  v10 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *v7;
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      id v25 = v9;
      v13 = "Error setting attribute for %@ : attributes %@ : error %@";
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_8:
      _os_log_impl(&dword_1B542B000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *v7;
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    v13 = "Setting attributes for %@ was successful : attributes %@";
    uint64_t v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
    goto LABEL_8;
  }

  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 addObserver:self selector:sel__mediaServerConnectionDied name:*MEMORY[0x1E4F74E30] object:v4];
  [v18 addObserver:self selector:sel__pickableRoutesChanged name:*v5 object:v4];
}

- (void)_unregisterForObservation
{
  BOOL v3 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "Unregistering from observation", v6, 2u);
  }

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  [v5 setAttribute:0 forKey:*MEMORY[0x1E4F74EA8] error:0];
}

- (void)setEnableHFPUse:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "-[MNAudioPathwayResourceAccess setEnableHFPUse:] %@", buf, 0xCu);
  }

  pickableRoutesQueue = self->_pickableRoutesQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MNAudioPathwayResourceAccess_setEnableHFPUse___block_invoke;
  v8[3] = &unk_1E60F6D08;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_async(pickableRoutesQueue, v8);
}

uint64_t __48__MNAudioPathwayResourceAccess_setEnableHFPUse___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 32) != v2)
  {
    *(unsigned char *)(v1 + 32) = v2;
    return [*(id *)(result + 32) _updateHFPRoute];
  }
  return result;
}

- (void)setWantsVolumeControl:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_wantsVolumeControl = a3;
  objc_super v4 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  v5 = [NSNumber numberWithBool:self->_wantsVolumeControl];
  v6 = (uint64_t *)MEMORY[0x1E4F74AB8];
  uint64_t v7 = *MEMORY[0x1E4F74AB8];
  id v19 = 0;
  [v4 setAttribute:v5 forKey:v7 error:&v19];
  id v8 = v19;

  BOOL v9 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *v6;
      if (self->_wantsVolumeControl) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      id v25 = v8;
      v13 = "Error setting attribute for %@ : attributes %@ : error %@";
      uint64_t v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_11:
      _os_log_impl(&dword_1B542B000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *v6;
    v18 = @"YES";
    if (!self->_wantsVolumeControl) {
      v18 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    v13 = "Setting attributes for %@ was successful : attributes %@";
    uint64_t v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 22;
    goto LABEL_11;
  }
}

- (void)_mediaServerConnectionDied
{
  BOOL v3 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "Server connection died (unless there are lots of these, this is not an error)", buf, 2u);
  }

  pickableRoutesQueue = self->_pickableRoutesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MNAudioPathwayResourceAccess__mediaServerConnectionDied__block_invoke;
  block[3] = &unk_1E60F6B98;
  block[4] = self;
  dispatch_sync(pickableRoutesQueue, block);
  [(MNAudioPathwayResourceAccess *)self _unregisterForObservation];
  [(MNAudioPathwayResourceAccess *)self _registerForObservation];
}

void __58__MNAudioPathwayResourceAccess__mediaServerConnectionDied__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void)_updateHFPRoute
{
  pickableRoutesQueue = self->_pickableRoutesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MNAudioPathwayResourceAccess__updateHFPRoute__block_invoke;
  block[3] = &unk_1E60F6B98;
  block[4] = self;
  dispatch_async(pickableRoutesQueue, block);
}

void __47__MNAudioPathwayResourceAccess__updateHFPRoute__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned char **)(a1 + 32);
  if (v2[32])
  {
    id v3 = [v2 _usableHFPRoute];
    [*(id *)(a1 + 32) _setHfpRoute:v3];
  }
  else
  {
    [v2 _setHfpRoute:0];
  }
}

- (void)_setHfpRoute:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pickableRoutesQueue);
  hfpRoute = self->_hfpRoute;
  p_hfpRoute = &self->_hfpRoute;
  id v8 = hfpRoute;
  unint64_t v9 = (unint64_t)v5;
  if (v9 | (unint64_t)v8)
  {
    char v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      if (!*p_hfpRoute) {
        goto LABEL_11;
      }
      uint64_t v11 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      int v12 = [v11 setBTHFPRoute:*p_hfpRoute availableForVoicePrompts:0];

      v13 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
      uint64_t v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v15 = *p_hfpRoute;
          int v27 = 138412290;
          unint64_t v28 = (unint64_t)v15;
          uint32_t v16 = "Successfully cleared HFP route: %@";
          uint64_t v17 = v14;
          os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
          _os_log_impl(&dword_1B542B000, v17, v18, v16, (uint8_t *)&v27, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v19 = *p_hfpRoute;
        int v27 = 138412290;
        unint64_t v28 = (unint64_t)v19;
        uint32_t v16 = "Unable to clear voice prompt for route (this is an error in AVSystemController) : %@";
        uint64_t v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        goto LABEL_9;
      }

LABEL_11:
      if (!v9)
      {
LABEL_19:
        objc_storeStrong((id *)p_hfpRoute, a3);
        goto LABEL_20;
      }
      objc_super v20 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      int v21 = [v20 setBTHFPRoute:v9 availableForVoicePrompts:1];

      __int16 v22 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
      uint64_t v23 = v22;
      if (v21)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138412290;
          unint64_t v28 = v9;
          __int16 v24 = "Successfully set HFP route to %@";
          id v25 = v23;
          os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
LABEL_17:
          _os_log_impl(&dword_1B542B000, v25, v26, v24, (uint8_t *)&v27, 0xCu);
        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v27 = 138412290;
        unint64_t v28 = v9;
        __int16 v24 = "Unable to set voice prompt for route (this is an error in AVSystemController) : %@";
        id v25 = v23;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        goto LABEL_17;
      }

      goto LABEL_19;
    }
  }
LABEL_20:
}

- (id)_usableHFPRoute
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pickableRoutesQueue);
  if (self->_enableHFPUse)
  {
    id v3 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    objc_super v4 = [v3 pickableRoutesForCategory:@"MediaPlayback" andMode:@"VoicePrompt"];

    unint64_t v5 = [v4 count];
    unint64_t forLoggingOnly_pickableRoutesCount = self->_forLoggingOnly_pickableRoutesCount;
    self->_unint64_t forLoggingOnly_pickableRoutesCount = v5;
    if (v5 != forLoggingOnly_pickableRoutesCount)
    {
      uint64_t v7 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(MNAudioPathwayResourceAccess *)self _pickableRoutesDescription:v4];
        *(_DWORD *)buf = 138412290;
        os_log_type_t v26 = v8;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (-[MNAudioPathwayResourceAccess _routeIsUsable:](self, "_routeIsUsable:", v14, (void)v21))
          {
            uint32_t v16 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F74DF0]];
              os_log_type_t v18 = [v14 objectForKeyedSubscript:@"PortNumber"];
              *(_DWORD *)buf = 138412546;
              os_log_type_t v26 = v17;
              __int16 v27 = 2112;
              unint64_t v28 = v18;
              _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Found usable audio route: \"%@\", port: %@", buf, 0x16u);
            }
            id v15 = v14;
            goto LABEL_18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_18:

    if (v5 != forLoggingOnly_pickableRoutesCount && !v15)
    {
      id v19 = GetAudioLogForMNAudioPathwayResourceAccessCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_DEFAULT, "useHFP is enabled but we didn't find a usable HFP route.", buf, 2u);
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (BOOL)_routeIsUsable:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 count]
    && ![(MNAudioPathwayResourceAccess *)self _otherAudioIsPlaying]
    && ![(MNAudioPathwayResourceAccess *)self _routeIsAirTunes:v4]
    && ![(MNAudioPathwayResourceAccess *)self _routeIsOverride:v4]
    && [(MNAudioPathwayResourceAccess *)self _routeIsHFP:v4]
    && [(MNAudioPathwayResourceAccess *)self _routeIsForVehicle:v4]
    && [(MNAudioPathwayResourceAccess *)self _routeIsBluetooth:v4]
    && [(MNAudioPathwayResourceAccess *)self _routeIsWireless:v4];

  return v5;
}

- (BOOL)_otherAudioIsPlaying
{
  int v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  id v3 = [v2 attributeForKey:*MEMORY[0x1E4F74C18]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_routeIsAirTunes:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F74CE8]];
  char v4 = [v3 isEqualToString:@"AirTunes"];

  return v4;
}

- (BOOL)_routeIsOverride:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F74E10]];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F74C30]];

  return v4;
}

- (BOOL)_routeIsHFP:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F74D60]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_routeIsForVehicle:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F74D00]];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F74D30]];

  return v4;
}

- (BOOL)_routeIsBluetooth:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F74D80]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_routeIsWireless:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F74E10]];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F74C38]];

  return v4;
}

- (id)_pickableRoutesDescription:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count") + 1);
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"Found %d pickable audio routes:", objc_msgSend(v3, "count"));
  [v4 addObject:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        [v4 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [v4 componentsJoinedByString:@"\n"];

  return v12;
}

- (BOOL)enableHFPUse
{
  return self->_enableHFPUse;
}

- (BOOL)wantsVolumeControl
{
  return self->_wantsVolumeControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hfpRoute, 0);
  objc_storeStrong((id *)&self->_pickableRoutesQueue, 0);
}

@end