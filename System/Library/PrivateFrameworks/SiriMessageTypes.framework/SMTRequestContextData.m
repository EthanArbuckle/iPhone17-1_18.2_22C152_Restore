@interface SMTRequestContextData
- (BOOL)isDeviceLocked;
- (BOOL)isDeviceShowingLockScreen;
- (BOOL)isEyesFree;
- (BOOL)isInAmbient;
- (BOOL)isLiveActivitiesSupported;
- (BOOL)isSystemApertureEnabled;
- (BOOL)isTextToSpeechEnabled;
- (BOOL)isTriggerlessFollowup;
- (BOOL)isVoiceTriggerEnabled;
- (NSArray)bargeInModes;
- (NSArray)deviceRestrictions;
- (NSDateInterval)approximatePreviousTTSInterval;
- (NSDictionary)voiceTriggerEventInfo;
- (NSString)audioDestination;
- (NSString)audioSource;
- (NSString)responseMode;
- (SMTRequestContextData)init;
- (SMTRequestContextData)initWithBuilder:(id)a3;
- (id)_sanitizeVoiceTriggerEventInfo:(id)a3;
- (unsigned)voiceAudioSessionId;
@end

@implementation SMTRequestContextData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_approximatePreviousTTSInterval, 0);
  objc_storeStrong((id *)&self->_bargeInModes, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_audioSource, 0);
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (BOOL)isDeviceShowingLockScreen
{
  return self->_isDeviceShowingLockScreen;
}

- (BOOL)isLiveActivitiesSupported
{
  return self->_isLiveActivitiesSupported;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isSystemApertureEnabled
{
  return self->_isSystemApertureEnabled;
}

- (unsigned)voiceAudioSessionId
{
  return self->_voiceAudioSessionId;
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (NSDateInterval)approximatePreviousTTSInterval
{
  return self->_approximatePreviousTTSInterval;
}

- (NSArray)bargeInModes
{
  return self->_bargeInModes;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (NSString)audioDestination
{
  return self->_audioDestination;
}

- (NSString)audioSource
{
  return self->_audioSource;
}

- (id)_sanitizeVoiceTriggerEventInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__SMTRequestContextData__sanitizeVoiceTriggerEventInfo___block_invoke;
    v9[3] = &unk_265503C50;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
    v7 = (void *)[v6 copy];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __56__SMTRequestContextData__sanitizeVoiceTriggerEventInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 stringValue];

      id v6 = (id)v7;
    }
    [*(id *)(a1 + 32) setObject:v6 forKey:v8];
  }
}

- (SMTRequestContextData)init
{
  return [(SMTRequestContextData *)self initWithBuilder:&__block_literal_global];
}

- (SMTRequestContextData)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SMTRequestContextDataMutating *))a3;
  v30.receiver = self;
  v30.super_class = (Class)SMTRequestContextData;
  id v5 = [(SMTRequestContextData *)&v30 init];
  id v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = objc_alloc_init(SMTRequestContextDataMutating);
    v4[2](v4, v7);
    id v8 = [(SMTRequestContextDataMutating *)v7 audioSource];
    uint64_t v9 = [v8 copy];
    audioSource = v6->_audioSource;
    v6->_audioSource = (NSString *)v9;

    v11 = [(SMTRequestContextDataMutating *)v7 audioDestination];
    uint64_t v12 = [v11 copy];
    audioDestination = v6->_audioDestination;
    v6->_audioDestination = (NSString *)v12;

    v14 = [(SMTRequestContextDataMutating *)v7 responseMode];
    uint64_t v15 = [v14 copy];
    responseMode = v6->_responseMode;
    v6->_responseMode = (NSString *)v15;

    v6->_isEyesFree = [(SMTRequestContextDataMutating *)v7 isEyesFree];
    v6->_isVoiceTriggerEnabled = [(SMTRequestContextDataMutating *)v7 isVoiceTriggerEnabled];
    v6->_isTextToSpeechEnabled = [(SMTRequestContextDataMutating *)v7 isTextToSpeechEnabled];
    v6->_isTriggerlessFollowup = [(SMTRequestContextDataMutating *)v7 isTriggerlessFollowup];
    v17 = [(SMTRequestContextDataMutating *)v7 bargeInModes];
    uint64_t v18 = [v17 copy];
    bargeInModes = v6->_bargeInModes;
    v6->_bargeInModes = (NSArray *)v18;

    v20 = [(SMTRequestContextDataMutating *)v7 approximatePreviousTTSInterval];
    uint64_t v21 = [v20 copy];
    approximatePreviousTTSInterval = v6->_approximatePreviousTTSInterval;
    v6->_approximatePreviousTTSInterval = (NSDateInterval *)v21;

    v23 = [(SMTRequestContextDataMutating *)v7 deviceRestrictions];
    uint64_t v24 = [v23 copy];
    deviceRestrictions = v6->_deviceRestrictions;
    v6->_deviceRestrictions = (NSArray *)v24;

    v26 = [(SMTRequestContextDataMutating *)v7 voiceTriggerEventInfo];
    uint64_t v27 = [(SMTRequestContextData *)v6 _sanitizeVoiceTriggerEventInfo:v26];
    voiceTriggerEventInfo = v6->_voiceTriggerEventInfo;
    v6->_voiceTriggerEventInfo = (NSDictionary *)v27;

    v6->_voiceAudioSessionId = [(SMTRequestContextDataMutating *)v7 voiceAudioSessionId];
    v6->_isSystemApertureEnabled = [(SMTRequestContextDataMutating *)v7 isSystemApertureEnabled];
    v6->_isInAmbient = [(SMTRequestContextDataMutating *)v7 isInAmbient];
    v6->_isLiveActivitiesSupported = [(SMTRequestContextDataMutating *)v7 isLiveActivitiesSupported];
    v6->_isDeviceShowingLockScreen = [(SMTRequestContextDataMutating *)v7 isDeviceShowingLockScreen];
    v6->_isDeviceLocked = [(SMTRequestContextDataMutating *)v7 isDeviceLocked];
  }
  return v6;
}

@end