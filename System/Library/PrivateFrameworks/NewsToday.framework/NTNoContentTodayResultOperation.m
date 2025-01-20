@interface NTNoContentTodayResultOperation
- (BOOL)validateOperation;
- (NSDictionary)resultAssetHandlesByAssetID;
- (NTPBTodayResultOperationFetchInfo)resultFetchInfo;
- (NTTodayResults)resultTodayResults;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setResultAssetHandlesByAssetID:(id)a3;
- (void)setResultFetchInfo:(id)a3;
- (void)setResultTodayResults:(id)a3;
- (void)validateOperation;
@end

@implementation NTNoContentTodayResultOperation

- (BOOL)validateOperation
{
  v2 = [(NTTodayResultOperation *)self headlineResultCompletionHandler];

  if (!v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNoContentTodayResultOperation validateOperation]();
  }
  return v2 != 0;
}

- (void)performOperation
{
  v3 = [NTTodayResults alloc];
  v4 = objc_opt_new();
  v5 = [MEMORY[0x263EFF910] date];
  v7 = [(NTTodayResults *)v3 initWithSourceIdentifier:@"unknown" sections:v4 expirationDate:v5 headlineScale:1.0];

  v6 = objc_opt_new();
  [v6 setTodaySourceIdentifier:@"unknown"];
  [(NTNoContentTodayResultOperation *)self setResultTodayResults:v7];
  [(NTNoContentTodayResultOperation *)self setResultAssetHandlesByAssetID:MEMORY[0x263EFFA78]];
  [(NTNoContentTodayResultOperation *)self setResultFetchInfo:v6];
  [(FCOperation *)self finishedPerformingOperationWithError:0];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  v8 = [(NTTodayResultOperation *)self headlineResultCompletionHandler];
  v5 = [(NTNoContentTodayResultOperation *)self resultTodayResults];
  v6 = [(NTNoContentTodayResultOperation *)self resultAssetHandlesByAssetID];
  v7 = [(NTNoContentTodayResultOperation *)self resultFetchInfo];
  v8[2](v8, v5, v6, v7, v4);
}

- (NTTodayResults)resultTodayResults
{
  return self->_resultTodayResults;
}

- (void)setResultTodayResults:(id)a3
{
}

- (NSDictionary)resultAssetHandlesByAssetID
{
  return self->_resultAssetHandlesByAssetID;
}

- (void)setResultAssetHandlesByAssetID:(id)a3
{
}

- (NTPBTodayResultOperationFetchInfo)resultFetchInfo
{
  return self->_resultFetchInfo;
}

- (void)setResultFetchInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFetchInfo, 0);
  objc_storeStrong((id *)&self->_resultAssetHandlesByAssetID, 0);

  objc_storeStrong((id *)&self->_resultTodayResults, 0);
}

- (void)validateOperation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"No content result operation must have a completion handler"];
  int v1 = 136315906;
  v2 = "-[NTNoContentTodayResultOperation validateOperation]";
  __int16 v3 = 2080;
  id v4 = "NTNoContentTodayResultOperation.m";
  __int16 v5 = 1024;
  int v6 = 27;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end