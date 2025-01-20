@interface SOSVoiceUtterer
- (AVSpeechSynthesizer)voiceSynthesizer;
- (BOOL)isSpeaking;
- (BOOL)mixToTelephonyUplink;
- (NSArray)avUtterancesBeingSpoken;
- (NSArray)sosUtterancesBeingSpoken;
- (NSString)description;
- (SOSVoiceUttererDelegate)delegate;
- (id)routeDescription;
- (void)_forgetUtterancesBeingSpoken;
- (void)_speakAVUtterance:(id)a3;
- (void)_speakUtteranceAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setAvUtterancesBeingSpoken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMixToTelephonyUplink:(BOOL)a3;
- (void)setSosUtterancesBeingSpoken:(id)a3;
- (void)setVoiceSynthesizer:(id)a3;
- (void)speakUtterances:(id)a3;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)stopSpeaking;
@end

@implementation SOSVoiceUtterer

- (void)dealloc
{
  [(SOSVoiceUtterer *)self stopSpeaking];
  [(AVSpeechSynthesizer *)self->_voiceSynthesizer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SOSVoiceUtterer;
  [(SOSVoiceUtterer *)&v3 dealloc];
}

- (void)speakUtterances:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = sos_voice_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(SOSVoiceUtterer *)self routeDescription];
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Speaking utterances to %{public}@: %@", buf, 0x16u);
  }
  [(SOSVoiceUtterer *)self stopSpeaking];
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "avSpeechUtterance", (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if (v8)
  {
    objc_storeStrong((id *)&self->_sosUtterancesBeingSpoken, a3);
    objc_storeStrong((id *)&self->_avUtterancesBeingSpoken, v8);
    [(SOSVoiceUtterer *)self _speakUtteranceAtIndex:0];
  }
  else
  {
    v15 = sos_voice_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SOSVoiceUtterer speakUtterances:]((uint64_t)v9, v15);
    }
  }
}

- (void)stopSpeaking
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_voice_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(SOSVoiceUtterer *)self routeDescription];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "Stopping speaking utterances to %{public}@...", (uint8_t *)&v5, 0xCu);
  }
  [(SOSVoiceUtterer *)self _forgetUtterancesBeingSpoken];
  [(AVSpeechSynthesizer *)self->_voiceSynthesizer stopSpeakingAtBoundary:0];
}

- (void)_forgetUtterancesBeingSpoken
{
  sosUtterancesBeingSpoken = self->_sosUtterancesBeingSpoken;
  self->_sosUtterancesBeingSpoken = 0;

  avUtterancesBeingSpoken = self->_avUtterancesBeingSpoken;
  self->_avUtterancesBeingSpoken = 0;
}

- (BOOL)isSpeaking
{
  return [(NSArray *)self->_avUtterancesBeingSpoken count] != 0;
}

- (void)setMixToTelephonyUplink:(BOOL)a3
{
  self->_mixToTelephonyUplink = a3;
  -[AVSpeechSynthesizer setMixToTelephonyUplink:](self->_voiceSynthesizer, "setMixToTelephonyUplink:");
}

- (AVSpeechSynthesizer)voiceSynthesizer
{
  voiceSynthesizer = self->_voiceSynthesizer;
  if (!voiceSynthesizer)
  {
    v4 = (AVSpeechSynthesizer *)objc_alloc_init(MEMORY[0x1E4F15480]);
    int v5 = self->_voiceSynthesizer;
    self->_voiceSynthesizer = v4;

    [(AVSpeechSynthesizer *)self->_voiceSynthesizer setDelegate:self];
    [(AVSpeechSynthesizer *)self->_voiceSynthesizer setUsesApplicationAudioSession:0];
    [(AVSpeechSynthesizer *)self->_voiceSynthesizer setMixToTelephonyUplink:[(SOSVoiceUtterer *)self mixToTelephonyUplink]];
    voiceSynthesizer = self->_voiceSynthesizer;
  }

  return voiceSynthesizer;
}

- (void)_speakAVUtterance:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = sos_voice_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(SOSVoiceUtterer *)self routeDescription];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Speaking avUtterance in %{public}@ audio: %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(SOSVoiceUtterer *)self voiceSynthesizer];
  [v7 speakUtterance:v4];
}

- (void)_speakUtteranceAtIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_avUtterancesBeingSpoken = &self->_avUtterancesBeingSpoken;
  unint64_t v6 = [(NSArray *)self->_avUtterancesBeingSpoken count];
  uint64_t v7 = sos_voice_log();
  int v8 = v7;
  if (v6 <= a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(SOSVoiceUtterer *)(id *)p_avUtterancesBeingSpoken _speakUtteranceAtIndex:v8];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(NSArray *)*p_avUtterancesBeingSpoken count];
      int v13 = 134218240;
      unint64_t v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "_speakUtteranceAtIndex:%tu / %tu", (uint8_t *)&v13, 0x16u);
    }

    __int16 v10 = [(SOSVoiceUtterer *)self delegate];

    if (v10)
    {
      id v11 = [(SOSVoiceUtterer *)self delegate];
      uint64_t v12 = [(SOSVoiceUtterer *)self sosUtterancesBeingSpoken];
      [v11 voiceUtterer:self willStartSpeakingUtteranceAtIndex:a3 fromUtterances:v12];
    }
    int v8 = [(NSArray *)self->_avUtterancesBeingSpoken objectAtIndexedSubscript:a3];
    [(SOSVoiceUtterer *)self _speakAVUtterance:v8];
  }
}

- (id)routeDescription
{
  if ([(SOSVoiceUtterer *)self mixToTelephonyUplink]) {
    v2 = @"[call uplink]";
  }
  else {
    v2 = @"[local speaker]";
  }

  return v2;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(SOSVoiceUtterer *)self routeDescription];
  unint64_t v6 = [v3 stringWithFormat:@"<%@ %p route=%@ _voiceSynthesizer=%@", v4, self, v5, self->_voiceSynthesizer];

  return (NSString *)v6;
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v5 = (SOSVoiceUtterer *)a4;
  NSUInteger v6 = [(NSArray *)self->_avUtterancesBeingSpoken indexOfObject:v5];
  uint64_t v7 = sos_voice_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    avUtterancesBeingSpoken = self->_avUtterancesBeingSpoken;
    int v18 = 138412802;
    long long v19 = v5;
    __int16 v20 = 2112;
    NSUInteger v21 = (NSUInteger)avUtterancesBeingSpoken;
    __int16 v22 = 2114;
    __int16 v23 = self;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_INFO, "didFinishSpeechUtterance, utterance:%@, _avUtterancesBeingSpoken:%@ [%{public}@]", (uint8_t *)&v18, 0x20u);
  }

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = sos_voice_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = self->_avUtterancesBeingSpoken;
      int v18 = 138412802;
      long long v19 = v5;
      __int16 v20 = 2112;
      NSUInteger v21 = (NSUInteger)v10;
      __int16 v22 = 2114;
      __int16 v23 = self;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance, utteranceIndex not found => NOP; utterance:%@, _avUtterancesBeingSpoken:%@ [%{public}@]",
        (uint8_t *)&v18,
        0x20u);
    }
LABEL_17:

    goto LABEL_18;
  }
  unint64_t v11 = [(NSArray *)self->_avUtterancesBeingSpoken count];
  uint64_t v12 = sos_voice_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6 + 1 >= v11)
  {
    if (v13)
    {
      int v18 = 138543362;
      long long v19 = self;
      _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance called, completed utterances [%{public}@]", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v9 = [(SOSVoiceUtterer *)self sosUtterancesBeingSpoken];
    [(SOSVoiceUtterer *)self _forgetUtterancesBeingSpoken];
    __int16 v15 = [(SOSVoiceUtterer *)self delegate];

    if (v15)
    {
      uint64_t v16 = sos_voice_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        long long v19 = self;
        _os_log_impl(&dword_1B3A94000, v16, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance called, completed utterances; notifying delegate [%{public}@]",
          (uint8_t *)&v18,
          0xCu);
      }

      uint64_t v17 = [(SOSVoiceUtterer *)self delegate];
      [v17 voiceUtterer:self didFinishSpeakingUtterances:v9];
    }
    goto LABEL_17;
  }
  if (v13)
  {
    NSUInteger v14 = [(NSArray *)self->_avUtterancesBeingSpoken count];
    int v18 = 134218498;
    long long v19 = (SOSVoiceUtterer *)v6;
    __int16 v20 = 2048;
    NSUInteger v21 = v14;
    __int16 v22 = 2114;
    __int16 v23 = self;
    _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance, _avUtterancesBeingSpoken index: %lu out of: %lu [%{public}@]", (uint8_t *)&v18, 0x20u);
  }

  if (self->_voiceSynthesizer) {
    [(SOSVoiceUtterer *)self _speakUtteranceAtIndex:v6 + 1];
  }
LABEL_18:
}

- (SOSVoiceUttererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SOSVoiceUttererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)mixToTelephonyUplink
{
  return self->_mixToTelephonyUplink;
}

- (void)setVoiceSynthesizer:(id)a3
{
}

- (NSArray)sosUtterancesBeingSpoken
{
  return self->_sosUtterancesBeingSpoken;
}

- (void)setSosUtterancesBeingSpoken:(id)a3
{
}

- (NSArray)avUtterancesBeingSpoken
{
  return self->_avUtterancesBeingSpoken;
}

- (void)setAvUtterancesBeingSpoken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avUtterancesBeingSpoken, 0);
  objc_storeStrong((id *)&self->_sosUtterancesBeingSpoken, 0);
  objc_storeStrong((id *)&self->_voiceSynthesizer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)speakUtterances:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "No avUtterancesToSpeak; speakUtterances: %@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_speakUtteranceAtIndex:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 count];
  int v6 = 134218240;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1B3A94000, a3, OS_LOG_TYPE_ERROR, "_speakUtteranceAtIndex asked to use out of range index:%tu of %tu", (uint8_t *)&v6, 0x16u);
}

@end