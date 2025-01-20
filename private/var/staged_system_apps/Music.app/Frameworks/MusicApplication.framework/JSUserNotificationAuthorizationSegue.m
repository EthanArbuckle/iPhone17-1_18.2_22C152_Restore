@interface JSUserNotificationAuthorizationSegue
- (void)handleEngagementRequest:(id)a3 completion:(id)a4;
@end

@implementation JSUserNotificationAuthorizationSegue

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1B0A54(v7, v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

@end