@interface NPKOpenURLRouter
+ (BOOL)canOpenURLInSafariForURL:(id)a3;
+ (void)openDeepLinkForURL:(id)a3 isSensitive:(BOOL)a4;
+ (void)openDeepLinkForURL:(id)a3 isSensitive:(BOOL)a4 completion:(id)a5;
+ (void)openURLInSafariForURL:(id)a3 fromNavigationController:(id)a4;
- (BOOL)_handleServiceModeRequestedForPassWithUniqueID:(id)a3;
- (BOOL)_handleShareForMailboxAddress:(id)a3 referralSource:(id)a4;
- (BOOL)_handleShareableCredentialsAcceptanceWithShareableCredentials:(id)a3 thumbnailImageData:(id)a4;
- (BOOL)_handleSubcredentialInvitationAcceptanceForLocalInvitationIdentifier:(id)a3 remoteInvitationIdentifier:(id)a4 contactName:(id)a5 thumbnailImageData:(id)a6;
- (BOOL)_handleUniversalLinkURLAsShoeboxURLForPathComponents:(id)a3 shouldParsePathComponents:(BOOL)a4 urlComponents:(id)a5;
- (BOOL)_isValidRelayServerURL:(id)a3 outPathComponents:(id *)a4;
- (BOOL)_presentEntitlementDetailsForPassUniqueID:(id)a3;
- (BOOL)_presentListActionsMenu;
- (BOOL)_presentPassBalanceDetailsForPassWiithUniqueID:(id)a3;
- (BOOL)_presentPassDetailsForPassWithUniqueID:(id)a3;
- (BOOL)_presentPassList;
- (BOOL)_presentPassListPreventAppUninstall;
- (BOOL)_presentProvisioningFlow;
- (BOOL)_presentSavingsDetailsWithPassUniqueID:(id)a3;
- (BOOL)_presentShareDetailsForPassUniqueID:(id)a3 shareIdentifier:(id)a4;
- (BOOL)_presentTransactionDetailsForPassWithUniqueID:(id)a3 transactionIdentifier:(id)a4;
- (BOOL)_presentTransactionDetailsForPassWithUniqueID:(id)a3 transactionServiceIdentifier:(id)a4 transactionSourceIdentifier:(id)a5;
- (BOOL)_processCardHostWithPathComponents:(id)a3 queryItems:(id)a4;
- (BOOL)_processDailyCashHostWithPathComponents:(id)a3 queryItems:(id)a4;
- (BOOL)_processPassUpdateHostWithPathComponents:(id)a3;
- (BOOL)_processPassesHostWithPathComponents:(id)a3 urlComponents:(id)a4;
- (BOOL)_processProvisioningContinuityHostWithPathComponents:(id)a3;
- (BOOL)_processSavingsHostWithPathComponents:(id)a3;
- (BOOL)_processShareHostWithPathComponents:(id)a3 urlComponents:(id)a4;
- (BOOL)_processShareableCredentialsHostWithQueryItems:(id)a3;
- (BOOL)_processShoeboxSchemeForHost:(id)a3 pathComponents:(id)a4 urlComponents:(id)a5;
- (BOOL)_processShoeboxSchemeForURL:(id)a3;
- (BOOL)_processSubcredentialInvitationHostWithQueryItems:(id)a3;
- (BOOL)_processTransactionHostWithQueryItems:(id)a3;
- (BOOL)handleOpenURL:(id)a3;
- (BOOL)handleUniversalLinkWithURL:(id)a3;
- (BOOL)handleUniversalLinkWithUserActivity:(id)a3;
- (NPKOpenURLRouter)initWithDelegate:(id)a3;
- (NPKOpenURLRouterDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation NPKOpenURLRouter

- (NPKOpenURLRouter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPKOpenURLRouter;
  v5 = [(NPKOpenURLRouter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (BOOL)handleOpenURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling URL: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  if ([(NPKOpenURLRouter *)self handleUniversalLinkWithURL:v4]) {
    goto LABEL_10;
  }
  objc_super v8 = [v4 scheme];
  if ([v8 isEqualToString:@"shoebox"])
  {
  }
  else
  {
    v9 = [v4 scheme];
    int v10 = [v9 isEqualToString:@"wallet"];

    if (!v10) {
      goto LABEL_12;
    }
  }
  if ([(NPKOpenURLRouter *)self _processShoeboxSchemeForURL:v4])
  {
LABEL_10:
    BOOL v11 = 1;
    goto LABEL_11;
  }
LABEL_12:
  v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  BOOL v11 = 0;
  if (v14)
  {
    v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Didn't understand URL: %@", (uint8_t *)&v16, 0xCu);
    }

    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (BOOL)handleUniversalLinkWithUserActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  int v6 = [v5 isEqual:*MEMORY[0x263F08658]];

  if (v6)
  {
    v7 = [v4 webpageURL];
    BOOL v8 = [(NPKOpenURLRouter *)self handleUniversalLinkWithURL:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)canOpenURLInSafariForURL:(id)a3
{
  return 0;
}

+ (void)openURLInSafariForURL:(id)a3 fromNavigationController:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([a1 canOpenURLInSafariForURL:v5] & 1) == 0)
  {
    int v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      BOOL v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: Unable to re-direct url: %@ to Safari.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

+ (void)openDeepLinkForURL:(id)a3 isSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [(id)objc_opt_class() openDeepLinkForURL:v5 isSensitive:v4 completion:0];
}

+ (void)openDeepLinkForURL:(id)a3 isSensitive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  int v9 = (void (**)(void, void))v8;
  if (v7)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F018D8]);
    [v10 setSensitive:v6];
    uint64_t v11 = [MEMORY[0x263F01880] defaultWorkspace];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__NPKOpenURLRouter_openDeepLinkForURL_isSensitive_completion___block_invoke;
    v12[3] = &unk_2644D41D0;
    id v13 = v7;
    BOOL v14 = v9;
    [v11 openURL:v13 configuration:v10 completionHandler:v12];

LABEL_5:
    goto LABEL_6;
  }
  if (v8)
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1007 userInfo:0];
    ((void (**)(void, id))v9)[2](v9, v10);
    goto LABEL_5;
  }
LABEL_6:
}

void __62__NPKOpenURLRouter_openDeepLinkForURL_isSensitive_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      int v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 138412546;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Failed to open deep link for url: %@ with error: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
  }
}

- (BOOL)handleUniversalLinkWithURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Attempting to handle URL: %@ as universal link", buf, 0xCu);
    }
  }
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v4 resolvingAgainstBaseURL:1];
  int v9 = [v8 scheme];
  if ([&unk_26D043790 containsObject:v9])
  {
    uint64_t v10 = [v8 URL];
    uint64_t v11 = [v10 pathComponents];

    id v22 = v11;
    BOOL v12 = [(NPKOpenURLRouter *)self _isValidRelayServerURL:v4 outPathComponents:&v22];
    id v13 = v22;

    if (!v12)
    {
      __int16 v14 = [v8 host];
      id v15 = (void *)*MEMORY[0x263F5C938];
      id v16 = v14;
      id v17 = v15;
      if (v16 == v17)
      {
      }
      else
      {
        uint64_t v18 = v17;
        if (!v16 || !v17)
        {

LABEL_16:
          BOOL v20 = 0;
          goto LABEL_17;
        }
        int v19 = [v16 isEqualToString:v17];

        if (!v19) {
          goto LABEL_16;
        }
      }
    }
    BOOL v20 = [(NPKOpenURLRouter *)self _handleUniversalLinkURLAsShoeboxURLForPathComponents:v13 shouldParsePathComponents:!v12 urlComponents:v8];
LABEL_17:

    goto LABEL_18;
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)_processShoeboxSchemeForURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 host];
  BOOL v6 = [v4 pathComponents];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v4 resolvingAgainstBaseURL:0];

  LOBYTE(self) = [(NPKOpenURLRouter *)self _processShoeboxSchemeForHost:v5 pathComponents:v6 urlComponents:v7];
  return (char)self;
}

- (BOOL)_processShoeboxSchemeForHost:(id)a3 pathComponents:(id)a4 urlComponents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 queryItems];
  if ([v8 isEqualToString:*MEMORY[0x263F5C900]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processCardHostWithPathComponents:v9 queryItems:v11];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F5C818]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processShareableCredentialsHostWithQueryItems:v11];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F5C4E8]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processSubcredentialInvitationHostWithQueryItems:v11];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F5C910]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processTransactionHostWithQueryItems:v11];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F5C8A0]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processShareHostWithPathComponents:v9 urlComponents:v10];
  }
  else if ([v8 isEqualToString:@"passes"])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processPassesHostWithPathComponents:v9 urlComponents:v10];
  }
  else if ([v8 isEqualToString:@"listActions"])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processListActionsMenuHostWithPathComponents:v9];
  }
  else if ([v8 isEqualToString:@"addCard"])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processAddCardHostWithPathComponents:v9];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F5C8F0]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processDailyCashHostWithPathComponents:v9 queryItems:v11];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F5C898]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processSavingsHostWithPathComponents:v9];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F5C8E8]])
  {
    BOOL v12 = [(NPKOpenURLRouter *)self _processPassUpdateHostWithPathComponents:v9];
  }
  else
  {
    if (![v8 isEqualToString:*MEMORY[0x263F5C890]])
    {
      BOOL v13 = 0;
      goto LABEL_26;
    }
    BOOL v12 = [(NPKOpenURLRouter *)self _processProvisioningContinuityHostWithPathComponents:v9];
  }
  BOOL v13 = v12;
LABEL_26:

  return v13;
}

- (BOOL)_processCardHostWithPathComponents:(id)a3 queryItems:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 == 3)
  {
    id v9 = [v6 objectAtIndexedSubscript:1];
    __int16 v14 = [v6 objectAtIndexedSubscript:2];
    id v15 = pk_General_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      id v17 = pk_General_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v14;
        __int16 v45 = 2112;
        v46 = v9;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Handling action %@ for pass ID %@", buf, 0x16u);
      }
    }
    if ([v14 isEqualToString:@"persistent_emulation"])
    {
      BOOL v18 = [(NPKOpenURLRouter *)self _handleServiceModeRequestedForPassWithUniqueID:v9];
    }
    else
    {
      if ([v14 isEqualToString:*MEMORY[0x263F5C908]])
      {
        v33 = v14;
        v34 = self;
        v35 = v9;
        id v36 = v7;
        id v37 = v6;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v19 = v7;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          id v22 = 0;
          uint64_t v23 = *(void *)v39;
          uint64_t v24 = *MEMORY[0x263F5C8D0];
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v39 != v23) {
                objc_enumerationMutation(v19);
              }
              v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              v27 = [v26 name];
              int v28 = [v27 isEqualToString:v24];

              if (v28)
              {
                v29 = [v26 value];
                uint64_t v30 = [v29 componentsSeparatedByString:@","];

                id v22 = (void *)v30;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v21);
        }
        else
        {
          id v22 = 0;
        }

        if ((unint64_t)[v22 count] > 1)
        {
          v31 = 0;
        }
        else
        {
          v31 = [v22 firstObject];
        }
        id v7 = v36;
        id v6 = v37;
        id v9 = v35;
        __int16 v14 = v33;
        BOOL v13 = [(NPKOpenURLRouter *)v34 _presentShareDetailsForPassUniqueID:v35 shareIdentifier:v31];

        goto LABEL_36;
      }
      if ([v14 isEqualToString:*MEMORY[0x263F5C8F8]])
      {
        BOOL v18 = [(NPKOpenURLRouter *)self _presentEntitlementDetailsForPassUniqueID:v9];
      }
      else
      {
        if (!PKPaymentPassActionTypeFromString())
        {

          BOOL v13 = 0;
          goto LABEL_37;
        }
        BOOL v18 = [(NPKOpenURLRouter *)self _presentPassDetailsForPassWithUniqueID:v9];
      }
    }
    BOOL v13 = v18;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  if (v8 == 2)
  {
    id v9 = [v6 lastObject];
    id v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      BOOL v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v9;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Handling regular pass with pass ID %@", buf, 0xCu);
      }
    }
    BOOL v13 = [(NPKOpenURLRouter *)self _presentPassDetailsForPassWithUniqueID:v9];
    goto LABEL_37;
  }
  BOOL v13 = 0;
LABEL_38:

  return v13;
}

- (BOOL)_processShareableCredentialsHostWithQueryItems:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v36 = self;
    id v7 = 0;
    v42 = 0;
    uint64_t v8 = *(void *)v50;
    id v9 = (void *)*MEMORY[0x263F5C810];
    uint64_t v10 = *MEMORY[0x263F081D0];
    v43 = (void *)*MEMORY[0x263F5C820];
    id v37 = v4;
    long long v38 = (void *)*MEMORY[0x263F5C810];
    uint64_t v39 = *(void *)v50;
    do
    {
      uint64_t v11 = 0;
      uint64_t v40 = v6;
      do
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
        BOOL v13 = [v12 name];
        if ([v9 isEqualToString:v13])
        {
          __int16 v14 = [v12 value];
          id v15 = objc_msgSend(v14, "pk_decodeHexadecimal");

          if (v15)
          {
            id v41 = v7;
            id v16 = objc_alloc(MEMORY[0x263F08928]);
            id v48 = 0;
            id v17 = (void *)[v16 initForReadingFromData:v15 error:&v48];
            id v18 = v48;
            if (v17) {
              BOOL v19 = v18 == 0;
            }
            else {
              BOOL v19 = 0;
            }
            if (v19)
            {
              id v22 = (void *)MEMORY[0x263EFFA08];
              uint64_t v23 = objc_opt_class();
              uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
              id v47 = 0;
              uint64_t v21 = [v17 decodeTopLevelObjectOfClasses:v24 forKey:v10 error:&v47];
              id v20 = v47;

              if (!v21)
              {
                uint64_t v25 = (void *)MEMORY[0x263EFFA08];
                uint64_t v26 = objc_opt_class();
                v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
                id v46 = v20;
                int v28 = [v17 decodeTopLevelObjectOfClasses:v27 forKey:v10 error:&v46];
                id v29 = v46;

                if (v28)
                {
                  uint64_t v21 = objc_msgSend(v28, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_14);
                }
                else
                {
                  uint64_t v21 = 0;
                }

                id v20 = v29;
              }
              id v4 = v37;
            }
            else
            {
              id v20 = v18;
              uint64_t v21 = (uint64_t)v42;
            }
            [v17 finishDecoding];

            v42 = (void *)v21;
            id v7 = v41;
            id v9 = v38;
            uint64_t v8 = v39;
          }

          uint64_t v6 = v40;
        }
        if ([v43 isEqualToString:v13])
        {
          uint64_t v30 = [v12 value];
          uint64_t v31 = objc_msgSend(v30, "pk_decodeHexadecimal");

          id v7 = (id)v31;
        }

        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v6);
    v32 = v42;
    if (v42)
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __67__NPKOpenURLRouter__processShareableCredentialsHostWithQueryItems___block_invoke_2;
      v44[3] = &unk_2644D4D18;
      id v7 = v7;
      id v45 = v7;
      v33 = objc_msgSend(v42, "pk_arrayByApplyingBlock:", v44);
    }
    else
    {
      v33 = 0;
    }
    self = v36;
  }
  else
  {
    v32 = 0;
    id v7 = 0;
    v33 = 0;
  }
  BOOL v34 = [(NPKOpenURLRouter *)self _handleShareableCredentialsAcceptanceWithShareableCredentials:v33 thumbnailImageData:v7];

  return v34;
}

uint64_t __67__NPKOpenURLRouter__processShareableCredentialsHostWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 encryptedPushProvisioningTarget];
}

id __67__NPKOpenURLRouter__processShareableCredentialsHostWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F5C0E0];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithEncryptedProvisioningTarget:v4 provisioningSharingIdentifier:0 passThumbnailImageData:*(void *)(a1 + 32)];

  return v5;
}

- (BOOL)_processSubcredentialInvitationHostWithQueryItems:(id)a3
{
  uint64_t v26 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    id v29 = 0;
    int v28 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v32;
    uint64_t v8 = (void *)*MEMORY[0x263F5C4D0];
    id v9 = (void *)*MEMORY[0x263F5C4E0];
    v27 = (void *)*MEMORY[0x263F5C4D8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        BOOL v12 = objc_msgSend(v11, "name", v26);
        int v13 = [v8 isEqualToString:v12];

        if (v13) {
          BOOL v14 = v6 == 0;
        }
        else {
          BOOL v14 = 0;
        }
        if (v14)
        {
          uint64_t v6 = [v11 value];
        }
        else
        {
          id v15 = [v11 name];
          int v16 = [v9 isEqualToString:v15];

          if (v16) {
            BOOL v17 = v5 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            uint64_t v5 = [v11 value];
          }
          else
          {
            id v18 = [v11 name];
            int v19 = [@"contact_name" isEqualToString:v18];

            if (v19) {
              BOOL v20 = v29 == 0;
            }
            else {
              BOOL v20 = 0;
            }
            if (v20)
            {
              id v29 = [v11 value];
            }
            else
            {
              uint64_t v21 = [v11 name];
              int v22 = [v27 isEqualToString:v21];

              if (v22 && !v28)
              {
                uint64_t v23 = [v11 value];
                int v28 = objc_msgSend(v23, "pk_decodeHexadecimal");
              }
            }
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
    id v29 = 0;
    int v28 = 0;
    uint64_t v6 = 0;
  }
  BOOL v24 = -[NPKOpenURLRouter _handleSubcredentialInvitationAcceptanceForLocalInvitationIdentifier:remoteInvitationIdentifier:contactName:thumbnailImageData:](v26, "_handleSubcredentialInvitationAcceptanceForLocalInvitationIdentifier:remoteInvitationIdentifier:contactName:thumbnailImageData:", v6, v5, v29, v28, v26);

  return v24;
}

- (BOOL)_processTransactionHostWithQueryItems:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__10;
  id v47 = __Block_byref_object_dispose__10;
  id v48 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  long long v31 = self;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (v4)
  {
    uint64_t v8 = *(void *)v40;
    id v9 = (void *)*MEMORY[0x263F5C8C0];
    long long v34 = (void *)*MEMORY[0x263F5C8D8];
    long long v33 = (void *)*MEMORY[0x263F5C8C8];
    long long v32 = (void *)*MEMORY[0x263F5C8E0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (v44[5]
          || ([*(id *)(*((void *)&v39 + 1) + 8 * i) name],
              BOOL v12 = objc_claimAutoreleasedReturnValue(),
              int v13 = [v9 isEqualToString:v12],
              v12,
              !v13))
        {
          if (v7
            || ([v11 name],
                int v16 = objc_claimAutoreleasedReturnValue(),
                int v17 = [v34 isEqualToString:v16],
                v16,
                !v17))
          {
            if (v6
              || ([v11 name],
                  id v18 = objc_claimAutoreleasedReturnValue(),
                  int v19 = [v33 isEqualToString:v18],
                  v18,
                  !v19))
            {
              if (!v5)
              {
                BOOL v20 = [v11 name];
                int v21 = [v32 isEqualToString:v20];

                if (v21)
                {
                  uint64_t v5 = [v11 value];
                }
                else
                {
                  uint64_t v5 = 0;
                }
              }
            }
            else
            {
              uint64_t v6 = [v11 value];
            }
          }
          else
          {
            uint64_t v7 = [v11 value];
          }
        }
        else
        {
          uint64_t v14 = [v11 value];
          id v15 = (void *)v44[5];
          v44[5] = v14;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v4);
  }

  int v22 = dispatch_group_create();
  if (!v44[5])
  {
    if ([v7 length])
    {
      dispatch_group_enter(v22);
      id v23 = objc_alloc_init(MEMORY[0x263F5C0A8]);
      BOOL v24 = v38;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke;
      v38[3] = &unk_2644D4D40;
      v38[5] = &v43;
      v38[4] = v22;
      [v23 passUniqueIdentifierForTransactionWithIdentifier:v7 completion:v38];
    }
    else
    {
      if (![v6 length])
      {
        BOOL v29 = 0;
        goto LABEL_34;
      }
      dispatch_group_enter(v22);
      id v23 = objc_alloc_init(MEMORY[0x263F5C0A8]);
      if ([v5 length])
      {
        BOOL v24 = v37;
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_2;
        v37[3] = &unk_2644D4D40;
        v37[5] = &v43;
        v37[4] = v22;
        [v23 passUniqueIdentifierForTransactionWithServiceIdentifier:v6 transactionSourceIdentifier:v5 completion:v37];
      }
      else
      {
        BOOL v24 = v36;
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_3;
        v36[3] = &unk_2644D4D40;
        v36[5] = &v43;
        v36[4] = v22;
        [v23 ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:v6 completion:v36];
      }
    }
  }
  dispatch_time_t v25 = dispatch_time(0, 300000000000);
  dispatch_group_wait(v22, v25);
  if ([v7 length])
  {
    BOOL v26 = [(NPKOpenURLRouter *)v31 _presentTransactionDetailsForPassWithUniqueID:v44[5] transactionIdentifier:v7];
  }
  else
  {
    uint64_t v27 = [v6 length];
    uint64_t v28 = v44[5];
    if (v27) {
      BOOL v26 = [(NPKOpenURLRouter *)v31 _presentTransactionDetailsForPassWithUniqueID:v28 transactionServiceIdentifier:v6 transactionSourceIdentifier:v5];
    }
    else {
      BOOL v26 = [(NPKOpenURLRouter *)v31 _presentPassDetailsForPassWithUniqueID:v28];
    }
  }
  BOOL v29 = v26;
LABEL_34:

  _Block_object_dispose(&v43, 8);
  return v29;
}

void __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)_processShareHostWithPathComponents:(id)a3 urlComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 == 2)
  {
    id v9 = [v6 objectAtIndexedSubscript:1];
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v10 = v8;
    if (v8 < 3)
    {
      id v9 = 0;
LABEL_17:
      id v22 = 0;
      goto LABEL_18;
    }
    id v11 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v12 = 1;
    do
    {
      int v13 = [v6 objectAtIndexedSubscript:v12];
      uint64_t v14 = v13;
      if (v13 == @"https:"
        || v13
        && (int v15 = [(__CFString *)v13 isEqualToString:@"https:"], v14, v15))
      {
        [v11 appendFormat:@"%@//", v14];
      }
      else
      {
        [v11 appendFormat:@"%@/", v14];
      }

      ++v12;
    }
    while (v10 != v12);
    int v16 = [v7 fragment];
    [v11 appendFormat:@"#%@", v16];

    id v9 = (void *)[v11 copy];
    if (!v9) {
      goto LABEL_17;
    }
  }
  int v17 = [v7 queryItems];
  id v18 = objc_msgSend(v17, "pk_firstObjectPassingTest:", &__block_literal_global_105);

  uint64_t v19 = [v18 value];
  BOOL v20 = (void *)v19;
  int v21 = (void *)*MEMORY[0x263F5C488];
  if (v19) {
    int v21 = (void *)v19;
  }
  id v22 = v21;

LABEL_18:
  BOOL v23 = [(NPKOpenURLRouter *)self _handleShareForMailboxAddress:v9 referralSource:v22];

  return v23;
}

uint64_t __70__NPKOpenURLRouter__processShareHostWithPathComponents_urlComponents___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = (void *)*MEMORY[0x263F5C8B0];
  id v4 = v2;
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    if (v4 && v5) {
      uint64_t v7 = [v4 isEqualToString:v5];
    }
  }

  return v7;
}

- (BOOL)_processPassesHostWithPathComponents:(id)a3 urlComponents:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 count] == 2)
  {
    id v6 = [v5 lastObject];
    if ([v6 isEqualToString:@"preventAppUninstall"])
    {
      BOOL v7 = [(NPKOpenURLRouter *)self _presentPassListPreventAppUninstall];
    }
    else
    {
      id v9 = pk_General_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v10)
      {
        id v11 = pk_General_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138412290;
          uint64_t v14 = v6;
          _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: Cannot handle unsupported pass list action: %@. Presenting pass list.", (uint8_t *)&v13, 0xCu);
        }
      }
      BOOL v7 = [(NPKOpenURLRouter *)self _presentPassList];
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = [(NPKOpenURLRouter *)self _presentPassList];
  }

  return v8;
}

- (BOOL)_processDailyCashHostWithPathComponents:(id)a3 queryItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] < 2)
  {
    id v9 = [v7 npkFindFirstObjectMatchingCondition:&__block_literal_global_107];
    BOOL v10 = v9;
    if (v9)
    {
      BOOL v8 = [v9 value];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = [v6 objectAtIndexedSubscript:1];
  }
  BOOL v11 = [(NPKOpenURLRouter *)self _presentPassBalanceDetailsForPassWiithUniqueID:v8];

  return v11;
}

uint64_t __71__NPKOpenURLRouter__processDailyCashHostWithPathComponents_queryItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F5C8C0]];

  return v3;
}

- (BOOL)_processSavingsHostWithPathComponents:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__10;
  BOOL v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  id v5 = [MEMORY[0x263F5BCE8] sharedInstance];
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __58__NPKOpenURLRouter__processSavingsHostWithPathComponents___block_invoke;
  int v13 = &unk_2644D4D88;
  uint64_t v15 = &v16;
  id v7 = v6;
  uint64_t v14 = v7;
  [v5 defaultAccountForFeature:2 completion:&v10];
  dispatch_time_t v8 = dispatch_time(0, 300000000000);
  dispatch_group_wait(v7, v8);
  LOBYTE(self) = -[NPKOpenURLRouter _presentSavingsDetailsWithPassUniqueID:](self, "_presentSavingsDetailsWithPassUniqueID:", v17[5], v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __58__NPKOpenURLRouter__processSavingsHostWithPathComponents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) fetched account %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if (v3)
  {
    uint64_t v7 = [v3 associatedPassUniqueID];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      uint64_t v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v14 = 138412290;
        id v15 = v13;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Found account with card unique id %@ ", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)_processPassUpdateHostWithPathComponents:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count] == 2)
  {
    BOOL v5 = [v4 lastObject];
    id v6 = [MEMORY[0x263F5BF80] sharedInstance];
    uint64_t v7 = [v6 diffForPassUpdateUserNotificationWithIdentifier:v5];
    uint64_t v8 = [v7 passUniqueID];
    if ([v8 length])
    {
      id v9 = pk_General_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        BOOL v11 = pk_General_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          uint64_t v19 = v8;
          _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Successfully retrieved passUniqueID from notificationID: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      BOOL v12 = [(NPKOpenURLRouter *)self _presentPassDetailsForPassWithUniqueID:v8];
    }
    else
    {
      BOOL v12 = [(NPKOpenURLRouter *)self _presentPassList];
    }
    BOOL v16 = v12;
  }
  else
  {
    int v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Unsupported pass update notification. Presenting pass list instead.", (uint8_t *)&v18, 2u);
      }
    }
    BOOL v16 = [(NPKOpenURLRouter *)self _presentPassList];
  }

  return v16;
}

- (BOOL)_processProvisioningContinuityHostWithPathComponents:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 == 2)
  {
    BOOL v5 = [v3 lastObject];
    id v6 = objc_alloc_init(MEMORY[0x263F5C0A8]);
    uint64_t v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__NPKOpenURLRouter__processProvisioningContinuityHostWithPathComponents___block_invoke;
    v13[3] = &unk_2644D2910;
    BOOL v14 = v7;
    uint64_t v8 = v7;
    [v6 userNotificationActionPerformed:2 notificationIdentifier:v5 completion:v13];
    dispatch_time_t v9 = dispatch_time(0, 300000000000);
    dispatch_group_wait(v8, v9);

LABEL_6:
    goto LABEL_7;
  }
  BOOL v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Unable to handle provisioningContinuity url with path components: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v4 == 2;
}

void __73__NPKOpenURLRouter__processProvisioningContinuityHostWithPathComponents___block_invoke(uint64_t a1)
{
}

- (BOOL)_presentPassDetailsForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    id v6 = [(NPKOpenURLRouter *)self delegate];
    [v6 urlRouter:self requestPassDetailsPresentationForPassWithUniqueID:v4];
  }
  return v5 != 0;
}

- (BOOL)_handleServiceModeRequestedForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    id v6 = [(NPKOpenURLRouter *)self delegate];
    [v6 urlRouter:self requestServiceModeForPassWithUniqueID:v4];
  }
  return v5 != 0;
}

- (BOOL)_presentShareDetailsForPassUniqueID:(id)a3 shareIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8)
  {
    dispatch_time_t v9 = [(NPKOpenURLRouter *)self delegate];
    [v9 urlRouter:self requestShareDetailsPresentationForPassWithUniqueID:v6 shareIdentifier:v7];
  }
  return v8 != 0;
}

- (BOOL)_presentEntitlementDetailsForPassUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    id v6 = [(NPKOpenURLRouter *)self delegate];
    [v6 urlRouter:self requestEntitlementDetailsPresentationForPassWithUniqueID:v4];
  }
  return v5 != 0;
}

- (BOOL)_handleShareableCredentialsAcceptanceWithShareableCredentials:(id)a3 thumbnailImageData:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [(NPKOpenURLRouter *)self delegate];
    [v8 urlRouter:self requestShareableCredentialAcceptanceFlowPresentationWithShareableCredentials:v7 thumbnailImageData:v6];
  }
  return a3 != 0;
}

- (BOOL)_handleSubcredentialInvitationAcceptanceForLocalInvitationIdentifier:(id)a3 remoteInvitationIdentifier:(id)a4 contactName:(id)a5 thumbnailImageData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 length];
  if (v14)
  {
    id v15 = [(NPKOpenURLRouter *)self delegate];
    [v15 urlRouter:self requestSubcredentialInvitationAcceptanceFlowPresentationWithLocalInvitationIdentifier:v10 remoteInvitationIdentifier:v11 contactName:v12 thumbnailImageData:v13];
  }
  return v14 != 0;
}

- (BOOL)_handleShareForMailboxAddress:(id)a3 referralSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8)
  {
    dispatch_time_t v9 = [(NPKOpenURLRouter *)self delegate];
    [v9 urlRouter:self requestSharedInvitationAcceptanceFlowPresentationWithMailboxAddress:v6 referralSource:v7];
  }
  return v8 != 0;
}

- (BOOL)_presentTransactionDetailsForPassWithUniqueID:(id)a3 transactionServiceIdentifier:(id)a4 transactionSourceIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 length];
  if (v11)
  {
    id v12 = [(NPKOpenURLRouter *)self delegate];
    [v12 urlRouter:self requestTransactionDetailsForPassWithUniqueID:v8 transactionServiceIdentifier:v9 transactionSourceIdentifier:v10];
  }
  return v11 != 0;
}

- (BOOL)_presentTransactionDetailsForPassWithUniqueID:(id)a3 transactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8)
  {
    id v9 = [(NPKOpenURLRouter *)self delegate];
    [v9 urlRouter:self requestTransactionDetailsForPassWithUniqueID:v6 transactionIdentifier:v7];
  }
  return v8 != 0;
}

- (BOOL)_presentPassList
{
  id v3 = [(NPKOpenURLRouter *)self delegate];
  [v3 requestPassListForURLRouter:self];

  return 1;
}

- (BOOL)_presentListActionsMenu
{
  id v3 = [(NPKOpenURLRouter *)self delegate];
  [v3 requestListActionsMenuForURLRouter:self];

  return 1;
}

- (BOOL)_presentPassListPreventAppUninstall
{
  id v3 = [(NPKOpenURLRouter *)self delegate];
  [v3 requestPassListPreventAppUninstallForURLRouter:self];

  return 1;
}

- (BOOL)_presentProvisioningFlow
{
  id v3 = [(NPKOpenURLRouter *)self delegate];
  [v3 requestProvisioningFlowForURLRouter:self];

  return 1;
}

- (BOOL)_presentPassBalanceDetailsForPassWiithUniqueID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    id v6 = [(NPKOpenURLRouter *)self delegate];
    [v6 urlRouter:self requestPassBalanceDetailsPresentationForPassWithUniqueID:v4];
  }
  else
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Could not find pass with uniqueID: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  return v5 != 0;
}

- (BOOL)_presentSavingsDetailsWithPassUniqueID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    id v6 = [(NPKOpenURLRouter *)self delegate];
    [v6 urlRouter:self requestSavingsDetailsPresentationWithPassUniqueID:v4];
  }
  else
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Could not find card with uniqueID: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  return v5 != 0;
}

- (BOOL)_isValidRelayServerURL:(id)a3 outPathComponents:(id *)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F5C0A8]);
  id v7 = [v6 sharedPaymentWebServiceContext];
  BOOL v8 = [v7 configuration];
  id v9 = PKCurrentRegion();
  id v10 = [v8 allowedRelayServerHostsForRegion:v9];

  int v11 = [v5 host];
  if ([v10 containsObject:v11])
  {
    BOOL v24 = a4;
    id v12 = [NSString alloc];
    uint64_t v13 = (void *)[v12 initWithFormat:@"/v%@/%@/", *MEMORY[0x263F5C830], *MEMORY[0x263F5C828]];
    uint64_t v14 = (void *)*MEMORY[0x263F5C938];
    id v15 = v11;
    id v16 = v14;
    if (v15 == v16)
    {
    }
    else
    {
      uint64_t v17 = v16;
      if (!v15 || !v16)
      {

        goto LABEL_12;
      }
      int v18 = [v15 isEqualToString:v16];

      if (!v18) {
        goto LABEL_12;
      }
    }
    uint64_t v20 = [v5 path];
    int v21 = [v20 hasPrefix:v13];

    if (!v21)
    {
      BOOL v19 = 0;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v25[0] = *MEMORY[0x263F5C8A0];
    id v22 = [v5 absoluteString];
    v25[1] = v22;
    *BOOL v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

    BOOL v19 = 1;
    goto LABEL_13;
  }
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (BOOL)_handleUniversalLinkURLAsShoeboxURLForPathComponents:(id)a3 shouldParsePathComponents:(BOOL)a4 urlComponents:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 count];
  unint64_t v11 = v10;
  if (!v6)
  {
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  if (v10 < 1) {
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  while (1)
  {
    uint64_t v13 = [v8 objectAtIndexedSubscript:v12];
    if (![v13 isEqualToString:@"/"]) {
      break;
    }

LABEL_7:
    if (v11 == ++v12) {
      goto LABEL_8;
    }
  }
  int v14 = [v13 isEqualToString:@"apple-card"];

  if (v14) {
    goto LABEL_7;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_13;
  }
LABEL_10:
  id v16 = [v8 objectAtIndexedSubscript:v12];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v17 addObject:@"/"];
  unint64_t v18 = v12 + 1;
  if (v18 < v11)
  {
    do
    {
      BOOL v19 = [v8 objectAtIndexedSubscript:v18];
      [v17 addObject:v19];

      ++v18;
    }
    while (v11 != v18);
  }
  BOOL v15 = [(NPKOpenURLRouter *)self _processShoeboxSchemeForHost:v16 pathComponents:v17 urlComponents:v9];

LABEL_13:
  return v15;
}

- (NPKOpenURLRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKOpenURLRouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end