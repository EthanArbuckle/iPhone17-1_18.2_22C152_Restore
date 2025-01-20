@interface MNAudioSystemOptions
- (BOOL)pauseSpokenAudio;
- (BOOL)useHFP;
- (MNAudioSystemOptions)initWithTempUserOptions:(id)a3;
- (NSString)description;
- (unint64_t)guidanceLevelForTransportType:(int)a3;
- (void)_updateGuidanceLevelFromUserSetting:(unint64_t)a3 transportType:(int)a4;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setGuidanceLevelOverride:(unint64_t)a3 transportType:(int)a4;
- (void)unregisterObserver:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation MNAudioSystemOptions

- (MNAudioSystemOptions)initWithTempUserOptions:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)MNAudioSystemOptions;
  v3 = [(MNAudioSystemOptions *)&v17 init];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F647B0]) initWithProtocol:&unk_1F0E40698 queue:0];
    observers = v3->_observers;
    v3->_observers = (GEOObserverHashTable *)v4;

    v6 = (void *)MEMORY[0x1E4F1CA60];
    v20[0] = &unk_1F0E35010;
    v7 = [NSNumber numberWithInteger:GEOConfigGetInteger()];
    v21[0] = v7;
    v20[1] = &unk_1F0E35028;
    v8 = [NSNumber numberWithInteger:GEOConfigGetInteger()];
    v21[1] = v8;
    v20[2] = &unk_1F0E35040;
    v9 = [NSNumber numberWithInteger:GEOConfigGetInteger()];
    v21[2] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    uint64_t v11 = [v6 dictionaryWithDictionary:v10];
    guidanceLevels = v3->_guidanceLevels;
    v3->_guidanceLevels = (NSMutableDictionary *)v11;

    v3->_useHFP = GEOConfigGetBOOL();
    v3->_pauseSpokenAudio = GEOConfigGetBOOL();
    v13 = (void *)MEMORY[0x1E4F14428];
    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    v14 = GetAudioLogForMNAudioSystemOptionsCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEFAULT, "Initializing audio system options: %@", buf, 0xCu);
    }

    v15 = v3;
  }

  return v3;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)MNAudioSystemOptions;
  [(MNAudioSystemOptions *)&v3 dealloc];
}

- (unint64_t)guidanceLevelForTransportType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  guidanceLevelOverrides = self->_guidanceLevelOverrides;
  v6 = objc_msgSend(NSNumber, "numberWithInt:");
  v7 = [(NSMutableDictionary *)guidanceLevelOverrides objectForKeyedSubscript:v6];

  if (v7)
  {
    unint64_t v8 = [v7 integerValue];
  }
  else
  {
    guidanceLevels = self->_guidanceLevels;
    v10 = [NSNumber numberWithInt:v3];
    uint64_t v11 = [(NSMutableDictionary *)guidanceLevels objectForKeyedSubscript:v10];

    if (v11) {
      unint64_t v8 = [v11 integerValue];
    }
    else {
      unint64_t v8 = 0;
    }
  }
  return v8;
}

- (void)setGuidanceLevelOverride:(unint64_t)a3 transportType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unint64_t v7 = [(MNAudioSystemOptions *)self guidanceLevelForTransportType:*(void *)&a4];
  guidanceLevelOverrides = self->_guidanceLevelOverrides;
  if (a3 == -1)
  {
    uint64_t v11 = [NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)guidanceLevelOverrides removeObjectForKey:v11];
  }
  else
  {
    if (!guidanceLevelOverrides)
    {
      v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      v10 = self->_guidanceLevelOverrides;
      self->_guidanceLevelOverrides = v9;
    }
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    v12 = self->_guidanceLevelOverrides;
    v13 = [NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
  }
  unint64_t v14 = [(MNAudioSystemOptions *)self guidanceLevelForTransportType:v4];
  if (v14 != v7)
  {
    unint64_t v15 = v14;
    observers = self->_observers;
    [(GEOObserverHashTable *)observers audioSystemOptions:self didChangeGuidanceLevel:v15 transportType:v4];
  }
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(NSMutableDictionary *)self->_guidanceLevelOverrides objectForKeyedSubscript:&unk_1F0E35010];
  v5 = NSString;
  v6 = [(NSMutableDictionary *)self->_guidanceLevels objectForKeyedSubscript:&unk_1F0E35010];
  uint64_t v7 = [v6 unsignedIntegerValue];
  unint64_t v8 = v7 + 1;
  if (v4)
  {
    if (v8 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E60F7A88[v8];
    }
    uint64_t v10 = [v4 unsignedIntegerValue];
    if ((unint64_t)(v10 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v10);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = off_1E60F7A88[v10 + 1];
    }
    v12 = [v5 stringWithFormat:@"Driving guidance level: %@ | Override: %@", v9, v11];
    [v3 addObject:v12];
  }
  else
  {
    if (v8 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E60F7A88[v8];
    }
    uint64_t v11 = [v5 stringWithFormat:@"Driving guidance level: %@", v9];
    [v3 addObject:v11];
  }

  v13 = [(NSMutableDictionary *)self->_guidanceLevelOverrides objectForKeyedSubscript:&unk_1F0E35028];
  unint64_t v14 = NSString;
  unint64_t v15 = [(NSMutableDictionary *)self->_guidanceLevels objectForKeyedSubscript:&unk_1F0E35028];
  uint64_t v16 = [v15 unsignedIntegerValue];
  uint64_t v17 = v16 + 1;
  if (v13)
  {
    if ((unint64_t)(v16 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E60F7A88[v17];
    }
    uint64_t v19 = [v13 unsignedIntegerValue];
    if ((unint64_t)(v19 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E60F7A88[v19 + 1];
    }
    v21 = [v14 stringWithFormat:@"Walking guidance level: %@ | Override: %@", v18, v20];
    [v3 addObject:v21];
  }
  else
  {
    if ((unint64_t)(v16 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E60F7A88[v17];
    }
    v20 = [v14 stringWithFormat:@"Walking guidance level: %@", v18];
    [v3 addObject:v20];
  }

  v22 = [(NSMutableDictionary *)self->_guidanceLevelOverrides objectForKeyedSubscript:&unk_1F0E35040];
  v23 = NSString;
  v24 = [(NSMutableDictionary *)self->_guidanceLevels objectForKeyedSubscript:&unk_1F0E35040];
  uint64_t v25 = [v24 unsignedIntegerValue];
  uint64_t v26 = v25 + 1;
  if (v22)
  {
    if ((unint64_t)(v25 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v25);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E60F7A88[v26];
    }
    uint64_t v28 = [v22 unsignedIntegerValue];
    if ((unint64_t)(v28 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E60F7A88[v28 + 1];
    }
    v30 = [v23 stringWithFormat:@"Cycling guidance level: %@ | Override: %@", v27, v29];
    [v3 addObject:v30];
  }
  else
  {
    if ((unint64_t)(v25 + 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v25);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E60F7A88[v26];
    }
    v29 = [v23 stringWithFormat:@"Cycling guidance level: %@", v27];
    [v3 addObject:v29];
  }

  v31 = objc_msgSend(NSString, "stringWithFormat:", @"Use HFP: %d", self->_useHFP);
  [v3 addObject:v31];

  v32 = objc_msgSend(NSString, "stringWithFormat:", @"Pause Spoken Audio: %d", self->_pauseSpokenAudio);
  [v3 addObject:v32];

  v33 = NSString;
  v34 = [v3 componentsJoinedByString:@"\n\t"];
  v35 = [v33 stringWithFormat:@"MNAudioSystemOptions:\n\t%@", v34];

  return (NSString *)v35;
}

- (void)_updateGuidanceLevelFromUserSetting:(unint64_t)a3 transportType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(MNAudioSystemOptions *)self guidanceLevelForTransportType:*(void *)&a4];
  unint64_t v8 = GetAudioLogForMNAudioSystemOptionsCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E60F7A50[(int)v4];
    }
    uint64_t v10 = v9;
    if (v7 + 1 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", v7);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = off_1E60F7A88[v7 + 1];
    }
    v12 = v11;
    if (a3 + 1 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", a3);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E60F7A88[a3 + 1];
    }
    *(_DWORD *)buf = 138412802;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Guidance level for \"%@\" changed from %@ to %@", buf, 0x20u);
  }
  unint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
  guidanceLevels = self->_guidanceLevels;
  uint64_t v16 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)guidanceLevels setObject:v14 forKeyedSubscript:v16];

  guidanceLevelOverrides = self->_guidanceLevelOverrides;
  v18 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)guidanceLevelOverrides removeObjectForKey:v18];

  if (v7 != a3) {
    [(GEOObserverHashTable *)self->_observers audioSystemOptions:self didChangeGuidanceLevel:a3 transportType:v4];
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3.var0 == NavigationConfig_SpokenGuidanceLevel_Driving && a3.var1 == off_1E9D569F0)
  {
    uint64_t Integer = GEOConfigGetInteger();
    v13 = self;
    uint64_t v14 = 0;
  }
  else if (a3.var0 == NavigationConfig_SpokenGuidanceLevel_Walking && a3.var1 == off_1E9D56A00)
  {
    uint64_t Integer = GEOConfigGetInteger();
    v13 = self;
    uint64_t v14 = 2;
  }
  else
  {
    if (a3.var0 != NavigationConfig_SpokenGuidanceLevel_Cycling || a3.var1 != off_1E9D56A10)
    {
      if (a3.var0 == NavigationConfig_SpokenGuidanceUseHFP && a3.var1 == off_1E9D56A30)
      {
        uint64_t BOOL = GEOConfigGetBOOL();
        uint64_t v16 = GetAudioLogForMNAudioSystemOptionsCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          BOOL useHFP = self->_useHFP;
          int v18 = 67109376;
          BOOL v19 = useHFP;
          __int16 v20 = 1024;
          int v21 = BOOL;
          _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "UseHFP changed from %d to %d", (uint8_t *)&v18, 0xEu);
        }

        self->_BOOL useHFP = BOOL;
        [(GEOObserverHashTable *)self->_observers audioSystemOptions:self didUpdateUseHFP:BOOL];
      }
      else if (a3.var0 == NavigationConfig_SpokenGuidancePauseSpokenAudio && a3.var1 == off_1E9D56A20)
      {
        uint64_t v9 = GEOConfigGetBOOL();
        uint64_t v10 = GetAudioLogForMNAudioSystemOptionsCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          BOOL pauseSpokenAudio = self->_pauseSpokenAudio;
          int v18 = 67109376;
          BOOL v19 = pauseSpokenAudio;
          __int16 v20 = 1024;
          int v21 = v9;
          _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, "UseHFP changed from %d to %d", (uint8_t *)&v18, 0xEu);
        }

        self->_BOOL pauseSpokenAudio = v9;
        [(GEOObserverHashTable *)self->_observers audioSystemOptions:self didUpdatePauseSpokenAudio:v9];
      }
      return;
    }
    uint64_t Integer = GEOConfigGetInteger();
    v13 = self;
    uint64_t v14 = 3;
  }
  [(MNAudioSystemOptions *)v13 _updateGuidanceLevelFromUserSetting:Integer transportType:v14];
}

- (BOOL)useHFP
{
  return self->_useHFP;
}

- (BOOL)pauseSpokenAudio
{
  return self->_pauseSpokenAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceLevelOverrides, 0);
  objc_storeStrong((id *)&self->_guidanceLevels, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end