@interface VKIconManager
+ (id)sharedManager;
- (BOOL)isCachingAtlases;
- (VKIconManager)init;
- (id).cxx_construct;
- (id)_internalIconManager;
- (id)imageForDataID:(unsigned int)a3 text:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7;
- (id)imageForIconID:(unsigned int)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6;
- (id)imageForImageSourceKey:(id)a3;
- (id)imageForKey:(unsigned int)a3 value:(unsigned int)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7;
- (id)imageForName:(id)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6;
- (id)imageForStyleAttributes:(id)a3 styleManager:(shared_ptr<gss:(float)a5 :(int64_t)a6 StylesheetManager<gss:(id)a7 :PropertyID>>)a4 contentScale:sizeGroup:modifiers:;
- (id)imageForStyleAttributes:(id)a3 withStylesheetName:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7;
- (unsigned)darkVariant;
- (unsigned)styleAttributeTransitSystemTypeKey;
- (unsigned)styleAttributeTransitTypeKey;
- (unsigned)trafficIncidentTypeKey;
- (void)dealloc;
- (void)purge;
- (void)setIsCachingAtlases:(BOOL)a3;
@end

@implementation VKIconManager

void __30__VKIconManager_sharedManager__block_invoke()
{
  if (!+[VKIconManager sharedManager]::singleton)
  {
    v0 = objc_alloc_init(VKIconManager);
    v1 = (void *)+[VKIconManager sharedManager]::singleton;
    +[VKIconManager sharedManager]::singleton = (uint64_t)v0;
  }
}

- (VKIconManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)VKIconManager;
  v2 = [(VKIconManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = 0;

    v5 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = 0;

    v6 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = 0;

    v7 = +[VKSharedResourcesManager sharedManager];
    *((unsigned char *)v3 + 24) = [v7 hasResources];
    v8 = v3;
  }
  return v3;
}

+ (id)sharedManager
{
  if (+[VKIconManager sharedManager]::_once != -1) {
    dispatch_once(&+[VKIconManager sharedManager]::_once, &__block_literal_global_12408);
  }
  v2 = (void *)+[VKIconManager sharedManager]::singleton;
  return v2;
}

- (id)imageForIconID:(unsigned int)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  v11 = [(VKIconManager *)self _internalIconManager];
  *(float *)&double v12 = a4;
  v13 = [v11 imageForIconID:v8 contentScale:a5 sizeGroup:v10 modifiers:v12];

  return v13;
}

- (id)imageForStyleAttributes:(id)a3 withStylesheetName:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = [(VKIconManager *)self _internalIconManager];
  *(float *)&double v16 = a5;
  v17 = [v15 imageForStyleAttributes:v12 withStylesheetName:v13 contentScale:a6 sizeGroup:v14 modifiers:v16];

  return v17;
}

- (id)_internalIconManager
{
  v3 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  v4 = (void *)*((void *)self + 2);
  if (v4) {
    goto LABEL_2;
  }
  v6 = (void *)*((void *)self + 1);
  if (!v6)
  {
    uint64_t v7 = +[VKSharedResourcesManager sharedResourcesCreateIfNil:0 addResourceUser:1];
    uint64_t v8 = (void *)*((void *)self + 1);
    *((void *)self + 1) = v7;

    v6 = (void *)*((void *)self + 1);
    if (!v6)
    {
      v20 = objc_alloc_init(VKInternalIconManager);
      v21 = (void *)*((void *)self + 2);
      *((void *)self + 2) = v20;

      v4 = (void *)*((void *)self + 2);
LABEL_2:
      id v5 = v4;
      goto LABEL_6;
    }
  }
  id v5 = [v6 iconManager];
LABEL_6:
  v9 = v5;
  id v10 = *((void *)self + 12);
  if (v10)
  {
    dispatch_source_cancel(v10);
    v11 = (void *)*((void *)self + 12);
    *((void *)self + 12) = 0;
  }
  id v12 = dispatch_get_global_queue(-32768, 0);
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
  id v14 = (void *)*((void *)self + 12);
  *((void *)self + 12) = v13;

  int v15 = *((_DWORD *)self + 26) + 1;
  *((_DWORD *)self + 26) = v15;
  objc_initWeak(&location, self);
  double v16 = *((void *)self + 12);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __37__VKIconManager__internalIconManager__block_invoke;
  handler[3] = &unk_1E5A8FDD8;
  objc_copyWeak(&v23, &location);
  int v24 = v15;
  dispatch_source_set_event_handler(v16, handler);
  v17 = *((void *)self + 12);
  dispatch_time_t v18 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_resume(*((dispatch_object_t *)self + 12));
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  std::mutex::unlock(v3);
  return v9;
}

- (id).cxx_construct
{
  *((void *)self + 4) = 850045863;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 12, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 32));
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (void)purge
{
  v3 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  v4 = (void *)*((void *)self + 2);
  if (v4) {
    [v4 purgeNonsharedResources];
  }
  std::mutex::unlock(v3);
}

- (void)setIsCachingAtlases:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKIconManager *)self _internalIconManager];
  [v4 setIsCachingAtlases:v3];
}

- (BOOL)isCachingAtlases
{
  v2 = [(VKIconManager *)self _internalIconManager];
  char v3 = [v2 isCachingAtlases];

  return v3;
}

- (unsigned)darkVariant
{
  v2 = [(VKIconManager *)self _internalIconManager];
  unsigned int v3 = [v2 darkVariant];

  return v3;
}

- (unsigned)trafficIncidentTypeKey
{
  v2 = [(VKIconManager *)self _internalIconManager];
  unsigned int v3 = [v2 trafficIncidentTypeKey];

  return v3;
}

- (unsigned)styleAttributeTransitSystemTypeKey
{
  v2 = [(VKIconManager *)self _internalIconManager];
  unsigned int v3 = [v2 styleAttributeTransitSystemTypeKey];

  return v3;
}

- (unsigned)styleAttributeTransitTypeKey
{
  v2 = [(VKIconManager *)self _internalIconManager];
  unsigned int v3 = [v2 styleAttributeTransitTypeKey];

  return v3;
}

- (id)imageForName:(id)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(VKIconManager *)self _internalIconManager];
  *(float *)&double v13 = a4;
  id v14 = [v12 imageForName:v10 contentScale:a5 sizeGroup:v11 modifiers:v13];

  return v14;
}

- (id)imageForKey:(unsigned int)a3 value:(unsigned int)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  double v13 = [(VKIconManager *)self _internalIconManager];
  *(float *)&double v14 = a5;
  int v15 = [v13 imageForKey:v10 value:v9 contentScale:a6 sizeGroup:v12 modifiers:v14];

  return v15;
}

- (id)imageForDataID:(unsigned int)a3 text:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a7;
  double v14 = [(VKIconManager *)self _internalIconManager];
  *(float *)&double v15 = a5;
  double v16 = [v14 imageForDataID:v10 text:v12 contentScale:a6 sizeGroup:v13 modifiers:v15];

  return v16;
}

- (id)imageForStyleAttributes:(id)a3 styleManager:(shared_ptr<gss:(float)a5 :(int64_t)a6 StylesheetManager<gss:(id)a7 :PropertyID>>)a4 contentScale:sizeGroup:modifiers:
{
  cntrl = a4.__cntrl_;
  ptr = (uint64_t *)a4.__ptr_;
  id v12 = a3;
  id v13 = (id)a6;
  double v14 = [(VKIconManager *)self _internalIconManager];
  double v16 = v14;
  v17 = (std::__shared_weak_count *)ptr[1];
  uint64_t v21 = *ptr;
  v22 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(float *)&double v15 = a5;
  dispatch_time_t v18 = [v14 imageForStyleAttributes:v12 styleManager:&v21 contentScale:cntrl sizeGroup:v13 modifiers:v15];
  v19 = v22;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }

  return v18;
}

- (id)imageForImageSourceKey:(id)a3
{
  id v4 = a3;
  id v5 = [(VKIconManager *)self _internalIconManager];
  v6 = [v5 imageForImageSourceKey:v4];

  return v6;
}

void __37__VKIconManager__internalIconManager__block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned int v3 = (std::mutex *)(WeakRetained + 32);
    uint64_t v9 = WeakRetained;
    std::mutex::lock((std::mutex *)(WeakRetained + 32));
    if (*((_DWORD *)v9 + 26) == *(_DWORD *)(a1 + 40))
    {
      id v4 = *((void *)v9 + 12);
      if (v4)
      {
        dispatch_source_cancel(v4);
        id v5 = (void *)*((void *)v9 + 12);
        *((void *)v9 + 12) = 0;
      }
      v6 = (void *)*((void *)v9 + 2);
      if (v6)
      {
        [v6 purgeNonsharedResources];
        uint64_t v7 = (void *)*((void *)v9 + 2);
        *((void *)v9 + 2) = 0;
      }
      uint64_t v8 = (void *)*((void *)v9 + 1);
      if (v8)
      {
        *((void *)v9 + 1) = 0;

        +[VKSharedResourcesManager removeResourceUser];
      }
    }
    std::mutex::unlock(v3);
    WeakRetained = v9;
  }
}

- (void)dealloc
{
  unsigned int v3 = (void *)*((void *)self + 2);
  if (v3)
  {
    [v3 purgeNonsharedResources];
    id v4 = (void *)*((void *)self + 2);
    *((void *)self + 2) = 0;
  }
  id v5 = (void *)*((void *)self + 1);
  if (v5)
  {
    *((void *)self + 1) = 0;

    +[VKSharedResourcesManager removeResourceUser];
  }
  v6 = *((void *)self + 12);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v7 = (void *)*((void *)self + 12);
    *((void *)self + 12) = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)VKIconManager;
  [(VKIconManager *)&v8 dealloc];
}

@end