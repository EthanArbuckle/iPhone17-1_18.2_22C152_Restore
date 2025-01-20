@interface NUAbstractBufferStorage
@end

@implementation NUAbstractBufferStorage

void __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v5 = (void *)a1[4];
  v4 = (void *)a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke_2;
  v7[3] = &unk_1E5D94E68;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v5 writeBufferInRegion:v9 block:v7];
}

void __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 format];
  [v4 bytesPerPixel];

  [*(id *)(a1 + 32) rowBytes];
  [v3 rowBytes];
  v5 = *(void **)(a1 + 40);
  if (v5) {
    [v5 bounds];
  }
  objc_msgSend(*(id *)(a1 + 32), "bytesAtPoint:", 0, 0, (unsigned __int128)0);
  [v3 mutableBytesAtPoint:v6];
}

@end