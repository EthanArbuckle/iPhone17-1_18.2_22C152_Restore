@interface ML3PurchaseHistoryImportOperation
- (BOOL)_performPurchaseHistoryImportWithTransaction:(id)a3;
- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (unint64_t)importSource;
- (void)main;
@end

@implementation ML3PurchaseHistoryImportOperation

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (BOOL)_performPurchaseHistoryImportWithTransaction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [a3 connection];
  v5 = [(ML3ImportOperation *)self import];
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v5 preferredVideoQuality];
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "importing purchased tracks. import.preferredVideoQuality=%lld", buf, 0xCu);
  }

  if ([(ML3PurchaseHistoryImportOperation *)self isCancelled]) {
    goto LABEL_8;
  }
  BOOL v7 = [(ML3DAAPImportOperation *)self performImportOfSourceType:4 usingConnection:v4];
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "successfully processed import data", buf, 2u);
    }

LABEL_8:
    if (([(ML3PurchaseHistoryImportOperation *)self isCancelled] & 1) == 0)
    {
      v10 = [v5 library];
      objc_initWeak((id *)buf, v10);

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __82__ML3PurchaseHistoryImportOperation__performPurchaseHistoryImportWithTransaction___block_invoke;
      v13[3] = &unk_1E5FB2710;
      objc_copyWeak(&v14, (id *)buf);
      [v4 enqueueBlockForTransactionCommit:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
    BOOL v11 = 1;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "failed to process import data", buf, 2u);
  }

  BOOL v11 = 0;
LABEL_14:

  return v11;
}

void __82__ML3PurchaseHistoryImportOperation__performPurchaseHistoryImportWithTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained notifyContentsDidChange];
  }
}

- (void)main
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = [(ML3ImportOperation *)self import];
  v5 = [v4 trackData];

  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ML3PurchaseHistoryImportOperation.mm" lineNumber:35 description:@"Attempted to start purchase history import operation without DAAP payload."];
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  if (*((unsigned char *)v16 + 24) && ([(ML3PurchaseHistoryImportOperation *)self isCancelled] & 1) == 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__ML3PurchaseHistoryImportOperation_main__block_invoke;
    v14[3] = &unk_1E5FB81E0;
    v14[4] = self;
    v14[5] = &v15;
    [(ML3ImportOperation *)self _writerTransactionWithBlock:v14];
  }
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(ML3PurchaseHistoryImportOperation *)self isCancelled];
    int v10 = *((unsigned __int8 *)v16 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 67109632;
    int v20 = v9;
    __int16 v21 = 1024;
    int v22 = v10;
    __int16 v23 = 2048;
    double v24 = v11 - v7;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "[MLPurchaseHistoryImportOperation] Purchase history import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((unsigned char *)v16 + 24)) {
    uint64_t v12 = [(ML3PurchaseHistoryImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v12 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v12];
  _Block_object_dispose(&v15, 8);
}

uint64_t __41__ML3PurchaseHistoryImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performPurchaseHistoryImportWithTransaction:v5];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    [*(id *)(a1 + 32) setError:v6];
  }
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v7;
}

- (unint64_t)importSource
{
  return 1;
}

@end