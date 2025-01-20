@interface MRExternalDevicePairingSession
- (BOOL)_useSystemPairing;
- (BOOL)deleteIdentityWithError:(id *)a3;
- (BOOL)hasExchangedMessage;
- (BOOL)isPaired;
- (BOOL)isUsingSystemPairing;
- (BOOL)isValid;
- (MRCoreUtilsPairingSession)pairingSession;
- (MRCryptoPairingSessionBlockDelegate)pairingDelegate;
- (MRExternalDevicePairingSession)initWithDevice:(id)a3;
- (id)decryptData:(id)a3 withError:(id *)a4;
- (id)encryptData:(id)a3 withError:(id *)a4;
- (id)pairedDevices;
- (id)removePeer;
- (id)updatePeer;
- (unint64_t)state;
- (void)_openSecuritySessionInState:(char)a3 useSystemPairing:(void *)a4 completion:;
- (void)close;
- (void)handlePairingExchangeData:(id)a3 completion:(id)a4;
- (void)handlePairingFailureWithStatus:(int)a3;
- (void)open;
- (void)removePeer;
- (void)setDelegate:(id)a3;
- (void)setPairingDelegate:(id)a3;
- (void)setPairingSession:(id)a3;
@end

@implementation MRExternalDevicePairingSession

- (MRExternalDevicePairingSession)initWithDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRExternalDevicePairingSession;
  return [(MRCryptoPairingSession *)&v4 initWithRole:0 device:a3];
}

- (unint64_t)state
{
  return [(MRCoreUtilsPairingSession *)self->_pairingSession state];
}

- (BOOL)hasExchangedMessage
{
  return [(MRCoreUtilsPairingSession *)self->_pairingSession hasExchangedMessage];
}

- (BOOL)isUsingSystemPairing
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (BOOL)isValid
{
  return [(MRCoreUtilsPairingSession *)self->_pairingSession isValid];
}

- (BOOL)isPaired
{
  v3 = [(MRCryptoPairingSession *)self device];

  if (!v3) {
    return 0;
  }
  objc_super v4 = [MRCoreUtilsSystemPairingSession alloc];
  uint64_t v5 = [(MRCryptoPairingSession *)self device];
  v6 = [(MRCoreUtilsPairingSession *)v4 initWithRole:0 device:v5];

  [(MRCoreUtilsPairingSession *)v6 open];
  LOBYTE(v5) = [(MRCoreUtilsPairingSession *)v6 isPaired];

  if (v5) {
    return 1;
  }
  v8 = [MRCoreUtilsPairingSession alloc];
  v9 = [(MRCryptoPairingSession *)self device];
  v10 = [(MRCoreUtilsPairingSession *)v8 initWithRole:0 device:v9];

  [(MRCoreUtilsPairingSession *)v10 open];
  LOBYTE(v9) = [(MRCoreUtilsPairingSession *)v10 isPaired];

  return (char)v9;
}

- (id)pairedDevices
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(MRCoreUtilsPairingSession *)[MRCoreUtilsSystemPairingSession alloc] initWithRole:0 device:0];
  [(MRCoreUtilsPairingSession *)v3 open];
  objc_super v4 = [(MRCoreUtilsPairingSession *)v3 pairedDevices];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = [[MRCoreUtilsPairingSession alloc] initWithRole:0 device:0];
  [(MRCoreUtilsPairingSession *)v5 open];
  v6 = [(MRCoreUtilsPairingSession *)v5 pairedDevices];
  [v2 addObjectsFromArray:v6];

  return v2;
}

- (id)removePeer
{
  v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[MRExternalDevicePairingSession removePeer](self);
  }

  objc_super v4 = [MRCoreUtilsSystemPairingSession alloc];
  uint64_t v5 = [(MRCryptoPairingSession *)self device];
  v6 = [(MRCoreUtilsPairingSession *)v4 initWithRole:0 device:v5];

  [(MRCoreUtilsPairingSession *)v6 open];
  id v7 = [(MRCoreUtilsSystemPairingSession *)v6 removePeer];

  v8 = [MRCoreUtilsPairingSession alloc];
  v9 = [(MRCryptoPairingSession *)self device];
  v10 = [(MRCoreUtilsPairingSession *)v8 initWithRole:0 device:v9];

  [(MRCoreUtilsPairingSession *)v10 open];
  v11 = [(MRCoreUtilsPairingSession *)v10 removePeer];
  v12 = v11;
  if (!v7) {
    id v7 = v11;
  }

  return v7;
}

- (id)updatePeer
{
  v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[MRExternalDevicePairingSession removePeer](self);
  }

  objc_super v4 = [MRCoreUtilsSystemPairingSession alloc];
  uint64_t v5 = [(MRCryptoPairingSession *)self device];
  v6 = [(MRCoreUtilsPairingSession *)v4 initWithRole:0 device:v5];

  [(MRCoreUtilsPairingSession *)v6 open];
  id v7 = [(MRCoreUtilsSystemPairingSession *)v6 updatePeer];

  v8 = [MRCoreUtilsPairingSession alloc];
  v9 = [(MRCryptoPairingSession *)self device];
  v10 = [(MRCoreUtilsPairingSession *)v8 initWithRole:0 device:v9];

  [(MRCoreUtilsPairingSession *)v10 open];
  v11 = [(MRCoreUtilsPairingSession *)v10 updatePeer];
  v12 = v11;
  if (!v7) {
    id v7 = v11;
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRExternalDevicePairingSession;
  [(MRCryptoPairingSession *)&v15 setDelegate:v4];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(MRCryptoPairingSessionBlockDelegate);
    [(MRExternalDevicePairingSession *)self setPairingDelegate:v5];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke;
    v12[3] = &unk_1E57D51C0;
    objc_copyWeak(&v13, &location);
    [(MRCryptoPairingSessionBlockDelegate *)self->_pairingDelegate setDataExchangeBlock:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke_2;
    v10[3] = &unk_1E57D51E8;
    objc_copyWeak(&v11, &location);
    [(MRCryptoPairingSessionBlockDelegate *)self->_pairingDelegate setShowSetupCodeBlock:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke_3;
    v8[3] = &unk_1E57D5210;
    objc_copyWeak(&v9, &location);
    [(MRCryptoPairingSessionBlockDelegate *)self->_pairingDelegate setHideSetupCodeBlock:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke_4;
    v6[3] = &unk_1E57D5238;
    objc_copyWeak(&v7, &location);
    [(MRCryptoPairingSessionBlockDelegate *)self->_pairingDelegate setPromptForSetupCodeBlock:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MRExternalDevicePairingSession *)self setPairingDelegate:0];
  }
}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained delegate];
    [v6 pairingSession:v5 didPrepareExchangeData:v7];
  }
}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained delegate];
    [v6 pairingSession:v5 showSetupCode:v7];
  }
}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 pairingSessionHideSetupCode:v3];

    id WeakRetained = v3;
  }
}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke_4(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained delegate];
    [v8 pairingSession:v7 promptForSetupCodeWithDelay:v9 completion:a2];
  }
}

- (void)open
{
  char v3 = -[MRExternalDevicePairingSession _useSystemPairing](self);

  -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:]((id *)&self->super.super.isa, (void *)3, v3, 0);
}

- (BOOL)_useSystemPairing
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 device];
  if ([v1 supportsSystemPairing])
  {
    id v2 = +[MRUserSettings currentSettings];
    if ([v2 useExternalDeviceSystemPairing]) {
      BOOL v3 = +[MRCoreUtilsSystemPairingSession systemPairingAvailable];
    }
    else {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_openSecuritySessionInState:(char)a3 useSystemPairing:(void *)a4 completion:
{
  id v7 = a4;
  if (a1)
  {
    v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:](a3, (uint64_t)a2, v8);
    }

    if (a3) {
      id v9 = MRCoreUtilsSystemPairingSession;
    }
    else {
      id v9 = MRCoreUtilsPairingSession;
    }
    id v10 = [v9 alloc];
    id v11 = [a1 device];
    v12 = (void *)[v10 initWithRole:0 device:v11];

    [a1 setPairingSession:v12];
    [a1[4] setDelegate:a1[5]];
    objc_initWeak(&location, a1);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke;
    v13[3] = &unk_1E57D5260;
    objc_copyWeak(v15, &location);
    v15[1] = a2;
    char v16 = a3;
    id v14 = v7;
    [a1[5] setExchangeCompleteBlock:v13];
    [a1[4] openInState:a2];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_14;
  }
  if (!v4)
  {
    int v9 = *(unsigned __int8 *)(a1 + 56);
    id v10 = _MRLogForCategory(0);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11) {
        __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_2(v10);
      }
    }
    else if (v11)
    {
      __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_1(v10);
    }

    goto LABEL_13;
  }
  if ([v4 code] == 25 || *(void *)(a1 + 48) != 3)
  {
LABEL_13:
    v12 = [WeakRetained delegate];
    [v12 pairingSession:WeakRetained didCompleteExchangeWithError:v4];

    goto LABEL_14;
  }
  int v6 = *(unsigned __int8 *)(a1 + 56);
  id v7 = dispatch_get_global_queue(2, 0);
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_2;
    block[3] = &unk_1E57D03B0;
    id v17 = WeakRetained;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    v8 = v17;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_4;
    v13[3] = &unk_1E57D03B0;
    id v14 = WeakRetained;
    id v15 = *(id *)(a1 + 32);
    dispatch_async(v7, v13);

    v8 = v14;
  }

LABEL_14:
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_3;
  v2[3] = &unk_1E57D0FE8;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:](v1, 3, 0, v2);
}

uint64_t __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = -[MRExternalDevicePairingSession _useSystemPairing](v2);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_5;
  v4[3] = &unk_1E57D0FE8;
  id v5 = *(id *)(a1 + 40);
  -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:](v2, 2, v3, v4);
}

uint64_t __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)close
{
}

- (void)handlePairingExchangeData:(id)a3 completion:(id)a4
{
}

- (void)handlePairingFailureWithStatus:(int)a3
{
}

- (id)encryptData:(id)a3 withError:(id *)a4
{
  return [(MRCoreUtilsPairingSession *)self->_pairingSession encryptData:a3 withError:a4];
}

- (id)decryptData:(id)a3 withError:(id *)a4
{
  return [(MRCoreUtilsPairingSession *)self->_pairingSession decryptData:a3 withError:a4];
}

- (BOOL)deleteIdentityWithError:(id *)a3
{
  return [(MRCoreUtilsPairingSession *)self->_pairingSession deleteIdentityWithError:a3];
}

- (MRCoreUtilsPairingSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
}

- (MRCryptoPairingSessionBlockDelegate)pairingDelegate
{
  return self->_pairingDelegate;
}

- (void)setPairingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingDelegate, 0);

  objc_storeStrong((id *)&self->_pairingSession, 0);
}

- (void)removePeer
{
  uint64_t v1 = [a1 device];
  OUTLINED_FUNCTION_0_12(&dword_194F3C000, v2, v3, "[CryptoPairingSession(MRExternalDevicePairingSession)] Unpairing Device %@", v4, v5, v6, v7, 2u);
}

- (void)_openSecuritySessionInState:(char)a1 useSystemPairing:(uint64_t)a2 completion:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "true";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "false";
  }
  int v4 = 134218242;
  uint64_t v5 = a2;
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "[CryptoPairingSession(MRExternalDevicePairingSession)] Opening Security Session in State = %ld usingSystemPairing = %s", (uint8_t *)&v4, 0x16u);
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "[CryptoPairingSession(MRExternalDevicePairingSession)] Legacy pairing success.", v1, 2u);
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "[CryptoPairingSession(MRExternalDevicePairingSession)] System pairing success.", v1, 2u);
}

@end