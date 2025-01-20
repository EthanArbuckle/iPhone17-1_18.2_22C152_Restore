@interface ClearRecentCollectionAssetsAction
- (_TtC12PhotosUICore33ClearRecentCollectionAssetsAction)initWithAssets:(id)a3;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation ClearRecentCollectionAssetsAction

- (void)performAction:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1AA4BFCB4((void (*)(uint64_t))sub_1A9D5E1DC, v5);

  swift_release();
}

- (void)performUndo:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1AA4C03C4((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC12PhotosUICore33ClearRecentCollectionAssetsAction)initWithAssets:(id)a3
{
  return (_TtC12PhotosUICore33ClearRecentCollectionAssetsAction *)sub_1AA4C0310(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClearRecentCollectionAssetsAction);
}

@end