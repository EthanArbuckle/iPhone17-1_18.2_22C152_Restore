@interface PGPhotosChallengeEvaluationContext
- (CLSPublicEventManager)publicEventManager;
- (CLSSceneTaxonomyHierarchy)sceneTaxonomy;
- (CLSServiceManager)serviceManager;
- (PGGraph)graph;
- (PGPhotosChallengeEvaluationContext)init;
- (PHPhotoLibrary)photoLibrary;
@end

@implementation PGPhotosChallengeEvaluationContext

- (PGGraph)graph
{
  return (PGGraph *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___PGPhotosChallengeEvaluationContext_graph));
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___PGPhotosChallengeEvaluationContext_photoLibrary));
}

- (CLSSceneTaxonomyHierarchy)sceneTaxonomy
{
  return (CLSSceneTaxonomyHierarchy *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR___PGPhotosChallengeEvaluationContext_sceneTaxonomy));
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___PGPhotosChallengeEvaluationContext_serviceManager));
}

- (CLSPublicEventManager)publicEventManager
{
  return (CLSPublicEventManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___PGPhotosChallengeEvaluationContext_publicEventManager));
}

- (PGPhotosChallengeEvaluationContext)init
{
  result = (PGPhotosChallengeEvaluationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGPhotosChallengeEvaluationContext_publicEventManager);
}

@end