@interface MUPoolObject
+ ($C1EE5CA450488CD6584B36957BF76FB0)poolInfo;
+ (BOOL)clearVars;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)pooledClasses;
+ (int64_t)clearPool;
+ (void)clearAllPools;
- (void)release;
@end

@implementation MUPoolObject

+ (id)pooledClasses
{
  id result = (id)qword_1F1330;
  if (!qword_1F1330)
  {
    id result = objc_alloc_init((Class)NSMutableArray);
    qword_1F1330 = (uint64_t)result;
  }
  return result;
}

+ (void)clearAllPools
{
  v2 = (void *)qword_1F1330;
  objc_sync_enter((id)qword_1F1330);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = +[MUPoolObject pooledClasses];
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [NSClassFromString(*(NSString **)(*((void *)&v7 + 1) + 8 * (void)v6)) clearPool];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  objc_msgSend(+[MUPoolObject pooledClasses](MUPoolObject, "pooledClasses"), "removeAllObjects");
  objc_sync_exit(v2);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v4 = (void *)qword_1F1330;
  objc_sync_enter((id)qword_1F1330);
  uint64_t v5 = (uint64_t *)[(id)objc_opt_class() poolInfo];
  if (!*v5)
  {
    *uint64_t v5 = objc_opt_class();
    v5[1] = 0;
    *((unsigned char *)v5 + 24) = [(id)objc_opt_class() clearVars];
    v5[2] = (uint64_t)objc_alloc_init((Class)NSObject);
    *((unsigned char *)v5 + 25) = 0;
    objc_msgSend(+[MUPoolObject pooledClasses](MUPoolObject, "pooledClasses"), "addObject:", NSStringFromClass((Class)*v5));
  }
  objc_sync_exit(v4);
  v6 = (void *)v5[2];
  objc_sync_enter(v6);
  long long v7 = (void *)v5[1];
  if (v7)
  {
    v5[1] = v7[1];
    if (*((unsigned char *)v5 + 24))
    {
      size_t v8 = malloc_size(v7);
      bzero(v7 + 2, v8 - 16);
    }
    id v9 = v7;
  }
  else
  {
    id v9 = NSAllocateObject((Class)a1, 0, 0);
  }
  objc_sync_exit(v6);
  if (v7) {
    return v7;
  }
  else {
    return v9;
  }
}

- (void)release
{
  id v3 = (void *)qword_1F1330;
  objc_sync_enter((id)qword_1F1330);
  id v4 = [(id)objc_opt_class() poolInfo];
  objc_sync_exit(v3);
  if ([(MUPoolObject *)self retainCount] == (char *)&dword_0 + 1 && !*((unsigned char *)v4 + 25))
  {
    [(MUPoolObject *)self purge];
    uint64_t v5 = (void *)*((void *)v4 + 2);
    objc_sync_enter(v5);
    self->mPoolPrev = (MUPoolObject *)*((void *)v4 + 1);
    *((void *)v4 + 1) = self;
    objc_sync_exit(v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MUPoolObject;
    [(MUPoolObject *)&v6 release];
  }
}

+ (int64_t)clearPool
{
  id v2 = [(id)objc_opt_class() poolInfo];
  id v3 = (void *)*((void *)v2 + 2);
  objc_sync_enter(v3);
  *((unsigned char *)v2 + 25) = 1;
  id v4 = (void *)*((void *)v2 + 1);
  if (v4)
  {
    int64_t v5 = 0;
    do
    {
      *((void *)v2 + 1) = v4[1];
      [v4 purge];

      ++v5;
      id v4 = (void *)*((void *)v2 + 1);
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }
  objc_sync_exit(v3);
  *((void *)v2 + 1) = 0;

  *((void *)v2 + 2) = 0;
  return v5;
}

+ ($C1EE5CA450488CD6584B36957BF76FB0)poolInfo
{
  return 0;
}

+ (BOOL)clearVars
{
  return 1;
}

@end