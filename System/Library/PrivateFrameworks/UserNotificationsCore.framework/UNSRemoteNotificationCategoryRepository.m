@interface UNSRemoteNotificationCategoryRepository
- (UNSRemoteNotificationCategoryRepository)initWithServiceClient:(id)a3;
- (id)allBundleIdentifiers;
- (id)categoriesForBundleIdentifier:(id)a3;
- (id)categoryWithIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)notifyDidChangeCategoriesForBundleIdentifier:(id)a3;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation UNSRemoteNotificationCategoryRepository

- (UNSRemoteNotificationCategoryRepository)initWithServiceClient:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UNSRemoteNotificationCategoryRepository;
  v6 = [(UNSRemoteNotificationCategoryRepository *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.UserNotificationsCore.UNSRemoteNotificationCategoryRepository", v8);

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.UserNotificationsCore.UNSRemoteNotificationCategoryRepository.call-out", v10);

    v12 = [[UNCKeyedObservable alloc] initWithQueue:v9 callOutQueue:v11];
    observable = v7->_observable;
    v7->_observable = v12;
  }
  return v7;
}

- (void)notifyDidChangeCategoriesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  observable = self->_observable;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__UNSRemoteNotificationCategoryRepository_notifyDidChangeCategoriesForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567750;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(UNCKeyedObservable *)observable notifyObserversKey:v6 usingBlock:v7];
}

uint64_t __88__UNSRemoteNotificationCategoryRepository_notifyDidChangeCategoriesForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 categoryRepository:*(void *)(a1 + 32) didChangeCategoriesForBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
}

- (id)allBundleIdentifiers
{
  return (id)[(UNCNotificationCommonServiceServerProtocol *)self->_serviceClient allBundleIdentifiersForCategories];
}

- (id)categoryWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return (id)[(UNCNotificationCommonServiceServerProtocol *)self->_serviceClient categoryForIdentifier:a3 bundleIdentifier:a4];
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return (id)[(UNCNotificationCommonServiceServerProtocol *)self->_serviceClient categoriesForBundleIdentifier:a3];
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_serviceClient, 0);
}

@end