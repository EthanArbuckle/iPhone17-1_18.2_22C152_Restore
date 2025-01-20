@interface WFRemoteExecutionFileCoder
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)transferIdentifiers;
- (NSString)requestIdentifier;
- (NSURL)fileURL;
- (WFRemoteExecutionCoordinator)coordinator;
- (WFRemoteExecutionFileCoder)initWithCoder:(id)a3;
- (WFRemoteExecutionFileCoder)initWithCoordinator:(id)a3 requestIdentifier:(id)a4;
- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5;
- (id)fileAvailabilityHandler;
- (int64_t)targetPlatform;
- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5;
- (void)cancelOutstandingTransfers;
- (void)encodeWithCoder:(id)a3;
- (void)fileAvailabilityChanged;
- (void)setCoordinator:(id)a3;
- (void)setFileAvailabilityHandler:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setTransferIdentifiers:(id)a3;
- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3;
@end

@implementation WFRemoteExecutionFileCoder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong(&self->_fileAvailabilityHandler, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_transferIdentifiers, 0);
}

- (void)setCoordinator:(id)a3
{
}

- (WFRemoteExecutionCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  return (WFRemoteExecutionCoordinator *)WeakRetained;
}

- (void)setFileAvailabilityHandler:(id)a3
{
}

- (id)fileAvailabilityHandler
{
  return self->_fileAvailabilityHandler;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setTransferIdentifiers:(id)a3
{
}

- (NSMutableArray)transferIdentifiers
{
  return self->_transferIdentifiers;
}

- (WFRemoteExecutionFileCoder)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFRemoteExecutionFileCoder;
  v5 = [(WFFileCoder *)&v14 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = NSStringFromSelector(sel_transferIdentifiers);
  uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
  transferIdentifiers = v5->_transferIdentifiers;
  v5->_transferIdentifiers = (NSMutableArray *)v10;

  if (v5->_transferIdentifiers) {
    v12 = v5;
  }
  else {
LABEL_4:
  }
    v12 = 0;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteExecutionFileCoder;
  id v4 = a3;
  [(WFFileCoder *)&v7 encodeWithCoder:v4];
  transferIdentifiers = self->_transferIdentifiers;
  v6 = NSStringFromSelector(sel_transferIdentifiers);
  objc_msgSend(v4, "encodeObject:forKey:", transferIdentifiers, v6, v7.receiver, v7.super_class);
}

- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WFRemoteExecutionFileCoder_waitForFileAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E65572A0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFRemoteExecutionFileCoder;
  id v5 = v4;
  [(WFFileCoder *)&v6 waitForFileAvailabilityWithCompletionHandler:v7];
}

uint64_t __75__WFRemoteExecutionFileCoder_waitForFileAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) transferIdentifiers];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) fileURL];

    id v5 = getWFRemoteExecutionLogObject();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        objc_super v7 = [*(id *)(a1 + 32) transferIdentifiers];
        int v11 = 136315394;
        v12 = "-[WFRemoteExecutionFileCoder waitForFileAvailabilityWithCompletionHandler:]_block_invoke";
        __int16 v13 = 2114;
        objc_super v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Files are already available with identifiers: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (v6)
      {
        uint64_t v10 = [*(id *)(a1 + 32) transferIdentifiers];
        int v11 = 136315394;
        v12 = "-[WFRemoteExecutionFileCoder waitForFileAvailabilityWithCompletionHandler:]_block_invoke";
        __int16 v13 = 2114;
        objc_super v14 = v10;
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Waiting for files to be available with identifiers: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      return [*(id *)(a1 + 32) setFileAvailabilityHandler:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v9 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v9();
  }
}

- (void)fileAvailabilityChanged
{
  uint64_t v3 = [(WFRemoteExecutionFileCoder *)self fileURL];

  if (v3)
  {
    id v4 = [(WFRemoteExecutionFileCoder *)self fileAvailabilityHandler];

    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__WFRemoteExecutionFileCoder_fileAvailabilityChanged__block_invoke;
      block[3] = &unk_1E6558B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __53__WFRemoteExecutionFileCoder_fileAvailabilityChanged__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) transferIdentifiers];
    int v6 = 136315394;
    objc_super v7 = "-[WFRemoteExecutionFileCoder fileAvailabilityChanged]_block_invoke";
    __int16 v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_INFO, "%s Files became available with identifiers: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  id v4 = [*(id *)(a1 + 32) fileAvailabilityHandler];
  v4[2]();

  return [*(id *)(a1 + 32) setFileAvailabilityHandler:0];
}

- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5
{
  id v8 = a3;
  v9 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"transferIdentifier"];
  if (v9 && ([(NSMutableArray *)self->_transferIdentifiers containsObject:v9] & 1) != 0)
  {
    uint64_t v10 = [(WFRemoteExecutionFileCoder *)self fileURL];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFRemoteExecutionFileCoder;
    uint64_t v10 = [(WFFileCoder *)&v13 decodeFileWithCoder:v8 fileShouldBeDeletedOnDeallocation:a4 fileIsSecurityScoped:a5];
  }
  int v11 = (void *)v10;

  return v11;
}

- (void)cancelOutstandingTransfers
{
  id v2 = [(WFRemoteExecutionFileCoder *)self coordinator];
  [v2 cancelPendingFileTransfers];
}

- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5
{
  objc_super v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v7 UUID];
  id v14 = [v10 UUIDString];

  int v11 = [(WFRemoteExecutionFileCoder *)self coordinator];
  v12 = [(WFRemoteExecutionFileCoder *)self requestIdentifier];
  [v11 sendFileAtURL:v9 transferIdentifier:v14 requestIdentifier:v12 error:0];

  objc_super v13 = [(WFRemoteExecutionFileCoder *)self transferIdentifiers];
  [v13 addObject:v14];

  [v8 encodeObject:v14 forKey:@"transferIdentifier"];
}

- (int64_t)targetPlatform
{
  id v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  int64_t v3 = 2 * ([v2 platform] == 0);

  return v3;
}

- (WFRemoteExecutionFileCoder)initWithCoordinator:(id)a3 requestIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFRemoteExecutionFileCoder.m", 25, @"Invalid parameter not satisfying: %@", @"coordinator" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFRemoteExecutionFileCoder;
  id v9 = [(WFRemoteExecutionFileCoder *)&v15 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    transferIdentifiers = v9->_transferIdentifiers;
    v9->_transferIdentifiers = (NSMutableArray *)v10;

    objc_storeWeak((id *)&v9->_coordinator, v7);
    objc_storeStrong((id *)&v9->_requestIdentifier, a4);
    v12 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end