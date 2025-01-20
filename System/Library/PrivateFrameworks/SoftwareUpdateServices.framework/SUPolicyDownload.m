@interface SUPolicyDownload
- (BOOL)allowExpensiveNetwork;
- (BOOL)allowsCellular;
- (BOOL)checkAvailableSpace;
- (BOOL)discretionary;
- (SUDownloadOptions)downloadOptions;
- (SUPolicyDownload)initWithDownloadOptions:(id)a3;
- (int)cacheDeleteUrgency;
- (void)setDownloadOptions:(id)a3;
@end

@implementation SUPolicyDownload

- (SUPolicyDownload)initWithDownloadOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUPolicyDownload;
  v5 = [(SUPolicyDownload *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SUPolicyDownload *)v5 setDownloadOptions:v4];
  }

  return v6;
}

- (BOOL)discretionary
{
  v2 = [(SUPolicyDownload *)self downloadOptions];
  char v3 = [v2 isAutoDownload];

  return v3;
}

- (BOOL)allowsCellular
{
  v2 = [(SUPolicyDownload *)self downloadOptions];
  char v3 = [v2 isEnabledForCellular];

  return v3;
}

- (BOOL)allowExpensiveNetwork
{
  v2 = [(SUPolicyDownload *)self downloadOptions];
  char v3 = [v2 isEnabledForExpensiveNetwork];

  return v3;
}

- (BOOL)checkAvailableSpace
{
  return 1;
}

- (int)cacheDeleteUrgency
{
  return 4;
}

- (SUDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end