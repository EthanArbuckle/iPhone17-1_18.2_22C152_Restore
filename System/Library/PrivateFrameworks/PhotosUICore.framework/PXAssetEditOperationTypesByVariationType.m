@interface PXAssetEditOperationTypesByVariationType
@end

@implementation PXAssetEditOperationTypesByVariationType

void ___PXAssetEditOperationTypesByVariationType_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___PXAssetEditOperationTypesByVariationType_block_invoke_2;
  aBlock[3] = &unk_1E5DCF720;
  id v6 = v0;
  id v1 = v0;
  v2 = (void (**)(void *, void))_Block_copy(aBlock);
  v2[2](v2, 0);
  v2[2](v2, 1);
  v2[2](v2, 2);
  v2[2](v2, 3);
  uint64_t v3 = [v1 copy];
  v4 = (void *)_PXAssetEditOperationTypesByVariationType_editOperationTypesByVariationType;
  _PXAssetEditOperationTypesByVariationType_editOperationTypesByVariationType = v3;
}

void ___PXAssetEditOperationTypesByVariationType_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [NSString stringWithFormat:@"%@.%li", @"PXAssetEditOperation.Variation", a2];
  v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

@end