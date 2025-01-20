@interface PRRenderingSession
- (PRInvalidatable)assertion;
- (PRRenderingSession)initWithReason:(id)a3 invalidationBlock:(id)a4;
- (double)timeRemaining;
@end

@implementation PRRenderingSession

- (PRRenderingSession)initWithReason:(id)a3 invalidationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRRenderingSession;
  v8 = [(PRRenderingSession *)&v16 init];
  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F838]) initWithIdentifier:@"RenderExtension" forReason:v6 invalidationBlock:v7];
    objc_storeStrong((id *)&v8->_assertion, v9);
    v8->_timeRemaining = 5.0;
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke;
    v13[3] = &unk_1E54DAA08;
    id v14 = v9;
    id v15 = v6;
    id v11 = v9;
    dispatch_after(v10, MEMORY[0x1E4F14428], v13);
  }
  return v8;
}

uint64_t __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    v3 = PRLogRendering();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke_cold_1(a1, v3);
    }

    return [*(id *)(a1 + 32) invalidate];
  }
  return result;
}

- (PRInvalidatable)assertion
{
  return self->_assertion;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void).cxx_destruct
{
}

void __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Rendering extension timed-out: %@", (uint8_t *)&v3, 0xCu);
}

@end