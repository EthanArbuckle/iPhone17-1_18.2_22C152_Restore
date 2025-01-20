@interface PBCallbackSerialization
- (void)sendBeginBlock:(id)a3;
- (void)sendEndBlock:(id)a3;
@end

@implementation PBCallbackSerialization

- (void)sendBeginBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PBCallbackSerialization_sendBeginBlock___block_invoke;
  v6[3] = &unk_1E5555EE0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  PBDispatchAsyncCallback(v6);
}

uint64_t __42__PBCallbackSerialization_sendBeginBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)sendEndBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PBCallbackSerialization_sendEndBlock___block_invoke;
  v6[3] = &unk_1E5555EE0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  PBDispatchAsyncCallback(v6);
}

uint64_t __40__PBCallbackSerialization_sendEndBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v3 + 16))
  {
    id v4 = *(uint64_t (**)(void))(v2 + 16);
    return v4();
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 8) = MEMORY[0x192F9AA30](v2);
    return MEMORY[0x1F41817F8]();
  }
}

- (void).cxx_destruct
{
}

@end