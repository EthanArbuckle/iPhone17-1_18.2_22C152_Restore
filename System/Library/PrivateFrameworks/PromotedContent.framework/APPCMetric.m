@interface APPCMetric
- (APPCMetric)init;
- (NSDate)timestamp;
- (NSDictionary)properties;
- (NSString)contentId;
- (int64_t)metric;
- (int64_t)purpose;
- (void)setContentId:(id)a3;
- (void)setMetric:(int64_t)a3;
- (void)setProperties:(id)a3;
- (void)setPurpose:(int64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation APPCMetric

- (int64_t)purpose
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_purpose);
  swift_beginAccess();
  return *v2;
}

- (void)setPurpose:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_purpose);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)metric
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_metric);
  swift_beginAccess();
  return *v2;
}

- (void)setMetric:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_metric);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSDate)timestamp
{
  uint64_t v3 = sub_1B5CB3090();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___APPCMetric_timestamp;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1B5CB3040();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void)setTimestamp:(id)a3
{
  uint64_t v4 = sub_1B5CB3090();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB3060();
  v8 = (char *)self + OBJC_IVAR___APPCMetric_timestamp;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (NSString)contentId
{
  v2 = (char *)self + OBJC_IVAR___APPCMetric_contentId;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B5CB33B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setContentId:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B5CB33C0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCMetric_contentId);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)properties
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCMetric_properties);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B5CB3310();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setProperties:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1B5CB3320();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCMetric_properties);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (APPCMetric)init
{
  result = (APPCMetric *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___APPCMetric_timestamp;
  uint64_t v3 = sub_1B5CB3090();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end