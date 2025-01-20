@interface MRBlockGuard
- (MRBlockGuard)initWithTimeout:(double)a3 reason:(id)a4 handler:(id)a5;
- (MRBlockGuard)initWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 handler:(id)a6;
@end

@implementation MRBlockGuard

- (MRBlockGuard)initWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke;
  v16[3] = &unk_1E57D1DA0;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  v14 = [(MRBlockGuard *)self initWithTimeout:a4 reason:v16 handler:a3];

  return v14;
}

- (MRBlockGuard)initWithTimeout:(double)a3 reason:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__MRBlockGuard_initWithTimeout_reason_handler___block_invoke;
  v15[3] = &unk_1E57D66D0;
  id v18 = v20;
  id v10 = v8;
  id v16 = v10;
  double v19 = a3;
  id v11 = v9;
  id v17 = v11;
  v14.receiver = self;
  v14.super_class = (Class)MRBlockGuard;
  id v12 = [(MSVBlockGuard *)&v14 initWithTimeout:v15 interruptionHandler:a3];

  _Block_object_dispose(v20, 8);
  return v12;
}

void __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke_2;
  v7[3] = &unk_1E57D0DB8;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __47__MRBlockGuard_initWithTimeout_reason_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = 0;
LABEL_3:
    id v9 = 0;
    goto LABEL_9;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  if (a2) {
    uint64_t v6 = [v5 initWithMRError:25, @"Guarded operation <%@> was deallocated before disarmed", *(void *)(a1 + 32), v8 format];
  }
  else {
    uint64_t v6 = [v5 initWithMRError:26, @"Guarded operation <%@> timed out after <%lf> seconds", *(void *)(a1 + 32), *(void *)(a1 + 56) format];
  }
  v2 = (void *)v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v7 = [*(id *)(a1 + 40) copy];
  if (!v7) {
    goto LABEL_3;
  }
  id v9 = (id)v7;
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v2);
LABEL_9:
}

@end