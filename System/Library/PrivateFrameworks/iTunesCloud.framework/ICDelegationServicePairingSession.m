@interface ICDelegationServicePairingSession
- (BOOL)_deriveEncryptionKeysReturningError:(id *)a3;
- (ICDelegationServicePairingSession)initWithRole:(int64_t)a3 securitySettings:(id)a4;
- (ICDelegationServicePairingSessionDelegate)delegate;
- (ICDelegationServiceSecuritySettings)securitySettings;
- (id)_encryptedDataForData:(id)a3;
- (int64_t)role;
- (void)_handlePairingSessionCompletionWithError:(id)a3;
- (void)_receivedData:(id)a3;
- (void)_sendData:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)getDecryptedDataForEncryptedData:(id)a3 withCompletionHandler:(id)a4;
- (void)getEncryptedDataForData:(id)a3 withCompletionHandler:(id)a4;
- (void)prepareEncryptedSessionWithCompletionHandler:(id)a3;
- (void)receievedData:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ICDelegationServicePairingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);
  objc_storeStrong((id *)&self->_inputKey, 0);
  objc_storeStrong((id *)&self->_existingPairingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

- (ICDelegationServiceSecuritySettings)securitySettings
{
  return self->_securitySettings;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setDelegate:(id)a3
{
}

- (ICDelegationServicePairingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDelegationServicePairingSessionDelegate *)WeakRetained;
}

- (void)_sendData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__ICDelegationServicePairingSession__sendData_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E5ACD2A0;
    id v13 = WeakRetained;
    v14 = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(calloutQueue, v12);
  }
  else if (v7)
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

uint64_t __69__ICDelegationServicePairingSession__sendData_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) delegationServicePairingSession:*(void *)(a1 + 40) sendData:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 56)];
}

- (void)_receivedData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_state == 1)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      __int16 v13 = 2048;
      uint64_t v14 = [v4 length];
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Passing data of length %li to pairing session", buf, 0x16u);
    }

    id v6 = v4;
    [v6 bytes];
    [v6 length];
    int v7 = PairingSessionExchange();
    if (v7)
    {
      int v8 = v7;
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v12 = self;
        __int16 v13 = 1024;
        LODWORD(v14) = v8;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Error returned from PairingSessionExchange: %i", buf, 0x12u);
      }

      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
      [(ICDelegationServicePairingSession *)self _handlePairingSessionCompletionWithError:v10];
    }
  }
}

- (BOOL)_deriveEncryptionKeysReturningError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_pairingSession)
  {
    __int16 v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    BOOL v14 = 0;
    if (!a3) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  id v30 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8];
  int64_t role = self->_role;
  if (role == 2)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"DelegationService-Write-Encryption-Key" length:38];
    v10 = (void *)MEMORY[0x1E4F1C9B8];
    v11 = "DelegationService-Read-Encryption-Key";
    uint64_t v12 = 37;
    goto LABEL_8;
  }
  if (role == 1)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"DelegationService-Read-Encryption-Key" length:37];
    v10 = (void *)MEMORY[0x1E4F1C9B8];
    v11 = "DelegationService-Write-Encryption-Key";
    uint64_t v12 = 38;
LABEL_8:
    id v31 = [v10 dataWithBytes:v11 length:v12];
    goto LABEL_10;
  }
  v9 = 0;
  id v31 = 0;
LABEL_10:
  id v15 = v9;
  [v15 bytes];
  [v15 length];
  [v5 length];
  id v16 = v5;
  [v16 mutableBytes];
  int v17 = PairingSessionDeriveKey();
  if (v17)
  {
    LODWORD(v19) = v17;
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    uint64_t v19 = (int)v19;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2048;
      uint64_t v35 = (int)v19;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to derive input key (OSStatus = %li)", buf, 0x16u);
    }
LABEL_22:

    __int16 v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v19 userInfo:0];
    BOOL v14 = 0;
    goto LABEL_23;
  }
  id v20 = v6;
  v21 = (void *)[v20 mutableBytes];
  rsize_t v22 = [v20 length];
  if (v21) {
    memset_s(v21, v22, 0, v22);
  }
  id v23 = v31;
  [v23 bytes];
  [v23 length];
  [v7 length];
  id v24 = v7;
  [v24 mutableBytes];
  int v25 = PairingSessionDeriveKey();
  if (v25)
  {
    LODWORD(v19) = v25;
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    uint64_t v19 = (int)v19;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2048;
      uint64_t v35 = (int)v19;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to derive output key (OSStatus = %li)", buf, 0x16u);
    }
    goto LABEL_22;
  }
  id v26 = v30;
  v27 = (void *)[v26 mutableBytes];
  rsize_t v28 = [v26 length];
  if (v27) {
    memset_s(v27, v28, 0, v28);
  }
  objc_storeStrong((id *)&self->_inputKey, v16);
  objc_storeStrong((id *)&self->_inputNonce, v20);
  objc_storeStrong((id *)&self->_outputKey, v24);
  objc_storeStrong((id *)&self->_outputNonce, v26);
  __int16 v13 = 0;
  BOOL v14 = 1;
LABEL_23:

  if (a3) {
LABEL_24:
  }
    *a3 = v13;
LABEL_25:

  return v14;
}

- (void)_handlePairingSessionCompletionWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing pairing session with error: %{public}@", buf, 0x16u);
  }

  if (v4)
  {
    id v6 = v4;
    int64_t v7 = 0;
  }
  else
  {
    id v19 = 0;
    BOOL v8 = [(ICDelegationServicePairingSession *)self _deriveEncryptionKeysReturningError:&v19];
    id v9 = v19;
    v10 = v9;
    if (v8)
    {
      id v6 = 0;
      int64_t v7 = 2;
    }
    else
    {
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      }
      id v6 = v11;
      int64_t v7 = 0;
    }
  }
  self->_state = v7;
  uint64_t v12 = (void *)[(NSMutableArray *)self->_existingPairingCompletionHandlers copy];
  existingPairingCompletionHandlers = self->_existingPairingCompletionHandlers;
  self->_existingPairingCompletionHandlers = 0;

  if ([v12 count])
  {
    calloutQueue = self->_calloutQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__ICDelegationServicePairingSession__handlePairingSessionCompletionWithError___block_invoke;
    v15[3] = &unk_1E5ACD5C8;
    id v16 = v12;
    id v17 = v4;
    id v18 = v6;
    dispatch_async(calloutQueue, v15);
  }
}

void __78__ICDelegationServicePairingSession__handlePairingSessionCompletionWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void, BOOL, void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6), *(void *)(a1 + 40) == 0, *(void *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_encryptedDataForData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v4, "length"));
  [(NSData *)self->_outputKey bytes];
  [(NSMutableData *)self->_outputNonce bytes];
  id v6 = v4;
  [v6 bytes];
  [v6 length];
  id v7 = v5;
  [v7 mutableBytes];
  chacha20_poly1305_encrypt_all_64x64();
  [v7 appendBytes:v14 length:16];
  long long v8 = [(NSMutableData *)self->_outputNonce mutableBytes];
  NSUInteger v9 = [(NSMutableData *)self->_outputNonce length];
  if (v9)
  {
    NSUInteger v10 = v9 - 1;
    do
    {
      if (++*v8++) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v10 == 0;
      }
      --v10;
    }
    while (!v12);
  }

  return v7;
}

- (void)getEncryptedDataForData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessSerialQueue, block);
}

void __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[9] == 2)
  {
    uint64_t v3 = [v2 _encryptedDataForData:*(void *)(a1 + 40)];
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v5 = *(id *)(a1 + 48);
    id v10 = v3;
    id v11 = v5;
    id v6 = v3;
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
  }
}

void __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(uint64_t))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7806 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v4);
  }
}

- (void)getDecryptedDataForEncryptedData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessSerialQueue, block);
}

void __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72) != 2)
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = -7101;
    goto LABEL_5;
  }
  if ((unint64_t)[*(id *)(a1 + 40) length] <= 0xF)
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = -7805;
LABEL_5:
    id v4 = [v2 errorWithDomain:@"ICError" code:v3 userInfo:0];
    id v5 = 0;
    goto LABEL_17;
  }
  id v6 = objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", objc_msgSend(*(id *)(a1 + 40), "length") - 16, 16);
  id v7 = objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", 0, objc_msgSend(*(id *)(a1 + 40), "length") - 16);
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v7, "length"));
  [*(id *)(*(void *)(a1 + 32) + 32) bytes];
  [*(id *)(*(void *)(a1 + 32) + 40) bytes];
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  id v5 = v8;
  [v5 mutableBytes];
  id v10 = v6;
  [v10 bytes];
  int v11 = chacha20_poly1305_decrypt_all_64x64();
  id v12 = (unsigned char *)[*(id *)(*(void *)(a1 + 32) + 40) mutableBytes];
  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 40) length];
  if (v13)
  {
    uint64_t v14 = v13 - 1;
    do
    {
      if (++*v12++) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v14 == 0;
      }
      --v14;
    }
    while (!v16);
  }
  if (v11)
  {

    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
    id v5 = 0;
  }
  else
  {
    id v4 = 0;
  }

LABEL_17:
  id v17 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5ACD250;
  id v18 = *(id *)(a1 + 48);
  id v23 = v4;
  id v24 = v18;
  id v22 = v5;
  id v19 = v4;
  id v20 = v5;
  dispatch_async(v17, block);
}

uint64_t __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)receievedData:(id)a3
{
  id v4 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ICDelegationServicePairingSession_receievedData___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessSerialQueue, v7);
}

uint64_t __51__ICDelegationServicePairingSession_receievedData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receivedData:*(void *)(a1 + 40)];
}

- (void)prepareEncryptedSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessSerialQueue, v7);
}

void __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = v3[9];
  if (v4 == 2)
  {
    if (!v2) {
      return;
    }
    id v5 = v3[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD170;
    id v23 = v2;
    dispatch_async(v5, block);
    id v6 = v23;
    goto LABEL_34;
  }
  if (v2)
  {
    id v7 = (void *)v3[3];
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v8;

      id v2 = *(void **)(a1 + 40);
      id v7 = *(void **)(*(void *)(a1 + 32) + 24);
    }
    int v11 = (void *)MEMORY[0x1A6240BF0](v2);
    [v7 addObject:v11];

    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[9];
  }
  if (!v4)
  {
    v3[9] = 1;
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v13 + 96);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Opening with security settings: %@", buf, 0x16u);
    }

    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 96) securityMode];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(v16 + 88);
    if (v17 == 2)
    {
      if (v15 != 1)
      {
        if (v15 != 2)
        {
          if (v15 == 4)
          {
            id v6 = [*(id *)(v16 + 96) password];
            int v18 = 2;
            goto LABEL_28;
          }
          goto LABEL_21;
        }
        id v6 = 0;
        int v18 = 4;
        goto LABEL_28;
      }
      int v18 = 2;
    }
    else
    {
      if (v17 != 1)
      {
LABEL_21:
        id v6 = 0;
        int v18 = 0;
        goto LABEL_28;
      }
      if (v15 != 1)
      {
        if (v15 != 2)
        {
          if (v15 == 4)
          {
            id v6 = [*(id *)(v16 + 96) password];
            int v18 = 1;
            goto LABEL_28;
          }
          goto LABEL_21;
        }
        id v6 = 0;
        int v18 = 3;
LABEL_28:
        *(void *)buf = 0;
        int v19 = PairingSessionCreate();
        if (v19)
        {
          id v20 = *(void **)(a1 + 32);
          v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v19 userInfo:0];
          [v20 _handlePairingSessionCompletionWithError:v21];
        }
        else
        {
          *(void *)(*(void *)(a1 + 32) + 64) = *(void *)buf;
          PairingSessionSetFlags();
          if ([(__CFString *)v6 length])
          {
            [(__CFString *)v6 UTF8String];
            PairingSessionSetSetupCode();
          }
          if ((v18 | 2) == 3) {
            [*(id *)(a1 + 32) _receivedData:0];
          }
        }
LABEL_34:

        return;
      }
      int v18 = 1;
    }
    id v6 = @"<default>";
    goto LABEL_28;
  }
}

uint64_t __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  pairingSession = self->_pairingSession;
  if (pairingSession) {
    CFRelease(pairingSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICDelegationServicePairingSession;
  [(ICDelegationServicePairingSession *)&v4 dealloc];
}

- (ICDelegationServicePairingSession)initWithRole:(int64_t)a3 securitySettings:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICDelegationServicePairingSession;
  id v8 = [(ICDelegationServicePairingSession *)&v14 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServicePairingSession.accessSerialQueue", 0);
    accessSerialQueue = v8->_accessSerialQueue;
    v8->_accessSerialQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServicePairingSession.calloutQueue", 0);
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v11;

    v8->_int64_t role = a3;
    objc_storeStrong((id *)&v8->_securitySettings, a4);
  }

  return v8;
}

@end