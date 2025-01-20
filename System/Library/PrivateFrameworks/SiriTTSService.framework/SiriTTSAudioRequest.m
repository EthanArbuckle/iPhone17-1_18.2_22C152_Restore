@interface SiriTTSAudioRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)immediate;
- (NSString)description;
- (SiriTTSAudibleContext)audibleContext;
- (SiriTTSAudioData)audio;
- (SiriTTSAudioRequest)init;
- (SiriTTSAudioRequest)initWithAudio:(id)a3;
- (SiriTTSAudioRequest)initWithCoder:(id)a3;
- (float)playbackVolume;
- (id)didStartSpeaking;
- (id)siriAceViewId;
- (id)siriRequestId;
- (unsigned)audioSessionId;
- (void)encodeWithCoder:(id)a3;
- (void)setAudibleContext:(id)a3;
- (void)setAudioSessionId:(unsigned int)a3;
- (void)setDidStartSpeaking:(id)a3;
- (void)setImmediate:(BOOL)a3;
- (void)setPlaybackVolume:(float)a3;
- (void)setSiriAceViewId:(id)a3;
- (void)setSiriRequestId:(id)a3;
@end

@implementation SiriTTSAudioRequest

- (SiriTTSAudioData)audio
{
  id v2 = AudioRequest.audio.getter();
  return (SiriTTSAudioData *)v2;
}

- (SiriTTSAudibleContext)audibleContext
{
  id v2 = sub_19CDD3490();
  return (SiriTTSAudibleContext *)v2;
}

- (void)setAudibleContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD353C(v4);
}

- (SiriTTSAudioRequest)initWithAudio:(id)a3
{
  return (SiriTTSAudioRequest *)AudioRequest.init(audio:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD36B8();
}

- (SiriTTSAudioRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  AudioRequest.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD3904);
}

- (SiriTTSAudioRequest)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSAudioRequest_audibleContext);
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
  id v5 = [(SiriTTSAudioRequest *)self audibleContext];
  [v5 setDidStartSpeaking:v4];
}

- (id)didStartSpeaking
{
  id v2 = [(SiriTTSAudioRequest *)self audibleContext];
  id v3 = [v2 didStartSpeaking];

  return v3;
}

- (void)setPlaybackVolume:(float)a3
{
  id v5 = [(SiriTTSAudioRequest *)self audibleContext];
  *(float *)&double v4 = a3;
  [v5 setPlaybackVolume:v4];
}

- (float)playbackVolume
{
  id v2 = [(SiriTTSAudioRequest *)self audibleContext];
  [v2 playbackVolume];
  float v4 = v3;

  return v4;
}

- (void)setImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSAudioRequest *)self audibleContext];
  [v4 setImmediate:v3];
}

- (BOOL)immediate
{
  id v2 = [(SiriTTSAudioRequest *)self audibleContext];
  char v3 = [v2 immediate];

  return v3;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SiriTTSAudioRequest *)self audibleContext];
  [v4 setAudioSessionId:v3];
}

- (unsigned)audioSessionId
{
  id v2 = [(SiriTTSAudioRequest *)self audibleContext];
  unsigned int v3 = [v2 audioSessionId];

  return v3;
}

@end