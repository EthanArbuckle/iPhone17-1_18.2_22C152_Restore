@interface TTSSpeechSynthesizer
+ (BOOL)employSpeechMarkupForType:(int64_t)a3 identifier:(id)a4 withLanguage:(id)a5;
+ (BOOL)isSystemVoice:(id)a3;
+ (id)_speechVoiceForIdentifier:(id)a3 language:(id)a4 footprint:(int64_t)a5;
+ (id)audioFileSettingsForVoice:(id)a3;
+ (id)availableLanguageCodes;
+ (id)combinedProsodyMarkupForIdentifier:(id)a3 string:(id)a4 rate:(id)a5 pitch:(id)a6 volume:(id)a7;
+ (id)genericMarkMarkupForIdentifier:(id)a3 name:(id)a4;
+ (id)remapVoiceIdentifier:(id)a3;
+ (id)speechMarkupStringForType:(int64_t)a3 forIdentifier:(id)a4 string:(id)a5;
+ (id)supportedIPAPhonemeLanguages;
+ (id)synthesizerForSynthesizerID:(unint64_t)a3;
+ (id)unavailableVoiceIdentifiers;
+ (id)voiceAccessQueue;
+ (id)voiceAssetsForTesting;
+ (id)voiceForIdentifier:(id)a3;
+ (void)_initializeServers;
+ (void)initialize;
+ (void)setVoiceAssetsForTesting:(id)a3;
+ (void)testingSetAllVoices:(id)a3;
- (BOOL)_continueSpeakingRequest:(id)a3 withError:(id *)a4;
- (BOOL)_pauseSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5 error:(id *)a6;
- (BOOL)_skipSubstition:(id)a3 language:(id)a4 bundleIdentifier:(id)a5 voice:(id)a6;
- (BOOL)_startSpeakingString:(id)a3 orSSMLString:(id)a4 withLanguageCode:(id)a5 jobId:(id)a6 request:(id *)a7 error:(id *)a8;
- (BOOL)_stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5 error:(id *)a6;
- (BOOL)_substitutionLanguageMatchesSpecialCase:(id)a3 withLanguage:(id)a4;
- (BOOL)continueSpeakingWithError:(id *)a3;
- (BOOL)ignoreSubstitutions;
- (BOOL)isSpeaking;
- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 error:(id *)a4;
- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5;
- (BOOL)pauseSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 error:(id *)a5;
- (BOOL)skipLuthorRules;
- (BOOL)startSpeakingSSML:(id)a3 withLanguageCode:(id)a4 jobIdentifier:(id)a5 request:(id *)a6 error:(id *)a7;
- (BOOL)startSpeakingSSML:(id)a3 withLanguageCode:(id)a4 request:(id *)a5 error:(id *)a6;
- (BOOL)startSpeakingString:(id)a3 error:(id *)a4;
- (BOOL)startSpeakingString:(id)a3 request:(id *)a4 error:(id *)a5;
- (BOOL)startSpeakingString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 error:(id *)a6;
- (BOOL)startSpeakingString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 request:(id *)a6 error:(id *)a7;
- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 error:(id *)a5;
- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 jobIdentifier:(id)a5 request:(id *)a6 error:(id *)a7;
- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 request:(id *)a5 error:(id *)a6;
- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 error:(id *)a4;
- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5;
- (BOOL)stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 error:(id *)a5;
- (BOOL)supportsAccurateWordCallbacks;
- (BOOL)synthesizeSilently;
- (NSArray)audioEffects;
- (NSArray)outputChannels;
- (NSArray)phonemeSubstitutions;
- (NSArray)userSubstitutions;
- (NSDictionary)perVoiceSettings;
- (NSString)bundleIdentifier;
- (NSString)resolvedVoiceIdentifier;
- (NSString)speechSource;
- (NSString)voiceIdentifier;
- (OS_dispatch_queue)delegateTargetQueue;
- (OS_voucher)voucher;
- (TTSSpeechSynthesizer)init;
- (TTSSpeechSynthesizerDelegate)delegate;
- (_TtC12TextToSpeech15CoreSynthesizer)coreSynth;
- (float)maximumRate;
- (float)minimumRate;
- (float)pitch;
- (float)rate;
- (float)volume;
- (id)_determineSubstitution:(id)a3 speechString:(id)a4 wordRange:(_NSRange)a5 request:(id)a6;
- (id)_makeRequestForVoice:(id)a3 andLanguageCode:(id)a4;
- (id)_preprocessText:(id)a3 languageCode:(id)a4;
- (id)_processMarker:(id)a3 forRequest:(id)a4;
- (id)_resolveVoiceForLanguage:(id)a3;
- (id)audioBufferCallback;
- (id)getPerVoiceSettings;
- (id)resolvedVoiceIdentifierForLanguageCode:(id)a3;
- (id)speechString;
- (id)testingLastRuleConversion;
- (id)voiceResolver;
- (int64_t)footprint;
- (unint64_t)requestClientIdentifier;
- (unint64_t)synthesizerInstanceID;
- (unsigned)audioQueueFlags;
- (unsigned)audioSessionID;
- (void)_mediaServicesDied;
- (void)_processUserSubstitutionsToText:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 voice:(id)a6;
- (void)_setDelegate:(id)a3;
- (void)dealloc;
- (void)setAudioBufferCallback:(id)a3;
- (void)setAudioEffects:(id)a3;
- (void)setAudioQueueFlags:(unsigned int)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCoreSynth:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateTargetQueue:(id)a3;
- (void)setFootprint:(int64_t)a3;
- (void)setIgnoreSubstitutions:(BOOL)a3;
- (void)setOutputChannels:(id)a3;
- (void)setPerVoiceSettings:(id)a3;
- (void)setPhonemeSubstitutions:(id)a3;
- (void)setPitch:(float)a3;
- (void)setRate:(float)a3;
- (void)setRequestClientIdentifier:(unint64_t)a3;
- (void)setSkipLuthorRules:(BOOL)a3;
- (void)setSpeakingRequestClientContext:(void *)a3;
- (void)setSpeechSource:(id)a3;
- (void)setSupportsAccurateWordCallbacks:(BOOL)a3;
- (void)setSynthesizeSilently:(BOOL)a3;
- (void)setUserSubstitutions:(id)a3;
- (void)setVoiceIdentifier:(id)a3;
- (void)setVolume:(float)a3;
- (void)setVoucher:(id)a3;
- (void)speakingRequestClientContext;
- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 forService:(id)a6 error:(id)a7;
- (void)speechRequest:(id)a3 withMarker:(id)a4 didStartForService:(id)a5;
- (void)speechRequestDidContinue:(id)a3 forService:(id)a4;
- (void)speechRequestDidPause:(id)a3 forService:(id)a4;
- (void)speechRequestDidStart:(id)a3 forService:(id)a4;
- (void)testingSetLastRuleConversion:(id)a3 replacement:(id)a4;
- (void)useSpecificAudioSession:(unsigned int)a3;
@end

@implementation TTSSpeechSynthesizer

+ (id)remapVoiceIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v8 = objc_msgSend_voiceForIdentifier_(v4, v5, (uint64_t)v3, v6, v7);

  v13 = objc_msgSend_identifier(v8, v9, v10, v11, v12);

  return v13;
}

+ (id)voiceForIdentifier:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = objc_msgSend_sharedInstance(TTSAXResourceMigrationUtilities, v5, v6, v7, v8);
  v13 = objc_msgSend_convertIdentifierIfNeeded_(v9, v10, (uint64_t)v4, v11, v12);

  if (TTSUseCoreSynthesizerForTTS())
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v81 = sub_1A6718A28;
    v82 = sub_1A6718A38;
    id v83 = 0;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    v23 = objc_msgSend_shared(_TtC12TextToSpeech13VoiceResolver, v19, v20, v21, v22);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = sub_1A6718A40;
    v76[3] = &unk_1E5C6A5C0;
    v78 = buf;
    v24 = v18;
    v77 = v24;
    objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v23, v25, (uint64_t)v13, 0, (uint64_t)v76);

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    id v26 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v27 = objc_msgSend_sharedInstance(TTSAXResourceManager, v14, v15, v16, v17);
    v31 = objc_msgSend_resourceWithVoiceId_(v27, v28, (uint64_t)v13, v29, v30);
    objc_msgSend_speechVoice(v31, v32, v33, v34, v35);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    v40 = objc_msgSend_serviceIdentifier(v26, v36, v37, v38, v39);

    if (!v40)
    {
      objc_msgSend__initializeServers(a1, v41, v42, v43, v44);
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v45 = (id)qword_1EB67AAA8;
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v72, (uint64_t)v79, 16);
      if (v50)
      {
        uint64_t v51 = *(void *)v73;
        while (2)
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v73 != v51) {
              objc_enumerationMutation(v45);
            }
            v53 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            if (objc_msgSend_isVoiceValid_(v53, v47, (uint64_t)v26, v48, v49, (void)v72))
            {
              objc_msgSend_setService_(v26, v47, (uint64_t)v53, v48, v49);
              goto LABEL_14;
            }
          }
          uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v72, (uint64_t)v79, 16);
          if (v50) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    v54 = objc_msgSend_serviceIdentifier(v26, v41, v42, v43, v44, (void)v72);
    BOOL v55 = v54 == 0;

    if (v55)
    {
      v60 = objc_msgSend_sharedInstance(TTSAXResourceManager, v56, v57, v58, v59);
      objc_msgSend_resourceWithVoiceId_(v60, v61, (uint64_t)v13, v62, v63);
      v64 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

      v65 = AXTTSLogCommon();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_1A688F45C();
      }

      if (objc_msgSend_isInstalled(v64, v66, v67, v68, v69))
      {
        v70 = AXTTSLogCommon();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2112;
          v81 = v64;
          _os_log_error_impl(&dword_1A66D3000, v70, OS_LOG_TYPE_ERROR, "Unable to find voice service for identifier: %@, voice: %@, resource: %@", buf, 0x20u);
        }
      }
    }
  }

  return v26;
}

+ (void)initialize
{
  if (qword_1EB67AAD0[0] != -1) {
    dispatch_once(qword_1EB67AAD0, &unk_1EFB80420);
  }
}

+ (void)_initializeServers
{
  if ((byte_1EB67AAB0 & 1) == 0) {
    dispatch_sync((dispatch_queue_t)qword_1EB67AAC8, &unk_1EFB7E2D8);
  }
}

- (void)setPerVoiceSettings:(id)a3
{
}

- (id)getPerVoiceSettings
{
  return self->_perVoiceSettings;
}

+ (BOOL)isSystemVoice:(id)a3
{
  v5 = objc_msgSend_voiceForIdentifier_(a1, a2, (uint64_t)a3, v3, v4);
  char isSystemVoice = objc_msgSend_isSystemVoice(v5, v6, v7, v8, v9);

  return isSystemVoice;
}

+ (id)unavailableVoiceIdentifiers
{
  if (qword_1E96C4818 != -1) {
    dispatch_once(&qword_1E96C4818, &unk_1EFB7E318);
  }
  v2 = (void *)qword_1E96C4810;

  return v2;
}

+ (BOOL)employSpeechMarkupForType:(int64_t)a3 identifier:(id)a4 withLanguage:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (TTSUseCoreSynthesizerForTTS())
  {
    char v11 = 0;
  }
  else
  {
    char v11 = 1;
    uint64_t v12 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v10, (uint64_t)v8, (uint64_t)v9, 1);
    uint64_t v17 = objc_msgSend_service(v12, v13, v14, v15, v16);
    if (objc_opt_respondsToSelector()) {
      char v11 = objc_msgSend_employSpeechMarkupForType_language_(v17, v18, a3, (uint64_t)v9, v19);
    }
  }
  return v11;
}

+ (id)genericMarkMarkupForIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_genericMarkerMarkupWithName_(TTSSSEUtils, v8, (uint64_t)v7, v9, v10);
    char v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v8, (uint64_t)v6, 0, 1);
    uint64_t v17 = v12;
    if (v12)
    {
      dispatch_semaphore_t v18 = objc_msgSend_service(v12, v13, v14, v15, v16);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_genericMarkerMarkupForVoice_name_(v18, v19, (uint64_t)v17, (uint64_t)v7, v20);
        char v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v11 = &stru_1EFB83720;
      }
    }
    else
    {
      uint64_t v21 = AXTTSLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1A688F4F0();
      }

      char v11 = &stru_1EFB83720;
    }
  }

  return v11;
}

+ (id)combinedProsodyMarkupForIdentifier:(id)a3 string:(id)a4 rate:(id)a5 pitch:(id)a6 volume:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_combinedProsodyMarkupForString_rate_pitch_volume_(TTSSSEUtils, v17, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, v16);
    dispatch_semaphore_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v17, (uint64_t)v12, 0, 1);
    v24 = v19;
    if (v19)
    {
      v25 = objc_msgSend_service(v19, v20, v21, v22, v23);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_combinedProsodyMarkupForVoice_string_rate_pitch_volume_(v25, v26, (uint64_t)v24, (uint64_t)v13, (uint64_t)v14, v15, v16);
        dispatch_semaphore_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        dispatch_semaphore_t v18 = &stru_1EFB83720;
      }
    }
    else
    {
      v27 = AXTTSLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1A688F4F0();
      }

      dispatch_semaphore_t v18 = &stru_1EFB83720;
    }
  }

  return v18;
}

+ (id)speechMarkupStringForType:(int64_t)a3 forIdentifier:(id)a4 string:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_speechMarkupStringForType_string_(TTSSSEUtils, v10, a3, (uint64_t)v9, v11);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v10, (uint64_t)v8, 0, 1);
    dispatch_semaphore_t v18 = v13;
    if (v13)
    {
      uint64_t v19 = objc_msgSend_service(v13, v14, v15, v16, v17);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_speechMarkupStringForType_voice_string_(v19, v20, a3, (uint64_t)v18, (uint64_t)v9);
        id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = &stru_1EFB83720;
      }
    }
    else
    {
      uint64_t v21 = AXTTSLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1A688F4F0();
      }

      id v12 = &stru_1EFB83720;
    }
  }

  return v12;
}

+ (void)testingSetAllVoices:(id)a3
{
  id v3 = a3;
  uint64_t v4 = qword_1EB67AAC8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A6718FC8;
  block[3] = &unk_1E5C69588;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (void)setVoiceAssetsForTesting:(id)a3
{
}

+ (id)voiceAssetsForTesting
{
  id v5 = objc_msgSend_copy((void *)qword_1E96C4820, a2, v2, v3, v4);

  return v5;
}

+ (id)synthesizerForSynthesizerID:(unint64_t)a3
{
  id v5 = (void *)qword_1EB67AAB8;
  id v6 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, a3, v3, v4);
  uint64_t v10 = objc_msgSend_objectForKey_(v5, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (id)testingLastRuleConversion
{
  return self->_testingLastRuleConversion;
}

- (void)testingSetLastRuleConversion:(id)a3 replacement:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  id v7 = (NSMutableDictionary *)objc_opt_new();
  testingLastRuleConversion = self->_testingLastRuleConversion;
  self->_testingLastRuleConversion = v7;

  objc_msgSend_setObject_forKeyedSubscript_(self->_testingLastRuleConversion, v9, (uint64_t)v6, @"original", v10);
  objc_msgSend_setObject_forKeyedSubscript_(self->_testingLastRuleConversion, v11, (uint64_t)v13, @"replacement", v12);
}

+ (id)voiceAccessQueue
{
  return (id)qword_1EB67AAC8;
}

+ (id)availableLanguageCodes
{
  uint64_t v17 = 0;
  dispatch_semaphore_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1A6718A28;
  uint64_t v21 = sub_1A6718A38;
  id v22 = (id)MEMORY[0x1E4F1CBF0];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v7 = objc_msgSend_shared(_TtC12TextToSpeech13VoiceResolver, v3, v4, v5, v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A671928C;
  v14[3] = &unk_1E5C69AD0;
  uint64_t v16 = &v17;
  uint64_t v8 = v2;
  uint64_t v15 = v8;
  objc_msgSend_currentLocaleIdentifiersWithCompletionHandler_(v7, v9, (uint64_t)v14, v10, v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v12;
}

- (TTSSpeechSynthesizer)init
{
  uint64_t v3 = objc_opt_class();
  objc_msgSend__initializeServers(v3, v4, v5, v6, v7);
  v46.receiver = self;
  v46.super_class = (Class)TTSSpeechSynthesizer;
  uint64_t v8 = [(TTSSpeechSynthesizer *)&v46 init];
  if (v8)
  {
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("TTSSpeechSynthesizer", v9);
    uint64_t v11 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v12;

    __asm { FMOV            V0.2S, #1.0 }
    *(void *)(v8 + 100) = _D0;
    *((_DWORD *)v8 + 27) = 1065353216;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v20 = (void *)*((void *)v8 + 7);
    *((void *)v8 + 7) = v19;

    objc_storeStrong((id *)v8 + 15, MEMORY[0x1E4F14428]);
    uint64_t v21 = voucher_copy();
    id v22 = (void *)*((void *)v8 + 24);
    *((void *)v8 + 24) = v21;

    objc_msgSend_lock((void *)qword_1EB67AAC0, v23, v24, v25, v26);
    uint64_t v27 = ++qword_1EB67A190;
    *((void *)v8 + 9) = qword_1EB67A190;
    v28 = (void *)qword_1EB67AAB8;
    v32 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v29, v27, v30, v31);
    objc_msgSend_setObject_forKey_(v28, v33, (uint64_t)v8, (uint64_t)v32, v34);

    objc_msgSend_unlock((void *)qword_1EB67AAC0, v35, v36, v37, v38);
    uint64_t v43 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v39, v40, v41, v42);
    objc_msgSend_addObserver_selector_name_object_(v43, v44, (uint64_t)v8, (uint64_t)sel__mediaServicesDied, *MEMORY[0x1E4F15040], 0);
  }
  return (TTSSpeechSynthesizer *)v8;
}

- (_TtC12TextToSpeech15CoreSynthesizer)coreSynth
{
  coreSynth = self->_coreSynth;
  if (!coreSynth)
  {
    uint64_t v4 = objc_alloc_init(_TtC12TextToSpeech15CoreSynthesizer);
    uint64_t v5 = self->_coreSynth;
    self->_coreSynth = v4;

    coreSynth = self->_coreSynth;
  }

  return coreSynth;
}

- (id)voiceResolver
{
  uint64_t v5 = objc_msgSend_coreSynth(self, a2, v2, v3, v4);
  dispatch_queue_t v10 = objc_msgSend_voiceResolver(v5, v6, v7, v8, v9);

  return v10;
}

- (void)_mediaServicesDied
{
  uint64_t v3 = AXTTSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1A66D3000, v3, OS_LOG_TYPE_DEFAULT, "Media services reset", v8, 2u);
  }

  objc_msgSend_removeAllObjects(self->_channels, v4, v5, v6, v7);
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_msgSend__stopSpeakingRequest_atNextBoundary_synchronously_error_(self, a2, 0, 0, 0, 0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)qword_1EB67AAA8;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v3);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend_synthesizerInstanceID(self, v6, v7, v8, v9);
        objc_msgSend_synthesizerInstanceDestroyed_(v13, v15, v14, v16, v17);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v10);
  }

  v18.receiver = self;
  v18.super_class = (Class)TTSSpeechSynthesizer;
  [(TTSSpeechSynthesizer *)&v18 dealloc];
}

- (void)_setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_synthesizerFlags = *(unsigned char *)&self->_synthesizerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_synthesizerFlags = *(unsigned char *)&self->_synthesizerFlags & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_synthesizerFlags = *(unsigned char *)&self->_synthesizerFlags & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_synthesizerFlags = *(unsigned char *)&self->_synthesizerFlags & 0xF7 | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 16;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_synthesizerFlags = *(unsigned char *)&self->_synthesizerFlags & 0xEF | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 32;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_synthesizerFlags = *(unsigned char *)&self->_synthesizerFlags & 0xDF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 64;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_synthesizerFlags = *(unsigned char *)&self->_synthesizerFlags & 0xBF | v10;
  }
}

- (void)setVolume:(float)a3
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  self->_volume = fmaxf(a3, 0.0001);
}

- (void)setPitch:(float)a3
{
  if (a3 > 2.0) {
    a3 = 2.0;
  }
  self->_pitch = fmaxf(a3, 0.5);
}

- (void)setOutputChannels:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_outputChannels, a3);
  if (TTSUseCoreSynthesizerForTTS())
  {
    char v9 = objc_msgSend_coreSynth(self, v5, v6, v7, v8);
    objc_msgSend_setChannels_(v9, v10, (uint64_t)v13, v11, v12);
  }
}

- (NSArray)outputChannels
{
  return self->_outputChannels;
}

- (void)setUserSubstitutions:(id)a3
{
  uint64_t v6 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  userSubstitutions = self->_userSubstitutions;
  self->_userSubstitutions = v6;

  char v10 = self->_userSubstitutions;

  MEMORY[0x1F4181798](v10, sel_enumerateObjectsUsingBlock_, &unk_1EFB7EA68, v8, v9);
}

- (void)setPhonemeSubstitutions:(id)a3
{
  self->_phonemeSubstitutions = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);

  MEMORY[0x1F41817F8]();
}

- (NSString)resolvedVoiceIdentifier
{
  int v3 = TTSUseCoreSynthesizerForTTS();
  uint64_t v4 = objc_opt_class();
  voiceIdentifier = self->_voiceIdentifier;
  if (v3) {
    objc_msgSend_voiceForIdentifier_(v4, v5, (uint64_t)voiceIdentifier, v6, v7);
  }
  else {
  uint64_t v9 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(v4, v5, (uint64_t)voiceIdentifier, 0, self->_footprint);
  }
  uint64_t v14 = objc_msgSend_identifier(v9, v10, v11, v12, v13);

  return (NSString *)v14;
}

- (id)resolvedVoiceIdentifierForLanguageCode:(id)a3
{
  id v4 = a3;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend__resolveVoiceForLanguage_(self, v5, (uint64_t)v4, v6, v7);
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(v8, v9, 0, (uint64_t)v4, self->_footprint);
  char v10 = };
  uint64_t v15 = objc_msgSend_identifier(v10, v11, v12, v13, v14);

  return v15;
}

- (NSString)voiceIdentifier
{
  voiceIdentifier = self->_voiceIdentifier;
  if (voiceIdentifier)
  {
    int v3 = voiceIdentifier;
  }
  else if (TTSUseCoreSynthesizerForTTS())
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = sub_1A6718A28;
    uint64_t v35 = sub_1A6718A38;
    id v36 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    char v10 = objc_msgSend_voiceResolver(self, v6, v7, v8, v9);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = sub_1A6719C7C;
    v28 = &unk_1E5C6A5C0;
    uint64_t v30 = &v31;
    uint64_t v11 = v5;
    uint64_t v29 = v11;
    objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v10, v12, 0, 0, (uint64_t)&v25);

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend_identifier((void *)v32[5], v13, v14, v15, v16, v25, v26, v27, v28);
    int v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    uint64_t v17 = objc_opt_class();
    long long v19 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(v17, v18, 0, 0, self->_footprint);
    objc_msgSend_identifier(v19, v20, v21, v22, v23);
    int v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_preprocessText:(id)a3 languageCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqual_(v6, v7, @"he-IL", v8, v9))
  {
    uint64_t v13 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v10, @"/י", (uint64_t)&stru_1EFB83720, v12);

    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, @"/ה", (uint64_t)&stru_1EFB83720, v15);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v16, @"/ת", (uint64_t)&stru_1EFB83720, v17);
LABEL_5:
    uint64_t v23 = (void *)v18;

    id v5 = v23;
    goto LABEL_6;
  }
  if (objc_msgSend_isEqual_(v6, v10, @"ja-JP", v11, v12))
  {
    uint64_t v18 = AXSpeechReplaceJapaneseElongationCharactersIfNeeded(v5);
    goto LABEL_5;
  }
LABEL_6:
  if ((unint64_t)objc_msgSend_length(v5, v19, v20, v21, v22) >= 4)
  {
    v28 = objc_msgSend_localizedUppercaseString(v5, v24, v25, v26, v27);
    int isEqualToString = objc_msgSend_isEqualToString_(v28, v29, (uint64_t)v5, v30, v31);

    if (isEqualToString)
    {
      uint64_t v35 = objc_msgSend_localizedLowercaseString(v5, v24, v33, v34, v27);

      id v5 = (id)v35;
    }
  }
  id v36 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v24, @"’", @"'", v27);

  uint64_t v39 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v36, v37, @"‘", @"'", v38);

  uint64_t v42 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v39, v40, @"−", @"-", v41);

  __int16 v50 = 12288;
  id v45 = objc_msgSend_stringWithCharacters_length_(NSString, v43, (uint64_t)&v50, 1, v44);
  uint64_t v48 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v42, v46, (uint64_t)v45, @" ", v47);

  return v48;
}

- (BOOL)_substitutionLanguageMatchesSpecialCase:(id)a3 withLanguage:(id)a4
{
  id v5 = a4;
  char v10 = objc_msgSend_lowercaseString(a3, v6, v7, v8, v9);
  if (objc_msgSend_hasSuffix_(v10, v11, @"no", v12, v13))
  {
    uint64_t v18 = objc_msgSend_lowercaseString(v5, v14, v15, v16, v17);
    char hasSuffix = objc_msgSend_hasSuffix_(v18, v19, @"no", v20, v21);
  }
  else
  {
    char hasSuffix = 0;
  }

  return hasSuffix;
}

- (BOOL)_skipSubstition:(id)a3 language:(id)a4 bundleIdentifier:(id)a5 voice:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (objc_msgSend_ignoreSubstitutions(self, v14, v15, v16, v17)
    && (objc_msgSend_isUserSubstitution(v10, v18, v19, v20, v21) & 1) != 0)
  {
    char v22 = 1;
  }
  else
  {
    if (objc_msgSend_appliesToAllApps(v10, v18, v19, v20, v21))
    {
      char v27 = 0;
    }
    else
    {
      v28 = objc_msgSend_bundleIdentifiers(v10, v23, v24, v25, v26);
      char v32 = objc_msgSend_containsObject_(v28, v29, (uint64_t)v12, v30, v31);

      char v27 = v32 ^ 1;
    }
    uint64_t v33 = objc_msgSend_languages(v10, v23, v24, v25, v26);
    uint64_t v38 = objc_msgSend_count(v33, v34, v35, v36, v37);

    if (v38)
    {
      char v80 = v27;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v43 = objc_msgSend_languages(v10, v39, v40, v41, v42);
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v81, (uint64_t)v85, 16);
      if (v45)
      {
        uint64_t v49 = v45;
        uint64_t v50 = *(void *)v82;
        while (2)
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v82 != v50) {
              objc_enumerationMutation(v43);
            }
            v52 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            if ((objc_msgSend_isEqualToString_(v52, v46, (uint64_t)v11, v47, v48) & 1) != 0
              || (objc_msgSend__substitutionLanguageMatchesSpecialCase_withLanguage_(self, v53, (uint64_t)v52, (uint64_t)v11, v54) & 1) != 0)
            {
              char v55 = 1;
              goto LABEL_21;
            }
          }
          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v81, (uint64_t)v85, 16);
          char v55 = 0;
          if (v49) {
            continue;
          }
          break;
        }
      }
      else
      {
        char v55 = 0;
      }
LABEL_21:

      v60 = objc_msgSend_voiceIds(v10, v56, v57, v58, v59);
      if (objc_msgSend_count(v60, v61, v62, v63, v64))
      {
        uint64_t v69 = objc_msgSend_voiceIds(v10, v65, v66, v67, v68);
        long long v74 = objc_msgSend_identifier(v13, v70, v71, v72, v73);
        char v78 = objc_msgSend_containsObject_(v69, v75, (uint64_t)v74, v76, v77);

        v55 &= v78;
      }
      else
      {
      }
      char v27 = v80;
    }
    else
    {
      char v55 = 1;
    }
    char v22 = v27 | v55 ^ 1;
  }

  return v22;
}

- (void)_processUserSubstitutionsToText:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 voice:(id)a6
{
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v204 = a6;
  uint64_t v17 = objc_msgSend_originalString(v10, v13, v14, v15, v16);
  char v22 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21);
  char v27 = objc_msgSend_phonemeSubstitutions(self, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_count(v27, v28, v29, v30, v31);

  if (v32)
  {
    uint64_t v37 = objc_msgSend_phonemeSubstitutions(self, v33, v34, v35, v36);
    objc_msgSend_addObjectsFromArray_(v22, v38, (uint64_t)v37, v39, v40);
  }
  uint64_t v41 = objc_msgSend_userSubstitutions(self, v33, v34, v35, v36);
  uint64_t v46 = objc_msgSend_count(v41, v42, v43, v44, v45);

  if (v46)
  {
    uint64_t v51 = objc_msgSend_userSubstitutions(self, v47, v48, v49, v50);
    objc_msgSend_addObjectsFromArray_(v22, v52, (uint64_t)v51, v53, v54);
  }
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  id obj = v22;
  v56 = v204;
  uint64_t v208 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v213, (uint64_t)v217, 16);
  if (v208)
  {
    uint64_t v207 = *(void *)v214;
    v209 = v10;
    v210 = self;
    id v211 = v11;
    id v203 = v12;
    do
    {
      uint64_t v61 = 0;
      do
      {
        if (*(void *)v214 != v207) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = *(void **)(*((void *)&v213 + 1) + 8 * v61);
        uint64_t v63 = objc_msgSend_languageCode(v11, v57, v58, v59, v60);
        char v65 = objc_msgSend__skipSubstition_language_bundleIdentifier_voice_(self, v64, (uint64_t)v62, (uint64_t)v63, (uint64_t)v12, v56);

        if ((v65 & 1) == 0)
        {
          uint64_t v66 = objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28E58], v57, v58, v59, v60);
          uint64_t v71 = objc_msgSend_symbolCharacterSet(MEMORY[0x1E4F28B88], v67, v68, v69, v70);
          objc_msgSend_formUnionWithCharacterSet_(v66, v72, (uint64_t)v71, v73, v74);

          v79 = objc_msgSend_originalString(v62, v75, v76, v77, v78);
          uint64_t v83 = objc_msgSend_characterAtIndex_(v79, v80, 0, v81, v82);
          if (objc_msgSend_characterIsMember_(v66, v84, v83, v85, v86))
          {
            char IsMember = 1;
          }
          else
          {
            v92 = objc_msgSend_originalString(v62, v87, v88, v89, v90);
            v97 = objc_msgSend_originalString(v62, v93, v94, v95, v96);
            uint64_t v102 = objc_msgSend_length(v97, v98, v99, v100, v101);
            uint64_t v106 = objc_msgSend_characterAtIndex_(v92, v103, v102 - 1, v104, v105);
            char IsMember = objc_msgSend_characterIsMember_(v66, v107, v106, v108, v109);
          }
          v114 = objc_msgSend_originalString(v62, v110, v111, v112, v113);
          if (objc_msgSend_type(v10, v115, v116, v117, v118) == 1)
          {
            uint64_t v123 = objc_msgSend_xmlEscaped(v114, v119, v120, v121, v122);

            v212 = (void *)v123;
          }
          else
          {
            v212 = v114;
          }
          v124 = objc_msgSend_languageCode(v11, v119, v120, v121, v122);
          v206 = v66;
          if (objc_msgSend_hasPrefix_(v124, v125, @"ja", v126, v127))
          {

            goto LABEL_20;
          }
          v135 = objc_msgSend_languageCode(v11, v128, v129, v130, v131);
          int hasPrefix = objc_msgSend_hasPrefix_(v135, v136, @"zh", v137, v138);

          if (hasPrefix)
          {
LABEL_20:
            v141 = NSString;
            v142 = objc_msgSend_escapedPatternForString_(MEMORY[0x1E4F28FD8], v132, (uint64_t)v212, v133, v134);
            objc_msgSend_stringWithFormat_(v141, v143, @"%@", v144, v145, v142);
            goto LABEL_21;
          }
          if (IsMember)
          {
            if (objc_msgSend_length(v17, v132, v140, v133, v134) == 1)
            {
              v146 = objc_msgSend_escapedPatternForString_(MEMORY[0x1E4F28FD8], v191, (uint64_t)v212, v192, v193);
              goto LABEL_22;
            }
            v198 = NSString;
            v142 = objc_msgSend_escapedPatternForString_(MEMORY[0x1E4F28FD8], v191, (uint64_t)v212, v192, v193);
            objc_msgSend_stringWithFormat_(v198, v199, @"(?<=\\s|^)%@(?=\\s|$)", v200, v201, v142);
          }
          else
          {
            v194 = NSString;
            v142 = objc_msgSend_escapedPatternForString_(MEMORY[0x1E4F28FD8], v132, (uint64_t)v212, v133, v134);
            objc_msgSend_stringWithFormat_(v194, v195, @"\\b%@\\b", v196, v197, v142);
          }
          v146 = LABEL_21:;

LABEL_22:
          uint64_t v151 = objc_msgSend_length(v17, v147, v148, v149, v150);
          uint64_t v156 = objc_msgSend_replacementRange(v62, v152, v153, v154, v155);
          if (v157 | v156)
          {
            uint64_t v183 = v156;
            uint64_t v184 = v157;
            v185 = objc_msgSend__determineSubstitution_speechString_wordRange_request_(v210, (const char *)v157, (uint64_t)v62, (uint64_t)v10, v156, v157, v211);
            if (objc_msgSend_length(v185, v186, v187, v188, v189)) {
              objc_msgSend_transformRange_to_(v10, v190, v183, v184, (uint64_t)v185);
            }
          }
          else if (v151)
          {
            uint64_t v158 = 0;
            do
            {
              uint64_t v159 = objc_msgSend_rangeOfString_options_range_(v17, (const char *)v157, (uint64_t)v146, 1025, v158, v151);
              if (v159 == 0x7FFFFFFFFFFFFFFFLL) {
                break;
              }
              uint64_t v164 = v159;
              uint64_t v165 = (uint64_t)v160;
              uint64_t v166 = objc_msgSend_length(v17, v160, v161, v162, v163);
              v169 = objc_msgSend_substringWithRange_(v17, v167, v164, v165, v168);
              if ((objc_msgSend_ignoreCase(v62, v170, v171, v172, v173) & 1) != 0
                || objc_msgSend_isEqualToString_(v212, v174, (uint64_t)v169, v175, v176))
              {
                v177 = objc_msgSend__determineSubstitution_speechString_wordRange_request_(v210, v174, (uint64_t)v62, (uint64_t)v209, v164, v165, v211);
                if (objc_msgSend_length(v177, v178, v179, v180, v181)) {
                  objc_msgSend_transformRange_to_(v209, v182, v164, v165, (uint64_t)v177);
                }
              }
              uint64_t v158 = v164 + v165;
              uint64_t v151 = v166 - (v164 + v165);
            }
            while (v151);
          }

          id v10 = v209;
          self = v210;
          id v11 = v211;
          id v12 = v203;
          v56 = v204;
        }
        ++v61;
      }
      while (v61 != v208);
      uint64_t v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v213, (uint64_t)v217, 16);
      uint64_t v208 = v202;
    }
    while (v202);
  }
}

- (id)_determineSubstitution:(id)a3 speechString:(id)a4 wordRange:(_NSRange)a5 request:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a4;
  id v10 = a3;
  uint64_t v15 = objc_msgSend_phonemes(v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_replacementString(v10, v16, v17, v18, v19);

  if (!objc_msgSend_length(v15, v21, v22, v23, v24) && !objc_msgSend_length(v20, v25, v26, v27, v28)
    || (objc_msgSend_originalString(v9, v25, v26, v27, v28),
        uint64_t v29 = objc_claimAutoreleasedReturnValue(),
        unint64_t v34 = objc_msgSend_length(v29, v30, v31, v32, v33),
        v29,
        location + length > v34))
  {
    uint64_t v35 = 0;
    goto LABEL_17;
  }
  id v40 = v20;
  if (v40 && objc_msgSend_type(v9, v36, v37, v38, v39) == 1)
  {
    uint64_t v41 = objc_msgSend_xmlEscaped(v40, v36, v37, v38, v39);

    id v40 = (id)v41;
  }
  uint64_t v42 = objc_msgSend_originalString(v9, v36, v37, v38, v39);
  uint64_t v45 = objc_msgSend_substringWithRange_(v42, v43, location, length, v44);

  if (objc_msgSend_length(v15, v46, v47, v48, v49))
  {
    if (objc_msgSend_type(v9, v50, v51, v52, v53) == 1)
    {
      objc_msgSend_stringWithFormat_(NSString, v54, @"<phoneme alphabet=\"ipa\" ph=\"%@\">%@</phoneme>", v55, v56, v15, v45);
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (TTSUseCoreSynthesizerForTTS())
    {
      objc_msgSend_enclosedStringWithPhonemes_originalString_(TTSSSEUtils, v58, (uint64_t)v15, (uint64_t)v45, v59);
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  if (!v40)
  {
    uint64_t v35 = 0;
    goto LABEL_16;
  }
  id v57 = v40;
LABEL_15:
  uint64_t v35 = v57;
LABEL_16:

LABEL_17:

  return v35;
}

- (unint64_t)synthesizerInstanceID
{
  return self->_synthesizerInstanceID;
}

- (id)_resolveVoiceForLanguage:(id)a3
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (!TTSUseCoreSynthesizerForTTS())
  {
    uint64_t v15 = self->_voiceIdentifier;
    uint64_t v16 = AXTTSLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_impl(&dword_1A66D3000, v16, OS_LOG_TYPE_INFO, "Attempting to speak with identifier: %@", buf, 0xCu);
    }

    uint64_t v17 = objc_opt_class();
    uint64_t v19 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(v17, v18, (uint64_t)v15, (uint64_t)v4, self->_footprint);
    uint64_t v20 = AXTTSLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = objc_msgSend_service(v19, v21, v22, v23, v24);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_1A66D3000, v20, OS_LOG_TYPE_INFO, "Found voice %@ with service: %@", buf, 0x16u);
    }
    uint64_t v30 = objc_msgSend_identifier(v19, v26, v27, v28, v29);
    if (objc_msgSend_footprint(v19, v31, v32, v33, v34) == 2)
    {
      uint64_t v39 = objc_msgSend_identifier(v19, v35, v36, v37, v38);
      char v43 = objc_msgSend_containsString_(v39, v40, @".super-compact.", v41, v42);

      if ((v43 & 1) == 0)
      {
        uint64_t v44 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v30, v35, @".compact.", @".super-compact.", v38);

        uint64_t v30 = (void *)v44;
      }
    }
    uint64_t v45 = objc_msgSend_sharedInstance(TTSAXResourceManager, v35, v36, v37, v38);
    uint64_t v49 = objc_msgSend_resourceWithVoiceId_(v45, v46, (uint64_t)v30, v47, v48);

    if ((objc_msgSend_isInstalled(v49, v50, v51, v52, v53) & 1) != 0
      || objc_msgSend_footprint(v49, v54, v55, v56, v57) != 3)
    {
      char v65 = v49;
    }
    else
    {
      uint64_t v58 = objc_msgSend_sharedInstance(TTSAXResourceManager, v54, v55, v56, v57);
      uint64_t v61 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v30, v59, @".compact.", @".super-compact.", v60);
      char v65 = objc_msgSend_resourceWithVoiceId_(v58, v62, (uint64_t)v61, v63, v64);

      uint64_t v70 = objc_msgSend_speechVoice(v65, v66, v67, v68, v69);

      uint64_t v19 = (void *)v70;
    }
    char isValid = objc_msgSend_isValid(v65, v54, v55, v56, v57);
    if ((isValid & 1) == 0)
    {
      uint64_t v76 = AXTTSLogCommon();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        uint64_t v138 = objc_msgSend_contentPath(v65, v77, v78, v79, v80);
        v136 = objc_msgSend_identifier(v19, v128, v129, v130, v131);
        uint64_t v137 = v4;
        if (!v4)
        {
          objc_msgSend_primaryLanguage(v65, v132, v133, v134, v135);
          uint64_t v137 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v138;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v136;
        *(_WORD *)&buf[22] = 2112;
        v143 = v137;
        _os_log_error_impl(&dword_1A66D3000, v76, OS_LOG_TYPE_ERROR, "File did not exist at content path: %@ %@. Attempting to fallback to default voice for language: %@", buf, 0x20u);
        if (!v4) {
      }
        }
      if (!v4)
      {
        objc_msgSend_primaryLanguage(v65, v71, v72, v73, v74);
        id v4 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      }
    }
    uint64_t v81 = objc_msgSend_unavailableVoiceIdentifiers(TTSSpeechSynthesizer, v71, v72, v73, v74);
    uint64_t v86 = objc_msgSend_identifier(v19, v82, v83, v84, v85);
    int v90 = objc_msgSend_containsObject_(v81, v87, (uint64_t)v86, v88, v89);

    if (v90)
    {
      uint64_t v95 = AXTTSLogCommon();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v19;
        _os_log_impl(&dword_1A66D3000, v95, OS_LOG_TYPE_INFO, "Voice %@ was unavailable or the speech service was nil, attempting to find on disk fallback", buf, 0xCu);
      }
    }
    else if (isValid)
    {
LABEL_24:
      uint64_t v99 = objc_msgSend_service(v19, v91, v92, v93, v94);
      BOOL v100 = v99 == 0;

      if (v100)
      {
        id v14 = 0;
      }
      else
      {
        uint64_t v105 = objc_msgSend_service(v19, v101, v102, v103, v104);
        uint64_t v110 = objc_msgSend_synthesizerInstanceID(self, v106, v107, v108, v109);
        objc_msgSend_initializeSpeechServerInstance_(v105, v111, v110, v112, v113);

        uint64_t v118 = objc_msgSend_service(v19, v114, v115, v116, v117);
        queue = self->_queue;
        uint64_t v124 = objc_msgSend_synthesizerInstanceID(self, v120, v121, v122, v123);
        objc_msgSend_setServiceQueue_forSynthesizerInstanceID_(v118, v125, (uint64_t)queue, v124, v126);

        id v14 = v19;
      }

      goto LABEL_28;
    }
    uint64_t v96 = objc_opt_class();
    uint64_t v98 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(v96, v97, 0, (uint64_t)v4, 2);

    uint64_t v19 = (void *)v98;
    goto LABEL_24;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v143 = sub_1A6718A28;
  uint64_t v144 = sub_1A6718A38;
  id v145 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v10 = objc_msgSend_voiceResolver(self, v6, v7, v8, v9);
  voiceIdentifier = self->_voiceIdentifier;
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = sub_1A671AF4C;
  v139[3] = &unk_1E5C6A5C0;
  v141 = buf;
  uint64_t v12 = v5;
  uint64_t v140 = v12;
  objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v10, v13, (uint64_t)voiceIdentifier, (uint64_t)v4, (uint64_t)v139);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  id v14 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
LABEL_28:

  return v14;
}

- (id)_makeRequestForVoice:(id)a3 andLanguageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(TTSSpeechRequest);
  uint64_t v13 = objc_msgSend_voucher(self, v9, v10, v11, v12);
  objc_msgSend_setVoucher_(v8, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_setVoice_(v8, v17, (uint64_t)v6, v18, v19);
  uint64_t v24 = objc_msgSend_synthesisProviderVoice(v6, v20, v21, v22, v23);
  int hasPerVoiceSettings = objc_msgSend_hasPerVoiceSettings(v24, v25, v26, v27, v28);

  if (hasPerVoiceSettings)
  {
    perVoiceSettings = self->_perVoiceSettings;
    if (perVoiceSettings)
    {
      objc_msgSend_setVoiceSettings_(v8, v30, (uint64_t)perVoiceSettings, v32, v33);
    }
    else
    {
      uint64_t v35 = objc_msgSend_speechSource(self, v30, 0, v32, v33);

      if (v35)
      {
        uint64_t v151 = 0;
        v152 = &v151;
        uint64_t v153 = 0x2050000000;
        uint64_t v36 = (void *)qword_1EB67A588;
        uint64_t v154 = qword_1EB67A588;
        if (!qword_1EB67A588)
        {
          v150[0] = MEMORY[0x1E4F143A8];
          v150[1] = 3221225472;
          v150[2] = sub_1A671EE74;
          v150[3] = &unk_1E5C696C8;
          v150[4] = &v151;
          sub_1A671EE74((uint64_t)v150, v30, v31, v32, v33);
          uint64_t v36 = (void *)v152[3];
        }
        id v37 = v36;
        _Block_object_dispose(&v151, 8);
        uint64_t v42 = objc_msgSend_sharedInstance(v37, v38, v39, v40, v41);
        uint64_t v47 = objc_msgSend_identifier(v6, v43, v44, v45, v46);
        uint64_t v52 = objc_msgSend_speechSource(self, v48, v49, v50, v51);
        uint64_t v55 = objc_msgSend_customSettingsForVoice_sourceKey_(v42, v53, (uint64_t)v47, (uint64_t)v52, v54);

        uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v55, v56, @"TTSAUParamsKey", v57, v58);
        objc_msgSend_setVoiceSettings_(v8, v60, (uint64_t)v59, v61, v62);
      }
    }
  }
  uint64_t v63 = objc_msgSend_synthesizerInstanceID(self, v30, v31, v32, v33);
  objc_msgSend_setSynthesizerInstanceID_(v8, v64, v63, v65, v66);
  long long v75 = objc_msgSend_language(v6, v67, v68, v69, v70);
  if (v75)
  {
    uint64_t v76 = objc_msgSend_language(v6, v71, v72, v73, v74);
    objc_msgSend_setLanguageCode_(v8, v77, (uint64_t)v76, v78, v79);
  }
  else
  {
    objc_msgSend_setLanguageCode_(v8, v71, (uint64_t)v7, v73, v74);
  }

  uint64_t v84 = objc_msgSend_gender(v6, v80, v81, v82, v83);
  objc_msgSend_setGender_(v8, v85, v84, v86, v87);
  objc_msgSend_setPitch_(v8, v88, v89, v90, v91, self->_pitch);
  objc_msgSend_setRate_(v8, v92, v93, v94, v95, self->_rate);
  objc_msgSend_setVolume_(v8, v96, v97, v98, v99, self->_volume);
  objc_msgSend_setMaintainsInput_(v8, v100, *(unsigned char *)&self->_synthesizerFlags >> 7, v101, v102);
  uint64_t v107 = objc_msgSend_outputChannels(self, v103, v104, v105, v106);
  objc_msgSend_setChannels_(v8, v108, (uint64_t)v107, v109, v110);

  uint64_t v115 = objc_msgSend_audioBufferCallback(self, v111, v112, v113, v114);
  objc_msgSend_setAudioBufferCallback_(v8, v116, (uint64_t)v115, v117, v118);

  uint64_t v123 = objc_msgSend_synthesizeSilently(self, v119, v120, v121, v122);
  objc_msgSend_setSynthesizeSilently_(v8, v124, v123, v125, v126);
  objc_msgSend_setDelegate_(v8, v127, (uint64_t)self, v128, v129);
  if (!self->_useSharedSession)
  {
    if (self->_audioSessionIDIsValid)
    {
      objc_msgSend_setAudioSessionID_(v8, v130, self->_audioSessionID, v132, v133);
    }
    else
    {
      uint64_t v137 = objc_msgSend_sharedInstance(MEMORY[0x1E4F153D8], v130, v131, v132, v133);
      uint64_t v142 = objc_msgSend_opaqueSessionID(v137, v138, v139, v140, v141);

      objc_msgSend_setAudioSessionID_(v8, v143, v142, v144, v145);
    }
    objc_msgSend_setAudioSessionIDIsValid_(v8, v134, 1, v135, v136);
    objc_msgSend_setAudioQueueFlags_(v8, v146, self->_audioQueueFlags, v147, v148);
  }

  return v8;
}

- (BOOL)startSpeakingString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 error:(id *)a6
{
  return MEMORY[0x1F4181798](self, sel_startSpeakingString_withLanguageCode_error_, a3, a5, a6);
}

- (BOOL)startSpeakingString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 request:(id *)a6 error:(id *)a7
{
  return MEMORY[0x1F4181798](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, a5);
}

- (BOOL)_startSpeakingString:(id)a3 orSSMLString:(id)a4 withLanguageCode:(id)a5 jobId:(id)a6 request:(id *)a7 error:(id *)a8
{
  uint64_t v13 = (uint64_t)a3;
  unint64_t v14 = (unint64_t)a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v171 = v16;
  if (v13 | v14)
  {
    uint64_t v20 = (uint64_t)v16;
    BOOL v168 = v14 != 0;
    BOOL v18 = v14 != 0;
  }
  else
  {
    CFErrorRef v17 = TTSErrorCreate(0, @"TTSErrorDomain", -4005, @"speech string is empty");
    BOOL v18 = 0;
    if (v17)
    {
      CFErrorRef v19 = v17;
      v170 = 0;
      if (!a8) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    BOOL v168 = 0;
    uint64_t v20 = (uint64_t)v171;
  }
  uint64_t v166 = a8;
  if ((TTSUseCoreSynthesizerForTTS() & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A671B9AC;
    block[3] = &unk_1E5C69588;
    void block[4] = self;
    dispatch_sync(queue, block);
  }
  uint64_t v25 = objc_msgSend__resolveVoiceForLanguage_(self, v21, (uint64_t)v15, v22, v23);
  uint64_t v30 = v25;
  if (v18)
  {
    id v31 = (id)v14;
  }
  else
  {
    uint64_t v32 = objc_msgSend_service(v25, v26, v27, v28, v29);
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      uint64_t v38 = objc_msgSend_service(v30, v34, v35, v36, v37);
      uint64_t v41 = objc_msgSend_embeddedRateMarkupForVoice_string_rate_(v38, v39, (uint64_t)v30, v13, v40, self->_rate);

      uint64_t v13 = v41;
    }
    uint64_t v42 = objc_msgSend_service(v30, v34, v35, v36, v37);
    char v43 = objc_opt_respondsToSelector();

    if (v43)
    {
      uint64_t v48 = objc_msgSend_service(v30, v44, v45, v46, v47);
      uint64_t v51 = objc_msgSend_embeddedPitchMarkupForVoice_string_pitch_(v48, v49, (uint64_t)v30, v13, v50, self->_pitch);

      uint64_t v13 = v51;
    }
    uint64_t v52 = objc_msgSend_service(v30, v44, v45, v46, v47);
    char v53 = objc_opt_respondsToSelector();

    if (v53)
    {
      uint64_t v58 = objc_msgSend_service(v30, v54, v55, v56, v57);
      uint64_t v61 = objc_msgSend_embeddedVolumeMarkupForVoice_string_volume_(v58, v59, (uint64_t)v30, v13, v60, self->_volume);

      uint64_t v13 = v61;
    }
    uint64_t v62 = objc_msgSend_language(v30, v54, v55, v56, v57);
    uint64_t v65 = v62;
    if (v62) {
      objc_msgSend__preprocessText_languageCode_(self, v63, v13, v62, v64);
    }
    else {
      objc_msgSend__preprocessText_languageCode_(self, v63, v13, (uint64_t)v15, v64);
    }
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = v65;
    uint64_t v20 = (uint64_t)v171;
  }

  id v165 = v15;
  uint64_t v68 = objc_msgSend__makeRequestForVoice_andLanguageCode_(self, v66, (uint64_t)v30, (uint64_t)v15, v67);
  uint64_t v73 = v68;
  unint64_t v167 = v14;
  if (v20)
  {
    objc_msgSend_setJobIdentifier_(v68, v69, v20, v71, v72);
  }
  else
  {
    uint64_t v78 = objc_msgSend_shared(_TtC12TextToSpeech15TTSSpeechTracer, v69, v70, v71, v72);
    uint64_t v83 = objc_msgSend_makeSpeechJobIdentifier(v78, v79, v80, v81, v82);
    objc_msgSend_setJobIdentifier_(v73, v84, (uint64_t)v83, v85, v86);
  }
  uint64_t v87 = objc_msgSend_shared(_TtC12TextToSpeech15TTSSpeechTracer, v74, v75, v76, v77);
  uint64_t v91 = objc_msgSend_makeWithStart_(_TtC12TextToSpeech18TTSSpeechEventObjc, v88, (uint64_t)v31, v89, v90);
  uint64_t v96 = objc_msgSend_jobIdentifier(v73, v92, v93, v94, v95);
  objc_msgSend_emitWithEvent_forIdentifier_(v87, v97, (uint64_t)v91, (uint64_t)v96, v98);

  uint64_t v99 = [TTSSpeechString alloc];
  v170 = v31;
  uint64_t v103 = objc_msgSend_initWithOriginalString_(v99, v100, (uint64_t)v31, v101, v102);
  objc_initWeak(&location, v73);
  uint64_t v108 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v104, v105, v106, v107);
  v175[0] = MEMORY[0x1E4F143A8];
  v175[1] = 3221225472;
  v175[2] = sub_1A671BA0C;
  v175[3] = &unk_1E5C6A608;
  id v163 = v108;
  id v176 = v163;
  objc_copyWeak(&v177, &location);
  objc_msgSend_setLatencyCallback_(v73, v109, (uint64_t)v175, v110, v111);
  objc_msgSend_setType_(v103, v112, v168, v113, v114);
  v119 = objc_msgSend_bundleIdentifier(self, v115, v116, v117, v118);
  objc_msgSend__processUserSubstitutionsToText_request_bundleIdentifier_voice_(self, v120, (uint64_t)v103, (uint64_t)v73, (uint64_t)v119, v30);

  objc_msgSend_setSpeechString_(v73, v121, (uint64_t)v103, v122, v123);
  uint64_t v128 = objc_msgSend_shared(_TtC12TextToSpeech15TTSSpeechTracer, v124, v125, v126, v127);
  uint64_t v133 = objc_msgSend_originalString(v103, v129, v130, v131, v132);
  uint64_t v138 = objc_msgSend_transformedString(v103, v134, v135, v136, v137);
  uint64_t v140 = objc_msgSend_makeWithOtherRewrite_from_to_(_TtC12TextToSpeech18TTSSpeechEventObjc, v139, @"user-substitutions", (uint64_t)v133, (uint64_t)v138);
  uint64_t v145 = objc_msgSend_jobIdentifier(v73, v141, v142, v143, v144);
  objc_msgSend_emitWithEvent_forIdentifier_(v128, v146, (uint64_t)v140, (uint64_t)v145, v147);

  if ((TTSIsBaseSystem() & 1) == 0)
  {
    v152 = objc_msgSend_synthesisProviderVoice(v30, v148, v149, v150, v151, v163);
    objc_msgSend_setSynthesisProviderVoice_(v73, v153, (uint64_t)v152, v154, v155);
  }
  objc_msgSend_setDelegate_(v73, v148, (uint64_t)self, v150, v151, v163);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_setDispatchTime_(v73, v157, v158, v159, v160, Current);
  if (v73)
  {
    uint64_t v161 = self->_queue;
    v172[0] = MEMORY[0x1E4F143A8];
    v172[1] = 3221225472;
    v172[2] = sub_1A671BA9C;
    v172[3] = &unk_1E5C69E78;
    v172[4] = self;
    id v173 = v73;
    id v174 = v30;
    dispatch_sync(v161, v172);
  }
  if (a7) {
    *a7 = v73;
  }
  objc_destroyWeak(&v177);

  objc_destroyWeak(&location);
  CFErrorRef v19 = 0;
  BOOL v18 = 1;
  a8 = v166;
  unint64_t v14 = v167;
  id v15 = v165;
  if (v166) {
LABEL_31:
  }
    *a8 = v19;
LABEL_32:

  return v18;
}

+ (id)audioFileSettingsForVoice:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_msgSend_voiceForIdentifier_(TTSSpeechSynthesizer, v3, (uint64_t)v6, v4, v5);
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = sub_1A6718A28;
    char v33 = sub_1A6718A38;
    id v34 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v13 = objc_msgSend_synthesisProviderVoice(v7, v9, v10, v11, v12);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = sub_1A671BCC8;
    uint64_t v26 = &unk_1E5C6A630;
    uint64_t v28 = &v29;
    unint64_t v14 = v8;
    uint64_t v27 = v14;
    objc_msgSend_formatForVoice_completionHandler_(_TtC12TextToSpeech13TTSAURenderer, v15, (uint64_t)v13, (uint64_t)&v23, v16);

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v21 = objc_msgSend_settings((void *)v30[5], v17, v18, v19, v20, v23, v24, v25, v26);

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

+ (id)_speechVoiceForIdentifier:(id)a3 language:(id)a4 footprint:(int64_t)a5
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (uint64_t)a3;
  uint64_t v9 = (uint64_t)a4;
  if (TTSUseCoreSynthesizerForTTS())
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v136 = sub_1A6718A28;
    uint64_t v137 = sub_1A6718A38;
    id v138 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    uint64_t v19 = objc_msgSend_shared(_TtC12TextToSpeech13VoiceResolver, v15, v16, v17, v18);
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = sub_1A671C5B8;
    v127[3] = &unk_1E5C6A5C0;
    uint64_t v129 = buf;
    uint64_t v20 = v14;
    uint64_t v128 = v20;
    objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v19, v21, v8, v9, (uint64_t)v127);

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    id v22 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    goto LABEL_37;
  }
  int64_t v100 = a5;
  if (!(v8 | v9))
  {
    uint64_t v23 = objc_msgSend_preferredLanguages(MEMORY[0x1E4F1CA20], v10, v11, v12, v13);
    uint64_t v9 = objc_msgSend_firstObject(v23, v24, v25, v26, v27);

    goto LABEL_9;
  }
  if (!v8) {
    goto LABEL_9;
  }
  objc_msgSend_voiceForIdentifier_(TTSSpeechSynthesizer, v10, v8, v12, v13);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = AXTTSLogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    char v33 = objc_msgSend_service(v22, v29, v30, v31, v32);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v33;
    _os_log_impl(&dword_1A66D3000, v28, OS_LOG_TYPE_INFO, "Voice was found for given identifier %@ with service %@", buf, 0x16u);
  }
  if (!v22)
  {
LABEL_9:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v136 = sub_1A6718A28;
    uint64_t v137 = sub_1A6718A38;
    id v138 = 0;
    id v34 = objc_msgSend_sharedInstance(TTSAXResourceManager, v10, v11, v12, v13);
    uint64_t v37 = objc_msgSend_resourcesWithLanguage_type_(v34, v35, v9, 1, v36);

    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = sub_1A671C618;
    v123[3] = &unk_1E5C6A658;
    id v38 = (id)v8;
    id v124 = v38;
    uint64_t v125 = buf;
    id v126 = a1;
    uint64_t v46 = objc_msgSend_ax_flatMappedArrayUsingBlock_(v37, v39, (uint64_t)v123, v40, v41);
    if (v8) {
      int v47 = objc_msgSend_isInstalled(*(void **)(*(void *)&buf[8] + 40), v42, v43, v44, v45) ^ 1;
    }
    else {
      int v47 = 1;
    }
    uint64_t v117 = 0;
    uint64_t v118 = &v117;
    uint64_t v119 = 0x3032000000;
    uint64_t v120 = sub_1A6718A28;
    uint64_t v121 = sub_1A6718A38;
    id v122 = 0;
    uint64_t v111 = 0;
    uint64_t v112 = &v111;
    uint64_t v113 = 0x3032000000;
    uint64_t v114 = sub_1A6718A28;
    uint64_t v115 = sub_1A6718A38;
    id v116 = 0;
    uint64_t v48 = qword_1EB67AAC8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A671C6DC;
    block[3] = &unk_1E5C6A680;
    id v49 = v46;
    id v105 = v49;
    uint64_t v107 = &v111;
    id v50 = v38;
    id v106 = v50;
    char v110 = v47;
    uint64_t v108 = &v117;
    int64_t v109 = v100;
    dispatch_sync(v48, block);
    if (v118[5])
    {
      uint64_t v55 = AXTTSLogCommon();
      uint64_t v56 = v37;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        uint64_t v57 = v118[5];
        LODWORD(v130) = 138412290;
        *(void *)((char *)&v130 + 4) = v57;
        _os_log_impl(&dword_1A66D3000, v55, OS_LOG_TYPE_INFO, "Found selected voice: %@", (uint8_t *)&v130, 0xCu);
      }

      id v22 = (id)v118[5];
    }
    else
    {
      uint64_t v56 = v37;
      if (!v47)
      {
        if (objc_msgSend_containsString_(v50, v51, @"siri", v53, v54)
          && objc_msgSend_containsString_(v50, v73, @"premium", v74, v75))
        {
          uint64_t v8 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v50, v76, @"premium", @"compact", v77);

          uint64_t v81 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v78, @"identifier == %@", v79, v80, v8);
          uint64_t v85 = objc_msgSend_filteredArrayUsingPredicate_(v49, v82, (uint64_t)v81, v83, v84);
          objc_msgSend_firstObject(v85, v86, v87, v88, v89);
          id v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
LABEL_36:

            _Block_object_dispose(&v111, 8);
            _Block_object_dispose(&v117, 8);

            _Block_object_dispose(buf, 8);
            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v8 = (uint64_t)v50;
        }
        *(void *)&long long v130 = 0;
        *((void *)&v130 + 1) = &v130;
        uint64_t v131 = 0x3032000000;
        uint64_t v132 = sub_1A6718A28;
        uint64_t v133 = sub_1A6718A38;
        id v134 = (id)v112[5];
        if (!*(void *)(*((void *)&v130 + 1) + 40))
        {
          uint64_t v90 = qword_1EB67AAC8;
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = sub_1A671C8BC;
          v101[3] = &unk_1E5C696A0;
          id v102 = v49;
          uint64_t v103 = &v130;
          dispatch_sync(v90, v101);

          if (!*(void *)(*((void *)&v130 + 1) + 40)
            && (objc_msgSend_isEqualToString_((void *)v9, v91, @"en-US", v92, v93) & 1) == 0)
          {
            uint64_t v95 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v94, 0, @"en-US", v100);
            uint64_t v96 = *(void **)(*((void *)&v130 + 1) + 40);
            *(void *)(*((void *)&v130 + 1) + 40) = v95;
          }
        }
        id v22 = *(id *)(*((void *)&v130 + 1) + 40);
        _Block_object_dispose(&v130, 8);

        goto LABEL_36;
      }
      uint64_t v58 = objc_msgSend_sharedInstance(TTSLocaleUtilities, v51, v52, v53, v54);
      uint64_t v62 = objc_msgSend_defaultVoiceIdentifierForGeneralLanguageCode_(v58, v59, v9, v60, v61);

      if (v62)
      {
        uint64_t v63 = AXTTSLogCommon();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          uint64_t v64 = v112[5];
          LODWORD(v130) = 138412290;
          *(void *)((char *)&v130 + 4) = v64;
          _os_log_impl(&dword_1A66D3000, v63, OS_LOG_TYPE_INFO, "Found general default voice: %@", (uint8_t *)&v130, 0xCu);
        }

        uint64_t v69 = objc_msgSend_sharedInstance(TTSAXResourceManager, v65, v66, v67, v68);
        objc_msgSend_speechVoiceWithVoiceId_(v69, v70, (uint64_t)v62, v71, v72);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v97 = AXTTSLogCommon();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          uint64_t v98 = v112[5];
          LODWORD(v130) = 138412290;
          *(void *)((char *)&v130 + 4) = v98;
          _os_log_impl(&dword_1A66D3000, v97, OS_LOG_TYPE_INFO, "Found default voice: %@", (uint8_t *)&v130, 0xCu);
        }

        id v22 = (id)v112[5];
      }
    }
    uint64_t v8 = (uint64_t)v50;
    goto LABEL_36;
  }
LABEL_37:

  return v22;
}

- (BOOL)_stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v44 = self;
  uint64_t v8 = self->_speechRequests;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(id *)(*((void *)&v47 + 1) + 8 * i);
        if (!v7 || v15 == v7)
        {
          if (TTSUseCoreSynthesizerForTTS())
          {
            dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
            uint64_t v25 = objc_msgSend_coreSynth(v44, v21, v22, v23, v24);
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = sub_1A671CC50;
            v45[3] = &unk_1E5C6A0A8;
            dispatch_semaphore_t v46 = v20;
            uint64_t v26 = v20;
            objc_msgSend_stopSpeakingAt_completionHandler_(v25, v27, a4, (uint64_t)v45, v28);

            dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
            uint64_t v29 = v46;
          }
          else
          {
            uint64_t v26 = objc_msgSend_voice(v15, v16, v17, v18, v19);
            uint64_t v29 = objc_msgSend_service(v26, v30, v31, v32, v33);
            objc_msgSend_stopSpeechRequest_atMark_(v29, v34, (uint64_t)v15, a4 == 1, v35);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v12);
  }

  if (objc_msgSend_count(v44->_speechRequests, v36, v37, v38, v39)) {
    CFErrorRef v40 = 0;
  }
  else {
    CFErrorRef v40 = TTSErrorCreate(0, @"TTSErrorDomain", -4003, @"not currently speaking");
  }
  if (a6) {
    *a6 = v40;
  }

  return v40 == 0;
}

- (BOOL)_pauseSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5 error:(id *)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v8 = self->_speechRequests;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(id *)(*((void *)&v48 + 1) + 8 * i);
        if (!v7 || v15 == v7)
        {
          if (TTSUseCoreSynthesizerForTTS())
          {
            dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
            uint64_t v25 = objc_msgSend_coreSynth(self, v21, v22, v23, v24);
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = sub_1A671CEC4;
            v46[3] = &unk_1E5C6A0A8;
            dispatch_semaphore_t v47 = v20;
            uint64_t v26 = v20;
            objc_msgSend_pauseSpeakingAt_completionHandler_(v25, v27, a4, (uint64_t)v46, v28);

            dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
            objc_msgSend_speechRequestDidPause_forService_(self, v29, (uint64_t)v15, 0, v30);
            uint64_t v31 = v47;
          }
          else
          {
            uint64_t v26 = objc_msgSend_voice(v15, v16, v17, v18, v19);
            uint64_t v31 = objc_msgSend_service(v26, v32, v33, v34, v35);
            objc_msgSend_pauseSpeechRequest_atMark_(v31, v36, (uint64_t)v15, a4 == 1, v37);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v12);
  }

  if (objc_msgSend_count(self->_speechRequests, v38, v39, v40, v41)) {
    CFErrorRef v42 = 0;
  }
  else {
    CFErrorRef v42 = TTSErrorCreate(0, @"TTSErrorDomain", -4003, @"not currently speaking");
  }
  if (a6) {
    *a6 = v42;
  }

  return v42 == 0;
}

- (BOOL)_continueSpeakingRequest:(id)a3 withError:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = self->_speechRequests;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v42;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(id *)(*((void *)&v41 + 1) + 8 * v13);
        if (!v6 || v14 == v6)
        {
          if (TTSUseCoreSynthesizerForTTS())
          {
            uint64_t v19 = objc_msgSend_coreSynth(self, v15, v16, v17, v18);
            int v24 = objc_msgSend_continueSpeaking(v19, v20, v21, v22, v23);

            if (v24) {
              objc_msgSend_speechRequestDidContinue_forService_(self, v10, (uint64_t)v14, 0, v25);
            }
          }
          else
          {
            uint64_t v26 = objc_msgSend_voice(v14, v15, v16, v17, v18, (void)v41);
            uint64_t v31 = objc_msgSend_service(v26, v27, v28, v29, v30);
            objc_msgSend_continueSpeechRequest_(v31, v32, (uint64_t)v14, v33, v34);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v11);
  }

  if (!objc_msgSend_count(self->_speechRequests, v35, v36, v37, v38))
  {
    CFErrorRef v39 = TTSErrorCreate(0, @"TTSErrorDomain", -4003, @"no active speech job");
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  CFErrorRef v39 = 0;
  if (a4) {
LABEL_16:
  }
    *a4 = v39;
LABEL_17:

  return v39 == 0;
}

- (NSArray)audioEffects
{
  uint64_t v5 = objc_msgSend_coreSynth(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_effects(v5, v6, v7, v8, v9);

  return (NSArray *)v10;
}

- (void)setAudioEffects:(id)a3
{
  id v4 = a3;
  objc_msgSend_coreSynth(self, v5, v6, v7, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEffects_(v12, v9, (uint64_t)v4, v10, v11);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A671D1E8;
  v7[3] = &unk_1E5C69600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (TTSSpeechSynthesizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TTSSpeechSynthesizerDelegate *)WeakRetained;
}

- (BOOL)startSpeakingString:(id)a3 error:(id *)a4
{
  return MEMORY[0x1F4181798](self, sel_startSpeakingString_withLanguageCode_error_, a3, 0, a4);
}

- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel_startSpeakingString_withLanguageCode_error_, a3, a4, a5);
}

- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 error:(id *)a4
{
  return objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(self, a2, a3, 0, (uint64_t)a4);
}

- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A671D2F0;
  block[3] = &unk_1E5C6A6A8;
  void block[4] = self;
  block[5] = &v10;
  BOOL v9 = a4;
  void block[6] = a3;
  block[7] = a5;
  dispatch_sync(queue, block);
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 error:(id *)a4
{
  return MEMORY[0x1F4181798](self, sel_pauseSpeakingAtNextBoundary_synchronously_error_, a3, 0, a4);
}

- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A671D3F0;
  block[3] = &unk_1E5C6A6A8;
  void block[4] = self;
  block[5] = &v10;
  BOOL v9 = a4;
  void block[6] = a3;
  block[7] = a5;
  dispatch_sync(queue, block);
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)continueSpeakingWithError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A671D4E0;
  block[3] = &unk_1E5C6A6D0;
  void block[4] = self;
  block[5] = &v7;
  void block[6] = a3;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isSpeaking
{
  if (TTSUseCoreSynthesizerForTTS())
  {
    uint64_t v7 = objc_msgSend_coreSynth(self, v3, v4, v5, v6);
    if (objc_msgSend_isSpeaking(v7, v8, v9, v10, v11))
    {
      char isPaused = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_coreSynth(self, v12, v13, v14, v15);
      char isPaused = objc_msgSend_isPaused(v18, v19, v20, v21, v22);
    }
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    queue = self->_queue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1A671D624;
    v24[3] = &unk_1E5C696A0;
    v24[4] = self;
    v24[5] = &v25;
    dispatch_sync(queue, v24);
    char isPaused = *((unsigned char *)v26 + 24) != 0;
    _Block_object_dispose(&v25, 8);
  }
  return isPaused;
}

- (id)speechString
{
  uint64_t v5 = objc_msgSend_lastObject(self->_speechRequests, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_speechString(v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_originalString(v10, v11, v12, v13, v14);

  if (v15)
  {
    uint64_t v20 = objc_msgSend_speechString(v5, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_originalString(v20, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v25 = objc_msgSend_text(v5, v16, v17, v18, v19);
  }

  return v25;
}

- (float)minimumRate
{
  return 0.5;
}

- (float)maximumRate
{
  return 4.0;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)useSpecificAudioSession:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    self->_audioSessionID = a3;
    *(_WORD *)&self->_useSharedSession = 256;
    if (TTSUseCoreSynthesizerForTTS())
    {
      objc_msgSend_retrieveSessionWithID_(MEMORY[0x1E4F153D8], v5, v3, v6, v7);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = objc_msgSend_coreSynth(self, v8, v9, v10, v11);
      objc_msgSend_setAudioSession_(v12, v13, (uint64_t)v16, v14, v15);
    }
  }
}

- (unsigned)audioQueueFlags
{
  if (!TTSUseCoreSynthesizerForTTS()) {
    return self->_audioQueueFlags;
  }
  uint64_t v7 = objc_msgSend_coreSynth(self, v3, v4, v5, v6);
  unsigned int v12 = objc_msgSend_audioQueueFlags(v7, v8, v9, v10, v11);

  return v12;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_coreSynth(self, v5, v6, v7, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAudioQueueFlags_(v12, v9, v3, v10, v11);
  }
  else
  {
    self->_audioQueueFlags = v3;
  }
}

+ (id)supportedIPAPhonemeLanguages
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(TTSPhonemeSupport, sel_supportedIPAPhonemeLanguages);
}

- (BOOL)startSpeakingString:(id)a3 request:(id *)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, 0);
}

- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 jobIdentifier:(id)a5 request:(id *)a6 error:(id *)a7
{
  return MEMORY[0x1F4181798](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, a4);
}

- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 request:(id *)a5 error:(id *)a6
{
  return MEMORY[0x1F4181798](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, a4);
}

- (BOOL)startSpeakingSSML:(id)a3 withLanguageCode:(id)a4 request:(id *)a5 error:(id *)a6
{
  return MEMORY[0x1F4181798](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, 0, a3, a4);
}

- (BOOL)startSpeakingSSML:(id)a3 withLanguageCode:(id)a4 jobIdentifier:(id)a5 request:(id *)a6 error:(id *)a7
{
  return MEMORY[0x1F4181798](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, 0, a3, a4);
}

- (BOOL)stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 error:(id *)a5
{
  return objc_msgSend__stopSpeakingRequest_atNextBoundary_synchronously_error_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (BOOL)pauseSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 error:(id *)a5
{
  return objc_msgSend__pauseSpeakingRequest_atNextBoundary_synchronously_error_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (void)speechRequestDidStart:(id)a3 forService:(id)a4
{
  id v9 = a3;
  if (*(unsigned char *)&self->_synthesizerFlags)
  {
    uint64_t v10 = objc_msgSend_delegateTargetQueue(self, v5, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A671DA80;
    v11[3] = &unk_1E5C69600;
    v11[4] = self;
    id v12 = v9;
    dispatch_async(v10, v11);
  }
}

- (void)speechRequestDidPause:(id)a3 forService:(id)a4
{
  id v9 = a3;
  if ((*(unsigned char *)&self->_synthesizerFlags & 8) != 0)
  {
    uint64_t v10 = objc_msgSend_delegateTargetQueue(self, v5, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A671DB90;
    v11[3] = &unk_1E5C69600;
    v11[4] = self;
    id v12 = v9;
    dispatch_async(v10, v11);
  }
}

- (void)speechRequestDidContinue:(id)a3 forService:(id)a4
{
  id v9 = a3;
  if ((*(unsigned char *)&self->_synthesizerFlags & 0x10) != 0)
  {
    uint64_t v10 = objc_msgSend_delegateTargetQueue(self, v5, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A671DCA0;
    v11[3] = &unk_1E5C69600;
    v11[4] = self;
    id v12 = v9;
    dispatch_async(v10, v11);
  }
}

- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 forService:(id)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A671DDE8;
  block[3] = &unk_1E5C6A770;
  void block[4] = self;
  id v19 = v11;
  BOOL v22 = a4;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(queue, block);
}

- (void)speechRequest:(id)a3 withMarker:(id)a4 didStartForService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v15 = objc_msgSend__processMarker_forRequest_(self, v9, (uint64_t)v8, (uint64_t)v7, v10);
  if (v15)
  {
    if ((*(unsigned char *)&self->_synthesizerFlags & 0x40) != 0)
    {
      id v16 = objc_msgSend_delegateTargetQueue(self, v11, v12, v13, v14);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A671E350;
      block[3] = &unk_1E5C69E78;
      void block[4] = self;
      id v27 = v15;
      id v28 = v7;
      dispatch_async(v16, block);
    }
    if (objc_msgSend_markType(v8, v11, v12, v13, v14) == 1)
    {
      id v21 = v8;
      if ((*(unsigned char *)&self->_synthesizerFlags & 0x20) != 0)
      {
        BOOL v22 = objc_msgSend_delegateTargetQueue(self, v17, v18, v19, v20);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = sub_1A671E3A8;
        v23[3] = &unk_1E5C69E78;
        v23[4] = self;
        id v24 = v21;
        id v25 = v7;
        dispatch_async(v22, v23);
      }
    }
  }
}

- (id)_processMarker:(id)a3 forRequest:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_markType(v5, v7, v8, v9, v10) != 1) {
    goto LABEL_10;
  }
  id v11 = v5;
  unint64_t v16 = objc_msgSend_wordRange(v11, v12, v13, v14, v15);
  uint64_t v18 = v17;
  BOOL v22 = objc_msgSend_text(v6, v17, v19, v20, v21);
  if (v16 <= objc_msgSend_length(v22, v23, v24, v25, v26))
  {
    unint64_t v35 = (unint64_t)&v18[v16];
    uint64_t v36 = objc_msgSend_text(v6, v27, v28, v29, v30);
    unint64_t v41 = objc_msgSend_length(v36, v37, v38, v39, v40);

    if (v35 <= v41)
    {
LABEL_9:

LABEL_10:
      id v63 = v5;
      goto LABEL_11;
    }
  }
  else
  {
  }
  long long v42 = objc_msgSend_text(v6, v31, v32, v33, v34);
  unint64_t v47 = objc_msgSend_length(v42, v43, v44, v45, v46);

  if (v16 < v47)
  {
    uint64_t v52 = objc_msgSend_text(v6, v48, v49, v50, v51);
    uint64_t v57 = objc_msgSend_length(v52, v53, v54, v55, v56);

    uint64_t v58 = AXTTSLogCommon();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      uint64_t v65 = v57 - v16;
      uint64_t v66 = objc_msgSend_text(v6, v59, v60, v61, v62);
      uint64_t v67 = NSNumber;
      uint64_t v72 = objc_msgSend_markType(v11, v68, v69, v70, v71);
      uint64_t v76 = objc_msgSend_numberWithInteger_(v67, v73, v72, v74, v75);
      uint64_t v80 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v77, v16, v78, v79);
      uint64_t v84 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v81, v65, v82, v83);
      int v85 = 138413058;
      uint64_t v86 = v66;
      __int16 v87 = 2112;
      uint64_t v88 = v76;
      __int16 v89 = 2112;
      uint64_t v90 = v80;
      __int16 v91 = 2112;
      uint64_t v92 = v84;
      _os_log_error_impl(&dword_1A66D3000, v58, OS_LOG_TYPE_ERROR, "Speech processing error: [%@] / mark: %@ / range: %@, %@", (uint8_t *)&v85, 0x2Au);
    }
    goto LABEL_9;
  }

  id v63 = 0;
LABEL_11:

  return v63;
}

- (NSString)speechSource
{
  return self->_speechSource;
}

- (void)setSpeechSource:(id)a3
{
}

- (OS_dispatch_queue)delegateTargetQueue
{
  return self->_delegateTargetQueue;
}

- (void)setDelegateTargetQueue:(id)a3
{
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVoiceIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (unint64_t)requestClientIdentifier
{
  return self->_requestClientIdentifier;
}

- (void)setRequestClientIdentifier:(unint64_t)a3
{
  self->_requestClientIdentifier = a3;
}

- (void)speakingRequestClientContext
{
  return self->_speakingRequestClientContext;
}

- (void)setSpeakingRequestClientContext:(void *)a3
{
  self->_speakingRequestClientContext = a3;
}

- (BOOL)supportsAccurateWordCallbacks
{
  return self->_supportsAccurateWordCallbacks;
}

- (void)setSupportsAccurateWordCallbacks:(BOOL)a3
{
  self->_supportsAccurateWordCallbacks = a3;
}

- (BOOL)skipLuthorRules
{
  return self->_skipLuthorRules;
}

- (void)setSkipLuthorRules:(BOOL)a3
{
  self->_skipLuthorRules = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSArray)userSubstitutions
{
  return self->_userSubstitutions;
}

- (NSArray)phonemeSubstitutions
{
  return self->_phonemeSubstitutions;
}

- (id)audioBufferCallback
{
  return self->_audioBufferCallback;
}

- (void)setAudioBufferCallback:(id)a3
{
}

- (NSDictionary)perVoiceSettings
{
  return self->_perVoiceSettings;
}

- (BOOL)ignoreSubstitutions
{
  return self->_ignoreSubstitutions;
}

- (void)setIgnoreSubstitutions:(BOOL)a3
{
  self->_ignoreSubstitutions = a3;
}

- (BOOL)synthesizeSilently
{
  return self->_synthesizeSilently;
}

- (void)setSynthesizeSilently:(BOOL)a3
{
  self->_synthesizeSilently = a3;
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (void)setCoreSynth:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSynth, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_perVoiceSettings, 0);
  objc_storeStrong(&self->_audioBufferCallback, 0);
  objc_storeStrong((id *)&self->_phonemeSubstitutions, 0);
  objc_storeStrong((id *)&self->_userSubstitutions, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateTargetQueue, 0);
  objc_storeStrong((id *)&self->_speechSource, 0);
  objc_storeStrong((id *)&self->_testingLastRuleConversion, 0);
  objc_storeStrong((id *)&self->_outputChannels, 0);
  objc_storeStrong((id *)&self->_speechRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_channels, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end