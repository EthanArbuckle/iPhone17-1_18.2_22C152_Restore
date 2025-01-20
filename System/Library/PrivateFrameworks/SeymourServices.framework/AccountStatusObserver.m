@interface AccountStatusObserver
- (void)onAccountChanged;
- (void)onIdentityChanged;
@end

@implementation AccountStatusObserver

- (void)onAccountChanged
{
  swift_retain();
  sub_1D6B9479C();

  swift_release();
}

- (void)onIdentityChanged
{
  unsigned __int8 v2 = 0;
  swift_retain();
  sub_1D6B95140(&v2);

  swift_release();
}

@end