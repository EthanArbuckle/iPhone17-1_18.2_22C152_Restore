@interface NTKWidgetTritiumComplicationProvider
+ (NTKWidgetTritiumComplicationProvider)shared;
- (BOOL)vendorExistsWithContainerBundleIdentifier:(id)a3;
- (id)_init;
@end

@implementation NTKWidgetTritiumComplicationProvider

+ (NTKWidgetTritiumComplicationProvider)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NTKWidgetTritiumComplicationProvider_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_shared;
  return (NTKWidgetTritiumComplicationProvider *)v2;
}

void __46__NTKWidgetTritiumComplicationProvider_shared__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)shared_shared;
  shared_shared = v1;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKWidgetTritiumComplicationProvider;
  v2 = [(NTKWidgetTritiumComplicationProvider *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v4 = +[NTKCompanionWidgetComplicationManager instanceForDevice:v3];
    companionManager = v2->_companionManager;
    v2->_companionManager = (NTKCompanionWidgetComplicationManager *)v4;
  }
  return v2;
}

- (BOOL)vendorExistsWithContainerBundleIdentifier:(id)a3
{
  return [(NTKCompanionWidgetComplicationManager *)self->_companionManager vendorExistsForContainerBundleIdentifier:a3];
}

- (void).cxx_destruct
{
}

@end