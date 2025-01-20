@interface MTBaseSessionsProvider
+ (BOOL)supportsSessions;
- (_TtC18MobileTimerSupport22MTBaseSessionsProvider)init;
- (int64_t)numberOfStopwatchSessions;
@end

@implementation MTBaseSessionsProvider

+ (BOOL)supportsSessions
{
  sub_1BE323100();
  sub_1BE3230F0();
  char v2 = sub_1BE3230E0();
  swift_release();
  return v2 & 1;
}

- (int64_t)numberOfStopwatchSessions
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB838778);
  v3 = self;
  unint64_t v4 = sub_1BE323010();
  if (v4 >> 62) {
    int64_t v5 = sub_1BE323980();
  }
  else {
    int64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC18MobileTimerSupport22MTBaseSessionsProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTBaseSessionsProvider();
  return [(MTBaseSessionsProvider *)&v3 init];
}

@end