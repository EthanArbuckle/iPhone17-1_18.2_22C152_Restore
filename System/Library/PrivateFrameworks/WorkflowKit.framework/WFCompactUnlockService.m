@interface WFCompactUnlockService
+ (BOOL)isDeviceLocked;
- (SBSLockScreenService)service;
- (void)dealloc;
- (void)requestUnlockIfNeeded:(id)a3;
- (void)setService:(id)a3;
@end

@implementation WFCompactUnlockService

- (void).cxx_destruct
{
}

- (void)setService:(id)a3
{
}

- (SBSLockScreenService)service
{
  return self->_service;
}

- (void)requestUnlockIfNeeded:(id)a3
{
  id v4 = a3;
  int v5 = MKBGetDeviceLockState();
  if (v5 != 3 && v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA6B38]);
    [(WFCompactUnlockService *)self setService:v6];

    v7 = [(WFCompactUnlockService *)self service];
    v8 = objc_opt_new();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke;
    v9[3] = &unk_1E6554EC8;
    id v10 = v4;
    [v7 requestPasscodeUnlockUIWithOptions:v8 withCompletion:v9];
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke_2;
  v3[3] = &unk_1E6554C90;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)dealloc
{
  v3 = [(WFCompactUnlockService *)self service];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)WFCompactUnlockService;
  [(WFCompactUnlockService *)&v4 dealloc];
}

+ (BOOL)isDeviceLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

@end