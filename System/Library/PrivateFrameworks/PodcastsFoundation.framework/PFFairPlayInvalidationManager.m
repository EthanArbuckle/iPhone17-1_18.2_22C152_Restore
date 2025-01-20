@interface PFFairPlayInvalidationManager
- (PFFairPlayInvalidationManager)init;
- (id)removeKeyFor:(id)a3;
- (void)invalidateFairPlayKeyFor:(int64_t)a3 completion:(id)a4;
- (void)markAllFairPlayKeysForInvalidationWithShouldRemove:(BOOL)a3 completion:(id)a4;
- (void)markKeyForInvalidationAt:(id)a3 shouldRemove:(BOOL)a4;
- (void)removalAllFairPlayKeysWithCompletion:(id)a3;
- (void)removeKeyFor:(int64_t)a3 completion:(id)a4;
@end

@implementation PFFairPlayInvalidationManager

- (PFFairPlayInvalidationManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FairPlayKeyLoader()), sel_init);
  type metadata accessor for CoreDataFairPlayEpisodeDataFetcher();
  uint64_t v4 = swift_allocObject();
  v5 = (PFFairPlayInvalidationManager *)sub_1ACE1FF40(v3, v4, (char *)objc_allocWithZone(ObjectType));

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)invalidateFairPlayKeyFor:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  FairPlayInvalidationManager.invalidateFairPlayKey(for:completion:)(a3, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)markKeyForInvalidationAt:(id)a3 shouldRemove:(BOOL)a4
{
  uint64_t v5 = sub_1ACE74F28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE74E98();
  _s18PodcastsFoundation27FairPlayInvalidationManagerC010markKeyForE02at12shouldRemovey0B03URLV_SbtF_0((uint64_t)v8, a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)markAllFairPlayKeysForInvalidationWithShouldRemove:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  FairPlayInvalidationManager.markAllFairPlayKeysForInvalidation(shouldRemove:completion:)(v4, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)removalAllFairPlayKeysWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  FairPlayInvalidationManager.removalAllFairPlayKeys(completion:)((uint64_t)v7, v6);
  sub_1ACA76F34((uint64_t)v7);
}

- (void)removeKeyFor:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  FairPlayInvalidationManager.removeKey(for:completion:)(a3, (uint64_t)sub_1ACA3A598, v7);

  swift_release();
}

- (id)removeKeyFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)_s18PodcastsFoundation27FairPlayInvalidationManagerC9removeKey3fors5Error_pSgAA0cD5AssetC_tF_0(v4);

  if (v6)
  {
    uint64_t v7 = (void *)sub_1ACE74D68();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayInvalidationManager_episodeFetcher);
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFFairPlayInvalidationManager_internalQueue);
}

@end