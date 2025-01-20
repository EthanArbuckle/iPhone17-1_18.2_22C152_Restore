@interface VUIMPHomeShareMediaLibrary
- (id)enqueueKeepAliveWithCompletion:(id)a3;
@end

@implementation VUIMPHomeShareMediaLibrary

- (id)enqueueKeepAliveWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(VUIMediaLibrary *)self manager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__VUIMPHomeShareMediaLibrary_enqueueKeepAliveWithCompletion___block_invoke;
    v8[3] = &unk_1E6DF3DD0;
    id v9 = v4;
    [v5 _enqueueCompletionQueueBlock:v8];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:0];

  return v6;
}

uint64_t __61__VUIMPHomeShareMediaLibrary_enqueueKeepAliveWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end