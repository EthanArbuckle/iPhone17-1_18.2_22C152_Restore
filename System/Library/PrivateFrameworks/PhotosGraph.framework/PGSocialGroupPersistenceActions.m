@interface PGSocialGroupPersistenceActions
- (PGSocialGroupPersistenceActions)init;
- (int64_t)currentAutomaticSocialGroupsToModifyCount;
- (int64_t)newAutomaticSocialGroupsToCreateCount;
- (int64_t)outdatedAutomaticSocialGroupsToDeleteCount;
- (int64_t)socialGroupsSkippedBecauseNoCommonAssetsCount;
@end

@implementation PGSocialGroupPersistenceActions

- (int64_t)socialGroupsSkippedBecauseNoCommonAssetsCount
{
  return sub_1D1A75EA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PGSocialGroupPersistenceActions_socialGroupsSkippedBecauseNoCommonAssets);
}

- (int64_t)newAutomaticSocialGroupsToCreateCount
{
  return sub_1D1A75EA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PGSocialGroupPersistenceActions_newAutomaticSocialGroupMembersAndOrders);
}

- (int64_t)currentAutomaticSocialGroupsToModifyCount
{
  v2 = self;
  int64_t v3 = sub_1D1A75EEC();

  return v3;
}

- (int64_t)outdatedAutomaticSocialGroupsToDeleteCount
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___PGSocialGroupPersistenceActions_outdatedAutomaticSocialGroupsToDelete);
  if ((v2 & 0xC000000000000001) == 0) {
    return *(void *)(v2 + 16);
  }
  int64_t v3 = self;
  int64_t v4 = sub_1D1EBEA40();

  return v4;
}

- (PGSocialGroupPersistenceActions)init
{
  result = (PGSocialGroupPersistenceActions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end