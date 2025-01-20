@interface ML3HomeSharingImportOperation
- (BOOL)_performHomeSharingImportWithTransaction:(id)a3;
- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:;
- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (unint64_t)importSource;
- (void)main;
@end

@implementation ML3HomeSharingImportOperation

- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
}

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (BOOL)_performHomeSharingImportWithTransaction:(id)a3
{
  v4 = [a3 connection];
  if (([(ML3HomeSharingImportOperation *)self isCancelled] & 1) == 0)
  {
    BOOL v6 = [(ML3DAAPImportOperation *)self performImportOfSourceType:0 usingConnection:v4];
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        v9 = "successfully processed import data";
        v10 = (uint8_t *)&v14;
        v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_1B022D000, v11, v12, v9, v10, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = "failed to process import data";
      v10 = buf;
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  BOOL v6 = 1;
LABEL_10:
  LODWORD(v5) = 1.0;
  -[ML3ImportOperation setProgress:](self, "setProgress:", v5, v14);

  return v6;
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  os_log_type_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__ML3HomeSharingImportOperation_main__block_invoke;
  v10[3] = &unk_1E5FB81E0;
  v10[4] = self;
  v10[5] = &v11;
  [(ML3ImportOperation *)self _writerTransactionWithBlock:v10];
  double v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(ML3HomeSharingImportOperation *)self isCancelled];
    int v7 = *((unsigned __int8 *)v12 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 67109632;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 2048;
    double v20 = v8 - v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "[MLHomeSharingImportOperation] HomeSharing import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((unsigned char *)v12 + 24)) {
    uint64_t v9 = [(ML3HomeSharingImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v9];
  _Block_object_dispose(&v11, 8);
}

uint64_t __37__ML3HomeSharingImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performHomeSharingImportWithTransaction:v5];
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
  return 3;
}

@end