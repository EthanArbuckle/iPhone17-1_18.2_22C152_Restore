@interface WBSChromeHistoryImporterDelegateProxy
- (WBSChromeHistoryImporterDelegateProxy)initWithDelegate:(id)a3;
- (unint64_t)numberOfVisitImported;
- (void)addVisitWithURLString:(id)a3 visitTime:(double)a4 title:(id)a5 loadSuccessful:(BOOL)a6 httpGet:(BOOL)a7 redirectSourceURLString:(id)a8 redirectSourceVisitTime:(double)a9 visitCount:(unint64_t)a10;
- (void)finishWithCompletionHandler:(id)a3;
@end

@implementation WBSChromeHistoryImporterDelegateProxy

- (WBSChromeHistoryImporterDelegateProxy)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSChromeHistoryImporterDelegateProxy;
  v6 = [(WBSChromeHistoryImporterDelegateProxy *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    uniqueHighLevelDomains = v7->_uniqueHighLevelDomains;
    v7->_uniqueHighLevelDomains = (NSMutableSet *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)addVisitWithURLString:(id)a3 visitTime:(double)a4 title:(id)a5 loadSuccessful:(BOOL)a6 httpGet:(BOOL)a7 redirectSourceURLString:(id)a8 redirectSourceVisitTime:(double)a9 visitCount:(unint64_t)a10
{
  BOOL v13 = a7;
  BOOL v14 = a6;
  id v23 = a3;
  id v18 = a5;
  id v19 = a8;
  v20 = [(WBSHistoryImporterDelegate *)self->_delegate remoteObjectProxyWithErrorHandler:&__block_literal_global_14];
  v21 = [MEMORY[0x1E4F1CB10] URLWithString:v23];
  v22 = objc_msgSend(v21, "safari_highLevelDomain");

  if (v22) {
    [(NSMutableSet *)self->_uniqueHighLevelDomains addObject:v22];
  }
  [v20 addVisitWithURLString:v23 visitTime:v18 title:v14 loadSuccessful:v13 httpGet:v19 redirectSourceURLString:a10 redirectSourceVisitTime:a4 visitCount:a9];
}

void __161__WBSChromeHistoryImporterDelegateProxy_addVisitWithURLString_visitTime_title_loadSuccessful_httpGet_redirectSourceURLString_redirectSourceVisitTime_visitCount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXImport();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __161__WBSChromeHistoryImporterDelegateProxy_addVisitWithURLString_visitTime_title_loadSuccessful_httpGet_redirectSourceURLString_redirectSourceVisitTime_visitCount___block_invoke_cold_1(v3, v2);
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  uniqueHighLevelDomains = self->_uniqueHighLevelDomains;
  id v5 = a3;
  self->_numberOfVisitImported = [(NSMutableSet *)uniqueHighLevelDomains count];
  id v6 = [(WBSHistoryImporterDelegate *)self->_delegate remoteObjectProxyWithErrorHandler:v5];
  [v6 finishWithCompletionHandler:v5];
}

- (unint64_t)numberOfVisitImported
{
  return self->_numberOfVisitImported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueHighLevelDomains, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __161__WBSChromeHistoryImporterDelegateProxy_addVisitWithURLString_visitTime_title_loadSuccessful_httpGet_redirectSourceURLString_redirectSourceVisitTime_visitCount___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Failed to deliver visit to delegate: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end