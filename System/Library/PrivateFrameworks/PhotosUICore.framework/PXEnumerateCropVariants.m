@interface PXEnumerateCropVariants
@end

@implementation PXEnumerateCropVariants

uint64_t ___PXEnumerateCropVariants_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 cropType];
  [v6 cropRect];
  unint64_t v9 = v8;
  unint64_t v11 = v10;
  unint64_t v13 = v12;
  unint64_t v15 = v14;
  [v6 cropScore];
  unint64_t v17 = v16;

  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128, __n128))(v5 + 16);
  v19.n128_u64[0] = v9;
  v20.n128_u64[0] = v11;
  v21.n128_u64[0] = v13;
  v22.n128_u64[0] = v15;
  v23.n128_u64[0] = v17;
  return v18(v5, v7, a4, v19, v20, v21, v22, v23);
}

@end