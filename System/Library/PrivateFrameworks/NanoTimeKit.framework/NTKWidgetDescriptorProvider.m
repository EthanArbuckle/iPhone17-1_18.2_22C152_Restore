@interface NTKWidgetDescriptorProvider
+ (NTKWidgetDescriptorProvider)sharedInstance;
- (BOOL)initalLoadCompleted;
- (NSDictionary)descriptorsByExtensionIdentifier;
- (NSSet)descriptors;
- (NTKWidgetDescriptorProvider)init;
- (id)collatedDescriptors;
- (void)_queue_widgetDescriptorsChanged;
- (void)descriptorsDidChangeForDescriptorProvider:(id)a3;
- (void)registerObserver:(id)a3;
- (void)reloadDescriptorsForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation NTKWidgetDescriptorProvider

+ (NTKWidgetDescriptorProvider)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_60);
  }
  v2 = (void *)sharedInstance_instance_0;

  return (NTKWidgetDescriptorProvider *)v2;
}

void __45__NTKWidgetDescriptorProvider_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v0;
}

- (NTKWidgetDescriptorProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)NTKWidgetDescriptorProvider;
  v2 = [(NTKWidgetDescriptorProvider *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NanoTimeKit.NTKWidgetDescriptorProvider", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = v3->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__NTKWidgetDescriptorProvider_init__block_invoke;
    block[3] = &unk_1E62BFF20;
    v12 = v3;
    dispatch_async(v9, block);
  }
  return v3;
}

uint64_t __35__NTKWidgetDescriptorProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addObserver:");
  v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "_queue_widgetDescriptorsChanged");
}

- (void)registerObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NSSet)descriptors
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSSet *)self->_lock_widgetDescriptors copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSDictionary)descriptorsByExtensionIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSDictionary *)self->_lock_descriptorsByExtensionIdentifier copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (id)collatedDescriptors
{
  uint64_t v3 = objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_descriptorsByExtensionIdentifier = self->_lock_descriptorsByExtensionIdentifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__NTKWidgetDescriptorProvider_collatedDescriptors__block_invoke;
  v9[3] = &unk_1E62C3F50;
  id v10 = v3;
  id v6 = v3;
  [(NSDictionary *)lock_descriptorsByExtensionIdentifier enumerateKeysAndObjectsUsingBlock:v9];
  os_unfair_lock_unlock(p_lock);
  dispatch_queue_t v7 = (void *)[v6 copy];

  return v7;
}

uint64_t __50__NTKWidgetDescriptorProvider_collatedDescriptors__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)reloadDescriptorsForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__NTKWidgetDescriptorProvider_reloadDescriptorsForContainerIdentifier_completion___block_invoke;
  block[3] = &unk_1E62C0098;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __82__NTKWidgetDescriptorProvider_reloadDescriptorsForContainerIdentifier_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) reloadDescriptorsForContainerIdentifier:a1[5] completion:a1[6]];
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NTKWidgetDescriptorProvider_descriptorsDidChangeForDescriptorProvider___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__NTKWidgetDescriptorProvider_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_widgetDescriptorsChanged");
}

- (void)_queue_widgetDescriptorsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(CHSWidgetDescriptorProvider *)self->_widgetDescriptorProvider descriptors];
  uint64_t v4 = [(CHSWidgetDescriptorProvider *)self->_widgetDescriptorProvider descriptorsByExtensionIdentifier];
  os_unfair_lock_lock(&self->_lock);
  lock_widgetDescriptors = self->_lock_widgetDescriptors;
  self->_lock_widgetDescriptors = v3;
  id v6 = v3;

  lock_descriptorsByExtensionIdentifier = self->_lock_descriptorsByExtensionIdentifier;
  self->_lock_descriptorsByExtensionIdentifier = v4;
  v8 = v4;

  self->_lock_firstLoadCompleted = 1;
  id v9 = (void *)[(NSHashTable *)self->_lock_observers copy];
  id v10 = [v9 allObjects];

  os_unfair_lock_unlock(&self->_lock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__NTKWidgetDescriptorProvider__queue_widgetDescriptorsChanged__block_invoke;
  v11[3] = &unk_1E62C3F78;
  v11[4] = self;
  [v10 enumerateObjectsUsingBlock:v11];
}

uint64_t __62__NTKWidgetDescriptorProvider__queue_widgetDescriptorsChanged__block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptorsDidChangeForDescriptorProvider:*(void *)(a1 + 32)];
}

- (BOOL)initalLoadCompleted
{
  return self->_initalLoadCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_descriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_widgetDescriptors, 0);
  objc_storeStrong((id *)&self->_widgetDescriptorProvider, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end