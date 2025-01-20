@interface MailTipsHelper
+ (_TtC10MobileMail14MailTipsHelper)shared;
- (_TtC10MobileMail14MailTipsHelper)init;
- (void)filterByUnreadUsed;
- (void)setup;
- (void)updateFilterByUnreadRulesWithAmountOfEmails:(int64_t)a3 amountOfUnreads:(int64_t)a4;
@end

@implementation MailTipsHelper

+ (_TtC10MobileMail14MailTipsHelper)shared
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  v2 = sub_1000588BC();

  return (_TtC10MobileMail14MailTipsHelper *)v2;
}

- (void)updateFilterByUnreadRulesWithAmountOfEmails:(int64_t)a3 amountOfUnreads:(int64_t)a4
{
  v4 = self;
  sub_1000588F4();
}

- (_TtC10MobileMail14MailTipsHelper)init
{
  return (_TtC10MobileMail14MailTipsHelper *)sub_10000D128();
}

- (void)setup
{
  v2 = self;
  sub_1003893EC();
}

- (void)filterByUnreadUsed
{
  v2 = self;
  sub_100389930();
}

@end