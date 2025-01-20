@interface PreKeywordSilenceConfig
- (NSString)description;
- (PreKeywordSilenceConfig)init;
- (float)silenceProbability;
- (int64_t)lookbackFrames;
- (int64_t)minSilenceInLookbackFrames;
- (void)setLookbackFrames:(int64_t)a3;
- (void)setMinSilenceInLookbackFrames:(int64_t)a3;
- (void)setSilenceProbability:(float)a3;
@end

@implementation PreKeywordSilenceConfig

- (int64_t)lookbackFrames
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_lookbackFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setLookbackFrames:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_lookbackFrames);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)minSilenceInLookbackFrames
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_minSilenceInLookbackFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setMinSilenceInLookbackFrames:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_minSilenceInLookbackFrames);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (float)silenceProbability
{
  v2 = (float *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  return *v2;
}

- (void)setSilenceProbability:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  float *v4 = a3;
}

- (PreKeywordSilenceConfig)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PreKeywordSilenceConfig_lookbackFrames) = (Class)20;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PreKeywordSilenceConfig_minSilenceInLookbackFrames) = (Class)10;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___PreKeywordSilenceConfig_silenceProbability) = 1060320051;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PreKeywordSilence();
  return [(PreKeywordSilenceConfig *)&v3 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for PreKeywordSilence();
  sub_2614393F8(&qword_26A9154C0, v5, (void (*)(uint64_t))type metadata accessor for PreKeywordSilence);
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