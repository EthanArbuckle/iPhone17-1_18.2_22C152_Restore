@interface BCReadingTimeToday
+ (NSString)kind;
- (BCReadingTimeToday)init;
- (NSNumber)progress;
- (NSObject)instance;
- (NSObject)parameters;
- (NSString)formattedProgress;
- (NSString)kind;
- (void)registerProgressObserver:(id)a3;
- (void)setFormattedProgress:(id)a3;
- (void)setInstance:(id)a3;
- (void)setKind:(id)a3;
- (void)setParameters:(id)a3;
- (void)setProgress:(id)a3;
- (void)unregisterProgressObserver:(id)a3;
@end

@implementation BCReadingTimeToday

+ (NSString)kind
{
  NSString v2 = sub_1F2160();

  return (NSString *)v2;
}

- (NSString)kind
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_1F2160();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setKind:(id)a3
{
  uint64_t v4 = sub_1F2190();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BCReadingTimeToday_kind);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSObject)instance
{
  return sub_1DFF80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BCReadingTimeToday_instance);
}

- (void)setInstance:(id)a3
{
}

- (NSObject)parameters
{
  return sub_1DFF80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BCReadingTimeToday_parameters);
}

- (void)setParameters:(id)a3
{
}

- (NSNumber)progress
{
  NSString v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCReadingTimeToday_progress);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setProgress:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCReadingTimeToday_progress);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (NSString)formattedProgress
{
  NSString v2 = (char *)self + OBJC_IVAR___BCReadingTimeToday_formattedProgress;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = sub_1F2160();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setFormattedProgress:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1F2190();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BCReadingTimeToday_formattedProgress);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)registerProgressObserver:(id)a3
{
}

- (void)unregisterProgressObserver:(id)a3
{
}

- (BCReadingTimeToday)init
{
  result = (BCReadingTimeToday *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BCReadingTimeToday_onObserverCountChanged);

  sub_1A1B64(v3);
}

@end