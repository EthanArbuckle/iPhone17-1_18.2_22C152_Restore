@interface ZhuGeSingleton
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)sharedInstance;
@end

@implementation ZhuGeSingleton

+ (id)sharedInstance
{
  if (sharedInstance_aToken != -1) {
    dispatch_once(&sharedInstance_aToken, &__block_literal_global_1);
  }
  pthread_mutex_lock(&sharedInstance_aRecursiveMutex);
  v3 = (void *)sharedInstance__singleton;
  if (!sharedInstance__singleton)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = (void *)sharedInstance__singleton;
    sharedInstance__singleton = (uint64_t)v4;

    v3 = (void *)sharedInstance__singleton;
  }
  v6 = NSStringFromClass((Class)a1);
  v7 = [v3 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)a1);
    v9 = (void *)sharedInstance__singleton;
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v8 forKeyedSubscript:v10];

    v11 = (void *)sharedInstance__singleton;
    v12 = NSStringFromClass((Class)a1);
    v13 = [v11 objectForKeyedSubscript:v12];
    [v13 initData];
  }
  pthread_mutex_unlock(&sharedInstance_aRecursiveMutex);
  v14 = (void *)sharedInstance__singleton;
  v15 = NSStringFromClass((Class)a1);
  v16 = [v14 objectForKeyedSubscript:v15];

  return v16;
}

uint64_t __32__ZhuGeSingleton_sharedInstance__block_invoke()
{
  return initPthreadRecursiveMutex(&sharedInstance_aRecursiveMutex);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end