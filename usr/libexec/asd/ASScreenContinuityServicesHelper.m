@interface ASScreenContinuityServicesHelper
- (_TtC3asd32ASScreenContinuityServicesHelper)init;
- (void)loadScreenMirroringStatusWithCompletionHandler:(id)a3;
@end

@implementation ASScreenContinuityServicesHelper

- (void)loadScreenMirroringStatusWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_1000B14E8((uint64_t)&unk_10069A418, v5);
}

- (_TtC3asd32ASScreenContinuityServicesHelper)init
{
  return (_TtC3asd32ASScreenContinuityServicesHelper *)ASScreenContinuityServicesHelper.init()();
}

- (void).cxx_destruct
{
}

@end