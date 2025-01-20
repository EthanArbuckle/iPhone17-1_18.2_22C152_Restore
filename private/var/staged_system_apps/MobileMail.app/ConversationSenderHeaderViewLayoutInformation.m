@interface ConversationSenderHeaderViewLayoutInformation
- (_TtC10MobileMail45ConversationSenderHeaderViewLayoutInformation)init;
- (_TtC10MobileMail45ConversationSenderHeaderViewLayoutInformation)initWithStatusBarHeight:(double)a3 contentInset:(double)a4;
- (double)contentInset;
- (double)statusBarHeight;
@end

@implementation ConversationSenderHeaderViewLayoutInformation

- (double)statusBarHeight
{
  v2 = self;
  double v5 = sub_100292824();

  return v5;
}

- (double)contentInset
{
  v2 = self;
  double v5 = sub_100292890();

  return v5;
}

- (_TtC10MobileMail45ConversationSenderHeaderViewLayoutInformation)initWithStatusBarHeight:(double)a3 contentInset:(double)a4
{
  return (_TtC10MobileMail45ConversationSenderHeaderViewLayoutInformation *)sub_1002928F8(a3, a4);
}

- (_TtC10MobileMail45ConversationSenderHeaderViewLayoutInformation)init
{
  return (_TtC10MobileMail45ConversationSenderHeaderViewLayoutInformation *)sub_1002929FC();
}

@end