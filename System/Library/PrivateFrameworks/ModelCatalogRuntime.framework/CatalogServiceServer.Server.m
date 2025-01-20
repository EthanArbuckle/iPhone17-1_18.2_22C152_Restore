@interface CatalogServiceServer.Server
- (_TtCC19ModelCatalogRuntime20CatalogServiceServer6Server)init;
- (void)generativeExperiencesEssentialResourcesReadyWith:(id)a3;
- (void)hasEnoughStorageForGenerativeExperiencesEssentialResourcesWith:(id)a3;
- (void)isGenerativeExperiencesEssentialResourcesReadyWith:(id)a3;
- (void)releaseResourceWithIdentifier:(id)a3 with:(id)a4;
- (void)releaseResourcesWithRequestKey:(id)a3 with:(id)a4;
- (void)removeSideloadWithResource:(id)a3 with:(id)a4;
- (void)removeSideloadWithResourceBundle:(id)a3 with:(id)a4;
- (void)requestResourceWithIdentifier:(id)a3 with:(id)a4;
- (void)requestResourcesWithRequestKey:(id)a3 with:(id)a4;
- (void)resourceAvailabilityBy:(id)a3 reply:(id)a4;
- (void)resourceBundleContainerWithIdentifier:(id)a3 with:(id)a4;
- (void)resourceBundleContainersWith:(id)a3;
- (void)resourceContainerWithIdentifier:(id)a3 with:(id)a4;
- (void)resourceContainersWith:(id)a3;
- (void)resourceInformationWithIdentifier:(id)a3 with:(id)a4;
- (void)resourceStatusWithIdentifier:(id)a3 with:(id)a4;
- (void)sideloadWithResource:(id)a3 with:(id)a4;
- (void)sideloadWithResourceBundle:(id)a3 with:(id)a4;
- (void)siriResourceAvailabilityWith:(id)a3;
@end

@implementation CatalogServiceServer.Server

- (void)requestResourcesWithRequestKey:(id)a3 with:(id)a4
{
}

- (void)releaseResourcesWithRequestKey:(id)a3 with:(id)a4
{
}

- (void)requestResourceWithIdentifier:(id)a3 with:(id)a4
{
}

- (void)releaseResourceWithIdentifier:(id)a3 with:(id)a4
{
}

- (void)resourceContainerWithIdentifier:(id)a3 with:(id)a4
{
}

- (void)resourceBundleContainerWithIdentifier:(id)a3 with:(id)a4
{
}

- (void)resourceContainersWith:(id)a3
{
}

- (void)resourceBundleContainersWith:(id)a3
{
}

- (void)sideloadWithResource:(id)a3 with:(id)a4
{
  sub_256BBDC14(self, a2, a3, a4, MEMORY[0x270FBB870], "sideload resource container of type: %s", v4);
}

- (void)sideloadWithResourceBundle:(id)a3 with:(id)a4
{
}

- (void)removeSideloadWithResource:(id)a3 with:(id)a4
{
}

- (void)removeSideloadWithResourceBundle:(id)a3 with:(id)a4
{
}

- (void)resourceStatusWithIdentifier:(id)a3 with:(id)a4
{
}

- (void)resourceInformationWithIdentifier:(id)a3 with:(id)a4
{
}

- (void)isGenerativeExperiencesEssentialResourcesReadyWith:(id)a3
{
}

- (void)generativeExperiencesEssentialResourcesReadyWith:(id)a3
{
}

- (void)hasEnoughStorageForGenerativeExperiencesEssentialResourcesWith:(id)a3
{
}

- (void)resourceAvailabilityBy:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3) {
    a3 = (id)sub_256BCE328();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  CatalogServiceServer.Server.resourceAvailability(by:reply:)((uint64_t)a3, (uint64_t)sub_256BCC480, v7);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)siriResourceAvailabilityWith:(id)a3
{
}

- (_TtCC19ModelCatalogRuntime20CatalogServiceServer6Server)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_256BCD9E8();
  sub_256BB1CE4();
  sub_256BB1CD8();
  v3();
  swift_release();
  sub_256BA94E8((uint64_t)self + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_subscriptionManager);
}

@end