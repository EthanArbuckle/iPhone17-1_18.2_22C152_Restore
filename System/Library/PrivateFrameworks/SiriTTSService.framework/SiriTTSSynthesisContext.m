@interface SiriTTSSynthesisContext
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)disableCompactVoice;
- (BOOL)forceOspreyTTS;
- (BOOL)minimizeDeviceUsage;
- (BOOL)privacySensitive;
- (BOOL)whisper;
- (NSArray)customResourceURLs;
- (NSDictionary)contextInfo;
- (NSString)description;
- (NSString)text;
- (SiriTTSProsodyProperties)prosodyProperties;
- (SiriTTSSynthesisContext)init;
- (SiriTTSSynthesisContext)initWithCoder:(id)a3;
- (SiriTTSSynthesisVoice)voice;
- (float)pitch;
- (float)rate;
- (float)volume;
- (id)didGenerateAudio;
- (id)didGenerateWordTimings;
- (int64_t)synthesisProfile;
- (void)encodeWithCoder:(id)a3;
- (void)setContextInfo:(id)a3;
- (void)setCustomResourceURLs:(id)a3;
- (void)setDidGenerateAudio:(id)a3;
- (void)setDidGenerateWordTimings:(id)a3;
- (void)setDisableCompactVoice:(BOOL)a3;
- (void)setForceOspreyTTS:(BOOL)a3;
- (void)setMinimizeDeviceUsage:(BOOL)a3;
- (void)setPitch:(float)a3;
- (void)setPrivacySensitive:(BOOL)a3;
- (void)setProsodyProperties:(id)a3;
- (void)setRate:(float)a3;
- (void)setSynthesisProfile:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setVoice:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWhisper:(BOOL)a3;
@end

@implementation SiriTTSSynthesisContext

- (NSString)text
{
  return (NSString *)sub_19CD9FCF4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CDCD324);
}

- (void)setText:(id)a3
{
}

- (SiriTTSSynthesisVoice)voice
{
  id v2 = sub_19CDCD3D0();
  return (SiriTTSSynthesisVoice *)v2;
}

- (void)setVoice:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDCD47C(v4);
}

- (BOOL)privacySensitive
{
  return sub_19CDCD524() & 1;
}

- (void)setPrivacySensitive:(BOOL)a3
{
}

- (BOOL)minimizeDeviceUsage
{
  return sub_19CDCD634() & 1;
}

- (void)setMinimizeDeviceUsage:(BOOL)a3
{
}

- (NSDictionary)contextInfo
{
  if (sub_19CDCD788())
  {
    id v2 = (void *)sub_19CED5150();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)setContextInfo:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_19CED5180();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_19CDCD814(v4);
}

- (float)rate
{
  return sub_19CDCD8B8();
}

- (void)setRate:(float)a3
{
}

- (float)pitch
{
  return sub_19CDCD9D4();
}

- (void)setPitch:(float)a3
{
}

- (float)volume
{
  return sub_19CDCDAF0();
}

- (void)setVolume:(float)a3
{
}

- (NSArray)customResourceURLs
{
  if (sub_19CDCDC50())
  {
    sub_19CED4AE0();
    id v2 = (void *)sub_19CED5530();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setCustomResourceURLs:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_19CED4AE0();
    uint64_t v3 = sub_19CED5550();
  }
  v5 = self;
  sub_19CDCDD10(v3);
}

- (int64_t)synthesisProfile
{
  return sub_19CDCDE10();
}

- (void)setSynthesisProfile:(int64_t)a3
{
}

- (BOOL)disableCompactVoice
{
  return sub_19CDCDF20() & 1;
}

- (void)setDisableCompactVoice:(BOOL)a3
{
}

- (id)didGenerateAudio
{
  uint64_t v2 = sub_19CDCE0B0();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_19CDCE0D0;
    v6[3] = &block_descriptor_453;
    uint64_t v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setDidGenerateAudio:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_19CDDD65C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_19CDCE17C((uint64_t)v4, v5);
}

- (id)didGenerateWordTimings
{
  uint64_t v2 = sub_19CDCE38C();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_19CDCE3AC;
    v6[3] = &block_descriptor_447;
    uint64_t v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setDidGenerateWordTimings:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_19CDDD4EC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_19CDCE52C((uint64_t)v4, v5);
}

- (BOOL)whisper
{
  return sub_19CDCE6BC() & 1;
}

- (void)setWhisper:(BOOL)a3
{
}

- (SiriTTSProsodyProperties)prosodyProperties
{
  id v2 = sub_19CDCE7D8();
  return (SiriTTSProsodyProperties *)v2;
}

- (void)setProsodyProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_19CDCE884(v4);
}

- (BOOL)forceOspreyTTS
{
  return sub_19CDCE92C() & 1;
}

- (void)setForceOspreyTTS:(BOOL)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static SynthesisContext.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_19CDCEC7C();
}

- (SiriTTSSynthesisContext)initWithCoder:(id)a3
{
  return (SiriTTSSynthesisContext *)SynthesisContext.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDCF728);
}

- (SiriTTSSynthesisContext)init
{
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_92();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19CDD9244(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSSynthesisContext_didGenerateAudio));
  sub_19CDD9244(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSSynthesisContext_didGenerateWordTimings));
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSSynthesisContext_prosodyProperties);
}

@end