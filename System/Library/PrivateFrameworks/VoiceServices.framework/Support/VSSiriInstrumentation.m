@interface VSSiriInstrumentation
+ (id)sharedPowerLogger;
+ (int)outputRouteFromRouteInfo:(id)a3;
+ (int)schemaFootprintFromFootprint:(int64_t)a3;
+ (int)schemaVoiceGenderFromGender:(int64_t)a3;
+ (int)schemaVoiceTypeFromType:(int64_t)a3;
+ (int)synthesisSourceFromSource:(int64_t)a3;
+ (void)instrumentPowerEvent:(id)a3 ttsId:(id)a4;
+ (void)instrumentVoicedProcessStartedPowerEvent;
- (NSUUID)contextId;
- (NSUUID)siriRequestId;
- (NSUUID)ttsId;
- (VSSiriInstrumentation)initWithSiriRequestId:(id)a3;
- (void)instrumentRequestReceivedWithText:(id)a3 requestedVoiceType:(int64_t)a4 requestedVoiceFootprint:(int64_t)a5 isPrivate:(BOOL)a6;
- (void)instrumentSpeechCancelled;
- (void)instrumentSpeechEndedWithAudioDuration:(double)a3 synthesisLatency:(double)a4 realTimeFactor:(double)a5 promptCount:(unint64_t)a6 errorCode:(int64_t)a7;
- (void)instrumentSpeechFailedWithErrorCodes:(id)a3;
- (void)instrumentSpeechStartedWithSource:(int64_t)a3 customerPerceivedLatency:(double)a4 audioOutputRoute:(id)a5 voiceType:(int64_t)a6 voiceFootprint:(int64_t)a7 voiceVersion:(unint64_t)a8 resourceVersion:(unint64_t)a9 isWhisper:(BOOL)a10;
- (void)instrumentVoiceFallbackOccurredWithVoice:(id)a3 resource:(id)a4;
- (void)makeRequestLinkEvent;
- (void)setContextId:(id)a3;
- (void)setSiriRequestId:(id)a3;
- (void)setTtsId:(id)a3;
@end

@implementation VSSiriInstrumentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_ttsId, 0);
  objc_storeStrong((id *)&self->_siriRequestId, 0);
}

- (void)setContextId:(id)a3
{
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (void)setTtsId:(id)a3
{
}

- (NSUUID)ttsId
{
  return self->_ttsId;
}

- (void)setSiriRequestId:(id)a3
{
}

- (NSUUID)siriRequestId
{
  return self->_siriRequestId;
}

- (void)instrumentVoiceFallbackOccurredWithVoice:(id)a3 resource:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F6F118];
  id v7 = a4;
  id v8 = a3;
  id v37 = objc_alloc_init(v6);
  id v9 = objc_alloc_init(MEMORY[0x263F6EF08]);
  [v37 setVoiceSettings:v9];

  uint64_t v10 = +[VSSiriInstrumentation schemaVoiceGenderFromGender:](VSSiriInstrumentation, "schemaVoiceGenderFromGender:", [v8 gender]);
  v11 = [v37 voiceSettings];
  [v11 setVoiceGender:v10];

  v12 = [v8 name];
  v13 = [v37 voiceSettings];
  [v13 setVoiceName:v12];

  v14 = (void *)MEMORY[0x263F6EF10];
  v15 = [v8 languages];
  v16 = [v15 firstObject];
  uint64_t v17 = [v14 convertLanguageCodeToSchemaLocale:v16];
  v18 = [v37 voiceSettings];
  [v18 setVoiceAccent:v17];

  id v19 = objc_alloc_init(MEMORY[0x263F6F110]);
  [v37 setContext:v19];

  uint64_t v20 = +[VSSiriInstrumentation schemaVoiceTypeFromType:](VSSiriInstrumentation, "schemaVoiceTypeFromType:", [v8 type]);
  v21 = [v37 context];
  [v21 setVoiceType:v20];

  uint64_t v22 = +[VSSiriInstrumentation schemaFootprintFromFootprint:](VSSiriInstrumentation, "schemaFootprintFromFootprint:", [v8 footprint]);
  v23 = [v37 context];
  [v23 setVoiceFootprint:v22];

  v24 = [v8 contentVersion];

  uint64_t v25 = [v24 integerValue];
  v26 = [v37 context];
  [v26 setVoiceVersion:v25];

  v27 = [v7 contentVersion];

  uint64_t v28 = [v27 integerValue];
  v29 = [v37 context];
  [v29 setResourceVersion:v28];

  id v30 = objc_alloc_init(MEMORY[0x263F6F0C8]);
  [v30 setVoiceFallbackOccurred:v37];
  id v31 = objc_alloc_init(MEMORY[0x263F6F0D0]);
  [v30 setEventMetadata:v31];

  id v32 = objc_alloc(MEMORY[0x263F6EEE0]);
  v33 = [(VSSiriInstrumentation *)self ttsId];
  v34 = (void *)[v32 initWithNSUUID:v33];
  v35 = [v30 eventMetadata];
  [v35 setTtsId:v34];

  v36 = [MEMORY[0x263F6C818] sharedStream];
  [v36 emitMessage:v30];
}

- (void)instrumentSpeechCancelled
{
  id v16 = objc_alloc_init(MEMORY[0x263F6F0F0]);
  [v16 setExists:1];
  id v3 = objc_alloc_init(MEMORY[0x263F6F0D8]);
  [v3 setCancelled:v16];
  id v4 = objc_alloc(MEMORY[0x263F6EEE0]);
  v5 = [(VSSiriInstrumentation *)self contextId];
  v6 = (void *)[v4 initWithNSUUID:v5];
  [v3 setContextId:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F6F0C8]);
  [v7 setSpeechContext:v3];
  id v8 = objc_alloc_init(MEMORY[0x263F6F0D0]);
  [v7 setEventMetadata:v8];

  id v9 = objc_alloc(MEMORY[0x263F6EEE0]);
  uint64_t v10 = [(VSSiriInstrumentation *)self ttsId];
  v11 = (void *)[v9 initWithNSUUID:v10];
  v12 = [v7 eventMetadata];
  [v12 setTtsId:v11];

  v13 = [MEMORY[0x263F6C818] sharedStream];
  [v13 emitMessage:v7];

  v14 = [MEMORY[0x263F73E50] context];
  v15 = [(VSSiriInstrumentation *)self ttsId];
  +[VSSiriInstrumentation instrumentPowerEvent:v14 ttsId:v15];
}

- (void)instrumentSpeechFailedWithErrorCodes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F6F100];
  id v5 = a3;
  id v19 = objc_alloc_init(v4);
  [v19 setErrorCodes:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F6F0D8]);
  [v6 setFailed:v19];
  id v7 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v8 = [(VSSiriInstrumentation *)self contextId];
  id v9 = (void *)[v7 initWithNSUUID:v8];
  [v6 setContextId:v9];

  id v10 = objc_alloc_init(MEMORY[0x263F6F0C8]);
  [v10 setSpeechContext:v6];
  id v11 = objc_alloc_init(MEMORY[0x263F6F0D0]);
  [v10 setEventMetadata:v11];

  id v12 = objc_alloc(MEMORY[0x263F6EEE0]);
  v13 = [(VSSiriInstrumentation *)self ttsId];
  v14 = (void *)[v12 initWithNSUUID:v13];
  v15 = [v10 eventMetadata];
  [v15 setTtsId:v14];

  id v16 = [MEMORY[0x263F6C818] sharedStream];
  [v16 emitMessage:v10];

  uint64_t v17 = [MEMORY[0x263F73E60] context];
  v18 = [(VSSiriInstrumentation *)self ttsId];
  +[VSSiriInstrumentation instrumentPowerEvent:v17 ttsId:v18];
}

- (void)instrumentSpeechEndedWithAudioDuration:(double)a3 synthesisLatency:(double)a4 realTimeFactor:(double)a5 promptCount:(unint64_t)a6 errorCode:(int64_t)a7
{
  v32[1] = *MEMORY[0x263EF8340];
  id v13 = objc_alloc_init(MEMORY[0x263F6F0F8]);
  *(float *)&double v14 = a3;
  [v13 setSynthesizedAudioDurationInSecond:v14];
  *(float *)&double v15 = a4;
  [v13 setSynthesisLatencyInSecond:v15];
  *(float *)&double v16 = a5;
  [v13 setSynthesisRealTimeFactor:v16];
  [v13 setPromptCount:a6];
  uint64_t v17 = [NSNumber numberWithInteger:a7];
  v32[0] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  [v13 setErrorCodes:v18];

  id v19 = objc_alloc_init(MEMORY[0x263F6F0D8]);
  [v19 setEnded:v13];
  id v20 = objc_alloc(MEMORY[0x263F6EEE0]);
  v21 = [(VSSiriInstrumentation *)self contextId];
  uint64_t v22 = (void *)[v20 initWithNSUUID:v21];
  [v19 setContextId:v22];

  id v23 = objc_alloc_init(MEMORY[0x263F6F0C8]);
  [v23 setSpeechContext:v19];
  id v24 = objc_alloc_init(MEMORY[0x263F6F0D0]);
  [v23 setEventMetadata:v24];

  id v25 = objc_alloc(MEMORY[0x263F6EEE0]);
  v26 = [(VSSiriInstrumentation *)self ttsId];
  v27 = (void *)[v25 initWithNSUUID:v26];
  uint64_t v28 = [v23 eventMetadata];
  [v28 setTtsId:v27];

  v29 = [MEMORY[0x263F6C818] sharedStream];
  [v29 emitMessage:v23];

  id v30 = [MEMORY[0x263F73E58] context];
  id v31 = [(VSSiriInstrumentation *)self ttsId];
  +[VSSiriInstrumentation instrumentPowerEvent:v30 ttsId:v31];
}

- (void)instrumentSpeechStartedWithSource:(int64_t)a3 customerPerceivedLatency:(double)a4 audioOutputRoute:(id)a5 voiceType:(int64_t)a6 voiceFootprint:(int64_t)a7 voiceVersion:(unint64_t)a8 resourceVersion:(unint64_t)a9 isWhisper:(BOOL)a10
{
  uint64_t v17 = (objc_class *)MEMORY[0x263F6F108];
  id v18 = a5;
  id v42 = objc_alloc_init(v17);
  uint64_t v19 = +[VSSiriInstrumentation outputRouteFromRouteInfo:v18];

  [v42 setAudioOutputRoute:v19];
  *(float *)&double v20 = a4;
  [v42 setCustomerPerceivedLatencyInSecond:v20];
  objc_msgSend(v42, "setSynthesisSource:", +[VSSiriInstrumentation synthesisSourceFromSource:](VSSiriInstrumentation, "synthesisSourceFromSource:", a3));
  id v21 = objc_alloc_init(MEMORY[0x263F6F110]);
  [v42 setVoiceContext:v21];

  uint64_t v22 = +[VSSiriInstrumentation schemaVoiceTypeFromType:a6];
  id v23 = [v42 voiceContext];
  [v23 setVoiceType:v22];

  uint64_t v24 = +[VSSiriInstrumentation schemaFootprintFromFootprint:a7];
  id v25 = [v42 voiceContext];
  [v25 setVoiceFootprint:v24];

  v26 = [v42 voiceContext];
  [v26 setVoiceVersion:a8];

  v27 = [v42 voiceContext];
  [v27 setResourceVersion:a9];

  if (a10) {
    uint64_t v28 = 3;
  }
  else {
    uint64_t v28 = 2;
  }
  [v42 setSynthesisEffect:v28];
  id v29 = objc_alloc_init(MEMORY[0x263F6F0D8]);
  [v29 setStartedOrChanged:v42];
  id v30 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v31 = [(VSSiriInstrumentation *)self contextId];
  id v32 = (void *)[v30 initWithNSUUID:v31];
  [v29 setContextId:v32];

  id v33 = objc_alloc_init(MEMORY[0x263F6F0C8]);
  [v33 setSpeechContext:v29];
  id v34 = objc_alloc_init(MEMORY[0x263F6F0D0]);
  [v33 setEventMetadata:v34];

  id v35 = objc_alloc(MEMORY[0x263F6EEE0]);
  v36 = [(VSSiriInstrumentation *)self ttsId];
  id v37 = (void *)[v35 initWithNSUUID:v36];
  v38 = [v33 eventMetadata];
  [v38 setTtsId:v37];

  v39 = [MEMORY[0x263F6C818] sharedStream];
  [v39 emitMessage:v33];

  v40 = [MEMORY[0x263F73E68] context];
  v41 = [(VSSiriInstrumentation *)self ttsId];
  +[VSSiriInstrumentation instrumentPowerEvent:v40 ttsId:v41];
}

- (void)instrumentRequestReceivedWithText:(id)a3 requestedVoiceType:(int64_t)a4 requestedVoiceFootprint:(int64_t)a5 isPrivate:(BOOL)a6
{
  id v38 = a3;
  id v10 = objc_alloc_init(MEMORY[0x263F6F0E8]);
  id v11 = v10;
  if (!a6) {
    [v10 setTextToSynthesize:v38];
  }
  id v12 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v13 = [MEMORY[0x263F08C38] UUID];
  double v14 = (void *)[v12 initWithNSUUID:v13];
  [v11 setLinkId:v14];

  id v15 = objc_alloc_init(MEMORY[0x263F6F0C8]);
  [v15 setRequestReceivedTier1:v11];
  id v16 = objc_alloc_init(MEMORY[0x263F6F0D0]);
  [v15 setEventMetadata:v16];

  id v17 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v18 = [(VSSiriInstrumentation *)self ttsId];
  uint64_t v19 = (void *)[v17 initWithNSUUID:v18];
  double v20 = [v15 eventMetadata];
  [v20 setTtsId:v19];

  id v21 = [MEMORY[0x263F6C818] sharedStream];
  [v21 emitMessage:v15];

  id v22 = objc_alloc_init(MEMORY[0x263F6F0E0]);
  id v23 = [v11 linkId];
  [v22 setLinkId:v23];

  id v24 = objc_alloc_init(MEMORY[0x263F6F110]);
  [v22 setRequestedVoiceContext:v24];

  uint64_t v25 = +[VSSiriInstrumentation schemaVoiceTypeFromType:a4];
  v26 = [v22 requestedVoiceContext];
  [v26 setVoiceType:v25];

  uint64_t v27 = +[VSSiriInstrumentation schemaFootprintFromFootprint:a5];
  uint64_t v28 = [v22 requestedVoiceContext];
  [v28 setVoiceFootprint:v27];

  objc_msgSend(v22, "setInputTextLength:", objc_msgSend(v38, "length"));
  id v29 = objc_alloc_init(MEMORY[0x263F6F0C8]);
  [v29 setRequestReceived:v22];
  id v30 = objc_alloc_init(MEMORY[0x263F6F0D0]);
  [v29 setEventMetadata:v30];

  id v31 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v32 = [(VSSiriInstrumentation *)self ttsId];
  id v33 = (void *)[v31 initWithNSUUID:v32];
  id v34 = [v29 eventMetadata];
  [v34 setTtsId:v33];

  id v35 = [MEMORY[0x263F6C818] sharedStream];
  [v35 emitMessage:v29];

  v36 = [MEMORY[0x263F73E48] context];
  id v37 = [(VSSiriInstrumentation *)self ttsId];
  +[VSSiriInstrumentation instrumentPowerEvent:v36 ttsId:v37];
}

- (void)makeRequestLinkEvent
{
  id v8 = (id)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:self->_siriRequestId];
  id v3 = objc_alloc_init(MEMORY[0x263F6EDC0]);
  [v3 setUuid:v8];
  [v3 setComponent:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:self->_ttsId];
  id v5 = objc_alloc_init(MEMORY[0x263F6EDC0]);
  [v5 setUuid:v4];
  [v5 setComponent:13];
  id v6 = objc_alloc_init(MEMORY[0x263F6EDB8]);
  [v6 setSource:v5];
  [v6 setTarget:v3];
  id v7 = [MEMORY[0x263F6C818] sharedStream];
  [v7 emitMessage:v6];
}

- (VSSiriInstrumentation)initWithSiriRequestId:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VSSiriInstrumentation;
  id v6 = [(VSSiriInstrumentation *)&v15 init];
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = [MEMORY[0x263F6C818] derivedIdentifierForComponentName:13 fromSourceIdentifier:v5];
  ttsId = v6->_ttsId;
  v6->_ttsId = (NSUUID *)v7;

  if (v6->_ttsId)
  {
    objc_storeStrong((id *)&v6->_siriRequestId, a3);
    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    contextId = v6->_contextId;
    v6->_contextId = (NSUUID *)v9;

    [(VSSiriInstrumentation *)v6 makeRequestLinkEvent];
LABEL_4:
    id v11 = v6;
    goto LABEL_8;
  }
  id v12 = VSGetLogDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)double v14 = 0;
    _os_log_fault_impl(&dword_226CB1000, v12, OS_LOG_TYPE_FAULT, "AssistantSiriAnalytics should always derive an identifier for SISchemaComponentName_COMPONENTNAME_TTS", v14, 2u);
  }

  id v11 = 0;
LABEL_8:

  return v11;
}

+ (void)instrumentPowerEvent:(id)a3 ttsId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[VSSiriInstrumentation sharedPowerLogger];
  uint64_t v7 = [v8 captureSnapshot];
  [v7 logWithEventContext:v6 ttsIdentifier:v5];
}

+ (void)instrumentVoicedProcessStartedPowerEvent
{
  id v4 = +[VSSiriInstrumentation sharedPowerLogger];
  v2 = [v4 captureSnapshot];
  id v3 = [MEMORY[0x263F73E40] context];
  [v2 logWithEventContext:v3];
}

+ (id)sharedPowerLogger
{
  if (sharedPowerLogger_once != -1) {
    dispatch_once(&sharedPowerLogger_once, &__block_literal_global_3557);
  }
  v2 = (void *)sharedPowerLogger_sharedInstance;
  return v2;
}

uint64_t __42__VSSiriInstrumentation_sharedPowerLogger__block_invoke()
{
  sharedPowerLogger_sharedInstance = [objc_alloc(MEMORY[0x263F73E38]) initWithCurrentProcess];
  return MEMORY[0x270F9A758]();
}

+ (int)synthesisSourceFromSource:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return 1;
  }
  else {
    return dword_226CFFD94[a3];
  }
}

+ (int)outputRouteFromRouteInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 audioRouteName];
  if ([v4 isEqualToString:@"Speaker"])
  {
    int v5 = 2;
  }
  else if ([v4 isEqualToString:@"CarAudioOutput"])
  {
    int v5 = 7;
  }
  else
  {
    int v6 = [v3 isBluetoothRoute];
    int v7 = [v3 isAppleProduct];
    int v8 = v7 ^ 1;
    if (((v6 ^ 1) & 1) != 0 || v8)
    {
      int v9 = v6 | v8;
      if (v6 | v7) {
        int v10 = 1;
      }
      else {
        int v10 = 6;
      }
      if (v9 == 1) {
        int v11 = v10;
      }
      else {
        int v11 = 5;
      }
      if ((v6 ^ 1 | v7) == 1) {
        int v5 = v11;
      }
      else {
        int v5 = 4;
      }
    }
    else
    {
      int v5 = 3;
    }
  }

  return v5;
}

+ (int)schemaFootprintFromFootprint:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 1;
  }
  else {
    return a3 + 1;
  }
}

+ (int)schemaVoiceTypeFromType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 1;
  }
  else {
    return dword_226CFFD20[a3 - 1];
  }
}

+ (int)schemaVoiceGenderFromGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return dword_226CFFD88[a3 - 1];
  }
}

@end