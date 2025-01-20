@interface WiFiPasswordSharingSimulator
- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4;
- (WiFiPasswordSharingSimulator)init;
- (void)dealloc;
- (void)runWithSSID:(id)a3 reply:(id)a4;
- (void)service:(id)a3 receivedNetworkInfo:(id)a4;
@end

@implementation WiFiPasswordSharingSimulator

- (WiFiPasswordSharingSimulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)WiFiPasswordSharingSimulator;
  v2 = [(WiFiPasswordSharingSimulator *)&v6 init];
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("mobilewifitool.wifi-password-sharing", 0);
    if (SharingLibraryCore())
    {
      uint64_t v8 = 0;
      v9 = &v8;
      uint64_t v10 = 0x3052000000;
      v11 = __Block_byref_object_copy__0;
      v12 = __Block_byref_object_dispose__0;
      v3 = (objc_class *)getSFPasswordSharingServiceClass_softClass;
      uint64_t v13 = getSFPasswordSharingServiceClass_softClass;
      if (!getSFPasswordSharingServiceClass_softClass)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __getSFPasswordSharingServiceClass_block_invoke;
        v7[3] = &unk_1E63F42B8;
        v7[4] = &v8;
        __getSFPasswordSharingServiceClass_block_invoke((uint64_t)v7);
        v3 = (objc_class *)v9[5];
      }
      _Block_object_dispose(&v8, 8);
      v4 = (SFPasswordSharingService *)objc_alloc_init(v3);
      v2->_service = v4;
      [(SFPasswordSharingService *)v4 setDelegate:v2];
      [(SFPasswordSharingService *)v2->_service setDispatchQueue:v2->_queue];
    }
  }
  return v2;
}

- (void)dealloc
{
  [(SFPasswordSharingService *)self->_service invalidate];
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiPasswordSharingSimulator;
  [(WiFiPasswordSharingSimulator *)&v4 dealloc];
}

- (void)runWithSSID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WiFiPasswordSharingSimulator_runWithSSID_reply___block_invoke;
  block[3] = &unk_1E63F5058;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

uint64_t __50__WiFiPasswordSharingSimulator_runWithSSID_reply___block_invoke(uint64_t a1)
{
  if (SharingLibraryCore())
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setNetworkName:*(void *)(a1 + 40)];

    *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 48) copy];
    v2 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v2 activate];
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      objc_super v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (void)service:(id)a3 receivedNetworkInfo:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WiFiPasswordSharingSimulator_service_receivedNetworkInfo___block_invoke;
  block[3] = &unk_1E63F5080;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async(queue, block);
}

uint64_t __60__WiFiPasswordSharingSimulator_service_receivedNetworkInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t result = printf("Received '%s' [ch=%ld psk=%s]\n", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "networkName"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "channel"), "integerValue"), (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "psk"), "UTF8String"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 24);
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) channel];
    uint64_t v5 = [*(id *)(a1 + 40) psk];
    objc_super v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    return v6(v3, v4, v5);
  }
  return result;
}

- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4
{
  return 0;
}

@end