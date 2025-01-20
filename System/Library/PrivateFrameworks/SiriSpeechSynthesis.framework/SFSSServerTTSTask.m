@interface SFSSServerTTSTask
+ (AudioStreamBasicDescription)audioStreamBasicDescription:(SEL)a3;
+ (id)createGrpcHeadersFromRequest:(id)a3;
+ (id)createOspreyRequestFromReqeust:(id)a3;
+ (id)flatPhonemeSequence:(id)a3;
+ (id)generateProsodyTransferConfig:(id)a3;
+ (id)generateResourceAssetFromResourceMetaInfo:(id)a3;
+ (id)generateVoiceAssetFromVoiceMetaInfo:(id)a3;
+ (int64_t)convertPhoneSetTypeToServerPhoneSetType:(int64_t)a3;
+ (int64_t)convertVoiceTypeToServerType:(int64_t)a3;
- (SFSSOspreyTTSClient)ospreyTTSClient;
- (SFSSServerTTSTask)initWithRequest:(id)a3;
- (void)cancelTask;
- (void)setOspreyTTSClient:(id)a3;
- (void)startTask:(id)a3;
@end

@implementation SFSSServerTTSTask

- (void).cxx_destruct
{
}

- (void)setOspreyTTSClient:(id)a3
{
}

- (SFSSOspreyTTSClient)ospreyTTSClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ospreyTTSClient);
  return (SFSSOspreyTTSClient *)WeakRetained;
}

- (void)cancelTask
{
  v2 = SFSSGetLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_22B575000, v2, OS_LOG_TYPE_DEBUG, "Server Task cancelled.", v3, 2u);
  }
}

- (void)startTask:(id)a3
{
  id v4 = a3;
  v5 = [(SFSpeechSynthesisTask *)self request];
  v6 = +[SFSSServerTTSTask createOspreyRequestFromReqeust:v5];

  v7 = [(SFSpeechSynthesisTask *)self request];
  v8 = +[SFSSServerTTSTask createGrpcHeadersFromRequest:v7];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__353;
  v17[4] = __Block_byref_object_dispose__354;
  id v18 = (id)MEMORY[0x230F4BDC0](v4);
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ospreyTTSClient);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __31__SFSSServerTTSTask_startTask___block_invoke;
  v14[3] = &unk_26489E8B0;
  objc_copyWeak(&v15, &location);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __31__SFSSServerTTSTask_startTask___block_invoke_19;
  v12[3] = &unk_26489E8D8;
  objc_copyWeak(&v13, &location);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__SFSSServerTTSTask_startTask___block_invoke_23;
  v10[3] = &unk_26489E920;
  objc_copyWeak(&v11, &location);
  v10[4] = v17;
  [WeakRetained streamTTS:v6 headers:v8 beginHandler:v14 chunkHandler:v12 endHandler:&__block_literal_global_355 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
}

void __31__SFSSServerTTSTask_startTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SFSSGetLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B575000, v4, OS_LOG_TYPE_INFO, "Received streaming begin response.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v19 = 0;
  *(_OWORD *)buf = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(v3, "decoder_description");
  +[SFSSServerTTSTask audioStreamBasicDescription:v6];

  v7 = objc_msgSend(v3, "meta_info");
  v8 = [v7 voice];
  v9 = +[SFSSServerTTSTask generateVoiceAssetFromVoiceMetaInfo:v8];

  v10 = objc_msgSend(v3, "meta_info");
  id v11 = [v10 resource];
  v12 = +[SFSSServerTTSTask generateResourceAssetFromResourceMetaInfo:v11];

  objc_msgSend(v3, "streaming_playback_buffer_size_in_seconds");
  float v14 = v13;

  v15[0] = *(_OWORD *)buf;
  v15[1] = v18;
  uint64_t v16 = v19;
  [WeakRetained handleSynthesisBegin:0 asbd:v15 audioPlaybackBufferDuration:v9 voiceAsset:v12 resourceAsset:v14];
}

void __31__SFSSServerTTSTask_startTask___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SFSSGetLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67109120;
    v12[1] = objc_msgSend(v3, "current_pkt_number");
    _os_log_debug_impl(&dword_22B575000, v4, OS_LOG_TYPE_DEBUG, "Received streaming partial response. pkt_number=%d", (uint8_t *)v12, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [v3 audio];
  [WeakRetained handleSynthesisChunks:v6];

  v7 = [WeakRetained request];
  int v8 = [v7 returnFrontEndFeature];

  if (v8)
  {
    v9 = [v3 feature];
    v10 = objc_msgSend(v9, "phoneme_sequence");
    id v11 = +[SFSSServerTTSTask flatPhonemeSequence:v10];
    [WeakRetained handleSynthesisFrontendFeaturePhoneme:v11];
  }
}

void __31__SFSSServerTTSTask_startTask___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleSynthesisEnd:v4];

  v6 = SFSSGetLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [WeakRetained error];
    int v12 = 138412290;
    uint64_t v13 = v7;
    _os_log_impl(&dword_22B575000, v6, OS_LOG_TYPE_INFO, "Server tts complete. error=%@", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v8)
  {
    v9 = [WeakRetained error];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

void __31__SFSSServerTTSTask_startTask___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = objc_msgSend(v2, "total_pkt_number");
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Received streaming end response. total_pkt=%d", (uint8_t *)v4, 8u);
  }
}

- (SFSSServerTTSTask)initWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SFSSGetLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "Init server tts task.", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)SFSSServerTTSTask;
  v6 = [(SFSpeechSynthesisTask *)&v24 initWithRequest:v4];
  if (v6)
  {
    v7 = [v4 voice];
    uint64_t v8 = [v7 voiceReleaseType];

    if (v8 == 6)
    {
      v9 = +[SFSSOspreyTTSClientFactory sharedInstance];
      v23 = [v4 voice];
      uint64_t v10 = [v23 serverVoiceConfig];
      id v11 = [v10 ospreyEndpointUrl];
      int v12 = [v4 voice];
      uint64_t v13 = [v12 serverVoiceConfig];
      uint64_t v14 = [v13 useBlazar];
      id v15 = [v4 voice];
      uint64_t v16 = [v15 serverVoiceConfig];
      v17 = objc_msgSend(v9, "getOspreyClientByUrl:useBlazar:enableAuthentication:", v11, v14, objc_msgSend(v16, "enableAuthentication"));
      objc_storeWeak((id *)&v6->_ospreyTTSClient, v17);

      long long v18 = v23;
    }
    else
    {
      uint64_t v19 = [v4 voice];
      uint64_t v20 = [v19 voiceReleaseType];

      v9 = +[SFSSOspreyTTSClientFactory sharedInstance];
      long long v18 = +[SFSpeechSynthesisInternalSetting sharedInstance];
      uint64_t v10 = [v4 voice];
      id v11 = objc_msgSend(v18, "ospreyEndpointURLByType:", objc_msgSend(v10, "voiceReleaseType"));
      if (v20 == 7) {
        [v9 getOspreyClientByUrl:v11 useBlazar:0 enableAuthentication:0];
      }
      else {
      int v12 = [v9 getOspreyClientByUrl:v11];
      }
      objc_storeWeak((id *)&v6->_ospreyTTSClient, v12);
    }

    v21 = [(SFSpeechSynthesisTask *)v6 instrumentMetrics];
    [v21 setSourceOfTTS:3];
  }
  return v6;
}

+ (id)flatPhonemeSequence:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v3;
  uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v7 = objc_msgSend(v6, "word_phonemes");
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              int v12 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              long long v22 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              uint64_t v13 = [v12 phonemes];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v34 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v23;
                do
                {
                  for (uint64_t k = 0; k != v15; ++k)
                  {
                    if (*(void *)v23 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    [v4 addObject:*(void *)(*((void *)&v22 + 1) + 8 * k)];
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v34 count:16];
                }
                while (v15);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v35 count:16];
          }
          while (v9);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v21);
  }

  return v4;
}

+ (int64_t)convertVoiceTypeToServerType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 3;
  }
}

+ (int64_t)convertPhoneSetTypeToServerPhoneSetType:(int64_t)a3
{
  return a3 == 1;
}

+ (AudioStreamBasicDescription)audioStreamBasicDescription:(SEL)a3
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  id v5 = a4;
  retstr->mFormatID = objc_msgSend(v5, "format_id");
  objc_msgSend(v5, "sample_rate");
  retstr->mSampleRate = v6;
  retstr->mFormatFlags = objc_msgSend(v5, "format_flags");
  retstr->mBytesPerPacket = objc_msgSend(v5, "bytes_per_packet");
  retstr->mFramesPerPacket = objc_msgSend(v5, "frames_per_packet");
  retstr->mBytesPerFrame = objc_msgSend(v5, "bytes_per_frame");
  retstr->mChannelsPerFrame = objc_msgSend(v5, "channels_per_frame");
  retstr->mBitsPerChannel = objc_msgSend(v5, "bits_per_channel");
  UInt32 v7 = [v5 reserved];

  retstr->mReserved = v7;
  return result;
}

+ (id)createGrpcHeadersFromRequest:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 devServiceType];
  if ([v4 length])
  {
    uint64_t v8 = @"tts-dev-proxy-service-name";
    id v5 = [v3 devServiceType];
    v9[0] = v5;
    Float64 v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    Float64 v6 = (void *)MEMORY[0x263EFFA78];
  }

  return v6;
}

+ (id)createOspreyRequestFromReqeust:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(QSSMutableStartTextToSpeechStreamingRequest);
  id v5 = [v3 requestIdentifer];
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setSession_id:v5];

  Float64 v6 = [v3 locale];
  UInt32 v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setLanguage:v7];

  uint64_t v8 = [v3 gender];
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setGender:v8];

  uint64_t v9 = [v3 text];
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setText:v9];

  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setAudio_type:1];
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setEnable_word_timing_info:0];
  uint64_t v10 = [v3 voiceName];
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setVoice_name:v10];

  id v11 = objc_alloc_init(QSSMutableTextToSpeechRequestMeta);
  int v12 = [v3 clientBundleIdentifier];
  [(QSSMutableTextToSpeechRequestMeta *)v11 setApp_id:v12];

  [(QSSMutableTextToSpeechRequestMeta *)v11 setChannel_type:2];
  -[QSSMutableTextToSpeechRequestMeta setIs_synthesis:](v11, "setIs_synthesis:", [v3 type] == 1);
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setMeta_info:v11];
  uint64_t v13 = [v3 voice];
  -[QSSMutableStartTextToSpeechStreamingRequest setPreferred_voice_type:](v4, "setPreferred_voice_type:", +[SFSSServerTTSTask convertVoiceTypeToServerType:](SFSSServerTTSTask, "convertVoiceTypeToServerType:", [v13 voiceType]));

  uint64_t v14 = objc_alloc_init(QSSMutableTTSRequestFeatureFlags);
  -[QSSMutableTTSRequestFeatureFlags setFe_feature:](v14, "setFe_feature:", [v3 returnFrontEndFeature]);
  -[QSSMutableTTSRequestFeatureFlags setPhoneset_type:](v14, "setPhoneset_type:", +[SFSSServerTTSTask convertPhoneSetTypeToServerPhoneSetType:](SFSSServerTTSTask, "convertPhoneSetTypeToServerPhoneSetType:", [v3 phoneSetType]));
  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setFeature_flags:v14];
  uint64_t v15 = +[SFSSServerTTSTask generateProsodyTransferConfig:v3];

  [(QSSMutableStartTextToSpeechStreamingRequest *)v4 setProsody_config:v15];
  return v4;
}

+ (id)generateProsodyTransferConfig:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(QSSMutableTextToSpeechRequestProsodyTransferConfig);
  id v5 = objc_alloc_init(QSSMutableTextToSpeechSpeechFeatureInputWave);
  Float64 v6 = objc_alloc_init(QSSMutableTextToSpeechUserVoiceProfile);
  UInt32 v7 = [v3 prosodyTransferData];
  uint64_t v8 = [v7 userVoiceProfile];
  objc_msgSend(v8, "pitch_mean");
  -[QSSMutableTextToSpeechUserVoiceProfile setPitch_mean:](v6, "setPitch_mean:");

  uint64_t v9 = [v3 prosodyTransferData];
  uint64_t v10 = [v9 userVoiceProfile];
  objc_msgSend(v10, "pitch_std");
  -[QSSMutableTextToSpeechUserVoiceProfile setPitch_std:](v6, "setPitch_std:");

  id v11 = [v3 prosodyTransferData];
  int v12 = [v11 userVoiceProfile];
  objc_msgSend(v12, "energy_mean");
  -[QSSMutableTextToSpeechUserVoiceProfile setEnergy_mean:](v6, "setEnergy_mean:");

  uint64_t v13 = [v3 prosodyTransferData];
  uint64_t v14 = [v13 userVoiceProfile];
  objc_msgSend(v14, "energy_std");
  -[QSSMutableTextToSpeechUserVoiceProfile setEnergy_std:](v6, "setEnergy_std:");

  uint64_t v15 = [v3 prosodyTransferData];
  uint64_t v16 = [v15 userVoiceProfile];
  objc_msgSend(v16, "duration_mean");
  -[QSSMutableTextToSpeechUserVoiceProfile setDuration_mean:](v6, "setDuration_mean:");

  v17 = [v3 prosodyTransferData];
  long long v18 = [v17 userVoiceProfile];
  objc_msgSend(v18, "duration_std");
  -[QSSMutableTextToSpeechUserVoiceProfile setDuration_std:](v6, "setDuration_std:");

  uint64_t v19 = [v3 prosodyTransferData];
  uint64_t v20 = [v19 waveData];
  [(QSSMutableTextToSpeechSpeechFeatureInputWave *)v5 setPcm_data:v20];

  uint64_t v21 = [v3 prosodyTransferData];
  long long v22 = v21;
  if (v21)
  {
    [v21 asbd];
    uint64_t v23 = (int)*(double *)&v27;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
  }
  -[QSSMutableTextToSpeechSpeechFeatureInputWave setSample_rate:](v5, "setSample_rate:", v23, v27, v28, v29);

  [(QSSMutableTextToSpeechRequestProsodyTransferConfig *)v4 setWave_data:v5];
  [(QSSMutableTextToSpeechRequestProsodyTransferConfig *)v4 setUser_voice_profile:v6];
  long long v24 = [v3 prosodyTransferData];
  long long v25 = [v24 userVoiceProfileUrl];
  [(QSSMutableTextToSpeechRequestProsodyTransferConfig *)v4 setUser_voice_profile_url:v25];

  return v4;
}

+ (id)generateResourceAssetFromResourceMetaInfo:(id)a3
{
  id v3 = a3;
  id v4 = [SFSSResourceAsset alloc];
  id v5 = [v3 language];
  Float64 v6 = [v3 version];

  id v7 = -[SFSSResourceAsset init:contentVersion:](v4, "init:contentVersion:", v5, [v6 integerValue]);
  return v7;
}

+ (id)generateVoiceAssetFromVoiceMetaInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 gender];
  int64_t v5 = +[SFSpeechSynthesisUtils genderFromString:v4];

  Float64 v6 = [v3 quality];
  int64_t v7 = +[SFSpeechSynthesisUtils footprintFromString:v6];

  uint64_t v8 = [v3 type];
  int64_t v9 = +[SFSpeechSynthesisUtils typeFromString:v8];

  uint64_t v10 = [SFSSVoiceAsset alloc];
  id v11 = [v3 language];
  int v12 = [v3 name];
  uint64_t v13 = [v3 version];

  id v14 = -[SFSSVoiceAsset init:gender:name:type:footprint:contentVersion:](v10, "init:gender:name:type:footprint:contentVersion:", v11, v5, v12, v9, v7, [v13 integerValue]);
  return v14;
}

@end