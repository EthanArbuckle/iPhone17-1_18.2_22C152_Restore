@interface CKContainer
@end

@implementation CKContainer

void __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(a1 + 32) addObject:v7];
    objc_sync_exit(v9);
  }
}

void __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_3:
    v6();
    goto LABEL_6;
  }
  if (!v7)
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 32), "wf_fetchDeviceRecordsWithCursor:results:completion:", v7, *(void *)(a1 + 40), *(void *)(a1 + 48));
LABEL_6:
}

@end