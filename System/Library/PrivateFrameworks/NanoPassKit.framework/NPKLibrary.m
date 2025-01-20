@interface NPKLibrary
+ (id)sharedInstance;
- (BOOL)needsRelevancyInformation;
- (void)addPassData:(id)a3 completion:(id)a4;
- (void)setNeedsRelevancyInformation:(BOOL)a3;
@end

@implementation NPKLibrary

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__NPKLibrary_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __28__NPKLibrary_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

- (void)addPassData:(id)a3 completion:(id)a4
{
  id v4 = a4;
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__NPKLibrary_addPassData_completion___block_invoke;
    block[3] = &unk_2644D2B10;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __37__NPKLibrary_addPassData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)needsRelevancyInformation
{
  return self->_needsRelevancyInformation;
}

- (void)setNeedsRelevancyInformation:(BOOL)a3
{
  self->_needsRelevancyInformation = a3;
}

@end