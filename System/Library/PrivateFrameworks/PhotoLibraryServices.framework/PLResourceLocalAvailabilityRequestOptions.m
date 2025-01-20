@interface PLResourceLocalAvailabilityRequestOptions
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isTransient;
- (BOOL)shouldPrioritize;
- (BOOL)wantsProgress;
- (CPLResourceTransferTaskOptions)downloadOptions;
- (NSString)clientBundleID;
- (NSString)taskIdentifier;
- (PLResourceLocalAvailabilityRequestOptions)init;
- (id)dataHandler;
- (void)setClientBundleID:(id)a3;
- (void)setDataHandler:(id)a3;
- (void)setDownloadOptions:(id)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setTransient:(BOOL)a3;
- (void)setWantsProgress:(BOOL)a3;
@end

@implementation PLResourceLocalAvailabilityRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (void)setDownloadOptions:(id)a3
{
}

- (CPLResourceTransferTaskOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setDataHandler:(id)a3
{
}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)shouldPrioritize
{
  v2 = [(PLResourceLocalAvailabilityRequestOptions *)self downloadOptions];
  char v3 = [v2 isHighPriority];

  return v3;
}

- (PLResourceLocalAvailabilityRequestOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLResourceLocalAvailabilityRequestOptions;
  v2 = [(PLResourceLocalAvailabilityRequestOptions *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F59958] defaultOptions];
    downloadOptions = v2->_downloadOptions;
    v2->_downloadOptions = (CPLResourceTransferTaskOptions *)v3;
  }
  return v2;
}

@end