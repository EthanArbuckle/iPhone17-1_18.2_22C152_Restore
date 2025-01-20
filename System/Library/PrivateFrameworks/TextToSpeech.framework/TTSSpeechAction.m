@interface TTSSpeechAction
+ (id)actionWithAttributedString:(id)a3 shouldQueue:(BOOL)a4;
+ (id)actionWithSSMLRepresentation:(id)a3 shouldQueue:(BOOL)a4;
+ (id)actionWithString:(id)a3 shouldQueue:(BOOL)a4;
+ (void)test_setUseMaxSpeechRate:(BOOL)a3;
- (AVSpeechUtterance)utterance;
- (AXCVoiceSelection)voiceSelection;
- (BOOL)cannotInterrupt;
- (BOOL)ignoreCustomSubstitutions;
- (BOOL)shouldDetectLanguage;
- (BOOL)shouldPrecomposeString;
- (BOOL)shouldProcessEmoji;
- (BOOL)shouldProcessEmoticons;
- (BOOL)shouldQueue;
- (BOOL)synthesizeSilently;
- (NSAttributedString)attributedString;
- (NSMutableArray)emojiRangeReplacements;
- (NSString)finalSpokenString;
- (NSString)language;
- (NSString)processedString;
- (NSString)ssmlRepresentation;
- (NSString)string;
- (NSString)voiceIdentifier;
- (TTSSpeechAction)init;
- (_TtC12TextToSpeech10TaggedSSML)taggedSSML;
- (double)pitch;
- (double)speakingRate;
- (double)volume;
- (id)_detectLanguageFromContent;
- (id)audioBufferCallback;
- (id)completionCallback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)markerCallback;
- (id)onMarkerCallback;
- (id)onPauseCallback;
- (id)onResumeCallback;
- (id)onSpeechStartCallback;
- (id)onWillSpeakRangeCallback;
- (int64_t)state;
- (int64_t)wordCallbackPostProcessedOffset;
- (unint64_t)currentSSMLSnippetIndex;
- (void)dealloc;
- (void)preprocessAction;
- (void)setAttributedString:(id)a3;
- (void)setAudioBufferCallback:(id)a3;
- (void)setCannotInterrupt:(BOOL)a3;
- (void)setCompletionCallback:(id)a3;
- (void)setCurrentSSMLSnippetIndex:(unint64_t)a3;
- (void)setEmojiRangeReplacements:(id)a3;
- (void)setFinalSpokenString:(id)a3;
- (void)setIgnoreCustomSubstitutions:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setMarkerCallback:(id)a3;
- (void)setOnMarkerCallback:(id)a3;
- (void)setOnPauseCallback:(id)a3;
- (void)setOnResumeCallback:(id)a3;
- (void)setOnSpeechStartCallback:(id)a3;
- (void)setOnWillSpeakRangeCallback:(id)a3;
- (void)setPitch:(double)a3;
- (void)setProcessedString:(id)a3;
- (void)setShouldDetectLanguage:(BOOL)a3;
- (void)setShouldPrecomposeString:(BOOL)a3;
- (void)setShouldProcessEmoji:(BOOL)a3;
- (void)setShouldProcessEmoticons:(BOOL)a3;
- (void)setShouldQueue:(BOOL)a3;
- (void)setSpeakingRate:(double)a3;
- (void)setSsmlRepresentation:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setString:(id)a3;
- (void)setSynthesizeSilently:(BOOL)a3;
- (void)setTaggedSSML:(id)a3;
- (void)setUtterance:(id)a3;
- (void)setVoiceIdentifier:(id)a3;
- (void)setVoiceSelection:(id)a3;
- (void)setVolume:(double)a3;
- (void)setWordCallbackPostProcessedOffset:(int64_t)a3;
@end

@implementation TTSSpeechAction

- (void)dealloc
{
  v6 = objc_msgSend_utterance(self, a2, v2, v3, v4);
  objc_msgSend_setAction_(v6, v7, 0, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)TTSSpeechAction;
  [(TTSSpeechAction *)&v10 dealloc];
}

- (void)setUtterance:(id)a3
{
}

- (AVSpeechUtterance)utterance
{
  return (AVSpeechUtterance *)objc_getAssociatedObject(self, &unk_1E96C4838);
}

+ (id)actionWithString:(id)a3 shouldQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_alloc_init(TTSSpeechAction);
  objc_msgSend_setString_(v6, v7, (uint64_t)v5, v8, v9);

  objc_msgSend_setShouldQueue_(v6, v10, v4, v11, v12);

  return v6;
}

+ (id)actionWithAttributedString:(id)a3 shouldQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_alloc_init(TTSSpeechAction);
  objc_msgSend_setAttributedString_(v6, v7, (uint64_t)v5, v8, v9);

  objc_msgSend_setShouldQueue_(v6, v10, v4, v11, v12);

  return v6;
}

+ (id)actionWithSSMLRepresentation:(id)a3 shouldQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = AXLogSpeechSynthesis();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1A688FE14();
  }

  v7 = objc_alloc_init(TTSSpeechAction);
  objc_msgSend_setString_(v7, v8, (uint64_t)v5, v9, v10);
  objc_msgSend_setSsmlRepresentation_(v7, v11, (uint64_t)v5, v12, v13);
  objc_msgSend_setShouldQueue_(v7, v14, v4, v15, v16);

  return v7;
}

- (TTSSpeechAction)init
{
  v9.receiver = self;
  v9.super_class = (Class)TTSSpeechAction;
  result = [(TTSSpeechAction *)&v9 init];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&result->_pitch = _Q0;
  result->_shouldPrecomposeString = 1;
  double v8 = 4.0;
  if (!byte_1E96C4898) {
    double v8 = 0.5;
  }
  result->_speakingRate = v8;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(TTSSpeechAction);
  objc_super v9 = objc_msgSend_string(self, v5, v6, v7, v8);
  v14 = objc_msgSend_copy(v9, v10, v11, v12, v13);
  objc_msgSend_setString_(v4, v15, (uint64_t)v14, v16, v17);

  v22 = objc_msgSend_language(self, v18, v19, v20, v21);
  v27 = objc_msgSend_copy(v22, v23, v24, v25, v26);
  objc_msgSend_setLanguage_(v4, v28, (uint64_t)v27, v29, v30);

  return v4;
}

- (void)preprocessAction
{
  if (self->_shouldPrecomposeString)
  {
    uint64_t v6 = objc_msgSend_string(self, a2, v2, v3, v4);
    uint64_t v11 = objc_msgSend_precomposedStringWithCanonicalMapping(v6, v7, v8, v9, v10);
    objc_msgSend_setString_(self, v12, (uint64_t)v11, v13, v14);

    uint64_t v19 = objc_msgSend_ssmlRepresentation(self, v15, v16, v17, v18);
    uint64_t v24 = objc_msgSend_precomposedStringWithCanonicalMapping(v19, v20, v21, v22, v23);
    objc_msgSend_setSsmlRepresentation_(self, v25, (uint64_t)v24, v26, v27);
  }
  v32 = objc_msgSend_language(self, a2, v2, v3, v4);
  if (!v32)
  {
    if (!self->_shouldDetectLanguage) {
      goto LABEL_7;
    }
    v32 = objc_msgSend__detectLanguageFromContent(self, v28, v29, v30, v31);
    objc_msgSend_setLanguage_(self, v33, (uint64_t)v32, v34, v35);
  }

LABEL_7:
  BOOL shouldProcessEmoticons = self->_shouldProcessEmoticons;
  if (!self->_shouldProcessEmoji)
  {
    if (!self->_shouldProcessEmoticons) {
      goto LABEL_14;
    }
    BOOL shouldProcessEmoticons = 1;
  }
  if (shouldProcessEmoticons) {
    char shouldProcessEmoji = self->_shouldProcessEmoji | 2;
  }
  else {
    char shouldProcessEmoji = self->_shouldProcessEmoji;
  }
  v38 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  emojiRangeReplacements = self->_emojiRangeReplacements;
  self->_emojiRangeReplacements = v38;

  v44 = objc_msgSend_string(self, v40, v41, v42, v43);
  v49 = objc_msgSend_language(self, v45, v46, v47, v48);
  v54 = objc_msgSend_voiceIdentifier(self, v50, v51, v52, v53);
  v55 = TTSSpeechTransformTextWithLanguageAndVoiceIdentifier(v44, shouldProcessEmoji, v49, v54, self->_emojiRangeReplacements);
  objc_msgSend_setProcessedString_(self, v56, (uint64_t)v55, v57, v58);

LABEL_14:
  v59 = objc_msgSend_ssmlRepresentation(self, v28, v29, v30, v31);

  if (v59)
  {
    v72 = objc_alloc_init(_TtC12TextToSpeech15SSMLVoiceTagger);
    v64 = objc_msgSend_ssmlRepresentation(self, v60, v61, v62, v63);
    v68 = objc_msgSend_tagSSML_(v72, v65, (uint64_t)v64, v66, v67);
    objc_msgSend_setTaggedSSML_(self, v69, (uint64_t)v68, v70, v71);
  }
}

- (id)_detectLanguageFromContent
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_string(self, a2, v2, v3, v4);

  if (!v6)
  {
    uint64_t v31 = objc_msgSend_stringWithFormat_(NSString, v7, @"content is nil, language detection not possible", v9, v10);
    uint64_t v35 = objc_msgSend_stringWithFormat_(NSString, v37, @"%s:%d %@", v38, v39, "-[TTSSpeechAction _detectLanguageFromContent]", 231, v31);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB80460);
    }
    v36 = (void *)qword_1EB67A578;
    if (!os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
LABEL_10:
    id v40 = v35;
    uint64_t v41 = v36;
    *(_DWORD *)buf = 136446210;
    uint64_t v77 = objc_msgSend_UTF8String(v40, v42, v43, v44, v45);
    _os_log_impl(&dword_1A66D3000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_11:

LABEL_12:
    id v46 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = objc_msgSend_string(self, v7, v8, v9, v10);
  unint64_t v16 = objc_msgSend_length(v11, v12, v13, v14, v15);

  if (v16 <= 0x15D)
  {
    uint64_t v21 = NSString;
    uint64_t v22 = objc_msgSend_string(self, v17, v18, v19, v20);
    uint64_t v27 = objc_msgSend_length(v22, v23, v24, v25, v26);
    uint64_t v31 = objc_msgSend_stringWithFormat_(v21, v28, @"Not enough characters (%lu) to accurately detect language", v29, v30, v27);

    uint64_t v35 = objc_msgSend_stringWithFormat_(NSString, v32, @"%s:%d %@", v33, v34, "-[TTSSpeechAction _detectLanguageFromContent]", 238, v31);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB7E3D8);
    }
    v36 = (void *)qword_1EB67A578;
    if (!os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  objc_msgSend_string(self, v17, v18, v19, v20);
  uint64_t v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = objc_msgSend_string(self, v49, v50, v51, v52);
  v80.length = objc_msgSend_length(v53, v54, v55, v56, v57);
  v80.location = 0;
  uint64_t v31 = (void *)CFStringTokenizerCopyBestStringLanguage(v48, v80);

  if (!v31)
  {
    uint64_t v35 = objc_msgSend_stringWithFormat_(NSString, v58, @"could not determine content language, returning default", v59, v60);
    uint64_t v41 = objc_msgSend_stringWithFormat_(NSString, v66, @"%s:%d %@", v67, v68, "-[TTSSpeechAction _detectLanguageFromContent]", 245, v35);
    if (qword_1EB67A570 != -1) {
      dispatch_once(&qword_1EB67A570, &unk_1EFB7E438);
    }
    v69 = (void *)qword_1EB67A578;
    if (os_log_type_enabled((os_log_t)qword_1EB67A578, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v70 = v41;
      uint64_t v71 = v69;
      *(_DWORD *)buf = 136446210;
      uint64_t v77 = objc_msgSend_UTF8String(v70, v72, v73, v74, v75);
      _os_log_impl(&dword_1A66D3000, v71, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v61 = TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  v65 = v61;
  if (v61 && objc_msgSend_rangeOfString_(v61, v62, (uint64_t)v31, v63, v64) != 0x7FFFFFFFFFFFFFFFLL) {
    id v46 = 0;
  }
  else {
    id v46 = v31;
  }

LABEL_13:

  return v46;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<TTSSpeechAction: %p> %@ :Pitch %f : Language: %@, voiceId: %@", v2, v3, self, self->_string, *(void *)&self->_pitch, self->_language, self->_voiceIdentifier);
}

+ (void)test_setUseMaxSpeechRate:(BOOL)a3
{
  byte_1E96C4898 = a3;
}

- (BOOL)shouldQueue
{
  return self->_shouldQueue;
}

- (void)setShouldQueue:(BOOL)a3
{
  self->_shouldQueue = a3;
}

- (BOOL)cannotInterrupt
{
  return self->_cannotInterrupt;
}

- (void)setCannotInterrupt:(BOOL)a3
{
  self->_cannotInterrupt = a3;
}

- (BOOL)shouldDetectLanguage
{
  return self->_shouldDetectLanguage;
}

- (void)setShouldDetectLanguage:(BOOL)a3
{
  self->_shouldDetectLanguage = a3;
}

- (BOOL)shouldProcessEmoji
{
  return self->_shouldProcessEmoji;
}

- (void)setShouldProcessEmoji:(BOOL)a3
{
  self->_char shouldProcessEmoji = a3;
}

- (BOOL)shouldProcessEmoticons
{
  return self->_shouldProcessEmoticons;
}

- (void)setShouldProcessEmoticons:(BOOL)a3
{
  self->_BOOL shouldProcessEmoticons = a3;
}

- (BOOL)shouldPrecomposeString
{
  return self->_shouldPrecomposeString;
}

- (void)setShouldPrecomposeString:(BOOL)a3
{
  self->_shouldPrecomposeString = a3;
}

- (BOOL)ignoreCustomSubstitutions
{
  return self->_ignoreCustomSubstitutions;
}

- (void)setIgnoreCustomSubstitutions:(BOOL)a3
{
  self->_ignoreCustomSubstitutions = a3;
}

- (BOOL)synthesizeSilently
{
  return self->_synthesizeSilently;
}

- (void)setSynthesizeSilently:(BOOL)a3
{
  self->_synthesizeSilently = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)voiceIdentifier
{
  return self->_voiceIdentifier;
}

- (void)setVoiceIdentifier:(id)a3
{
}

- (AXCVoiceSelection)voiceSelection
{
  return self->_voiceSelection;
}

- (void)setVoiceSelection:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (id)audioBufferCallback
{
  return self->_audioBufferCallback;
}

- (void)setAudioBufferCallback:(id)a3
{
}

- (id)markerCallback
{
  return self->_markerCallback;
}

- (void)setMarkerCallback:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (NSString)ssmlRepresentation
{
  return self->_ssmlRepresentation;
}

- (void)setSsmlRepresentation:(id)a3
{
}

- (id)completionCallback
{
  return self->_completionCallback;
}

- (void)setCompletionCallback:(id)a3
{
}

- (id)onPauseCallback
{
  return self->_onPauseCallback;
}

- (void)setOnPauseCallback:(id)a3
{
}

- (id)onResumeCallback
{
  return self->_onResumeCallback;
}

- (void)setOnResumeCallback:(id)a3
{
}

- (id)onWillSpeakRangeCallback
{
  return self->_onWillSpeakRangeCallback;
}

- (void)setOnWillSpeakRangeCallback:(id)a3
{
}

- (id)onMarkerCallback
{
  return self->_onMarkerCallback;
}

- (void)setOnMarkerCallback:(id)a3
{
}

- (id)onSpeechStartCallback
{
  return self->_onSpeechStartCallback;
}

- (void)setOnSpeechStartCallback:(id)a3
{
}

- (double)speakingRate
{
  return self->_speakingRate;
}

- (void)setSpeakingRate:(double)a3
{
  self->_speakingRate = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (int64_t)wordCallbackPostProcessedOffset
{
  return self->_wordCallbackPostProcessedOffset;
}

- (void)setWordCallbackPostProcessedOffset:(int64_t)a3
{
  self->_wordCallbackPostProcessedOffset = a3;
}

- (NSString)finalSpokenString
{
  return self->_finalSpokenString;
}

- (void)setFinalSpokenString:(id)a3
{
}

- (NSString)processedString
{
  return self->_processedString;
}

- (void)setProcessedString:(id)a3
{
}

- (_TtC12TextToSpeech10TaggedSSML)taggedSSML
{
  return self->_taggedSSML;
}

- (void)setTaggedSSML:(id)a3
{
}

- (unint64_t)currentSSMLSnippetIndex
{
  return self->_currentSSMLSnippetIndex;
}

- (void)setCurrentSSMLSnippetIndex:(unint64_t)a3
{
  self->_currentSSMLSnippetIndex = a3;
}

- (NSMutableArray)emojiRangeReplacements
{
  return self->_emojiRangeReplacements;
}

- (void)setEmojiRangeReplacements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiRangeReplacements, 0);
  objc_storeStrong((id *)&self->_taggedSSML, 0);
  objc_storeStrong((id *)&self->_processedString, 0);
  objc_storeStrong((id *)&self->_finalSpokenString, 0);
  objc_storeStrong((id *)&self->_ssmlRepresentation, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong(&self->_markerCallback, 0);
  objc_storeStrong(&self->_audioBufferCallback, 0);
  objc_storeStrong((id *)&self->_voiceSelection, 0);
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
  objc_storeStrong(&self->_onMarkerCallback, 0);
  objc_storeStrong(&self->_onSpeechStartCallback, 0);
  objc_storeStrong(&self->_onWillSpeakRangeCallback, 0);
  objc_storeStrong(&self->_onResumeCallback, 0);
  objc_storeStrong(&self->_onPauseCallback, 0);
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end