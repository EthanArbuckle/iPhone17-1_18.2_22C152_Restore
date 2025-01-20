@interface SUActivityItemProvider
- (SUActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (SUActivityItemProviderDelegate)delegate;
- (UIActivity)suActivity;
- (UIImage)suPreviewImage;
- (id)item;
- (id)suLastProvidedItem;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSUActivity:(id)a3;
- (void)setSUPreviewImage:(id)a3;
@end

@implementation SUActivityItemProvider

- (SUActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUActivityItemProvider;
  v3 = [(UIActivityItemProvider *)&v6 initWithPlaceholderItem:a3];
  if (v3)
  {
    v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.SUActivityItemProvider.%p", v3);
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v4 UTF8String], 0);
  }
  return v3;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUActivityItemProvider;
  [(SUActivityItemProvider *)&v4 dealloc];
}

- (SUActivityItemProviderDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SUActivityItemProvider_delegate__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUActivityItemProviderDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__SUActivityItemProvider_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 280);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__SUActivityItemProvider_setDelegate___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __38__SUActivityItemProvider_setDelegate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 280) = *(void *)(result + 40);
  return result;
}

- (void)setSUActivity:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SUActivityItemProvider_setSUActivity___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__40__SUActivityItemProvider_setSUActivity___block_invoke(void *result)
{
  v1 = *(void **)(result[4] + 272);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    id result = (id)v2[5];
    *(void *)(v2[4] + 272) = result;
  }
  return result;
}

- (void)setSUPreviewImage:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUActivityItemProvider_setSUPreviewImage___block_invoke;
  v4[3] = &unk_264812158;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__44__SUActivityItemProvider_setSUPreviewImage___block_invoke(void *result)
{
  v1 = *(void **)(result[4] + 304);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    id result = (id)v2[5];
    *(void *)(v2[4] + 304) = result;
  }
  return result;
}

- (UIActivity)suActivity
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SUActivityItemProvider_suActivity__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (UIActivity *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SUActivityItemProvider_suActivity__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 272);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)suLastProvidedItem
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SUActivityItemProvider_suLastProvidedItem__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __44__SUActivityItemProvider_suLastProvidedItem__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 296);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (UIImage)suPreviewImage
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUActivityItemProvider_suPreviewImage__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (UIImage *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __40__SUActivityItemProvider_suPreviewImage__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 304);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)item
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__50;
  v14 = __Block_byref_object_dispose__50;
  uint64_t v15 = 0;
  id v3 = [(SUActivityItemProvider *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__SUActivityItemProvider_item__block_invoke;
    v9[3] = &unk_264814EF8;
    v9[4] = v4;
    v9[5] = &v10;
    [(SUActivityItemProviderDelegate *)v3 activityItemProvider:self provideItemUsingBlock:v9];
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v4);
  }
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__SUActivityItemProvider_item__block_invoke_2;
  v8[3] = &unk_264812E48;
  v8[4] = self;
  v8[5] = &v10;
  dispatch_sync(dispatchQueue, v8);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

intptr_t __30__SUActivityItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

id __30__SUActivityItemProvider_item__block_invoke_2(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  *(void *)(*(void *)(a1 + 32) + 296) = result;
  return result;
}

@end