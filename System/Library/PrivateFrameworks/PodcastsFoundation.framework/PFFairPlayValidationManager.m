@interface PFFairPlayValidationManager
- (PFFairPlayValidationManager)init;
- (PFFairPlayValidationManager)initWithEpisodeRemovalManager:(id)a3;
- (void)validateDownloadedEpisodesWithCompletion:(id)a3;
@end

@implementation PFFairPlayValidationManager

- (PFFairPlayValidationManager)initWithEpisodeRemovalManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = objc_allocWithZone((Class)type metadata accessor for FairPlayKeyLoader());
  swift_unknownObjectRetain();
  id v6 = objc_msgSend(v5, sel_init);
  type metadata accessor for CoreDataFairPlayEpisodeDataFetcher();
  uint64_t v7 = swift_allocObject();
  v8 = (PFFairPlayValidationManager *)sub_1ACB22A78(v6, (uint64_t)a3, v7, (char *)objc_allocWithZone(ObjectType));

  swift_unknownObjectRelease();
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)validateDownloadedEpisodesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_1ACA50AB0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  FairPlayValidationManager.validateDownloadedEpisodes(completion:)((uint64_t)v7, v6);
  sub_1ACA76F34((uint64_t)v7);
}

- (PFFairPlayValidationManager)init
{
  result = (PFFairPlayValidationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayValidationManager_episodeFetcher);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end