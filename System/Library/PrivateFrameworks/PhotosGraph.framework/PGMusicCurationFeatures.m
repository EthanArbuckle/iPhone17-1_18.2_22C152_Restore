@interface PGMusicCurationFeatures
- (BOOL)shouldAvoidColorGrading;
- (NSString)description;
- (PGMusicCurationFeatures)init;
@end

@implementation PGMusicCurationFeatures

- (BOOL)shouldAvoidColorGrading
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PGMusicCurationFeatures_shouldAvoidColorGrading);
}

- (NSString)description
{
  v2 = self;
  MusicCurationFeatures.description.getter();

  v3 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PGMusicCurationFeatures)init
{
  result = (PGMusicCurationFeatures *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end