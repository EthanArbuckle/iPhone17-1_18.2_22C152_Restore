@interface REAppIconCache
- (id)_init;
- (void)_loadIconForIdentifier:(id)a3 completion:(id)a4;
- (void)_loadRemoteIconForIdentifier:(id)a3 completion:(id)a4;
- (void)iconForApplicationWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation REAppIconCache

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)REAppIconCache;
  v2 = [(RESingleton *)&v9 _init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.RelevanceEngine", v3);
    v5 = (void *)v2[2];
    v2[2] = v4;

    id v6 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    v7 = (void *)v2[1];
    v2[1] = v6;
  }
  return v2;
}

- (void)iconForApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t IsRemote = REApplicationIsRemote(v6);
  objc_super v9 = [[_REAppKey alloc] initWithIdentifier:v6 remote:IsRemote];
  v10 = [(NSCache *)self->_imageCache objectForKey:v9];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke;
  v18[3] = &unk_2644BD240;
  v18[4] = self;
  v11 = v9;
  v19 = v11;
  id v12 = v7;
  id v20 = v12;
  v13 = (void *)MEMORY[0x223C31700](v18);
  if (v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke_2;
    block[3] = &unk_2644BCCD0;
    id v17 = v12;
    id v16 = v10;
    dispatch_async(queue, block);
  }
  else if (IsRemote)
  {
    [(REAppIconCache *)self _loadRemoteIconForIdentifier:v6 completion:v13];
  }
  else
  {
    [(REAppIconCache *)self _loadIconForIdentifier:v6 completion:v13];
  }
}

void __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1[4] + 8) setObject:v3 forKey:a1[5]];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __62__REAppIconCache_iconForApplicationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_loadRemoteIconForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v18 = 0;
  if (!RelevanceEngineUILibraryCore_frameworkLibrary)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __RelevanceEngineUILibraryCore_block_invoke;
    v22 = &__block_descriptor_40_e5_v8__0l;
    v23 = &v18;
    long long v24 = xmmword_2644BD2A0;
    uint64_t v25 = 0;
    RelevanceEngineUILibraryCore_frameworkLibrary = _sl_dlopen();
    v8 = v18;
    if (RelevanceEngineUILibraryCore_frameworkLibrary)
    {
      if (!v18) {
        goto LABEL_4;
      }
    }
    else
    {
      v8 = (void *)abort_report_np();
      __break(1u);
    }
    free(v8);
  }
LABEL_4:
  float v9 = REDeviceScreenScale();
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = &v24;
  uint64_t v25 = 0x2050000000;
  v10 = (void *)getNanoResourceGrabberClass_softClass;
  uint64_t v26 = getNanoResourceGrabberClass_softClass;
  if (!getNanoResourceGrabberClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __getNanoResourceGrabberClass_block_invoke;
    v22 = &unk_2644BC768;
    v23 = (void **)&v24;
    __getNanoResourceGrabberClass_block_invoke((uint64_t)&v19);
    v10 = *(void **)(*((void *)&v24 + 1) + 24);
  }
  if (v9 < 3.0) {
    uint64_t v11 = 47;
  }
  else {
    uint64_t v11 = 48;
  }
  id v12 = v10;
  _Block_object_dispose(&v24, 8);
  v13 = [v12 sharedInstance];
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__REAppIconCache__loadRemoteIconForIdentifier_completion___block_invoke;
  v16[3] = &unk_2644BD268;
  id v17 = v7;
  id v15 = v7;
  [v13 getIconForBundleID:v6 iconVariant:v11 queue:queue block:v16 timeout:0.0];
}

void __58__REAppIconCache__loadRemoteIconForIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[REImage imageWithImage:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_loadIconForIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__REAppIconCache__loadIconForIdentifier_completion___block_invoke;
  v9[3] = &unk_2644BC5E8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __52__REAppIconCache__loadIconForIdentifier_completion___block_invoke(uint64_t a1)
{
  float v2 = REDeviceScreenScale();
  id v3 = _REIconDescriptionForDevice(0, 0, v2);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)getISIconClass_softClass;
  uint64_t v12 = getISIconClass_softClass;
  if (!getISIconClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getISIconClass_block_invoke;
    v8[3] = &unk_2644BC768;
    v8[4] = &v9;
    __getISIconClass_block_invoke((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = (void *)[[v5 alloc] initWithBundleIdentifier:*(void *)(a1 + 32)];
  id v7 = (void *)[v6 CGImageForImageDescriptor:v3];
  if (v7)
  {
    id v7 = +[REImage imageWithCGImage:v7 scale:REDeviceScreenScale()];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end