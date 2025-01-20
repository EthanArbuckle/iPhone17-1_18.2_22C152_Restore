@interface ML3SubscriptionImportOperation
- (BOOL)_performDAAPImportWithTransaction:(id)a3;
- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:;
- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (unint64_t)importSource;
- (void)main;
@end

@implementation ML3SubscriptionImportOperation

- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
}

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (BOOL)_performDAAPImportWithTransaction:(id)a3
{
  v4 = [a3 connection];
  if (([(ML3SubscriptionImportOperation *)self isCancelled] & 1) == 0)
  {
    BOOL v5 = [(ML3DAAPImportOperation *)self performImportOfSourceType:6 usingConnection:v4];
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        v8 = "[ML3SubscriptionImportOperation] successfully processed import data";
        v9 = (uint8_t *)&v13;
        v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_1B022D000, v10, v11, v8, v9, 2u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "[ML3SubscriptionImportOperation] failed to process import data";
      v9 = buf;
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  BOOL v5 = 1;
LABEL_10:

  return v5;
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = [(ML3ImportOperation *)self import];
  BOOL v5 = [v4 trackData];
  if (v5)
  {
  }
  else
  {
    v6 = [(ML3ImportOperation *)self import];
    v7 = [v6 playlistData];

    if (v7) {
      goto LABEL_5;
    }
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"ML3SubscriptionImportOperation.mm" lineNumber:26 description:@"Attempted to start subscription import operation without DAAP payload data."];
  }

LABEL_5:
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  if (*((unsigned char *)v17 + 24) && ([(ML3SubscriptionImportOperation *)self isCancelled] & 1) == 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__ML3SubscriptionImportOperation_main__block_invoke;
    v15[3] = &unk_1E5FB81E0;
    v15[4] = self;
    v15[5] = &v16;
    [(ML3ImportOperation *)self _writerTransactionWithBlock:v15];
  }
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(ML3SubscriptionImportOperation *)self isCancelled];
    int v12 = *((unsigned __int8 *)v17 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 67109632;
    int v21 = v11;
    __int16 v22 = 1024;
    int v23 = v12;
    __int16 v24 = 2048;
    double v25 = v13 - v9;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "[ML3SubscriptionImportOperation] Subscription import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((unsigned char *)v17 + 24)) {
    uint64_t v14 = [(ML3SubscriptionImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v14 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v14];
  _Block_object_dispose(&v16, 8);
}

uint64_t __38__ML3SubscriptionImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performDAAPImportWithTransaction:v5];
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
  return 8;
}

@end