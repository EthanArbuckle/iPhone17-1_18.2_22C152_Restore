@interface TTSSpeechRequest
+ (BOOL)supportsSecureCoding;
- (AVSpeechSynthesisProviderVoice)synthesisProviderVoice;
- (BOOL)audioSessionIDIsValid;
- (BOOL)maintainsInput;
- (BOOL)sentSpeechDone;
- (BOOL)synthesizeSilently;
- (NSArray)channels;
- (NSDictionary)voiceSettings;
- (NSString)jobIdentifier;
- (NSString)languageCode;
- (NSString)text;
- (OS_voucher)voucher;
- (TTSSpeechRequest)initWithCoder:(id)a3;
- (TTSSpeechString)speechString;
- (TTSSpeechString)unescapedSpeechString;
- (TTSSpeechVoice)voice;
- (double)dispatchTime;
- (double)handledTime;
- (double)latency;
- (double)pitch;
- (double)rate;
- (double)volume;
- (id)audioBufferCallback;
- (id)delegate;
- (id)description;
- (id)latencyCallback;
- (int64_t)gender;
- (unint64_t)synthesizerInstanceID;
- (unsigned)audioQueueFlags;
- (unsigned)audioSessionID;
- (void)clientContext;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioBufferCallback:(id)a3;
- (void)setAudioQueueFlags:(unsigned int)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setAudioSessionIDIsValid:(BOOL)a3;
- (void)setChannels:(id)a3;
- (void)setClientContext:(void *)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchTime:(double)a3;
- (void)setGender:(int64_t)a3;
- (void)setHandledTime:(double)a3;
- (void)setJobIdentifier:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLatency:(double)a3;
- (void)setLatencyCallback:(id)a3;
- (void)setMaintainsInput:(BOOL)a3;
- (void)setPitch:(double)a3;
- (void)setRate:(double)a3;
- (void)setSentSpeechDone:(BOOL)a3;
- (void)setSpeechString:(id)a3;
- (void)setSynthesisProviderVoice:(id)a3;
- (void)setSynthesizeSilently:(BOOL)a3;
- (void)setSynthesizerInstanceID:(unint64_t)a3;
- (void)setUnescapedSpeechString:(id)a3;
- (void)setVoice:(id)a3;
- (void)setVoiceSettings:(id)a3;
- (void)setVolume:(double)a3;
- (void)setVoucher:(id)a3;
- (void)speechRequestDidContinueForService:(id)a3;
- (void)speechRequestDidPauseForService:(id)a3;
- (void)speechRequestDidStartForService:(id)a3;
- (void)speechRequestDidStopWithSuccess:(BOOL)a3 phonemesSpoken:(id)a4 forService:(id)a5 error:(id)a6;
- (void)speechRequestMarker:(id)a3 didStartForService:(id)a4;
@end

@implementation TTSSpeechRequest

- (NSString)text
{
  v5 = objc_msgSend_speechString(self, a2, v2, v3, v4);
  v10 = objc_msgSend_defrostedTransformedString(v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSNumber;
  v10 = objc_msgSend_text(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_length(v10, v11, v12, v13, v14);
  v19 = objc_msgSend_numberWithUnsignedInteger_(v5, v16, v15, v17, v18);
  languageCode = self->_languageCode;
  v25 = objc_msgSend_voice(self, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_footprint(v25, v26, v27, v28, v29);
  if ((unint64_t)(v30 - 1) > 4) {
    objc_msgSend_stringWithFormat_(v3, v31, @"[%@ %p] %@ language: %@ footprint: %@ rate: %lf pitch: %lf volume: %lf", v32, v33, v4, self, v19, languageCode, 0, *(void *)&self->_rate, *(void *)&self->_pitch, *(void *)&self->_volume);
  }
  else {
  v34 = objc_msgSend_stringWithFormat_(v3, v31, @"[%@ %p] %@ language: %@ footprint: %@ rate: %lf pitch: %lf volume: %lf", v32, v33, v4, self, v19, languageCode, off_1E5C6A440[v30 - 1], *(void *)&self->_rate, *(void *)&self->_pitch, *(void *)&self->_volume);
  }

  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  jobIdentifier = self->_jobIdentifier;
  id v32 = a3;
  objc_msgSend_encodeObject_forKey_(v32, v5, (uint64_t)jobIdentifier, @"jobIdentifier", v6);
  objc_msgSend_encodeObject_forKey_(v32, v7, (uint64_t)self->_languageCode, @"languageCode", v8);
  objc_msgSend_encodeObject_forKey_(v32, v9, (uint64_t)self->_voice, @"voice", v10);
  objc_msgSend_encodeInteger_forKey_(v32, v11, self->_gender, @"gender", v12);
  objc_msgSend_encodeDouble_forKey_(v32, v13, @"rate", v14, v15, self->_rate);
  objc_msgSend_encodeDouble_forKey_(v32, v16, @"pitch", v17, v18, self->_pitch);
  objc_msgSend_encodeDouble_forKey_(v32, v19, @"volume", v20, v21, self->_volume);
  objc_msgSend_encodeBool_forKey_(v32, v22, self->_maintainsInput, @"maintainsInput", v23);
  objc_msgSend_encodeBool_forKey_(v32, v24, self->_audioSessionIDIsValid, @"audioSessionIDIsValid", v25);
  objc_msgSend_encodeInt32_forKey_(v32, v26, self->_audioSessionID, @"audioSessionID", v27);
  objc_msgSend_encodeInt32_forKey_(v32, v28, self->_audioQueueFlags, @"audioQueueFlags", v29);
  objc_msgSend_encodeObject_forKey_(v32, v30, (uint64_t)self->_synthesisProviderVoice, @"synthesisProviderVoice", v31);
}

- (TTSSpeechRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)TTSSpeechRequest;
  v5 = [(TTSSpeechRequest *)&v91 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"languageCode", v8);
    objc_msgSend_setLanguageCode_(v5, v10, (uint64_t)v9, v11, v12);

    uint64_t v13 = objc_opt_class();
    v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"voice", v15);
    objc_msgSend_setVoice_(v5, v17, (uint64_t)v16, v18, v19);

    uint64_t v20 = objc_opt_class();
    uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"jobIdentifier", v22);
    objc_msgSend_setJobIdentifier_(v5, v24, (uint64_t)v23, v25, v26);

    uint64_t v30 = objc_msgSend_decodeIntegerForKey_(v4, v27, @"gender", v28, v29);
    objc_msgSend_setGender_(v5, v31, v30, v32, v33);
    objc_msgSend_decodeDoubleForKey_(v4, v34, @"rate", v35, v36);
    objc_msgSend_setRate_(v5, v37, v38, v39, v40);
    objc_msgSend_decodeDoubleForKey_(v4, v41, @"pitch", v42, v43);
    objc_msgSend_setPitch_(v5, v44, v45, v46, v47);
    objc_msgSend_decodeDoubleForKey_(v4, v48, @"volume", v49, v50);
    objc_msgSend_setVolume_(v5, v51, v52, v53, v54);
    uint64_t v58 = objc_msgSend_decodeBoolForKey_(v4, v55, @"maintainsInput", v56, v57);
    objc_msgSend_setMaintainsInput_(v5, v59, v58, v60, v61);
    uint64_t v65 = objc_msgSend_decodeBoolForKey_(v4, v62, @"audioSessionIDIsValid", v63, v64);
    objc_msgSend_setAudioSessionIDIsValid_(v5, v66, v65, v67, v68);
    uint64_t v72 = objc_msgSend_decodeInt32ForKey_(v4, v69, @"audioSessionID", v70, v71);
    objc_msgSend_setAudioSessionID_(v5, v73, v72, v74, v75);
    uint64_t v79 = objc_msgSend_decodeInt32ForKey_(v4, v76, @"audioQueueFlags", v77, v78);
    objc_msgSend_setAudioQueueFlags_(v5, v80, v79, v81, v82);
    uint64_t v83 = objc_opt_class();
    v86 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, @"synthesisProviderVoice", v85);
    objc_msgSend_setSynthesisProviderVoice_(v5, v87, (uint64_t)v86, v88, v89);
  }
  return v5;
}

- (void)speechRequestDidStartForService:(id)a3
{
  id v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequestDidStart_forService_(v11, v9, (uint64_t)self, (uint64_t)v4, v10);
}

- (void)speechRequestDidPauseForService:(id)a3
{
  id v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequestDidPause_forService_(v11, v9, (uint64_t)self, (uint64_t)v4, v10);
}

- (void)speechRequestDidContinueForService:(id)a3
{
  id v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequestDidContinue_forService_(v11, v9, (uint64_t)self, (uint64_t)v4, v10);
}

- (void)speechRequestMarker:(id)a3 didStartForService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequest_withMarker_didStartForService_(v13, v12, (uint64_t)self, (uint64_t)v7, (uint64_t)v6);
}

- (void)speechRequestDidStopWithSuccess:(BOOL)a3 phonemesSpoken:(id)a4 forService:(id)a5 error:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_msgSend_sentSpeechDone(self, v13, v14, v15, v16))
  {
    uint64_t v21 = AXTTSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1A688F3E4((uint64_t)self, v21);
    }
  }
  else
  {
    uint64_t v22 = objc_msgSend_delegate(self, v17, v18, v19, v20);
    objc_msgSend_speechRequest_didStopWithSuccess_phonemesSpoken_forService_error_(v22, v23, (uint64_t)self, v8, (uint64_t)v10, v11, v12);

    objc_msgSend_setSentSpeechDone_(self, v24, 1, v25, v26);
  }
}

- (NSString)jobIdentifier
{
  return self->_jobIdentifier;
}

- (void)setJobIdentifier:(id)a3
{
}

- (TTSSpeechVoice)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
}

- (TTSSpeechString)speechString
{
  return self->_speechString;
}

- (void)setSpeechString:(id)a3
{
}

- (TTSSpeechString)unescapedSpeechString
{
  return self->_unescapedSpeechString;
}

- (void)setUnescapedSpeechString:(id)a3
{
}

- (AVSpeechSynthesisProviderVoice)synthesisProviderVoice
{
  return self->_synthesisProviderVoice;
}

- (void)setSynthesisProviderVoice:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (double)rate
{
  return self->_rate;
}

- (void)setRate:(double)a3
{
  self->_rate = a3;
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

- (BOOL)maintainsInput
{
  return self->_maintainsInput;
}

- (void)setMaintainsInput:(BOOL)a3
{
  self->_maintainsInput = a3;
}

- (BOOL)audioSessionIDIsValid
{
  return self->_audioSessionIDIsValid;
}

- (void)setAudioSessionIDIsValid:(BOOL)a3
{
  self->_audioSessionIDIsValid = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (unsigned)audioQueueFlags
{
  return self->_audioQueueFlags;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  self->_audioQueueFlags = a3;
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (double)dispatchTime
{
  return self->_dispatchTime;
}

- (void)setDispatchTime:(double)a3
{
  self->_dispatchTime = a3;
}

- (double)handledTime
{
  return self->_handledTime;
}

- (void)setHandledTime:(double)a3
{
  self->_handledTime = a3;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (unint64_t)synthesizerInstanceID
{
  return self->_synthesizerInstanceID;
}

- (void)setSynthesizerInstanceID:(unint64_t)a3
{
  self->_synthesizerInstanceID = a3;
}

- (void)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(void *)a3
{
  self->_clientContext = a3;
}

- (id)audioBufferCallback
{
  return self->_audioBufferCallback;
}

- (void)setAudioBufferCallback:(id)a3
{
}

- (id)latencyCallback
{
  return self->_latencyCallback;
}

- (void)setLatencyCallback:(id)a3
{
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

- (NSDictionary)voiceSettings
{
  return self->_voiceSettings;
}

- (void)setVoiceSettings:(id)a3
{
}

- (BOOL)sentSpeechDone
{
  return self->_sentSpeechDone;
}

- (void)setSentSpeechDone:(BOOL)a3
{
  self->_sentSpeechDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSettings, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong(&self->_latencyCallback, 0);
  objc_storeStrong(&self->_audioBufferCallback, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_synthesisProviderVoice, 0);
  objc_storeStrong((id *)&self->_unescapedSpeechString, 0);
  objc_storeStrong((id *)&self->_speechString, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_jobIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end