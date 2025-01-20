@interface ML3MatchImportOperation
- (BOOL)_performMatchImportWithTransaction:(id)a3;
- (shared_ptr<ML3DAAPDeleteImportItem>)albumArtistItemFromDeletedDAAPArtistEntity:(const void *)a3;
- (shared_ptr<ML3DAAPDeleteImportItem>)albumItemFromDeletedDAAPAlbumEntity:(const void *)a3;
- (shared_ptr<ML3DAAPImportItem>)albumArtistImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:;
- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (unint64_t)importSource;
- (void)main;
@end

@implementation ML3MatchImportOperation

- (shared_ptr<ML3DAAPDeleteImportItem>)albumItemFromDeletedDAAPAlbumEntity:(const void *)a3
{
}

- (shared_ptr<ML3DAAPDeleteImportItem>)albumArtistItemFromDeletedDAAPArtistEntity:(const void *)a3
{
}

- (shared_ptr<ML3DAAPImportItem>)albumArtistImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
}

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (BOOL)_performMatchImportWithTransaction:(id)a3
{
  v4 = [a3 connection];
  if ([(ML3MatchImportOperation *)self isCancelled]) {
    goto LABEL_4;
  }
  if ([(ML3DAAPImportOperation *)self performImportOfSourceType:2 usingConnection:v4])
  {
    v5 = [(ML3ImportOperation *)self import];
    v6 = [v5 library];
    [v6 notifyKeepLocalStateDidChange];

LABEL_4:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "failed to process match import data", v10, 2u);
  }

  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)main
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [(ML3ImportOperation *)self import];
  v5 = [v4 trackData];
  if (v5) {
    goto LABEL_6;
  }
  v5 = [(ML3ImportOperation *)self import];
  v6 = [v5 playlistData];
  if (v6)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  v6 = [(ML3ImportOperation *)self import];
  BOOL v7 = [v6 albumArtistData];
  if (v7)
  {

    goto LABEL_5;
  }
  v15 = [(ML3ImportOperation *)self import];
  v16 = [v15 albumData];

  if (v16) {
    goto LABEL_8;
  }
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ML3MatchImportOperation.mm" lineNumber:39 description:@"Attempted to start match import operation without DAAP payload data."];
LABEL_7:

LABEL_8:
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  if (*((unsigned char *)v19 + 24) && ([(ML3MatchImportOperation *)self isCancelled] & 1) == 0)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __31__ML3MatchImportOperation_main__block_invoke;
    v17[3] = &unk_1E5FB81E0;
    v17[4] = self;
    v17[5] = &v18;
    [(ML3ImportOperation *)self _writerTransactionWithBlock:v17];
  }
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(ML3MatchImportOperation *)self isCancelled];
    int v12 = *((unsigned __int8 *)v19 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 67109632;
    int v23 = v11;
    __int16 v24 = 1024;
    int v25 = v12;
    __int16 v26 = 2048;
    double v27 = v13 - v9;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "[MLMatchImportOperation] Match import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((unsigned char *)v19 + 24)) {
    uint64_t v14 = [(ML3MatchImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v14 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v14];
  _Block_object_dispose(&v18, 8);
}

uint64_t __31__ML3MatchImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performMatchImportWithTransaction:v5];
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
  return 2;
}

@end