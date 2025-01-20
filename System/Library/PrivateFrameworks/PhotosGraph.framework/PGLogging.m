@interface PGLogging
+ (id)memoriesMusicLogging;
+ (id)sharedLogging;
- (OS_os_log)loggingConnection;
@end

@implementation PGLogging

- (void).cxx_destruct
{
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

+ (id)memoriesMusicLogging
{
  if (memoriesMusicLogging_onceToken != -1) {
    dispatch_once(&memoriesMusicLogging_onceToken, &__block_literal_global_260);
  }
  v2 = (void *)memoriesMusicLogging_sharedLogging;
  return v2;
}

void __33__PGLogging_memoriesMusicLogging__block_invoke()
{
  v0 = objc_alloc_init(PGLogging);
  v1 = (void *)memoriesMusicLogging_sharedLogging;
  memoriesMusicLogging_sharedLogging = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.PhotosGraph.MemoriesMusic", "shared");
  v3 = *(void **)(memoriesMusicLogging_sharedLogging + 8);
  *(void *)(memoriesMusicLogging_sharedLogging + 8) = v2;
}

+ (id)sharedLogging
{
  if (sharedLogging_onceToken != -1) {
    dispatch_once(&sharedLogging_onceToken, &__block_literal_global_1358);
  }
  os_log_t v2 = (void *)sharedLogging_sharedLogging;
  return v2;
}

void __26__PGLogging_sharedLogging__block_invoke()
{
  v0 = objc_alloc_init(PGLogging);
  v1 = (void *)sharedLogging_sharedLogging;
  sharedLogging_sharedLogging = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.PhotosGraph", "shared");
  v3 = *(void **)(sharedLogging_sharedLogging + 8);
  *(void *)(sharedLogging_sharedLogging + 8) = v2;
}

@end