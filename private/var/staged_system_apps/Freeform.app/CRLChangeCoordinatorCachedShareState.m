@interface CRLChangeCoordinatorCachedShareState
- (void)shareStateUpdatedWithShare:(id)a3;
@end

@implementation CRLChangeCoordinatorCachedShareState

- (void)shareStateUpdatedWithShare:(id)a3
{
  v4 = *(void **)self->cachedShare;
  *(void *)self->cachedShare = a3;
  id v5 = a3;
  swift_retain();

  unint64_t v6 = sub_100A39938((uint64_t)_swiftEmptyArrayStorage);
  swift_beginAccess();
  *(void *)self->handleToPermissionsLookup = v6;

  swift_release();
  swift_bridgeObjectRelease();
}

@end