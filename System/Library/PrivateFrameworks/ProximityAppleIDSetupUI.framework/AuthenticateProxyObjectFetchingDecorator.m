@interface AuthenticateProxyObjectFetchingDecorator
- (void)authenticateWithAccount:(id)a3 with:(id)a4 completion:(id)a5;
@end

@implementation AuthenticateProxyObjectFetchingDecorator

- (void)authenticateWithAccount:(id)a3 with:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  swift_retain();
  sub_22E7BDE14(v9, v10, (uint64_t)self, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

@end