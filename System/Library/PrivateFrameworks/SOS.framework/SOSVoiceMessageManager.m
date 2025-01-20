@interface SOSVoiceMessageManager
+ (id)_messageStringKeyForMessageType:(int64_t)a3;
- (NSString)messageKey;
- (SOSVoiceMessageManager)init;
- (SOSVoiceMessageManager)initWithMessageKey:(id)a3;
- (SOSVoiceMessageManager)initWithMessageType:(int64_t)a3;
- (SOSVoiceUtterer)voiceUtterer;
- (id)utterances;
- (id)voiceLanguage;
- (void)_playUtterances:(id)a3;
- (void)dealloc;
- (void)playMessage;
- (void)setMessageKey:(id)a3;
- (void)setVoiceUtterer:(id)a3;
- (void)startMessagePlayback;
- (void)stopMessagePlayback;
@end

@implementation SOSVoiceMessageManager

- (SOSVoiceMessageManager)initWithMessageKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOSVoiceMessageManager;
  v6 = [(SOSVoiceMessageManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageKey, a3);
  }

  return v7;
}

- (SOSVoiceMessageManager)init
{
  return 0;
}

- (void)dealloc
{
  [(SOSVoiceMessageManager *)self stopMessagePlayback];
  v3.receiver = self;
  v3.super_class = (Class)SOSVoiceMessageManager;
  [(SOSVoiceMessageManager *)&v3 dealloc];
}

- (SOSVoiceMessageManager)initWithMessageType:(int64_t)a3
{
  v4 = [(id)objc_opt_class() _messageStringKeyForMessageType:a3];
  id v5 = [(SOSVoiceMessageManager *)self initWithMessageKey:v4];

  return v5;
}

- (void)startMessagePlayback
{
  if (+[SOSUtilities shouldSilenceSOSFlow])
  {
    objc_super v3 = sos_voice_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOS flow silenced so not playing voice message", v4, 2u);
    }
  }
  else
  {
    [(SOSVoiceMessageManager *)self playMessage];
  }
}

- (void)playMessage
{
  objc_super v3 = sos_voice_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "playMessage", v5, 2u);
  }

  v4 = [(SOSVoiceMessageManager *)self utterances];
  [(SOSVoiceMessageManager *)self _playUtterances:v4];
}

- (void)_playUtterances:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sos_voice_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Playing utterances: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(SOSVoiceMessageManager *)self voiceUtterer];
  [v6 speakUtterances:v4];
}

- (void)stopMessagePlayback
{
  objc_super v3 = sos_voice_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "Stopping voice message...", v4, 2u);
  }

  [(SOSVoiceUtterer *)self->_voiceUtterer stopSpeaking];
}

- (SOSVoiceUtterer)voiceUtterer
{
  voiceUtterer = self->_voiceUtterer;
  if (!voiceUtterer)
  {
    id v4 = objc_alloc_init(SOSVoiceUtterer);
    id v5 = self->_voiceUtterer;
    self->_voiceUtterer = v4;

    voiceUtterer = self->_voiceUtterer;
  }

  return voiceUtterer;
}

+ (id)_messageStringKeyForMessageType:(int64_t)a3
{
  if (a3 > 102)
  {
    if (a3 == 201) {
      return @"SOS_CHECKIN_SPEECH_KAPPA";
    }
    if (a3 == 103) {
      return @"SOS_VOICEMESSAGE_SPEECH_RELEASE_TO_CALL";
    }
  }
  else
  {
    if (a3 == 101) {
      return @"SOS_VOICEMESSAGE_SPEECH_CALL_BUFFER";
    }
    if (a3 == 102) {
      return @"SOS_VOICEMESSAGE_SPEECH_RELEASE_TO_CALL_INITIAL";
    }
  }
  id v5 = sos_voice_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SOSVoiceMessageManager _messageStringKeyForMessageType:](a3, v5);
  }

  return 0;
}

- (id)utterances
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [SOSVoiceUtterance alloc];
  id v4 = [(SOSVoiceMessageManager *)self messageKey];
  id v5 = [(SOSVoiceMessageManager *)self voiceLanguage];
  v6 = [(SOSVoiceUtterance *)v3 initWithMessageKey:v4 voiceLanguage:v5];
  v9[0] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (id)voiceLanguage
{
  return 0;
}

- (void)setVoiceUtterer:(id)a3
{
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (void)setMessageKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageKey, 0);

  objc_storeStrong((id *)&self->_voiceUtterer, 0);
}

+ (void)_messageStringKeyForMessageType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "_messageStringKeyForReason - Unexpected messageType: %ld", (uint8_t *)&v2, 0xCu);
}

@end