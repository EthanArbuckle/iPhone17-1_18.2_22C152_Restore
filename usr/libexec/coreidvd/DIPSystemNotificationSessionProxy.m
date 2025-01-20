@interface DIPSystemNotificationSessionProxy
- (void)appleAccountCreatedWithAccount:(id)a3 completion:(id)a4;
- (void)appleAccountDeletedWithAccount:(id)a3 completion:(id)a4;
- (void)appleAccountModifiedWithAccount:(id)a3 oldAccount:(id)a4 completion:(id)a5;
@end

@implementation DIPSystemNotificationSessionProxy

- (void)appleAccountCreatedWithAccount:(id)a3 completion:(id)a4
{
}

- (void)appleAccountDeletedWithAccount:(id)a3 completion:(id)a4
{
}

- (void)appleAccountModifiedWithAccount:(id)a3 oldAccount:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  swift_retain();
  sub_10021BB80(v9, (uint64_t)self, (char *)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

@end