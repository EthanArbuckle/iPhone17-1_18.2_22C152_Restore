@interface MRCoreUtilsPairingSession
- (BOOL)deleteIdentityWithError:(id *)a3;
- (BOOL)hasExchangedMessage;
- (BOOL)isPaired;
- (BOOL)isValid;
- (BOOL)shouldAutoRetryPairingExchange:(id)a3;
- (MRCoreUtilsPairingSession)initWithRole:(unint64_t)a3 device:(id)a4;
- (MRDeviceInfo)_createDeviceFromPeer:(uint64_t)a1;
- (MRDeviceInfo)_createPeerDeviceFromPeer:(uint64_t)a1;
- (MRDeviceInfo)pairedPeerDevice;
- (NSArray)pairedPeerDevices;
- (NSData)inputKey;
- (NSData)outputKey;
- (NSMutableData)inputNonce;
- (NSMutableData)outputNonce;
- (NSMutableDictionary)mediaRemotePairedDevices;
- (NSString)peerIdentifier;
- (id)_generateSetupCodeWithMaximumLength:(uint64_t)a1;
- (id)_onQueueInitializePairingSessionWithState:(uint64_t)a1;
- (id)_onQueuePerformPairingExchangeWithInputData:(void *)a3 error:;
- (id)addPeer;
- (id)decryptData:(id)a3 withError:(id *)a4;
- (id)encryptData:(id)a3 withError:(id *)a4;
- (id)extendedPeerInfo;
- (id)initializePairingSession:(PairingSessionPrivate *)a3;
- (id)pairedDevices;
- (id)removePeer;
- (id)updatePeer;
- (uint64_t)_displaySetupCode:(uint64_t)a1;
- (uint64_t)_promptForSetupCodeWithDelay:(uint64_t)result;
- (uint64_t)shouldAutoRetry;
- (unint64_t)state;
- (unsigned)pairingFlags;
- (void)_delegateDidEnterPasscode:(void *)a1;
- (void)_handlePairingCompleteWithError:(void *)a1;
- (void)_handleSetupExchangeComplete;
- (void)_hideSetupCode;
- (void)_onQueueDeriveEncryptionKeys;
- (void)close;
- (void)dealloc;
- (void)handlePairingExchangeData:(id)a3 completion:(id)a4;
- (void)handlePairingFailureWithStatus:(int)a3;
- (void)open;
- (void)openInState:(unint64_t)a3;
- (void)setInputKey:(id)a3;
- (void)setInputNonce:(id)a3;
- (void)setOutputKey:(id)a3;
- (void)setOutputNonce:(id)a3;
- (void)setPairingFlags:(unsigned int)a3;
@end

@implementation MRCoreUtilsPairingSession

- (void)_onQueueDeriveEncryptionKeys
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8];
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8];
    uint64_t v5 = [a1 role];
    id v39 = (id)v4;
    if (v5 == 1)
    {
      v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"MediaRemote-Write-Encryption-Key" length:32];
      v7 = (void *)MEMORY[0x1E4F1C9B8];
      v8 = "MediaRemote-Read-Encryption-Key";
      uint64_t v9 = 31;
    }
    else
    {
      if (v5)
      {
        id v40 = 0;
        v6 = 0;
LABEL_8:
        v10 = (uint64_t (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
        uint64_t v11 = a1[5];
        id v12 = v6;
        uint64_t v13 = [v12 bytes];
        uint64_t v14 = [v12 length];
        uint64_t v15 = [v2 length];
        id v16 = v2;
        int v17 = v10(v11, "MediaRemote-Salt", 16, v13, v14, v15, [v16 mutableBytes]);
        if (v17)
        {
          int v18 = v17;
          v19 = _MRLogForCategory(0);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v43 = v18;
            _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to derive input key (OSStatus = %d)", buf, 8u);
          }
          v20 = v39;
        }
        else
        {
          v38 = v3;
          id v21 = v3;
          v22 = (unsigned char *)[v21 mutableBytes];
          for (uint64_t i = [v21 length]; i; --i)
            *v22++ = 0;
          v24 = (uint64_t (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
          uint64_t v25 = a1[5];
          id v26 = v40;
          uint64_t v27 = [v26 bytes];
          uint64_t v28 = [v26 length];
          uint64_t v29 = [v41 length];
          id v30 = v41;
          int v31 = v24(v25, "MediaRemote-Salt", 16, v27, v28, v29, [v30 mutableBytes]);
          if (!v31)
          {
            v20 = v39;
            id v34 = v39;
            v35 = (unsigned char *)[v34 mutableBytes];
            for (uint64_t j = [v34 length]; j; --j)
              *v35++ = 0;
            v37 = _MRLogForCategory(0);
            v3 = v38;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_194F3C000, v37, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Successfully derived encryption keys.", buf, 2u);
            }

            [a1 setInputKey:v16];
            [a1 setInputNonce:v21];
            [a1 setOutputKey:v30];
            [a1 setOutputNonce:v34];
            a1[17] = 5;
            -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](a1, 0);
            goto LABEL_19;
          }
          int v18 = v31;
          v19 = _MRLogForCategory(0);
          v20 = v39;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v43 = v18;
            _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to derive output key (OSStatus = %d)", buf, 8u);
          }
          v3 = v38;
        }

        a1[17] = 0;
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        v33 = (void *)[v32 initWithDomain:*MEMORY[0x1E4F28760] code:v18 userInfo:0];
        -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](a1, v33);

LABEL_19:
        return;
      }
      v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"MediaRemote-Read-Encryption-Key" length:31];
      v7 = (void *)MEMORY[0x1E4F1C9B8];
      v8 = "MediaRemote-Write-Encryption-Key";
      uint64_t v9 = 32;
    }
    id v40 = [v7 dataWithBytes:v8 length:v9];
    goto LABEL_8;
  }
}

- (MRCoreUtilsPairingSession)initWithRole:(unint64_t)a3 device:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MRCoreUtilsPairingSession;
  uint64_t v4 = [(MRCryptoPairingSession *)&v14 initWithRole:a3 device:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_state = 1;
    uint64_t v6 = +[MRPasscodeCredentials standardCredentials];
    credentials = v5->_credentials;
    v5->_credentials = (MRPasscodeCredentials *)v6;

    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(Name, v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    *(_OWORD *)&v5->_pairingDelegate.context = 0u;
    *(_OWORD *)&v5->_pairingDelegate.hideSetupCode_f = 0u;
    *(_OWORD *)&v5->_pairingDelegate.copyIdentity_f = 0u;
    *(_OWORD *)&v5->_pairingDelegate.savePeer_f = 0u;
    v5->_pairingDelegate.resumeResponse_f = 0;
    v5->_pairingDelegate.context = v5;
    v5->_pairingDelegate.showSetupCode_f = _MRCUPSShowSetupCodeCallback;
    v5->_pairingDelegate.hideSetupCode_f = _MRCUPSHideSetupCodeCallback;
    v5->_pairingDelegate.promptForSetupCode_f = _MRCUPSPromptForSetupCodeCallback;
    v5->_pairingFlags = 0;
  }
  return v5;
}

- (void)dealloc
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  self->_pairingDelegate.context = 0;
  v4.receiver = self;
  v4.super_class = (Class)MRCoreUtilsPairingSession;
  [(MRCoreUtilsPairingSession *)&v4 dealloc];
}

- (BOOL)isValid
{
  return self->_state == 5;
}

- (BOOL)isPaired
{
  v2 = [(MRCoreUtilsPairingSession *)self pairedPeerDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)pairedDevices
{
  v2 = [(MRCoreUtilsPairingSession *)self mediaRemotePairedDevices];
  BOOL v3 = [v2 allValues];

  return v3;
}

- (void)open
{
}

- (void)close
{
  if (self->_state <= 3)
  {
    Error = (void *)MRMediaRemoteCreateError(25);
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](self, Error);
  }
  self->_state = 1;
  [(MRCoreUtilsPairingSession *)self setInputKey:0];
  [(MRCoreUtilsPairingSession *)self setInputNonce:0];
  [(MRCoreUtilsPairingSession *)self setOutputKey:0];

  [(MRCoreUtilsPairingSession *)self setOutputNonce:0];
}

- (void)handlePairingExchangeData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRCoreUtilsPairingSession_handlePairingExchangeData_completion___block_invoke;
  block[3] = &unk_1E57D3F90;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __66__MRCoreUtilsPairingSession_handlePairingExchangeData_completion___block_invoke(uint64_t *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  BOOL v3 = (void *)a1[5];
  id v17 = 0;
  objc_super v4 = -[MRCoreUtilsPairingSession _onQueuePerformPairingExchangeWithInputData:error:](v2, v3, &v17);
  id v5 = v17;
  id v6 = [v5 domain];
  if ([v6 isEqualToString:*MEMORY[0x1E4F28760]])
  {
    uint64_t v7 = [v5 code];

    if (v7 != -6727) {
      goto LABEL_7;
    }
    id v8 = (id)[(id)a1[4] removePeer];
    if (![(id)a1[4] shouldAutoRetryPairingExchange:v5]) {
      goto LABEL_7;
    }
    *(unsigned char *)(a1[4] + 128) = 0;
    *(void *)(a1[4] + 136) = 2;
    id v9 = -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](a1[4], 2);

    if (v9) {
      goto LABEL_9;
    }
    uint64_t v10 = a1[4];
    dispatch_queue_t v11 = (void *)a1[5];
    id v16 = 0;
    uint64_t v12 = -[MRCoreUtilsPairingSession _onQueuePerformPairingExchangeWithInputData:error:](v10, v11, &v16);
    id v5 = v16;
    id v6 = v4;
    objc_super v4 = (void *)v12;
  }

LABEL_7:
  if (!v5)
  {
    if (v4)
    {
      uint64_t v15 = [(id)a1[4] delegate];
      [v15 pairingSession:a1[4] didPrepareExchangeData:v4];

      id v9 = 0;
      *(unsigned char *)(a1[4] + 128) = 1;
    }
    else
    {
      id v9 = 0;
    }
    goto LABEL_16;
  }
  id v9 = v5;
LABEL_9:
  id v13 = _MRLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to handle pairing exchange. %{public}@", buf, 0xCu);
  }

  objc_super v14 = (void *)a1[4];
  if (v14) {
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](v14, v9);
  }
LABEL_16:
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)_onQueuePerformPairingExchangeWithInputData:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    char v19 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    if (*(void *)(a1 + 40))
    {
      id v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, char *))MSVWeakLinkSymbol();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = v5;
      int v9 = v6(v7, [v8 bytes], objc_msgSend(v8, "length"), &v18, &v17, &v19);
      if (v9 == -6771 || v9 == 0)
      {
        if (v17)
        {
          dispatch_queue_t v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:", v18);
        }
        else
        {
          dispatch_queue_t v11 = 0;
        }
        if (v19) {
          -[MRCoreUtilsPairingSession _handleSetupExchangeComplete](a1);
        }
        uint64_t v15 = 0;
        if (!a3) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      int v12 = v9;
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = [v13 initWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
    }
    else
    {
      uint64_t v14 = MRCreateCryptoError(@"No pairing session");
    }
    uint64_t v15 = (void *)v14;
    dispatch_queue_t v11 = 0;
    if (!a3)
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    *a3 = v15;
    goto LABEL_13;
  }
  dispatch_queue_t v11 = 0;
LABEL_14:

  return v11;
}

- (id)_onQueueInitializePairingSessionWithState:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = [(id)a1 role];
    if (a2 == 4)
    {
      unsigned int v7 = 5;
      if (v4 == 1) {
        unsigned int v10 = 6;
      }
      else {
        unsigned int v10 = 0;
      }
      BOOL v11 = v4 == 0;
      if (v4) {
        BOOL v12 = v4 == 1;
      }
      else {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v5 = v4 == 1;
      if (v4 == 1) {
        int v6 = 4;
      }
      else {
        int v6 = 0;
      }
      if (v4)
      {
        unsigned int v7 = v6;
      }
      else
      {
        BOOL v5 = 0;
        unsigned int v7 = 3;
      }
      int v8 = 1;
      if (v4 == 1) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
      if (v4)
      {
        unsigned int v10 = v9;
      }
      else
      {
        int v8 = 1;
        unsigned int v10 = 1;
      }
      if (a2 != 2)
      {
        int v8 = 0;
        unsigned int v10 = 0;
      }
      BOOL v11 = a2 == 3;
      if (a2 == 3) {
        BOOL v12 = v5;
      }
      else {
        BOOL v12 = v8;
      }
    }
    if (v11) {
      uint64_t v13 = v7;
    }
    else {
      uint64_t v13 = v10;
    }
    uint64_t v14 = *(const void **)(a1 + 40);
    if (v14)
    {
      CFRelease(v14);
      *(void *)(a1 + 40) = 0;
    }
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
    int v16 = v15(a1 + 40, a1 + 48, v13);
    if (v16)
    {
      int v17 = v16;
      uint64_t v18 = _MRLogForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 67109120;
        LODWORD(v29) = v17;
        _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error initializing pairing session (OSStatus = %d)", (uint8_t *)&v28, 8u);
      }

      char v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v17 userInfo:0];
    }
    else
    {
      char v19 = [(id)a1 initializePairingSession:*(void *)(a1 + 40)];
      if (v12)
      {
        uint64_t v20 = _MRLogForCategory(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = *(_DWORD *)(a1 + 132);
          int v28 = 67109120;
          LODWORD(v29) = v21;
          _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Pairing flags are: %u", (uint8_t *)&v28, 8u);
        }

        v22 = [(id)a1 device];
        if (MRPairedDeviceSupportsACL())
        {
          int v23 = *(_DWORD *)(a1 + 132);

          if ((v23 & 4) != 0)
          {
            v24 = _MRLogForCategory(0);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = [(id)a1 device];
              int v28 = 138543362;
              uint64_t v29 = v25;
              _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Enabling ACL for device: %{public}@", (uint8_t *)&v28, 0xCu);
            }
            id v26 = (void (*)(void, void *))MSVWeakLinkSymbol();
            v26(*(void *)(a1 + 40), &unk_1EE66F468);
          }
        }
        else
        {
        }
      }
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (void)handlePairingFailureWithStatus:(int)a3
{
  if (-[MRCoreUtilsPairingSession shouldAutoRetry](self))
  {
    if (self)
    {
      id v5 = [(MRCoreUtilsPairingSession *)self removePeer];
      [(MRCoreUtilsPairingSession *)self openInState:2];
    }
  }
  else
  {
    self->_state = 1;
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:0];
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](self, v6);
  }
}

- (uint64_t)shouldAutoRetry
{
  if (!a1 || a1[17] != 3) {
    return 0;
  }
  v1 = [a1 device];
  uint64_t v2 = [v1 supportsSystemPairing] ^ 1;

  return v2;
}

- (id)encryptData:(id)a3 withError:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__18;
  uint64_t v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__18;
  int v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__MRCoreUtilsPairingSession_encryptData_withError___block_invoke;
  v13[3] = &unk_1E57D4A20;
  v13[4] = self;
  uint64_t v15 = &v23;
  id v8 = v6;
  id v14 = v8;
  int v16 = &v17;
  dispatch_sync(queue, v13);
  if (v18[5])
  {
    int v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v18[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v10;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error while encrypting data: %{public}@", buf, 0xCu);
    }

    if (a4) {
      *a4 = (id) v18[5];
    }
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

uint64_t __51__MRCoreUtilsPairingSession_encryptData_withError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 136) == 5)
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(*(id *)(a1 + 40), "length"));
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = (void (*)(uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, unsigned char *))MSVWeakLinkSymbol();
    v5([*(id *)(*(void *)(a1 + 32) + 160) bytes], objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "bytes"), 0, 0, objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), objc_msgSend(objc_retainAutorelease(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)), "mutableBytes"), v11);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendBytes:v11 length:16];
    id v6 = (unsigned char *)[*(id *)(*(void *)(a1 + 32) + 168) mutableBytes];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 168) length];
    if (result)
    {
      uint64_t v8 = result - 1;
      do
      {
        if (++*v6++) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v8 == 0;
        }
        --v8;
      }
      while (!v10);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = MRCreateCryptoError(@"Session not open");
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)decryptData:(id)a3 withError:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__18;
  id v28 = __Block_byref_object_dispose__18;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__18;
  id v22 = __Block_byref_object_dispose__18;
  id v23 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__MRCoreUtilsPairingSession_decryptData_withError___block_invoke;
  v13[3] = &unk_1E57D4A20;
  id v8 = v6;
  id v14 = v8;
  uint64_t v15 = self;
  int v16 = &v18;
  uint64_t v17 = &v24;
  dispatch_sync(queue, v13);
  if (v19[5])
  {
    int v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v19[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v10;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error while decrypting data: %{public}@", buf, 0xCu);
    }

    if (a4) {
      *a4 = (id) v19[5];
    }
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __51__MRCoreUtilsPairingSession_decryptData_withError___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) length] <= 0xF)
  {
    uint64_t v2 = @"Encrypted data has an invalid length";
LABEL_15:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = MRCreateCryptoError(v2);
    goto LABEL_16;
  }
  if (*(void *)(*(void *)(a1 + 40) + 136) != 5)
  {
    uint64_t v2 = @"Session not open";
    goto LABEL_15;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", objc_msgSend(*(id *)(a1 + 32), "length") - 16, 16);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, objc_msgSend(*(id *)(a1 + 32), "length") - 16);
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v4, "length"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  unsigned int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = (uint64_t (*)(uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 144) bytes];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 152) bytes];
  id v11 = v4;
  int v12 = v8(v9, v10, 0, 0, [v11 bytes], objc_msgSend(v11, "length"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "mutableBytes"), objc_msgSend(objc_retainAutorelease(v3), "bytes"));
  uint64_t v13 = (unsigned char *)[*(id *)(*(void *)(a1 + 40) + 152) mutableBytes];
  uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 152) length];
  if (v14)
  {
    uint64_t v15 = v14 - 1;
    do
    {
      if (++*v13++) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v15 == 0;
      }
      --v15;
    }
    while (!v17);
  }
  if (v12)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = [v18 initWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    int v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
LABEL_16:

  return MEMORY[0x1F41817F8]();
}

- (BOOL)deleteIdentityWithError:(id *)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  int v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MRCoreUtilsPairingSession_deleteIdentityWithError___block_invoke;
  v7[3] = &unk_1E57D07E0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  if (a3) {
    *a3 = (id) v9[5];
  }
  BOOL v5 = v9[5] == 0;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __53__MRCoreUtilsPairingSession_deleteIdentityWithError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 40))
  {
    uint64_t v3 = -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](v2, 1);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v15 = 138543362;
      uint64_t v16 = v7;
      uint64_t v8 = "[CryptoPairingSession(CoreUtils)] Error initializing pairing session during identity deletion. %{public}@";
LABEL_9:
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = (uint64_t (*)(void))MSVWeakLinkSymbol();
    int v10 = v9(*(void *)(*(void *)(a1 + 32) + 40));
    if (!v10) {
      return;
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v15 = 138543362;
      uint64_t v16 = v14;
      uint64_t v8 = "[CryptoPairingSession(CoreUtils)] Error deleting identity. %{public}@";
      goto LABEL_9;
    }
  }
}

- (void)openInState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_hasExchangedMessage = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__18;
  queue = self->_queue;
  id v13 = __Block_byref_object_dispose__18;
  id v14 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MRCoreUtilsPairingSession_openInState___block_invoke;
  block[3] = &unk_1E57D4A48;
  block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(queue, block);
  if (v10[5])
  {
    uint64_t v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v10[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v7;
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error initializing pairing session. %{public}@", buf, 0xCu);
    }

    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](self, (void *)v10[5]);
  }
  else
  {
    self->_state = a3;
    if (![(MRCryptoPairingSession *)self role]) {
      [(MRCoreUtilsPairingSession *)self handlePairingExchangeData:0 completion:&__block_literal_global_49];
    }
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __41__MRCoreUtilsPairingSession_openInState___block_invoke(uint64_t *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](a1[4], a1[6]);

  return MEMORY[0x1F41817F8]();
}

void __41__MRCoreUtilsPairingSession_openInState___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to begin pairing exchange. %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)shouldAutoRetryPairingExchange:(id)a3
{
  uint64_t v3 = [(MRCryptoPairingSession *)self device];
  char v4 = [v3 supportsSystemPairing] ^ 1;

  return v4;
}

- (id)initializePairingSession:(PairingSessionPrivate *)a3
{
  char v4 = (void (*)(PairingSessionPrivate *, __CFString *, uint64_t, __CFString *, __CFString *, uint64_t, __CFString *, __CFString *, _DWORD))MSVWeakLinkSymbol();
  v4(a3, @"com.apple.MediaRemote.pairing", 1212434788, @"Media Remote Pairing Identity", @"Media Remote Pairing Identity", 1212436594, @"Paired TV Remote Peer", @"Paired TV Remote Peer", 0);
  return 0;
}

- (id)addPeer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(MRCryptoPairingSession *)self device];
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Pairing device %@...", buf, 0xCu);
  }
  id v5 = [(MRCryptoPairingSession *)self device];

  if (!v5)
  {
    uint64_t v16 = @"Cannot add peer, No device available";
LABEL_16:
    MRCreateCryptoError(v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!self->_pairingSession)
  {
    uint64_t v16 = @"Cannot update peer, No pairing session available";
    goto LABEL_16;
  }
  uint64_t v20 = 0;
  int v19 = 0;
  uint64_t v6 = (uint64_t (*)(PairingSessionPrivate *, uint64_t *, int *))MSVWeakLinkSymbol();
  uint64_t v7 = v6(self->_pairingSession, &v20, &v19);
  if (!v7)
  {
    uint64_t v16 = @"Cannot add peer, No peer Identifier available";
    goto LABEL_16;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = -[MRCoreUtilsPairingSession extendedPeerInfo](self);
  int v10 = (uint64_t (*)(PairingSessionPrivate *, void *, uint64_t, void *))MSVWeakLinkSymbol();
  int v11 = v10(self->_pairingSession, v8, v20, v9);
  int v19 = v11;
  if (!v11) {
    goto LABEL_17;
  }
  if (v11 != -25299) {
    goto LABEL_12;
  }
  uint64_t v12 = _MRLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = v8;
    _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "Duplicate record found for identifier %s dumping pairing", buf, 0xCu);
  }

  id v13 = [(MRCoreUtilsPairingSession *)self removePeer];
  if (v13) {
    goto LABEL_18;
  }
  id v14 = (uint64_t (*)(PairingSessionPrivate *, void *, uint64_t, void *))MSVWeakLinkSymbol();
  int v19 = v14(self->_pairingSession, v8, v20, v9);
  if (v19)
  {
LABEL_12:
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v13 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F28760] code:v19 userInfo:0];
  }
  else
  {
LABEL_17:
    id v13 = 0;
  }
LABEL_18:
  free(v8);
  id v17 = v13;

LABEL_19:

  return v17;
}

- (id)extendedPeerInfo
{
  if (a1)
  {
    id v2 = [a1 device];

    if (v2)
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v3 = [a1 device];
      char v4 = [v3 name];

      if (v4) {
        [v2 setObject:v4 forKey:@"MediaRemote_PeerName"];
      }
      id v5 = [a1 device];
      uint64_t v6 = [v5 identifier];

      if (v6) {
        [v2 setObject:v6 forKey:@"MediaRemote_PeerIdentifier"];
      }
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)removePeer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(MRCryptoPairingSession *)self device];
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Unpairing device %@", (uint8_t *)&v17, 0xCu);
  }
  id v5 = [(MRCryptoPairingSession *)self device];

  if (!v5)
  {
    id v14 = @"Cannot remove peer, No device available";
LABEL_10:
    id v15 = MRCreateCryptoError(v14);
    goto LABEL_15;
  }
  if (!self->_pairingSession)
  {
    id v14 = @"Cannot update peer, No pairing session available";
    goto LABEL_10;
  }
  uint64_t v6 = [(MRCoreUtilsPairingSession *)self peerIdentifier];
  if (v6)
  {
    uint64_t v7 = (uint64_t (*)(PairingSessionPrivate *, uint64_t, uint64_t))MSVWeakLinkSymbol();
    pairingSession = self->_pairingSession;
    id v9 = v6;
    int v10 = v7(pairingSession, [v9 UTF8String], objc_msgSend(v9, "length"));
    if (!v10)
    {
      id v15 = 0;
      goto LABEL_14;
    }
    int v11 = v10;
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = [v12 initWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
  }
  else
  {
    uint64_t v13 = MRCreateCryptoError(@"Could not find peer");
  }
  id v15 = (void *)v13;
LABEL_14:

LABEL_15:

  return v15;
}

- (id)updatePeer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(MRCryptoPairingSession *)self device];
    int v18 = 138412290;
    uint64_t v19 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Updating Peer %@", (uint8_t *)&v18, 0xCu);
  }
  id v5 = [(MRCryptoPairingSession *)self device];

  if (!v5)
  {
    uint64_t v16 = @"Cannot update peer, No device available";
LABEL_12:
    id v15 = MRCreateCryptoError(v16);
    goto LABEL_17;
  }
  if (!self->_pairingSession)
  {
    uint64_t v16 = @"Cannot update peer, No pairing session available";
    goto LABEL_12;
  }
  uint64_t v6 = [(MRCoreUtilsPairingSession *)self peerIdentifier];
  if (v6)
  {
    uint64_t v7 = -[MRCoreUtilsPairingSession extendedPeerInfo](self);
    uint64_t v8 = (uint64_t (*)(PairingSessionPrivate *, uint64_t, uint64_t, void *))MSVWeakLinkSymbol();
    pairingSession = self->_pairingSession;
    id v10 = v6;
    int v11 = v8(pairingSession, [v10 UTF8String], objc_msgSend(v10, "length"), v7);
    if (v11)
    {
      int v12 = v11;
      uint64_t v13 = _MRLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109120;
        LODWORD(v19) = v12;
        _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error updating peer (OSStatus = %d)", (uint8_t *)&v18, 8u);
      }

      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v15 = (void *)[v14 initWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = MRCreateCryptoError(@"Could not find peer");
  }

LABEL_17:

  return v15;
}

- (NSString)peerIdentifier
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__18;
  int v18 = __Block_byref_object_dispose__18;
  id v19 = 0;
  uint64_t v3 = [(MRCryptoPairingSession *)self device];

  if (v3)
  {
    if (self->_pairingSession)
    {
      uint64_t v13 = 0;
      int v12 = 0;
      char v4 = (uint64_t (*)(PairingSessionPrivate *, uint64_t *, int *))MSVWeakLinkSymbol();
      id v5 = (void *)v4(self->_pairingSession, &v13, &v12);
      if (v5)
      {
        uint64_t v6 = [NSString stringWithUTF8String:v5];
        uint64_t v7 = (void *)v15[5];
        v15[5] = v6;

        free(v5);
      }
    }
    if (!v15[5])
    {
      uint64_t v8 = [(MRCoreUtilsPairingSession *)self mediaRemotePairedDevices];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__MRCoreUtilsPairingSession_peerIdentifier__block_invoke;
      v11[3] = &unk_1E57D4A70;
      v11[4] = self;
      v11[5] = &v14;
      [v8 enumerateKeysAndObjectsUsingBlock:v11];
    }
  }
  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSString *)v9;
}

void __43__MRCoreUtilsPairingSession_peerIdentifier__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = [v8 device];
  int v11 = [v10 identifier];
  int v12 = [v9 identifier];

  LODWORD(v9) = [v11 isEqualToString:v12];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)setPairingFlags:(unsigned int)a3
{
  self->_uint64_t pairingFlags = a3;
  char v4 = (void (*)(PairingSessionPrivate *, uint64_t))MSVWeakLinkSymbol();
  pairingSession = self->_pairingSession;
  uint64_t pairingFlags = self->_pairingFlags;

  v4(pairingSession, pairingFlags);
}

- (MRDeviceInfo)pairedPeerDevice
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_pairingSession)
  {
    id v2 = self;
    int v24 = 0;
    uint64_t v3 = (uint64_t (*)(PairingSessionPrivate *, int *))MSVWeakLinkSymbol();
    char v4 = (void *)v3(v2->_pairingSession, &v24);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v19 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v9 = [NSString stringWithCString:"info" encoding:4];
          id v10 = [v8 objectForKey:v9];

          int v11 = [v10 objectForKey:@"MediaRemote_PeerIdentifier"];
          uint64_t v12 = (uint64_t)v2;
          id v13 = [(MRCryptoPairingSession *)v2 device];
          uint64_t v14 = [v13 identifier];
          int v15 = [v14 isEqualToString:v11];

          if (v15)
          {
            uint64_t v16 = -[MRCoreUtilsPairingSession _createPeerDeviceFromPeer:](v12, v8);

            goto LABEL_12;
          }

          id v2 = (MRCoreUtilsPairingSession *)v12;
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v16 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v16 = 0;
  }

  return (MRDeviceInfo *)v16;
}

- (MRDeviceInfo)_createPeerDeviceFromPeer:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    uint64_t v5 = objc_alloc_init(MRDeviceInfo);
    uint64_t v6 = [v4 objectForKey:@"identifier"];
    [(MRDeviceInfo *)v5 setIdentifier:v6];
  }

  return v5;
}

- (NSArray)pairedPeerDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_pairingSession)
  {
    int v17 = 0;
    char v4 = (uint64_t (*)(PairingSessionPrivate *, int *))MSVWeakLinkSymbol();
    uint64_t v5 = (void *)v4(self->_pairingSession, &v17);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = -[MRCoreUtilsPairingSession _createPeerDeviceFromPeer:]((uint64_t)self, *(void **)(*((void *)&v13 + 1) + 8 * i));
          objc_msgSend(v3, "addObject:", v11, (void)v13);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }

  return (NSArray *)v3;
}

- (NSMutableDictionary)mediaRemotePairedDevices
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = 40;
  if (self->_pairingSession)
  {
    int v27 = 0;
    char v4 = (uint64_t (*)(PairingSessionPrivate *, int *))MSVWeakLinkSymbol();
    uint64_t v5 = (void *)v4(self->_pairingSession, &v27);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (!v6) {
      goto LABEL_20;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        int v11 = -[MRCoreUtilsPairingSession _createDeviceFromPeer:]((uint64_t)self, v10);
        if (v11)
        {
          uint64_t v12 = v11;
          long long v13 = [v10 objectForKey:@"identifier"];
          [v22 setObject:v12 forKey:v13];
LABEL_15:

          goto LABEL_16;
        }
        long long v14 = _MRLogForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Found empty extended info entry, removing it", buf, 2u);
        }

        long long v15 = [v10 objectForKey:@"identifier"];
        long long v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
        uint64_t v17 = v3;
        uint64_t v18 = *(uint64_t *)((char *)&self->super.super.isa + v3);
        uint64_t v12 = v15;
        int v27 = v16(v18, [(MRDeviceInfo *)v12 UTF8String], [(MRDeviceInfo *)v12 length]);
        if (v27)
        {
          long long v13 = _MRLogForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v29 = v27;
            _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Could not delete empty entry with status %lu", buf, 0xCu);
          }
          uint64_t v3 = v17;
          goto LABEL_15;
        }
        uint64_t v3 = v17;
LABEL_16:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v19 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
      uint64_t v7 = v19;
      if (!v19)
      {
LABEL_20:

        break;
      }
    }
  }

  return (NSMutableDictionary *)v22;
}

- (MRDeviceInfo)_createDeviceFromPeer:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    uint64_t v6 = [v3 objectForKey:@"info"];
    uint64_t v7 = [v6 objectForKey:@"MediaRemote_PeerIdentifier"];
    uint64_t v8 = [v6 objectForKey:@"MediaRemote_PeerName"];
    uint64_t v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = objc_alloc_init(MRDeviceInfo);
      [(MRDeviceInfo *)v5 setIdentifier:v7];
      [(MRDeviceInfo *)v5 setName:v9];
    }
  }
  return v5;
}

- (id)_generateSetupCodeWithMaximumLength:(uint64_t)a1
{
  if (a1)
  {
    char v4 = [*(id *)(a1 + 32) passcode];
    uint64_t v5 = [*(id *)(a1 + 32) passcode];
    if ([v5 length] >= a2)
    {
      uint64_t v7 = [v4 substringToIndex:a2];
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) passcode];
      uint64_t v7 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v6, "length"));
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)_displaySetupCode:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = [(id)a1 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [(id)a1 delegate];
      [v6 pairingSession:a1 showSetupCode:v3];

      a1 = 0;
    }
    else
    {
      a1 = 4294960582;
    }
  }

  return a1;
}

- (void)_hideSetupCode
{
  if (a1)
  {
    id v2 = [a1 delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [a1 delegate];
      [v4 pairingSessionHideSetupCode:a1];
    }
  }
}

- (uint64_t)_promptForSetupCodeWithDelay:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    char v3 = (void *)result;
    id v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = a2;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Requesting delegate to prompt for setup code with delay = %f", buf, 0xCu);
    }

    char v5 = [v3 delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_initWeak((id *)buf, v3);
      uint64_t v8 = [v3 delegate];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__MRCoreUtilsPairingSession__promptForSetupCodeWithDelay___block_invoke;
      v10[3] = &unk_1E57D4A98;
      double v12 = a2;
      id v9 = v3;
      id v11 = v9;
      [v8 pairingSession:v9 promptForSetupCodeWithDelay:v10 completion:a2];

      objc_destroyWeak((id *)buf);
      return 0;
    }
    else
    {
      return 4294960582;
    }
  }
  return result;
}

void __58__MRCoreUtilsPairingSession__promptForSetupCodeWithDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(double *)(a1 + 40) <= 0.0)
  {
    if (v3)
    {
LABEL_8:
      -[MRCoreUtilsPairingSession _delegateDidEnterPasscode:](*(void **)(a1 + 32), v8);
      char v6 = 0;
      goto LABEL_9;
    }
    id v4 = @"Pairing Session NULL setup code";
  }
  else
  {
    id v4 = @"Pairing Session Delay";
  }
  uint64_t v5 = MRCreateCryptoError(v4);
  if (!v5) {
    goto LABEL_8;
  }
  char v6 = (void *)v5;
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](v7, v6);
  }
LABEL_9:
}

- (void)_delegateDidEnterPasscode:(void *)a1
{
  id v7 = a2;
  if (!a1) {
    goto LABEL_9;
  }
  if (!a1[5])
  {
    char v6 = MRCreateCryptoError(@"Pairing Session is not available");
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v3 = (uint64_t (*)(void, uint64_t, uint64_t))MSVWeakLinkSymbol();
  uint64_t v4 = v3(a1[5], [v7 UTF8String], -1);
  if (!v4)
  {
    [a1 handlePairingExchangeData:0 completion:&__block_literal_global_90];
    goto LABEL_9;
  }
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to set setup code on pairing session (OSStatus = %d)", v4);
  char v6 = MRCreateCryptoError(v5);

  if (v6)
  {
LABEL_7:
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](a1, v6);
  }
LABEL_9:
}

- (void)_handlePairingCompleteWithError:(void *)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = [a1 delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      uint64_t v5 = [a1 delegate];
      [v5 pairingSession:a1 didCompleteExchangeWithError:v6];
    }
  }
}

- (void)_handleSetupExchangeComplete
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 120);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MRCoreUtilsPairingSession__handleSetupExchangeComplete__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __55__MRCoreUtilsPairingSession__delegateDidEnterPasscode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to resume pairing process after setting setup code. %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __57__MRCoreUtilsPairingSession__handleSetupExchangeComplete__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v2 != 3)
  {
    if (v2 != 2) {
      return;
    }
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Exchange complete. Proceeding to verify step.", buf, 2u);
    }

    int v4 = [*(id *)(a1 + 32) addPeer];
    if (v4)
    {
      id v5 = _MRLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to record successfully paired peer", buf, 2u);
      }
    }
    *(void *)(*(void *)(a1 + 32) + 136) = 3;
    uint64_t v6 = -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](*(void *)(a1 + 32), 3);

    if (v6)
    {
      id v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v6;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error initializing verify session. %{public}@", buf, 0xCu);
      }
LABEL_21:

      *(void *)(*(void *)(a1 + 32) + 136) = 0;
      long long v13 = *(void **)(a1 + 32);
      if (v13) {
        -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](v13, v6);
      }
      goto LABEL_23;
    }
    if (![*(id *)(a1 + 32) role])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v15 = 0;
      id v7 = -[MRCoreUtilsPairingSession _onQueuePerformPairingExchangeWithInputData:error:](v10, 0, &v15);
      id v11 = v15;
      if (v11)
      {
        uint64_t v6 = v11;
        double v12 = _MRLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v6;
          _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to prepare data for verify exchange. %@", buf, 0xCu);
        }

        goto LABEL_21;
      }
      if (v7)
      {
        double v14 = [*(id *)(a1 + 32) delegate];
        [v14 pairingSession:*(void *)(a1 + 32) didPrepareExchangeData:v7];
      }
    }
    uint64_t v6 = 0;
LABEL_23:

    return;
  }
  id v8 = _MRLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Verify complete. Deriving encryption keys.", buf, 2u);
  }

  -[MRCoreUtilsPairingSession _onQueueDeriveEncryptionKeys](*(void **)(a1 + 32));
  id v9 = (id)[*(id *)(a1 + 32) updatePeer];
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)hasExchangedMessage
{
  return self->_hasExchangedMessage;
}

- (unsigned)pairingFlags
{
  return self->_pairingFlags;
}

- (NSData)inputKey
{
  return self->_inputKey;
}

- (void)setInputKey:(id)a3
{
}

- (NSMutableData)inputNonce
{
  return self->_inputNonce;
}

- (void)setInputNonce:(id)a3
{
}

- (NSData)outputKey
{
  return self->_outputKey;
}

- (void)setOutputKey:(id)a3
{
}

- (NSMutableData)outputNonce
{
  return self->_outputNonce;
}

- (void)setOutputNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);
  objc_storeStrong((id *)&self->_inputKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_credentials, 0);
}

@end