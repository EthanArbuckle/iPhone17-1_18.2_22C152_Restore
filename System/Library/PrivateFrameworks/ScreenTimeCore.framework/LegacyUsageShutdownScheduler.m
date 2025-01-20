@interface LegacyUsageShutdownScheduler
+ (BOOL)scheduleSystemTaskAndReturnError:(id *)a3;
+ (id)isLegacyUsageDisabledWithContext:(id)a3 error:(id *)a4;
+ (void)deregisterSystemTask;
- (_TtC15ScreenTimeAgent28LegacyUsageShutdownScheduler)init;
@end

@implementation LegacyUsageShutdownScheduler

+ (BOOL)scheduleSystemTaskAndReturnError:(id *)a3
{
  id v3 = [self sharedScheduler];
  uint64_t v4 = sub_1000A0760(0, &qword_100343208);
  sub_10010BF78(v3, v4, (uint64_t)&off_1003018B0);

  return 1;
}

+ (void)deregisterSystemTask
{
  id v2 = [self sharedScheduler];
  sub_10010C2C4(v2);
}

+ (id)isLegacyUsageDisabledWithContext:(id)a3 error:(id *)a4
{
  v5 = self;
  id v6 = a3;
  id result = [v5 userKnowledgeStore];
  if (result)
  {
    id v8 = result;
    v10[3] = sub_1000A0760(0, &qword_100343200);
    v10[4] = &off_100302050;
    v10[0] = v8;
    sub_10010AF2C((uint64_t)v6, v10);
    sub_1000A4F28((uint64_t)v10);
    v9.super.super.isa = Bool._bridgeToObjectiveC()().super.super.isa;

    return v9.super.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC15ScreenTimeAgent28LegacyUsageShutdownScheduler)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LegacyUsageShutdownScheduler *)&v3 init];
}

@end