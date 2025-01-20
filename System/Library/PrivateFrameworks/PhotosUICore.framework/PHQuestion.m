@interface PHQuestion
@end

@implementation PHQuestion

uint64_t __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __50__PHQuestion_PhotosUICore___px_configurationCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_px_configurationCache_cache;
  _px_configurationCache_cache = (uint64_t)v0;
}

void __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "_px_configurationCache");
  v3 = [*(id *)(a1 + 32) uuid];
  v4 = [v2 objectForKey:v3];

  if (!v4 || [v4 isStale])
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_px_requestQueue_fetchConfiguration");

    if (v5)
    {
      v6 = objc_msgSend((id)objc_opt_class(), "_px_configurationCache");
      v7 = [*(id *)(a1 + 32) uuid];
      [v6 setObject:v5 forKey:v7];

      v4 = (void *)v5;
    }
    else
    {
      v4 = 0;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke_2;
  block[3] = &unk_1E5DD34C0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v13 = v8;
  uint64_t v14 = v9;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PHQuestion_PhotosUICore___px_fetchRequestIdAndIncrement__block_invoke()
{
  _px_fetchRequestIdAndIncrement__px_requestId = 0;
}

void __44__PHQuestion_PhotosUICore___px_requestQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobileslideshow.PHQuestionConfigurationRequestQueue", v2);
  v1 = (void *)_px_requestQueue_queue;
  _px_requestQueue_queue = (uint64_t)v0;
}

@end