@interface EspressoWrapper
+ (id)cache;
+ (id)cachedEspressoWrapper:(id)a3;
+ (id)pathFromBaseName:(id)a3;
+ (void)clearCache;
- (BOOL)buildWait;
- (BOOL)built;
- (BOOL)hasBlob:(const char *)a3;
- (EspressoWrapper)initWithPath:(id)a3;
- (NSString)path;
- (id)CIImageProcessorDigestObject;
- (int)bind:(const char *)a3 buffer:(__CVBuffer *)a4;
- (int)execute;
- (int)executeAsync:(id)a3;
- (int)planIdx;
- (void)buildAsync;
- (void)ctx;
- (void)dealloc;
- (void)plan;
- (void)setBuilt:(BOOL)a3;
- (void)setCtx:(void *)a3;
- (void)setPlan:(void *)a3;
- (void)setPlanIdx:(int)a3;
@end

@implementation EspressoWrapper

+ (id)cache
{
  if (qword_26B4252E0 != -1) {
    dispatch_once(&qword_26B4252E0, &unk_270E12E78);
  }
  v2 = (void *)qword_26B4252E8;

  return v2;
}

- (EspressoWrapper)initWithPath:(id)a3
{
  v4 = (NSString *)a3;
  v13.receiver = self;
  v13.super_class = (Class)EspressoWrapper;
  v5 = [(EspressoWrapper *)&v13 init];
  path = v5->_path;
  v5->_path = v4;
  v7 = v4;

  dispatch_queue_t v8 = dispatch_queue_create("EspressoWrapper", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v8;

  objc_msgSend_buildAsync(v5, v10, v11);
  return v5;
}

+ (id)cachedEspressoWrapper:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_cache(a1, v5, v6);
  v9 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)v4);

  if (!v9)
  {
    id v10 = objc_alloc((Class)a1);
    v9 = objc_msgSend_initWithPath_(v10, v11, (uint64_t)v4);
    if (v9)
    {
      v14 = objc_msgSend_cache(a1, v12, v13);
      objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)v9, v4);
    }
  }

  return v9;
}

+ (void)clearCache
{
  objc_msgSend_cache(a1, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v5, v3, v4);
}

+ (id)pathFromBaseName:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  Class v4 = NSClassFromString(&cfstr_Bwespressoinfe.isa);
  SEL v5 = NSSelectorFromString(&cfstr_Espressonetwor.isa);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (dispatch_queue_t v8 = (void (*)(Class, SEL, id, uint64_t))objc_msgSend_methodForSelector_(v4, v6, (uint64_t)v5)) == 0
    || (v8(v4, v5, v3, 1),
        v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_path(v9, v10, v11),
        v12 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v12))
  {
    uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7);
    objc_msgSend_contentsOfDirectoryAtPath_error_(v13, v14, @"/System/Library/ImagingNetworks", 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v24, v28, 16);
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v15);
          }
          v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend_hasPrefix_(v22, v18, (uint64_t)v3)
            && (objc_msgSend_hasSuffix_(v22, v18, @".espresso.net") & 1) != 0)
          {
            v12 = objc_msgSend_stringWithFormat_(NSString, v18, @"/System/Library/ImagingNetworks/%@", v22);
            goto LABEL_15;
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v24, v28, 16);
        if (v19) {
          continue;
        }
        break;
      }
    }
    v12 = 0;
LABEL_15:
  }

  return v12;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  self->_ctx = 0;
  self->_plan = 0;
  v3.receiver = self;
  v3.super_class = (Class)EspressoWrapper;
  [(EspressoWrapper *)&v3 dealloc];
}

- (int)planIdx
{
  return self->_planIdx;
}

- (void)setPlanIdx:(int)a3
{
  self->_planIdx = a3;
}

- (BOOL)built
{
  return self->_built;
}

- (void)setBuilt:(BOOL)a3
{
  self->_built = a3;
}

- (void)plan
{
  return self->_plan;
}

- (void)setPlan:(void *)a3
{
  self->_plan = a3;
}

- (void)ctx
{
  return self->_ctx;
}

- (void)setCtx:(void *)a3
{
  self->_ctx = a3;
}

- (id)CIImageProcessorDigestObject
{
  return self->_path;
}

- (void)buildAsync
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_262E33C70;
  block[3] = &unk_2655BCBF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)buildWait
{
  return self->_built;
}

- (int)bind:(const char *)a3 buffer:(__CVBuffer *)a4
{
  if (!self->_built) {
    return -1;
  }
  uint64_t v7 = objc_msgSend_plan(self, a2, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_planIdx(self, v8, v9);

  return MEMORY[0x270F27F98](v7, v10, a3, 0, a4);
}

- (BOOL)hasBlob:(const char *)a3
{
  if (!self->_built) {
    return 0;
  }
  objc_msgSend_plan(self, a2, (uint64_t)a3);
  objc_msgSend_planIdx(self, v4, v5);
  return espresso_network_query_blob_shape() == 0;
}

- (int)execute
{
  if (!self->_built) {
    return -1;
  }
  uint64_t v4 = objc_msgSend_plan(self, a2, v2);
  objc_msgSend_planIdx(self, v5, v6);

  return MEMORY[0x270F280A0](v4);
}

- (int)executeAsync:(id)a3
{
  id v6 = a3;
  if (self->_built)
  {
    objc_msgSend_plan(self, v4, v5);
    objc_msgSend_planIdx(self, v7, v8);
    dispatch_queue_t v9 = dispatch_queue_create(0, 0);
    id v12 = v6;
    int v10 = espresso_plan_submit();
  }
  else
  {
    int v10 = -1;
  }

  return v10;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end