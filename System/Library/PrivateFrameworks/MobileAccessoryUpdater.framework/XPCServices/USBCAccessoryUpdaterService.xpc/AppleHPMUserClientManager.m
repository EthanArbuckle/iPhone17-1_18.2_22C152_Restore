@interface AppleHPMUserClientManager
+ (id)sharedInstance;
- (AppleHPMUserClientManager)init;
- (NSMutableOrderedSet)userClientSet;
- (id)userClientForRouterID:(unsigned __int8)a3 andRoute:(unint64_t)a4;
- (int)createUserClientForService:(unsigned int)a3;
- (int)findUserClients;
- (void)dealloc;
- (void)setUserClientSet:(id)a3;
@end

@implementation AppleHPMUserClientManager

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!qword_10002BAC0)
  {
    id v3 = objc_alloc_init((Class)v2);
    v4 = (void *)qword_10002BAC0;
    qword_10002BAC0 = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)qword_10002BAC0;
  return v5;
}

- (AppleHPMUserClientManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AppleHPMUserClientManager;
  id v2 = [(AppleHPMUserClientManager *)&v5 init];
  if (v2)
  {
    id v3 = +[NSMutableOrderedSet orderedSet];
    [(AppleHPMUserClientManager *)v2 setUserClientSet:v3];

    [(AppleHPMUserClientManager *)v2 findUserClients];
  }
  return v2;
}

- (void)dealloc
{
  [(AppleHPMUserClientManager *)self setUserClientSet:0];
  v3.receiver = self;
  v3.super_class = (Class)AppleHPMUserClientManager;
  [(AppleHPMUserClientManager *)&v3 dealloc];
}

- (id)userClientForRouterID:(unsigned __int8)a3 andRoute:(unint64_t)a4
{
  int v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(AppleHPMUserClientManager *)self userClientSet];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 routerID] == v5 && objc_msgSend(v11, "routeString") == (id)a4)
        {
          id v12 = v11;
          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (int)findUserClients
{
  kern_return_t MatchingServices;
  uint64_t v5;
  uint64_t v6;
  io_iterator_t existing;

  CFDictionaryRef v3 = IOServiceMatching("AppleHPM");
  existing = 0;
  if (!v3) {
    return -536870212;
  }
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v3, &existing);
  if (!existing) {
    return -536870160;
  }
  if (!MatchingServices)
  {
    IOIteratorReset(existing);
    int v5 = IOIteratorNext(existing);
    if (v5)
    {
      v6 = v5;
      do
      {
        [(AppleHPMUserClientManager *)self createUserClientForService:v6];
        v6 = IOIteratorNext(existing);
      }
      while (v6);
    }
  }
  if (existing) {
    IOObjectRelease(existing);
  }
  return MatchingServices;
}

- (int)createUserClientForService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = objc_alloc_init(AppleHPMUserClient);
  int v6 = [(AppleHPMUserClient *)v5 createUserClientForService:v3];
  if (!v6)
  {
    id v7 = [(AppleHPMUserClientManager *)self userClientSet];
    [v7 addObject:v5];
  }
  return v6;
}

- (NSMutableOrderedSet)userClientSet
{
  return self->_userClientSet;
}

- (void)setUserClientSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end