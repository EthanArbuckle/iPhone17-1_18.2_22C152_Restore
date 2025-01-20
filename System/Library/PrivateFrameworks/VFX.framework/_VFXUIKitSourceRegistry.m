@interface _VFXUIKitSourceRegistry
+ (id)sharedInstance;
+ (void)registerUIKitSource:(id)a3;
+ (void)unregisterUIKitSource:(id)a3;
- (_VFXUIKitSourceRegistry)init;
- (void)add:(id)a3;
- (void)apply:(id)a3;
- (void)dealloc;
- (void)remove:(id)a3;
@end

@implementation _VFXUIKitSourceRegistry

+ (id)sharedInstance
{
  if (qword_1E9DDAFD8 != -1) {
    dispatch_once(&qword_1E9DDAFD8, &unk_1F0FB5A68);
  }
  return (id)qword_1E9DDAFE0;
}

- (_VFXUIKitSourceRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)_VFXUIKitSourceRegistry;
  v2 = [(_VFXUIKitSourceRegistry *)&v4 init];
  if (v2) {
    v2->_sources = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_VFXUIKitSourceRegistry;
  [(_VFXUIKitSourceRegistry *)&v3 dealloc];
}

- (void)add:(id)a3
{
  objc_sync_enter(self);
  objc_msgSend_addObject_(self->_sources, v5, (uint64_t)a3, v6);

  objc_sync_exit(self);
}

- (void)remove:(id)a3
{
  objc_sync_enter(self);
  objc_msgSend_removeObject_(self->_sources, v5, (uint64_t)a3, v6);

  objc_sync_exit(self);
}

- (void)apply:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sources = self->_sources;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(sources, v6, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(sources);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v11 + 1) + 8 * i));
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(sources, v10, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
}

+ (void)registerUIKitSource:(id)a3
{
  uint64_t v5 = objc_msgSend_sharedInstance(a1, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_add_, a3, v6);
}

+ (void)unregisterUIKitSource:(id)a3
{
  uint64_t v5 = objc_msgSend_sharedInstance(a1, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_remove_, a3, v6);
}

@end