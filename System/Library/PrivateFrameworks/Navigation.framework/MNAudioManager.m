@interface MNAudioManager
- (BOOL)_deviceIsMuted;
- (BOOL)_deviceSettingsAllowSpeech;
- (BOOL)isSpeaking;
- (BOOL)vibrateForShortPrompt:(unint64_t)a3;
- (BOOL)voiceGuidanceEnabled;
- (MNAudioManager)initWithTransportType:(int)a3 voiceLanguage:(id)a4 guidanceLevelOverride:(unint64_t)a5;
- (double)durationOf:(id)a3;
- (int)_supportedTransportTypeForTransportType:(int)a3;
- (int)transportType;
- (unint64_t)voiceGuidanceLevel;
- (void)audioHardwareEngine:(id)a3 didActivateAudioSession:(BOOL)a4;
- (void)audioHardwareEngine:(id)a3 didStartSpeakingPrompt:(id)a4;
- (void)audioSystemOptions:(id)a3 didChangeGuidanceLevel:(unint64_t)a4 transportType:(int)a5;
- (void)changeTransportType:(int)a3;
- (void)clearAllAnnouncements;
- (void)dealloc;
- (void)forceDeactivate;
- (void)registerObserver:(id)a3;
- (void)requestSpeech:(id)a3 guidanceLevel:(unint64_t)a4 modifier:(unint64_t)a5 shortPromptType:(unint64_t)a6 completionHandler:(id)a7;
- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3;
- (void)stopSpeaking;
- (void)unregisterObserver:(id)a3;
@end

@implementation MNAudioManager

- (MNAudioManager)initWithTransportType:(int)a3 voiceLanguage:(id)a4 guidanceLevelOverride:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a4;
  if ([(__CFString *)v8 length])
  {
    v28.receiver = self;
    v28.super_class = (Class)MNAudioManager;
    v9 = [(MNAudioManager *)&v28 init];
    v10 = v9;
    if (v9)
    {
      v9->_uint64_t transportType = [(MNAudioManager *)v9 _supportedTransportTypeForTransportType:v6];
      v11 = GetAudioLogForMNAudioManagerCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t transportType = v10->_transportType;
        if (transportType >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10->_transportType);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_1E60FBFD8[transportType];
        }
        v15 = v13;
        if (v6 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E60FBFD8[(int)v6];
        }
        *(_DWORD *)buf = 138412546;
        v30 = v15;
        __int16 v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "ⓜ Initialization: setting transport type to %@ (from transport type of %@)", buf, 0x16u);
      }
      v17 = +[MNUserOptionsEngine sharedInstance];
      v18 = [v17 options];
      uint64_t v19 = [v18 copy];
      options = v10->_options;
      v10->_options = (MNUserOptions *)v19;

      v21 = GetAudioLogForMNAudioManagerCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = v10->_options;
        *(_DWORD *)buf = 138412546;
        v30 = v8;
        __int16 v31 = 2112;
        v32 = (__CFString *)v22;
        _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_INFO, "ⓜ Initialization: using voice language '%@' and setting these user options : %@", buf, 0x16u);
      }

      v23 = [[MNAudioSystemOptions alloc] initWithTempUserOptions:v10->_options];
      audioSystemOptions = v10->_audioSystemOptions;
      v10->_audioSystemOptions = v23;

      [(MNAudioSystemOptions *)v10->_audioSystemOptions registerObserver:v10];
      [(MNAudioSystemOptions *)v10->_audioSystemOptions setGuidanceLevelOverride:a5 transportType:v6];
      v25 = [[MNAudioHardwareEngine alloc] initWithAudioSystemOptions:v10->_audioSystemOptions voiceLanguage:v8 transportType:v10->_transportType];
      audioEngine = v10->_audioEngine;
      v10->_audioEngine = v25;

      [(MNAudioHardwareEngine *)v10->_audioEngine registerObserver:v10];
    }
  }
  else
  {
    v14 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_INFO, "⒨ Initialization: voice language is nil or empty", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(MNAudioSystemOptions *)self->_audioSystemOptions unregisterObserver:self];
  [(MNAudioHardwareEngine *)self->_audioEngine unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MNAudioManager;
  [(MNAudioManager *)&v3 dealloc];
}

- (unint64_t)voiceGuidanceLevel
{
  return [(MNAudioSystemOptions *)self->_audioSystemOptions guidanceLevelForTransportType:self->_transportType];
}

- (void)registerObserver:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_1F0E51A28])
    {
      if (!self->_observers)
      {
        uint64_t v6 = GetAudioLogForMNAudioManagerCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "ⓜ Creating observer table", (uint8_t *)&v11, 2u);
        }

        v7 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E51A28];
        observers = self->_observers;
        self->_observers = v7;
      }
      v9 = GetAudioLogForMNAudioManagerCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "ⓜ Adding observer : %@", (uint8_t *)&v11, 0xCu);
      }

      [(MNObserverHashTable *)self->_observers registerObserver:v5];
    }
    else
    {
      v10 = GetAudioLogForMNAudioManagerCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "⒨ Object isn't a MNAudioManagerObserver : %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 conformsToProtocol:&unk_1F0E51A28];
    v7 = GetAudioLogForMNAudioManagerCategory();
    observers = (MNObserverHashTable *)v7;
    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        int v11 = v5;
        _os_log_impl(&dword_1B542B000, &observers->super, OS_LOG_TYPE_ERROR, "⒨ Object isn't a MNAudioManagerObserver : %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_11;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      int v11 = v5;
      _os_log_impl(&dword_1B542B000, &observers->super, OS_LOG_TYPE_DEBUG, "ⓜ Removing observer : %@", (uint8_t *)&v10, 0xCu);
    }

    [(MNObserverHashTable *)self->_observers unregisterObserver:v5];
    if (![(MNObserverHashTable *)self->_observers hasObservers])
    {
      v9 = GetAudioLogForMNAudioManagerCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "ⓜ Observer table empty; destroying",
          (uint8_t *)&v10,
          2u);
      }

      observers = self->_observers;
      self->_observers = 0;
LABEL_11:
    }
  }
}

- (void)changeTransportType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(MNAudioManager *)self clearAllAnnouncements];
  uint64_t transportType = self->_transportType;
  self->_uint64_t transportType = [(MNAudioManager *)self _supportedTransportTypeForTransportType:v3];
  char v6 = GetAudioLogForMNAudioManagerCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = self->_transportType;
    if (v7 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_transportType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E60FBFD8[v7];
    }
    v9 = v8;
    if (v3 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
      int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v10 = off_1E60FBFD8[(int)v3];
    }
    int v11 = v10;
    if (transportType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", transportType);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = off_1E60FBFD8[transportType];
    }
    *(_DWORD *)buf = 138412802;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "ⓜ Changing transport type to %@ (from transport type of %@); previous type was %@",
      buf,
      0x20u);
  }
  [(MNAudioHardwareEngine *)self->_audioEngine changeTransportType:self->_transportType];
}

- (int)_supportedTransportTypeForTransportType:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 2) {
    return a3;
  }
  else {
    return 0;
  }
}

- (BOOL)voiceGuidanceEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(MNAudioManager *)self voiceGuidanceLevel])
  {
    uint64_t v3 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t transportType = self->_transportType;
      if (transportType >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_transportType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = off_1E60FBFD8[transportType];
      }
      *(_DWORD *)buf = 138412290;
      int v10 = v5;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "ⓜ Voice guidance not enabled - voice guidance for this transport type (%@) is None", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (self->_transportType == 1)
  {
    uint64_t v3 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "ⓜ Voice guidance not enabled - for Transit", buf, 2u);
    }
LABEL_14:
    LOBYTE(v6) = 0;
    goto LABEL_15;
  }
  BOOL v6 = [(MNAudioManager *)self _deviceSettingsAllowSpeech];
  uint64_t v3 = GetAudioLogForMNAudioManagerCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = "not";
    if (v6) {
      uint64_t v7 = "is";
    }
    *(_DWORD *)buf = 136315138;
    int v10 = (void *)v7;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "ⓜ Voice guidance %s enabled", buf, 0xCu);
  }
LABEL_15:

  return v6;
}

- (BOOL)_deviceSettingsAllowSpeech
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((self->_transportType & 0xFFFFFFFE) == 2)
  {
    BOOL v2 = +[MNAudioHardwareEngine headphonesAreInUse];
    uint64_t v3 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    id v4 = [v3 attributeForKey:*MEMORY[0x1E4F74BD0]];
    int v5 = [v4 BOOLValue];

    int v6 = v2 | v5 ^ 1;
    uint64_t v7 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = "DO NOT";
      int v13 = 136315650;
      if (v6) {
        v8 = "DO";
      }
      v14 = v8;
      __int16 v15 = 1024;
      BOOL v16 = v2;
      __int16 v17 = 1024;
      int v18 = v5;
      v9 = "ⓜ Device settings %s allow speech, headphonesInUse=%d, systemIsMuted=%d";
      int v10 = v7;
      uint32_t v11 = 24;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = GetAudioLogForMNAudioManagerCategory();
    LOBYTE(v6) = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v9 = "ⓜ Device settings allow speech";
      int v10 = v7;
      uint32_t v11 = 2;
LABEL_8:
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }

  return v6;
}

- (BOOL)_deviceIsMuted
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v3 = [v2 attributeForKey:*MEMORY[0x1E4F74BD0]];
  int v4 = [v3 BOOLValue];

  int v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  int v6 = [v5 getSilentMode];

  uint64_t v7 = GetAudioLogForMNAudioManagerCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = "not";
    int v10 = 136315650;
    if (v4 | v6) {
      v8 = "is";
    }
    uint32_t v11 = v8;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v6 ^ 1;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "ⓜ Device %s muted, systemMuted=%d, ringerSwitchEnabled=%d", (uint8_t *)&v10, 0x18u);
  }

  return v4 | v6;
}

- (void)requestSpeech:(id)a3 guidanceLevel:(unint64_t)a4 modifier:(unint64_t)a5 shortPromptType:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (![v12 length])
  {
    __int16 v14 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v15 = "⒨ String is empty";
      uint64_t v16 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if (self->_transportType == 1)
  {
    __int16 v14 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = 0;
      int v15 = "ⓜ Voice guidance not enabled - for Transit";
      uint64_t v16 = (uint8_t *)&v18;
LABEL_7:
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a5 == 1) {
    a6 |= 0x40uLL;
  }
  __int16 v17 = objc_msgSend(v12, "_navigation_stringByMarkingAsNavigationText");
  [(MNAudioHardwareEngine *)self->_audioEngine requestSpeech:v17 guidanceLevel:a4 shortPromptType:a6 completionHandler:v13];

LABEL_12:
}

- (void)forceDeactivate
{
}

- (void)stopSpeaking
{
}

- (BOOL)isSpeaking
{
  return [(MNAudioHardwareEngine *)self->_audioEngine speaking];
}

- (void)clearAllAnnouncements
{
}

- (BOOL)vibrateForShortPrompt:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_transportType <= 1u)
  {
    int v4 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t transportType = self->_transportType;
      if (transportType >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_transportType);
        int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v6 = off_1E60FBFD8[transportType];
      }
      *(_DWORD *)buf = 138412290;
      uint32_t v11 = v6;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "ⓜ Vibration ignored - transport type doesn't support vibration: %@", buf, 0xCu);
    }
LABEL_13:

    return 0;
  }
  if (![(MNAudioManager *)self voiceGuidanceEnabled])
  {
    int v4 = GetAudioLogForMNAudioManagerCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "ⓜ Vibration ignored - voice guidance is muted", buf, 2u);
    }
    goto LABEL_13;
  }
  audioEngine = self->_audioEngine;
  return [(MNAudioHardwareEngine *)audioEngine vibrateForShortPrompt:a3];
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
}

- (double)durationOf:(id)a3
{
  [(MNAudioHardwareEngine *)self->_audioEngine durationOf:a3];
  return result;
}

- (void)audioHardwareEngine:(id)a3 didActivateAudioSession:(BOOL)a4
{
}

- (void)audioHardwareEngine:(id)a3 didStartSpeakingPrompt:(id)a4
{
}

- (void)audioSystemOptions:(id)a3 didChangeGuidanceLevel:(unint64_t)a4 transportType:(int)a5
{
  if (self->_transportType == a5) {
    [(MNObserverHashTable *)self->_observers audioManager:self didChangeVoiceGuidanceLevel:a4];
  }
}

- (int)transportType
{
  return self->_transportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSystemOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
}

@end