@interface DecoderConfig
- (AudioCaptureConfig)audioCapture;
- (BOOL)useChecker;
- (DecoderConfig)init;
- (DuringKeywordSilenceConfig)duringKeywordSilence;
- (NSString)description;
- (PostKeywordSilenceConfig)postKeywordSilence;
- (PreKeywordSilenceConfig)preKeywordSilence;
- (void)setAudioCapture:(id)a3;
- (void)setDuringKeywordSilence:(id)a3;
- (void)setPostKeywordSilence:(id)a3;
- (void)setPreKeywordSilence:(id)a3;
- (void)setUseChecker:(BOOL)a3;
@end

@implementation DecoderConfig

- (BOOL)useChecker
{
  v2 = (BOOL *)self + OBJC_IVAR___DecoderConfig_useChecker;
  swift_beginAccess();
  return *v2;
}

- (void)setUseChecker:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DecoderConfig_useChecker;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (PreKeywordSilenceConfig)preKeywordSilence
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_preKeywordSilence);
  swift_beginAccess();
  return (PreKeywordSilenceConfig *)*v2;
}

- (void)setPreKeywordSilence:(id)a3
{
}

- (DuringKeywordSilenceConfig)duringKeywordSilence
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_duringKeywordSilence);
  swift_beginAccess();
  return (DuringKeywordSilenceConfig *)*v2;
}

- (void)setDuringKeywordSilence:(id)a3
{
}

- (PostKeywordSilenceConfig)postKeywordSilence
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_postKeywordSilence);
  swift_beginAccess();
  return (PostKeywordSilenceConfig *)*v2;
}

- (void)setPostKeywordSilence:(id)a3
{
}

- (AudioCaptureConfig)audioCapture
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_audioCapture);
  swift_beginAccess();
  return (AudioCaptureConfig *)*v2;
}

- (void)setAudioCapture:(id)a3
{
}

- (DecoderConfig)init
{
  return (DecoderConfig *)sub_26143CE88();
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for DecoderConfig();
  sub_2614393F8(&qword_26A9155A8, v5, (void (*)(uint64_t))type metadata accessor for DecoderConfig);
  uint64_t v6 = sub_2614D4AC8();
  unint64_t v8 = v7;
  swift_release();
  sub_2614D53F8();
  sub_2614D53C8();
  if (v9)
  {
    sub_2613C2314(v6, v8);

    v10 = (void *)sub_2614D5378();
    swift_bridgeObjectRelease();
    return (NSString *)v10;
  }
  else
  {
    __break(1u);
    result = (NSString *)swift_unexpectedError();
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_audioCapture);
}

@end