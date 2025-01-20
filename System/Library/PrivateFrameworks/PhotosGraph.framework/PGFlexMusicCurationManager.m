@interface PGFlexMusicCurationManager
- (PGFlexMusicCurationManager)init;
- (id)adjustCurationForCollectionWithLocalIdentifier:(id)a3 initialCuration:(id)a4 cache:(id)a5 progressReporter:(id)a6 error:(id *)a7;
@end

@implementation PGFlexMusicCurationManager

- (id)adjustCurationForCollectionWithLocalIdentifier:(id)a3 initialCuration:(id)a4 cache:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  v11 = (void *)sub_1D1EBDE60();
  v13 = v12;
  v14 = (char *)a4;
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  v18 = sub_1D1A040B8(v11, v13, v14, (uint64_t)v15);
  swift_bridgeObjectRelease();

  return v18;
}

- (PGFlexMusicCurationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGFlexMusicCurationManager *)&v3 init];
}

@end