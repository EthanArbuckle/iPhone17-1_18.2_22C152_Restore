@interface PRPersonaStore
- (BOOL)hasVendedData;
- (PRPersonaStore)init;
- (PRPersonaStore)initWithServiceListenerEndpoint:(id)a3;
- (id)likenessDataForPropagationToRecipient:(id)a3 lastContactDate:(id)a4;
- (id)likenessWithUniqueID:(id)a3;
- (unsigned)likenessVersionDigestForEmail:(id)a3;
- (unsigned)likenessVersionDigestForPhoneNumber:(id)a3;
- (void)_setHasVendedData:(BOOL)a3;
- (void)_startListeningForCacheChangeNotifications;
- (void)_stopListeningForCacheChangeNotifications;
- (void)allLikenessesForPrimaryiCloudAccountWithCompletion:(id)a3;
- (void)changeCurrentSelfLikenessToLikenessWithUniqueID:(id)a3 completion:(id)a4;
- (void)currentLikenessForPrimaryiCloudAccountWithCompletion:(id)a3;
- (void)currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:(unint64_t)a3 completion:(id)a4;
- (void)dealloc;
- (void)donateLikeness:(id)a3 forEmailAddress:(id)a4 completion:(id)a5;
- (void)donateLikeness:(id)a3 forPhoneNumber:(id)a4 completion:(id)a5;
- (void)handleAppleIDEvent:(unint64_t)a3 account:(id)a4 completion:(id)a5;
- (void)likenessForEmailAddress:(id)a3 completion:(id)a4;
- (void)likenessForEmailAddress:(id)a3 desiredFreshness:(unint64_t)a4 completion:(id)a5;
- (void)likenessForPhoneNumber:(id)a3 completion:(id)a4;
- (void)likenessForPhoneNumber:(id)a3 desiredFreshness:(unint64_t)a4 completion:(id)a5;
- (void)likenessesWithExternalIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllLikenessForPrimaryiCloudAccountWithCompletion:(id)a3;
- (void)removeLikeness:(id)a3 forPrimayiCloudAccountWithCompletion:(id)a4;
- (void)saveLikeness:(id)a3 forPrimayiCloudAccountWithCompletion:(id)a4;
- (void)screenNameForAppleIDWithAltDSID:(id)a3 completion:(id)a4;
- (void)screenNameForEmailAddress:(id)a3 completion:(id)a4;
- (void)screenNameForPhoneNumber:(id)a3 completion:(id)a4;
- (void)screenNameForPrimaryiCloudAccountWithCompletion:(id)a3;
- (void)setScreenName:(id)a3 forAppleIDWithAltDSID:(id)a4 completion:(id)a5;
- (void)setScreenName:(id)a3 forPrimaryiCloudAccountWithCompletion:(id)a4;
@end

@implementation PRPersonaStore

- (PRPersonaStore)init
{
  return [(PRPersonaStore *)self initWithServiceListenerEndpoint:0];
}

- (PRPersonaStore)initWithServiceListenerEndpoint:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRPersonaStore;
  v6 = [(PRPersonaStore *)&v14 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.personakit.xpc.reply", MEMORY[0x263EF83A8]);
    replyHandlingQueue = v6->_replyHandlingQueue;
    v6->_replyHandlingQueue = (OS_dispatch_queue *)v7;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    connectionLock = v6->_connectionLock;
    v6->_connectionLock = v9;

    [(NSLock *)v6->_connectionLock setName:@"PRPersonaStoreXPCLock"];
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    dataVendingFlagLock = v6->_dataVendingFlagLock;
    v6->_dataVendingFlagLock = v11;

    [(NSLock *)v6->_dataVendingFlagLock setName:@"PRPersonaStoreDataVendFlagLock"];
    objc_storeStrong((id *)&v6->_serviceListenerEndpoint, a3);
    [(PRPersonaStore *)v6 _startListeningForCacheChangeNotifications];
  }

  return v6;
}

- (void)dealloc
{
  [(NSLock *)self->_connectionLock lock];
  personaServiceConnection = self->_personaServiceConnection;
  if (personaServiceConnection)
  {
    [(NSXPCConnection *)personaServiceConnection invalidate];
    v4 = self->_personaServiceConnection;
    self->_personaServiceConnection = 0;
  }
  [(NSLock *)self->_connectionLock unlock];
  [(PRPersonaStore *)self _stopListeningForCacheChangeNotifications];
  v5.receiver = self;
  v5.super_class = (Class)PRPersonaStore;
  [(PRPersonaStore *)&v5 dealloc];
}

- (BOOL)hasVendedData
{
  [(NSLock *)self->_dataVendingFlagLock lock];
  BOOL hasVendedData = self->_hasVendedData;
  [(NSLock *)self->_dataVendingFlagLock unlock];
  return hasVendedData;
}

- (void)_setHasVendedData:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = _PRGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    dispatch_queue_t v7 = "-[PRPersonaStore _setHasVendedData:]";
    __int16 v8 = 1024;
    int v9 = 104;
    _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", (uint8_t *)&v6, 0x12u);
  }

  [(NSLock *)self->_dataVendingFlagLock lock];
  self->_BOOL hasVendedData = a3;
  [(NSLock *)self->_dataVendingFlagLock unlock];
}

- (void)currentLikenessForPrimaryiCloudAccountWithCompletion:(id)a3
{
}

- (void)currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:(unint64_t)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _PRGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PRPersonaStore currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:]";
    __int16 v13 = 1024;
    int v14 = 119;
    _os_log_impl(&dword_213B6F000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up current likeness for primary iCloud account...\"", buf, 0x12u);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke;
  v9[3] = &unk_2641DADE8;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  __int16 v8 = (void (**)(void, void, void))MEMORY[0x216692240](v9);
  v8[2](v8, 0, 0);
}

void __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 123;
    __int16 v20 = 2112;
    id v21 = v6;
    int v9 = "%s (%d) \"Likeness lookup for primary iCloud account came back with an error: %@\"";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore currentLikenessForPrimaryiCloudAccountWithDesiredFreshness:completion:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 125;
    __int16 v20 = 2112;
    id v21 = v5;
    int v9 = "%s (%d) \"Likeness lookup for primary iCloud account succeeded: %@\"";
  }
  _os_log_impl(&dword_213B6F000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
LABEL_7:

  [*(id *)(a1 + 32) _setHasVendedData:1];
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke_13;
    block[3] = &unk_2641DADC0;
    id v15 = v10;
    id v13 = v5;
    id v14 = v6;
    dispatch_async(v11, block);
  }
}

uint64_t __88__PRPersonaStore_currentLikenessForPrimaryiCloudAccountWithDesiredFreshness_completion___block_invoke_13(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)allLikenessesForPrimaryiCloudAccountWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _PRGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PRPersonaStore allLikenessesForPrimaryiCloudAccountWithCompletion:]";
    __int16 v12 = 1024;
    int v13 = 151;
    _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up all likenesses for primary iCloud account...\"", buf, 0x12u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke;
  v8[3] = &unk_2641DAE10;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = (void (**)(void, void, void))MEMORY[0x216692240](v8);
  v7[2](v7, 0, 0);
}

void __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore allLikenessesForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 155;
    __int16 v20 = 2112;
    id v21 = v6;
    id v9 = "%s (%d) \"Likenesses lookup for primary iCloud account came back with an error: %@\"";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    v17 = "-[PRPersonaStore allLikenessesForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 157;
    __int16 v20 = 2112;
    id v21 = v5;
    id v9 = "%s (%d) \"Likenesses lookup for primary iCloud account succeeded: %@\"";
  }
  _os_log_impl(&dword_213B6F000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
LABEL_7:

  [*(id *)(a1 + 32) _setHasVendedData:1];
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke_16;
    block[3] = &unk_2641DADC0;
    id v15 = v10;
    id v13 = v5;
    id v14 = v6;
    dispatch_async(v11, block);
  }
}

uint64_t __69__PRPersonaStore_allLikenessesForPrimaryiCloudAccountWithCompletion___block_invoke_16(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)likenessForPhoneNumber:(id)a3 completion:(id)a4
{
}

- (void)likenessForPhoneNumber:(id)a3 desiredFreshness:(unint64_t)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = _PRGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[PRPersonaStore likenessForPhoneNumber:desiredFreshness:completion:]";
    __int16 v19 = 1024;
    int v20 = 189;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up likeness for phone number %@...\"", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke;
  v13[3] = &unk_2641DAE38;
  id v14 = v7;
  id v15 = self;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  __int16 v12 = (void (**)(void, void, void))MEMORY[0x216692240](v13);
  v12[2](v12, 0, 0);
}

void __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[PRPersonaStore likenessForPhoneNumber:desiredFreshness:completion:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 193;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    id v25 = v6;
    id v10 = "%s (%d) \"Likeness lookup for phone number %@ came back with an error: %@\"";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[PRPersonaStore likenessForPhoneNumber:desiredFreshness:completion:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 195;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v5;
    id v10 = "%s (%d) \"Likeness lookup for phone number %@ succeeded: %@\"";
  }
  _os_log_impl(&dword_213B6F000, v7, OS_LOG_TYPE_DEFAULT, v10, buf, 0x26u);
LABEL_7:

  [*(id *)(a1 + 40) _setHasVendedData:1];
  __int16 v12 = *(void **)(a1 + 48);
  if (v12)
  {
    id v13 = *(NSObject **)(*(void *)(a1 + 40) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke_18;
    block[3] = &unk_2641DADC0;
    id v17 = v12;
    id v15 = v5;
    id v16 = v6;
    dispatch_async(v13, block);
  }
}

uint64_t __69__PRPersonaStore_likenessForPhoneNumber_desiredFreshness_completion___block_invoke_18(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)likenessForEmailAddress:(id)a3 completion:(id)a4
{
}

- (void)likenessForEmailAddress:(id)a3 desiredFreshness:(unint64_t)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = _PRGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[PRPersonaStore likenessForEmailAddress:desiredFreshness:completion:]";
    __int16 v19 = 1024;
    int v20 = 227;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up likeness for email %@...\"", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke;
  v13[3] = &unk_2641DAE38;
  id v14 = v7;
  id v15 = self;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  __int16 v12 = (void (**)(void, void, void))MEMORY[0x216692240](v13);
  v12[2](v12, 0, 0);
}

void __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[PRPersonaStore likenessForEmailAddress:desiredFreshness:completion:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 231;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    id v25 = v6;
    id v10 = "%s (%d) \"Likeness lookup for emailAddress %@ came back with an error: %@\"";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[PRPersonaStore likenessForEmailAddress:desiredFreshness:completion:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 233;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v5;
    id v10 = "%s (%d) \"Likeness lookup for emailAddress %@ succeeded: %@\"";
  }
  _os_log_impl(&dword_213B6F000, v7, OS_LOG_TYPE_DEFAULT, v10, buf, 0x26u);
LABEL_7:

  [*(id *)(a1 + 40) _setHasVendedData:1];
  __int16 v12 = *(void **)(a1 + 48);
  if (v12)
  {
    id v13 = *(NSObject **)(*(void *)(a1 + 40) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke_19;
    block[3] = &unk_2641DADC0;
    id v17 = v12;
    id v15 = v5;
    id v16 = v6;
    dispatch_async(v13, block);
  }
}

uint64_t __70__PRPersonaStore_likenessForEmailAddress_desiredFreshness_completion___block_invoke_19(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)saveLikeness:(id)a3 forPrimayiCloudAccountWithCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _PRGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[PRPersonaStore saveLikeness:forPrimayiCloudAccountWithCompletion:]";
    __int16 v13 = 1024;
    int v14 = 265;
    _os_log_impl(&dword_213B6F000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Saving likeness for primary iCloud account...\"", buf, 0x12u);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke;
  v9[3] = &unk_2641DAE88;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  BOOL v8 = (void (**)(void, void, void))MEMORY[0x216692240](v9);
  v8[2](v8, 1, 0);
}

void __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[PRPersonaStore saveLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 269;
    __int16 v21 = 2112;
    id v22 = v5;
    BOOL v8 = "%s (%d) \"Likeness write came back with an error: %@\"";
    uint64_t v9 = v6;
    uint32_t v10 = 28;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[PRPersonaStore saveLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 271;
    BOOL v8 = "%s (%d) \"Likeness write succeeded.\"";
    uint64_t v9 = v6;
    uint32_t v10 = 18;
  }
  _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    __int16 v12 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_20;
    block[3] = &unk_2641DAE60;
    id v15 = v11;
    char v16 = a2;
    id v14 = v5;
    dispatch_async(v12, block);
  }
}

uint64_t __68__PRPersonaStore_saveLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)changeCurrentSelfLikenessToLikenessWithUniqueID:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _PRGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[PRPersonaStore changeCurrentSelfLikenessToLikenessWithUniqueID:completion:]";
    __int16 v15 = 1024;
    int v16 = 295;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Changing current self likeness to the one with ID: %@...\"", buf, 0x1Cu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke;
  v11[3] = &unk_2641DAE88;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  uint32_t v10 = (void (**)(void, void, void))MEMORY[0x216692240](v11);
  v10[2](v10, 1, 0);
}

void __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    id v18 = "-[PRPersonaStore changeCurrentSelfLikenessToLikenessWithUniqueID:completion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 299;
    __int16 v21 = 2112;
    id v22 = v5;
    BOOL v8 = "%s (%d) \"Error: %@\"";
    id v9 = v6;
    uint32_t v10 = 28;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    id v18 = "-[PRPersonaStore changeCurrentSelfLikenessToLikenessWithUniqueID:completion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 301;
    BOOL v8 = "%s (%d) \"Success.\"";
    id v9 = v6;
    uint32_t v10 = 18;
  }
  _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke_22;
    block[3] = &unk_2641DAE60;
    id v15 = v11;
    char v16 = a2;
    id v14 = v5;
    dispatch_async(v12, block);
  }
}

uint64_t __77__PRPersonaStore_changeCurrentSelfLikenessToLikenessWithUniqueID_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeLikeness:(id)a3 forPrimayiCloudAccountWithCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _PRGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[PRPersonaStore removeLikeness:forPrimayiCloudAccountWithCompletion:]";
    __int16 v15 = 1024;
    int v16 = 325;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Removing likeness self likeness %@...\"", buf, 0x1Cu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke;
  v11[3] = &unk_2641DAE88;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  uint32_t v10 = (void (**)(void, void, void))MEMORY[0x216692240](v11);
  v10[2](v10, 1, 0);
}

void __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    id v18 = "-[PRPersonaStore removeLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 329;
    __int16 v21 = 2112;
    id v22 = v5;
    BOOL v8 = "%s (%d) \"Likeness removal came back with an error: %@\"";
    id v9 = v6;
    uint32_t v10 = 28;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    id v18 = "-[PRPersonaStore removeLikeness:forPrimayiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 331;
    BOOL v8 = "%s (%d) \"Likeness removal succeeded.\"";
    id v9 = v6;
    uint32_t v10 = 18;
  }
  _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_23;
    block[3] = &unk_2641DAE60;
    id v15 = v11;
    char v16 = a2;
    id v14 = v5;
    dispatch_async(v12, block);
  }
}

uint64_t __70__PRPersonaStore_removeLikeness_forPrimayiCloudAccountWithCompletion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeAllLikenessForPrimaryiCloudAccountWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _PRGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[PRPersonaStore removeAllLikenessForPrimaryiCloudAccountWithCompletion:]";
    __int16 v12 = 1024;
    int v13 = 355;
    _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Removing all likenesses for primary iCloud account...\"", buf, 0x12u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke;
  v8[3] = &unk_2641DAE88;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = (void (**)(void, void, void))MEMORY[0x216692240](v8);
  v7[2](v7, 1, 0);
}

void __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    id v18 = "-[PRPersonaStore removeAllLikenessForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 359;
    __int16 v21 = 2112;
    id v22 = v5;
    BOOL v8 = "%s (%d) \"Removing likenesses came back with an error: %@\"";
    id v9 = v6;
    uint32_t v10 = 28;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    id v18 = "-[PRPersonaStore removeAllLikenessForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 361;
    BOOL v8 = "%s (%d) \"Removing likenesses succeeded.\"";
    id v9 = v6;
    uint32_t v10 = 18;
  }
  _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    __int16 v12 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke_24;
    block[3] = &unk_2641DAE60;
    id v15 = v11;
    char v16 = a2;
    id v14 = v5;
    dispatch_async(v12, block);
  }
}

uint64_t __73__PRPersonaStore_removeAllLikenessForPrimaryiCloudAccountWithCompletion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (unsigned)likenessVersionDigestForEmail:(id)a3
{
  return 0;
}

- (unsigned)likenessVersionDigestForPhoneNumber:(id)a3
{
  return 0;
}

- (id)likenessDataForPropagationToRecipient:(id)a3 lastContactDate:(id)a4
{
  -[PRPersonaStore _setHasVendedData:](self, "_setHasVendedData:", 1, a4);
  return (id)[0 dataForPropagation];
}

- (void)handleAppleIDEvent:(unint64_t)a3 account:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint32_t v10 = _PRGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 136315906;
    __int16 v17 = "-[PRPersonaStore handleAppleIDEvent:account:completion:]";
    __int16 v18 = 1024;
    int v19 = 523;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_213B6F000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Handling event %@ for account: %@\"", buf, 0x26u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke;
  v14[3] = &unk_2641DAE88;
  v14[4] = self;
  id v15 = v9;
  id v12 = v9;
  int v13 = (void (**)(void, void, void))MEMORY[0x216692240](v14);
  v13[2](v13, 1, 0);
}

void __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[PRPersonaStore handleAppleIDEvent:account:completion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 527;
    __int16 v21 = 2112;
    id v22 = v5;
    id v8 = "%s (%d) \"Error: %@\"";
    id v9 = v6;
    uint32_t v10 = 28;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[PRPersonaStore handleAppleIDEvent:account:completion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 529;
    id v8 = "%s (%d) \"Success.\"";
    id v9 = v6;
    uint32_t v10 = 18;
  }
  _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke_26;
    block[3] = &unk_2641DAE60;
    id v15 = v11;
    char v16 = a2;
    id v14 = v5;
    dispatch_async(v12, block);
  }
}

uint64_t __56__PRPersonaStore_handleAppleIDEvent_account_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)donateLikeness:(id)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = _PRGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[PRPersonaStore donateLikeness:forEmailAddress:completion:]";
    __int16 v19 = 1024;
    int v20 = 553;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Donation for email %@...\"", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke;
  v13[3] = &unk_2641DAEB0;
  id v15 = self;
  id v16 = v8;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = (void (**)(void, void, void))MEMORY[0x216692240](v13);
  v12[2](v12, 1, 0);
}

void __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 136315906;
    int v20 = "-[PRPersonaStore donateLikeness:forEmailAddress:completion:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 557;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v5;
    id v9 = "%s (%d) \"Donation failed for email %@. Error: %@\"";
    id v10 = v6;
    uint32_t v11 = 38;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 136315650;
    int v20 = "-[PRPersonaStore donateLikeness:forEmailAddress:completion:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 559;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    id v9 = "%s (%d) \"Donation succeeded for email %@.\"";
    id v10 = v6;
    uint32_t v11 = 28;
  }
  _os_log_impl(&dword_213B6F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  int v13 = (void *)a1[6];
  if (v13)
  {
    id v14 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke_27;
    block[3] = &unk_2641DAE60;
    id v17 = v13;
    char v18 = a2;
    id v16 = v5;
    dispatch_async(v14, block);
  }
}

uint64_t __60__PRPersonaStore_donateLikeness_forEmailAddress_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)donateLikeness:(id)a3 forPhoneNumber:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = _PRGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    char v18 = "-[PRPersonaStore donateLikeness:forPhoneNumber:completion:]";
    __int16 v19 = 1024;
    int v20 = 583;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Donation for phone number %@...\"", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke;
  v13[3] = &unk_2641DAEB0;
  id v15 = self;
  id v16 = v8;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  uint64_t v12 = (void (**)(void, void, void))MEMORY[0x216692240](v13);
  v12[2](v12, 1, 0);
}

void __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 136315906;
    int v20 = "-[PRPersonaStore donateLikeness:forPhoneNumber:completion:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 587;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v5;
    id v9 = "%s (%d) \"Donation failed for phone number %@. Error: %@\"";
    id v10 = v6;
    uint32_t v11 = 38;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 136315650;
    int v20 = "-[PRPersonaStore donateLikeness:forPhoneNumber:completion:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 589;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    id v9 = "%s (%d) \"Donation succeeded for phone number %@.\"";
    id v10 = v6;
    uint32_t v11 = 28;
  }
  _os_log_impl(&dword_213B6F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  int v13 = (void *)a1[6];
  if (v13)
  {
    id v14 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke_28;
    block[3] = &unk_2641DAE60;
    id v17 = v13;
    char v18 = a2;
    id v16 = v5;
    dispatch_async(v14, block);
  }
}

uint64_t __59__PRPersonaStore_donateLikeness_forPhoneNumber_completion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)likenessesWithExternalIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _PRGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "-[PRPersonaStore likenessesWithExternalIdentifier:completion:]";
    __int16 v18 = 1024;
    int v19 = 613;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up for external ID: %@\"", buf, 0x1Cu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke;
  v12[3] = &unk_2641DAED8;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint32_t v11 = (void (**)(void, void, void))MEMORY[0x216692240](v12);
  v11[2](v11, 0, 0);
}

void __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    id v21 = "-[PRPersonaStore likenessesWithExternalIdentifier:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 617;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    id v27 = v6;
    id v10 = "%s (%d) \"Lookup for external ID %@ failed. Error: %@\"";
    uint32_t v11 = v7;
    uint32_t v12 = 38;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v21 = "-[PRPersonaStore likenessesWithExternalIdentifier:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 619;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    id v10 = "%s (%d) \"Lookup for external ID %@ succeeded.\"";
    uint32_t v11 = v7;
    uint32_t v12 = 28;
  }
  _os_log_impl(&dword_213B6F000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  [*(id *)(a1 + 40) _setHasVendedData:1];
  id v14 = *(void **)(a1 + 48);
  if (v14)
  {
    id v15 = *(NSObject **)(*(void *)(a1 + 40) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke_29;
    block[3] = &unk_2641DADC0;
    id v19 = v14;
    id v17 = v5;
    id v18 = v6;
    dispatch_async(v15, block);
  }
}

uint64_t __62__PRPersonaStore_likenessesWithExternalIdentifier_completion___block_invoke_29(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)likenessWithUniqueID:(id)a3
{
  return 0;
}

- (void)screenNameForEmailAddress:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _PRGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[PRPersonaStore screenNameForEmailAddress:completion:]";
    __int16 v19 = 1024;
    int v20 = 667;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up with email: %@\"", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke;
  v13[3] = &unk_2641DAF00;
  id v15 = self;
  id v16 = v7;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  uint32_t v11 = (void (**)(void, void, void))MEMORY[0x216692240](v13);
  uint32_t v12 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9019);
  ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
}

void __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 136315906;
    __int16 v21 = "-[PRPersonaStore screenNameForEmailAddress:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 671;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    id v27 = v6;
    id v10 = "%s (%d) \"Lookup for %@ failed. Error: %@\"";
    uint32_t v11 = v7;
    uint32_t v12 = 38;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v13 = a1[4];
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[PRPersonaStore screenNameForEmailAddress:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 673;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    id v10 = "%s (%d) \"Lookup for %@ succeeded.\"";
    uint32_t v11 = v7;
    uint32_t v12 = 28;
  }
  _os_log_impl(&dword_213B6F000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  id v14 = (void *)a1[6];
  if (v14)
  {
    id v15 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke_30;
    block[3] = &unk_2641DADC0;
    id v19 = v14;
    id v17 = v5;
    id v18 = v6;
    dispatch_async(v15, block);
  }
}

uint64_t __55__PRPersonaStore_screenNameForEmailAddress_completion___block_invoke_30(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)screenNameForPhoneNumber:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _PRGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[PRPersonaStore screenNameForPhoneNumber:completion:]";
    __int16 v19 = 1024;
    int v20 = 698;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up with phone number: %@\"", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke;
  v13[3] = &unk_2641DAF00;
  id v15 = self;
  id v16 = v7;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  uint32_t v11 = (void (**)(void, void, void))MEMORY[0x216692240](v13);
  uint32_t v12 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9019);
  ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
}

void __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 136315906;
    __int16 v21 = "-[PRPersonaStore screenNameForPhoneNumber:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 702;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    id v27 = v6;
    id v10 = "%s (%d) \"Lookup for %@ failed. Error: %@\"";
    uint32_t v11 = v7;
    uint32_t v12 = 38;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v13 = a1[4];
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[PRPersonaStore screenNameForPhoneNumber:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 704;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    id v10 = "%s (%d) \"Lookup for %@ succeeded.\"";
    uint32_t v11 = v7;
    uint32_t v12 = 28;
  }
  _os_log_impl(&dword_213B6F000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  id v14 = (void *)a1[6];
  if (v14)
  {
    id v15 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke_33;
    block[3] = &unk_2641DADC0;
    id v19 = v14;
    id v17 = v5;
    id v18 = v6;
    dispatch_async(v15, block);
  }
}

uint64_t __54__PRPersonaStore_screenNameForPhoneNumber_completion___block_invoke_33(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)screenNameForPrimaryiCloudAccountWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _PRGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[PRPersonaStore screenNameForPrimaryiCloudAccountWithCompletion:]";
    __int16 v17 = 1024;
    int v18 = 729;
    _os_log_impl(&dword_213B6F000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint32_t v11 = __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke;
  uint32_t v12 = &unk_2641DAF28;
  uint64_t v13 = self;
  id v14 = v4;
  id v6 = v4;
  id v7 = (void (**)(void, void, void))MEMORY[0x216692240](&v9);
  BOOL v8 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9019, v9, v10, v11, v12, v13);
  ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
}

void __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[PRPersonaStore screenNameForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 733;
    __int16 v22 = 2112;
    id v23 = v6;
    uint64_t v9 = "%s (%d) \"Lookup failed. Error: %@\"";
    uint64_t v10 = v7;
    uint32_t v11 = 28;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[PRPersonaStore screenNameForPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 735;
    uint64_t v9 = "%s (%d) \"Lookup succeeded.\"";
    uint64_t v10 = v7;
    uint32_t v11 = 18;
  }
  _os_log_impl(&dword_213B6F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  uint32_t v12 = *(void **)(a1 + 40);
  if (v12)
  {
    uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke_34;
    block[3] = &unk_2641DADC0;
    id v17 = v12;
    id v15 = v5;
    id v16 = v6;
    dispatch_async(v13, block);
  }
}

uint64_t __66__PRPersonaStore_screenNameForPrimaryiCloudAccountWithCompletion___block_invoke_34(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)screenNameForAppleIDWithAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _PRGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v18 = "-[PRPersonaStore screenNameForAppleIDWithAltDSID:completion:]";
    __int16 v19 = 1024;
    int v20 = 760;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Looking up with altDSID: %@\"", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke;
  v13[3] = &unk_2641DAF00;
  id v15 = self;
  id v16 = v7;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  uint32_t v11 = (void (**)(void, void, void))MEMORY[0x216692240](v13);
  uint32_t v12 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9019);
  ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
}

void __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _PRGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 136315906;
    __int16 v21 = "-[PRPersonaStore screenNameForAppleIDWithAltDSID:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 764;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    id v27 = v6;
    id v10 = "%s (%d) \"Lookup for %@ failed. Error: %@\"";
    uint32_t v11 = v7;
    uint32_t v12 = 38;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v13 = a1[4];
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[PRPersonaStore screenNameForAppleIDWithAltDSID:completion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 766;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    id v10 = "%s (%d) \"Lookup for %@ succeeded.\"";
    uint32_t v11 = v7;
    uint32_t v12 = 28;
  }
  _os_log_impl(&dword_213B6F000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  id v14 = (void *)a1[6];
  if (v14)
  {
    id v15 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke_35;
    block[3] = &unk_2641DADC0;
    id v19 = v14;
    id v17 = v5;
    id v18 = v6;
    dispatch_async(v15, block);
  }
}

uint64_t __61__PRPersonaStore_screenNameForAppleIDWithAltDSID_completion___block_invoke_35(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setScreenName:(id)a3 forPrimaryiCloudAccountWithCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _PRGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[PRPersonaStore setScreenName:forPrimaryiCloudAccountWithCompletion:]";
    __int16 v18 = 1024;
    int v19 = 791;
    _os_log_impl(&dword_213B6F000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint32_t v12 = __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke;
  uint64_t v13 = &unk_2641DAE88;
  id v14 = self;
  id v15 = v5;
  id v7 = v5;
  BOOL v8 = (void (**)(void, void, void))MEMORY[0x216692240](&v10);
  uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9019, v10, v11, v12, v13, v14);
  ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
}

void __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[PRPersonaStore setScreenName:forPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 795;
    __int16 v21 = 2112;
    id v22 = v5;
    BOOL v8 = "%s (%d) \"Update failed. Error: %@\"";
    uint64_t v9 = v6;
    uint32_t v10 = 28;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[PRPersonaStore setScreenName:forPrimaryiCloudAccountWithCompletion:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 797;
    BOOL v8 = "%s (%d) \"Update succeeded.\"";
    uint64_t v9 = v6;
    uint32_t v10 = 18;
  }
  _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    uint32_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke_36;
    block[3] = &unk_2641DAE60;
    id v15 = v11;
    char v16 = a2;
    id v14 = v5;
    dispatch_async(v12, block);
  }
}

uint64_t __70__PRPersonaStore_setScreenName_forPrimaryiCloudAccountWithCompletion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setScreenName:(id)a3 forAppleIDWithAltDSID:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = _PRGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[PRPersonaStore setScreenName:forAppleIDWithAltDSID:completion:]";
    __int16 v20 = 1024;
    int v21 = 823;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Setting for altDSID: %@\"", buf, 0x1Cu);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke;
  v14[3] = &unk_2641DAEB0;
  char v16 = self;
  id v17 = v8;
  id v15 = v7;
  id v10 = v8;
  id v11 = v7;
  uint32_t v12 = (void (**)(void, void, void))MEMORY[0x216692240](v14);
  uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", -9019);
  ((void (**)(void, void, void *))v12)[2](v12, 0, v13);
}

void __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _PRGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "-[PRPersonaStore setScreenName:forAppleIDWithAltDSID:completion:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 827;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v5;
    uint64_t v9 = "%s (%d) \"Setting for %@ failed. Error: %@\"";
    id v10 = v6;
    uint32_t v11 = 38;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 136315650;
    __int16 v20 = "-[PRPersonaStore setScreenName:forAppleIDWithAltDSID:completion:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 829;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    uint64_t v9 = "%s (%d) \"Setting for %@ succeeded.\"";
    id v10 = v6;
    uint32_t v11 = 28;
  }
  _os_log_impl(&dword_213B6F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  uint64_t v13 = (void *)a1[6];
  if (v13)
  {
    id v14 = *(NSObject **)(a1[5] + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke_37;
    block[3] = &unk_2641DAE60;
    id v17 = v13;
    char v18 = a2;
    id v16 = v5;
    dispatch_async(v14, block);
  }
}

uint64_t __65__PRPersonaStore_setScreenName_forAppleIDWithAltDSID_completion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_startListeningForCacheChangeNotifications
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _PRGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    BOOL v7 = "-[PRPersonaStore _startListeningForCacheChangeNotifications]";
    __int16 v8 = 1024;
    int v9 = 854;
    _os_log_impl(&dword_213B6F000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", (uint8_t *)&v6, 0x12u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_PRHandleSelfCacheDidChange, @"PRCachedSelfValuesDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_PRHandleOtherCacheDidChange, @"PRCachedOtherValuesDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopListeningForCacheChangeNotifications
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _PRGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    BOOL v7 = "-[PRPersonaStore _stopListeningForCacheChangeNotifications]";
    __int16 v8 = 1024;
    int v9 = 862;
    _os_log_impl(&dword_213B6F000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", (uint8_t *)&v6, 0x12u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"PRCachedSelfValuesDidChangeNotification", 0);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"PRCachedOtherValuesDidChangeNotification", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyHandlingQueue, 0);
  objc_storeStrong((id *)&self->_serviceListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_dataVendingFlagLock, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_personaServiceConnection, 0);
}

@end