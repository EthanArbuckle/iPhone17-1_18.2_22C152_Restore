@interface PGMusicCurationManager
- (PGMusicCurationManager)init;
- (id)adjustCurationForCollection:(id)a3 initialCuration:(id)a4 cache:(id)a5 progressReporter:(id)a6 error:(id *)a7;
@end

@implementation PGMusicCurationManager

- (id)adjustCurationForCollection:(id)a3 initialCuration:(id)a4 cache:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  uint64_t v11 = sub_1D1EBDE60();
  uint64_t v13 = v12;
  v14 = (char *)a4;
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  v18 = sub_1D19833B8(v11, v13, v14, v15);
  swift_bridgeObjectRelease();

  return v18;
}

- (PGMusicCurationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGMusicCurationManager *)&v3 init];
}

@end