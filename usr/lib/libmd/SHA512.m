@interface SHA512
@end

@implementation SHA512

intptr_t __SHA512_FdChunk_block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __SHA512_FdChunk_block_invoke_2(intptr_t result, int a2, dispatch_data_t data, int a4)
{
  v7 = (void *)result;
  if (data)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 0x40000000;
    applier[2] = __SHA512_FdChunk_block_invoke_3;
    applier[3] = &unk_265099E08;
    applier[4] = *(void *)(result + 32);
    result = dispatch_data_apply(data, applier);
  }
  if (a4) {
    *(_DWORD *)(*(void *)(v7[5] + 8) + 24) = a4;
  }
  if (a2)
  {
    v8 = v7[7];
    *(unsigned char *)(*(void *)(v7[6] + 8) + 24) = data == (dispatch_data_t)MEMORY[0x263EF8388];
    return dispatch_semaphore_signal(v8);
  }
  return result;
}

uint64_t __SHA512_FdChunk_block_invoke_3(uint64_t a1, int a2, int a3, void *data, unint64_t len)
{
  if (len >> 31) {
    MD4FdChunk_cold_1();
  }
  CC_SHA512_Update((CC_SHA512_CTX *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), data, len);
  return 1;
}

@end