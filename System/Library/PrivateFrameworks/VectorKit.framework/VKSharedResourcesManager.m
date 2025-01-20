@interface VKSharedResourcesManager
+ (id)sharedManager;
+ (id)sharedResources;
+ (id)sharedResourcesCreateIfNil:(BOOL)a3 addResourceUser:(BOOL)a4;
+ (void)removeResourceUser;
- (BOOL)hasResources;
- (VKSharedResourcesManager)init;
- (id).cxx_construct;
- (id)resourcesCreateIfNil:(BOOL)a3 addResourceUser:(BOOL)a4;
- (void)_removeResourceUser;
@end

@implementation VKSharedResourcesManager

- (BOOL)hasResources
{
  v2 = self;
  v3 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  LOBYTE(v2) = *((void *)v2 + 9) != 0;
  std::mutex::unlock(v3);
  return (char)v2;
}

+ (id)sharedResourcesCreateIfNil:(BOOL)a3 addResourceUser:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = +[VKSharedResourcesManager sharedManager];
  v7 = [v6 resourcesCreateIfNil:v5 addResourceUser:v4];

  return v7;
}

+ (id)sharedResources
{
  v2 = +[VKSharedResourcesManager sharedManager];
  v3 = [v2 resourcesCreateIfNil:1 addResourceUser:0];

  return v3;
}

+ (id)sharedManager
{
  if (+[VKSharedResourcesManager sharedManager]::_once != -1) {
    dispatch_once(&+[VKSharedResourcesManager sharedManager]::_once, &__block_literal_global_88);
  }
  v2 = (void *)+[VKSharedResourcesManager sharedManager]::singleton;
  return v2;
}

- (id)resourcesCreateIfNil:(BOOL)a3 addResourceUser:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v8 = (void *)*((void *)self + 9);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v5;
  }
  if (!v9) {
    operator new();
  }
  if (v8) {
    BOOL v10 = !v4;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    [v8 _addResourceUser];
    v8 = (void *)*((void *)self + 9);
  }
  id v11 = v8;
  std::mutex::unlock(v7);
  return v11;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  return self;
}

void __41__VKSharedResourcesManager_sharedManager__block_invoke()
{
  if (!+[VKSharedResourcesManager sharedManager]::singleton)
  {
    v0 = objc_alloc_init(VKSharedResourcesManager);
    v1 = (void *)+[VKSharedResourcesManager sharedManager]::singleton;
    +[VKSharedResourcesManager sharedManager]::singleton = (uint64_t)v0;
  }
}

- (VKSharedResourcesManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKSharedResourcesManager;
  v2 = [(VKSharedResourcesManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

- (void)_removeResourceUser
{
  v3 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  BOOL v4 = (void *)*((void *)self + 9);
  if (v4)
  {
    [v4 _removeResourceUser];
    if (([*((id *)self + 9) _hasResourceUsers] & 1) == 0)
    {
      BOOL v5 = (void *)*((void *)self + 9);
      *((void *)self + 9) = 0;

      objc_super v6 = [MEMORY[0x1E4F64AC8] modernLoader];
      [v6 clearAllCaches];
    }
  }
  std::mutex::unlock(v3);
}

+ (void)removeResourceUser
{
  id v2 = +[VKSharedResourcesManager sharedManager];
  [v2 _removeResourceUser];
}

@end