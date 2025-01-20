@interface SiriTTSAudibleContext
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)immediate;
- (SiriTTSAudibleContext)init;
- (SiriTTSAudibleContext)initWithCoder:(id)a3;
- (float)playbackVolume;
- (id)didStartSpeaking;
- (unsigned)audioSessionId;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioSessionId:(unsigned int)a3;
- (void)setDidStartSpeaking:(id)a3;
- (void)setImmediate:(BOOL)a3;
- (void)setPlaybackVolume:(float)a3;
@end

@implementation SiriTTSAudibleContext

- (unsigned)audioSessionId
{
  return sub_19CDCB320();
}

- (void)setAudioSessionId:(unsigned int)a3
{
}

- (BOOL)immediate
{
  return sub_19CDCB430() & 1;
}

- (void)setImmediate:(BOOL)a3
{
}

- (id)didStartSpeaking
{
  uint64_t v2 = sub_19CDCB5C0();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_19CD9E20C;
    v6[3] = &block_descriptor_459;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setDidStartSpeaking:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_19CDDD4F4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_19CDCB688((uint64_t)v4, v5);
}

- (float)playbackVolume
{
  return sub_19CDCB814();
}

- (void)setPlaybackVolume:(float)a3
{
}

- (SiriTTSAudibleContext)init
{
  return (SiriTTSAudibleContext *)AudibleContext.init()();
}

+ (BOOL)supportsSecureCoding
{
  return static AudibleContext.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_19CDCBAE8(v4);
}

- (SiriTTSAudibleContext)initWithCoder:(id)a3
{
  return (SiriTTSAudibleContext *)AudibleContext.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end