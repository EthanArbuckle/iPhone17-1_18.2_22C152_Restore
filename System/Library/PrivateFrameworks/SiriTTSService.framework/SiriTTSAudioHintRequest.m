@interface SiriTTSAudioHintRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)immediate;
- (BOOL)isValid;
- (BOOL)useCompactHints;
- (NSString)description;
- (SiriTTSAudibleContext)audibleContext;
- (SiriTTSAudioHintRequest)init;
- (SiriTTSAudioHintRequest)initWithCoder:(id)a3;
- (SiriTTSAudioHintRequest)initWithVoice:(id)a3 dialogNumber:(int64_t)a4 useCompactHints:(BOOL)a5;
- (SiriTTSSynthesisVoice)voice;
- (float)playbackVolume;
- (id)didStartSpeaking;
- (id)siriAceViewId;
- (id)siriRequestId;
- (int64_t)dialogNumber;
- (unsigned)audioSessionId;
- (void)encodeWithCoder:(id)a3;
- (void)setAudibleContext:(id)a3;
- (void)setAudioSessionId:(unsigned int)a3;
- (void)setDialogNumber:(int64_t)a3;
- (void)setDidStartSpeaking:(id)a3;
- (void)setImmediate:(BOOL)a3;
- (void)setPlaybackVolume:(float)a3;
- (void)setSiriAceViewId:(id)a3;
- (void)setSiriRequestId:(id)a3;
- (void)setUseCompactHints:(BOOL)a3;
- (void)setVoice:(id)a3;
@end

@implementation SiriTTSAudioHintRequest

- (SiriTTSAudibleContext)audibleContext
{
  id v2 = sub_19CDD6034();
  return (SiriTTSAudibleContext *)v2;
}

- (void)setAudibleContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD60E0(v4);
}

- (SiriTTSSynthesisVoice)voice
{
  id v2 = sub_19CDD6194();
  return (SiriTTSSynthesisVoice *)v2;
}

- (void)setVoice:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD6240(v4);
}

- (int64_t)dialogNumber
{
  return sub_19CDD6320();
}

- (void)setDialogNumber:(int64_t)a3
{
}

- (BOOL)useCompactHints
{
  return sub_19CDD6430() & 1;
}

- (void)setUseCompactHints:(BOOL)a3
{
}

- (SiriTTSAudioHintRequest)initWithVoice:(id)a3 dialogNumber:(int64_t)a4 useCompactHints:(BOOL)a5
{
  return (SiriTTSAudioHintRequest *)AudioHintRequest.init(voice:dialogNumber:useCompactHints:)(a3);
}

- (BOOL)isValid
{
  id v2 = self;
  BOOL v3 = sub_19CDD674C();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD67E4(v4);
}

- (SiriTTSAudioHintRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  AudioHintRequest.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD6AE8);
}

- (SiriTTSAudioHintRequest)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSAudioHintRequest_voice);
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
    id v3 = [(SiriTTSBaseRequest *)self interactionLinkId];
  }
  else
  {
    id v3 = 0;
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
    id v3 = [(SiriTTSBaseRequest *)self logLinkId];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)setDidStartSpeaking:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriTTSAudioHintRequest *)self audibleContext];
  [v5 setDidStartSpeaking:v4];
}

- (id)didStartSpeaking
{
  id v2 = [(SiriTTSAudioHintRequest *)self audibleContext];
  id v3 = [v2 didStartSpeaking];

  return v3;
}

- (void)setPlaybackVolume:(float)a3
{
  id v5 = [(SiriTTSAudioHintRequest *)self audibleContext];
  *(float *)&double v4 = a3;
  [v5 setPlaybackVolume:v4];
}

- (float)playbackVolume
{
  id v2 = [(SiriTTSAudioHintRequest *)self audibleContext];
  [v2 playbackVolume];
  float v4 = v3;

  return v4;
}

- (void)setImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSAudioHintRequest *)self audibleContext];
  [v4 setImmediate:v3];
}

- (BOOL)immediate
{
  id v2 = [(SiriTTSAudioHintRequest *)self audibleContext];
  char v3 = [v2 immediate];

  return v3;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SiriTTSAudioHintRequest *)self audibleContext];
  [v4 setAudioSessionId:v3];
}

- (unsigned)audioSessionId
{
  id v2 = [(SiriTTSAudioHintRequest *)self audibleContext];
  unsigned int v3 = [v2 audioSessionId];

  return v3;
}

@end