@interface RuntimeConfig
- (BOOL)audioDebug;
- (BOOL)batchDecode;
- (BOOL)duringKeywordSilence;
- (BOOL)postKeywordSilence;
- (BOOL)preKeywordSilence;
- (BOOL)secondPass;
- (NSString)description;
- (RuntimeConfig)init;
- (void)setAudioDebug:(BOOL)a3;
- (void)setBatchDecode:(BOOL)a3;
- (void)setDuringKeywordSilence:(BOOL)a3;
- (void)setPostKeywordSilence:(BOOL)a3;
- (void)setPreKeywordSilence:(BOOL)a3;
- (void)setSecondPass:(BOOL)a3;
@end

@implementation RuntimeConfig

- (BOOL)audioDebug
{
  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_audioDebug;
  swift_beginAccess();
  return *v2;
}

- (void)setAudioDebug:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_audioDebug;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)batchDecode
{
  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_batchDecode;
  swift_beginAccess();
  return *v2;
}

- (void)setBatchDecode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_batchDecode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)preKeywordSilence
{
  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_preKeywordSilence;
  swift_beginAccess();
  return *v2;
}

- (void)setPreKeywordSilence:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_preKeywordSilence;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)duringKeywordSilence
{
  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_duringKeywordSilence;
  swift_beginAccess();
  return *v2;
}

- (void)setDuringKeywordSilence:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_duringKeywordSilence;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)postKeywordSilence
{
  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_postKeywordSilence;
  swift_beginAccess();
  return *v2;
}

- (void)setPostKeywordSilence:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_postKeywordSilence;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)secondPass
{
  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_secondPass;
  swift_beginAccess();
  return *v2;
}

- (void)setSecondPass:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_secondPass;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (RuntimeConfig)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RuntimeConfig_audioDebug) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RuntimeConfig_batchDecode) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RuntimeConfig_preKeywordSilence) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RuntimeConfig_duringKeywordSilence) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RuntimeConfig_postKeywordSilence) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RuntimeConfig_secondPass) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RuntimeConfig();
  return [(RuntimeConfig *)&v3 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for RuntimeConfig();
  sub_2614393F8(&qword_26A915670, v5, (void (*)(uint64_t))type metadata accessor for RuntimeConfig);
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

@end