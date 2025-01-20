@interface PSYRegistrySingleton
+ (id)registry;
+ (void)addDelegate:(id)a3;
@end

@implementation PSYRegistrySingleton

+ (void)addDelegate:(id)a3
{
  id v3 = a3;
  id v4 = +[PSYRegistrySingleton registry];
  [v4 addDelegate:v3];

  if (([v4 started] & 1) == 0) {
    [v4 start];
  }
}

+ (id)registry
{
  if (registry_onceToken != -1) {
    dispatch_once(&registry_onceToken, &__block_literal_global);
  }
  v2 = (void *)registry_singleton;

  return v2;
}

uint64_t __32__PSYRegistrySingleton_registry__block_invoke()
{
  registry_singleton = (uint64_t)objc_alloc_init(MEMORY[0x263F5BAC8]);

  return MEMORY[0x270F9A758]();
}

@end