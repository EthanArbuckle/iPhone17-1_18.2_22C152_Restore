@interface CLSMeaningClue(Ingest)
- (uint64_t)isReliable;
- (uint64_t)numberOfAssets;
- (uint64_t)numberOfDominantSceneAssets;
- (uint64_t)numberOfHighConfidenceAssets;
- (uint64_t)numberOfSearchConfidenceAssets;
- (uint64_t)sceneIdentifier;
@end

@implementation CLSMeaningClue(Ingest)

- (uint64_t)sceneIdentifier
{
  v1 = [a1 extraParameters];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F76C30]];

  uint64_t v3 = [v2 unsignedLongLongValue];
  return v3;
}

- (uint64_t)isReliable
{
  v1 = [a1 extraParameters];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F76C08]];

  uint64_t v3 = [v2 BOOLValue];
  return v3;
}

- (uint64_t)numberOfDominantSceneAssets
{
  v1 = [a1 extraParameters];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F76C18]];

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

- (uint64_t)numberOfSearchConfidenceAssets
{
  v1 = [a1 extraParameters];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F76C28]];

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

- (uint64_t)numberOfHighConfidenceAssets
{
  v1 = [a1 extraParameters];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F76C20]];

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

- (uint64_t)numberOfAssets
{
  v1 = [a1 extraParameters];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F76C10]];

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

@end