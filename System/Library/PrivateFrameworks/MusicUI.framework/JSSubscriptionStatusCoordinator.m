@interface JSSubscriptionStatusCoordinator
- (JSValue)subscriptionStatus;
- (_TtC7MusicUI31JSSubscriptionStatusCoordinator)init;
- (id)fetch:(id)a3;
- (void)refreshSubscriptionStatus;
@end

@implementation JSSubscriptionStatusCoordinator

- (JSValue)subscriptionStatus
{
  v2 = self;
  v3 = (void *)sub_229CAB484();

  return (JSValue *)v3;
}

- (void)refreshSubscriptionStatus
{
  v2 = self;
  sub_229CAB5BC();
}

- (id)fetch:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_229CAB630();

  return v6;
}

- (_TtC7MusicUI31JSSubscriptionStatusCoordinator)init
{
}

- (void).cxx_destruct
{
}

@end