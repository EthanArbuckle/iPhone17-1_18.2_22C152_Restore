@interface TUIStaticIdentityManager
- (BOOL)accountKeysDisplayed;
- (BOOL)conversationVerified;
- (BOOL)sasCodeRefreshRequired;
- (BOOL)sasCodeValid;
- (KTIDSSession)ktSession;
- (NSArray)conversationMembers;
- (NSDictionary)options;
- (NSString)contactIdentifier;
- (NSString)lastUsedAddress;
- (NSString)peerAccountKeyDisplayString;
- (NSString)peerPublicAccountIdentity;
- (NSString)sasCode;
- (NSString)sasCodeString;
- (NSString)selfAccountKeyDisplayString;
- (NSTimer)sessionExpiredTimer;
- (TUIStaticIdentityManager)initWithConversationMembers:(id)a3 options:(id)a4;
- (TUIStaticIdentityManagerProtocol)delegate;
- (TransparencyStaticKey)staticKey;
- (id)displayStringWithAccountPublicID:(id)a3;
- (id)localizedPeerAccountNameMessage:(id)a3;
- (id)peerCNContact:(id)a3;
- (int64_t)_sessionStateWithStateString:(id)a3;
- (int64_t)sessionState;
- (unint64_t)sasCodeValidMinutes;
- (void)_setupKTSession;
- (void)_updateUI;
- (void)dealloc;
- (void)deleteKTSession;
- (void)handleNotification:(id)a3;
- (void)hideAccountKeys:(BOOL)a3;
- (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5 deliverImmediately:(BOOL)a6;
- (void)requestConversationVerificationState:(BOOL)a3;
- (void)requestConversationVerificationState:(BOOL)a3 completionHandler:(id)a4;
- (void)requestNewSasCode;
- (void)requestNewSasCodeWithDelay;
- (void)requestSelfAccountKey;
- (void)sessionExpired:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setConversationMembers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKtSession:(id)a3;
- (void)setLastUsedAddress:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPeerPublicAccountIdentity:(id)a3;
- (void)setSasCode:(id)a3;
- (void)setSessionExpiredTimer:(id)a3;
- (void)setStaticKey:(id)a3;
- (void)showAccountKeys;
- (void)showAccountKeys:(BOOL)a3;
- (void)verifyConversation;
- (void)verifyConversationWithContact:(id)a3 completionHandler:(id)a4;
@end

@implementation TUIStaticIdentityManager

- (TUIStaticIdentityManager)initWithConversationMembers:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIStaticIdentityManager;
  v9 = [(TUIStaticIdentityManager *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversationMembers, a3);
    objc_storeStrong((id *)&v10->_options, a4);
    uint64_t v11 = [v8 objectForKeyedSubscript:@"contactIdentifier"];
    contactIdentifier = v10->_contactIdentifier;
    v10->_contactIdentifier = (NSString *)v11;

    uint64_t v13 = [v8 objectForKeyedSubscript:@"lastUsedIdentifier"];
    lastUsedAddress = v10->_lastUsedAddress;
    v10->_lastUsedAddress = (NSString *)v13;

    if (!v10->_contactIdentifier)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_23);
      }
      v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_260338000, v15, OS_LOG_TYPE_ERROR, "Didn't get contact identifier, so result can't be saved", v17, 2u);
      }
    }
  }

  return v10;
}

uint64_t __64__TUIStaticIdentityManager_initWithConversationMembers_options___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F80DD0] object:0];

  [(TUIStaticIdentityManager *)self deleteKTSession];
  v4.receiver = self;
  v4.super_class = (Class)TUIStaticIdentityManager;
  [(TUIStaticIdentityManager *)&v4 dealloc];
}

- (void)deleteKTSession
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_10_0);
  }
  v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
  {
    objc_super v4 = v3;
    v5 = [(TUIStaticIdentityManager *)self ktSession];
    int v12 = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_DEBUG, "Deleting ktsession: %@", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v6 = [(TUIStaticIdentityManager *)self staticKey];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(TUIStaticIdentityManager *)self ktSession];

    if (v8)
    {
      v9 = [(TUIStaticIdentityManager *)self staticKey];
      v10 = [(TUIStaticIdentityManager *)self ktSession];
      uint64_t v11 = [v10 sessionID];
      [v9 deleteKTSession:v11 complete:&__block_literal_global_14_0];

      [(TUIStaticIdentityManager *)self setKtSession:0];
    }
  }
}

uint64_t __43__TUIStaticIdentityManager_deleteKTSession__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)requestSelfAccountKey
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_17(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_22);
    }
    uint64_t v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG)) {
      __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_17_cold_1((uint64_t)WeakRetained, v2);
    }
    uint64_t v3 = [MEMORY[0x263F80D00] accountPublicID:*MEMORY[0x263F80D78]];
    *(void *)location = 0;
    objc_initWeak((id *)location, WeakRetained);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_24;
    block[3] = &unk_2655531F0;
    objc_copyWeak(&v9, (id *)location);
    id v7 = v3;
    id v8 = 0;
    id v4 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_19_0);
    }
    uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(void *)&location[4] = "-[TUIStaticIdentityManager requestSelfAccountKey]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }
}

uint64_t __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_20()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_24(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v4 = objc_msgSend(WeakRetained, "displayStringWithAccountPublicID:");
      uint64_t v5 = (void *)v3[4];
      v3[4] = v4;

      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_30_0);
      }
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG)) {
        __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_24_cold_2();
      }
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_33_0);
      }
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR)) {
        __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_24_cold_1();
      }
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"VERIFICATION_CODE_NOT_AVAILABLE" value:&stru_270C3F140 table:@"Localizable"];
      id v9 = (void *)v3[4];
      v3[4] = v8;
    }
    [v3 _updateUI];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_27_0);
    }
    uint64_t v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[TUIStaticIdentityManager requestSelfAccountKey]_block_invoke";
      _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_2_25()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_28()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_31()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)requestNewSasCodeWithDelay
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __54__TUIStaticIdentityManager_requestNewSasCodeWithDelay__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __54__TUIStaticIdentityManager_requestNewSasCodeWithDelay__block_invoke_46(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained requestNewSasCode];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_48_0);
    }
    uint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[TUIStaticIdentityManager requestNewSasCodeWithDelay]_block_invoke";
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __54__TUIStaticIdentityManager_requestNewSasCodeWithDelay__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)requestNewSasCode
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __45__TUIStaticIdentityManager_requestNewSasCode__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)requestConversationVerificationState:(BOOL)a3
{
}

- (void)requestConversationVerificationState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(void))a4;
  self->_conversationVerified = 0;
  [(TUIStaticIdentityManager *)self _updateUI];
  if ([(NSArray *)self->_conversationMembers count])
  {
    id v7 = [(NSArray *)self->_conversationMembers objectAtIndexedSubscript:0];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"publicAccountIdentity"];
  id v9 = (void *)v8;
  if (v7 && (v8 || (_os_feature_enabled_impl() & 1) != 0))
  {
    int v10 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_60;
    block[3] = &unk_265553A08;
    void block[4] = self;
    BOOL v17 = v4;
    v16 = v6;
    id v14 = v7;
    id v15 = v9;
    dispatch_async(v10, block);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_59_1);
    }
    uint64_t v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      options = self->_options;
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      __int16 v20 = 2112;
      v21 = options;
      _os_log_impl(&dword_260338000, v11, OS_LOG_TYPE_ERROR, "failed get peer verification status (invalid parameters uri = %@, options = %@)", buf, 0x16u);
    }
    self->_conversationVerified = 0;
    if (v4) {
      [(TUIStaticIdentityManager *)self requestNewSasCode];
    }
    else {
      [(TUIStaticIdentityManager *)self _updateUI];
    }
    v6[2](v6);
  }
}

uint64_t __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_60(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F80D40]);
  uint64_t v3 = (void *)[v2 initWithApplication:*MEMORY[0x263F80D78]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_2;
  v8[3] = &unk_2655539B8;
  v8[4] = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  BOOL v4 = (void *)MEMORY[0x26120DF90](v8);
  if (_os_feature_enabled_impl())
  {
    v11[0] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_66;
    v6[3] = &unk_2655539E0;
    id v7 = v4;
    [v3 getCachedValidatePeerResults:v5 completionBlock:v6];
  }
  else
  {
    [v3 getValidatePeerResult:*(void *)(a1 + 40) uuid:*(void *)(a1 + 48) completionBlock:v4];
  }
}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_63_1);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138478083;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "getValidatePeerResult result = %{private}@, error = %{public}@", (uint8_t *)&v18, 0x16u);
  }
  BOOL v8 = v5
    && [v5 staticAccountKeyEnforced]
    && [v5 staticAccountKeyStatus] == 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = v8;
  id v9 = [v5 publicID];

  if (v9)
  {
    char v10 = [v5 publicID];
    uint64_t v11 = [v10 publicAccountIdentity];
    [*(id *)(a1 + 32) setPeerPublicAccountIdentity:v11];

    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v5 publicID];
    uint64_t v14 = [v12 displayStringWithAccountPublicID:v13];
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  BOOL v17 = *(unsigned char **)(a1 + 32);
  if (v17[17] || !*(unsigned char *)(a1 + 48)) {
    [v17 _updateUI];
  }
  else {
    [v17 requestNewSasCode];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_3()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_66(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 count])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8] code:-351 description:@"no verifier results for static key"];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [v6 firstObject];
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v3);
}

- (void)verifyConversation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TUIStaticIdentityManager *)self peerCNContact:self->_contactIdentifier];
  if (v3)
  {
    [(NSTimer *)self->_sessionExpiredTimer invalidate];
    sessionExpiredTimer = self->_sessionExpiredTimer;
    self->_sessionExpiredTimer = 0;

    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_76);
    }
    id v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
    {
      contactIdentifier = self->_contactIdentifier;
      peerPublicAccountIdentity = self->_peerPublicAccountIdentity;
      int v12 = 138412546;
      uint64_t v13 = contactIdentifier;
      __int16 v14 = 2112;
      uint64_t v15 = peerPublicAccountIdentity;
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "Updating contact %@ with public key: %@", (uint8_t *)&v12, 0x16u);
    }
    BOOL v8 = [(TUIStaticIdentityManager *)self delegate];
    id v9 = [(TUIStaticIdentityManager *)self peerPublicAccountIdentity];
    [v8 verifyContact:v3 peerPublicAccountIdentity:v9];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_73);
    }
    char v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = self->_contactIdentifier;
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_ERROR, "failed to verify conversation (no peer) %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

uint64_t __46__TUIStaticIdentityManager_verifyConversation__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __46__TUIStaticIdentityManager_verifyConversation__block_invoke_74()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)verifyConversationWithContact:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = v6;
  if (a3)
  {
    [(TUIStaticIdentityManager *)self requestConversationVerificationState:1 completionHandler:v6];
  }
  else
  {
    [(TUIStaticIdentityManager *)self requestNewSasCode];
    v7[2]();
  }
}

- (void)showAccountKeys
{
}

- (void)showAccountKeys:(BOOL)a3
{
  if (!self->_accountKeysDisplayed)
  {
    self->_accountKeysDisplayed = 1;
    if (a3) {
      [(TUIStaticIdentityManager *)self _updateUI];
    }
  }
}

- (void)hideAccountKeys:(BOOL)a3
{
  if (self->_accountKeysDisplayed)
  {
    self->_accountKeysDisplayed = 0;
    if (a3) {
      [(TUIStaticIdentityManager *)self _updateUI];
    }
  }
}

- (NSString)sasCodeString
{
  sasCode = self->_sasCode;
  if (sasCode)
  {
    uint64_t v4 = NSString;
    id v5 = [(NSString *)sasCode substringToIndex:4];
    id v6 = [(NSString *)self->_sasCode substringFromIndex:4];
    id v7 = [v4 stringWithFormat:@"%@ %@", v5, v6];
  }
  else
  {
    id v7 = 0;
  }
  return (NSString *)v7;
}

- (BOOL)sasCodeValid
{
  return self->_sasCode != 0;
}

- (id)localizedPeerAccountNameMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  personNameComponents = self->_personNameComponents;
  if (personNameComponents) {
    goto LABEL_13;
  }
  if (self->_contactIdentifier)
  {
    id v6 = -[TUIStaticIdentityManager peerCNContact:](self, "peerCNContact:");
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_85);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "peer account: %@", buf, 0xCu);
    }
    BOOL v8 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x263F08A68]);
    id v9 = self->_personNameComponents;
    self->_personNameComponents = v8;

    char v10 = [v6 namePrefix];
    [(NSPersonNameComponents *)self->_personNameComponents setNamePrefix:v10];

    uint64_t v11 = [v6 nameSuffix];
    [(NSPersonNameComponents *)self->_personNameComponents setNameSuffix:v11];

    int v12 = [v6 middleName];
    [(NSPersonNameComponents *)self->_personNameComponents setMiddleName:v12];

    uint64_t v13 = [v6 givenName];
    [(NSPersonNameComponents *)self->_personNameComponents setGivenName:v13];

    __int16 v14 = [v6 familyName];
    [(NSPersonNameComponents *)self->_personNameComponents setFamilyName:v14];

    uint64_t v15 = [v6 nickname];
    [(NSPersonNameComponents *)self->_personNameComponents setNickname:v15];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_82_1);
    }
    uint64_t v16 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260338000, v16, OS_LOG_TYPE_ERROR, "no contact identifier", buf, 2u);
    }
  }
  personNameComponents = self->_personNameComponents;
  if (personNameComponents)
  {
LABEL_13:
    BOOL v17 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:personNameComponents style:1 options:0];
  }
  else
  {
    BOOL v17 = 0;
  }
  if ([v17 length])
  {
    int v18 = NSString;
    id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v20 = [v19 localizedStringForKey:v4 value:&stru_270C3F140 table:@"Localizable"];
    objc_msgSend(v18, "localizedStringWithFormat:", v20, v17);
  }
  else
  {
    id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v20 = [v4 stringByAppendingString:@"_UNKNOWN"];
    [v19 localizedStringForKey:v20 value:&stru_270C3F140 table:@"Localizable"];
  id v21 = };

  return v21;
}

uint64_t __60__TUIStaticIdentityManager_localizedPeerAccountNameMessage___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __60__TUIStaticIdentityManager_localizedPeerAccountNameMessage___block_invoke_83()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)peerCNContact:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFEA18]);
    id v5 = [MEMORY[0x263EFEBD8] descriptorForRequiredKeys];
    v30[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    id v7 = (void *)[v4 initWithKeysToFetch:v6];

    BOOL v8 = (void *)MEMORY[0x263EFE9F8];
    id v29 = v3;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    char v10 = [v8 predicateForContactsWithIdentifiers:v9];
    [v7 setPredicate:v10];

    uint64_t v11 = objc_opt_new();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __42__TUIStaticIdentityManager_peerCNContact___block_invoke;
    v17[3] = &unk_265553A30;
    v17[4] = &v19;
    id v18 = 0;
    [v11 enumerateContactsWithFetchRequest:v7 error:&v18 usingBlock:v17];
    id v12 = v18;

    uint64_t v13 = (void *)v20[5];
    if (v13) {
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = 0;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_97_0);
  }
  __int16 v14 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v3;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&dword_260338000, v14, OS_LOG_TYPE_ERROR, "failed to fetch a contact for contactIdentifier = %@, error = %@", buf, 0x16u);
  }
  uint64_t v13 = (void *)v20[5];
LABEL_10:
  id v15 = v13;
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __42__TUIStaticIdentityManager_peerCNContact___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

uint64_t __42__TUIStaticIdentityManager_peerCNContact___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (int64_t)_sessionStateWithStateString:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F80E00]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F80DF8]])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F80DE8]])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F80DF0]])
  {
    int64_t v4 = 4;
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_99_1);
    }
    id v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "invalid session state %@", (uint8_t *)&v7, 0xCu);
    }
    int64_t v4 = 0;
  }

  return v4;
}

uint64_t __57__TUIStaticIdentityManager__sessionStateWithStateString___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_updateUI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained updateUI];
}

- (void)_setupKTSession
{
  self->_sessionState = 1;
  [(TUIStaticIdentityManager *)self _updateUI];
  id v3 = objc_alloc_init(MEMORY[0x263F80D70]);
  [(TUIStaticIdentityManager *)self setStaticKey:v3];

  int64_t v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 addObserver:self selector:sel_handleNotification_ name:*MEMORY[0x263F80DD0] object:0 suspensionBehavior:4];

  id location = 0;
  objc_initWeak(&location, self);
  id v5 = dispatch_get_global_queue(25, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__TUIStaticIdentityManager__setupKTSession__block_invoke;
  v6[3] = &unk_265553128;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained conversationMembers];
    int64_t v4 = (void *)[v3 mutableCopy];

    id v5 = objc_alloc(MEMORY[0x263F80D30]);
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = (void *)[v5 initWithPeer:v6];

    [v4 removeObjectAtIndex:0];
    id v8 = [MEMORY[0x263EFFA08] setWithArray:v4];
    [v7 setOtherNamesForPeer:v8];

    uint64_t v9 = [v2 lastUsedAddress];

    if (v9)
    {
      char v10 = [v2 lastUsedAddress];
      [v7 setLastUsedAddressOfMe:v10];
    }
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_109_0);
    }
    uint64_t v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = (const char *)v7;
      _os_log_impl(&dword_260338000, v11, OS_LOG_TYPE_DEFAULT, "setupKTSession (%{public}@)", buf, 0xCu);
    }
    id v12 = [v2 staticKey];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __43__TUIStaticIdentityManager__setupKTSession__block_invoke_110;
    v14[3] = &unk_265553A58;
    v14[4] = v2;
    [v12 setupKTSession:v7 complete:v14];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_104_1);
    }
    uint64_t v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[TUIStaticIdentityManager _setupKTSession]_block_invoke";
      _os_log_impl(&dword_260338000, v13, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __43__TUIStaticIdentityManager__setupKTSession__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __43__TUIStaticIdentityManager__setupKTSession__block_invoke_107()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_116_0);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "setupKTSession succeeded, session = %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) setKtSession:v5];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_113);
    }
    id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "setupKTSession failed: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) requestNewSasCodeWithDelay];
  }
}

uint64_t __43__TUIStaticIdentityManager__setupKTSession__block_invoke_2_111()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __43__TUIStaticIdentityManager__setupKTSession__block_invoke_114()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  id v7 = [v4 name];
  id v5 = [v4 object];
  id v6 = [v4 userInfo];

  [(TUIStaticIdentityManager *)self postNotificationName:v7 object:v5 userInfo:v6 deliverImmediately:0];
}

- (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5 deliverImmediately:(BOOL)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F80DE0]];
  int64_t v9 = [(TUIStaticIdentityManager *)self _sessionStateWithStateString:v8];

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_119_0);
  }
  id v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v7;
    __int16 v20 = 1024;
    int v21 = v9;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEFAULT, "postNotificationName: %@/%d", buf, 0x12u);
  }
  if (v9 == 1)
  {
    self->_sessionState = 1;
    [(TUIStaticIdentityManager *)self _updateUI];
  }
  else if (v9 == 2)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:*MEMORY[0x263F80DD8]];
    staticKey = self->_staticKey;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke_120;
    v14[3] = &unk_265553A80;
    id v15 = v11;
    uint64_t v16 = self;
    uint64_t v17 = 2;
    id v13 = v11;
    [(TransparencyStaticKey *)staticKey getKTSessionByID:v13 complete:v14];
  }
  else
  {
    self->_sessionState = v9;
    self->_sasCodeRefreshRequired = 1;
    [(TUIStaticIdentityManager *)self requestNewSasCode];
  }
}

uint64_t __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke_120(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_122_0);
  }
  id v4 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = [v3 sasCode];
    if (v7) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    int64_t v9 = [v3 sessionExpire];
    id v10 = [v3 peerAccountIdentity];
    uint64_t v11 = [v10 publicAccountIdentity];
    int v27 = 138413058;
    uint64_t v28 = v5;
    __int16 v29 = 2112;
    v30 = v8;
    __int16 v31 = 2112;
    v32 = v9;
    __int16 v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_DEFAULT, "post notification, sessionId = %@ code = %@, expiration = %@, peer identity = %@", (uint8_t *)&v27, 0x2Au);
  }
  id v12 = [v3 sasCode];
  [*(id *)(a1 + 40) setSasCode:v12];

  id v13 = [v3 sessionExpire];
  __int16 v14 = v13;
  if (v13)
  {
    [v13 timeIntervalSinceNow];
    if (v15 < 1.0)
    {
      [*(id *)(a1 + 40) requestNewSasCode];
      goto LABEL_15;
    }
    *(void *)(*(void *)(a1 + 40) + 56) = vcvtpd_u64_f64(v15 / 60.0);
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFFA20]) initWithFireDate:v14 interval:*(void *)(a1 + 40) target:sel_sessionExpired_ selector:0 userInfo:0 repeats:0.0];
    [*(id *)(a1 + 40) setSessionExpiredTimer:v16];

    uint64_t v17 = [MEMORY[0x263EFF9F0] mainRunLoop];
    id v18 = [*(id *)(a1 + 40) sessionExpiredTimer];
    [v17 addTimer:v18 forMode:*MEMORY[0x263EFF478]];
  }
  id v19 = [v3 peerAccountIdentity];

  if (v19)
  {
    __int16 v20 = [v3 peerAccountIdentity];
    int v21 = [v20 publicAccountIdentity];
    [*(id *)(a1 + 40) setPeerPublicAccountIdentity:v21];

    uint64_t v22 = *(void **)(a1 + 40);
    v23 = [v3 peerAccountIdentity];
    uint64_t v24 = [v22 displayStringWithAccountPublicID:v23];
    uint64_t v25 = *(void *)(a1 + 40);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 18) = 0;
  *(void *)(*(void *)(a1 + 40) + 48) = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) _updateUI];
LABEL_15:
}

uint64_t __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)sessionExpired:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_135);
  }
  uint64_t v5 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
  {
    ktSession = self->_ktSession;
    id v7 = v5;
    id v8 = [(KTIDSSession *)ktSession sessionID];
    BOOL conversationVerified = self->_conversationVerified;
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 1024;
    BOOL v13 = conversationVerified;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "session expired, sessionID = %@, BOOL conversationVerified = %d", (uint8_t *)&v10, 0x12u);
  }
  if (self->_sessionExpiredTimer && !self->_conversationVerified)
  {
    self->_sasCodeRefreshRequired = 1;
    [(TUIStaticIdentityManager *)self requestNewSasCode];
  }
}

uint64_t __43__TUIStaticIdentityManager_sessionExpired___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)displayStringWithAccountPublicID:(id)a3
{
  return (id)[a3 publicAccountIdentity];
}

- (TUIStaticIdentityManagerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIStaticIdentityManagerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)selfAccountKeyDisplayString
{
  return self->_selfAccountKeyDisplayString;
}

- (NSString)peerAccountKeyDisplayString
{
  return self->_peerAccountKeyDisplayString;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (BOOL)accountKeysDisplayed
{
  return self->_accountKeysDisplayed;
}

- (BOOL)conversationVerified
{
  return self->_conversationVerified;
}

- (BOOL)sasCodeRefreshRequired
{
  return self->_sasCodeRefreshRequired;
}

- (unint64_t)sasCodeValidMinutes
{
  return self->_sasCodeValidMinutes;
}

- (NSArray)conversationMembers
{
  return self->_conversationMembers;
}

- (void)setConversationMembers:(id)a3
{
}

- (NSString)lastUsedAddress
{
  return self->_lastUsedAddress;
}

- (void)setLastUsedAddress:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (TransparencyStaticKey)staticKey
{
  return self->_staticKey;
}

- (void)setStaticKey:(id)a3
{
}

- (KTIDSSession)ktSession
{
  return self->_ktSession;
}

- (void)setKtSession:(id)a3
{
}

- (NSString)peerPublicAccountIdentity
{
  return self->_peerPublicAccountIdentity;
}

- (void)setPeerPublicAccountIdentity:(id)a3
{
}

- (NSString)sasCode
{
  return self->_sasCode;
}

- (void)setSasCode:(id)a3
{
}

- (NSTimer)sessionExpiredTimer
{
  return self->_sessionExpiredTimer;
}

- (void)setSessionExpiredTimer:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionExpiredTimer, 0);
  objc_storeStrong((id *)&self->_sasCode, 0);
  objc_storeStrong((id *)&self->_peerPublicAccountIdentity, 0);
  objc_storeStrong((id *)&self->_ktSession, 0);
  objc_storeStrong((id *)&self->_staticKey, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_lastUsedAddress, 0);
  objc_storeStrong((id *)&self->_conversationMembers, 0);
  objc_storeStrong((id *)&self->_peerAccountKeyDisplayString, 0);
  objc_storeStrong((id *)&self->_selfAccountKeyDisplayString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personNameComponents, 0);
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_17_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_260338000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ requesting self public account key...", (uint8_t *)&v2, 0xCu);
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_24_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_260338000, v0, OS_LOG_TYPE_ERROR, "%{public}@ failed to get self public account key: %{public}@", v1, 0x16u);
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_24_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ got self public account key: %{public}@", v1, 0x16u);
}

@end