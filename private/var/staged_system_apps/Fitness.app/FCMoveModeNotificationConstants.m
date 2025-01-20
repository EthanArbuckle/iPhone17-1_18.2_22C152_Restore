@interface FCMoveModeNotificationConstants
+ (NSString)nextMoveModeUserInfoKey;
+ (NSString)notificationTypeUserInfoKey;
- (FCMoveModeNotificationConstants)init;
@end

@implementation FCMoveModeNotificationConstants

+ (NSString)nextMoveModeUserInfoKey
{
  return (NSString *)sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094ACF0);
}

+ (NSString)notificationTypeUserInfoKey
{
  return (NSString *)sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094ACF8);
}

- (FCMoveModeNotificationConstants)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessCoachingMoveModeNotificationConstantsBridging();
  return [(FCMoveModeNotificationConstants *)&v3 init];
}

@end