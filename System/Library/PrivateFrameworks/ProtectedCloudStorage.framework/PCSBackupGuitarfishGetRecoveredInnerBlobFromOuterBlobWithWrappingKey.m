@interface PCSBackupGuitarfishGetRecoveredInnerBlobFromOuterBlobWithWrappingKey
@end

@implementation PCSBackupGuitarfishGetRecoveredInnerBlobFromOuterBlobWithWrappingKey

void ___PCSBackupGuitarfishGetRecoveredInnerBlobFromOuterBlobWithWrappingKey_block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v14 = a5;
  id v8 = a6;
  v9 = v8;
  if (v8)
  {
    v10 = (void **)(*(void *)(a1[4] + 8) + 40);
    v11 = v8;
  }
  else
  {
    v10 = (void **)(*(void *)(a1[5] + 8) + 40);
    v11 = v14;
  }
  id v12 = v11;
  v13 = *v10;
  *v10 = v12;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void ___PCSBackupGuitarfishGetRecoveredInnerBlobFromOuterBlobWithWrappingKey_block_invoke_2(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v21 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (v15)
  {
    v17 = (void **)(*(void *)(a1[4] + 8) + 40);
    v18 = v15;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
    v17 = (void **)(*(void *)(a1[8] + 8) + 40);
    v18 = v14;
  }
  id v19 = v18;
  v20 = *v17;
  *v17 = v19;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[9] + 8) + 40));
}

@end