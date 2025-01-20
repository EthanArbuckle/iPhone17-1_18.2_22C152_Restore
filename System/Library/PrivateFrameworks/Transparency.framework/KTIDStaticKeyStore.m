@interface KTIDStaticKeyStore
- (BOOL)addMapping:(id)a3 forKTId:(id)a4 error:(id *)a5;
- (BOOL)addStaticKeyEntry:(id)a3 contactServerPath:(id)a4 contactIdentifier:(id)a5 error:(id *)a6;
- (BOOL)removeEntryByContact:(id)a3 error:(id *)a4;
- (BOOL)removeEntryByContactIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeEntryByKDID:(id)a3 error:(id *)a4;
- (BOOL)removeMapping:(id)a3 forKTId:(id)a4 error:(id *)a5;
- (BOOL)resetCloudKit:(id *)a3;
- (BOOL)setContactServerPath:(id)a3 forKTId:(id)a4 error:(id *)a5;
- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5;
- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4;
- (BOOL)triggerSync:(id *)a3;
- (BOOL)updateStaticKeyEntry:(id)a3 contact:(id)a4 error:(id *)a5;
- (BOOL)updateStaticKeyEntry:(id)a3 contactServerPath:(id)a4 contactIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7;
- (id)findByContact:(id)a3 error:(id *)a4;
- (id)findByContactIdentifier:(id)a3 error:(id *)a4;
- (id)findByIdentifier:(id)a3 error:(id *)a4;
- (id)findKeyByContactsServerPath:(id)a3 contactIdentifier:(id)a4 error:(id *)a5;
- (id)findKeyByHandle:(id)a3 error:(id *)a4;
- (id)listKTID:(id *)a3;
- (id)mappings:(id)a3 error:(id *)a4;
- (id)validateByContact:(id)a3 error:(id *)a4;
- (id)validateByContactIdentifier:(id)a3 error:(id *)a4;
- (id)validateByIdentifier:(id)a3 error:(id *)a4;
@end

@implementation KTIDStaticKeyStore

- (BOOL)addMapping:(id)a3 forKTId:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)setContactServerPath:(id)a3 forKTId:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)addStaticKeyEntry:(id)a3 contactServerPath:(id)a4 contactIdentifier:(id)a5 error:(id *)a6
{
  return [(KTIDStaticKeyStore *)self updateStaticKeyEntry:a3 contactServerPath:a4 contactIdentifier:a5 mappings:MEMORY[0x263EFFA68] error:a6];
}

- (BOOL)updateStaticKeyEntry:(id)a3 contactServerPath:(id)a4 contactIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__6;
  v39 = __Block_byref_object_dispose__6;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke;
  v22[3] = &unk_26479F7C0;
  v27 = &v29;
  id v15 = v11;
  id v23 = v15;
  id v16 = v13;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v14;
  id v26 = v18;
  v28 = &v35;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_3;
  v21[3] = &unk_26479EB08;
  v21[4] = &v29;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v22 errorHandler:v21];
  uint64_t v19 = v36[5];
  if (a7 && !v19) {
    *a7 = (id) v30[5];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19 != 0;
}

void __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a3;
  v7 = v6;
  if (!a2 || v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
  }
  else
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_2;
    v12[3] = &unk_26479F798;
    long long v13 = *((_OWORD *)a1 + 4);
    [a2 updateStaticKeyEntry:v8 contactIdentifier:v9 contactExternalIdentifier:v10 mappings:v11 error:v12];
  }
}

void __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_16);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown updateStaticKeyEntry error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)updateStaticKeyEntry:(id)a3 contact:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  uint64_t v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  id v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke;
  v14[3] = &unk_26479F7E8;
  id v17 = &v19;
  id v9 = v7;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  id v18 = &v25;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_3;
  v13[3] = &unk_26479EB08;
  v13[4] = &v19;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v14 errorHandler:v13];
  uint64_t v11 = v26[5];
  if (a5 && !v11) {
    *a5 = (id) v20[5];
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11 != 0;
}

void __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_2;
    v9[3] = &unk_26479F798;
    long long v10 = *((_OWORD *)a1 + 3);
    [a2 updateStaticKeyEntry:v7 contact:v8 complete:v9];
  }
}

void __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  long long v10 = *v7;
  void *v7 = v9;
}

void __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_120_0);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown updateStaticKeyEntry error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)removeMapping:(id)a3 forKTId:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)removeEntryByKDID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v18;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v14;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_2_125;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v18;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v7 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v7;
}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_122);
    }
    uint64_t v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Connection removeEntryByKDID error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_123;
    v10[3] = &unk_26479F810;
    long long v11 = *(_OWORD *)(a1 + 40);
    [v5 removeEntryByKDID:v8 complete:v10];
  }
}

uint64_t __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_123(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_2_125(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_127_1);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByKDID error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)removeEntryByContactIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v18;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v14;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_2_131;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v18;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v7 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v7;
}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_129);
    }
    uint64_t v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Connection removeEntryByContactIdentifier error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_130;
    v10[3] = &unk_26479F810;
    long long v11 = *(_OWORD *)(a1 + 40);
    [v5 removeEntryByContactIdentifier:v8 complete:v10];
  }
}

uint64_t __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_130(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_2_131(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_133_0);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)removeEntryByContact:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v18;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v14;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_2_137;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v18;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v7 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v7;
}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_135_1);
    }
    uint64_t v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Connection removeEntryByContactIdentifier error: %@", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = v7;
    id v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) identifier];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_136;
    v12[3] = &unk_26479F810;
    long long v13 = *(_OWORD *)(a1 + 40);
    [v5 removeEntryByContactIdentifier:v8 complete:v12];
  }
}

uint64_t __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_136(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_2_137(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_139_1);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)findKeyByContactsServerPath:(id)a3 contactIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)findKeyByHandle:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v14;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v20;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_2_143;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v14;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_141_0);
    }
    uint64_t v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Connection findKeyByHandle error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_142;
    v10[3] = &unk_26479F798;
    long long v11 = *(_OWORD *)(a1 + 40);
    [v5 findStaticKeyStoreMappingByIDSURI:v8 complete:v10];
  }
}

uint64_t __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_142(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_2_143(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_145_0);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)findByContactIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v14;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v20;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_2_149;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v14;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_147);
    }
    uint64_t v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Connection findKeyByHandle error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_148;
    v10[3] = &unk_26479F798;
    long long v11 = *(_OWORD *)(a1 + 40);
    [v5 findStaticKeyStoreMappingByContactIdentifer:v8 complete:v10];
  }
}

uint64_t __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_2_149(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_151);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown findByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)findByContact:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__KTIDStaticKeyStore_findByContact_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v14;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v20;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__KTIDStaticKeyStore_findByContact_error___block_invoke_2_155;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v14;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_153_0);
    }
    uint64_t v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Connection findKeyByHandle error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__KTIDStaticKeyStore_findByContact_error___block_invoke_154;
    v10[3] = &unk_26479F798;
    long long v11 = *(_OWORD *)(a1 + 40);
    [v5 findStaticKeyStoreMappingByContact:v8 complete:v10];
  }
}

uint64_t __42__KTIDStaticKeyStore_findByContact_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke_2_155(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_157);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown findByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __42__KTIDStaticKeyStore_findByContact_error___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)findByIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v14;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v20;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_3;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v14;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_2;
    v8[3] = &unk_26479F798;
    long long v9 = *(_OWORD *)(a1 + 40);
    [a2 findStaticKeyStoreMappingByKey:v7 complete:v8];
  }
}

void __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_159);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown findByIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)validateByIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v14;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v20;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_3;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v14;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_2;
    v8[3] = &unk_26479F798;
    long long v9 = *(_OWORD *)(a1 + 40);
    [a2 validateStaticKeyStoreMappingByKey:v7 complete:v8];
  }
}

void __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_161);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown validateByIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)validateByContact:(id)a3 error:(id *)a4
{
  id v6 = [a3 identifier];
  int v7 = [(KTIDStaticKeyStore *)self validateByContactIdentifier:v6 error:a4];

  return v7;
}

- (id)validateByContactIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke;
  v10[3] = &unk_26479EAE0;
  id v12 = &v14;
  id v6 = v5;
  id v11 = v6;
  long long v13 = &v20;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_3;
  v9[3] = &unk_26479EB08;
  void v9[4] = &v14;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_2;
    v8[3] = &unk_26479F798;
    long long v9 = *(_OWORD *)(a1 + 40);
    [a2 validateStaticKeyStoreMappingByContactIdentifer:v7 complete:v8];
  }
}

void __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_163);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown validateByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)mappings:(id)a3 error:(id *)a4
{
  v4 = [(KTIDStaticKeyStore *)self findByIdentifier:a3 error:a4];
  uint64_t v5 = [v4 mappings];

  return v5;
}

- (id)listKTID:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__6;
  id v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__KTIDStaticKeyStore_listKTID___block_invoke;
  v7[3] = &unk_26479EBC8;
  v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__KTIDStaticKeyStore_listKTID___block_invoke_3;
  v6[3] = &unk_26479EB08;
  v6[4] = &v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v6];
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v4;
}

void __31__KTIDStaticKeyStore_listKTID___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__KTIDStaticKeyStore_listKTID___block_invoke_2;
    v7[3] = &unk_26479EC60;
    int8x16_t v8 = vextq_s8(a1[2], a1[2], 8uLL);
    [a2 listStaticKey:v7];
  }
}

void __31__KTIDStaticKeyStore_listKTID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __31__KTIDStaticKeyStore_listKTID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_166);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown listKTID error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __31__KTIDStaticKeyStore_listKTID___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6;
  uint64_t v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke;
  v12[3] = &unk_26479F838;
  uint64_t v14 = &v17;
  int v16 = a3;
  id v8 = v7;
  id v13 = v8;
  id v15 = &v23;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_3;
  v11[3] = &unk_26479EB08;
  v11[4] = &v17;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v12 errorHandler:v11];
  if (a5) {
    *a5 = (id) v18[5];
  }
  char v9 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

void __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = *(unsigned int *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_2;
    v9[3] = &unk_26479F810;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    [a2 setErrorCode:v7 forMapping:v8 complete:v9];
  }
}

void __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

void __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_168);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown setErrorCode error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)triggerSync:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__6;
  id v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__KTIDStaticKeyStore_triggerSync___block_invoke;
  v7[3] = &unk_26479EBC8;
  void v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__KTIDStaticKeyStore_triggerSync___block_invoke_3;
  v6[3] = &unk_26479EB08;
  v6[4] = &v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v6];
  if (a3) {
    *a3 = (id) v9[5];
  }
  char v4 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __34__KTIDStaticKeyStore_triggerSync___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__KTIDStaticKeyStore_triggerSync___block_invoke_2;
    v7[3] = &unk_26479F810;
    int8x16_t v8 = vextq_s8(a1[2], a1[2], 8uLL);
    [a2 staticKeyTriggerSync:v7];
  }
}

void __34__KTIDStaticKeyStore_triggerSync___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

void __34__KTIDStaticKeyStore_triggerSync___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_170_0);
  }
  char v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown triggerSync error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __34__KTIDStaticKeyStore_triggerSync___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke;
  v8[3] = &unk_26479F860;
  BOOL v9 = a3;
  void v8[4] = &v10;
  v8[5] = &v16;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_3;
  v7[3] = &unk_26479EB08;
  void v7[4] = &v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v8 errorHandler:v7];
  if (a4) {
    *a4 = (id) v11[5];
  }
  char v5 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v5;
}

void __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = a1[3].u8[0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_2;
    v8[3] = &unk_26479F810;
    int8x16_t v9 = vextq_s8(a1[2], a1[2], 8uLL);
    [a2 setupCloudSchema:v7 complete:v8];
  }
}

void __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

void __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_172);
  }
  char v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown setupCloudSchema error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)resetCloudKit:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__6;
  uint64_t v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__KTIDStaticKeyStore_resetCloudKit___block_invoke;
  v7[3] = &unk_26479EBC8;
  void v7[4] = &v8;
  void v7[5] = &v14;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_3;
  v6[3] = &unk_26479EB08;
  v6[4] = &v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v6];
  if (a3) {
    *a3 = (id) v9[5];
  }
  char v4 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __36__KTIDStaticKeyStore_resetCloudKit___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_2;
    v7[3] = &unk_26479F810;
    int8x16_t v8 = vextq_s8(a1[2], a1[2], 8uLL);
    [a2 resetCloudZone:v7];
  }
}

void __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

void __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_174);
  }
  char v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown resetCloudKit error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

@end