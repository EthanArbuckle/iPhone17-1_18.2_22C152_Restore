@interface MRMediaRemoteCopyPickableRoutesForCategory
@end

@implementation MRMediaRemoteCopyPickableRoutesForCategory

void __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke(uint64_t a1, const __CFArray *a2)
{
  CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke_2;
  v5[3] = &unk_1E57DA210;
  v4 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  CFArrayRef v7 = Copy;
  dispatch_async(v4, v5);
}

uint64_t __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

@end