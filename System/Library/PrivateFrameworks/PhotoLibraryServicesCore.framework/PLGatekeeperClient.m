@interface PLGatekeeperClient
+ (id)sharedInstance;
- (void)getLibrarySizes:(id)a3;
- (void)getLibrarySizesFromDB:(BOOL)a3 handler:(id)a4;
@end

@implementation PLGatekeeperClient

+ (id)sharedInstance
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PLGatekeeperClient_sharedInstance__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  pl_dispatch_once(&sharedInstance_didCreate, v4);
  v2 = (void *)sharedInstance_client;
  return v2;
}

uint64_t __36__PLGatekeeperClient_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_client = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (void)getLibrarySizesFromDB:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = [PLAssetsdClient alloc];
  v7 = +[PLPhotoLibraryPathManager systemLibraryURL];
  v8 = [(PLAssetsdClient *)v6 initWithPhotoLibraryURL:v7];

  v9 = [(PLAssetsdClient *)v8 libraryInternalClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PLGatekeeperClient_getLibrarySizesFromDB_handler___block_invoke;
  v11[3] = &unk_1E58A0198;
  id v12 = v5;
  id v10 = v5;
  [v9 getLibrarySizesFromDB:v4 completionHandler:v11];
}

uint64_t __52__PLGatekeeperClient_getLibrarySizesFromDB_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getLibrarySizes:(id)a3
{
  id v3 = a3;
  BOOL v4 = [PLAssetsdClient alloc];
  id v5 = +[PLPhotoLibraryPathManager systemLibraryURL];
  v6 = [(PLAssetsdClient *)v4 initWithPhotoLibraryURL:v5];

  v7 = [(PLAssetsdClient *)v6 libraryInternalClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PLGatekeeperClient_getLibrarySizes___block_invoke;
  v9[3] = &unk_1E58A0198;
  id v10 = v3;
  id v8 = v3;
  [v7 getLibrarySizesFromDB:0 completionHandler:v9];
}

uint64_t __38__PLGatekeeperClient_getLibrarySizes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end