@interface WFHomeKitAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (id)completionHandler;
- (unint64_t)status;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WFHomeKitAccessResource

- (unint64_t)status
{
  unsigned int v2 = softLinkTCCAccessPreflight(@"kTCCServiceWillow", 0);
  if (v2 > 2) {
    return 1;
  }
  else {
    return qword_1C856C7C0[v2];
  }
}

- (void).cxx_destruct
{
}

+ (BOOL)isSystemResource
{
  return 1;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  v4 = +[WFHomeManager sharedManager];
  [v4 removeEventObserver:self];

  [(WFResource *)self refreshAvailabilityWithForcedNotification];
  completionHandler = (void (**)(id, uint64_t, void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 1, 0);
    completionHandler = (void (**)(id, uint64_t, void))self->_completionHandler;
  }
  self->_completionHandler = 0;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v8[3] = &unk_1E6551858;
  v8[4] = self;
  id v9 = v5;
  v6 = (void (*)(uint64_t, uint64_t, void *))softLinkTCCAccessRequest;
  id v7 = v5;
  v6(@"kTCCServiceWillow", 0, v8);
}

void __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  block[3] = &unk_1E6555A78;
  char v5 = a2;
  unsigned int v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;

    char v5 = +[WFHomeManager sharedManager];
    [v5 addEventObserver:*(void *)(a1 + 32)];

    id v7 = +[WFHomeManager sharedManager];
    [v7 reloadData];
  }
  else
  {
    [*(id *)(a1 + 32) refreshAvailabilityWithForcedNotification];
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (id)associatedAppIdentifier
{
  return @"com.apple.Home";
}

@end