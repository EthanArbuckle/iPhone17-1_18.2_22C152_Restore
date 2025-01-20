@interface FeatureExtractorConfig
- (FeatureExtractorConfig)init;
- (NSString)description;
- (int64_t)cmvnMinWindowLength;
- (int64_t)cmvnSlidingWindowLength;
- (int64_t)downSampleStride;
- (int64_t)nnetIntakeFeatureLength;
- (int64_t)nnetVectorSize;
- (int64_t)spliceLeftContext;
- (int64_t)spliceRightContext;
- (void)setCmvnMinWindowLength:(int64_t)a3;
- (void)setCmvnSlidingWindowLength:(int64_t)a3;
- (void)setDownSampleStride:(int64_t)a3;
- (void)setNnetIntakeFeatureLength:(int64_t)a3;
- (void)setNnetVectorSize:(int64_t)a3;
- (void)setSpliceLeftContext:(int64_t)a3;
- (void)setSpliceRightContext:(int64_t)a3;
@end

@implementation FeatureExtractorConfig

- (int64_t)cmvnSlidingWindowLength
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnSlidingWindowLength);
  swift_beginAccess();
  return *v2;
}

- (void)setCmvnSlidingWindowLength:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnSlidingWindowLength);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)cmvnMinWindowLength
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnMinWindowLength);
  swift_beginAccess();
  return *v2;
}

- (void)setCmvnMinWindowLength:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnMinWindowLength);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)spliceLeftContext
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceLeftContext);
  swift_beginAccess();
  return *v2;
}

- (void)setSpliceLeftContext:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceLeftContext);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)spliceRightContext
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceRightContext);
  swift_beginAccess();
  return *v2;
}

- (void)setSpliceRightContext:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceRightContext);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)downSampleStride
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_downSampleStride);
  swift_beginAccess();
  return *v2;
}

- (void)setDownSampleStride:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_downSampleStride);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)nnetIntakeFeatureLength
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetIntakeFeatureLength);
  swift_beginAccess();
  return *v2;
}

- (void)setNnetIntakeFeatureLength:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetIntakeFeatureLength);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)nnetVectorSize
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetVectorSize);
  swift_beginAccess();
  return *v2;
}

- (void)setNnetVectorSize:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetVectorSize);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (FeatureExtractorConfig)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_cmvnSlidingWindowLength) = (Class)600;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_cmvnMinWindowLength) = (Class)24;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_spliceLeftContext) = (Class)3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_spliceRightContext) = (Class)3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_downSampleStride) = (Class)3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_nnetIntakeFeatureLength) = (Class)8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_nnetVectorSize) = (Class)280;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeatureExtractorConfig();
  return [(FeatureExtractorConfig *)&v3 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for FeatureExtractorConfig();
  sub_2614393F8(&qword_26A915628, v5, (void (*)(uint64_t))type metadata accessor for FeatureExtractorConfig);
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