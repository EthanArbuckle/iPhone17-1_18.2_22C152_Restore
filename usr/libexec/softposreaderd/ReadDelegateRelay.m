@interface ReadDelegateRelay
- (void)onFailureWithError:(id)a3;
- (void)onSuccessWithTransactionData:(id)a3;
- (void)onUpdateWithEvent:(int64_t)a3 mode:(int64_t)a4;
@end

@implementation ReadDelegateRelay

- (void)onUpdateWithEvent:(int64_t)a3 mode:(int64_t)a4
{
  swift_retain();
  sub_1000C7320(a3, a4);

  swift_release();
}

- (void)onFailureWithError:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1000C755C((uint64_t)v3);
  swift_release();
}

- (void)onSuccessWithTransactionData:(id)a3
{
  v4 = *(void (**)(id, void))self->completion;
  id v5 = a3;
  swift_retain();
  v4(a3, 0);

  swift_release();
}

@end