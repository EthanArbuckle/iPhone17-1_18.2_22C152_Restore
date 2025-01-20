@interface SVXSpeechInstrumentationUtilities
- (void)emitTextToSpeechRequestReceived:(id)a3 instrumentMetrics:(id)a4;
@end

@implementation SVXSpeechInstrumentationUtilities

- (void)emitTextToSpeechRequestReceived:(id)a3 instrumentMetrics:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x263F6EDA0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v9 = [v5 voice];
  v10 = [v9 assetKey];
  [v8 setVoiceAssetKey:v10];

  v11 = [v5 resource];
  v12 = [v11 assetKey];
  [v8 setVoiceResourceAssetKey:v12];

  objc_msgSend(v8, "setIsWarmStart:", objc_msgSend(v5, "isWarmStart"));
  objc_msgSend(v8, "setIsSynthesisCached:", objc_msgSend(v5, "sourceOfTTS") == 8);
  objc_msgSend(v8, "setSourceOfTTS:", objc_msgSend(v5, "sourceOfTTS"));
  objc_msgSend(v8, "setSpeechError:", objc_msgSend(v5, "errorCode"));
  v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    v15 = "-[SVXSpeechInstrumentationUtilities emitTextToSpeechRequestReceived:instrumentMetrics:]";
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit TTS Request Received event", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(v7, "emitInstrumentation:machAbsoluteTime:", v8, objc_msgSend(v5, "requestCreatedTime"));
}

@end