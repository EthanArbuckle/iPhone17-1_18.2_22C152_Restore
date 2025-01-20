@interface WFCloudKitWebServiceAssetDownloadOperation
- (NSString)key;
- (NSURL)assetURL;
- (WFCloudKitItem)item;
- (WFCloudKitWebServiceAssetDownloadOperation)initWithAssetURL:(id)a3 item:(id)a4 key:(id)a5;
- (void)setAssetURL:(id)a3;
- (void)setItem:(id)a3;
- (void)setKey:(id)a3;
- (void)start;
@end

@implementation WFCloudKitWebServiceAssetDownloadOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setItem:(id)a3
{
}

- (WFCloudKitItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (WFCloudKitItem *)WeakRetained;
}

- (void)setAssetURL:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)start
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)WFCloudKitWebServiceAssetDownloadOperation;
  [(WFCloudKitAsyncOperation *)&v10 start];
  v3 = getWFCloudKitWSLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(WFCloudKitWebServiceAssetDownloadOperation *)self item];
    v5 = [(WFCloudKitWebServiceAssetDownloadOperation *)self key];
    *(_DWORD *)buf = 136315650;
    v12 = "-[WFCloudKitWebServiceAssetDownloadOperation start]";
    __int16 v13 = 2112;
    v14 = v4;
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Asset fetch operation starting: %@ %@", buf, 0x20u);
  }
  v6 = objc_msgSend(MEMORY[0x1E4F290E0], "wf_sharedSession");
  v7 = [(WFCloudKitWebServiceAssetDownloadOperation *)self assetURL];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__WFCloudKitWebServiceAssetDownloadOperation_start__block_invoke;
  v9[3] = &unk_1E65543F8;
  v9[4] = self;
  v8 = [v6 downloadTaskWithURL:v7 completionHandler:v9];
  [v8 resume];
}

void __51__WFCloudKitWebServiceAssetDownloadOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = WFEnforceClass(v5, v6);

  if (v11 && [v7 statusCode] == 200)
  {
    v8 = [MEMORY[0x1E4F5A900] fileWithURL:v11 options:5];
    v9 = [*(id *)(a1 + 32) item];
    objc_super v10 = [*(id *)(a1 + 32) key];
    [v9 willChangeValueForKey:v10];
    [v9 setValue:v8 forKey:v10];
    [v9 didChangeValueForKey:v10];
  }
  [*(id *)(a1 + 32) finishExecuting];
}

- (WFCloudKitWebServiceAssetDownloadOperation)initWithAssetURL:(id)a3 item:(id)a4 key:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFCloudKitWebServiceAssetDownloadOperation;
  v12 = [(WFCloudKitWebServiceAssetDownloadOperation *)&v16 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetURL, a3);
    objc_storeWeak((id *)&v13->_item, v10);
    objc_storeStrong((id *)&v13->_key, a5);
    v14 = v13;
  }

  return v13;
}

@end