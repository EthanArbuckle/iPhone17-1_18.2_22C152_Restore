@interface GKPseudonymManager
- (GKPseudonymManager)init;
- (void)fetchPseudonymWithCompletionHandler:(id)a3;
- (void)revokePseudonym:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation GKPseudonymManager

- (GKPseudonymManager)init
{
  return (GKPseudonymManager *)PseudonymManager.init()();
}

- (void)fetchPseudonymWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_10000D83C((uint64_t)&unk_100327938, v5);
}

- (void)revokePseudonym:(NSString *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_10000D83C((uint64_t)&unk_100327928, (uint64_t)v7);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GKPseudonymManager_fwManager);
}

@end