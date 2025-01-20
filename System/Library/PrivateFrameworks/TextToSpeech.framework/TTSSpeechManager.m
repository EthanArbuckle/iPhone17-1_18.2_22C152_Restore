@interface TTSSpeechManager
+ (BOOL)_isCharacterNativelySpeakable:(unsigned __int16)a3 languageCode:(id)a4;
+ (BOOL)currentProcessAllowedToSaveVoiceInfo;
+ (URegularExpression)createRegularExpressionFromString:(id)a3;
+ (id)_resetAvailableVoices;
+ (id)_resetAvailableVoices:(BOOL)a3;
+ (id)audioFileSettingsForVoice:(id)a3;
+ (id)avSpeechVoicesForTTSAXResources:(id)a3;
+ (id)availableLanguageCodes;
+ (id)availableSuperCompactVoices;
+ (id)availableVoices;
+ (id)availableVoices:(BOOL)a3;
+ (id)currentLanguageCode;
+ (id)languageCodeForVoiceIdentifier:(id)a3;
+ (id)literalStringMarkup:(id)a3 string:(id)a4 speakCap:(BOOL)a5;
+ (id)matchedRangesForString:(id)a3 withRegularExpression:(URegularExpression *)a4;
+ (id)pauseMarkupString:(id)a3;
+ (id)remapLanguageCode:(id)a3;
+ (id)spellOutLetterCaseMarkupString:(id)a3 string:(id)a4;
+ (id)spellOutMarkupString:(id)a3 string:(id)a4;
+ (void)test_actionStartTap:(id)a3;
+ (void)test_setAvailableVoices:(id)a3;
+ (void)test_setUnitTestMode:(BOOL)a3;
- (AVAudioSession)audioSession;
- (AXDispatchTimer)audioDeactivatorTimer;
- (BOOL)_enqueueSelectorOnSpeechThread:(SEL)a3 object:(id)a4 waitUntilDone:(BOOL)a5;
- (BOOL)didRequestPauseSpeakingDuringAudioInterruption;
- (BOOL)didRequestResumeSpeakingDuringAudioInterruption;
- (BOOL)didRequestStartSpeakingDuringAudioInterruption;
- (BOOL)isInAudioInterruption;
- (BOOL)isPaused;
- (BOOL)isSpeaking;
- (BOOL)shouldHandleAudioInterruptions;
- (BOOL)showControlCenterControls;
- (BOOL)speechEnabled;
- (BOOL)usesAuxiliarySession;
- (BOOL)wasSpeakingBeforeAudioInterruption;
- (NSArray)outputChannels;
- (NSNumber)originalSpeechRateForJobOverride;
- (NSString)audioSessionCategory;
- (NSString)speechSource;
- (OS_dispatch_queue)audioOperationQueue;
- (TTSSpeechAction)requestedActionDuringAudioInterruption;
- (TTSSpeechManager)init;
- (double)audioInterruptionStartedTime;
- (double)audioSessionInactiveTimeout;
- (id)_phonemeSubstitutionsForAction:(id)a3;
- (id)externalVoiceIdentifierUsedForLanguage:(id)a3;
- (id)requestWillStart;
- (id)voiceIdentifierUsedForLanguage:(id)a3;
- (unint64_t)audioSessionCategoryOptions;
- (unint64_t)setActiveOptions;
- (unsigned)audioQueueFlags;
- (void)__speechJobFinished:(id)a3;
- (void)_clearSpeechQueue;
- (void)_continueSpeaking;
- (void)_didBeginInterruption;
- (void)_didEndInterruption;
- (void)_dispatchSpeechAction:(id)a3;
- (void)_handleAudioInterruption:(id)a3;
- (void)_handleMediaServicesWereLost:(id)a3;
- (void)_handleMediaServicesWereReset:(id)a3;
- (void)_initialize;
- (void)_isSpeaking:(id)a3;
- (void)_pauseSpeaking:(id)a3;
- (void)_processAudioBufferCallback:(id)a3;
- (void)_processDidContinueCallback:(id)a3;
- (void)_processDidEncounterMarker:(id)a3;
- (void)_processDidPauseCallback:(id)a3;
- (void)_processDidStartCallback:(id)a3;
- (void)_processWillSpeechRange:(id)a3;
- (void)_resetInterruptionTracking;
- (void)_setVoiceForAction:(id)a3 snippet:(id)a4;
- (void)_speechJobFinished:(BOOL)a3 action:(id)a4;
- (void)_startNextSpeechJob;
- (void)_stopSpeaking:(id)a3;
- (void)_tearDown;
- (void)_updateAudioSessionProperties;
- (void)_updateAuxiliarySession;
- (void)_updateUserSubstitutions;
- (void)clearSpeechQueue;
- (void)continueSpeaking;
- (void)dealloc;
- (void)dispatchSpeechAction:(id)a3;
- (void)handleAudioInterruption:(id)a3;
- (void)handleAudioSessionObservers:(BOOL)a3;
- (void)handleMediaServicesWereLost:(id)a3;
- (void)handleMediaServicesWereReset:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseSpeaking:(int64_t)a3;
- (void)setAudioDeactivatorTimer:(id)a3;
- (void)setAudioInterruptionStartedTime:(double)a3;
- (void)setAudioOperationQueue:(id)a3;
- (void)setAudioQueueFlags:(unsigned int)a3;
- (void)setAudioSession:(id)a3;
- (void)setAudioSessionCategory:(id)a3;
- (void)setAudioSessionCategoryOptions:(unint64_t)a3;
- (void)setAudioSessionInactiveTimeout:(double)a3;
- (void)setDidRequestPauseSpeakingDuringAudioInterruption:(BOOL)a3;
- (void)setDidRequestResumeSpeakingDuringAudioInterruption:(BOOL)a3;
- (void)setDidRequestStartSpeakingDuringAudioInterruption:(BOOL)a3;
- (void)setIsInAudioInterruption:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setOriginalSpeechRateForJobOverride:(id)a3;
- (void)setOutputChannels:(id)a3;
- (void)setRequestWillStart:(id)a3;
- (void)setRequestedActionDuringAudioInterruption:(id)a3;
- (void)setSetActiveOptions:(unint64_t)a3;
- (void)setShouldHandleAudioInterruptions:(BOOL)a3;
- (void)setSpeechEnabled:(BOOL)a3;
- (void)setSpeechSource:(id)a3;
- (void)setUsesAuxiliarySession:(BOOL)a3;
- (void)setWasSpeakingBeforeAudioInterruption:(BOOL)a3;
- (void)speechSynthesizer:(id)a3 didContinueSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 didEncounterMarker:(id)a4 forRequest:(id)a5;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError:(id)a6;
- (void)speechSynthesizer:(id)a3 didPauseSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4;
- (void)stopSpeaking;
- (void)stopSpeaking:(int64_t)a3;
- (void)tearDown;
@end

@implementation TTSSpeechManager

+ (id)currentLanguageCode
{
  id v2 = TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();

  return v2;
}

- (TTSSpeechManager)init
{
  v36.receiver = self;
  v36.super_class = (Class)TTSSpeechManager;
  id v2 = [(TTSSpeechManager *)&v36 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("speech-manager-properties", 0);
    propertyQueue = v2->_propertyQueue;
    v2->_propertyQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("speech-manager-audio", 0);
    audioOperationQueue = v2->_audioOperationQueue;
    v2->_audioOperationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    speechQueue = v2->_speechQueue;
    v2->_speechQueue = v7;

    v2->_speechEnabled = 1;
    objc_msgSend_setShouldHandleAudioInterruptions_(v2, v9, 1, v10, v11);
    id v12 = objc_alloc(MEMORY[0x1E4F48318]);
    uint64_t v16 = objc_msgSend_initWithTargetSerialQueue_(v12, v13, MEMORY[0x1E4F14428], v14, v15);
    audioDeactivatorTimer = v2->_audioDeactivatorTimer;
    v2->_audioDeactivatorTimer = (AXDispatchTimer *)v16;

    objc_msgSend_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_(v2->_audioDeactivatorTimer, v18, 1, v19, v20);
    objc_msgSend_setAudioSessionInactiveTimeout_(v2, v21, v22, v23, v24, 2.0);
    uint64_t v25 = objc_opt_new();
    speechThreadQueueLock = v2->_speechThreadQueueLock;
    v2->_speechThreadQueueLock = (NSLock *)v25;

    v27 = objc_alloc_init(TTSSpeechThread);
    runThread = v2->_runThread;
    v2->_runThread = v27;

    objc_msgSend_start(v2->_runThread, v29, v30, v31, v32);
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(v2, v33, (uint64_t)sel__initialize, (uint64_t)v2->_runThread, 0, 0);
    v34 = v2;
  }

  return v2;
}

- (void)setSpeechSource:(id)a3
{
  objc_storeStrong((id *)&self->_speechSource, a3);
  id v8 = a3;
  objc_msgSend_setSpeechSource_(self->_synthesizer, v5, (uint64_t)v8, v6, v7);
}

- (void)setUsesAuxiliarySession:(BOOL)a3
{
  if (self->_usesAuxiliarySession != a3)
  {
    self->_usesAuxiliarySession = a3;
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, a2, (uint64_t)sel__updateAuxiliarySession, (uint64_t)self->_runThread, 0, 0);
  }
}

- (void)_updateAuxiliarySession
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, v2, v3, v4);
  uint64_t v6 = (TTSSpeechThread *)objc_claimAutoreleasedReturnValue();
  if (v6 != self->_runThread) {
    sub_1A688FFC4();
  }

  objc_msgSend_handleAudioSessionObservers_(self, v7, 0, v8, v9);
  if (self->_synthesizer)
  {
    uint64_t v14 = objc_msgSend_audioSession(self, v10, v11, v12, v13);
    objc_msgSend_audioSessionCategory(self, v15, v16, v17, v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = objc_msgSend_audioSessionCategoryOptions(self, v20, v21, v22, v23);
    if (self->_usesAuxiliarySession)
    {
      uint64_t v29 = v24;
      uint64_t v30 = AXLogSpeechSynthesis();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A66D3000, v30, OS_LOG_TYPE_INFO, "Requesting use of aux session", buf, 2u);
      }

      uint64_t v35 = objc_msgSend_audioSession(self, v31, v32, v33, v34);
      if (v35)
      {
        v40 = (void *)v35;
        v41 = objc_msgSend_audioSession(self, v36, v37, v38, v39);
        v46 = objc_msgSend_sharedInstance(MEMORY[0x1E4F153D8], v42, v43, v44, v45);
        char isEqual = objc_msgSend_isEqual_(v41, v47, (uint64_t)v46, v48, v49);

        if ((isEqual & 1) == 0)
        {
          if (!v19) {
            id v19 = (id)*MEMORY[0x1E4F14FD0];
          }
          v119 = AXLogSpeechSynthesis();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v171 = v19;
            _os_log_impl(&dword_1A66D3000, v119, OS_LOG_TYPE_INFO, "Aux session exists. Updating with category: %@", buf, 0xCu);
          }

          v124 = objc_msgSend_audioSession(self, v120, v121, v122, v123);
          id v169 = 0;
          char v127 = objc_msgSend_setCategory_error_(v124, v125, (uint64_t)v19, (uint64_t)&v169, v126);
          id v88 = v169;

          if (!v88 && (v127 & 1) != 0) {
            goto LABEL_49;
          }
          v128 = AXLogSpeechSynthesis();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
            sub_1A688FEF4();
          }
          goto LABEL_48;
        }
      }
      uint64_t v51 = objc_msgSend_audioSession(self, v36, v37, v38, v39);
      if (v51)
      {
        v56 = (void *)v51;
        v57 = objc_msgSend_audioSession(self, v52, v53, v54, v55);
        v62 = objc_msgSend_sharedInstance(MEMORY[0x1E4F153D8], v58, v59, v60, v61);
        int v66 = objc_msgSend_isEqual_(v57, v63, (uint64_t)v62, v64, v65);

        if (!v66) {
          goto LABEL_49;
        }
      }
      if (!v29) {
        uint64_t v29 = 3;
      }
      if (!v19) {
        id v19 = (id)*MEMORY[0x1E4F14FD0];
      }
      v67 = objc_msgSend_auxiliarySession(MEMORY[0x1E4F153D8], v52, v53, v54, v55);
      objc_msgSend_setAudioSession_(self, v68, (uint64_t)v67, v69, v70);

      v75 = objc_msgSend_audioSession(self, v71, v72, v73, v74);
      id v168 = 0;
      char v78 = objc_msgSend_setParticipatesInNowPlayingAppPolicy_error_(v75, v76, 0, (uint64_t)&v168, v77);
      id v79 = v168;

      if (v79 || (v78 & 1) == 0)
      {
        v80 = AXLogSpeechSynthesis();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          sub_1A688FF5C();
        }
      }
      v81 = AXLogSpeechSynthesis();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v171 = v19;
        _os_log_impl(&dword_1A66D3000, v81, OS_LOG_TYPE_INFO, "Aux session does not exist. Creating and updating with category: %@", buf, 0xCu);
      }

      v86 = objc_msgSend_audioSession(self, v82, v83, v84, v85);
      id v167 = v79;
      objc_msgSend_setCategory_withOptions_error_(v86, v87, (uint64_t)v19, v29, (uint64_t)&v167);
      id v88 = v167;

      if (v88) {
        char v93 = 0;
      }
      else {
        char v93 = v78;
      }
      if (v93)
      {
        id v88 = 0;
LABEL_44:
        synthesizer = self->_synthesizer;
        v130 = objc_msgSend_audioSession(self, v89, v90, v91, v92);
        uint64_t v135 = objc_msgSend_opaqueSessionID(v130, v131, v132, v133, v134);
        objc_msgSend_useSpecificAudioSession_(synthesizer, v136, v135, v137, v138);

        v143 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v139, v140, v141, v142);
        v128 = v143;
        uint64_t v148 = *MEMORY[0x1E4F14FF8];
        if (v14)
        {
          objc_msgSend_removeObserver_name_object_(v143, v144, (uint64_t)self, *MEMORY[0x1E4F14FF8], (uint64_t)v14);
          uint64_t v149 = *MEMORY[0x1E4F15038];
          objc_msgSend_removeObserver_name_object_(v128, v150, (uint64_t)self, *MEMORY[0x1E4F15038], (uint64_t)v14);
          uint64_t v151 = *MEMORY[0x1E4F15040];
          objc_msgSend_removeObserver_name_object_(v128, v152, (uint64_t)self, *MEMORY[0x1E4F15040], (uint64_t)v14);
        }
        else
        {
          uint64_t v149 = *MEMORY[0x1E4F15038];
          uint64_t v151 = *MEMORY[0x1E4F15040];
        }
        v153 = objc_msgSend_audioSession(self, v144, v145, v146, v147);
        objc_msgSend_addObserver_selector_name_object_(v128, v154, (uint64_t)self, (uint64_t)sel_handleAudioInterruption_, v148, v153);

        v159 = objc_msgSend_audioSession(self, v155, v156, v157, v158);
        objc_msgSend_addObserver_selector_name_object_(v128, v160, (uint64_t)self, (uint64_t)sel_handleMediaServicesWereLost_, v149, v159);

        v165 = objc_msgSend_audioSession(self, v161, v162, v163, v164);
        objc_msgSend_addObserver_selector_name_object_(v128, v166, (uint64_t)self, (uint64_t)sel_handleMediaServicesWereReset_, v151, v165);

LABEL_48:
LABEL_49:
        objc_msgSend_handleAudioSessionObservers_(self, v52, 1, v54, v55);

        goto LABEL_50;
      }
      v115 = AXLogSpeechSynthesis();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
        sub_1A688FEF4();
      }
    }
    else
    {
      uint64_t v94 = objc_msgSend_audioSession(self, v25, v26, v27, v28);
      if (v94)
      {
        v99 = (void *)v94;
        v100 = objc_msgSend_audioSession(self, v95, v96, v97, v98);
        v105 = objc_msgSend_sharedInstance(MEMORY[0x1E4F153D8], v101, v102, v103, v104);
        char v109 = objc_msgSend_isEqual_(v100, v106, (uint64_t)v105, v107, v108);

        if (v109) {
          goto LABEL_49;
        }
      }
      v110 = AXLogSpeechSynthesis();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A66D3000, v110, OS_LOG_TYPE_INFO, "Reverting back to shared audio session", buf, 2u);
      }

      v115 = objc_msgSend_sharedInstance(MEMORY[0x1E4F153D8], v111, v112, v113, v114);
      objc_msgSend_setAudioSession_(self, v116, (uint64_t)v115, v117, v118);
      id v88 = 0;
    }

    goto LABEL_44;
  }
  uint64_t v14 = AXLogSpeechSynthesis();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1A688FEB0(v14);
  }
LABEL_50:
}

- (void)handleAudioSessionObservers:(BOOL)a3
{
  BOOL v5 = a3;
  objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, a3, v3, v4);
  uint64_t v7 = (TTSSpeechThread *)objc_claimAutoreleasedReturnValue();
  if (v7 != self->_runThread) {
    sub_1A688FFF0();
  }

  if (v5)
  {
    if (!self->_audioSessionObserversEnabled)
    {
      objc_msgSend_addObserver_forKeyPath_options_context_(self, v8, (uint64_t)self, @"audioSessionCategory", 0, 0);
      objc_msgSend_addObserver_forKeyPath_options_context_(self, v9, (uint64_t)self, @"audioSessionCategoryOptions", 0, 0);
    }
  }
  else if (self->_audioSessionObserversEnabled)
  {
    objc_msgSend_removeObserver_forKeyPath_context_(self, v8, (uint64_t)self, @"audioSessionCategory", 0);
    objc_msgSend_removeObserver_forKeyPath_context_(self, v10, (uint64_t)self, @"audioSessionCategoryOptions", 0);
  }
  self->_audioSessionObserversEnabled = v5;
}

- (void)dealloc
{
  if (self->_audioSessionObserversEnabled)
  {
    uint64_t v6 = AXLogSpeechSynthesis();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1A689001C(v6);
    }
  }
  uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3, v4);
  objc_msgSend_removeObserver_(v7, v8, (uint64_t)self, v9, v10);

  v11.receiver = self;
  v11.super_class = (Class)TTSSpeechManager;
  [(TTSSpeechManager *)&v11 dealloc];
}

- (BOOL)_enqueueSelectorOnSpeechThread:(SEL)a3 object:(id)a4 waitUntilDone:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v13 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v9, v10, v11, v12);
  if (objc_msgSend_isEqual_(v13, v14, (uint64_t)self->_runThread, v15, v16)) {
    sub_1A6890060();
  }

  objc_msgSend_lock(self->_speechThreadQueueLock, v17, v18, v19, v20);
  BOOL speechThreadFinished = self->_speechThreadFinished;
  if (!self->_speechThreadFinished) {
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v21, (uint64_t)a3, (uint64_t)self->_runThread, (uint64_t)v8, v5);
  }
  objc_msgSend_unlock(self->_speechThreadQueueLock, v21, v22, v23, v24);

  return !speechThreadFinished;
}

- (void)tearDown
{
  objc_msgSend_lock(self->_speechThreadQueueLock, a2, v2, v3, v4);
  self->_BOOL speechThreadFinished = 1;
  CFRetain(self);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v6, (uint64_t)sel__tearDown, (uint64_t)self->_runThread, 0, 0);
  speechThreadQueueLock = self->_speechThreadQueueLock;

  objc_msgSend_unlock(speechThreadQueueLock, v7, v8, v9, v10);
}

- (void)_tearDown
{
  if (self->_usesAuxiliarySession)
  {
    uint64_t v6 = objc_msgSend_audioDeactivatorTimer(self, a2, v2, v3, v4);
    objc_msgSend_cancel(v6, v7, v8, v9, v10);

    uint64_t v15 = objc_msgSend_audioSession(self, v11, v12, v13, v14);
    objc_msgSend_setActive_withOptions_error_(v15, v16, 0, 0, 0);
  }
  objc_msgSend_setAudioSession_(self, a2, 0, v3, v4);
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19, v20);
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = *MEMORY[0x1E4F14FF8];
  uint64_t v26 = objc_msgSend_audioSession(self, v22, v23, v24, v25);
  objc_msgSend_removeObserver_name_object_(v49, v27, (uint64_t)self, v21, (uint64_t)v26);

  uint64_t v28 = *MEMORY[0x1E4F15038];
  uint64_t v33 = objc_msgSend_audioSession(self, v29, v30, v31, v32);
  objc_msgSend_removeObserver_name_object_(v49, v34, (uint64_t)self, v28, (uint64_t)v33);

  uint64_t v35 = *MEMORY[0x1E4F15040];
  v40 = objc_msgSend_audioSession(self, v36, v37, v38, v39);
  objc_msgSend_removeObserver_name_object_(v49, v41, (uint64_t)self, v35, (uint64_t)v40);

  objc_msgSend_handleAudioSessionObservers_(self, v42, 0, v43, v44);
  objc_msgSend_stop(self->_runThread, v45, v46, v47, v48);
  CFRelease(self);
}

- (void)handleMediaServicesWereLost:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_audioOperationQueue(self, v5, v6, v7, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A6726D64;
  v11[3] = &unk_1E5C69600;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)_handleMediaServicesWereLost:(id)a3
{
  if (objc_msgSend_shouldHandleAudioInterruptions(self, a2, (uint64_t)a3, v3, v4)) {
    objc_msgSend__didBeginInterruption(self, v6, v7, v8, v9);
  }
  if (self->_usesAuxiliarySession)
  {
    propertyQueue = self->_propertyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A6726E3C;
    block[3] = &unk_1E5C69588;
    block[4] = self;
    dispatch_sync(propertyQueue, block);
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v11, (uint64_t)sel__updateAuxiliarySession, (uint64_t)self->_runThread, 0, 0);
  }
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v6, (uint64_t)sel__updateAudioSessionProperties, (uint64_t)self->_runThread, 0, 0);
}

- (void)handleMediaServicesWereReset:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_audioOperationQueue(self, v5, v6, v7, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A6726EFC;
  v11[3] = &unk_1E5C69600;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)_handleMediaServicesWereReset:(id)a3
{
  if (objc_msgSend_shouldHandleAudioInterruptions(self, a2, (uint64_t)a3, v3, v4)) {
    objc_msgSend__didEndInterruption(self, v6, v7, v8, v9);
  }
  runThread = self->_runThread;

  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v6, (uint64_t)sel__updateAudioSessionProperties, (uint64_t)runThread, 0, 0);
}

- (void)_resetInterruptionTracking
{
  objc_msgSend_setAudioInterruptionStartedTime_(self, a2, v2, v3, v4, 0.0);
  objc_msgSend_setWasSpeakingBeforeAudioInterruption_(self, v6, 0, v7, v8);
  objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v9, 0, v10, v11);
  objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v12, 0, v13, v14);
  objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v15, 0, v16, v17);

  objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v18, 0, v19, v20);
}

- (void)_didEndInterruption
{
  objc_msgSend_setIsInAudioInterruption_(self, a2, 0, v2, v3);
  if (objc_msgSend_didRequestStartSpeakingDuringAudioInterruption(self, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_requestedActionDuringAudioInterruption(self, v9, v10, v11, v12);
    objc_msgSend_dispatchSpeechAction_(self, v14, (uint64_t)v13, v15, v16);
  }
  else if (objc_msgSend_wasSpeakingBeforeAudioInterruption(self, v9, v10, v11, v12) {
         && !objc_msgSend_didRequestPauseSpeakingDuringAudioInterruption(self, v20, v17, v18, v19)
  }
         || objc_msgSend_didRequestResumeSpeakingDuringAudioInterruption(self, v20, v17, v18, v19))
  {
    objc_msgSend_continueSpeaking(self, v20, v17, v18, v19);
  }

  MEMORY[0x1F4181798](self, sel__resetInterruptionTracking, v17, v18, v19);
}

- (void)_didBeginInterruption
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isSpeaking(self, a2, v2, v3, v4)
    && (objc_msgSend_isPaused(self, v6, v7, v8, v9) & 1) == 0)
  {
    objc_msgSend_setWasSpeakingBeforeAudioInterruption_(self, v10, 1, v11, v12);
    objc_msgSend_pauseSpeaking_(self, v13, 0, v14, v15);
    uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v16, @"Speech interrupted, pausing", v17, v18);
    uint64_t v23 = objc_msgSend_stringWithFormat_(NSString, v20, @"%s:%d %@", v21, v22, "-[TTSSpeechManager _didBeginInterruption]", 642, v19);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB7E278);
    }
    uint64_t v24 = (void *)qword_1EB67A578;
    if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = v23;
      uint64_t v26 = v24;
      *(_DWORD *)buf = 136446210;
      uint64_t v40 = objc_msgSend_UTF8String(v25, v27, v28, v29, v30);
      _os_log_impl(&dword_1A66D3000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_setAudioInterruptionStartedTime_(self, v32, v33, v34, v35, Current);
  objc_msgSend_setIsInAudioInterruption_(self, v36, 1, v37, v38);
}

- (void)handleAudioInterruption:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_audioOperationQueue(self, v5, v6, v7, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A67272EC;
  v11[3] = &unk_1E5C69600;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)_handleAudioInterruption:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_shouldHandleAudioInterruptions(self, v5, v6, v7, v8))
  {
    uint64_t v13 = NSString;
    uint64_t v14 = objc_msgSend_userInfo(v4, v9, v10, v11, v12);
    uint64_t v18 = objc_msgSend_stringWithFormat_(v13, v15, @"AVSpeechSynthesizer Audio interruption notification: %@", v16, v17, v14);

    uint64_t v22 = objc_msgSend_stringWithFormat_(NSString, v19, @"%s:%d %@", v20, v21, "-[TTSSpeechManager _handleAudioInterruption:]", 660, v18);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB7E298);
    }
    uint64_t v23 = (void *)qword_1EB67A578;
    if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = v22;
      id v25 = v23;
      *(_DWORD *)buf = 136446210;
      uint64_t v49 = objc_msgSend_UTF8String(v24, v26, v27, v28, v29);
      _os_log_impl(&dword_1A66D3000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v34 = objc_msgSend_userInfo(v4, v30, v31, v32, v33);
    uint64_t v38 = objc_msgSend_objectForKey_(v34, v35, *MEMORY[0x1E4F15018], v36, v37);
    uint64_t v43 = objc_msgSend_integerValue(v38, v39, v40, v41, v42);

    if (v43)
    {
      if (v43 == 1) {
        objc_msgSend__didBeginInterruption(self, v44, v45, v46, v47);
      }
    }
    else
    {
      objc_msgSend__didEndInterruption(self, v44, v45, v46, v47);
    }
  }
}

- (void)_updateAudioSessionProperties
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, v2, v3, v4);
  if ((objc_msgSend_isEqual_(v6, v7, (uint64_t)self->_runThread, v8, v9) & 1) == 0) {
    sub_1A689008C();
  }

  uint64_t v14 = objc_msgSend_audioSessionCategory(self, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_audioSessionCategoryOptions(self, v15, v16, v17, v18);
  if (v14)
  {
    uint64_t v24 = v19;
    id v25 = objc_msgSend_audioSession(self, v20, v21, v22, v23);
    id v44 = 0;
    objc_msgSend_setCategory_withOptions_error_(v25, v26, (uint64_t)v14, v24, (uint64_t)&v44);
    id v27 = v44;

    if (v27)
    {
      uint64_t v31 = objc_msgSend_stringWithFormat_(NSString, v28, @"Error setting category: %@", v29, v30, v27);
      uint64_t v35 = objc_msgSend_stringWithFormat_(NSString, v32, @"%s:%d %@", v33, v34, "-[TTSSpeechManager _updateAudioSessionProperties]", 687, v31);
      if (qword_1EB67A570 != -1) {
        dispatch_once(&qword_1EB67A570, &unk_1EFB80C68);
      }
      uint64_t v36 = (void *)qword_1EB67A578;
      if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v35;
        uint64_t v38 = v36;
        uint64_t v43 = objc_msgSend_UTF8String(v37, v39, v40, v41, v42);
        *(_DWORD *)buf = 136446210;
        uint64_t v46 = v43;
        _os_log_impl(&dword_1A66D3000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((objc_msgSend_isEqualToString_(v10, v13, @"audioSessionCategory", v14, v15) & 1) != 0
    || objc_msgSend_isEqualToString_(v10, v16, @"audioSessionCategoryOptions", v17, v18))
  {
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v16, (uint64_t)sel__updateAudioSessionProperties, 0, 0);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)TTSSpeechManager;
    [(TTSSpeechManager *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_initialize
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  objc_msgSend_handleAudioSessionObservers_(self, a2, 1, v2, v3);
  objc_msgSend__updateAudioSessionProperties(self, v5, v6, v7, v8);
  objc_initWeak(&location, self);
  id v9 = objc_allocWithZone((Class)TTSSpeechSynthesizer);
  uint64_t v14 = (TTSSpeechSynthesizer *)objc_msgSend_init(v9, v10, v11, v12, v13);
  synthesizer = self->_synthesizer;
  self->_synthesizer = v14;

  uint64_t v20 = objc_msgSend_speechSource(self, v16, v17, v18, v19);
  objc_msgSend_setSpeechSource_(self->_synthesizer, v21, (uint64_t)v20, v22, v23);

  objc_msgSend_setDelegate_(self->_synthesizer, v24, (uint64_t)self, v25, v26);
  uint64_t v31 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v27, v28, v29, v30);
  uint64_t v36 = objc_msgSend_bundleIdentifier(v31, v32, v33, v34, v35);
  objc_msgSend_setBundleIdentifier_(self->_synthesizer, v37, (uint64_t)v36, v38, v39);

  id v45 = sub_1A6727AC4(v40, v41, v42, v43, v44);
  uint64_t v50 = objc_msgSend_sharedInstance(v45, v46, v47, v48, v49);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = sub_1A6727BA8;
  v75[3] = &unk_1E5C6A938;
  objc_copyWeak(&v76, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v50, v51, (uint64_t)v75, (uint64_t)sel_customPronunciationSubstitutions, (uint64_t)self);

  objc_msgSend__updateUserSubstitutions(self, v52, v53, v54, v55);
  uint64_t v59 = objc_msgSend_stringWithFormat_(NSString, v56, @"Synthesizer created: %@", v57, v58, self->_synthesizer);
  v63 = objc_msgSend_stringWithFormat_(NSString, v60, @"%s:%d %@", v61, v62, "-[TTSSpeechManager _initialize]", 729, v59);
  if (qword_1EB67A570 != -1) {
    dispatch_once(&qword_1EB67A570, &unk_1EFB7E2F8);
  }
  uint64_t v64 = (id)qword_1EB67A578;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    id v65 = v63;
    uint64_t v70 = objc_msgSend_UTF8String(v65, v66, v67, v68, v69);
    *(_DWORD *)buf = 136446210;
    uint64_t v79 = v70;
    _os_log_impl(&dword_1A66D3000, v64, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }

  objc_msgSend__updateAuxiliarySession(self, v71, v72, v73, v74);
  objc_destroyWeak(&v76);
  objc_destroyWeak(&location);
}

- (unint64_t)setActiveOptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A6727CD8;
  v5[3] = &unk_1E5C6A330;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSetActiveOptions:(unint64_t)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A6727D60;
  v4[3] = &unk_1E5C6A960;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(propertyQueue, v4);
}

- (void)setAudioSessionCategory:(id)a3
{
  id v4 = a3;
  propertyQueue = self->_propertyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A6727E04;
  v7[3] = &unk_1E5C69600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(propertyQueue, v7);
}

- (NSString)audioSessionCategory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1A6727F00;
  id v10 = sub_1A6727F10;
  id v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A6727F18;
  v5[3] = &unk_1E5C6A330;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setAudioSessionCategoryOptions:(unint64_t)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A6727FA0;
  v4[3] = &unk_1E5C6A960;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(propertyQueue, v4);
}

- (unint64_t)audioSessionCategoryOptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A6728058;
  v5[3] = &unk_1E5C6A330;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInAudioInterruption
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A6728118;
  v5[3] = &unk_1E5C6A330;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsInAudioInterruption:(BOOL)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A67281A4;
  v4[3] = &unk_1E5C6A988;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(propertyQueue, v4);
}

- (AVAudioSession)audioSession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1A6727F00;
  id v10 = sub_1A6727F10;
  id v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A67282A4;
  v5[3] = &unk_1E5C6A330;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAudioSession *)v3;
}

- (void)setAudioSession:(id)a3
{
  id v4 = a3;
  propertyQueue = self->_propertyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A6728350;
  v7[3] = &unk_1E5C69600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(propertyQueue, v7);
}

- (BOOL)isPaused
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A6728408;
  v5[3] = &unk_1E5C6A330;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsPaused:(BOOL)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A6728494;
  v4[3] = &unk_1E5C6A988;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(propertyQueue, v4);
}

- (void)_updateUserSubstitutions
{
  id v6 = sub_1A6727AC4((uint64_t)self, a2, v2, v3, v4);
  objc_msgSend_sharedInstance(v6, v7, v8, v9, v10);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_customPronunciationSubstitutions(v19, v11, v12, v13, v14);
  objc_msgSend_setUserSubstitutions_(self->_synthesizer, v16, (uint64_t)v15, v17, v18);
}

+ (id)spellOutMarkupString:(id)a3 string:(id)a4
{
  return (id)objc_msgSend_speechMarkupStringForType_forIdentifier_string_(TTSSpeechSynthesizer, a2, 1, (uint64_t)a3, (uint64_t)a4);
}

+ (id)spellOutLetterCaseMarkupString:(id)a3 string:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v6, v7, v8, v9, v10) == 1)
  {
    uint64_t v15 = objc_msgSend_uppercaseLetterCharacterSet(MEMORY[0x1E4F28B88], v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_characterAtIndex_(v6, v16, 0, v17, v18);
    if (objc_msgSend_characterIsMember_(v15, v20, v19, v21, v22)) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 2;
    }
  }
  else
  {
    uint64_t v23 = 2;
  }
  uint64_t v24 = objc_msgSend_speechMarkupStringForType_forIdentifier_string_(TTSSpeechSynthesizer, v11, v23, (uint64_t)v5, (uint64_t)v6);

  return v24;
}

+ (id)languageCodeForVoiceIdentifier:(id)a3
{
  id v5 = objc_msgSend_voiceForIdentifier_(TTSSpeechSynthesizer, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = objc_msgSend_language(v5, v6, v7, v8, v9);

  return v10;
}

+ (BOOL)_isCharacterNativelySpeakable:(unsigned __int16)a3 languageCode:(id)a4
{
  uint64_t v4 = a3;
  id v9 = a4;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2050000000;
  uint64_t v10 = (void *)qword_1E96C48B8;
  uint64_t v41 = qword_1E96C48B8;
  if (!qword_1E96C48B8)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1A672E548;
    v37[3] = &unk_1E5C696C8;
    v37[4] = &v38;
    sub_1A672E548((uint64_t)v37, v5, v6, v7, v8);
    uint64_t v10 = (void *)v39[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v38, 8);
  uint64_t v16 = objc_msgSend_sharedInstance(v11, v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_dialectForLanguageID_(v16, v17, (uint64_t)v9, v18, v19);

  uint64_t v25 = objc_msgSend_locale(v20, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_exemplarCharacterSet(v25, v26, v27, v28, v29);

  if (v30) {
    char IsMember = objc_msgSend_characterIsMember_(v30, v31, v4, v32, v33);
  }
  else {
    char IsMember = 1;
  }
  if (v4 == 12540) {
    BOOL v35 = 0;
  }
  else {
    BOOL v35 = IsMember;
  }

  return v35;
}

+ (id)literalStringMarkup:(id)a3 string:(id)a4 speakCap:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!objc_msgSend_length(v8, v9, v10, v11, v12))
  {
    id v86 = v8;
    goto LABEL_23;
  }
  uint64_t v20 = objc_msgSend_languageCodeForVoiceIdentifier_(TTSSpeechManager, v13, (uint64_t)v7, v14, v15);
  if (!v20)
  {
    uint64_t v20 = objc_msgSend_currentLanguageCode(TTSSpeechManager, v16, v17, v18, v19);
  }
  uint64_t v21 = objc_msgSend_spellOutLetterCaseMarkupString_string_(TTSSpeechManager, v16, (uint64_t)v7, (uint64_t)v8, v19);
  uint64_t v26 = objc_msgSend_length(v8, v22, v23, v24, v25);
  if (v26 == 1)
  {
    uint64_t v31 = objc_msgSend_characterAtIndex_(v8, v27, 0, v29, v30);
    uint64_t v36 = objc_msgSend_uppercaseLetterCharacterSet(MEMORY[0x1E4F28B88], v32, v33, v34, v35);
    objc_msgSend_characterIsMember_(v36, v37, v31, v38, v39);

    char isCharacterNativelySpeakable_languageCode = objc_msgSend__isCharacterNativelySpeakable_languageCode_(a1, v40, v31, (uint64_t)v20, v41);
    id v43 = v20;
    uint64_t v48 = v43;
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x2020000000;
    uint64_t v49 = (void (*)(uint64_t, void *))off_1E96C48C0;
    uint64_t v97 = off_1E96C48C0;
    if (!off_1E96C48C0)
    {
      uint64_t v50 = (void *)sub_1A672E3DC((uint64_t)v43, v44, v45, v46, v47);
      v95[3] = (uint64_t)dlsym(v50, "AXVOLocalizedStringForCharacter");
      off_1E96C48C0 = (_UNKNOWN *)v95[3];
      uint64_t v49 = (void (*)(uint64_t, void *))v95[3];
    }
    _Block_object_dispose(&v94, 8);
    if (!v49) {
      sub_1A68900B8(v51, v52, v53, v54, v55);
    }
    v56 = v49(v31, v48);

    if (v56) {
      char v60 = isCharacterNativelySpeakable_languageCode;
    }
    else {
      char v60 = 1;
    }
    if (v60 & 1) != 0 || (objc_msgSend_isEqualToString_(v56, v57, (uint64_t)v8, v58, v59)) {
      goto LABEL_21;
    }
    uint64_t v64 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v61, @"]\\-^", v62, v63);
    uint64_t v68 = objc_msgSend_characterAtIndex_(v8, v65, 0, v66, v67);
    objc_msgSend_characterIsMember_(v64, v69, v68, v70, v71);
    uint64_t v72 = AXCFormattedString();
    uint64_t v75 = objc_msgSend_rangeOfString_options_(v56, v73, (uint64_t)v72, 1024, v74, v8);
    uint64_t v93 = v76;

    if (v75 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v92 = objc_msgSend_stringByApplyingTransform_reverse_(v8, v77, *MEMORY[0x1E4F1C4D8], 0, v78);
      uint64_t v79 = AXCFormattedString();
      uint64_t v75 = objc_msgSend_rangeOfString_options_(v56, v80, (uint64_t)v79, 1024, v81, v92);
      uint64_t v93 = v82;

      if (v75 == 0x7FFFFFFFFFFFFFFFLL)
      {

        id v85 = v56;
LABEL_20:
        id v88 = v85;

        uint64_t v21 = v88;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v87 = objc_msgSend_spellOutLetterCaseMarkupString_string_(TTSSpeechManager, v83, (uint64_t)v7, (uint64_t)v92, v84);

      uint64_t v21 = (void *)v87;
    }
    objc_msgSend_stringByReplacingCharactersInRange_withString_(v56, v77, v75, v93, (uint64_t)v21);
    id v85 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_22:
  v89 = VOTBundle(v26, v27, v28, v29, v30);
  uint64_t v90 = AXNSLocalizedStringForLocale();

  AXCFormattedString();
  id v86 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:

  return v86;
}

+ (id)pauseMarkupString:(id)a3
{
  return (id)objc_msgSend_speechMarkupStringForType_forIdentifier_string_(TTSSpeechSynthesizer, a2, 0, (uint64_t)a3, 0);
}

+ (id)availableLanguageCodes
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(TTSSpeechSynthesizer, sel_availableLanguageCodes);
}

+ (id)availableVoices
{
  uint64_t v6 = objc_msgSend_currentProcessAllowedToSaveVoiceInfo(a1, a2, v2, v3, v4);

  return (id)MEMORY[0x1F4181798](a1, sel_availableVoices_, v6, v7, v8);
}

+ (id)availableSuperCompactVoices
{
  id v5 = objc_msgSend_sharedInstance(TTSAXResourceManager, a2, v2, v3, v4);
  uint64_t v8 = objc_msgSend_resourcesWithType_subType_(v5, v6, 4, 2, v7);

  uint64_t v12 = objc_msgSend_ax_filteredArrayUsingBlock_(v8, v9, (uint64_t)&unk_1EFB7E378, v10, v11);

  uint64_t v16 = objc_msgSend_ax_flatMappedArrayUsingBlock_(v12, v13, (uint64_t)&unk_1EFB7E398, v14, v15);

  return v16;
}

+ (id)availableVoices:(BOOL)a3
{
  if (byte_1E96C48A8) {
    BOOL v5 = qword_1E96C48A0 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (qword_1EB67AA68 != -1) {
      dispatch_once(&qword_1EB67AA68, &unk_1EFB80C88);
    }
    uint64_t v6 = objc_msgSend_sharedInstance(TTSAXResourceManager, a2, a3, v3, v4);
    uint64_t v10 = objc_msgSend_allVoices_(v6, v7, 1, v8, v9);

    objc_msgSend_ax_flatMappedArrayUsingBlock_(v10, v11, (uint64_t)&unk_1EFB80CC8, v12, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = (id)qword_1E96C48A0;
  }

  return v14;
}

+ (id)avSpeechVoicesForTTSAXResources:(id)a3
{
  return (id)objc_msgSend_ax_flatMappedArrayUsingBlock_(a3, a2, (uint64_t)&unk_1EFB80CE8, v3, v4);
}

+ (id)_resetAvailableVoices
{
  uint64_t v6 = objc_msgSend_currentProcessAllowedToSaveVoiceInfo(a1, a2, v2, v3, v4);

  return (id)MEMORY[0x1F4181798](a1, sel__resetAvailableVoices_, v6, v7, v8);
}

+ (BOOL)currentProcessAllowedToSaveVoiceInfo
{
  BOOL v5 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_processName(v5, v6, v7, v8, v9);
  if (objc_msgSend_isEqualToString_(v10, v11, @"com.apple.accessibility.AccessibilityUIServer", v12, v13))
  {
    char isEqualToString = 1;
  }
  else
  {
    uint64_t v19 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v14, v15, v16, v17);
    uint64_t v24 = objc_msgSend_processName(v19, v20, v21, v22, v23);
    if (objc_msgSend_isEqualToString_(v24, v25, @"com.apple.AccessibilityUIServer", v26, v27))
    {
      char isEqualToString = 1;
    }
    else
    {
      uint64_t v32 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v28, v29, v30, v31);
      id v37 = objc_msgSend_bundleIdentifier(v32, v33, v34, v35, v36);
      char isEqualToString = objc_msgSend_isEqualToString_(v37, v38, @"com.apple.springboard", v39, v40);
    }
  }

  return isEqualToString;
}

+ (id)_resetAvailableVoices:(BOOL)a3
{
  return 0;
}

+ (URegularExpression)createRegularExpressionFromString:(id)a3
{
  UErrorCode status = U_ZERO_ERROR;
  id v3 = a3;
  int32_t v8 = objc_msgSend_length(v3, v4, v5, v6, v7, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  uint64_t v9 = (UChar *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
  objc_msgSend_getCharacters_range_(v3, v10, (uint64_t)v9, 0, v8);

  uint64_t v11 = uregex_open(v9, v8, 0, &v13, &status);
  free(v9);
  uregex_useAnchoringBounds(v11, 1, &status);
  return v11;
}

+ (id)matchedRangesForString:(id)a3 withRegularExpression:(URegularExpression *)a4
{
  id v5 = a3;
  UErrorCode status = U_ZERO_ERROR;
  int32_t v10 = objc_msgSend_length(v5, v6, v7, v8, v9);
  uint64_t v11 = (UChar *)malloc_type_malloc(2 * v10, 0x1000040BDFB0063uLL);
  objc_msgSend_getCharacters_(v5, v12, (uint64_t)v11, v13, v14);
  uregex_setText(a4, v11, v10, &status);
  uint64_t v19 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16, v17, v18);
  if (uregex_find(a4, -1, &status) && status == U_ZERO_ERROR)
  {
    do
    {
      int32_t v20 = uregex_start(a4, 0, &status);
      int32_t v21 = uregex_end(a4, 0, &status);
      uint64_t v24 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v22, v20, v21 - v20, v23);
      objc_msgSend_addObject_(v19, v25, (uint64_t)v24, v26, v27);
    }
    while (uregex_find(a4, v21, &status) && status == U_ZERO_ERROR);
  }
  free(v11);

  return v19;
}

+ (id)audioFileSettingsForVoice:(id)a3
{
  return (id)objc_msgSend_audioFileSettingsForVoice_(TTSSpeechSynthesizer, a2, (uint64_t)a3, v3, v4);
}

- (void)_speechJobFinished:(BOOL)a3 action:(id)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_msgSend_setIsPaused_(self, v7, 0, v8, v9);
  objc_msgSend_setState_(v6, v10, 2, v11, v12);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A6729E10;
  block[3] = &unk_1E5C6A988;
  id v13 = v6;
  id v117 = v13;
  BOOL v118 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v14 = NSString;
  uint64_t v19 = objc_msgSend_firstObject(self->_speechQueue, v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_stringWithFormat_(v14, v20, @"Removing from queue: %@", v21, v22, v19);

  uint64_t v27 = objc_msgSend_stringWithFormat_(NSString, v24, @"%s:%d %@", v25, v26, "-[TTSSpeechManager _speechJobFinished:action:]", 1120, v23);
  if (qword_1EB67A570 != -1) {
    dispatch_once(&qword_1EB67A570, &unk_1EFB80D08);
  }
  uint64_t v28 = (void *)qword_1EB67A578;
  if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
  {
    id v29 = v27;
    uint64_t v30 = v28;
    uint64_t v35 = objc_msgSend_UTF8String(v29, v31, v32, v33, v34);
    *(_DWORD *)buf = 136446210;
    uint64_t v120 = v35;
    _os_log_impl(&dword_1A66D3000, v30, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }
  objc_msgSend_removeObjectIdenticalTo_(self->_speechQueue, v36, (uint64_t)v13, v37, v38);
  uint64_t v42 = objc_msgSend_stringWithFormat_(NSString, v39, @"Remaining queue: %@", v40, v41, self->_speechQueue);
  uint64_t v46 = objc_msgSend_stringWithFormat_(NSString, v43, @"%s:%d %@", v44, v45, "-[TTSSpeechManager _speechJobFinished:action:]", 1123, v42);
  if (qword_1EB67A570 != -1) {
    dispatch_once(&qword_1EB67A570, &unk_1EFB80D28);
  }
  uint64_t v47 = (void *)qword_1EB67A578;
  if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
  {
    id v48 = v46;
    uint64_t v49 = v47;
    uint64_t v54 = objc_msgSend_UTF8String(v48, v50, v51, v52, v53);
    *(_DWORD *)buf = 136446210;
    uint64_t v120 = v54;
    _os_log_impl(&dword_1A66D3000, v49, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }
  uint64_t v59 = objc_msgSend_audioOperationQueue(self, v55, v56, v57, v58);
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = sub_1A6729F20;
  v115[3] = &unk_1E5C69588;
  v115[4] = self;
  dispatch_sync(v59, v115);

  self->_isSpeaking = 0;
  objc_msgSend_setIsPaused_(self, v60, 0, v61, v62);
  if (objc_msgSend_count(self->_speechQueue, v63, v64, v65, v66))
  {
    uint64_t v71 = objc_msgSend_stringWithFormat_(NSString, v67, @"Start next job", v69, v70);
    uint64_t v75 = objc_msgSend_stringWithFormat_(NSString, v72, @"%s:%d %@", v73, v74, "-[TTSSpeechManager _speechJobFinished:action:]", 1133, v71);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB80D48);
    }
    uint64_t v76 = (void *)qword_1EB67A578;
    if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
    {
      id v77 = v75;
      uint64_t v78 = v76;
      uint64_t v83 = objc_msgSend_UTF8String(v77, v79, v80, v81, v82);
      *(_DWORD *)buf = 136446210;
      uint64_t v120 = v83;
      _os_log_impl(&dword_1A66D3000, v78, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
    }
    objc_msgSend__startNextSpeechJob(self, v84, v85, v86, v87);
  }
  else if (self->_usesAuxiliarySession)
  {
    objc_msgSend_audioSessionInactiveTimeout(self, v67, v68, v69, v70);
    double v89 = v88;
    uint64_t v93 = objc_msgSend_stringWithFormat_(NSString, v90, @"Scheduling audio session deactivation in: %f", v91, v92, *(void *)&v88);
    uint64_t v97 = objc_msgSend_stringWithFormat_(NSString, v94, @"%s:%d %@", v95, v96, "-[TTSSpeechManager _speechJobFinished:action:]", 1141, v93);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB80D68);
    }
    uint64_t v98 = (void *)qword_1EB67A578;
    if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
    {
      id v99 = v97;
      v100 = v98;
      uint64_t v105 = objc_msgSend_UTF8String(v99, v101, v102, v103, v104);
      *(_DWORD *)buf = 136446210;
      uint64_t v120 = v105;
      _os_log_impl(&dword_1A66D3000, v100, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v110 = objc_msgSend_audioDeactivatorTimer(self, v106, v107, v108, v109);
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = sub_1A6729FB0;
    v114[3] = &unk_1E5C69588;
    v114[4] = self;
    objc_msgSend_afterDelay_processBlock_(v110, v111, (uint64_t)v114, v112, v113, v89);
  }
}

- (id)externalVoiceIdentifierUsedForLanguage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v6 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(v4, v5, 0, (uint64_t)v3, 1);

  uint64_t v11 = objc_msgSend_identifier(v6, v7, v8, v9, v10);

  return v11;
}

- (id)voiceIdentifierUsedForLanguage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v6 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(v4, v5, 0, (uint64_t)v3, 1);

  uint64_t v11 = objc_msgSend_identifier(v6, v7, v8, v9, v10);

  return v11;
}

- (id)_phonemeSubstitutionsForAction:(id)a3
{
  id v5 = objc_msgSend_attributedString(a3, a2, (uint64_t)a3, v3, v4);
  if (objc_msgSend_length(v5, v6, v7, v8, v9))
  {
    uint64_t v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13);
    uint64_t v15 = *MEMORY[0x1E4F15280];
    uint64_t v20 = objc_msgSend_length(v5, v16, v17, v18, v19);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1A672A390;
    v24[3] = &unk_1E5C6A9D0;
    id v25 = v5;
    id v21 = v14;
    id v26 = v21;
    objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v25, v22, v15, 0, v20, 0, v24);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)_startNextSpeechJob
{
  uint64_t v382 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_count(self->_speechQueue, a2, v2, v3, v4))
  {
    uint64_t v9 = objc_msgSend_objectAtIndex_(self->_speechQueue, v6, 0, v7, v8);
    if (objc_msgSend_state(v9, v10, v11, v12, v13))
    {
      uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v14, @"Existing speech job already in flight", v16, v17);
      uint64_t v22 = objc_msgSend_stringWithFormat_(NSString, v19, @"%s:%d %@", v20, v21, "-[TTSSpeechManager _startNextSpeechJob]", 1197, v18);
      if (qword_1EB67A570 != -1) {
        dispatch_once(&qword_1EB67A570, &unk_1EFB7E3F8);
      }
      uint64_t v23 = (void *)qword_1EB67A578;
      if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
      {
        id v24 = v22;
        id v25 = v23;
        *(_DWORD *)buf = 136446210;
        uint64_t v381 = objc_msgSend_UTF8String(v24, v26, v27, v28, v29);
        _os_log_impl(&dword_1A66D3000, v25, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
      }
    }
    else if (objc_msgSend_isInAudioInterruption(self, v14, v15, v16, v17) {
           && (double v34 = CFAbsoluteTimeGetCurrent(),
    }
               objc_msgSend_audioInterruptionStartedTime(self, v35, v36, v37, v38),
               v34 - v39 < 1.5))
    {
      uint64_t v40 = objc_msgSend_stringWithFormat_(NSString, v30, @"Is in audio interruption, not starting speech", v32, v33);
      uint64_t v44 = objc_msgSend_stringWithFormat_(NSString, v41, @"%s:%d %@", v42, v43, "-[TTSSpeechManager _startNextSpeechJob]", 1205, v40);
      if (qword_1EB67A570 != -1) {
        dispatch_once(&qword_1EB67A570, &unk_1EFB80DA8);
      }
      uint64_t v45 = (void *)qword_1EB67A578;
      if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = v44;
        uint64_t v47 = v45;
        *(_DWORD *)buf = 136446210;
        uint64_t v381 = objc_msgSend_UTF8String(v46, v48, v49, v50, v51);
        _os_log_impl(&dword_1A66D3000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v52, 1, v53, v54);
      objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v55, 0, v56, v57);
      objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v58, 0, v59, v60);
      objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v61, (uint64_t)v9, v62, v63);
    }
    else
    {
      objc_msgSend_preprocessAction(v9, v30, v31, v32, v33);
      uint64_t v64 = NSString;
      uint64_t v69 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v65, v66, v67, v68);
      uint64_t v74 = objc_msgSend_name(v69, v70, v71, v72, v73);
      uint64_t v79 = objc_msgSend_string(v9, v75, v76, v77, v78);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v84 = objc_msgSend_stringWithFormat_(v64, v81, @"%@ Will speak: %@ %f", v82, v83, v74, v79, *(void *)&Current);

      double v88 = objc_msgSend_stringWithFormat_(NSString, v85, @"%s:%d %@", v86, v87, "-[TTSSpeechManager _startNextSpeechJob]", 1215, v84);
      if (qword_1EB67A570 != -1) {
        dispatch_once(&qword_1EB67A570, &unk_1EFB80DC8);
      }
      double v89 = (void *)qword_1EB67A578;
      if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
      {
        id v90 = v88;
        uint64_t v91 = v89;
        *(_DWORD *)buf = 136446210;
        uint64_t v381 = objc_msgSend_UTF8String(v90, v92, v93, v94, v95);
        _os_log_impl(&dword_1A66D3000, v91, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
      }
      if (objc_msgSend_isSpeaking(self->_synthesizer, v96, v97, v98, v99))
      {
        uint64_t v104 = objc_msgSend_stringWithFormat_(NSString, v100, @"Stopping existing job", v102, v103);
        uint64_t v108 = objc_msgSend_stringWithFormat_(NSString, v105, @"%s:%d %@", v106, v107, "-[TTSSpeechManager _startNextSpeechJob]", 1219, v104);
        if (qword_1EB67A570 != -1) {
          dispatch_once(&qword_1EB67A570, &unk_1EFB80DE8);
        }
        uint64_t v109 = (void *)qword_1EB67A578;
        if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
        {
          id v110 = v108;
          v111 = v109;
          uint64_t v116 = objc_msgSend_UTF8String(v110, v112, v113, v114, v115);
          *(_DWORD *)buf = 136446210;
          uint64_t v381 = v116;
          _os_log_impl(&dword_1A66D3000, v111, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(self->_synthesizer, v117, 0, 1, 0);
      }
      objc_msgSend_speakingRate(v9, v100, v101, v102, v103);
      *(float *)&double v118 = v118;
      objc_msgSend_setRate_(self->_synthesizer, v119, v120, v121, v122, v118);
      objc_msgSend_volume(v9, v123, v124, v125, v126);
      *(float *)&double v127 = v127;
      objc_msgSend_setVolume_(self->_synthesizer, v128, v129, v130, v131, v127);
      v136 = objc_msgSend_voiceSelection(v9, v132, v133, v134, v135);
      uint64_t v141 = objc_msgSend_voiceSettings(v136, v137, v138, v139, v140);
      objc_msgSend_setPerVoiceSettings_(self->_synthesizer, v142, (uint64_t)v141, v143, v144);

      uint64_t v149 = objc_msgSend_voiceSelection(v9, v145, v146, v147, v148);
      v154 = objc_msgSend_effects(v149, v150, v151, v152, v153);
      objc_msgSend_setAudioEffects_(self->_synthesizer, v155, (uint64_t)v154, v156, v157);

      synthesizer = self->_synthesizer;
      objc_msgSend_pitch(v9, v159, v160, v161, v162);
      *(float *)&double v163 = v163;
      objc_msgSend_setPitch_(synthesizer, v164, v165, v166, v167, v163);
      uint64_t v172 = objc_msgSend_audioQueueFlags(self, v168, v169, v170, v171);
      objc_msgSend_setAudioQueueFlags_(self->_synthesizer, v173, v172, v174, v175);
      v180 = objc_msgSend_voiceIdentifier(v9, v176, v177, v178, v179);
      objc_msgSend_setVoiceIdentifier_(self->_synthesizer, v181, (uint64_t)v180, v182, v183);

      if (objc_msgSend_ignoreCustomSubstitutions(v9, v184, v185, v186, v187)) {
        objc_msgSend_setUserSubstitutions_(self->_synthesizer, v188, 0, v190, v191);
      }
      uint64_t v192 = objc_msgSend_synthesizeSilently(v9, v188, v189, v190, v191);
      objc_msgSend_setSynthesizeSilently_(self->_synthesizer, v193, v192, v194, v195);
      v199 = objc_msgSend__phonemeSubstitutionsForAction_(self, v196, (uint64_t)v9, v197, v198);
      objc_msgSend_setPhonemeSubstitutions_(self->_synthesizer, v200, (uint64_t)v199, v201, v202);

      objc_msgSend_setSpeakingRequestClientContext_(self->_synthesizer, v203, (uint64_t)v9, v204, v205);
      v210 = objc_msgSend_audioBufferCallback(v9, v206, v207, v208, v209);
      BOOL v211 = v210 != 0;

      v216 = objc_msgSend_voiceIdentifier(self->_synthesizer, v212, v213, v214, v215);
      int IsAllowedToUseBufferCallbackAPIInCurrentProcess = TTSVoiceWithIdentifierIsAllowedToUseBufferCallbackAPIInCurrentProcess((uint64_t)v216, v217, v218, v219, v220);

      if ((IsAllowedToUseBufferCallbackAPIInCurrentProcess & v211) == 1)
      {
        objc_initWeak((id *)buf, self);
        v377[0] = MEMORY[0x1E4F143A8];
        v377[1] = 3221225472;
        v377[2] = sub_1A672B198;
        v377[3] = &unk_1E5C6A9F8;
        objc_copyWeak(&v379, (id *)buf);
        id v378 = v9;
        objc_msgSend_setAudioBufferCallback_(self->_synthesizer, v225, (uint64_t)v377, v226, v227);

        objc_destroyWeak(&v379);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        objc_msgSend_setAudioBufferCallback_(self->_synthesizer, v222, 0, v223, v224);
      }
      self->_isSpeaking = 1;
      objc_msgSend_setIsPaused_(self, v228, 0, v229, v230);
      v235 = objc_msgSend_attributedString(v9, v231, v232, v233, v234);
      v240 = objc_msgSend_string(v235, v236, v237, v238, v239);
      v245 = v240;
      if (v240)
      {
        id v246 = v240;
      }
      else
      {
        objc_msgSend_string(v9, v241, v242, v243, v244);
        id v246 = (id)objc_claimAutoreleasedReturnValue();
      }
      v247 = v246;

      v252 = objc_msgSend_processedString(v9, v248, v249, v250, v251);
      BOOL v253 = v252 == 0;

      if (!v253)
      {
        uint64_t v258 = objc_msgSend_processedString(v9, v254, v255, v256, v257);

        v247 = (void *)v258;
      }
      if (objc_msgSend_length(v247, v254, v255, v256, v257))
      {
        v263 = objc_msgSend_requestWillStart(self, v259, v260, v261, v262);
        BOOL v264 = v263 == 0;

        if (!v264)
        {
          objc_msgSend_requestWillStart(self, v265, v266, v267, v268);
          v269 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void *))v269)[2](v269, v9);
        }
        v270 = objc_msgSend_audioDeactivatorTimer(self, v265, v266, v267, v268);
        objc_msgSend_cancel(v270, v271, v272, v273, v274);

        v279 = objc_msgSend_audioSession(self, v275, v276, v277, v278);
        uint64_t active = objc_msgSend_setActiveOptions(self, v280, v281, v282, v283);
        id v376 = 0;
        objc_msgSend_setActive_withOptions_error_(v279, v285, 1, active, (uint64_t)&v376);
        id v286 = v376;

        if (v286)
        {
          v290 = objc_msgSend_stringWithFormat_(NSString, v287, @"Error setting active: %@", v288, v289, v286);
          v294 = objc_msgSend_stringWithFormat_(NSString, v291, @"%s:%d %@", v292, v293, "-[TTSSpeechManager _startNextSpeechJob]", 1327, v290);
          if (qword_1EB67A570 != -1) {
            dispatch_once(&qword_1EB67A570, &unk_1EFB80E08);
          }
          v295 = (void *)qword_1EB67A578;
          if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
          {
            id v296 = v294;
            v297 = v295;
            uint64_t v302 = objc_msgSend_UTF8String(v296, v298, v299, v300, v301);
            *(_DWORD *)buf = 136446210;
            uint64_t v381 = v302;
            _os_log_impl(&dword_1A66D3000, v297, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
        objc_msgSend_setState_(v9, v287, 1, v288, v289);
        v307 = objc_msgSend_taggedSSML(v9, v303, v304, v305, v306);
        BOOL v308 = v307 == 0;

        if (v308)
        {
          v348 = self->_synthesizer;
          v327 = objc_msgSend_language(v9, v309, v310, v311, v312);
          id v372 = v286;
          id v373 = 0;
          objc_msgSend_startSpeakingString_withLanguageCode_request_error_(v348, v349, (uint64_t)v247, (uint64_t)v327, (uint64_t)&v373, &v372);
          v342 = (TTSSpeechRequest *)v373;
          id v343 = v372;
          v335 = v286;
        }
        else
        {
          v313 = objc_msgSend_taggedSSML(v9, v309, v310, v311, v312);
          v318 = objc_msgSend_ssmlSnippets(v313, v314, v315, v316, v317);
          uint64_t v323 = objc_msgSend_currentSSMLSnippetIndex(v9, v319, v320, v321, v322);
          v327 = objc_msgSend_objectAtIndexedSubscript_(v318, v324, v323, v325, v326);

          objc_msgSend__setVoiceForAction_snippet_(self, v328, (uint64_t)v9, (uint64_t)v327, v329);
          v330 = self->_synthesizer;
          v335 = objc_msgSend_ssml(v327, v331, v332, v333, v334);
          v340 = objc_msgSend_language(v9, v336, v337, v338, v339);
          id v374 = v286;
          id v375 = 0;
          objc_msgSend_startSpeakingSSML_withLanguageCode_request_error_(v330, v341, (uint64_t)v335, (uint64_t)v340, (uint64_t)&v375, &v374);
          v342 = (TTSSpeechRequest *)v375;
          id v343 = v374;
        }
        if (v9 && v342) {
          objc_setAssociatedObject(v342, &unk_1E96C48C8, v9, (void *)1);
        }
        if (v343)
        {
          v354 = NSString;
          v355 = objc_msgSend_localizedDescription(v343, v350, v351, v352, v353);
          v359 = objc_msgSend_stringWithFormat_(v354, v356, @"Speech Error:%@", v357, v358, v355);

          v363 = objc_msgSend_stringWithFormat_(NSString, v360, @"%s:%d %@", v361, v362, "-[TTSSpeechManager _startNextSpeechJob]", 1345, v359);
          if (qword_1EB67A570 != -1) {
            dispatch_once(&qword_1EB67A570, &unk_1EFB80E28);
          }
          v364 = (void *)qword_1EB67A578;
          if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
          {
            id v365 = v363;
            v366 = v364;
            uint64_t v371 = objc_msgSend_UTF8String(v365, v367, v368, v369, v370);
            *(_DWORD *)buf = 136446210;
            uint64_t v381 = v371;
            _os_log_impl(&dword_1A66D3000, v366, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
      }
      else
      {
        v344 = objc_alloc_init(TTSSpeechRequest);
        v342 = v344;
        if (v9 && v344) {
          objc_setAssociatedObject(v344, &unk_1E96C48C8, v9, (void *)1);
        }
        objc_msgSend_speechSynthesizer_didStartSpeakingRequest_(self, v345, (uint64_t)self->_synthesizer, (uint64_t)v342, v346);
        objc_msgSend_speechSynthesizer_didFinishSpeakingRequest_successfully_withError_(self, v347, (uint64_t)self->_synthesizer, (uint64_t)v342, 1, 0);
        id v343 = 0;
      }
    }
  }
}

- (void)_setVoiceForAction:(id)a3 snippet:(id)a4
{
  id v43 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_voiceName(v6, v7, v8, v9, v10);

  if (v11)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F15478];
    uint64_t v17 = objc_msgSend_voiceName(v6, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend__voiceFromInternalVoiceListWithIdentifier_(v16, v18, (uint64_t)v17, v19, v20);
LABEL_5:
    uint64_t v35 = v21;
    uint64_t v36 = objc_msgSend_identifier(v21, v22, v23, v24, v25);
    objc_msgSend_setVoiceIdentifier_(self->_synthesizer, v37, (uint64_t)v36, v38, v39);

    goto LABEL_6;
  }
  id v26 = objc_msgSend_language(v6, v12, v13, v14, v15);

  if (v26)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F15478];
    uint64_t v17 = objc_msgSend_language(v6, v27, v28, v29, v30);
    uint64_t v21 = objc_msgSend_voiceWithLanguage_(v31, v32, (uint64_t)v17, v33, v34);
    goto LABEL_5;
  }
  uint64_t v17 = objc_msgSend_voiceIdentifier(v43, v27, v28, v29, v30);
  objc_msgSend_setVoiceIdentifier_(self->_synthesizer, v40, (uint64_t)v17, v41, v42);
LABEL_6:
}

- (void)_processAudioBufferCallback:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6, v7) != 2)
  {
    uint64_t v8 = AXLogSpeechSynthesis();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1A68901A4();
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A672B584;
  block[3] = &unk_1E5C69588;
  id v11 = v3;
  id v9 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)setSpeechEnabled:(BOOL)a3
{
  self->_speechEnabled = a3;
  if (!a3) {
    objc_msgSend_clearSpeechQueue(self, a2, a3, v3, v4);
  }
}

- (void)_dispatchSpeechAction:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = NSString;
  uint64_t v10 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_name(v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_string(v4, v16, v17, v18, v19);
  unsigned int shouldQueue = objc_msgSend_shouldQueue(v4, v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_stringWithFormat_(v5, v26, @"%@ Should queue: %@ -> %d", v27, v28, v15, v20, shouldQueue);

  uint64_t v33 = objc_msgSend_stringWithFormat_(NSString, v30, @"%s:%d %@", v31, v32, "-[TTSSpeechManager _dispatchSpeechAction:]", 1391, v29);
  if (qword_1EB67A570 != -1) {
    dispatch_once(&qword_1EB67A570, &unk_1EFB7EA88);
  }
  uint64_t v34 = (void *)qword_1EB67A578;
  if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
  {
    id v35 = v33;
    uint64_t v36 = v34;
    *(_DWORD *)buf = 136446210;
    uint64_t v127 = objc_msgSend_UTF8String(v35, v37, v38, v39, v40);
    _os_log_impl(&dword_1A66D3000, v36, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }
  if ((objc_msgSend_shouldQueue(v4, v41, v42, v43, v44) & 1) != 0
    || objc_msgSend_count(self->_speechQueue, v45, v46, v47, v48)
    && (objc_msgSend_objectAtIndex_(self->_speechQueue, v45, 0, v47, v48),
        uint64_t v49 = objc_claimAutoreleasedReturnValue(),
        char v54 = objc_msgSend_cannotInterrupt(v49, v50, v51, v52, v53),
        v49,
        (v54 & 1) != 0))
  {
    int v55 = 1;
  }
  else
  {
    uint64_t v56 = objc_msgSend_stringWithFormat_(NSString, v45, @"Telling synthesizer to stop because this job doesn't want to queue", v47, v48);
    uint64_t v60 = objc_msgSend_stringWithFormat_(NSString, v57, @"%s:%d %@", v58, v59, "-[TTSSpeechManager _dispatchSpeechAction:]", 1401, v56);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB80E48);
    }
    uint64_t v61 = (void *)qword_1EB67A578;
    if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
    {
      id v62 = v60;
      uint64_t v63 = v61;
      uint64_t v68 = objc_msgSend_UTF8String(v62, v64, v65, v66, v67);
      *(_DWORD *)buf = 136446210;
      uint64_t v127 = v68;
      _os_log_impl(&dword_1A66D3000, v63, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
    }
    objc_msgSend_removeAllObjects(self->_speechQueue, v69, v70, v71, v72);
    objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(self->_synthesizer, v73, 0, 1, 0);
    int v55 = 0;
  }
  objc_msgSend_addObject_(self->_speechQueue, v45, (uint64_t)v4, v47, v48);
  uint64_t v77 = objc_msgSend_stringWithFormat_(NSString, v74, @"isSpeaking: %d", v75, v76, self->_isSpeaking);
  uint64_t v81 = objc_msgSend_stringWithFormat_(NSString, v78, @"%s:%d %@", v79, v80, "-[TTSSpeechManager _dispatchSpeechAction:]", 1409, v77);
  if (qword_1EB67A570 != -1) {
    dispatch_once(&qword_1EB67A570, &unk_1EFB80E68);
  }
  uint64_t v82 = (void *)qword_1EB67A578;
  if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
  {
    id v83 = v81;
    uint64_t v84 = v82;
    uint64_t v89 = objc_msgSend_UTF8String(v83, v85, v86, v87, v88);
    *(_DWORD *)buf = 136446210;
    uint64_t v127 = v89;
    _os_log_impl(&dword_1A66D3000, v84, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }
  uint64_t v93 = objc_msgSend_stringWithFormat_(NSString, v90, @"Speech queue items: %@", v91, v92, self->_speechQueue);
  uint64_t v97 = objc_msgSend_stringWithFormat_(NSString, v94, @"%s:%d %@", v95, v96, "-[TTSSpeechManager _dispatchSpeechAction:]", 1410, v93);
  if (qword_1EB67A570 != -1) {
    dispatch_once(&qword_1EB67A570, &unk_1EFB80E88);
  }
  uint64_t v98 = (void *)qword_1EB67A578;
  if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
  {
    id v99 = v97;
    v100 = v98;
    uint64_t v105 = objc_msgSend_UTF8String(v99, v101, v102, v103, v104);
    *(_DWORD *)buf = 136446210;
    uint64_t v127 = v105;
    _os_log_impl(&dword_1A66D3000, v100, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }
  if (!v55 || !self->_isSpeaking)
  {
    uint64_t v109 = objc_msgSend_stringWithFormat_(NSString, v106, @"Starting next job", v107, v108);
    uint64_t v113 = objc_msgSend_stringWithFormat_(NSString, v110, @"%s:%d %@", v111, v112, "-[TTSSpeechManager _dispatchSpeechAction:]", 1413, v109);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB80EA8);
    }
    uint64_t v114 = (void *)qword_1EB67A578;
    if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
    {
      id v115 = v113;
      uint64_t v116 = v114;
      uint64_t v121 = objc_msgSend_UTF8String(v115, v117, v118, v119, v120);
      *(_DWORD *)buf = 136446210;
      uint64_t v127 = v121;
      _os_log_impl(&dword_1A66D3000, v116, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
    }
    objc_msgSend__startNextSpeechJob(self, v122, v123, v124, v125);
  }
}

- (void)_clearSpeechQueue
{
  objc_msgSend_removeAllObjects(self->_speechQueue, a2, v2, v3, v4);
  self->_isSpeaking = 0;
}

- (void)clearSpeechQueue
{
  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6)) {
    sub_1A6890218();
  }

  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v3, (uint64_t)sel__clearSpeechQueue, 0, 0);
}

- (void)dispatchSpeechAction:(id)a3
{
  id v12 = a3;
  if (objc_msgSend_speechEnabled(self, v4, v5, v6, v7))
  {
    if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v8, v9, v10, v11)) {
      sub_1A6890244();
    }
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v8, (uint64_t)sel__dispatchSpeechAction_, (uint64_t)v12, 0);
  }
}

- (void)_pauseSpeaking:(id)a3
{
  id v25 = a3;
  if (objc_msgSend_isInAudioInterruption(self, v4, v5, v6, v7)
    && objc_msgSend_wasSpeakingBeforeAudioInterruption(self, v8, v9, v10, v11))
  {
    objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v8, 1, v10, v11);
    objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v12, 0, v13, v14);
    objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v15, 0, v16, v17);
    objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v18, 0, v19, v20);
  }
  synthesizer = self->_synthesizer;
  int v22 = objc_msgSend_intValue(v25, v8, v9, v10, v11);
  objc_msgSend_pauseSpeakingAtNextBoundary_error_(synthesizer, v23, v22, 0, v24);
}

- (void)pauseSpeaking:(int64_t)a3
{
  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v5, v6, v7, v8)) {
    sub_1A6890270();
  }
  objc_msgSend_numberWithInteger_(NSNumber, v5, a3, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v9, (uint64_t)sel__pauseSpeaking_, (uint64_t)v10, 1);
}

- (void)_continueSpeaking
{
  if (objc_msgSend_isInAudioInterruption(self, a2, v2, v3, v4))
  {
    objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v6, 1, v7, v8);
    objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v9, 0, v10, v11);
    objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v12, 0, v13, v14);
    objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v15, 0, v16, v17);
  }
  synthesizer = self->_synthesizer;

  MEMORY[0x1F4181798](synthesizer, sel_continueSpeakingWithError_, 0, v7, v8);
}

- (void)continueSpeaking
{
  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6)) {
    sub_1A689029C();
  }

  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v3, (uint64_t)sel__continueSpeaking, 0, 0);
}

- (void)_stopSpeaking:(id)a3
{
  synthesizer = self->_synthesizer;
  uint64_t v7 = objc_msgSend_integerValue(a3, a2, (uint64_t)a3, v3, v4);

  objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(synthesizer, v6, v7, 1, 0);
}

- (void)stopSpeaking:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v6, (uint64_t)sel__stopSpeaking_, (uint64_t)v7, 0);
}

- (void)stopSpeaking
{
  objc_msgSend_stopSpeaking_(self, a2, 0, v2, v3);
}

- (void)_isSpeaking:(id)a3
{
  synthesizer = self->_synthesizer;
  id v11 = a3;
  if (objc_msgSend_isSpeaking(synthesizer, v4, v5, v6, v7)) {
    objc_msgSend_setString_(v11, v8, @"1", v9, v10);
  }
  else {
    objc_msgSend_setString_(v11, v8, @"0", v9, v10);
  }
}

- (BOOL)isSpeaking
{
  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6)) {
    sub_1A68902C8();
  }
  if (objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6)) {
    return 0;
  }
  id v12 = objc_msgSend_string(MEMORY[0x1E4F28E78], v7, v8, v9, v10);
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v13, (uint64_t)sel__isSpeaking_, (uint64_t)v12, 1);
  char v18 = objc_msgSend_BOOLValue(v12, v14, v15, v16, v17);

  return v18;
}

- (NSArray)outputChannels
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1A6727F00;
  uint64_t v13 = sub_1A6727F10;
  id v14 = 0;
  propertyQueue = self->_propertyQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A672C30C;
  v8[3] = &unk_1E5C6A330;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(propertyQueue, v8);
  uint64_t v6 = objc_msgSend_convertChannels_(TTSAudioSessionChannel, v3, v10[5], v4, v5);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

- (void)setOutputChannels:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v14 = v4;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v37, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v33;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v14);
          }
          id v26 = objc_msgSend_channelWithChannel_(TTSAudioSessionChannel, v17, *(void *)(*((void *)&v32 + 1) + 8 * v22), v18, v19);
          if (v26) {
            objc_msgSend_addObject_(v13, v23, (uint64_t)v26, v24, v25);
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v32, (uint64_t)v37, 16);
      }
      while (v20);
    }

    propertyQueue = self->_propertyQueue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1A672C578;
    v30[3] = &unk_1E5C69600;
    v30[4] = self;
    id v31 = v13;
    id v28 = v13;
    dispatch_async(propertyQueue, v30);
  }
  else
  {
    uint64_t v29 = self->_propertyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A672C568;
    block[3] = &unk_1E5C69588;
    void block[4] = self;
    dispatch_async(v29, block);
  }
}

- (unsigned)audioQueueFlags
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A672C630;
  v5[3] = &unk_1E5C6A330;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A672C6BC;
  v4[3] = &unk_1E5C6AA20;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(propertyQueue, v4);
}

- (void)_processDidStartCallback:(id)a3
{
  id v4 = a3;
  int v9 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v5, v6, v7, v8);
  if ((objc_msgSend_isEqual_(v9, v10, (uint64_t)self->_runThread, v11, v12) & 1) == 0) {
    sub_1A68902F4();
  }

  uint64_t v13 = (void *)MEMORY[0x1AD0C1200]();
  id v14 = objc_getAssociatedObject(v4, &unk_1E96C48C8);
  uint64_t v19 = objc_msgSend_taggedSSML(v14, v15, v16, v17, v18);
  if (!v19
    || (uint64_t v24 = (void *)v19, v25 = objc_msgSend_currentSSMLSnippetIndex(v14, v20, v21, v22, v23), v24, !v25))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A672C7F8;
    block[3] = &unk_1E5C69588;
    id v27 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  unsigned int v5 = (void *)MEMORY[0x1E4F29060];
  id v18 = a4;
  uint64_t v10 = objc_msgSend_currentThread(v5, v6, v7, v8, v9);
  int isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_runThread, v12, v13);

  if (isEqual) {
    objc_msgSend__processDidStartCallback_(self, v15, (uint64_t)v18, v16, v17);
  }
  else {
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v15, (uint64_t)sel__processDidStartCallback_, (uint64_t)v18, 1);
  }
}

- (void)__speechJobFinished:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectAtIndexedSubscript_(v4, v5, 0, v6, v7);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_BOOLValue(v19, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v4, v13, 1, v14, v15);

  objc_msgSend__speechJobFinished_action_(self, v17, v12, (uint64_t)v16, v18);
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v187 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v186 = MEMORY[0x1AD0C1200]();
  uint64_t v12 = NSString;
  uint64_t v17 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_name(v17, v18, v19, v20, v21);
  uint64_t v23 = v11;
  id v27 = objc_msgSend_stringWithFormat_(v12, v24, @"%@ Speech finished: %d %@", v25, v26, v22, v7, v11);

  id v31 = objc_msgSend_stringWithFormat_(NSString, v28, @"%s:%d %@", v29, v30, "-[TTSSpeechManager speechSynthesizer:didFinishSpeakingRequest:successfully:withError:]", 1641, v27);
  if (qword_1EB67A570 != -1) {
    dispatch_once(&qword_1EB67A570, &unk_1EFB80EC8);
  }
  long long v32 = (void *)qword_1EB67A578;
  if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEBUG))
  {
    long long v33 = self;
    id v34 = v10;
    id v35 = v31;
    uint64_t v36 = v32;
    uint64_t v37 = v35;
    id v10 = v34;
    self = v33;
    *(_DWORD *)buf = 136446210;
    uint64_t v192 = objc_msgSend_UTF8String(v37, v38, v39, v40, v41);
    _os_log_impl(&dword_1A66D3000, v36, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }
  if (objc_msgSend_isFinished(self->_runThread, v42, v43, v44, v45))
  {
    uint64_t v47 = (void *)v186;
    uint64_t v46 = v187;
  }
  else
  {
    uint64_t v48 = objc_getAssociatedObject(v10, &unk_1E96C48C8);
    uint64_t v53 = v48;
    if (v48)
    {
      uint64_t v47 = (void *)v186;
      if (v23)
      {
        char v54 = objc_msgSend_copy(v48, v49, v50, v51, v52);
        id v55 = v10;
        uint64_t v60 = objc_msgSend_languageCode(v10, v56, v57, v58, v59);
        id v62 = objc_msgSend__speechVoiceForIdentifier_language_footprint_(TTSSpeechSynthesizer, v61, 0, (uint64_t)v60, 1);

        uint64_t v63 = VOTLogSpeech();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          sub_1A6890320((uint64_t)v23, v62, v63, v64, v65);
        }

        uint64_t v70 = objc_msgSend_identifier(v62, v66, v67, v68, v69);
        objc_msgSend_setVoiceIdentifier_(v54, v71, (uint64_t)v70, v72, v73);

        objc_msgSend_dispatchSpeechAction_(self, v74, (uint64_t)v54, v75, v76);
        id v10 = v55;
      }
      uint64_t v77 = objc_msgSend_taggedSSML(v53, v49, v50, v51, v52);

      if (!v77) {
        goto LABEL_37;
      }
      uint64_t v82 = objc_msgSend_currentSSMLSnippetIndex(v53, v78, v79, v80, v81);
      objc_msgSend_setCurrentSSMLSnippetIndex_(v53, v83, v82 + 1, v84, v85);
      unint64_t v90 = objc_msgSend_currentSSMLSnippetIndex(v53, v86, v87, v88, v89);
      uint64_t v95 = objc_msgSend_taggedSSML(v53, v91, v92, v93, v94);
      objc_msgSend_ssmlSnippets(v95, v96, v97, v98, v99);
      uint64_t v101 = v100 = v10;
      unint64_t v106 = objc_msgSend_count(v101, v102, v103, v104, v105);

      id v10 = v100;
      if (v90 < v106)
      {
        uint64_t v107 = objc_msgSend_taggedSSML(v53, v78, v79, v80, v81);
        uint64_t v112 = objc_msgSend_ssmlSnippets(v107, v108, v109, v110, v111);
        uint64_t v117 = objc_msgSend_currentSSMLSnippetIndex(v53, v113, v114, v115, v116);
        objc_msgSend_objectAtIndexedSubscript_(v112, v118, v117, v119, v120);
        v122 = uint64_t v121 = self;

        objc_msgSend__setVoiceForAction_snippet_(v121, v123, (uint64_t)v53, (uint64_t)v122, v124);
        synthesizer = v121->_synthesizer;
        uint64_t v130 = objc_msgSend_ssml(v122, v126, v127, v128, v129);
        uint64_t v135 = objc_msgSend_language(v122, v131, v132, v133, v134);
        id v188 = v23;
        id v189 = 0;
        objc_msgSend_startSpeakingSSML_withLanguageCode_request_error_(synthesizer, v136, (uint64_t)v130, (uint64_t)v135, (uint64_t)&v189, &v188);
        id v137 = v189;
        id v138 = v188;

        if (v137) {
          objc_setAssociatedObject(v137, &unk_1E96C48C8, v53, (void *)1);
        }

        uint64_t v23 = v138;
        uint64_t v46 = v187;
        id v10 = v100;
      }
      else
      {
LABEL_37:
        if (objc_msgSend_ignoreCustomSubstitutions(v53, v78, v79, v80, v81)) {
          objc_msgSend__updateUserSubstitutions(self, v139, v140, v141, v142);
        }
        uint64_t v143 = (uint64_t *)self;
        uint64_t v144 = objc_msgSend_text(v10, v139, v140, v141, v142);

        if (v144)
        {
          uint64_t v149 = objc_msgSend_text(v10, v145, v146, v147, v148);
          objc_msgSend_setFinalSpokenString_(v53, v150, (uint64_t)v149, v151, v152);
        }
        if (v23) {
          objc_msgSend_numberWithInt_(NSNumber, v145, 0, v147, v148);
        }
        else {
        uint64_t v153 = objc_msgSend_numberWithInt_(NSNumber, v145, v7, v147, v148);
        }
        v190[0] = v153;
        v190[1] = v53;
        uint64_t v156 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v154, (uint64_t)v190, 2, v155);

        uint64_t v161 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v157, v158, v159, v160);
        int isEqual = objc_msgSend_isEqual_(v161, v162, v143[3], v163, v164);

        if (isEqual) {
          objc_msgSend___speechJobFinished_(v143, v166, (uint64_t)v156, v167, v168);
        }
        else {
          objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(v143, v166, (uint64_t)sel___speechJobFinished_, (uint64_t)v156, 0);
        }
        uint64_t v46 = v187;
      }
    }
    else
    {
      uint64_t v185 = self;
      uint64_t v169 = objc_msgSend_stringWithFormat_(NSString, v49, @"No action for request: %@", v51, v52, v10);
      v173 = objc_msgSend_stringWithFormat_(NSString, v170, @"%s:%d %@", v171, v172, "-[TTSSpeechManager speechSynthesizer:didFinishSpeakingRequest:successfully:withError:]", 1652, v169);
      if (qword_1EB67A570 != -1) {
        dispatch_once(&qword_1EB67A570, &unk_1EFB80EE8);
      }
      uint64_t v47 = (void *)v186;
      uint64_t v46 = v187;
      uint64_t v174 = (void *)qword_1EB67A578;
      if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
      {
        id v175 = v10;
        id v176 = v173;
        uint64_t v177 = v174;
        uint64_t v178 = v176;
        id v10 = v175;
        uint64_t v183 = objc_msgSend_UTF8String(v178, v179, v180, v181, v182);
        *(_DWORD *)buf = 136446210;
        uint64_t v192 = v183;
        _os_log_impl(&dword_1A66D3000, v177, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(v185, v184, (uint64_t)sel___speechJobFinished_, 0, 0);
    }
  }
}

- (void)speechSynthesizer:(id)a3 didPauseSpeakingRequest:(id)a4
{
  unsigned int v5 = (void *)MEMORY[0x1E4F29060];
  id v18 = a4;
  id v10 = objc_msgSend_currentThread(v5, v6, v7, v8, v9);
  int isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_runThread, v12, v13);

  if (isEqual) {
    objc_msgSend__processDidPauseCallback_(self, v15, (uint64_t)v18, v16, v17);
  }
  else {
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v15, (uint64_t)sel__processDidPauseCallback_, (uint64_t)v18, 1);
  }
}

- (void)_processDidPauseCallback:(id)a3
{
  id v4 = a3;
  uint64_t IsPaused = objc_msgSend_setIsPaused_(self, v5, 1, v6, v7);
  uint64_t v9 = (void *)MEMORY[0x1AD0C1200](IsPaused);
  id v10 = objc_getAssociatedObject(v4, &unk_1E96C48C8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A672D1EC;
  block[3] = &unk_1E5C69588;
  id v13 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)speechSynthesizer:(id)a3 didContinueSpeakingRequest:(id)a4
{
  unsigned int v5 = (void *)MEMORY[0x1E4F29060];
  id v18 = a4;
  id v10 = objc_msgSend_currentThread(v5, v6, v7, v8, v9);
  int isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_runThread, v12, v13);

  if (isEqual) {
    objc_msgSend__processDidContinueCallback_(self, v15, (uint64_t)v18, v16, v17);
  }
  else {
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v15, (uint64_t)sel__processDidContinueCallback_, (uint64_t)v18, 1);
  }
}

- (void)_processDidContinueCallback:(id)a3
{
  id v4 = a3;
  uint64_t IsPaused = objc_msgSend_setIsPaused_(self, v5, 0, v6, v7);
  uint64_t v9 = (void *)MEMORY[0x1AD0C1200](IsPaused);
  id v10 = objc_getAssociatedObject(v4, &unk_1E96C48C8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A672D3E8;
  block[3] = &unk_1E5C69588;
  id v13 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)speechSynthesizer:(id)a3 didEncounterMarker:(id)a4 forRequest:(id)a5
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v58[0] = v8;
  v58[1] = v7;
  id v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v58, 2, v10);
  if (objc_msgSend_markType(v7, v12, v13, v14, v15) == 1)
  {
    id v20 = v7;
    v57[0] = v8;
    uint64_t v21 = (void *)MEMORY[0x1E4F29238];
    uint64_t v26 = objc_msgSend_wordRange(v20, v22, v23, v24, v25);
    uint64_t v29 = objc_msgSend_valueWithRange_(v21, v27, v26, (uint64_t)v27, v28);
    v57[1] = v29;
    long long v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)v57, 2, v31);

    uint64_t v37 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v33, v34, v35, v36);
    int isEqual = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_runThread, v39, v40);

    if (isEqual)
    {
      objc_msgSend__processDidEncounterMarker_(self, v42, (uint64_t)v11, v43, v44);
      objc_msgSend__processWillSpeechRange_(self, v45, (uint64_t)v32, v46, v47);
    }
    else
    {
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v42, (uint64_t)sel__processDidEncounterMarker_, (uint64_t)v11, 1);
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v56, (uint64_t)sel__processWillSpeechRange_, (uint64_t)v32, 1);
    }
  }
  else
  {
    uint64_t v48 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v16, v17, v18, v19);
    int v52 = objc_msgSend_isEqual_(v48, v49, (uint64_t)self->_runThread, v50, v51);

    if (v52) {
      objc_msgSend__processDidEncounterMarker_(self, v53, (uint64_t)v11, v54, v55);
    }
    else {
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v53, (uint64_t)sel__processDidEncounterMarker_, (uint64_t)v11, 1);
    }
  }
}

- (void)_processDidEncounterMarker:(id)a3
{
  id v3 = a3;
  id v7 = objc_msgSend_objectAtIndexedSubscript_(v3, v4, 0, v5, v6);
  id v11 = objc_msgSend_objectAtIndexedSubscript_(v3, v8, 1, v9, v10);

  uint64_t v12 = objc_getAssociatedObject(v7, &unk_1E96C48C8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A672D740;
  v15[3] = &unk_1E5C69600;
  id v16 = v12;
  id v17 = v11;
  id v13 = v11;
  id v14 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

- (void)_processWillSpeechRange:(id)a3
{
  id v3 = a3;
  id v7 = objc_msgSend_objectAtIndexedSubscript_(v3, v4, 0, v5, v6);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3010000000;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  v23[3] = &unk_1A68F25BB;
  id v11 = objc_msgSend_objectAtIndexedSubscript_(v3, v8, 1, v9, v10);
  uint64_t v24 = objc_msgSend_rangeValue(v11, v12, v13, v14, v15);
  uint64_t v25 = v16;

  id v17 = (void *)MEMORY[0x1AD0C1200]();
  uint64_t v18 = objc_getAssociatedObject(v7, &unk_1E96C48C8);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1A672D90C;
  v20[3] = &unk_1E5C696A0;
  id v21 = v18;
  uint64_t v22 = v23;
  id v19 = v18;
  dispatch_async(MEMORY[0x1E4F14428], v20);

  _Block_object_dispose(v23, 8);
}

+ (id)remapLanguageCode:(id)a3
{
  return (id)AXCRemapLanguageCodeToFallbackIfNeccessary();
}

+ (void)test_actionStartTap:(id)a3
{
  qword_1E96C48B0 = (uint64_t)_Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

+ (void)test_setUnitTestMode:(BOOL)a3
{
  byte_1E96C48A8 = a3;
}

+ (void)test_setAvailableVoices:(id)a3
{
}

- (BOOL)speechEnabled
{
  return self->_speechEnabled;
}

- (TTSSpeechAction)requestedActionDuringAudioInterruption
{
  return self->_requestedActionDuringAudioInterruption;
}

- (void)setRequestedActionDuringAudioInterruption:(id)a3
{
}

- (NSString)speechSource
{
  return self->_speechSource;
}

- (BOOL)showControlCenterControls
{
  return self->_showControlCenterControls;
}

- (BOOL)usesAuxiliarySession
{
  return self->_usesAuxiliarySession;
}

- (double)audioSessionInactiveTimeout
{
  return self->_audioSessionInactiveTimeout;
}

- (void)setAudioSessionInactiveTimeout:(double)a3
{
  self->_audioSessionInactiveTimeout = a3;
}

- (id)requestWillStart
{
  return self->_requestWillStart;
}

- (void)setRequestWillStart:(id)a3
{
}

- (NSNumber)originalSpeechRateForJobOverride
{
  return self->_originalSpeechRateForJobOverride;
}

- (void)setOriginalSpeechRateForJobOverride:(id)a3
{
}

- (AXDispatchTimer)audioDeactivatorTimer
{
  return self->_audioDeactivatorTimer;
}

- (void)setAudioDeactivatorTimer:(id)a3
{
}

- (OS_dispatch_queue)audioOperationQueue
{
  return self->_audioOperationQueue;
}

- (void)setAudioOperationQueue:(id)a3
{
}

- (BOOL)wasSpeakingBeforeAudioInterruption
{
  return self->_wasSpeakingBeforeAudioInterruption;
}

- (void)setWasSpeakingBeforeAudioInterruption:(BOOL)a3
{
  self->_wasSpeakingBeforeAudioInterruption = a3;
}

- (BOOL)didRequestStartSpeakingDuringAudioInterruption
{
  return self->_didRequestStartSpeakingDuringAudioInterruption;
}

- (void)setDidRequestStartSpeakingDuringAudioInterruption:(BOOL)a3
{
  self->_didRequestStartSpeakingDuringAudioInterruption = a3;
}

- (BOOL)didRequestPauseSpeakingDuringAudioInterruption
{
  return self->_didRequestPauseSpeakingDuringAudioInterruption;
}

- (void)setDidRequestPauseSpeakingDuringAudioInterruption:(BOOL)a3
{
  self->_didRequestPauseSpeakingDuringAudioInterruption = a3;
}

- (BOOL)didRequestResumeSpeakingDuringAudioInterruption
{
  return self->_didRequestResumeSpeakingDuringAudioInterruption;
}

- (void)setDidRequestResumeSpeakingDuringAudioInterruption:(BOOL)a3
{
  self->_didRequestResumeSpeakingDuringAudioInterruption = a3;
}

- (double)audioInterruptionStartedTime
{
  return self->_audioInterruptionStartedTime;
}

- (void)setAudioInterruptionStartedTime:(double)a3
{
  self->_audioInterruptionStartedTime = a3;
}

- (BOOL)shouldHandleAudioInterruptions
{
  return self->_shouldHandleAudioInterruptions;
}

- (void)setShouldHandleAudioInterruptions:(BOOL)a3
{
  self->_shouldHandleAudioInterruptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioOperationQueue, 0);
  objc_storeStrong((id *)&self->_audioDeactivatorTimer, 0);
  objc_storeStrong((id *)&self->_originalSpeechRateForJobOverride, 0);
  objc_storeStrong(&self->_requestWillStart, 0);
  objc_storeStrong((id *)&self->_speechSource, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_storeStrong((id *)&self->_requestedActionDuringAudioInterruption, 0);
  objc_storeStrong((id *)&self->_speechThreadQueueLock, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_runThread, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);

  objc_storeStrong((id *)&self->_speechQueue, 0);
}

@end