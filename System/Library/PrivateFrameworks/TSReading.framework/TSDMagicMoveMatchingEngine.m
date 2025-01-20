@interface TSDMagicMoveMatchingEngine
+ (id)matchingEngine;
- (TSDMagicMoveMatchingEngine)init;
- (id)matchResults;
- (void)addMatch:(id)a3;
- (void)addMatches:(id)a3;
- (void)dealloc;
@end

@implementation TSDMagicMoveMatchingEngine

+ (id)matchingEngine
{
  v2 = objc_alloc_init(TSDMagicMoveMatchingEngine);

  return v2;
}

- (TSDMagicMoveMatchingEngine)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDMagicMoveMatchingEngine;
  v2 = [(TSDMagicMoveMatchingEngine *)&v4 init];
  if (v2) {
    v2->_matches = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveMatchingEngine;
  [(TSDMagicMoveMatchingEngine *)&v3 dealloc];
}

- (void)addMatch:(id)a3
{
}

- (void)addMatches:(id)a3
{
}

- (id)matchResults
{
  return +[TSDMatchingAlgorithm bestMatchesFromArray:self->_matches];
}

@end