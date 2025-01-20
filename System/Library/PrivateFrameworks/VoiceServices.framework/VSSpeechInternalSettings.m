@interface VSSpeechInternalSettings
+ (id)standardInstance;
- (BOOL)allowAnyAssetSubscriber;
- (BOOL)defaultToNonDiscretionaryDownloads;
- (BOOL)disableAssetCleaning;
- (BOOL)disableAssetUpdate;
- (BOOL)disableCache;
- (BOOL)disableDeviceNeuralTTS;
- (BOOL)disableDeviceRacing;
- (BOOL)disableInlineStreamTTS;
- (BOOL)disableMobileAssetURLReset;
- (BOOL)disableOspreyStreaming;
- (BOOL)disableServerTTS;
- (BOOL)enableAudioDump;
- (BOOL)enableLocalVoices;
- (BOOL)forceServerTTS;
- (BOOL)ignorePowerAndThermalState;
- (BOOL)logSensitiveText;
- (BOOL)simulateNetworkStall;
- (BOOL)useBetaVoice;
- (BOOL)useSSMLInput;
- (BOOL)whisper;
- (NSString)ospreyEndpointURL;
- (NSUserDefaults)internalDefaults;
- (VSSpeechInternalSettings)init;
- (float)defaultPitch;
- (float)defaultRate;
- (float)defaultVolume;
- (float)deviceTTSWaitTime;
- (float)serverTTSTimeout;
- (float)streamBufferDuration;
- (void)setAllowAnyAssetSubscriber:(BOOL)a3;
- (void)setDefaultPitch:(float)a3;
- (void)setDefaultRate:(float)a3;
- (void)setDefaultToNonDiscretionaryDownloads:(BOOL)a3;
- (void)setDefaultVolume:(float)a3;
- (void)setDeviceTTSWaitTime:(float)a3;
- (void)setDisableAssetCleaning:(BOOL)a3;
- (void)setDisableAssetUpdate:(BOOL)a3;
- (void)setDisableCache:(BOOL)a3;
- (void)setDisableDeviceNeuralTTS:(BOOL)a3;
- (void)setDisableDeviceRacing:(BOOL)a3;
- (void)setDisableInlineStreamTTS:(BOOL)a3;
- (void)setDisableOspreyStreaming:(BOOL)a3;
- (void)setDisableServerTTS:(BOOL)a3;
- (void)setEnableAudioDump:(BOOL)a3;
- (void)setEnableLocalVoices:(BOOL)a3;
- (void)setForceServerTTS:(BOOL)a3;
- (void)setIgnorePowerAndThermalState:(BOOL)a3;
- (void)setInternalDefaults:(id)a3;
- (void)setLogSensitiveText:(BOOL)a3;
- (void)setOspreyEndpointURL:(id)a3;
- (void)setServerTTSTimeout:(float)a3;
- (void)setSimulateNetworkStall:(BOOL)a3;
- (void)setStreamBufferDuration:(float)a3;
- (void)setUseBetaVoice:(BOOL)a3;
- (void)setWhisper:(BOOL)a3;
@end

@implementation VSSpeechInternalSettings

- (BOOL)disableAssetCleaning
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"DisableAssetCleaning"];
}

+ (id)standardInstance
{
  if (standardInstance_onceToken != -1) {
    dispatch_once(&standardInstance_onceToken, &__block_literal_global_165);
  }
  v2 = (void *)standardInstance___standardInstance;
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setInternalDefaults:(id)a3
{
}

- (NSUserDefaults)internalDefaults
{
  return self->_internalDefaults;
}

- (void)setDefaultToNonDiscretionaryDownloads:(BOOL)a3
{
}

- (BOOL)defaultToNonDiscretionaryDownloads
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"defaultToNonDiscretionaryDownloads"];
}

- (void)setDisableAssetUpdate:(BOOL)a3
{
}

- (BOOL)disableAssetUpdate
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"disableAssetUpdate"];
}

- (void)setIgnorePowerAndThermalState:(BOOL)a3
{
}

- (BOOL)ignorePowerAndThermalState
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"ignoreThermalState"];
}

- (BOOL)disableMobileAssetURLReset
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"disableMobileAssetURLReset"];
}

- (BOOL)useSSMLInput
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"useSSMLInput"];
}

- (void)setDisableDeviceNeuralTTS:(BOOL)a3
{
}

- (BOOL)disableDeviceNeuralTTS
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"disableDeviceNeuralTTS"];
}

- (void)setSimulateNetworkStall:(BOOL)a3
{
}

- (BOOL)simulateNetworkStall
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"simulateNetworkStall"];
}

- (void)setOspreyEndpointURL:(id)a3
{
}

- (NSString)ospreyEndpointURL
{
  return [(NSUserDefaults *)self->_internalDefaults stringForKey:@"ospreyEndpointURL"];
}

- (void)setUseBetaVoice:(BOOL)a3
{
}

- (BOOL)useBetaVoice
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"useBetaVoice"];
}

- (void)setStreamBufferDuration:(float)a3
{
}

- (float)streamBufferDuration
{
  [(NSUserDefaults *)self->_internalDefaults floatForKey:@"StreamBufferDuration"];
  return result;
}

- (void)setDisableOspreyStreaming:(BOOL)a3
{
}

- (BOOL)disableOspreyStreaming
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"disableOspreyStreaming"];
}

- (void)setDisableDeviceRacing:(BOOL)a3
{
}

- (BOOL)disableDeviceRacing
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"disableDeviceRacing"];
}

- (void)setDisableInlineStreamTTS:(BOOL)a3
{
}

- (BOOL)disableInlineStreamTTS
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"disableInlineStreamTTS"];
}

- (void)setDisableServerTTS:(BOOL)a3
{
}

- (BOOL)disableServerTTS
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"disableServerTTS"];
}

- (void)setForceServerTTS:(BOOL)a3
{
}

- (BOOL)forceServerTTS
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"forceServerTTS"];
}

- (void)setDefaultRate:(float)a3
{
}

- (float)defaultRate
{
  [(NSUserDefaults *)self->_internalDefaults floatForKey:@"defaultRate"];
  return result;
}

- (void)setDefaultPitch:(float)a3
{
}

- (float)defaultPitch
{
  [(NSUserDefaults *)self->_internalDefaults floatForKey:@"defaultPitch"];
  return result;
}

- (void)setDefaultVolume:(float)a3
{
}

- (float)defaultVolume
{
  [(NSUserDefaults *)self->_internalDefaults floatForKey:@"defaultVolume"];
  return result;
}

- (void)setDeviceTTSWaitTime:(float)a3
{
}

- (float)deviceTTSWaitTime
{
  [(NSUserDefaults *)self->_internalDefaults floatForKey:@"DeviceTTSWaitTime"];
  return result;
}

- (void)setServerTTSTimeout:(float)a3
{
}

- (float)serverTTSTimeout
{
  [(NSUserDefaults *)self->_internalDefaults floatForKey:@"ServerTTSTimeout"];
  return result;
}

- (void)setWhisper:(BOOL)a3
{
}

- (BOOL)whisper
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"whisper"];
}

- (void)setEnableLocalVoices:(BOOL)a3
{
}

- (BOOL)enableLocalVoices
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"EnableLocalVoices"];
}

- (void)setAllowAnyAssetSubscriber:(BOOL)a3
{
}

- (BOOL)allowAnyAssetSubscriber
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"AllowAnyAssetSubscription"];
}

- (void)setDisableAssetCleaning:(BOOL)a3
{
}

- (void)setDisableCache:(BOOL)a3
{
}

- (BOOL)disableCache
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"DisableCaching"];
}

- (void)setLogSensitiveText:(BOOL)a3
{
}

- (BOOL)logSensitiveText
{
  return [(NSUserDefaults *)self->_internalDefaults BOOLForKey:@"logSensitiveText"];
}

- (void)setEnableAudioDump:(BOOL)a3
{
}

- (BOOL)enableAudioDump
{
  v3 = [(NSUserDefaults *)self->_internalDefaults objectForKey:@"enableAudioDump"];

  if (!v3) {
    return 1;
  }
  internalDefaults = self->_internalDefaults;
  return [(NSUserDefaults *)internalDefaults BOOLForKey:@"enableAudioDump"];
}

- (VSSpeechInternalSettings)init
{
  v9.receiver = self;
  v9.super_class = (Class)VSSpeechInternalSettings;
  v2 = [(VSSpeechInternalSettings *)&v9 init];
  if (v2)
  {
    if (!+[VSUtilities isInternalBuild])
    {
      v6 = 0;
      goto LABEL_10;
    }
    if (geteuid() != 501)
    {
      v3 = VSGetLogDefault();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "process is not running as user Mobile: it won't share the same UserDefaults as voiced", v8, 2u);
      }
    }
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.voiceservices"];
    internalDefaults = v2->_internalDefaults;
    v2->_internalDefaults = (NSUserDefaults *)v4;

    [(NSUserDefaults *)v2->_internalDefaults removeObjectForKey:@"enableTrial"];
  }
  v6 = v2;
LABEL_10:

  return v6;
}

void __44__VSSpeechInternalSettings_standardInstance__block_invoke()
{
  v0 = objc_alloc_init(VSSpeechInternalSettings);
  v1 = (void *)standardInstance___standardInstance;
  standardInstance___standardInstance = (uint64_t)v0;
}

@end