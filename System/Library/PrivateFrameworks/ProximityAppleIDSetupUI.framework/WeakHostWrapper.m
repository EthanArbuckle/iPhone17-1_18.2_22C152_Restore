@interface WeakHostWrapper
- (void)extensionDidFinishWith:(id)a3 context:(id)a4 completion:(id)a5;
- (void)promptForFlowCancelWithCompletion:(id)a3;
@end

@implementation WeakHostWrapper

- (void)extensionDidFinishWith:(id)a3 context:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  swift_retain();
  sub_22E7E133C((uint64_t)v9, (uint64_t)v10, (uint64_t)self, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

- (void)promptForFlowCancelWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_22E7E14EC(v4, (void (**)(void, void))v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

@end