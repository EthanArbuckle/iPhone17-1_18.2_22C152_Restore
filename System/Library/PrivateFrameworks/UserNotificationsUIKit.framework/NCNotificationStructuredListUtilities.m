@interface NCNotificationStructuredListUtilities
+ (BOOL)_isNotificationListBaseComponentDelegateMethod:(SEL)a3;
+ (BOOL)_isNotificationListComponentDelegateMethod:(SEL)a3;
+ (BOOL)isNotificationListComponentDelegateMethod:(SEL)a3;
+ (id)_selectorsForProtocol:(id)a3;
@end

@implementation NCNotificationStructuredListUtilities

+ (BOOL)isNotificationListComponentDelegateMethod:(SEL)a3
{
  if (objc_msgSend(a1, "_isNotificationListComponentDelegateMethod:")) {
    return 1;
  }

  return [a1 _isNotificationListBaseComponentDelegateMethod:a3];
}

+ (BOOL)_isNotificationListComponentDelegateMethod:(SEL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__NCNotificationStructuredListUtilities__isNotificationListComponentDelegateMethod___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_isNotificationListComponentDelegateMethod__onceToken != -1) {
    dispatch_once(&_isNotificationListComponentDelegateMethod__onceToken, block);
  }
  v4 = (void *)_isNotificationListComponentDelegateMethod____notificationListComponentDelegateSelectors;
  v5 = NSStringFromSelector(a3);
  LOBYTE(v4) = [v4 containsObject:v5];

  return (char)v4;
}

void __84__NCNotificationStructuredListUtilities__isNotificationListComponentDelegateMethod___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _selectorsForProtocol:&unk_1F2F92D60];
  v2 = (void *)_isNotificationListComponentDelegateMethod____notificationListComponentDelegateSelectors;
  _isNotificationListComponentDelegateMethod____notificationListComponentDelegateSelectors = v1;
}

+ (BOOL)_isNotificationListBaseComponentDelegateMethod:(SEL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NCNotificationStructuredListUtilities__isNotificationListBaseComponentDelegateMethod___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_isNotificationListBaseComponentDelegateMethod__onceToken != -1) {
    dispatch_once(&_isNotificationListBaseComponentDelegateMethod__onceToken, block);
  }
  v4 = (void *)_isNotificationListBaseComponentDelegateMethod____notificationListBaseComponentDelegateSelectors;
  v5 = NSStringFromSelector(a3);
  LOBYTE(v4) = [v4 containsObject:v5];

  return (char)v4;
}

void __88__NCNotificationStructuredListUtilities__isNotificationListBaseComponentDelegateMethod___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _selectorsForProtocol:&unk_1F2F919F0];
  v2 = (void *)_isNotificationListBaseComponentDelegateMethod____notificationListBaseComponentDelegateSelectors;
  _isNotificationListBaseComponentDelegateMethod____notificationListBaseComponentDelegateSelectors = v1;
}

+ (id)_selectorsForProtocol:(id)a3
{
  v3 = (Protocol *)a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unsigned int outCount = 0;
  v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount);
  unsigned int v12 = 0;
  v6 = protocol_copyMethodDescriptionList(v3, 0, 1, &v12);
  unsigned int v7 = outCount;
  if (v12 + outCount)
  {
    unsigned int v8 = 0;
    do
    {
      if (v8 >= v7)
      {
        v9 = v6;
      }
      else
      {
        unsigned int v7 = 0;
        v9 = v5;
      }
      v10 = NSStringFromSelector(v9[v8 - v7].name);
      [v4 addObject:v10];

      ++v8;
      unsigned int v7 = outCount;
    }
    while (v8 < v12 + outCount);
  }
  free(v5);
  free(v6);

  return v4;
}

@end