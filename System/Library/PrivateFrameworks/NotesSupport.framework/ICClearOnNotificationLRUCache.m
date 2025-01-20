@interface ICClearOnNotificationLRUCache
- (ICClearOnNotificationLRUCache)initWithMaxSize:(unint64_t)a3 notificationName:(id)a4;
- (NSObject)notificationToken;
- (void)dealloc;
- (void)setNotificationToken:(id)a3;
@end

@implementation ICClearOnNotificationLRUCache

- (ICClearOnNotificationLRUCache)initWithMaxSize:(unint64_t)a3 notificationName:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICClearOnNotificationLRUCache;
  v7 = [(ICLRUCache *)&v17 initWithMaxSize:a3];
  if (v7)
  {
    objc_initWeak(&location, v7);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __66__ICClearOnNotificationLRUCache_initWithMaxSize_notificationName___block_invoke;
    v14 = &unk_2640CD960;
    objc_copyWeak(&v15, &location);
    v9 = [v8 addObserverForName:v6 object:0 queue:0 usingBlock:&v11];
    -[ICClearOnNotificationLRUCache setNotificationToken:](v7, "setNotificationToken:", v9, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)setNotificationToken:(id)a3
{
}

void __66__ICClearOnNotificationLRUCache_initWithMaxSize_notificationName___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    [v5 removeAllObjects];
    objc_sync_exit(v5);

    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"ICCachedClearedOnChangedNotification" object:v5];
  }
}

- (void)dealloc
{
  v3 = [(ICClearOnNotificationLRUCache *)self notificationToken];

  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    id v5 = [(ICClearOnNotificationLRUCache *)self notificationToken];
    [v4 removeObserver:v5];

    [(ICClearOnNotificationLRUCache *)self setNotificationToken:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICClearOnNotificationLRUCache;
  [(ICClearOnNotificationLRUCache *)&v6 dealloc];
}

- (NSObject)notificationToken
{
  return self->_notificationToken;
}

- (void).cxx_destruct
{
}

@end