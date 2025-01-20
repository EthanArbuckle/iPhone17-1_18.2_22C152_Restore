@interface PGMusicFeatureExtractionContext
+ (id)appleMusicFeatureExtractionContextWithCuratorContext:(id)a3;
+ (id)flexMusicFeatureExtractionContextWithCuratorContext:(id)a3;
- (BOOL)useMoodKeywords;
- (PGMusicFeatureExtractionContext)init;
@end

@implementation PGMusicFeatureExtractionContext

- (BOOL)useMoodKeywords
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PGMusicFeatureExtractionContext_useMoodKeywords);
}

- (PGMusicFeatureExtractionContext)init
{
  result = (PGMusicFeatureExtractionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PGMusicFeatureExtractionContext_songKeywordProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

+ (id)appleMusicFeatureExtractionContextWithCuratorContext:(id)a3
{
  id v3 = a3;
  id v4 = _s11PhotosGraph29MusicFeatureExtractionContextC05applecdeF04withAcA0c7CuratorF0C_tFZ_0((uint64_t)v3);

  return v4;
}

+ (id)flexMusicFeatureExtractionContextWithCuratorContext:(id)a3
{
  id v3 = a3;
  id v4 = _s11PhotosGraph29MusicFeatureExtractionContextC04flexcdeF04withAcA0c7CuratorF0C_tFZ_0((uint64_t)v3);

  return v4;
}

@end