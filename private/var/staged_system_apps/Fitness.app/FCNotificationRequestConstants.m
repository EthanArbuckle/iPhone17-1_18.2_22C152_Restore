@interface FCNotificationRequestConstants
+ (NSString)moveModeChangeGoalsNotificationCategory;
+ (NSString)moveModeChangeModeNotificationCategory;
+ (NSString)moveModeNotificationCategory;
- (FCNotificationRequestConstants)init;
@end

@implementation FCNotificationRequestConstants

+ (NSString)moveModeNotificationCategory
{
  return (NSString *)sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094A988);
}

+ (NSString)moveModeChangeModeNotificationCategory
{
  return (NSString *)sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094A990);
}

+ (NSString)moveModeChangeGoalsNotificationCategory
{
  return (NSString *)sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094A998);
}

- (FCNotificationRequestConstants)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessCoachingNotificationRequestConstantsBridging();
  return [(FCNotificationRequestConstants *)&v3 init];
}

@end