@interface PASUIExtensionHostProxy.InfoProvider
- (void)helloWithCompletion:(id)a3;
@end

@implementation PASUIExtensionHostProxy.InfoProvider

- (void)helloWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  swift_retain();
  sub_22E7CC8A0((uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

@end