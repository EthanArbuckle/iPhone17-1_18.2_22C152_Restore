@interface CHDemoDataProvider
- (BOOL)hasDemoWorkouts;
- (CHDemoDataProvider)init;
- (NSArray)workouts;
@end

@implementation CHDemoDataProvider

- (CHDemoDataProvider)init
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  static Date.now.getter();
  uint64_t v8 = static DemoUtilities.fetchWorkouts(startingDate:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts) = (Class)v8;

  v9 = (objc_class *)type metadata accessor for DemoDataProvider();
  v11.receiver = v7;
  v11.super_class = v9;
  return [(CHDemoDataProvider *)&v11 init];
}

- (BOOL)hasDemoWorkouts
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts);
  if (v2)
  {
    if (v2 >> 62)
    {
      uint64_t v4 = self;
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease();
      if (v5) {
        return 1;
      }
    }
    else if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      return 1;
    }
  }
  return 0;
}

- (NSArray)workouts
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHDemoDataProvider_workouts))
  {
    sub_1002DDB04();
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
}

@end