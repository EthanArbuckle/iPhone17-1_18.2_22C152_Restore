@interface WLRemoteDeviceDataSource
+ (id)_requestSerialQueue;
- (BOOL)_shouldHandleHTTPErrorWithResponse:(id)a3 expectedContentLength:(unint64_t)a4 error:(id *)a5;
- (BOOL)_shouldRetryLaterWithResponse:(id)a3 error:(id)a4;
- (BOOL)_shouldRetryWithData:(id)a3 response:(id)a4 error:(id)a5;
- (BOOL)_shouldRetryWithPreventRetriesAfterTaskExceedsDuration:(BOOL)a3 taskDurationLimit:(double)a4 taskDuration:(double)a5;
- (NSString)host;
- (NSURLSession)session;
- (WLRemoteDeviceDataSource)initWithHost:(id)a3 port:(unsigned __int16)a4 session:(id)a5;
- (double)_maximumRetriableTaskDurationForLongServerOperations;
- (double)_taskDurationSinceStartDate:(id)a3;
- (double)_urlRequestTimeout;
- (id)_urlForAccountsWithMigrator:(id)a3;
- (id)_urlForRecordForMigrator:(id)a3 withSummaryIdentifier:(id)a4 accountIdentifier:(id)a5 segmentByteRange:(_NSRange *)a6;
- (id)_urlForRecordSummariesForMigrator:(id)a3 withAccountIdentifier:(id)a4;
- (id)_urlScheme;
- (int64_t)_retryLaterDelayInSeconds;
- (unint64_t)_newNumberOfRetriesAllowed:(unint64_t)a3 startDate:(id)a4;
- (unsigned)port;
- (void)_downloadTaskWithRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 startDate:(id)a6 fileAccessor:(id)a7 completion:(id)a8;
- (void)_performDownloadRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 startDate:(id)a6 fileAccessor:(id)a7 completion:(id)a8;
- (void)_performRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 preventRetriesAfterTaskExceedsDuration:(BOOL)a6 taskDurationLimit:(double)a7 startDate:(id)a8 completionHandler:(id)a9;
- (void)_runTaskWithRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 preventRetriesAfterTaskExceedsDuration:(BOOL)a6 taskDurationLimit:(double)a7 startDate:(id)a8 completionHandler:(id)a9;
- (void)accountsDataForMigrator:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)dataForSummary:(id)a3 migrator:(id)a4 completion:(id)a5;
- (void)dataSegmentForSummary:(id)a3 byteRange:(_NSRange)a4 migrator:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)fileForSummary:(id)a3 migrator:(id)a4 fileAccessor:(id)a5 completion:(id)a6;
- (void)itemSizeForSummary:(id)a3 migrator:(id)a4 completion:(id)a5;
- (void)setHost:(id)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setSession:(id)a3;
- (void)summariesDataForAccount:(id)a3 migrator:(id)a4 completion:(id)a5;
- (void)updateUIWithProgress:(double)a3 remainingTime:(double)a4 logString:(id)a5 completion:(id)a6;
@end

@implementation WLRemoteDeviceDataSource

- (WLRemoteDeviceDataSource)initWithHost:(id)a3 port:(unsigned __int16)a4 session:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WLRemoteDeviceDataSource;
  v10 = [(WLRemoteDeviceDataSource *)&v17 init];
  v11 = v10;
  if (v10)
  {
    [(WLRemoteDeviceDataSource *)v10 setPort:v6];
    [(WLRemoteDeviceDataSource *)v11 setHost:v8];
    [(WLRemoteDeviceDataSource *)v11 setSession:v9];
    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v11->_queue;
    v11->_queue = v12;

    v14 = v11->_queue;
    v15 = +[WLRemoteDeviceDataSource _requestSerialQueue];
    [(NSOperationQueue *)v14 setUnderlyingQueue:v15];

    [(NSOperationQueue *)v11->_queue setMaxConcurrentOperationCount:1];
  }

  return v11;
}

- (void)dealloc
{
  [(WLRemoteDeviceDataSource *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)WLRemoteDeviceDataSource;
  [(WLRemoteDeviceDataSource *)&v3 dealloc];
}

- (void)cancel
{
  [(NSOperationQueue *)self->_queue setSuspended:1];
  [(NSOperationQueue *)self->_queue cancelAllOperations];
  queue = self->_queue;
  [(NSOperationQueue *)queue waitUntilAllOperationsAreFinished];
}

- (void)accountsDataForMigrator:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(WLRemoteDeviceDataSource *)self _urlForAccountsWithMigrator:a3];
  id v8 = (void *)MEMORY[0x263F08BD8];
  [(WLRemoteDeviceDataSource *)self _urlRequestTimeout];
  id v9 = objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v7, 1);
  [(WLRemoteDeviceDataSource *)self _maximumRetriableTaskDurationForLongServerOperations];
  double v11 = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__WLRemoteDeviceDataSource_accountsDataForMigrator_completion___block_invoke;
  v13[3] = &unk_26490C420;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [(WLRemoteDeviceDataSource *)self _performRequest:v9 expectedContentLength:0 numberOfRetriesAllowed:6 preventRetriesAfterTaskExceedsDuration:1 taskDurationLimit:0 startDate:v13 completionHandler:v11];
}

void __63__WLRemoteDeviceDataSource_accountsDataForMigrator_completion___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  if (v8)
  {
    id v19 = 0;
    double v10 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v19];
    id v11 = v19;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v10;
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(uint64_t, id, uint64_t, void, double))(v13 + 16))(v13, v12, [v8 length], 0, a3);
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v17 = [v8 length];
      v18 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      _WLLog();

      uint64_t v16 = *(void *)(a1 + 40);
      if (v16) {
        (*(void (**)(uint64_t, void, uint64_t, id, double))(v16 + 16))(v16, 0, objc_msgSend(v8, "length", v15, v17, v18), v11, a3);
      }
    }
  }
  else
  {
    _WLLog();
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, void, void, id, double))(v14 + 16))(v14, 0, 0, v9, a3);
    }
  }
}

- (id)_urlForAccountsWithMigrator:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = [(WLRemoteDeviceDataSource *)self _urlScheme];
  host = self->_host;
  uint64_t port = self->_port;
  id v9 = [v5 contentType];

  double v10 = [v4 stringWithFormat:@"%@://%@:%u/remote_data_access/v1/%@/accounts", v6, host, port, v9];

  id v11 = [NSURL URLWithString:v10];

  return v11;
}

- (void)summariesDataForAccount:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = [a3 identifier];
  id v11 = [(WLRemoteDeviceDataSource *)self _urlForRecordSummariesForMigrator:v9 withAccountIdentifier:v10];

  id v12 = (void *)MEMORY[0x263F08BD8];
  [(WLRemoteDeviceDataSource *)self _urlRequestTimeout];
  uint64_t v13 = objc_msgSend(v12, "requestWithURL:cachePolicy:timeoutInterval:", v11, 1);
  [(WLRemoteDeviceDataSource *)self _maximumRetriableTaskDurationForLongServerOperations];
  double v15 = v14;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__WLRemoteDeviceDataSource_summariesDataForAccount_migrator_completion___block_invoke;
  v17[3] = &unk_26490C420;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [(WLRemoteDeviceDataSource *)self _performRequest:v13 expectedContentLength:0 numberOfRetriesAllowed:6 preventRetriesAfterTaskExceedsDuration:1 taskDurationLimit:0 startDate:v17 completionHandler:v15];
}

void __72__WLRemoteDeviceDataSource_summariesDataForAccount_migrator_completion___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  if (v8)
  {
    id v19 = 0;
    double v10 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v19];
    id v11 = v19;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = v10;
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(uint64_t, id, uint64_t, void, double))(v13 + 16))(v13, v12, [v8 length], 0, a3);
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v17 = [v8 length];
      id v18 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      _WLLog();

      uint64_t v15 = *(void *)(a1 + 40);
      if (v15) {
        (*(void (**)(uint64_t, void, uint64_t, id, double))(v15 + 16))(v15, 0, objc_msgSend(v8, "length", v14, v17, v18), v11, a3);
      }
    }
  }
  else
  {
    _WLLog();
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void, void, id, double))(v16 + 16))(v16, 0, 0, v9, a3);
    }
  }
}

- (id)_urlForRecordSummariesForMigrator:(id)a3 withAccountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 accountBased])
  {
    id v8 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    id v9 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v8];

    double v10 = NSString;
    id v11 = [(WLRemoteDeviceDataSource *)self _urlScheme];
    host = self->_host;
    uint64_t port = self->_port;
    uint64_t v14 = [v7 contentType];

    uint64_t v15 = [v10 stringWithFormat:@"%@://%@:%u/remote_data_access/v1/%@/accounts/%@", v11, host, port, v14, v9];
  }
  else
  {
    uint64_t v16 = NSString;
    id v9 = [(WLRemoteDeviceDataSource *)self _urlScheme];
    uint64_t v17 = self->_host;
    uint64_t v18 = self->_port;
    id v11 = [v7 contentType];

    uint64_t v15 = [v16 stringWithFormat:@"%@://%@:%u/remote_data_access/v1/%@", v9, v17, v18, v11];
  }

  id v19 = [NSURL URLWithString:v15];

  return v19;
}

- (void)itemSizeForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v20[0] = 0;
  v20[1] = 0;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 identifier];
  id v12 = [v10 account];

  uint64_t v13 = [v12 identifier];
  uint64_t v14 = [(WLRemoteDeviceDataSource *)self _urlForRecordForMigrator:v9 withSummaryIdentifier:v11 accountIdentifier:v13 segmentByteRange:v20];

  uint64_t v15 = (void *)MEMORY[0x263F08BD8];
  [(WLRemoteDeviceDataSource *)self _urlRequestTimeout];
  uint64_t v16 = objc_msgSend(v15, "requestWithURL:cachePolicy:timeoutInterval:", v14, 1);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__WLRemoteDeviceDataSource_itemSizeForSummary_migrator_completion___block_invoke;
  v18[3] = &unk_26490C448;
  v18[4] = self;
  id v19 = v8;
  id v17 = v8;
  [(WLRemoteDeviceDataSource *)self _performRequest:v16 expectedContentLength:0 numberOfRetriesAllowed:6 preventRetriesAfterTaskExceedsDuration:0 taskDurationLimit:0 startDate:v18 completionHandler:0.0];
}

void __67__WLRemoteDeviceDataSource_itemSizeForSummary_migrator_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = v8;
LABEL_3:
    _WLLog();
LABEL_4:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v7 valueForHTTPHeaderField:@"file-length"];
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  _WLLog();
  if (!objc_msgSend(v11, "length", v12, v11))
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F86308] code:5 userInfo:0];

    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v10 = [v11 integerValue];

  id v9 = 0;
LABEL_10:
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10);
}

- (void)fileForSummary:(id)a3 migrator:(id)a4 fileAccessor:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 identifier];
  uint64_t v15 = [v13 account];
  uint64_t v16 = [v15 identifier];
  id v17 = [(WLRemoteDeviceDataSource *)self _urlForRecordForMigrator:v12 withSummaryIdentifier:v14 accountIdentifier:v16 segmentByteRange:0];

  uint64_t v18 = (void *)MEMORY[0x263F08BD8];
  [(WLRemoteDeviceDataSource *)self _urlRequestTimeout];
  id v19 = objc_msgSend(v18, "requestWithURL:cachePolicy:timeoutInterval:", v17, 1);
  uint64_t v20 = [v13 itemSize];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __76__WLRemoteDeviceDataSource_fileForSummary_migrator_fileAccessor_completion___block_invoke;
  v22[3] = &unk_26490C470;
  v22[4] = self;
  id v23 = v10;
  id v21 = v10;
  [(WLRemoteDeviceDataSource *)self _performDownloadRequest:v19 expectedContentLength:v20 numberOfRetriesAllowed:6 startDate:0 fileAccessor:v11 completion:v22];
}

void __76__WLRemoteDeviceDataSource_fileForSummary_migrator_fileAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _WLLog();
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (id)_urlForRecordForMigrator:(id)a3 withSummaryIdentifier:(id)a4 accountIdentifier:(id)a5 segmentByteRange:(_NSRange *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x263F08708];
  id v13 = a4;
  uint64_t v14 = [v12 URLPathAllowedCharacterSet];
  uint64_t v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];

  if ([v10 accountBased])
  {
    uint64_t v16 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    id v36 = v11;
    id v17 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v16];

    uint64_t v18 = NSString;
    id v19 = [(WLRemoteDeviceDataSource *)self _urlScheme];
    host = self->_host;
    uint64_t port = self->_port;
    v22 = [v10 contentType];
    id v23 = [v18 stringWithFormat:@"%@://%@:%u/remote_data_access/v1/%@/accounts/%@/%@", v19, host, port, v22, v17, v15];

    if (!a6)
    {
      id v11 = v36;
      goto LABEL_8;
    }
    v24 = NSString;
    v25 = [NSNumber numberWithUnsignedInteger:a6->location];
    v26 = [NSNumber numberWithUnsignedInteger:a6->length];
    uint64_t v27 = [v24 stringWithFormat:@"%@?start=%@&length=%@", v23, v25, v26];

    id v23 = (void *)v27;
    id v11 = v36;
  }
  else
  {
    v28 = NSString;
    v29 = [(WLRemoteDeviceDataSource *)self _urlScheme];
    v30 = self->_host;
    uint64_t v31 = self->_port;
    v32 = [v10 contentType];
    v26 = [v28 stringWithFormat:@"%@://%@:%u/remote_data_access/v1/%@/%@", v29, v30, v31, v32, v15];

    if (!a6) {
      goto LABEL_9;
    }
    v33 = NSString;
    id v17 = [NSNumber numberWithUnsignedInteger:a6->location];
    v25 = [NSNumber numberWithUnsignedInteger:a6->length];
    id v23 = [v33 stringWithFormat:@"%@?start=%@&length=%@", v26, v17, v25];
  }

LABEL_8:
  v26 = v23;
LABEL_9:
  v34 = [NSURL URLWithString:v26];

  return v34;
}

- (void)_performDownloadRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 startDate:(id)a6 fileAccessor:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (!v15)
  {
    id v15 = [MEMORY[0x263EFF910] date];
  }
  uint64_t v18 = [v14 URL];
  v25 = [v18 absoluteString];
  _WLLog();

  objc_initWeak(&location, self);
  id v19 = (void *)MEMORY[0x263F086D0];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __131__WLRemoteDeviceDataSource__performDownloadRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke;
  v26[3] = &unk_26490C498;
  objc_copyWeak(v31, &location);
  id v20 = v17;
  id v29 = v20;
  id v21 = v14;
  id v27 = v21;
  v31[1] = (id)a4;
  v31[2] = (id)a5;
  id v22 = v15;
  id v28 = v22;
  id v23 = v16;
  id v30 = v23;
  v24 = objc_msgSend(v19, "blockOperationWithBlock:", v26, self, v25);
  [(NSOperationQueue *)self->_queue addOperation:v24];

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

void __131__WLRemoteDeviceDataSource__performDownloadRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _downloadTaskWithRequest:*(void *)(a1 + 32) expectedContentLength:*(void *)(a1 + 72) numberOfRetriesAllowed:*(void *)(a1 + 80) startDate:*(void *)(a1 + 40) fileAccessor:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
  }
  else if (*(void *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F86308];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"WLRemoteDeviceDataSource was deallocated.";
    id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = [v4 errorWithDomain:v5 code:1 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_downloadTaskWithRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 startDate:(id)a6 fileAccessor:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  objc_initWeak(&location, self);
  session = self->_session;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke;
  id v27 = &unk_26490C538;
  objc_copyWeak(v32, &location);
  id v19 = v17;
  id v30 = v19;
  id v20 = v14;
  id v28 = v20;
  v32[1] = (id)a4;
  v32[2] = (id)a5;
  id v21 = v15;
  id v29 = v21;
  id v22 = v16;
  id v31 = v22;
  id v23 = [(NSURLSession *)session downloadTaskWithRequest:v20 completionHandler:&v24];
  objc_msgSend(v23, "resume", v24, v25, v26, v27);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

void __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v55[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v11 = [*(id *)(a1 + 32) URL];
    id v28 = [v11 absoluteString];
    _WLLog();

    uint64_t v12 = *(void *)(a1 + 72);
    id v53 = v9;
    int v13 = objc_msgSend(WeakRetained, "_shouldHandleHTTPErrorWithResponse:expectedContentLength:error:", v8, v12, &v53, WeakRetained, v28, v9);
    id v14 = v53;

    if (v13)
    {
      id v15 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_2;
      block[3] = &unk_26490C4C0;
      id v52 = *(id *)(a1 + 48);
      id v9 = v14;
      id v51 = v9;
      dispatch_async(v15, block);

      id v16 = v52;
    }
    else if ([WeakRetained _shouldRetryLaterWithResponse:v8 error:v14])
    {
      id v20 = [*(id *)(a1 + 32) URL];
      id v29 = [v20 absoluteString];
      _WLLog();

      dispatch_time_t v21 = dispatch_time(0, 1000000000 * objc_msgSend(WeakRetained, "_retryLaterDelayInSeconds", WeakRetained, v29));
      id v22 = dispatch_get_global_queue(25, 0);
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_3;
      v43[3] = &unk_26490C4E8;
      id v44 = WeakRetained;
      id v45 = *(id *)(a1 + 32);
      long long v49 = *(_OWORD *)(a1 + 72);
      id v46 = *(id *)(a1 + 40);
      id v47 = *(id *)(a1 + 56);
      id v48 = *(id *)(a1 + 48);
      dispatch_after(v21, v22, v43);

      id v16 = v44;
      id v9 = v14;
    }
    else if (!v7 || v14)
    {
      uint64_t v25 = dispatch_get_global_queue(25, 0);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_5;
      v30[3] = &unk_26490C510;
      uint64_t v38 = *(void *)(a1 + 80);
      id v31 = WeakRetained;
      id v32 = v8;
      id v9 = v14;
      id v33 = v9;
      id v34 = *(id *)(a1 + 32);
      id v26 = *(id *)(a1 + 40);
      uint64_t v27 = *(void *)(a1 + 72);
      id v35 = v26;
      uint64_t v39 = v27;
      id v36 = *(id *)(a1 + 56);
      id v37 = *(id *)(a1 + 48);
      dispatch_async(v25, v30);

      id v16 = v31;
    }
    else
    {
      id v23 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      uint64_t v24 = dispatch_get_global_queue(25, 0);
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_4;
      v40[3] = &unk_26490C4C0;
      id v42 = *(id *)(a1 + 48);
      id v9 = v23;
      id v41 = v9;
      dispatch_async(v24, v40);

      id v16 = v42;
    }
    goto LABEL_12;
  }
  if (*(void *)(a1 + 48))
  {
    id v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F86308];
    uint64_t v54 = *MEMORY[0x263F08320];
    v55[0] = @"WLRemoteDeviceDataSource was deallocated.";
    id v19 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
    id v16 = [v17 errorWithDomain:v18 code:1 userInfo:v19];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_12:
  }
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDownloadRequest:*(void *)(a1 + 40) expectedContentLength:*(void *)(a1 + 72) numberOfRetriesAllowed:*(void *)(a1 + 80) startDate:*(void *)(a1 + 48) fileAccessor:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 88)
    && [*(id *)(a1 + 32) _shouldRetryWithData:0 response:*(void *)(a1 + 40) error:*(void *)(a1 + 48)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 56) URL];
    int v13 = [v3 absoluteString];
    uint64_t v14 = *(void *)(a1 + 48);
    _WLLog();

    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_newNumberOfRetriesAllowed:startDate:", *(void *)(a1 + 88), *(void *)(a1 + 64), v2, v13, v14);
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 96);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 80);
    return [v5 _performDownloadRequest:v7 expectedContentLength:v6 numberOfRetriesAllowed:v4 startDate:v8 fileAccessor:v9 completion:v10];
  }
  else
  {
    uint64_t v12 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
    return v12();
  }
}

- (void)dataSegmentForSummary:(id)a3 byteRange:(_NSRange)a4 migrator:(id)a5 completion:(id)a6
{
  _NSRange v22 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [v11 identifier];
  int v13 = [v11 account];

  uint64_t v14 = [v13 identifier];
  id v15 = [(WLRemoteDeviceDataSource *)self _urlForRecordForMigrator:v10 withSummaryIdentifier:v12 accountIdentifier:v14 segmentByteRange:&v22];

  id v16 = (void *)MEMORY[0x263F08BD8];
  [(WLRemoteDeviceDataSource *)self _urlRequestTimeout];
  id v17 = objc_msgSend(v16, "requestWithURL:cachePolicy:timeoutInterval:", v15, 1);
  NSUInteger length = v22.length;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __80__WLRemoteDeviceDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke;
  v20[3] = &unk_26490C448;
  v20[4] = self;
  id v21 = v9;
  id v19 = v9;
  [(WLRemoteDeviceDataSource *)self _performRequest:v17 expectedContentLength:length numberOfRetriesAllowed:6 preventRetriesAfterTaskExceedsDuration:0 taskDurationLimit:0 startDate:v20 completionHandler:0.0];
}

void __80__WLRemoteDeviceDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _WLLog();

  if (v6)
  {
    _WLLog();

    id v7 = 0;
  }
  else
  {
    id v7 = v9;
  }
  id v10 = v7;
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
}

- (void)dataForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 identifier];
  uint64_t v12 = [v10 account];

  int v13 = [v12 identifier];
  uint64_t v14 = [(WLRemoteDeviceDataSource *)self _urlForRecordForMigrator:v9 withSummaryIdentifier:v11 accountIdentifier:v13 segmentByteRange:0];

  id v15 = (void *)MEMORY[0x263F08BD8];
  [(WLRemoteDeviceDataSource *)self _urlRequestTimeout];
  id v16 = objc_msgSend(v15, "requestWithURL:cachePolicy:timeoutInterval:", v14, 1);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__WLRemoteDeviceDataSource_dataForSummary_migrator_completion___block_invoke;
  v18[3] = &unk_26490C448;
  v18[4] = self;
  id v19 = v8;
  id v17 = v8;
  [(WLRemoteDeviceDataSource *)self _performRequest:v16 expectedContentLength:0 numberOfRetriesAllowed:6 preventRetriesAfterTaskExceedsDuration:0 taskDurationLimit:0 startDate:v18 completionHandler:0.0];
}

void __63__WLRemoteDeviceDataSource_dataForSummary_migrator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _WLLog();

  if (v6)
  {
    _WLLog();

    id v7 = 0;
  }
  else
  {
    id v7 = v9;
  }
  id v10 = v7;
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
}

- (void)updateUIWithProgress:(double)a3 remainingTime:(double)a4 logString:(id)a5 completion:(id)a6
{
  id v10 = a6;
  if (a3 >= 1.0)
  {
    int v13 = NSString;
    uint64_t v12 = [(WLRemoteDeviceDataSource *)self _urlScheme];
    [v13 stringWithFormat:@"%@://%@:%u/transfer?status=done", v12, self->_host, self->_port, v18, v19];
  }
  else
  {
    LODWORD(v6) = vcvtmd_s64_f64(a3 * 100.0);
    id v11 = NSString;
    uint64_t v12 = [(WLRemoteDeviceDataSource *)self _urlScheme];
    [v11 stringWithFormat:@"%@://%@:%u/transfer?status=active&progress=%d&remaining_time=%ld", v12, self->_host, self->_port, v6, (uint64_t)a4];
  uint64_t v14 = };

  id v15 = [NSURL URLWithString:v14];
  id v16 = [MEMORY[0x263F089E0] requestWithURL:v15];
  [v16 setHTTPMethod:@"PUT"];
  [v16 setTimeoutInterval:2.0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __84__WLRemoteDeviceDataSource_updateUIWithProgress_remainingTime_logString_completion___block_invoke;
  v20[3] = &unk_26490C560;
  id v21 = v10;
  id v17 = v10;
  [(WLRemoteDeviceDataSource *)self _performRequest:v16 expectedContentLength:0 numberOfRetriesAllowed:0 preventRetriesAfterTaskExceedsDuration:0 taskDurationLimit:0 startDate:v20 completionHandler:0.0];
}

uint64_t __84__WLRemoteDeviceDataSource_updateUIWithProgress_remainingTime_logString_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (id)_urlScheme
{
  if (_urlScheme_onceToken != -1) {
    dispatch_once(&_urlScheme_onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = (void *)_urlScheme_scheme;
  return v2;
}

void __38__WLRemoteDeviceDataSource__urlScheme__block_invoke()
{
  if ([MEMORY[0x263F862A0] isInternal]
    && [MEMORY[0x263F862C0] BOOLForKey:@"UseHTTP"] == 1)
  {
    v0 = @"http";
  }
  else
  {
    v0 = @"https";
  }
  v1 = (void *)_urlScheme_scheme;
  _urlScheme_scheme = (uint64_t)v0;
}

- (double)_urlRequestTimeout
{
  return 60.0;
}

- (double)_maximumRetriableTaskDurationForLongServerOperations
{
  return 60.0;
}

+ (id)_requestSerialQueue
{
  if (_requestSerialQueue_onceToken != -1) {
    dispatch_once(&_requestSerialQueue_onceToken, &__block_literal_global_110);
  }
  uint64_t v2 = (void *)_requestSerialQueue__requestQueue;
  return v2;
}

void __47__WLRemoteDeviceDataSource__requestSerialQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.welcomekitcore.WLMigrationDataCoordinator.requestSerialQueue", v2);
  v1 = (void *)_requestSerialQueue__requestQueue;
  _requestSerialQueue__requestQueue = (uint64_t)v0;
}

- (void)_performRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 preventRetriesAfterTaskExceedsDuration:(BOOL)a6 taskDurationLimit:(double)a7 startDate:(id)a8 completionHandler:(id)a9
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  if (!v17)
  {
    id v17 = [MEMORY[0x263EFF910] date];
  }
  objc_initWeak(&location, self);
  uint64_t v19 = (void *)MEMORY[0x263F086D0];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __174__WLRemoteDeviceDataSource__performRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke;
  v24[3] = &unk_26490C588;
  objc_copyWeak(v28, &location);
  id v20 = v18;
  id v27 = v20;
  id v21 = v17;
  id v25 = v21;
  id v22 = v16;
  id v26 = v22;
  v28[1] = (id)a4;
  v28[2] = (id)a5;
  BOOL v29 = a6;
  v28[3] = *(id *)&a7;
  id v23 = [v19 blockOperationWithBlock:v24];
  [(NSOperationQueue *)self->_queue addOperation:v23];

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __174__WLRemoteDeviceDataSource__performRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _runTaskWithRequest:*(void *)(a1 + 40) expectedContentLength:*(void *)(a1 + 64) numberOfRetriesAllowed:*(void *)(a1 + 72) preventRetriesAfterTaskExceedsDuration:*(unsigned __int8 *)(a1 + 88) taskDurationLimit:*(void *)(a1 + 32) startDate:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 80)];
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F86308];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"WLRemoteDeviceDataSource was deallocated.";
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v7 = [v4 errorWithDomain:v5 code:1 userInfo:v6];

    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v7);
  }
}

- (void)_runTaskWithRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 preventRetriesAfterTaskExceedsDuration:(BOOL)a6 taskDurationLimit:(double)a7 startDate:(id)a8 completionHandler:(id)a9
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  objc_initWeak(location, self);
  uint64_t v19 = [v16 URL];
  id v27 = [v19 absoluteString];
  _WLLog();

  id v20 = objc_msgSend(MEMORY[0x263EFF910], "date", self, v27);
  session = self->_session;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke;
  v28[3] = &unk_26490C600;
  objc_copyWeak(v34, location);
  id v22 = v18;
  id v33 = v22;
  id v23 = v17;
  id v29 = v23;
  id v24 = v20;
  id v30 = v24;
  id v25 = v16;
  id v31 = v25;
  id v32 = self;
  v34[1] = (id)a4;
  v34[2] = (id)a5;
  BOOL v35 = a6;
  v34[3] = *(id *)&a7;
  id v26 = [(NSURLSession *)session dataTaskWithRequest:v25 completionHandler:v28];
  [v26 resume];

  objc_destroyWeak(v34);
  objc_destroyWeak(location);
}

void __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v42[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _taskDurationSinceStartDate:*(void *)(a1 + 40)];
    uint64_t v13 = v12;
    uint64_t v14 = [*(id *)(a1 + 48) URL];
    id v26 = [v14 absoluteString];
    _WLLog();

    id v15 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_2;
    block[3] = &unk_26490C5D8;
    id v28 = v11;
    id v16 = v8;
    uint64_t v17 = *(void *)(a1 + 80);
    id v29 = v16;
    uint64_t v36 = v17;
    id v35 = *(id *)(a1 + 64);
    id v30 = v7;
    uint64_t v37 = v13;
    id v31 = v9;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 56);
    id v32 = v18;
    uint64_t v33 = v19;
    uint64_t v38 = *(void *)(a1 + 88);
    char v40 = *(unsigned char *)(a1 + 104);
    uint64_t v39 = *(void *)(a1 + 96);
    id v34 = *(id *)(a1 + 32);
    dispatch_async(v15, block);

    id v20 = v28;
LABEL_5:

    goto LABEL_6;
  }
  if (*(void *)(a1 + 64))
  {
    id v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F86308];
    uint64_t v41 = *MEMORY[0x263F08320];
    v42[0] = @"WLRemoteDeviceDataSource was deallocated.";
    id v23 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    id v20 = [v21 errorWithDomain:v22 code:1 userInfo:v23];

    uint64_t v24 = *(void *)(a1 + 64);
    id v25 = [MEMORY[0x263EFF910] date];
    [v25 timeIntervalSinceDate:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, id, id, void *))(v24 + 16))(v24, v7, v8, v20);

    goto LABEL_5;
  }
LABEL_6:
}

void __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 96);
  id v29 = 0;
  int v5 = [v2 _shouldHandleHTTPErrorWithResponse:v3 expectedContentLength:v4 error:&v29];
  id v6 = v29;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 88);
    if (v8) {
      goto LABEL_11;
    }
  }
  else if ([*(id *)(a1 + 32) _shouldRetryLaterWithResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 56)])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 64) URL];
    uint64_t v17 = [v10 absoluteString];
    _WLLog();

    dispatch_time_t v11 = dispatch_time(0, 1000000000 * objc_msgSend(*(id *)(a1 + 32), "_retryLaterDelayInSeconds", v9, v17));
    uint64_t v12 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_3;
    block[3] = &unk_26490C5B0;
    int8x16_t v20 = *(int8x16_t *)(a1 + 64);
    id v13 = (id)v20.i64[0];
    int8x16_t v22 = vextq_s8(v20, v20, 8uLL);
    uint64_t v14 = *(void *)(a1 + 112);
    uint64_t v25 = *(void *)(a1 + 96);
    uint64_t v26 = v14;
    char v28 = *(unsigned char *)(a1 + 128);
    uint64_t v27 = *(void *)(a1 + 120);
    id v23 = *(id *)(a1 + 80);
    id v24 = *(id *)(a1 + 88);
    dispatch_after(v11, v12, block);
  }
  else if (*(void *)(a1 + 112) {
         && [*(id *)(a1 + 32) _shouldRetryWithData:*(void *)(a1 + 48) response:*(void *)(a1 + 40) error:*(void *)(a1 + 56)]&& objc_msgSend(*(id *)(a1 + 32), "_shouldRetryWithPreventRetriesAfterTaskExceedsDuration:taskDurationLimit:taskDuration:", *(unsigned __int8 *)(a1 + 128), *(double *)(a1 + 120), *(double *)(a1 + 104)))
  }
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = [*(id *)(a1 + 64) URL];
    id v18 = [v16 absoluteString];
    uint64_t v19 = *(void *)(a1 + 56);
    _WLLog();

    objc_msgSend(*(id *)(a1 + 32), "_willRetryPerformRequest", v15, v18, v19);
    objc_msgSend(*(id *)(a1 + 32), "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", *(void *)(a1 + 64), *(void *)(a1 + 96), objc_msgSend(*(id *)(a1 + 32), "_newNumberOfRetriesAllowed:startDate:", *(void *)(a1 + 112), *(void *)(a1 + 80)), *(unsigned __int8 *)(a1 + 128), *(void *)(a1 + 80), *(void *)(a1 + 88), *(double *)(a1 + 120));
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 88);
    if (v8)
    {
LABEL_11:
      v7.n128_u64[0] = *(void *)(a1 + 104);
      (*(void (**)(__n128))(v8 + 16))(v7);
    }
  }
}

uint64_t __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequest:*(void *)(a1 + 40) expectedContentLength:*(void *)(a1 + 64) numberOfRetriesAllowed:*(void *)(a1 + 72) preventRetriesAfterTaskExceedsDuration:*(unsigned __int8 *)(a1 + 88) taskDurationLimit:*(void *)(a1 + 48) startDate:*(void *)(a1 + 56) completionHandler:*(double *)(a1 + 80)];
}

- (double)_taskDurationSinceStartDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  int v5 = [v3 date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  return v7;
}

- (BOOL)_shouldRetryLaterWithResponse:(id)a3 error:(id)a4
{
  id v5 = a3;
  if (a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v8 = 0;
  }
  else
  {
    id v6 = v5;
    if ([v6 statusCode] == 200)
    {
      double v7 = [v6 valueForHTTPHeaderField:@"Retry-After"];
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (int64_t)_retryLaterDelayInSeconds
{
  return 3;
}

- (BOOL)_shouldRetryWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v6 = a4;
  if (a5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = [v7 statusCode];
    BOOL v9 = v8 != 200;
    if (v8 != 200)
    {
      dispatch_time_t v11 = [v7 URL];
      [v7 statusCode];
      _WLLog();
    }
  }

  return v9;
}

- (BOOL)_shouldRetryWithPreventRetriesAfterTaskExceedsDuration:(BOOL)a3 taskDurationLimit:(double)a4 taskDuration:(double)a5
{
  return a5 <= a4 || !a3;
}

- (unint64_t)_newNumberOfRetriesAllowed:(unint64_t)a3 startDate:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a4;
  id v7 = [v5 date];
  [v7 timeIntervalSinceDate:v6];
  double v9 = v8;

  if (v9 <= 5.0)
  {
    dispatch_time_t v11 = [NSNumber numberWithDouble:v9];
    _WLLog();
  }
  else
  {
    --a3;
  }
  return a3;
}

- (BOOL)_shouldHandleHTTPErrorWithResponse:(id)a3 expectedContentLength:(unint64_t)a4 error:(id *)a5
{
  id v5 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  return 0;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_uint64_t port = a3;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end