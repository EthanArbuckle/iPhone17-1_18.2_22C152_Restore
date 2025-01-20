@interface NPTONotificationCenter
- (NPTODarwinNotificationObserver)observerForName:(void *)a3 queue:(void *)a4 block:;
- (void)initWithDevice:(void *)a1;
- (void)postNotificationName:(uint64_t)a1;
@end

@implementation NPTONotificationCenter

- (void)initWithDevice:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)NPTONotificationCenter;
    a1 = objc_msgSendSuper2(&v8, sel_init);
    if (a1)
    {
      v4 = [v3 pairingID];
      uint64_t v5 = [v4 UUIDString];
      v6 = (void *)a1[1];
      a1[1] = v5;
    }
  }

  return a1;
}

- (NPTODarwinNotificationObserver)observerForName:(void *)a3 queue:(void *)a4 block:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v9 = [a3 underlyingQueue];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    v13 = [NPTODarwinNotificationObserver alloc];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__NPTONotificationCenter_observerForName_queue_block___block_invoke;
    v15[3] = &unk_2644EBF28;
    id v16 = v7;
    id v17 = v8;
    a1 = [(NPTODarwinNotificationObserver *)v13 initWithNotificationName:v16 queue:v12 block:v15];
  }
  return a1;
}

uint64_t __54__NPTONotificationCenter_observerForName_queue_block___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = nanophotos_log_sync();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21ECC3000, v2, OS_LOG_TYPE_DEFAULT, "[NotificationCenter] Received notitication %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)postNotificationName:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v4 = nanophotos_log_sync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 8);
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_21ECC3000, v4, OS_LOG_TYPE_DEFAULT, "[NotificationCenter] Posting notitication %@ for device %@", (uint8_t *)&v6, 0x16u);
    }

    notify_post((const char *)[v3 UTF8String]);
  }
}

- (void).cxx_destruct
{
}

@end