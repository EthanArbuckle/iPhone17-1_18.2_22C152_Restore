@interface SiriTTSPreviewRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)immediate;
- (NSString)description;
- (NSURL)previewAudioURL;
- (SiriTTSAudibleContext)audibleContext;
- (SiriTTSPreviewRequest)init;
- (SiriTTSPreviewRequest)initWithCoder:(id)a3;
- (SiriTTSSynthesisVoice)voice;
- (float)playbackVolume;
- (id)didStartSpeaking;
- (id)siriAceViewId;
- (id)siriRequestId;
- (int64_t)previewType;
- (unsigned)audioSessionId;
- (void)encodeWithCoder:(id)a3;
- (void)setAudibleContext:(id)a3;
- (void)setAudioSessionId:(unsigned int)a3;
- (void)setDidStartSpeaking:(id)a3;
- (void)setImmediate:(BOOL)a3;
- (void)setPlaybackVolume:(float)a3;
- (void)setPreviewType:(int64_t)a3;
- (void)setSiriAceViewId:(id)a3;
- (void)setSiriRequestId:(id)a3;
- (void)setVoice:(id)a3;
@end

@implementation SiriTTSPreviewRequest

- (SiriTTSAudibleContext)audibleContext
{
  id v2 = sub_19CDD540C();
  return (SiriTTSAudibleContext *)v2;
}

- (void)setAudibleContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD54B8(v4);
}

- (SiriTTSSynthesisVoice)voice
{
  id v2 = sub_19CDD556C();
  return (SiriTTSSynthesisVoice *)v2;
}

- (void)setVoice:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD5618(v4);
}

- (int64_t)previewType
{
  return sub_19CDD56BC();
}

- (void)setPreviewType:(int64_t)a3
{
}

- (NSURL)previewAudioURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB534BB0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_19CDD59C0((uint64_t)v5);

  uint64_t v7 = sub_19CED4AE0();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_19CED4A50();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSURL *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD5B08(v4);
}

- (SiriTTSPreviewRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  PreviewRequest.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD5DB8);
}

- (SiriTTSPreviewRequest)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSPreviewRequest_voice);
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
  id v5 = [(SiriTTSPreviewRequest *)self audibleContext];
  [v5 setDidStartSpeaking:v4];
}

- (id)didStartSpeaking
{
  id v2 = [(SiriTTSPreviewRequest *)self audibleContext];
  id v3 = [v2 didStartSpeaking];

  return v3;
}

- (void)setPlaybackVolume:(float)a3
{
  id v5 = [(SiriTTSPreviewRequest *)self audibleContext];
  *(float *)&double v4 = a3;
  [v5 setPlaybackVolume:v4];
}

- (float)playbackVolume
{
  id v2 = [(SiriTTSPreviewRequest *)self audibleContext];
  [v2 playbackVolume];
  float v4 = v3;

  return v4;
}

- (void)setImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriTTSPreviewRequest *)self audibleContext];
  [v4 setImmediate:v3];
}

- (BOOL)immediate
{
  id v2 = [(SiriTTSPreviewRequest *)self audibleContext];
  char v3 = [v2 immediate];

  return v3;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SiriTTSPreviewRequest *)self audibleContext];
  [v4 setAudioSessionId:v3];
}

- (unsigned)audioSessionId
{
  id v2 = [(SiriTTSPreviewRequest *)self audibleContext];
  unsigned int v3 = [v2 audioSessionId];

  return v3;
}

@end