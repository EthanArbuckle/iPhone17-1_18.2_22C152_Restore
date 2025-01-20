@interface BuyDelegate
- (_TtC19UnifiedMessagingKit11BuyDelegate)init;
- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation BuyDelegate

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_260689E18();

  return v10;
}

- (_TtC19UnifiedMessagingKit11BuyDelegate)init
{
}

- (void).cxx_destruct
{
}

@end