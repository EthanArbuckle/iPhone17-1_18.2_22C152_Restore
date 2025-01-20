@interface SSRVoiceProfileComposer
+ (id)sharedTrainer;
- (BOOL)addUtterance:(id)a3 toProfile:(id)a4;
- (BOOL)addUtterance:(id)a3 toProfile:(id)a4 withAsset:(id)a5;
- (BOOL)addUtterance:(id)a3 toProfile:(id)a4 withAsset:(id)a5 sessionUtteranceId:(id)a6 sessionMHUUID:(id)a7 phId:(unint64_t)a8;
- (NSString)speechId;
- (OS_dispatch_queue)queue;
- (SSRVoiceProfileComposer)init;
- (id)_donateEnrollmentUtternace:(id)a3 locale:(id)a4;
- (id)donateAndLogEnrollmentUtterance:(id)a3 locale:(id)a4 utteranceId:(unint64_t)a5 mhUUID:(id)a6 phId:(unint64_t)a7;
- (void)_logEnrollmentUtterance:(id)a3 utteranceId:(unint64_t)a4 mhUUID:(id)a5 locale:(id)a6 phId:(unint64_t)a7;
- (void)setQueue:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setSpeechIdForDonationLogging:(id)a3;
@end

@implementation SSRVoiceProfileComposer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSpeechIdForDonationLogging:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SSRVoiceProfileComposer_setSpeechIdForDonationLogging___block_invoke;
  v7[3] = &unk_26442A138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__SSRVoiceProfileComposer_setSpeechIdForDonationLogging___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 136315394;
    v5 = "-[SSRVoiceProfileComposer setSpeechIdForDonationLogging:]_block_invoke";
    __int16 v6 = 2114;
    uint64_t v7 = v3;
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Setting speechId:%{public}@ for donation", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_logEnrollmentUtterance:(id)a3 utteranceId:(unint64_t)a4 mhUUID:(id)a5 locale:(id)a6 phId:(unint64_t)a7
{
  id v22 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v14 = [v13 siriDataSharingOptInStatus];

  if (v22 && v14 == 1)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F6ECD8]);
    v16 = (void *)[objc_alloc(MEMORY[0x263F6EED8]) initWithNSUUID:v22];
    [v15 setAudioId:v16];
    [v15 setPageNumber:a4];
    objc_msgSend(v15, "setTriggerPhrase:", +[SSRUtils convertToSchemaEnumWithPhId:](SSRUtils, "convertToSchemaEnumWithPhId:", a7));
    v17 = +[SSRUtils convertSchemaTypeWithLocale:v12];
    [v15 setSiriInputLocale:v17];

    id v18 = objc_alloc_init(MEMORY[0x263F6ECA8]);
    id v19 = objc_alloc_init(MEMORY[0x263F6ECB0]);
    v20 = (void *)[objc_alloc(MEMORY[0x263F6EED8]) initWithNSUUID:v11];
    [v19 setSiriSetupId:v20];

    [v18 setEventMetadata:v19];
    [v18 setEnrollmentUtteranceDetected:v15];
    v21 = [MEMORY[0x263F6C810] sharedStream];
    [v21 emitMessage:v18];
  }
}

- (id)_donateEnrollmentUtternace:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v9 = [v8 siriDataSharingOptInStatus];

  if (v9 == 1)
  {
    v10 = [MEMORY[0x263F380D0] dateWithSaltGrain];
    id v11 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v7];
    LODWORD(v12) = kCSVTUITrainingSessionSampleRate;
    v13 = +[SSRUtils createAVAudioPCMBufferWithNSData:v6 audioFormat:3 sampleRate:1 numOfChannel:0 isInterleaved:v12];
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObject:v13];
    id v15 = [[_TtC18SpeakerRecognition26VTUITrainingSpeechDonation alloc] initWithDonorBundleID:@"com.apple.siri.enrollment" recordingDate:v10 locale:v11 transcription:&stru_26CD357C0];
    v16 = v15;
    if (self->_speechId) {
      -[VTUITrainingSpeechDonation donateWithAudioBuffer:speechId:](v15, "donateWithAudioBuffer:speechId:", v14);
    }
    else {
    v17 = [(VTUITrainingSpeechDonation *)v15 donateWithAudioBuffer:v14];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)donateAndLogEnrollmentUtterance:(id)a3 locale:(id)a4 utteranceId:(unint64_t)a5 mhUUID:(id)a6 phId:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [(SSRVoiceProfileComposer *)self _donateEnrollmentUtternace:a3 locale:v12];
  queue = self->_queue;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __90__SSRVoiceProfileComposer_donateAndLogEnrollmentUtterance_locale_utteranceId_mhUUID_phId___block_invoke;
  v24 = &unk_2644292B8;
  v25 = self;
  id v26 = v14;
  id v27 = v13;
  id v28 = v12;
  unint64_t v29 = a5;
  unint64_t v30 = a7;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  dispatch_async(queue, &v21);
  id v19 = objc_msgSend(v18, "UUIDString", v21, v22, v23, v24, v25);

  return v19;
}

uint64_t __90__SSRVoiceProfileComposer_donateAndLogEnrollmentUtterance_locale_utteranceId_mhUUID_phId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logEnrollmentUtterance:*(void *)(a1 + 40) utteranceId:*(void *)(a1 + 64) mhUUID:*(void *)(a1 + 48) locale:*(void *)(a1 + 56) phId:*(void *)(a1 + 72)];
}

- (BOOL)addUtterance:(id)a3 toProfile:(id)a4 withAsset:(id)a5 sessionUtteranceId:(id)a6 sessionMHUUID:(id)a7 phId:(unint64_t)a8
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  BOOL v18 = [(SSRVoiceProfileComposer *)self addUtterance:v14 toProfile:v15 withAsset:a5];
  if (v16 && v17)
  {
    id v19 = [v15 locale];
    v20 = -[SSRVoiceProfileComposer donateAndLogEnrollmentUtterance:locale:utteranceId:mhUUID:phId:](self, "donateAndLogEnrollmentUtterance:locale:utteranceId:mhUUID:phId:", v14, v19, [v16 unsignedIntegerValue], v17, a8);

    uint64_t v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[SSRVoiceProfileComposer addUtterance:toProfile:withAsset:sessionUtteranceId:sessionMHUUID:phId:]";
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s getting donationId: %@", buf, 0x16u);
    }
    uint64_t v22 = +[SSRUtils concatenateDonationId:v20 triggerPhraseId:a8];
    queue = self->_queue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __98__SSRVoiceProfileComposer_addUtterance_toProfile_withAsset_sessionUtteranceId_sessionMHUUID_phId___block_invoke;
    v27[3] = &unk_26442A138;
    id v28 = v15;
    id v29 = v22;
    id v24 = v22;
    dispatch_sync(queue, v27);
  }
  else
  {
    v25 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "-[SSRVoiceProfileComposer addUtterance:toProfile:withAsset:sessionUtteranceId:sessionMHUUID:phId:]";
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2112;
      id v35 = v17;
      _os_log_error_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_ERROR, "%s utteranceId or mhUUID passed in are nil - utteranceId: %@ mhUUID: %@", buf, 0x20u);
    }
  }

  return v18;
}

uint64_t __98__SSRVoiceProfileComposer_addUtterance_toProfile_withAsset_sessionUtteranceId_sessionMHUUID_phId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addDonationId:*(void *)(a1 + 40)];
}

- (BOOL)addUtterance:(id)a3 toProfile:(id)a4 withAsset:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F380F8] decodeConfigFrom:v9 forFirstPassSource:0];
  if ([v10 useRecognizerCombination]
    && +[SSRUtils isMphVTUIKeywordDetectorSupportedPlatform])
  {
    id v11 = [[CSVoiceTriggerUserSelectedPhrase alloc] initWithEndpointId:0];
    id v12 = (void *)MEMORY[0x263F380D0];
    id v13 = [v8 locale];
    if ([v12 supportsMphForLanguageCode:v13]) {
      uint64_t v14 = [(CSVoiceTriggerUserSelectedPhrase *)v11 multiPhraseSelected];
    }
    else {
      uint64_t v14 = 0;
    }

    id v16 = [[CSVTUITwoPassKeywordDetector alloc] initWithAsset:v9 supportMph:v14];
    p_super = &v16->super;
  }
  else
  {
    p_super = [[CSVTUIKeywordDetector alloc] initWithAsset:v9];
  }
  uint64_t v17 = [v7 length];
  if (v17 < 1)
  {
    LOBYTE(v34) = 0;
    goto LABEL_26;
  }
  uint64_t v18 = v17;
  id v53 = v9;
  v54 = v10;
  v55 = v8;
  uint64_t v19 = 0;
  uint64_t v58 = *MEMORY[0x263F38188];
  uint64_t v57 = *MEMORY[0x263F38190];
  uint64_t v20 = *MEMORY[0x263F381C8];
  v56 = p_super;
  while (1)
  {
    unsigned int v21 = objc_msgSend(MEMORY[0x263F38018], "inputRecordingSampleByteDepth", v53);
    if ((uint64_t)(v18 / (unint64_t)v21) >= 160) {
      unint64_t v22 = 160;
    }
    else {
      unint64_t v22 = v18 / (unint64_t)v21;
    }
    unint64_t v23 = v22 * [MEMORY[0x263F38018] inputRecordingSampleByteDepth];
    id v24 = objc_msgSend(v7, "subdataWithRange:", v19, v23);
    v25 = [(CSVTUIKeywordDetector *)p_super analyze:v24];

    if (!v25) {
      goto LABEL_17;
    }
    id v26 = (void *)[v25 mutableCopy];
    id v27 = [MEMORY[0x263F380D0] deviceProductType];
    [v26 setObject:v27 forKeyedSubscript:v58];

    id v28 = [MEMORY[0x263F380D0] deviceProductVersion];
    [v26 setObject:v28 forKeyedSubscript:v57];

    uint64_t v29 = [v26 objectForKeyedSubscript:v20];
    if (v29)
    {
      unint64_t v30 = (void *)v29;
      [v26 objectForKeyedSubscript:v20];
      __int16 v32 = v31 = v7;
      int v33 = [v32 BOOLValue];

      id v7 = v31;
      p_super = v56;

      if (v33) {
        break;
      }
    }

LABEL_17:
    v18 -= v23;
    v19 += v23;

    if (v18 <= 0)
    {
      LOBYTE(v34) = 0;
      v10 = v54;
      id v8 = v55;
      id v9 = v53;
      goto LABEL_26;
    }
  }
  id v35 = [v26 objectForKeyedSubscript:*MEMORY[0x263F38220]];
  uint64_t v36 = [v35 unsignedIntegerValue];
  unint64_t v37 = v36 * [MEMORY[0x263F38018] inputRecordingSampleByteDepth];

  v38 = [v26 objectForKeyedSubscript:*MEMORY[0x263F381F0]];
  uint64_t v39 = [v38 unsignedIntegerValue];
  v40 = v7;
  unint64_t v41 = v39 * [MEMORY[0x263F38018] inputRecordingSampleByteDepth];

  [v54 preTriggerAudioTime];
  float v43 = v42;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  float v45 = (float)(v43 * v44) * (float)[MEMORY[0x263F38018] inputRecordingSampleByteDepth];
  if (v37 >= (unint64_t)v45) {
    unint64_t v46 = v37 - (unint64_t)v45;
  }
  else {
    unint64_t v46 = 0;
  }
  v47 = [v55 voiceProfileAudioDirPathForSpidType:1];
  +[SSRUtils createDirectoryIfDoesNotExist:v47];
  v48 = [v55 voiceProfileAudioDirPathForSpidType:3];
  +[SSRUtils createDirectoryIfDoesNotExist:v48];
  if (v41 >= [v40 length]) {
    unint64_t v41 = [v40 length] - 1;
  }
  v49 = objc_msgSend(v40, "subdataWithRange:", v46, v41 - v46 + 1);
  BOOL v50 = +[SSREnrollmentDataManager saveUtteranceAndMetadata:v49 atDirectory:v47];
  v51 = objc_msgSend(v40, "subdataWithRange:", v46, objc_msgSend(v40, "length") - v46);

  BOOL v34 = v50 & +[SSREnrollmentDataManager saveUtteranceAndMetadata:v51 atDirectory:v48];
  id v7 = v40;
  v10 = v54;
  id v8 = v55;
  id v9 = v53;
  p_super = v56;
LABEL_26:

  return v34;
}

- (BOOL)addUtterance:(id)a3 toProfile:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SSRAssetManager sharedManager];
  id v9 = [v7 locale];
  v10 = [v8 installedAssetOfType:0 forLanguage:v9];

  id v11 = (os_log_t *)MEMORY[0x263F38100];
  id v12 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[SSRVoiceProfileComposer addUtterance:toProfile:]";
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset found: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (!v10)
  {
    id v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[SSRVoiceProfileComposer addUtterance:toProfile:]";
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Cannot find voicetrigger asset from asset manager, let's fallback to asset in the framework", (uint8_t *)&v16, 0xCu);
    }
    v10 = [MEMORY[0x263F37FB0] defaultFallBackAssetForVoiceTrigger];
  }
  BOOL v14 = [(SSRVoiceProfileComposer *)self addUtterance:v6 toProfile:v7 withAsset:v10];

  return v14;
}

- (SSRVoiceProfileComposer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSRVoiceProfileComposer;
  v2 = [(SSRVoiceProfileComposer *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.corespeech.voiceprofilecomposer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    speechId = v2->_speechId;
    v2->_speechId = 0;
  }
  return v2;
}

+ (id)sharedTrainer
{
  if (sharedTrainer_onceToken != -1) {
    dispatch_once(&sharedTrainer_onceToken, &__block_literal_global_3100);
  }
  v2 = (void *)sharedTrainer_sharedTrainer;

  return v2;
}

uint64_t __40__SSRVoiceProfileComposer_sharedTrainer__block_invoke()
{
  sharedTrainer_sharedTrainer = objc_alloc_init(SSRVoiceProfileComposer);

  return MEMORY[0x270F9A758]();
}

@end