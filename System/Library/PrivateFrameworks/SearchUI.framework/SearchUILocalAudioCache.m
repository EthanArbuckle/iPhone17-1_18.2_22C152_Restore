@interface SearchUILocalAudioCache
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUILocalAudioCache

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F31940];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 defaultMediaLibrary];
  v9 = [v10 entityWithSpotlightIdentifier:v8];

  (*((void (**)(id, void *))a4 + 2))(v7, v9);
}

@end