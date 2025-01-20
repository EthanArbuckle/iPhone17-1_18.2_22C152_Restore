@interface PRSBehaviorAggregator
+ (BOOL)shouldUseSharedDataStore;
+ (BOOL)supportsPosterCustomization;
+ (NSString)dataStoreContainerDirectoryPath;
+ (PRSBehaviorAggregator)sharedInstance;
- (NSURL)sharedDirectoryURL;
- (NSURL)sharedResourcesDirectoryURL;
- (PRSBehaviorAggregator)initWithIdentifier:(id)a3;
@end

@implementation PRSBehaviorAggregator

+ (BOOL)supportsPosterCustomization
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  char v3 = [v2 isSharedIPad] ^ 1;

  return v3;
}

- (PRSBehaviorAggregator)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRSBehaviorAggregator;
  v6 = [(PRSBehaviorAggregator *)&v8 init];
  if (v6 == self) {
    objc_storeStrong((id *)&self->_identifier, a3);
  }

  return v6;
}

+ (PRSBehaviorAggregator)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance___aggregator;
  return (PRSBehaviorAggregator *)v2;
}

uint64_t __39__PRSBehaviorAggregator_sharedInstance__block_invoke()
{
  sharedInstance___aggregator = [[PRSBehaviorAggregator alloc] initWithIdentifier:@"com.apple.PosterBoard"];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldUseSharedDataStore
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  char v3 = [v2 isSharedIPad];

  return v3;
}

- (NSURL)sharedDirectoryURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  char v3 = BSSystemSharedDirectoryForIdentifier();
  v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

- (NSURL)sharedResourcesDirectoryURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  char v3 = BSSystemSharedResourcesDirectoryForIdentifier();
  v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

+ (NSString)dataStoreContainerDirectoryPath
{
  if ([a1 shouldUseSharedDataStore]) {
    v2 = @"/var/containers/Data/System/";
  }
  else {
    v2 = @"/var/mobile/Containers/Data/Application/";
  }
  return (NSString *)v2;
}

- (void).cxx_destruct
{
}

@end