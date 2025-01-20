@interface NTKColorBundleLoader
+ (id)sharedInstance;
- (NSArray)sortedBundles;
- (NSURL)colorBundlesDirectory;
- (NTKBundleLoader)bundleLoader;
- (NTKColorBundleLoader)init;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)colorBundleSource;
- (id)loadColorBundles;
- (id)sortedBundles:(id)a3;
- (void)_startMonitoringColorBundlesDirectoryIfNeeded;
- (void)setBundleLoader:(id)a3;
- (void)setColorBundleSource:(id)a3;
- (void)setColorBundlesDirectory:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSortedBundles:(id)a3;
@end

@implementation NTKColorBundleLoader

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NTKColorBundleLoader_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_24 != -1) {
    dispatch_once(&sharedInstance_onceToken_24, block);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

void __38__NTKColorBundleLoader_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;
}

- (NTKColorBundleLoader)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKColorBundleLoader;
  v2 = [(NTKColorBundleLoader *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(NTKBundleLoader);
    bundleLoader = v2->_bundleLoader;
    v2->_bundleLoader = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NanoTimeKit.colorBundleLoader", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    [(NTKColorBundleLoader *)v2 _startMonitoringColorBundlesDirectoryIfNeeded];
  }
  return v2;
}

- (id)loadColorBundles
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__51;
  v10 = __Block_byref_object_dispose__51;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NTKColorBundleLoader_loadColorBundles__block_invoke;
  v5[3] = &unk_1E62C81F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__NTKColorBundleLoader_loadColorBundles__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[5];
  if (!v3)
  {
    v4 = (void *)v2[1];
    v5 = [*(id *)(a1 + 32) colorBundlesDirectory];
    uint64_t v6 = [v4 bundlesFromDirectoryURL:v5];
    uint64_t v7 = [v2 sortedBundles:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    objc_super v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v10, v3);
}

- (NSURL)colorBundlesDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NTKColorBundleLoader_colorBundlesDirectory__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (colorBundlesDirectory_onceToken != -1) {
    dispatch_once(&colorBundlesDirectory_onceToken, block);
  }
  return self->_colorBundlesDirectory;
}

void __45__NTKColorBundleLoader_colorBundlesDirectory__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = +[NTKBundleLoader rootDirectory];
  id v3 = [v7 stringByAppendingString:@"/System/Library/NanoTimeKit/FaceBundles/ColorBundles/"];
  uint64_t v4 = [v2 fileURLWithPath:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
}

- (void)_startMonitoringColorBundlesDirectoryIfNeeded
{
  if (+[NTKDefaultPreferences monitorColorBundleFolder]&& !self->_colorBundleSource)
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "#color-bundle It will monitor color bundle updates", buf, 2u);
    }

    id v7 = [(NTKColorBundleLoader *)self colorBundlesDirectory];
    id v8 = [v7 path];
    int v9 = open((const char *)[v8 cStringUsingEncoding:4], 0);

    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v9, 0xEuLL, (dispatch_queue_t)self->_queue);
    colorBundleSource = self->_colorBundleSource;
    self->_colorBundleSource = v10;

    dispatch_source_set_event_handler((dispatch_source_t)self->_colorBundleSource, &__block_literal_global_161);
    v12 = self->_colorBundleSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__NTKColorBundleLoader__startMonitoringColorBundlesDirectoryIfNeeded__block_invoke_2;
    handler[3] = &__block_descriptor_36_e5_v8__0l;
    int v14 = v9;
    dispatch_source_set_cancel_handler(v12, handler);
    dispatch_resume((dispatch_object_t)self->_colorBundleSource);
  }
  else if (+[NTKDefaultPreferences monitorColorBundleFolder]|| (id v3 = self->_colorBundleSource) == 0)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "#color-bundle It won't monitor color bundle updates", buf, 2u);
    }
  }
  else
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = self->_colorBundleSource;
    self->_colorBundleSource = 0;
  }
}

void __69__NTKColorBundleLoader__startMonitoringColorBundlesDirectoryIfNeeded__block_invoke()
{
}

uint64_t __69__NTKColorBundleLoader__startMonitoringColorBundlesDirectoryIfNeeded__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)sortedBundles:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_12_1];
}

int64_t __38__NTKColorBundleLoader_sortedBundles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 bundlePath];
  uint64_t v6 = [v5 pathComponents];
  id v7 = [v6 lastObject];

  id v8 = [v4 bundlePath];

  int v9 = [v8 pathComponents];
  v10 = [v9 lastObject];

  int64_t v11 = +[NTKPlistPigmentEditOptionLoader compareColorFileNames:v7 otherFileName:v10 fileExtension:@".bundle"];
  return v11;
}

- (NTKBundleLoader)bundleLoader
{
  return self->_bundleLoader;
}

- (void)setBundleLoader:(id)a3
{
}

- (void)setColorBundlesDirectory:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)colorBundleSource
{
  return self->_colorBundleSource;
}

- (void)setColorBundleSource:(id)a3
{
}

- (NSArray)sortedBundles
{
  return self->_sortedBundles;
}

- (void)setSortedBundles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedBundles, 0);
  objc_storeStrong((id *)&self->_colorBundleSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_colorBundlesDirectory, 0);
  objc_storeStrong((id *)&self->_bundleLoader, 0);
}

@end