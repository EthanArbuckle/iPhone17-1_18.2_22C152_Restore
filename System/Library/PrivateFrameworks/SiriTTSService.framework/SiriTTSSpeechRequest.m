@interface SiriTTSSpeechRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)disableCompactVoice;
- (BOOL)immediate;
- (BOOL)minimizeDeviceUsage;
- (BOOL)privacySensitive;
- (BOOL)whisper;
- (NSString)description;
- (SiriTTSAudibleContext)audibleContext;
- (SiriTTSSpeechRequest)init;
- (SiriTTSSpeechRequest)initWithCoder:(id)a3;
- (SiriTTSSpeechRequest)initWithText:(id)a3 voice:(id)a4;
- (SiriTTSSynthesisContext)synthesisContext;
- (float)pitch;
- (float)playbackVolume;
- (float)rate;
- (float)volume;
- (id)contextInfo;
- (id)customResourceURLs;
- (id)didGenerateAudio;
- (id)didGenerateWordTimings;
- (id)didStartSpeaking;
- (id)prosodyProperties;
- (id)siriAceViewId;
- (id)siriRequestId;
- (id)text;
- (id)voice;
- (int64_t)synthesisProfile;
- (unsigned)audioSessionId;
- (void)encodeWithCoder:(id)a3;
- (void)setAudibleContext:(id)a3;
- (void)setAudioSessionId:(unsigned int)a3;
- (void)setContextInfo:(id)a3;
- (void)setCustomResourceURLs:(id)a3;
- (void)setDidGenerateAudio:(id)a3;
- (void)setDidGenerateWordTimings:(id)a3;
- (void)setDidStartSpeaking:(id)a3;
- (void)setDisableCompactVoice:(BOOL)a3;
- (void)setImmediate:(BOOL)a3;
- (void)setMinimizeDeviceUsage:(BOOL)a3;
- (void)setPitch:(float)a3;
- (void)setPlaybackVolume:(float)a3;
- (void)setPrivacySensitive:(BOOL)a3;
- (void)setProsodyProperties:(id)a3;
- (void)setRate:(float)a3;
- (void)setSiriAceViewId:(id)a3;
- (void)setSiriRequestId:(id)a3;
- (void)setSynthesisContext:(id)a3;
- (void)setSynthesisProfile:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setVoice:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWhisper:(BOOL)a3;
@end

@implementation SiriTTSSpeechRequest

- (SiriTTSAudibleContext)audibleContext
{
  id v2 = sub_19CDD4AB8();
  return (SiriTTSAudibleContext *)v2;
}

- (void)setAudibleContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD4B64(v4);
}

- (SiriTTSSynthesisContext)synthesisContext
{
  id v2 = sub_19CDD4C18();
  return (SiriTTSSynthesisContext *)v2;
}

- (void)setSynthesisContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD4CC4(v4);
}

- (SiriTTSSpeechRequest)initWithText:(id)a3 voice:(id)a4
{
  return (SiriTTSSpeechRequest *)sub_19CDD4E24((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))SpeechRequest.init(text:voice:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD4E90(v4);
}

- (SiriTTSSpeechRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  SpeechRequest.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19CDD5100(self);
}

- (SiriTTSSpeechRequest)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSSpeechRequest_synthesisContext);
}

- (void)setWhisper:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v4 setWhisper:v3];
}

- (BOOL)whisper
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 whisper];

  return v3;
}

- (void)setDidGenerateWordTimings:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v5 setDidGenerateWordTimings:v4];
}

- (id)didGenerateWordTimings
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 didGenerateWordTimings];

  return v3;
}

- (void)setDidGenerateAudio:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v5 setDidGenerateAudio:v4];
}

- (id)didGenerateAudio
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 didGenerateAudio];

  return v3;
}

- (void)setProsodyProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v5 setProsodyProperties:v4];
}

- (id)prosodyProperties
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 prosodyProperties];

  return v3;
}

- (void)setSynthesisProfile:(int64_t)a3
{
  id v4 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v4 setSynthesisProfile:a3];
}

- (int64_t)synthesisProfile
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  int64_t v3 = [v2 synthesisProfile];

  return v3;
}

- (void)setDisableCompactVoice:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v4 setDisableCompactVoice:v3];
}

- (BOOL)disableCompactVoice
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 disableCompactVoice];

  return v3;
}

- (void)setCustomResourceURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v5 setCustomResourceURLs:v4];
}

- (id)customResourceURLs
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 customResourceURLs];

  return v3;
}

- (void)setVolume:(float)a3
{
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  *(float *)&double v4 = a3;
  [v5 setVolume:v4];
}

- (float)volume
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)setPitch:(float)a3
{
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  *(float *)&double v4 = a3;
  [v5 setPitch:v4];
}

- (float)pitch
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v2 pitch];
  float v4 = v3;

  return v4;
}

- (void)setRate:(float)a3
{
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  *(float *)&double v4 = a3;
  [v5 setRate:v4];
}

- (float)rate
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v2 rate];
  float v4 = v3;

  return v4;
}

- (void)setContextInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v5 setContextInfo:v4];
}

- (id)contextInfo
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  float v3 = [v2 contextInfo];

  return v3;
}

- (void)setMinimizeDeviceUsage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v4 setMinimizeDeviceUsage:v3];
}

- (BOOL)minimizeDeviceUsage
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 minimizeDeviceUsage];

  return v3;
}

- (void)setPrivacySensitive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v4 setPrivacySensitive:v3];
}

- (BOOL)privacySensitive
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 privacySensitive];

  return v3;
}

- (void)setVoice:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v5 setVoice:v4];
}

- (id)voice
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 voice];

  return v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self synthesisContext];
  [v5 setText:v4];
}

- (id)text
{
  id v2 = [(SiriTTSSpeechRequest *)self synthesisContext];
  char v3 = [v2 text];

  return v3;
}

- (void)setSiriAceViewId:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SiriTTSBaseRequest *)self setInteractionLinkId:v4];
  }
}

- (id)siriAceViewId
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [(SiriTTSBaseRequest *)self interactionLinkId];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (void)setSiriRequestId:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SiriTTSBaseRequest *)self setLogLinkId:v4];
  }
}

- (id)siriRequestId
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [(SiriTTSBaseRequest *)self logLinkId];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (void)setDidStartSpeaking:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSSpeechRequest *)self audibleContext];
  [v5 setDidStartSpeaking:v4];
}

- (id)didStartSpeaking
{
  id v2 = [(SiriTTSSpeechRequest *)self audibleContext];
  char v3 = [v2 didStartSpeaking];

  return v3;
}

- (void)setPlaybackVolume:(float)a3
{
  id v5 = [(SiriTTSSpeechRequest *)self audibleContext];
  *(float *)&double v4 = a3;
  [v5 setPlaybackVolume:v4];
}

- (float)playbackVolume
{
  id v2 = [(SiriTTSSpeechRequest *)self audibleContext];
  [v2 playbackVolume];
  float v4 = v3;

  return v4;
}

- (void)setImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSSpeechRequest *)self audibleContext];
  [v4 setImmediate:v3];
}

- (BOOL)immediate
{
  id v2 = [(SiriTTSSpeechRequest *)self audibleContext];
  char v3 = [v2 immediate];

  return v3;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SiriTTSSpeechRequest *)self audibleContext];
  [v4 setAudioSessionId:v3];
}

- (unsigned)audioSessionId
{
  id v2 = [(SiriTTSSpeechRequest *)self audibleContext];
  unsigned int v3 = [v2 audioSessionId];

  return v3;
}

@end