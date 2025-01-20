@interface PLPositionalImageTableEntries
- (void)enumerateImageIndexes:(id)a3 formatSideLength:(int)a4;
@end

@implementation PLPositionalImageTableEntries

- (void)enumerateImageIndexes:(id)a3 formatSideLength:(int)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PLPositionalImageTableEntries_enumerateImageIndexes_formatSideLength___block_invoke;
  v9[3] = &unk_1E589F010;
  int v11 = a4;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)PLPositionalImageTableEntries;
  id v7 = v6;
  [(PLPositionalTableEntries *)&v8 enumerateIndexes:v9];
}

uint64_t __72__PLPositionalImageTableEntries_enumerateImageIndexes_formatSideLength___block_invoke(uint64_t a1, __n128 a2, __n128 a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) entryLength];
    a2.n128_u32[0] = *(_DWORD *)(a5 + v7 - 12);
    a3.n128_u32[0] = *(_DWORD *)(a5 + v7 - 8);
    a2.n128_f64[0] = (double)a2.n128_u64[0];
    a3.n128_f64[0] = (double)a3.n128_u64[0];
    int v8 = *(_DWORD *)(a1 + 48);
    if (a2.n128_f64[0] > (double)v8) {
      a2.n128_f64[0] = (double)v8;
    }
    if (a3.n128_f64[0] > (double)v8) {
      a3.n128_f64[0] = (double)v8;
    }
  }
  else
  {
    a2.n128_u64[0] = *MEMORY[0x1E4F1DB30];
    a3.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v9 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 40) + 16);
  return v9(a2, a3);
}

@end