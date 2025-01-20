@interface NTKTimelineRemoteDataSourceProvider
- (CLKComplicationDataSource)dataSource;
- (NSOperationQueue)operationQueue;
- (NTKTimelineDataSourceWrapper)wrapper;
- (NTKTimelineRemoteDataSourceProvider)initWithDataSource:(id)a3;
- (double)timeout;
- (void)getCurrentEntryForComplication:(id)a3 completion:(id)a4;
- (void)getEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)tl_getDataSourceWithCompletion:(id)a3;
@end

@implementation NTKTimelineRemoteDataSourceProvider

- (NTKTimelineRemoteDataSourceProvider)initWithDataSource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKTimelineRemoteDataSourceProvider;
  v5 = [(NTKTimelineRemoteDataSourceProvider *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[NTKTimelineDataSourceWrapper alloc] initWithDataSource:v4];
    wrapper = v6->_wrapper;
    v6->_wrapper = v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v9;

    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
    v6->_timeout = 10.0;
  }

  return v6;
}

- (void)getCurrentEntryForComplication:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FAF310]) initWithIdentifiable:v6 timeout:1 entryLimit:self->_timeout];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke;
  v18[3] = &unk_1E62C24C8;
  id v9 = v6;
  id v19 = v9;
  id v20 = v7;
  id v10 = v7;
  [v8 setOperationCompletionBlock:v18];
  id v11 = objc_alloc(MEMORY[0x1E4FAF308]);
  v21[0] = v8;
  objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v13 = (void *)[v11 initWithProvider:self operations:v12 providerTimeout:self->_timeout operationTimeout:self->_timeout];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke_69;
  v16[3] = &unk_1E62C0D88;
  id v17 = v9;
  id v14 = v9;
  [v13 setSessionCompletionBlock:v16];
  v15 = [(NTKTimelineRemoteDataSourceProvider *)self operationQueue];
  [v15 addOperation:v13];
}

void __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [a2 timeline];
  id v4 = [v3 nowEntry];

  v5 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Current entry fetched for complication %@ : %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke_69(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Current entry session for complication %@ finished.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  objc_super v12 = (objc_class *)MEMORY[0x1E4FAF300];
  id v13 = a4;
  id v14 = (void *)[[v12 alloc] initWithIdentifiable:v10 afterDate:v13 timeout:a5 entryLimit:self->_timeout];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke;
  v24[3] = &unk_1E62C24F0;
  id v15 = v10;
  id v25 = v15;
  id v26 = v11;
  id v16 = v11;
  [v14 setOperationCompletionBlock:v24];
  id v17 = objc_alloc(MEMORY[0x1E4FAF308]);
  v27[0] = v14;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v19 = (void *)[v17 initWithProvider:self operations:v18 providerTimeout:self->_timeout operationTimeout:self->_timeout];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke_73;
  v22[3] = &unk_1E62C0D88;
  id v23 = v15;
  id v20 = v15;
  [v19 setSessionCompletionBlock:v22];
  v21 = [(NTKTimelineRemoteDataSourceProvider *)self operationQueue];
  [v21 addOperation:v19];
}

void __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 timelineEntries];
  int v4 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    __int16 v9 = v3;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Entries fetched for complication %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke_73(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Extend session for complication %@ finished.", (uint8_t *)&v4, 0xCu);
  }
}

- (CLKComplicationDataSource)dataSource
{
  v2 = [(NTKTimelineRemoteDataSourceProvider *)self wrapper];
  uint64_t v3 = [v2 dataSource];

  return (CLKComplicationDataSource *)v3;
}

- (void)tl_getDataSourceWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, void))a3;
  int v4 = [(NTKTimelineRemoteDataSourceProvider *)self wrapper];
  if (v4)
  {
    v6[2](v6, v4, 0);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKComplicationTimelineDomain" code:404 userInfo:&unk_1F16E8840];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v5);
  }
}

- (NTKTimelineDataSourceWrapper)wrapper
{
  return self->_wrapper;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end