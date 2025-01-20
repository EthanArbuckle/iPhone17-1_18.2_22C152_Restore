@interface SESSettingsLocalizedStringFactory
+ (NSString)expressModeDefaultAlertMessagePostfix;
+ (NSString)nonTouchIDAlertMessagePrefix;
+ (NSString)passbookDefaultAlertMessage;
+ (NSString)thirdPartyDefaultAlertMessage;
+ (NSString)touchIDAlertMessagePrefix;
- (_TtC9SEService33SESSettingsLocalizedStringFactory)init;
@end

@implementation SESSettingsLocalizedStringFactory

+ (NSString)touchIDAlertMessagePrefix
{
  return (NSString *)sub_21474C49C((uint64_t)a1, (uint64_t)a2, &qword_26781BF68);
}

+ (NSString)nonTouchIDAlertMessagePrefix
{
  return (NSString *)sub_21474C49C((uint64_t)a1, (uint64_t)a2, &qword_26781BF70);
}

+ (NSString)passbookDefaultAlertMessage
{
  return (NSString *)sub_21474C49C((uint64_t)a1, (uint64_t)a2, &qword_26781BF78);
}

+ (NSString)thirdPartyDefaultAlertMessage
{
  return (NSString *)sub_21474C49C((uint64_t)a1, (uint64_t)a2, &qword_26781BF80);
}

+ (NSString)expressModeDefaultAlertMessagePostfix
{
  return (NSString *)sub_21474C49C((uint64_t)a1, (uint64_t)a2, &qword_26781BF88);
}

- (_TtC9SEService33SESSettingsLocalizedStringFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SESSettingsLocalizedStringFactory *)&v3 init];
}

@end