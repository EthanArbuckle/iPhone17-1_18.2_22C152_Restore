@interface VSSpeechRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)canLogRequestText;
- (BOOL)canUseServerTTS;
- (BOOL)disableCompactVoiceFallback;
- (BOOL)disableDeviceRacing;
- (BOOL)forceServerTTS;
- (BOOL)isSimilarTo:(id)a3;
- (BOOL)retryDeviceOnNetworkStall;
- (BOOL)shouldCache;
- (BOOL)shouldStreamAudioData;
- (BOOL)shouldWaitCurrentSpeaking;
- (BOOL)shouldWhisper;
- (NSArray)customResourceURLs;
- (NSAttributedString)attributedText;
- (NSDictionary)contextInfo;
- (NSString)clientBundleIdentifier;
- (NSString)languageCode;
- (NSString)text;
- (NSString)utterance;
- (NSString)voiceName;
- (NSURL)outputPath;
- (NSURL)resourceListURL;
- (NSURL)resourceSearchPathURL;
- (NSUUID)accessoryID;
- (NSUUID)siriRequestId;
- (VSSpeechRequest)init;
- (VSSpeechRequest)initWithCoder:(id)a3;
- (double)pitch;
- (double)rate;
- (double)volume;
- (id)contextInfoString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)logText;
- (id)logUtterance;
- (id)pauseHandler;
- (id)stopHandler;
- (int64_t)footprint;
- (int64_t)gender;
- (int64_t)pointer;
- (int64_t)powerProfile;
- (int64_t)voiceType;
- (unint64_t)requestCreatedTimestamp;
- (unsigned)audioSessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setCanUseServerTTS:(BOOL)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setContextInfo:(id)a3;
- (void)setCustomResourceURLs:(id)a3;
- (void)setDisableCompactVoiceFallback:(BOOL)a3;
- (void)setDisableDeviceRacing:(BOOL)a3;
- (void)setFootprint:(int64_t)a3;
- (void)setForceServerTTS:(BOOL)a3;
- (void)setGender:(int64_t)a3;
- (void)setLanguageCode:(id)a3;
- (void)setOutputPath:(id)a3;
- (void)setPauseHandler:(id)a3;
- (void)setPitch:(double)a3;
- (void)setPointer:(int64_t)a3;
- (void)setPowerProfile:(int64_t)a3;
- (void)setRate:(double)a3;
- (void)setRequestCreatedTimestamp:(unint64_t)a3;
- (void)setResourceListURL:(id)a3;
- (void)setResourceSearchPathURL:(id)a3;
- (void)setRetryDeviceOnNetworkStall:(BOOL)a3;
- (void)setShouldCache:(BOOL)a3;
- (void)setShouldStreamAudioData:(BOOL)a3;
- (void)setShouldWaitCurrentSpeaking:(BOOL)a3;
- (void)setShouldWhisper:(BOOL)a3;
- (void)setSiriRequestId:(id)a3;
- (void)setStopHandler:(id)a3;
- (void)setText:(id)a3;
- (void)setUtterance:(id)a3;
- (void)setVoiceName:(id)a3;
- (void)setVoiceType:(int64_t)a3;
- (void)setVolume:(double)a3;
@end

@implementation VSSpeechRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pauseHandler, 0);
  objc_storeStrong(&self->_stopHandler, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_siriRequestId, 0);
  objc_storeStrong((id *)&self->_customResourceURLs, 0);
  objc_storeStrong((id *)&self->_resourceSearchPathURL, 0);
  objc_storeStrong((id *)&self->_resourceListURL, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setPointer:(int64_t)a3
{
  self->_pointer = a3;
}

- (int64_t)pointer
{
  return self->_pointer;
}

- (void)setPauseHandler:(id)a3
{
}

- (id)pauseHandler
{
  return self->_pauseHandler;
}

- (void)setStopHandler:(id)a3
{
}

- (id)stopHandler
{
  return self->_stopHandler;
}

- (void)setRequestCreatedTimestamp:(unint64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (unint64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setAccessoryID:(id)a3
{
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setShouldStreamAudioData:(BOOL)a3
{
  self->_shouldStreamAudioData = a3;
}

- (BOOL)shouldStreamAudioData
{
  return self->_shouldStreamAudioData;
}

- (void)setAttributedText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setSiriRequestId:(id)a3
{
}

- (NSUUID)siriRequestId
{
  return self->_siriRequestId;
}

- (void)setCustomResourceURLs:(id)a3
{
}

- (NSArray)customResourceURLs
{
  return self->_customResourceURLs;
}

- (void)setResourceSearchPathURL:(id)a3
{
}

- (NSURL)resourceSearchPathURL
{
  return self->_resourceSearchPathURL;
}

- (void)setResourceListURL:(id)a3
{
}

- (NSURL)resourceListURL
{
  return self->_resourceListURL;
}

- (void)setPowerProfile:(int64_t)a3
{
  self->_powerProfile = a3;
}

- (int64_t)powerProfile
{
  return self->_powerProfile;
}

- (void)setRetryDeviceOnNetworkStall:(BOOL)a3
{
  self->_retryDeviceOnNetworkStall = a3;
}

- (BOOL)retryDeviceOnNetworkStall
{
  return self->_retryDeviceOnNetworkStall;
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  self->_canUseServerTTS = a3;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (void)setForceServerTTS:(BOOL)a3
{
  self->_forceServerTTS = a3;
}

- (BOOL)forceServerTTS
{
  return self->_forceServerTTS;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setDisableCompactVoiceFallback:(BOOL)a3
{
  self->_disableCompactVoiceFallback = a3;
}

- (BOOL)disableCompactVoiceFallback
{
  return self->_disableCompactVoiceFallback;
}

- (void)setContextInfo:(id)a3
{
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setShouldWhisper:(BOOL)a3
{
  self->_shouldWhisper = a3;
}

- (BOOL)shouldWhisper
{
  return self->_shouldWhisper;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setRate:(double)a3
{
  self->_rate = a3;
}

- (double)rate
{
  return self->_rate;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setDisableDeviceRacing:(BOOL)a3
{
  self->_disableDeviceRacing = a3;
}

- (BOOL)disableDeviceRacing
{
  return self->_disableDeviceRacing;
}

- (void)setShouldWaitCurrentSpeaking:(BOOL)a3
{
  self->_shouldWaitCurrentSpeaking = a3;
}

- (BOOL)shouldWaitCurrentSpeaking
{
  return self->_shouldWaitCurrentSpeaking;
}

- (void)setOutputPath:(id)a3
{
}

- (NSURL)outputPath
{
  return self->_outputPath;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setVoiceType:(int64_t)a3
{
  self->_voiceType = a3;
}

- (int64_t)voiceType
{
  return self->_voiceType;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)canLogRequestText
{
  if (self->_canUseServerTTS) {
    return 1;
  }
  v3 = +[VSSpeechInternalSettings standardInstance];
  char v4 = [v3 logSensitiveText];

  return v4;
}

- (id)contextInfoString
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendString:@"{"];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 1;
  contextInfo = self->_contextInfo;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __36__VSSpeechRequest_contextInfoString__block_invoke;
  v10 = &unk_2640E8588;
  id v5 = v3;
  id v11 = v5;
  v12 = v13;
  [(NSDictionary *)contextInfo enumerateKeysAndObjectsUsingBlock:&v7];
  objc_msgSend(v5, "appendString:", @"}", v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
  return v5;
}

uint64_t __36__VSSpeechRequest_contextInfoString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    id v5 = &stru_26C1B0528;
  }
  else {
    id v5 = @"; ";
  }
  uint64_t result = [v4 appendFormat:@"%@%@: %@", v5, a2, a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (VSSpeechRequest)initWithCoder:(id)a3
{
  v44[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)VSSpeechRequest;
  id v5 = [(VSSpeechRequest *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_languageCode"];
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voiceName"];
    voiceName = v5->_voiceName;
    v5->_voiceName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientBundleIdentifier"];
    clientBundleIdentifier = v5->_clientBundleIdentifier;
    v5->_clientBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessoryID"];
    accessoryID = v5->_accessoryID;
    v5->_accessoryID = (NSUUID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_siriRequestId"];
    siriRequestId = v5->_siriRequestId;
    v5->_siriRequestId = (NSUUID *)v16;

    v5->_footprint = [v4 decodeIntegerForKey:@"_footprint"];
    v5->_voiceType = [v4 decodeIntegerForKey:@"_voiceType"];
    v5->_gender = [v4 decodeIntegerForKey:@"_gender"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_outputPath"];
    outputPath = v5->_outputPath;
    v5->_outputPath = (NSURL *)v18;

    [v4 decodeDoubleForKey:@"_rate"];
    v5->_rate = v20;
    [v4 decodeDoubleForKey:@"_pitch"];
    v5->_pitch = v21;
    [v4 decodeDoubleForKey:@"_volume"];
    v5->_volume = v22;
    v5->_shouldWhisper = [v4 decodeBoolForKey:@"_shouldWhisper"];
    v5->_shouldCache = [v4 decodeBoolForKey:@"_shouldCache"];
    v5->_disableCompactVoiceFallback = [v4 decodeBoolForKey:@"_disableCompactVoiceFallback"];
    v5->_disableDeviceRacing = [v4 decodeBoolForKey:@"_disableDeviceRacing"];
    v5->_forceServerTTS = [v4 decodeBoolForKey:@"_forceServerTTS"];
    v5->_canUseServerTTS = [v4 decodeBoolForKey:@"_canUseServerTTS"];
    v5->_retryDeviceOnNetworkStall = [v4 decodeBoolForKey:@"_retryDeviceOnNetworkStall"];
    v5->_shouldStreamAudioData = [v4 decodeBoolForKey:@"_shouldStreamAudioData"];
    v5->_shouldWaitCurrentSpeaking = [v4 decodeBoolForKey:@"_shouldWaitCurrentSpeaking"];
    v5->_audioSessionID = [v4 decodeInt32ForKey:@"_audioSessionID"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resourceListURL"];
    resourceListURL = v5->_resourceListURL;
    v5->_resourceListURL = (NSURL *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resourceSearchPathURL"];
    resourceSearchPathURL = v5->_resourceSearchPathURL;
    v5->_resourceSearchPathURL = (NSURL *)v25;

    v27 = (void *)MEMORY[0x263EFFA08];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
    v29 = [v27 setWithArray:v28];
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"_customResourceURLs"];
    customResourceURLs = v5->_customResourceURLs;
    v5->_customResourceURLs = (NSArray *)v30;

    v32 = (void *)MEMORY[0x263EFFA08];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
    v34 = [v32 setWithArray:v33];
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"_contextInfo"];
    contextInfo = v5->_contextInfo;
    v5->_contextInfo = (NSDictionary *)v35;

    v5->_requestCreatedTimestamp = [v4 decodeInt64ForKey:@"_requestCreatedTimestamp"];
    v5->_pointer = [v4 decodeIntegerForKey:@"_pointer"];
    v5->_powerProfile = [v4 decodeIntegerForKey:@"_powerProfile"];
    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textForAttributes"];
    if (v37)
    {
      CFArrayRef v38 = [v4 decodePropertyListForKey:@"attributes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = VSAttributedStringCreateFromSerializedAttributes(0, v37, v38);
        attributedText = v5->_attributedText;
        v5->_attributedText = (NSAttributedString *)v39;
      }
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"_text"];
  [v5 encodeObject:self->_languageCode forKey:@"_languageCode"];
  [v5 encodeObject:self->_voiceName forKey:@"_voiceName"];
  [v5 encodeObject:self->_clientBundleIdentifier forKey:@"_clientBundleIdentifier"];
  [v5 encodeObject:self->_accessoryID forKey:@"_accessoryID"];
  [v5 encodeObject:self->_siriRequestId forKey:@"_siriRequestId"];
  [v5 encodeInteger:self->_footprint forKey:@"_footprint"];
  [v5 encodeInteger:self->_voiceType forKey:@"_voiceType"];
  [v5 encodeInteger:self->_gender forKey:@"_gender"];
  [v5 encodeObject:self->_outputPath forKey:@"_outputPath"];
  [v5 encodeDouble:@"_rate" forKey:self->_rate];
  [v5 encodeDouble:@"_pitch" forKey:self->_pitch];
  [v5 encodeDouble:@"_volume" forKey:self->_volume];
  [v5 encodeBool:self->_shouldWhisper forKey:@"_shouldWhisper"];
  [v5 encodeBool:self->_shouldCache forKey:@"_shouldCache"];
  [v5 encodeBool:self->_disableCompactVoiceFallback forKey:@"_disableCompactVoiceFallback"];
  [v5 encodeBool:self->_disableDeviceRacing forKey:@"_disableDeviceRacing"];
  [v5 encodeBool:self->_forceServerTTS forKey:@"_forceServerTTS"];
  [v5 encodeBool:self->_canUseServerTTS forKey:@"_canUseServerTTS"];
  [v5 encodeBool:self->_retryDeviceOnNetworkStall forKey:@"_retryDeviceOnNetworkStall"];
  [v5 encodeBool:self->_shouldStreamAudioData forKey:@"_shouldStreamAudioData"];
  [v5 encodeBool:self->_shouldWaitCurrentSpeaking forKey:@"_shouldWaitCurrentSpeaking"];
  [v5 encodeInt32:self->_audioSessionID forKey:@"_audioSessionID"];
  [v5 encodeObject:self->_resourceListURL forKey:@"_resourceListURL"];
  [v5 encodeObject:self->_resourceSearchPathURL forKey:@"_resourceSearchPathURL"];
  [v5 encodeObject:self->_customResourceURLs forKey:@"_customResourceURLs"];
  [v5 encodeObject:self->_contextInfo forKey:@"_contextInfo"];
  [v5 encodeInt64:self->_requestCreatedTimestamp forKey:@"_requestCreatedTimestamp"];
  [v5 encodeInteger:self->_pointer forKey:@"_pointer"];
  [v5 encodeInteger:self->_powerProfile forKey:@"_powerProfile"];
  uint64_t v6 = [(NSAttributedString *)self->_attributedText string];
  [v5 encodeObject:v6 forKey:@"textForAttributes"];

  SerializedAttributes = VSAttributedStringCreateSerializedAttributes(0, (CFAttributedStringRef)self->_attributedText);
  [v5 encodeObject:SerializedAttributes forKey:@"attributes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[VSSpeechRequest allocWithZone:](VSSpeechRequest, "allocWithZone:") init];
  uint64_t v6 = [(VSSpeechRequest *)self text];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [(VSSpeechRequest *)v5 setText:v7];

  uint64_t v8 = [(VSSpeechRequest *)self languageCode];
  v9 = (void *)[v8 copyWithZone:a3];
  [(VSSpeechRequest *)v5 setLanguageCode:v9];

  [(VSSpeechRequest *)v5 setFootprint:[(VSSpeechRequest *)self footprint]];
  [(VSSpeechRequest *)v5 setVoiceType:[(VSSpeechRequest *)self voiceType]];
  [(VSSpeechRequest *)v5 setGender:[(VSSpeechRequest *)self gender]];
  uint64_t v10 = [(VSSpeechRequest *)self voiceName];
  [(VSSpeechRequest *)v5 setVoiceName:v10];

  id v11 = [(VSSpeechRequest *)self outputPath];
  uint64_t v12 = (void *)[v11 copyWithZone:a3];
  [(VSSpeechRequest *)v5 setOutputPath:v12];

  [(VSSpeechRequest *)v5 setShouldCache:[(VSSpeechRequest *)self shouldCache]];
  [(VSSpeechRequest *)v5 setShouldWaitCurrentSpeaking:[(VSSpeechRequest *)self shouldWaitCurrentSpeaking]];
  [(VSSpeechRequest *)self rate];
  -[VSSpeechRequest setRate:](v5, "setRate:");
  [(VSSpeechRequest *)self pitch];
  -[VSSpeechRequest setPitch:](v5, "setPitch:");
  [(VSSpeechRequest *)self volume];
  -[VSSpeechRequest setVolume:](v5, "setVolume:");
  [(VSSpeechRequest *)v5 setShouldWhisper:[(VSSpeechRequest *)self shouldWhisper]];
  v13 = [(VSSpeechRequest *)self contextInfo];
  uint64_t v14 = (void *)[v13 copyWithZone:a3];
  [(VSSpeechRequest *)v5 setContextInfo:v14];

  [(VSSpeechRequest *)v5 setDisableCompactVoiceFallback:[(VSSpeechRequest *)self disableCompactVoiceFallback]];
  [(VSSpeechRequest *)v5 setDisableDeviceRacing:[(VSSpeechRequest *)self disableDeviceRacing]];
  [(VSSpeechRequest *)v5 setAudioSessionID:[(VSSpeechRequest *)self audioSessionID]];
  v15 = [(VSSpeechRequest *)self accessoryID];
  [(VSSpeechRequest *)v5 setAccessoryID:v15];

  [(VSSpeechRequest *)v5 setForceServerTTS:[(VSSpeechRequest *)self forceServerTTS]];
  [(VSSpeechRequest *)v5 setCanUseServerTTS:[(VSSpeechRequest *)self canUseServerTTS]];
  uint64_t v16 = [(VSSpeechRequest *)self resourceListURL];
  v17 = (void *)[v16 copyWithZone:a3];
  [(VSSpeechRequest *)v5 setResourceListURL:v17];

  uint64_t v18 = [(VSSpeechRequest *)self resourceSearchPathURL];
  v19 = (void *)[v18 copyWithZone:a3];
  [(VSSpeechRequest *)v5 setResourceSearchPathURL:v19];

  double v20 = [(VSSpeechRequest *)self customResourceURLs];
  double v21 = (void *)[v20 copyWithZone:a3];
  [(VSSpeechRequest *)v5 setCustomResourceURLs:v21];

  [(VSSpeechRequest *)v5 setPowerProfile:[(VSSpeechRequest *)self powerProfile]];
  return v5;
}

- (BOOL)isSimilarTo:(id)a3
{
  id v4 = (VSSpeechRequest *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      uint64_t v7 = [(VSSpeechRequest *)v4 languageCode];
      if ([v7 isEqualToString:self->_languageCode])
      {
        uint64_t v8 = [(VSSpeechRequest *)v4 text];
        if ([v8 isEqualToString:self->_text])
        {
          v9 = [(VSSpeechRequest *)v4 contextInfo];
          if ([v9 isEqualToDictionary:self->_contextInfo]
            && [(VSSpeechRequest *)v4 footprint] == self->_footprint
            && [(VSSpeechRequest *)v4 voiceType] == self->_voiceType
            && [(VSSpeechRequest *)v4 gender] == self->_gender)
          {
            uint64_t v10 = [(VSSpeechRequest *)v4 voiceName];
            id v11 = v10;
            if (self->_voiceName) {
              voiceName = (__CFString *)self->_voiceName;
            }
            else {
              voiceName = &stru_26C1B0528;
            }
            if ([v10 isEqualToString:voiceName]
              && ([(VSSpeechRequest *)v4 rate], v13 == self->_rate)
              && ([(VSSpeechRequest *)v4 pitch], v14 == self->_pitch)
              && ([(VSSpeechRequest *)v4 volume], v15 == self->_volume)
              && self->_shouldWhisper == [(VSSpeechRequest *)v4 shouldWhisper]
              && self->_canUseServerTTS == [(VSSpeechRequest *)v4 canUseServerTTS])
            {
              uint64_t v16 = [(VSSpeechRequest *)v4 customResourceURLs];
              char v6 = [v16 isEqualToArray:self->_customResourceURLs];
            }
            else
            {
              char v6 = 0;
            }
          }
          else
          {
            char v6 = 0;
          }
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  unint64_t requestCreatedTimestamp = self->_requestCreatedTimestamp;
  v24 = NSString;
  voiceName = self->_voiceName;
  languageCode = self->_languageCode;
  double v20 = +[VSVoiceAsset genderStringFromGender:self->_gender];
  v19 = +[VSVoiceAsset typeStringFromType:self->_voiceType];
  uint64_t v18 = +[VSVoiceAsset footprintStringFromFootprint:self->_footprint];
  long long v17 = *(_OWORD *)&self->_rate;
  double volume = self->_volume;
  BOOL shouldWhisper = self->_shouldWhisper;
  BOOL canUseServerTTS = self->_canUseServerTTS;
  BOOL disableCompactVoiceFallback = self->_disableCompactVoiceFallback;
  BOOL disableDeviceRacing = self->_disableDeviceRacing;
  BOOL shouldWaitCurrentSpeaking = self->_shouldWaitCurrentSpeaking;
  BOOL shouldCache = self->_shouldCache;
  v9 = [(VSSpeechRequest *)self contextInfoString];
  customResourceURLs = self->_customResourceURLs;
  accessoryID = self->_accessoryID;
  uint64_t audioSessionID = self->_audioSessionID;
  double v13 = [(VSSpeechRequest *)self logText];
  objc_msgSend(v24, "stringWithFormat:", @"startTime: %llu, language:%@, name:%@, gender:%@, type:%@, footprint:%@, rate:%.2f, pitch:%.2f, volume:%.2f, shouldWhisper:%d, canUseServerTTS:%d, disableCompactFallback:%d, disableDeviceRacing:%d, shouldWaitCurrentSpeaking:%d, shouldCache:%d, contextInfo:%@, customResourceURLs:%@, session:%d, accessoryID:%@, text:'%@'", requestCreatedTimestamp, languageCode, voiceName, v20, v19, v18, v17, *(void *)&volume, shouldWhisper, canUseServerTTS, disableCompactVoiceFallback, disableDeviceRacing, shouldWaitCurrentSpeaking, shouldCache, v9, customResourceURLs,
    audioSessionID,
    accessoryID,
  double v14 = v13);

  return v14;
}

- (id)logUtterance
{
  utterance = self->_utterance;
  int v3 = [(VSSpeechRequest *)self canLogRequestText];
  return VSLoggingStringForUtterance(utterance, v3);
}

- (id)logText
{
  text = self->_text;
  int v3 = [(VSSpeechRequest *)self canLogRequestText];
  return VSLoggingStringForUtterance(text, v3);
}

- (VSSpeechRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSSpeechRequest;
  uint64_t result = [(VSSpeechRequest *)&v8 init];
  if (result)
  {
    result->_BOOL shouldCache = 1;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_rate = _Q0;
    result->_double volume = 0.8;
    result->_pointer = (int64_t)result;
    result->_retryDeviceOnNetworkStall = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end