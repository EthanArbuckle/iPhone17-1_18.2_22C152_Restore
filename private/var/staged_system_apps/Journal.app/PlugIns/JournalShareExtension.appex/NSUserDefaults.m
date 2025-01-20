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
  if (qword_100158AF0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10016DF00;

  return v2;
}

- (BOOL)hasSeenBothHealthTCCs
{
  v2 = self;
  NSString v3 = sub_100109CF0();
  unsigned int v4 = [(NSUserDefaults *)v2 BOOLForKey:v3];

  if (v4)
  {
    v5 = (NSUserDefaults *)sub_100109CF0();
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
  NSString v5 = sub_100109CF0();
  [(NSUserDefaults *)v4 setBool:v3 forKey:v5];

  NSString v6 = sub_100109CF0();
  [(NSUserDefaults *)v4 setBool:v3 forKey:v6];
}

- (BOOL)showSummaryInTimeline
{
  return sub_1000926F8(self);
}

- (void)setShowSummaryInTimeline:(BOOL)a3
{
  BOOL v3 = a3;
  sub_100109D30();
  NSString v5 = self;
  NSString v6 = sub_100109CF0();
  swift_bridgeObjectRelease();
  [(NSUserDefaults *)v5 setBool:v3 forKey:v6];
}

- (BOOL)isStreakReminderEnabled
{
  return sub_1000926F8(self);
}

- (void)setIsStreakReminderEnabled:(BOOL)a3
{
  unsigned int v4 = self;
  sub_1000927E0(a3);
}

- (int64_t)streakReminderHour
{
  return (int64_t)sub_1000925D0(self);
}

- (void)setStreakReminderHour:(int64_t)a3
{
}

- (int64_t)streakReminderMinute
{
  return (int64_t)sub_1000925D0(self);
}

- (void)setStreakReminderMinute:(int64_t)a3
{
}

- (BOOL)isJournalingScheduleEnabled
{
  return sub_1000926F8(self);
}

- (void)setIsJournalingScheduleEnabled:(BOOL)a3
{
  unsigned int v4 = self;
  sub_1000927E0(a3);
}

- (NSData)journalingScheduleData
{
  sub_100109D30();
  BOOL v3 = self;
  NSString v4 = sub_100109CF0();
  swift_bridgeObjectRelease();
  NSString v5 = [(NSUserDefaults *)v3 dataForKey:v4];

  if (v5)
  {
    uint64_t v6 = sub_100109250();
    unint64_t v8 = v7;

    v9.super.isa = sub_100109240().super.isa;
    sub_100007084(v6, v8);
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
    BOOL v3 = (void *)sub_100109250();
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_100092A4C((uint64_t)v3, v7);
}

@end