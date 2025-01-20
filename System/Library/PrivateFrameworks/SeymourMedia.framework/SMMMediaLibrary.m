@interface SMMMediaLibrary
+ (id)identifierForItem:(id)a3;
+ (id)predicateForTracksWithAdamIdentifiers:(id)a3;
+ (void)addGlobalPlaylistWithIdentifier:(id)a3 completion:(id)a4;
+ (void)addTrackWithIdentifier:(int64_t)a3 completion:(id)a4;
@end

@implementation SMMMediaLibrary

+ (void)addTrackWithIdentifier:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x263F11E40] defaultMediaLibrary];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SMMMediaLibrary_addTrackWithIdentifier_completion___block_invoke;
  v8[3] = &unk_264799600;
  id v9 = v5;
  id v7 = v5;
  [v6 addStoreItem:a3 andAddTracksToCloudLibrary:1 withCompletion:v8];
}

uint64_t __53__SMMMediaLibrary_addTrackWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)addGlobalPlaylistWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F11E40];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultMediaLibrary];
  [v8 addGlobalPlaylistWithID:v7 andAddToCloudLibrary:1 completion:v6];
}

+ (id)predicateForTracksWithAdamIdentifiers:(id)a3
{
  return (id)[MEMORY[0x263F11DF0] predicateWithProperty:*MEMORY[0x263F113F0] values:a3];
}

+ (id)identifierForItem:(id)a3
{
  return (id)[a3 valueForProperty:*MEMORY[0x263F113F0]];
}

@end