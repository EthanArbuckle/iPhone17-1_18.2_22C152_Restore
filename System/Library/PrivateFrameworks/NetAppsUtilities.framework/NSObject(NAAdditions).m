@interface NSObject(NAAdditions)
- (_NAKeyValueObserverProxy)na_addNotificationBlockObserverForObject:()NAAdditions keyPath:options:usingBlock:;
- (_NANotificationObserverProxy)na_addNotificationBlockObserverForName:()NAAdditions object:queue:usingBlock:;
- (id)na_associatedObjectForDescriptor:()NAAdditions;
- (void)_na_addNotificationObserverProxy:()NAAdditions;
- (void)_na_removeNotificationObserverProxy:()NAAdditions;
- (void)na_setAssociatedObject:()NAAdditions associatedObjectDescriptor:;
@end

@implementation NSObject(NAAdditions)

- (_NAKeyValueObserverProxy)na_addNotificationBlockObserverForObject:()NAAdditions keyPath:options:usingBlock:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, a1);
  v13 = [_NAKeyValueObserverProxy alloc];
  id v14 = objc_loadWeakRetained(&location);
  v15 = [(_NAKeyValueObserverProxy *)v13 initWithWeakObserver:v14 observedObject:v10 keyPath:v11 options:a5 observerBlock:v12];

  objc_msgSend(a1, "_na_addNotificationObserverProxy:", v15);
  objc_destroyWeak(&location);

  return v15;
}

- (void)_na_addNotificationObserverProxy:()NAAdditions
{
  id v6 = a3;
  v4 = objc_msgSend(a1, "na_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
  v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
  }
  [v5 addObject:v6];
  objc_msgSend(a1, "na_setAssociatedObject:associatedObjectDescriptor:", v5, &sObserverProxiesAssociatedObject);
}

- (void)na_setAssociatedObject:()NAAdditions associatedObjectDescriptor:
{
}

- (id)na_associatedObjectForDescriptor:()NAAdditions
{
  return objc_getAssociatedObject(a1, *a3);
}

- (_NANotificationObserverProxy)na_addNotificationBlockObserverForName:()NAAdditions object:queue:usingBlock:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, a1);
  id v14 = [_NANotificationObserverProxy alloc];
  id v15 = objc_loadWeakRetained(&location);
  v16 = [(_NANotificationObserverProxy *)v14 initWithWeakObserver:v15 notificationName:v10 observerQueue:v12 observerBlock:v13];

  objc_msgSend(a1, "_na_addNotificationObserverProxy:", v16);
  objc_destroyWeak(&location);

  return v16;
}

- (void)_na_removeNotificationObserverProxy:()NAAdditions
{
  if (a3)
  {
    id v4 = a3;
    [v4 invalidate];
    v5 = objc_msgSend(a1, "na_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
    id v6 = (id)[v5 mutableCopy];

    [v6 removeObject:v4];
    objc_msgSend(a1, "na_setAssociatedObject:associatedObjectDescriptor:", v6, &sObserverProxiesAssociatedObject);
  }
}

@end