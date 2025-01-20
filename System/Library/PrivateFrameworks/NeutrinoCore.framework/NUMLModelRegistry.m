@interface NUMLModelRegistry
- (NSMutableDictionary)modelMap;
- (NUMLModelRegistry)init;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (id)loadModelAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)modelForKey:(id)a3;
- (unint64_t)signpost;
- (void)registerModel:(id)a3 forKey:(id)a4;
- (void)setLog:(id)a3;
- (void)setModelMap:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSignpost:(unint64_t)a3;
- (void)unregisterModelForKey:(id)a3;
@end

@implementation NUMLModelRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_modelMap, 0);
}

- (void)setSignpost:(unint64_t)a3
{
  self->_signpost = a3;
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setModelMap:(id)a3
{
}

- (NSMutableDictionary)modelMap
{
  return self->_modelMap;
}

- (id)modelForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__25696;
  v16 = __Block_byref_object_dispose__25697;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NUMLModelRegistry_modelForKey___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __33__NUMLModelRegistry_modelForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)unregisterModelForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NUMLModelRegistry_unregisterModelForKey___block_invoke;
  v8[3] = &unk_1E5D95E18;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(queue, v8);
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25698);
  }
  id v7 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_1A9892000, v7, OS_LOG_TYPE_INFO, "Unregistered model for key: %{public}@", buf, 0xCu);
  }
}

uint64_t __43__NUMLModelRegistry_unregisterModelForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)registerModel:(id)a3 forKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NUMLModelRegistry_registerModel_forKey___block_invoke;
  block[3] = &unk_1E5D95878;
  block[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  dispatch_sync(queue, block);
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25698);
  }
  id v11 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_1A9892000, v11, OS_LOG_TYPE_INFO, "Registered model for key: %{public}@", buf, 0xCu);
  }
}

uint64_t __42__NUMLModelRegistry_registerModel_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)loadModelAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = self->_log;
  id v10 = v9;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "NUMLModelRegistry.loadModel", (const char *)&unk_1A9A9F00F, buf, 2u);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1E990]);
  id v13 = v12;
  if (v6) {
    [v12 setUsePrecompiledE5Bundle:1];
  }
  uint64_t v14 = v6 & 0xE;
  switch(v14)
  {
    case 2:
      uint64_t v15 = 0;
      goto LABEL_12;
    case 10:
      uint64_t v15 = 3;
      goto LABEL_12;
    case 6:
      uint64_t v15 = 1;
LABEL_12:
      [v13 setComputeUnits:v15];
      break;
  }
  id v16 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v13 error:a5];
  uint64_t v17 = self->_log;
  v18 = v17;
  os_signpost_id_t v19 = self->_signpost;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v17))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v18, OS_SIGNPOST_INTERVAL_END, v19, "NUMLModelRegistry.loadModel", (const char *)&unk_1A9A9F00F, v21, 2u);
  }

  return v16;
}

- (NUMLModelRegistry)init
{
  v11.receiver = self;
  v11.super_class = (Class)NUMLModelRegistry;
  id v2 = [(NUMLModelRegistry *)&v11 init];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("NUMLModelRegistery", v5);
  id v7 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v6;

  os_log_t v8 = os_log_create("com.apple.photos.Neutrino", "MLModelRegistry");
  id v9 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v8;

  *((void *)v2 + 4) = os_signpost_id_make_with_pointer(*((os_log_t *)v2 + 3), v2);
  return (NUMLModelRegistry *)v2;
}

@end