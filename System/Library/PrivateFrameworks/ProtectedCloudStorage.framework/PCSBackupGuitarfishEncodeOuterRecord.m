@interface PCSBackupGuitarfishEncodeOuterRecord
@end

@implementation PCSBackupGuitarfishEncodeOuterRecord

void ___PCSBackupGuitarfishEncodeOuterRecord_block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v27 = a6;
  if (v27) {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a6);
  }
  uint64_t v15 = *(void *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v11;
  id v17 = v11;

  uint64_t v18 = *(void *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v12;
  id v20 = v12;

  uint64_t v21 = *(void *)(a1[7] + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v13;
  id v23 = v13;

  uint64_t v24 = *(void *)(a1[8] + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v14;
  id v26 = v14;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[9] + 8) + 40));
}

@end