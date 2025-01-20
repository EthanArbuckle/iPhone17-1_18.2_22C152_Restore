@interface SCUIAssetProvider
- (SCUIAssetProvider)initWithBundleURL:(id)a3;
- (id)_assetManager;
- (id)imageNamed:(id)a3;
@end

@implementation SCUIAssetProvider

- (SCUIAssetProvider)initWithBundleURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SCUIAssetProvider.m", 18, @"Invalid parameter not satisfying: %@", @"bundleURL != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SCUIAssetProvider;
  v7 = [(SCUIAssetProvider *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_bundleURL, a3);
  }

  return v8;
}

- (id)imageNamed:(id)a3
{
  id v4 = a3;
  v5 = [(SCUIAssetProvider *)self _assetManager];
  id v6 = [v5 imageNamed:v4 withTrait:0];
  if (!v6)
  {
    v7 = [(NSURL *)self->_bundleURL URLByAppendingPathComponent:v4];
    v8 = (void *)MEMORY[0x263F1C6B0];
    v9 = [v7 path];
    id v6 = [v8 imageWithContentsOfFile:v9];
  }

  return v6;
}

- (id)_assetManager
{
  assetManager = self->_assetManager;
  if (!assetManager)
  {
    id v4 = [(NSURL *)self->_bundleURL URLByAppendingPathComponent:@"Assets.car"];
    v5 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    v7 = (_UIAssetManager *)[objc_alloc(MEMORY[0x263F1CBE0]) initWithURL:v4 idiom:v6 error:0];
    v8 = self->_assetManager;
    self->_assetManager = v7;

    assetManager = self->_assetManager;
  }

  return assetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);

  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end