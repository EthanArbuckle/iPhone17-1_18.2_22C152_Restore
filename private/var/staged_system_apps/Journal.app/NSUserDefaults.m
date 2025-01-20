@interface NSUserDefaults
+ (id)journalShared;
- (BOOL)hasSeenBothHealthTCCs;
- (BOOL)isJournalingScheduleEnabled;
- (BOOL)isStreakReminderEnabled;
- (BOOL)showSummaryInTimeline;
- (NSData)journalingScheduleData;
- (int64_t)streakReminderHour;
- (int64_t)streakReminderMinute;
- (void)setHasSeenBothHealthTCCs:(BOOL)a3;
- (void)setIsJournalingScheduleEnabled:(BOOL)a3;
- (void)setIsStreakReminderEnabled:(BOOL)a3;
- (void)setJournalingScheduleData:(id)a3;
- (void)setShowSummaryInTimeline:(BOOL)a3;
- (void)setStreakReminderHour:(int64_t)a3;
- (void)setStreakReminderMinute:(int64_t)a3;
@end

@implementation NSUserDefaults

+ (id)journalShared
{
  if (qword_1007F6E48 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10083D3C0;

  return v2;
}

- (BOOL)hasSeenBothHealthTCCs
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unsigned int v4 = [(NSUserDefaults *)v2 BOOLForKey:v3];

  if (v4)
  {
    v5 = (NSUserDefaults *)String._bridgeToObjectiveC()();
    unsigned __int8 v6 = [(NSUserDefaults *)v2 BOOLForKey:v5];

    v2 = v5;
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setHasSeenBothHealthTCCs:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  [(NSUserDefaults *)v4 setBool:v3 forKey:v5];

  NSString v6 = String._bridgeToObjectiveC()();
  [(NSUserDefaults *)v4 setBool:v3 forKey:v6];
}

- (BOOL)showSummaryInTimeline
{
  return sub_10035E5B0(self);
}

- (void)setShowSummaryInTimeline:(BOOL)a3
{
  BOOL v3 = a3;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [(NSUserDefaults *)v5 setBool:v3 forKey:v6];
}

- (BOOL)isStreakReminderEnabled
{
  return sub_10035E5B0(self);
}

- (void)setIsStreakReminderEnabled:(BOOL)a3
{
  unsigned int v4 = self;
  sub_10035E698(a3);
}

- (int64_t)streakReminderHour
{
  return (int64_t)sub_10035E488(self);
}

- (void)setStreakReminderHour:(int64_t)a3
{
}

- (int64_t)streakReminderMinute
{
  return (int64_t)sub_10035E488(self);
}

- (void)setStreakReminderMinute:(int64_t)a3
{
}

- (BOOL)isJournalingScheduleEnabled
{
  return sub_10035E5B0(self);
}

- (void)setIsJournalingScheduleEnabled:(BOOL)a3
{
  unsigned int v4 = self;
  sub_10035E698(a3);
}

- (NSData)journalingScheduleData
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v3 = self;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v5 = [(NSUserDefaults *)v3 dataForKey:v4];

  if (v5)
  {
    uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;

    v9.super.isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100040DD0(v6, v8);
  }
  else
  {

    v9.super.isa = 0;
  }

  return (NSData *)v9.super.isa;
}

- (void)setJournalingScheduleData:(id)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    NSString v4 = self;
    id v5 = v3;
    BOOL v3 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_10035EA68((uint64_t)v3, v7);
}

@end