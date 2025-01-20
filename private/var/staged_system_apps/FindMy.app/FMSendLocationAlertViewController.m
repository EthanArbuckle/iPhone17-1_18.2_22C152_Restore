@interface FMSendLocationAlertViewController
- (_TtC6FindMy33FMSendLocationAlertViewController)initWithCoder:(id)a3;
- (void)actionWithSender:(id)a3;
@end

@implementation FMSendLocationAlertViewController

- (void)actionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10054476C();
}

- (_TtC6FindMy33FMSendLocationAlertViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMSendLocationAlertViewController();
  return [(FMRecipientsViewController *)&v5 initWithCoder:a3];
}

@end