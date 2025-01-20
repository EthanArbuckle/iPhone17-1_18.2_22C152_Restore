@interface NSDistributedNotificationCenter(WeakObservers)
- (uint64_t)_internalNameForNotificationName:()WeakObservers;
- (uint64_t)weak_removeObserver:()WeakObservers;
- (void)_handleNotification:()WeakObservers;
- (void)weak_addObserver:()WeakObservers selector:name:object:;
- (void)weak_removeObserver:()WeakObservers name:object:;
@end

@implementation NSDistributedNotificationCenter(WeakObservers)

- (uint64_t)weak_removeObserver:()WeakObservers
{
  return objc_msgSend(a1, "weak_removeObserver:name:object:", a3, 0, 0);
}

- (void)weak_removeObserver:()WeakObservers name:object:
{
  v8 = (void *)MEMORY[0x263F08A00];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v13 = [v8 defaultCenter];
  v12 = [a1 _internalNameForNotificationName:v10];

  [v13 removeObserver:v11 name:v12 object:v9];
}

- (void)weak_addObserver:()WeakObservers selector:name:object:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  [a1 removeObserver:a1 name:v11 object:0];
  [a1 addObserver:a1 selector:sel__handleNotification_ name:v11 object:0];
  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  id v13 = [a1 _internalNameForNotificationName:v11];

  [v14 addObserver:v12 selector:a4 name:v13 object:v10];
}

- (uint64_t)_internalNameForNotificationName:()WeakObservers
{
  return [a3 stringByAppendingString:@"_internal"];
}

- (void)_handleNotification:()WeakObservers
{
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v10 = [v4 defaultCenter];
  v6 = [v5 name];
  v7 = [a1 _internalNameForNotificationName:v6];
  v8 = [v5 object];
  id v9 = [v5 userInfo];

  [v10 postNotificationName:v7 object:v8 userInfo:v9];
}

@end