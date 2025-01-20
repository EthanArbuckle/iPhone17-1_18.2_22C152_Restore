@interface PageSnapshotDataGenerator
- (void)snapshotWithPageNumber:(int64_t)a3 size:(CGSize)a4 completion:(id)a5;
@end

@implementation PageSnapshotDataGenerator

- (void)snapshotWithPageNumber:(int64_t)a3 size:(CGSize)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  _Block_copy(v7);
  swift_retain();
  sub_10040E9E8(a3, (uint64_t)self, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();
}

@end