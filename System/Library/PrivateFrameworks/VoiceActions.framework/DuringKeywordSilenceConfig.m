@interface DuringKeywordSilenceConfig
- (DuringKeywordSilenceConfig)init;
- (NSString)description;
- (float)minPercentageOfNonSilenceFrames;
- (float)silenceProbability;
- (void)setMinPercentageOfNonSilenceFrames:(float)a3;
- (void)setSilenceProbability:(float)a3;
@end

@implementation DuringKeywordSilenceConfig

- (float)minPercentageOfNonSilenceFrames
{
  v2 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_minPercentageOfNonSilenceFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setMinPercentageOfNonSilenceFrames:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_minPercentageOfNonSilenceFrames);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)silenceProbability
{
  v2 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  return *v2;
}

- (void)setSilenceProbability:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  float *v4 = a3;
}

- (DuringKeywordSilenceConfig)init
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___DuringKeywordSilenceConfig_minPercentageOfNonSilenceFrames) = 1056964608;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___DuringKeywordSilenceConfig_silenceProbability) = 1056964608;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DuringKeywordSilence();
  return [(DuringKeywordSilenceConfig *)&v3 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for DuringKeywordSilence();
  sub_2614393F8(&qword_26A9154E8, v5, (void (*)(uint64_t))type metadata accessor for DuringKeywordSilence);
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