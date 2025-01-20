@interface NTKTimelineDataOperation
+ (id)operationWithLocalDataSource:(id)a3;
+ (id)operationWithRemoteDataSource:(id)a3 complication:(id)a4;
- (BOOL)_validateEntry:(id)a3;
- (BOOL)_validateTemplate:(id)a3;
- (BOOL)canceled;
- (BOOL)started;
- (id)_finalizedValidEntries:(id)a3;
- (void)cancel;
- (void)start;
@end

@implementation NTKTimelineDataOperation

+ (id)operationWithLocalDataSource:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

+ (id)operationWithRemoteDataSource:(id)a3 complication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[2];
  v8[2] = v6;
  id v10 = v6;

  v11 = (void *)v8[3];
  v8[3] = v7;

  return v8;
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    localDataSource = self->_localDataSource;
    if (!localDataSource) {
      localDataSource = self->_remoteDataSource;
    }
    int v5 = 138412546;
    id v6 = self;
    __int16 v7 = 2112;
    v8 = localDataSource;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Starting timeline operation %@ on %@", (uint8_t *)&v5, 0x16u);
  }

  [(NTKTimelineDataOperation *)self _start];
  self->_started = 1;
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self->_canceled)
  {
    v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      int v5 = self;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling timeline operation %@", (uint8_t *)&v4, 0xCu);
    }

    [(NTKTimelineDataOperation *)self _cancel];
  }
  self->_canceled = 1;
}

- (BOOL)_validateEntry:(id)a3
{
  char v4 = [a3 validateWithError:0];
  if ((v4 & 1) == 0)
  {
    int v5 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NTKTimelineDataOperation _validateEntry:]((uint64_t)self, v5);
    }
  }
  return v4;
}

- (BOOL)_validateTemplate:(id)a3
{
  char v4 = [a3 validateWithError:0];
  if ((v4 & 1) == 0)
  {
    int v5 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NTKTimelineDataOperation _validateTemplate:]((uint64_t)self, v5);
    }
  }
  return v4;
}

- (id)_finalizedValidEntries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (-[NTKTimelineDataOperation _validateEntry:](self, "_validateEntry:", v11, (void)v14))
        {
          v12 = [v11 finalizedCopy];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)started
{
  return self->_started;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteComplication, 0);
  objc_storeStrong((id *)&self->_remoteDataSource, 0);
  objc_storeStrong((id *)&self->_localDataSource, 0);
}

- (void)_validateEntry:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    uint64_t v2 = *(void *)(a1 + 16);
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "**** Invalid complication timeline entry is being discarded:\n                                ********* Data source = %@", (uint8_t *)&v3, 0xCu);
}

- (void)_validateTemplate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    uint64_t v2 = *(void *)(a1 + 16);
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "**** Invalid complication template is being discarded:\n                                ********* Data source = %@", (uint8_t *)&v3, 0xCu);
}

@end