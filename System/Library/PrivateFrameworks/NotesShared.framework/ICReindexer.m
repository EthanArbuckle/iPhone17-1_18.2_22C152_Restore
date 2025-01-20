@interface ICReindexer
+ (id)reindexer;
@end

@implementation ICReindexer

+ (id)reindexer
{
  if (ICUseCoreDataCoreSpotlightIntegration()) {
    [MEMORY[0x1E4F83708] sharedReindexer];
  }
  else {
  v2 = [MEMORY[0x1E4F837B8] sharedIndexer];
  }
  return v2;
}

@end