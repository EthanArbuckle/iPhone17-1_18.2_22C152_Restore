@interface PKNFCTagReaderSession
- (PKNFCTagReaderSession)initWithInternalSession:(id)a3 targetQueue:(id)a4;
- (PKNFCTagReaderSessionDelegate)delegate;
- (void)endSession;
- (void)readNDEFMessageFromTag:(id)a3 completion:(id)a4;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startPolling;
- (void)stopPolling;
@end

@implementation PKNFCTagReaderSession

- (PKNFCTagReaderSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 nfSession];
  PKGetClassNFReaderSession();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    [v6 endSession];

    id v6 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)PKNFCTagReaderSession;
  v10 = [(PKPaymentSession *)&v14 initWithInternalSession:v6 targetQueue:v7];
  v11 = v10;
  if (v6 && v10)
  {
    v12 = [v6 nfSession];
    [v12 setDelegate:v11];
  }
  return v11;
}

- (void)startPolling
{
}

void __37__PKNFCTagReaderSession_startPolling__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [a2 nfSession];
  id v6 = 0;
  char v3 = [v2 startPollingWithError:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {
    v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Failed to start Tag Reader polling. Error: %@", buf, 0xCu);
    }
  }
}

- (void)stopPolling
{
}

void __36__PKNFCTagReaderSession_stopPolling__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [a2 nfSession];
  id v6 = 0;
  char v3 = [v2 stopPollingWithError:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {
    v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Failed to stop Tag Reader polling. Error: %@", buf, 0xCu);
    }
  }
}

- (void)endSession
{
}

void __35__PKNFCTagReaderSession_endSession__block_invoke()
{
  v0 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_190E10000, v0, OS_LOG_TYPE_ERROR, "Reader Session Invalidated", v1, 2u);
  }
}

- (void)readNDEFMessageFromTag:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = *((id *)a3 + 1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__PKNFCTagReaderSession_readNDEFMessageFromTag_completion___block_invoke;
    v10[3] = &unk_1E56DFF60;
    id v11 = v7;
    id v12 = v6;
    id v8 = v7;
    id v9 = a3;
    [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v10];
  }
}

void __59__PKNFCTagReaderSession_readNDEFMessageFromTag_completion___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 nfSession];
  uint64_t v4 = *(void *)(a1 + 32);
  id v17 = 0;
  int v5 = [v3 connectTag:v4 error:&v17];
  id v6 = v17;
  if (v5)
  {
    char v16 = 0;
    id v15 = 0;
    int v7 = [v3 checkNdefSupportsRead:&v16 andWrite:0 error:&v15];
    id v8 = v15;
    if (v7)
    {
      if (v16)
      {
        id v14 = 0;
        id v9 = [v3 ndefReadWithError:&v14];
        id v10 = v14;
        id v11 = [v9 decode];
      }
      else
      {
        id v11 = 0;
        id v10 = 0;
      }
      id v13 = 0;
      [v3 disconnectTagWithError:&v13];
      id v12 = v13;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke;
  v7[3] = &unk_1E56DB8C0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v7];
}

void __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke_2;
    v8[3] = &unk_1E56E37B0;
    id v9 = v4;
    id v6 = v4;
    [v5 enumerateObjectsUsingBlock:v8];
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v7 nfcTagReaderSession:*(void *)(a1 + 32) didDetectTags:v6];
  }
}

void __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [[PKNFCTag alloc] initWithNFTag:v3];

  [v2 addObject:v4];
}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKNFCTagReaderSession_readerSessionDidEndUnexpectedly_reason___block_invoke;
  v7[3] = &unk_1E56DB8C0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v7];
}

void __64__PKNFCTagReaderSession_readerSessionDidEndUnexpectedly_reason___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) domain];
  id v3 = [NSString stringWithUTF8String:"nfcd"];
  if ([v2 isEqualToString:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) code];

    if (v4 == 5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
        [v9 nfcTagReaderSessionDidTimeout:*(void *)(a1 + 40)];
        goto LABEL_8;
      }
    }
  }
  else
  {
  }
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    return;
  }
  id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  [v9 nfcTagReaderSessionDidEndUnexpectedly:*(void *)(a1 + 40)];
LABEL_8:
}

- (PKNFCTagReaderSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKNFCTagReaderSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end