@interface RMBaseStore
+ (BOOL)supportsSecureCoding;
- (BOOL)dataSeparated;
- (BOOL)defaultToInteractive;
- (BOOL)isEqualToStore:(id)a3;
- (BOOL)isManagedStore;
- (BOOL)isValidDeclaration:(id)a3;
- (NSString)accountIdentifier;
- (NSString)identifier;
- (NSString)name;
- (NSString)personaIdentifier;
- (NSString)storeDescription;
- (NSURL)enrollmentURL;
- (RMBaseStore)initWithCoder:(id)a3;
- (RMBaseStore)initWithIdentifier:(id)a3 type:(int64_t)a4 scope:(int64_t)a5 name:(id)a6 description:(id)a7 enrollmentURL:(id)a8 accountIdentifier:(id)a9 defaultToInteractive:(BOOL)a10 dataSeparated:(BOOL)a11 personaIdentifier:(id)a12;
- (RMStoreXPCConnection)xpcConnection;
- (id)metadataReturningError:(id *)a3;
- (id)metadataValueForKey:(id)a3 error:(id *)a4;
- (int64_t)scope;
- (int64_t)type;
- (void)declarationManifestWithCompletionHandler:(id)a3;
- (void)declarationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationsWithCompletionHandler:(id)a3;
- (void)declarationsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setDataSeparated:(BOOL)a3;
- (void)setDefaultToInteractive:(BOOL)a3;
- (void)setEnrollmentURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setScope:(int64_t)a3;
- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 completionHandler:(id)a5;
- (void)setStoreDescription:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation RMBaseStore

- (RMBaseStore)initWithIdentifier:(id)a3 type:(int64_t)a4 scope:(int64_t)a5 name:(id)a6 description:(id)a7 enrollmentURL:(id)a8 accountIdentifier:(id)a9 defaultToInteractive:(BOOL)a10 dataSeparated:(BOOL)a11 personaIdentifier:(id)a12
{
  id v29 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a12;
  v30.receiver = self;
  v30.super_class = (Class)RMBaseStore;
  v21 = [(RMBaseStore *)&v30 init];
  if (v21)
  {
    uint64_t v22 = [v29 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v21->_type = a4;
    v21->_scope = a5;
    objc_storeStrong((id *)&v21->_name, a6);
    objc_storeStrong((id *)&v21->_storeDescription, a7);
    objc_storeStrong((id *)&v21->_enrollmentURL, a8);
    uint64_t v24 = [v19 copy];
    accountIdentifier = v21->_accountIdentifier;
    v21->_accountIdentifier = (NSString *)v24;

    v21->_defaultToInteractive = a10;
    v21->_dataSeparated = a11;
    objc_storeStrong((id *)&v21->_personaIdentifier, a12);
  }

  return v21;
}

- (BOOL)isManagedStore
{
  return [(RMBaseStore *)self type] != 2;
}

- (void)declarationManifestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RMBaseStore *)self xpcConnection];
  v6 = [v5 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke;
  v13[3] = &unk_26548F148;
  id v7 = v4;
  id v14 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v13];

  v9 = [(RMBaseStore *)self identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_29;
  v11[3] = &unk_26548F198;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v8 declarationManifestForStoreIdentifier:v9 completionHandler:v11];
}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_29_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched declaration manifest", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)declarationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(RMBaseStore *)self xpcConnection];
  v9 = [v8 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_26548F148;
  id v10 = v6;
  id v17 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v16];

  id v12 = [(RMBaseStore *)self identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_31;
  v14[3] = &unk_26548F1C0;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v11 declarationWithIdentifier:v7 storeIdentifier:v12 completionHandler:v14];
}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_31_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched declaration", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)declarationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMBaseStore *)self xpcConnection];
  id v6 = [v5 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke;
  v13[3] = &unk_26548F148;
  id v7 = v4;
  id v14 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v13];

  v9 = [(RMBaseStore *)self identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_33;
  v11[3] = &unk_26548F1E8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v8 declarationsForStoreIdentifier:v9 completionHandler:v11];
}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_33_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched declarations", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)declarationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(RMBaseStore *)self xpcConnection];
  v9 = [v8 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke;
  v16[3] = &unk_26548F148;
  id v10 = v6;
  id v17 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v16];

  id v12 = [(RMBaseStore *)self identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_35;
  v14[3] = &unk_26548F1E8;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v11 declarationsWithTypes:v7 storeIdentifier:v12 completionHandler:v14];
}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_35_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched declarations with types", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (BOOL)isValidDeclaration:(id)a3
{
  id v4 = (void *)MEMORY[0x263F63680];
  id v5 = a3;
  uint64_t v6 = [v4 currentPlatform];
  int64_t v7 = [(RMBaseStore *)self scope];
  int64_t v8 = [(RMBaseStore *)self type];
  v9 = objc_opt_class();

  return [v9 isSupportedForPlatform:v6 scope:v7 enrollmentType:v8];
}

- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(RMBaseStore *)self xpcConnection];
  v11 = [v10 connection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke;
  v18[3] = &unk_26548F148;
  id v12 = v8;
  id v19 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v18];

  id v14 = [(RMBaseStore *)self identifier];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_36;
  v16[3] = &unk_26548F0D0;
  void v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v13 setShouldInstallConfiguration:v9 shouldInstall:v5 storeIdentifier:v14 completionHandler:v16];
}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_36_cold_1();
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Set shouldInstallConfiguration", v5, 2u);
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RMBaseStore *)self xpcConnection];
  id v9 = [v8 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke;
  v16[3] = &unk_26548F148;
  id v10 = v6;
  id v17 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v16];

  id v12 = [(RMBaseStore *)self identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_37;
  v14[3] = &unk_26548F210;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v11 fetchDataAtURL:v7 storeIdentifier:v12 completionHandler:v14];
}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_37_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched data for URL", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (id)metadataReturningError:(id *)a3
{
  id v5 = [(RMBaseStore *)self xpcConnection];
  id v6 = [v5 connection];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];

  uint64_t v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy_;
  v24[3] = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x3032000000;
  v21[2] = __Block_byref_object_copy_;
  v21[3] = __Block_byref_object_dispose_;
  id v22 = 0;
  id v8 = [(RMBaseStore *)self identifier];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __38__RMBaseStore_metadataReturningError___block_invoke_39;
  v19[3] = &unk_26548F258;
  v19[4] = &v23;
  v19[5] = &v20;
  [v7 metadataForStoreIdentifier:v8 completionHandler:v19];

  if (*(void *)(v21[0] + 40))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      -[RMBaseStore metadataReturningError:]((uint64_t)v21, v9, v10, v11, v12, v13, v14, v15);
      if (a3)
      {
LABEL_4:
        id v16 = *(void **)(v21[0] + 40);
        if (v16)
        {
          id v17 = 0;
          *a3 = v16;
          goto LABEL_11;
        }
      }
    }
    else if (a3)
    {
      goto LABEL_4;
    }
    id v17 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    -[RMBaseStore metadataReturningError:]((uint64_t)v24);
  }
  id v17 = *(id *)(v24[0] + 40);
LABEL_11:
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v23, 8);
  return v17;
}

void __38__RMBaseStore_metadataReturningError___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __38__RMBaseStore_metadataReturningError___block_invoke_cold_1();
  }
}

void __38__RMBaseStore_metadataReturningError___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)metadataValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(RMBaseStore *)self xpcConnection];
  id v8 = [v7 connection];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __41__RMBaseStore_metadataValueForKey_error___block_invoke;
  v28[3] = &unk_26548F280;
  id v9 = v6;
  id v29 = v9;
  uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v28];

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v11 = [(RMBaseStore *)self identifier];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__RMBaseStore_metadataValueForKey_error___block_invoke_41;
  v15[3] = &unk_26548F2A8;
  v15[4] = &v22;
  v15[5] = &v16;
  [v10 metadataValueForKey:v9 storeIdentifier:v11 completionHandler:v15];

  if (v17[5])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      -[RMBaseStore metadataValueForKey:error:]();
      if (a4)
      {
LABEL_4:
        uint64_t v12 = (void *)v17[5];
        if (v12)
        {
          id v13 = 0;
          *a4 = v12;
          goto LABEL_11;
        }
      }
    }
    else if (a4)
    {
      goto LABEL_4;
    }
    id v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    -[RMBaseStore metadataValueForKey:error:]();
  }
  id v13 = (id)v23[5];
LABEL_11:
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __41__RMBaseStore_metadataValueForKey_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __41__RMBaseStore_metadataValueForKey_error___block_invoke_cold_1(a1, a2);
  }
}

void __41__RMBaseStore_metadataValueForKey_error___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMBaseStore)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"type"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"scope"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"enrollmentURL"];
  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"defaultToInteractive"];
  char v10 = [v9 BOOLValue];

  id v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"dataSeparated"];
  char v12 = [v11 BOOLValue];

  id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"personaIdentifier"];

  BYTE1(v16) = v12;
  LOBYTE(v16) = v10;
  uint64_t v14 = -[RMBaseStore initWithIdentifier:type:scope:name:description:enrollmentURL:accountIdentifier:defaultToInteractive:dataSeparated:personaIdentifier:](self, "initWithIdentifier:type:scope:name:description:enrollmentURL:accountIdentifier:defaultToInteractive:dataSeparated:personaIdentifier:", v4, v18, v17, v5, v6, v7, v8, v16, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = [(RMBaseStore *)self identifier];
  [v17 encodeObject:v4 forKey:@"identifier"];

  objc_msgSend(v17, "encodeInteger:forKey:", -[RMBaseStore type](self, "type"), @"type");
  objc_msgSend(v17, "encodeInteger:forKey:", -[RMBaseStore scope](self, "scope"), @"scope");
  id v5 = [(RMBaseStore *)self name];

  if (v5)
  {
    id v6 = [(RMBaseStore *)self name];
    [v17 encodeObject:v6 forKey:@"name"];
  }
  uint64_t v7 = [(RMBaseStore *)self storeDescription];

  if (v7)
  {
    id v8 = [(RMBaseStore *)self storeDescription];
    [v17 encodeObject:v8 forKey:@"description"];
  }
  uint64_t v9 = [(RMBaseStore *)self enrollmentURL];

  if (v9)
  {
    char v10 = [(RMBaseStore *)self enrollmentURL];
    [v17 encodeObject:v10 forKey:@"enrollmentURL"];
  }
  id v11 = [(RMBaseStore *)self accountIdentifier];

  if (v11)
  {
    char v12 = [(RMBaseStore *)self accountIdentifier];
    [v17 encodeObject:v12 forKey:@"accountIdentifier"];
  }
  id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[RMBaseStore defaultToInteractive](self, "defaultToInteractive"));
  [v17 encodeObject:v13 forKey:@"defaultToInteractive"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[RMBaseStore dataSeparated](self, "dataSeparated"));
  [v17 encodeObject:v14 forKey:@"dataSeparated"];

  uint64_t v15 = [(RMBaseStore *)self personaIdentifier];

  if (v15)
  {
    uint64_t v16 = [(RMBaseStore *)self personaIdentifier];
    [v17 encodeObject:v16 forKey:@"personaIdentifier"];
  }
}

- (BOOL)isEqualToStore:(id)a3
{
  id v4 = a3;
  id v5 = [(RMBaseStore *)self identifier];
  id v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    int64_t v7 = [(RMBaseStore *)self type];
    if (v7 == [v4 type])
    {
      id v8 = [(RMBaseStore *)self name];
      uint64_t v9 = [v4 name];
      id v10 = v8;
      id v11 = v9;
      char v12 = v11;
      if (v10 == v11)
      {
      }
      else
      {
        char v13 = 0;
        uint64_t v14 = v11;
        id v15 = v10;
        if (!v10 || !v11) {
          goto LABEL_35;
        }
        int v16 = [v10 isEqual:v11];

        if (!v16)
        {
          char v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
      }
      id v17 = [(RMBaseStore *)self storeDescription];
      uint64_t v18 = [v4 storeDescription];
      id v15 = v17;
      id v19 = v18;
      uint64_t v14 = v19;
      if (v15 == v19)
      {
      }
      else
      {
        char v13 = 0;
        uint64_t v20 = v19;
        id v21 = v15;
        if (!v15 || !v19) {
          goto LABEL_34;
        }
        int v22 = [v15 isEqual:v19];

        if (!v22)
        {
          char v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      uint64_t v23 = [(RMBaseStore *)self accountIdentifier];
      uint64_t v24 = [v4 accountIdentifier];
      id v21 = v23;
      id v25 = v24;
      id v39 = v25;
      if (v21 == v25)
      {
      }
      else
      {
        char v13 = 0;
        if (!v21)
        {
          v26 = v25;
          id v27 = 0;
          goto LABEL_32;
        }
        v26 = v25;
        id v27 = v21;
        if (!v25)
        {
LABEL_32:
          v35 = v27;

          goto LABEL_33;
        }
        v28 = v25;
        LODWORD(v37) = [v21 isEqual:v25];

        if (!v37)
        {
LABEL_24:
          char v13 = 0;
LABEL_33:
          uint64_t v20 = v39;
LABEL_34:

          goto LABEL_35;
        }
      }
      int v29 = [(RMBaseStore *)self defaultToInteractive];
      if (v29 != [v4 defaultToInteractive]) {
        goto LABEL_24;
      }
      int v30 = [(RMBaseStore *)self dataSeparated];
      if (v30 != [v4 dataSeparated]) {
        goto LABEL_24;
      }
      v31 = [(RMBaseStore *)self personaIdentifier];
      v32 = [v4 personaIdentifier];
      id v33 = v31;
      id v34 = v32;
      v38 = v34;
      if (v33 == v34)
      {
        char v13 = 1;
      }
      else
      {
        char v13 = 0;
        if (v33 && v34) {
          char v13 = [v33 isEqual:v34];
        }
      }

      v26 = v38;
      id v27 = v33;
      goto LABEL_32;
    }
  }
  char v13 = 0;
LABEL_37:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)storeDescription
{
  return self->_storeDescription;
}

- (void)setStoreDescription:(id)a3
{
}

- (NSURL)enrollmentURL
{
  return self->_enrollmentURL;
}

- (void)setEnrollmentURL:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)defaultToInteractive
{
  return self->_defaultToInteractive;
}

- (void)setDefaultToInteractive:(BOOL)a3
{
  self->_defaultToInteractive = a3;
}

- (BOOL)dataSeparated
{
  return self->_dataSeparated;
}

- (void)setDataSeparated:(BOOL)a3
{
  self->_dataSeparated = a3;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (RMStoreXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_enrollmentURL, 0);
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching declaration manifest: %{public}@", v1, v2, v3, v4, v5);
}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch declaration manifest: %{public}@", v1, v2, v3, v4, v5);
}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching declaration: %{public}@", v1, v2, v3, v4, v5);
}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch declaration: %{public}@", v1, v2, v3, v4, v5);
}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching declarations: %{public}@", v1, v2, v3, v4, v5);
}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch declarations: %{public}@", v1, v2, v3, v4, v5);
}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching declarations with types: %{public}@", v1, v2, v3, v4, v5);
}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch declarations with types: %{public}@", v1, v2, v3, v4, v5);
}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while setting shouldInstallConfiguration: %{public}@", v1, v2, v3, v4, v5);
}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to set shouldInstallConfiguration: %{public}@", v1, v2, v3, v4, v5);
}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while setting fetchDataAtURL: %{public}@", v1, v2, v3, v4, v5);
}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch data for URL: %{public}@", v1, v2, v3, v4, v5);
}

- (void)metadataReturningError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)a1 + 40);
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Read all metadata: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)metadataReturningError:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__RMBaseStore_metadataReturningError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while reading all metadata: %{public}@", v1, v2, v3, v4, v5);
}

- (void)metadataValueForKey:error:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Read metadata key %{public}@: %{public}@", v0, 0x16u);
}

- (void)metadataValueForKey:error:.cold.2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to read metadata key %{public}@: %{public}@", v0, 0x16u);
}

void __41__RMBaseStore_metadataValueForKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed XPC connection while reading metadata key %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end