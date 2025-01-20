@interface SFScrollingCapsuleCollectionViewLayout
- (SFScrollingCapsuleCollectionViewLayout)init;
@end

@implementation SFScrollingCapsuleCollectionViewLayout

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFScrollingCapsuleCollectionViewLayout_highlightedItem, (uint64_t *)&unk_1E91797D0);

  swift_bridgeObjectRelease();
}

- (SFScrollingCapsuleCollectionViewLayout)init
{
  return (SFScrollingCapsuleCollectionViewLayout *)sub_18C5F1574();
}

@end