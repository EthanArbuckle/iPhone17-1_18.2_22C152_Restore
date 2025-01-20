@interface FCKeyedOperation
- (void)cancel;
@end

@implementation FCKeyedOperation

void __60__FCKeyedOperation_executeForQueue_delegate_key_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8)) {
    [*(id *)(a1 + 40) cancel];
  }
  else {
    objc_storeStrong((id *)(v1 + 16), *(id *)(a1 + 40));
  }
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__FCKeyedOperation_cancel__block_invoke;
  v2[3] = &unk_1E5B4C018;
  v2[4] = self;
  FCPerformBlockOnMainThread(v2);
}

uint64_t __26__FCKeyedOperation_cancel__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 16) cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cancelHandler, 0);
}

@end