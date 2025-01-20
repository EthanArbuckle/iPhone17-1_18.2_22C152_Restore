@interface PKAMSUIWebViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (_TtC9PassKitUI24PKAMSUIWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
- (_TtC9PassKitUI24PKAMSUIWebViewController)initWithCoder:(id)a3;
@end

@implementation PKAMSUIWebViewController

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (_TtC9PassKitUI24PKAMSUIWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PKAMSUIWebViewController();
  return [(AMSUIWebViewController *)&v9 initWithBag:a3 account:a4 clientInfo:a5];
}

- (_TtC9PassKitUI24PKAMSUIWebViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PKAMSUIWebViewController();
  return [(PKAMSUIWebViewController *)&v5 initWithCoder:a3];
}

@end