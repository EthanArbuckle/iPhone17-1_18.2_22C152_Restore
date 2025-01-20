@interface MarketingWebUserInterfaceCoordinator
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (_TtC9SeymourUI36MarketingWebUserInterfaceCoordinator)init;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation MarketingWebUserInterfaceCoordinator

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (_TtC9SeymourUI36MarketingWebUserInterfaceCoordinator)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingWebUserInterfaceCoordinator();
  return [(MarketingWebUserInterfaceCoordinator *)&v4 init];
}

- (void).cxx_destruct
{
}

@end