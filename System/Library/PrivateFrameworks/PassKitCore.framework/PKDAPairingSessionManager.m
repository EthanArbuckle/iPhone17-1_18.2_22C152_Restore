@interface PKDAPairingSessionManager
- (BOOL)isProbingTerminalPairingStatus;
- (NSMutableArray)probingCompletionBlocks;
- (PKDAPairingSessionManager)initWithQueue:(id)a3 sessionCreationBlock:(id)a4;
- (id)prewarmCompletion;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5;
- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3;
- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4;
- (void)setPrewarmCompletion:(id)a3;
- (void)setProbingTerminalPairingStatus:(BOOL)a3;
@end

@implementation PKDAPairingSessionManager

- (PKDAPairingSessionManager)initWithQueue:(id)a3 sessionCreationBlock:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKDAPairingSessionManager;
  v4 = [(PKDASessionManager *)&v8 initWithQueue:a3 sessionCreationBlock:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    probingCompletionBlocks = v4->_probingCompletionBlocks;
    v4->_probingCompletionBlocks = v5;
  }
  return v4;
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unspported object", v4, 2u);
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unsupported object: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unsupported object: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Pairing session API called on unsupported object: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  id v5 = a4;
  v6 = [(PKDASessionManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke;
  v8[3] = &unk_1E56D8A90;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __90__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Finished prewarming with result: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 64);
  if (v4)
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = 0;
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [(PKDASessionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishProbingTerminalWithError_brandCode___block_invoke;
  block[3] = &unk_1E56DF798;
  id v11 = v7;
  v12 = self;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __107__PKDAPairingSessionManager_appletSubcredentialPairingSession_didFinishProbingTerminalWithError_brandCode___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    BOOL v16 = v2 == 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Finished probing terminal, pairing mode: %ld", buf, 0xCu);
  }

  uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 40) + 56) copy];
  [*(id *)(*(void *)(a1 + 40) + 56) removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 48) = 0;
}

- (BOOL)isProbingTerminalPairingStatus
{
  return self->_probingTerminalPairingStatus;
}

- (void)setProbingTerminalPairingStatus:(BOOL)a3
{
  self->_probingTerminalPairingStatus = a3;
}

- (NSMutableArray)probingCompletionBlocks
{
  return self->_probingCompletionBlocks;
}

- (id)prewarmCompletion
{
  return self->_prewarmCompletion;
}

- (void)setPrewarmCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prewarmCompletion, 0);
  objc_storeStrong((id *)&self->_probingCompletionBlocks, 0);
}

@end