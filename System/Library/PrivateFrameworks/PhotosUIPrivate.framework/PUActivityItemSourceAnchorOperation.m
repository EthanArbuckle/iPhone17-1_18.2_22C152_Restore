@interface PUActivityItemSourceAnchorOperation
- (void)px_start;
- (void)signalAnchor;
@end

@implementation PUActivityItemSourceAnchorOperation

- (void)signalAnchor
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet: Anchor operation (%@) signalled", (uint8_t *)&v4, 0xCu);
  }

  if ([(PXAsyncOperation *)self isExecuting]) {
    [(PXAsyncOperation *)self px_finishIfPossible];
  }
  else {
    [(PXAsyncOperation *)self cancel];
  }
}

- (void)px_start
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet: Anchor operation (%@) encountered during preparation", (uint8_t *)&v5, 0xCu);
  }

  if ([(PUActivityItemSourceAnchorOperation *)self isCancelled])
  {
    int v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = self;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Share Sheet: Anchor operation (%@) finishing immediately", (uint8_t *)&v5, 0xCu);
    }

    [(PXAsyncOperation *)self px_finishIfPossible];
  }
}

@end