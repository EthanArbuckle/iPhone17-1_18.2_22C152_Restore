@interface FMAddFriendViewController
- (_TtC6FindMy25FMAddFriendViewController)initWithCoder:(id)a3;
- (void)actionWithSender:(id)a3;
- (void)cancelActionWithSender:(id)a3;
@end

@implementation FMAddFriendViewController

- (void)cancelActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100439A34();
}

- (void)actionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100439C54();
}

- (_TtC6FindMy25FMAddFriendViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAddFriendViewController();
  return [(FMRecipientsViewController *)&v5 initWithCoder:a3];
}

@end