@interface PKBusinessChatController
+ (BOOL)deviceSupportsBusinessChat;
- (PKBusinessChatController)init;
- (void)_generateAuthBagWithCompletion:(id)a3;
- (void)openBusinessChatWithContext:(id)a3 completion:(id)a4;
@end

@implementation PKBusinessChatController

+ (BOOL)deviceSupportsBusinessChat
{
  return 1;
}

- (PKBusinessChatController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKBusinessChatController;
  v2 = [(PKBusinessChatController *)&v8 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (AKAnisetteProvisioningController *)objc_alloc_init(MEMORY[0x1E4F4EF58]);
    provisioningController = v2->_provisioningController;
    v2->_provisioningController = v5;
  }
  return v2;
}

- (void)openBusinessChatWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 businessIdentifier];
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke;
    aBlock[3] = &unk_1E59CCDC0;
    v9 = v6;
    v17 = v9;
    id v18 = v8;
    id v10 = v7;
    id v19 = v10;
    v11 = _Block_copy(aBlock);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v9 requiresAuthorization])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke_616;
      v13[3] = &unk_1E59CCDE8;
      id v14 = v11;
      id v15 = v10;
      [(PKBusinessChatController *)self _generateAuthBagWithCompletion:v13];
    }
    else
    {
      (*((void (**)(void *, void))v11 + 2))(v11, 0);
    }

    v12 = v17;
  }
  else
  {
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "No business identifier for business chat", buf, 2u);
    }
  }
}

void __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [*(id *)(a1 + 32) intentParameters];
    [v5 addEntriesFromDictionary:v6];
  }
  if (v3) {
    [v5 setObject:v3 forKeyedSubscript:@"authBag"];
  }
  v24 = v3;
  v23 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:0];
  id v7 = (void *)[[NSString alloc] initWithData:v23 encoding:4];
  objc_super v8 = _MergedGlobals_658();
  [v4 setObject:v7 forKey:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_opt_respondsToSelector())
  {
    id v10 = [*(id *)(a1 + 32) groupParameters];
    [v9 addEntriesFromDictionary:v10];
  }
  v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:0];
  v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  v13 = off_1EB545900();
  [v4 setObject:v12 forKey:v13];

  if (objc_opt_respondsToSelector())
  {
    id v14 = [*(id *)(a1 + 32) bodyText];
    if (v14)
    {
      id v15 = off_1EB545908();
      [v4 setObject:v14 forKey:v15];
    }
  }
  v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = [v4 description];
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Opening business chat, businessIdentifier: %@, parameters: %@", buf, 0x16u);
  }
  Class v19 = off_1EB545910();
  uint64_t v20 = *(void *)(a1 + 40);
  v21 = (void *)[v4 copy];
  [(objc_class *)v19 openTranscript:v20 intentParameters:v21];

  uint64_t v22 = *(void *)(a1 + 48);
  if (v22) {
    (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
  }
}

void __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke_616(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (!v7) {
      goto LABEL_6;
    }
    id v6 = *(void (**)(void))(v7 + 16);
  }
  v6();
LABEL_6:
}

- (void)_generateAuthBagWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F4EF40] sharedInstance];
    id v6 = [v5 primaryAuthKitAccount];
    uint64_t v7 = [v5 altDSIDForAccount:v6];
    id v8 = [MEMORY[0x1E4F179C8] defaultStore];
    id v9 = objc_msgSend(v8, "aida_accountForPrimaryiCloudAccount");
    id v10 = objc_msgSend(v9, "aida_tokenForService:", @"com.apple.gs.global.auth");
    if (v10)
    {
      v11 = [NSString stringWithFormat:@"AppleToken %@:%@", v7, v10];
    }
    else
    {
      v11 = 0;
    }
    provisioningController = self->_provisioningController;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__PKBusinessChatController__generateAuthBagWithCompletion___block_invoke;
    v14[3] = &unk_1E59CCE10;
    id v15 = v11;
    id v16 = v4;
    id v13 = v11;
    [(AKAnisetteProvisioningController *)provisioningController anisetteDataWithCompletion:v14];
  }
}

void __59__PKBusinessChatController__generateAuthBagWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v15 = objc_alloc_init(v3);
  id v5 = [v4 oneTimePassword];
  [v15 setObject:v5 forKeyedSubscript:@"X-Apple-I-MD"];

  id v6 = [v4 machineID];
  [v15 setObject:v6 forKeyedSubscript:@"X-Apple-I-MD-M"];

  uint64_t v7 = NSNumber;
  uint64_t v8 = [v4 routingInfo];

  id v9 = [v7 numberWithUnsignedLongLong:v8];
  id v10 = [v9 stringValue];
  [v15 setObject:v10 forKeyedSubscript:@"X-Apple-I-MD-RINFO"];

  v11 = [MEMORY[0x1E4F84A90] clientInfoHTTPHeader];
  [v15 setObject:v11 forKeyedSubscript:@"X-Apple-Client-Info"];

  [v15 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"Authorization"];
  v12 = PKSerialNumber();
  [v15 setObject:v12 forKeyedSubscript:@"X-Apple-Serial-Number"];

  id v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:0];
  id v14 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end