@interface PostKeywordSilenceConfig
- (NSString)description;
- (PostKeywordSilenceConfig)init;
- (float)silenceProbability;
- (int64_t)lookForwardFrames;
- (int64_t)minSilenceFrameCountAtEndOfKeyword;
- (int64_t)minSilenceFramesExpected;
- (void)setLookForwardFrames:(int64_t)a3;
- (void)setMinSilenceFrameCountAtEndOfKeyword:(int64_t)a3;
- (void)setMinSilenceFramesExpected:(int64_t)a3;
- (void)setSilenceProbability:(float)a3;
@end

@implementation PostKeywordSilenceConfig

- (int64_t)lookForwardFrames
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_lookForwardFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setLookForwardFrames:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_lookForwardFrames);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)minSilenceFramesExpected
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFramesExpected);
  swift_beginAccess();
  return *v2;
}

- (void)setMinSilenceFramesExpected:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFramesExpected);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (float)silenceProbability
{
  v2 = (float *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  return *v2;
}

- (void)setSilenceProbability:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  float *v4 = a3;
}

- (int64_t)minSilenceFrameCountAtEndOfKeyword
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFrameCountAtEndOfKeyword);
  swift_beginAccess();
  return *v2;
}

- (void)setMinSilenceFrameCountAtEndOfKeyword:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFrameCountAtEndOfKeyword);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (PostKeywordSilenceConfig)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_lookForwardFrames) = (Class)8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFramesExpected) = (Class)2;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_silenceProbability) = 1060320051;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFrameCountAtEndOfKeyword) = (Class)2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PostKeywordSilence();
  return [(PostKeywordSilenceConfig *)&v3 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for PostKeywordSilence();
  sub_2614393F8(&qword_26A915520, v5, (void (*)(uint64_t))type metadata accessor for PostKeywordSilence);
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