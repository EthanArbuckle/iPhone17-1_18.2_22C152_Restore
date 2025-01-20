@interface MFAddressAtomStatusManager
+ (BOOL)shouldDecorateAtomListForSender:(id)a3 replyTo:(id)a4;
- (BOOL)_atomContainsVIPSender:(id)a3;
- (EMAccount)account;
- (EMSecurityInformation)securityInformation;
- (MFAddressAtomProvider)atomProvider;
- (MFAddressAtomStatusManager)initWithAccount:(id)a3;
- (MailAccount)legacyAccount;
- (NSArray)replyToList;
- (NSError)smimeError;
- (id)otherSigners;
- (int)actionForTrustInformation:(id)a3;
- (void)_commonInit;
- (void)_invalidateAtoms;
- (void)_legacyAccountsDidChange:(id)a3;
- (void)_updateAtomsInList:(id)a3;
- (void)_updateOtherSignersList:(id)a3;
- (void)_updateVIPStatus;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setAtomProvider:(id)a3;
- (void)setLegacyAccount:(id)a3;
- (void)setReplyToList:(id)a3;
- (void)setSMIMEError:(id)a3;
- (void)setSecurityInformation:(id)a3;
- (void)updateTrustForDisplayedAtoms;
- (void)updateWithReplyToInformation:(id)a3;
- (void)updateWithSecurityInformation:(id)a3;
@end

@implementation MFAddressAtomStatusManager

+ (BOOL)shouldDecorateAtomListForSender:(id)a3 replyTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] == 1 && objc_msgSend(v5, "count"))
  {
    v7 = [v6 firstObject];
    v8 = [v7 emailAddressValue];
    v9 = [v8 displayName];
    v10 = [v5 firstObject];
    v11 = [v10 emailAddressValue];
    uint64_t v12 = [v11 displayName];
    char v13 = [v9 isEqualToString:v12];

    v14 = [v6 firstObject];
    v15 = [v14 emailAddressValue];
    v16 = [v15 simpleAddress];
    v17 = [v5 firstObject];
    v18 = [v17 emailAddressValue];
    v19 = [v18 simpleAddress];
    LOBYTE(v12) = [v16 isEqualToString:v19];

    char v20 = v13 & (v12 ^ 1);
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (MFAddressAtomStatusManager)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFAddressAtomStatusManager;
  id v6 = [(MFAddressAtomStatusManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    [(MFAddressAtomStatusManager *)v7 _commonInit];
  }

  return v7;
}

- (void)_commonInit
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__trustDidChange_ name:*MEMORY[0x1E4F77AF0] object:0];
  [v5 addObserver:self selector:sel__legacyAccountsDidChange_ name:*MEMORY[0x1E4F60630] object:0];
  v3 = +[VIPManager defaultInstance];
  [v5 addObserver:self selector:sel__vipSendersDidChange_ name:*MEMORY[0x1E4F601C8] object:v3];

  v4 = [MEMORY[0x1E4F350B8] sharedManager];
  [v4 addClient:self];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F350B8] sharedManager];
  [v3 removeClient:self];

  v4.receiver = self;
  v4.super_class = (Class)MFAddressAtomStatusManager;
  [(MFAddressAtomStatusManager *)&v4 dealloc];
}

- (void)setAtomProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_atomProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_atomProvider, obj);
    [(MFAddressAtomStatusManager *)self updateTrustForDisplayedAtoms];
  }
}

- (void)_invalidateAtoms
{
  id v2 = [(MFAddressAtomStatusManager *)self atomProvider];
  [v2 iterateDisplayedAtomListsWithBlock:&__block_literal_global_1];
}

uint64_t __46__MFAddressAtomStatusManager__invalidateAtoms__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addressBookDidChange:0];
}

- (void)updateWithSecurityInformation:(id)a3
{
  id v5 = a3;
  -[MFAddressAtomStatusManager setSecurityInformation:](self, "setSecurityInformation:");
  objc_super v4 = [v5 smimeError];
  [(MFAddressAtomStatusManager *)self setSMIMEError:v4];

  [(MFAddressAtomStatusManager *)self updateTrustForDisplayedAtoms];
}

- (id)otherSigners
{
  id v2 = [(MFAddressAtomStatusManager *)self securityInformation];
  v3 = [v2 signers];

  if ((unint64_t)[v3 count] < 2)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    objc_super v4 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
  }

  return v4;
}

- (void)updateTrustForDisplayedAtoms
{
  v3 = [(MFAddressAtomStatusManager *)self atomProvider];
  objc_super v4 = [(MFAddressAtomStatusManager *)self securityInformation];
  id v5 = [v4 signers];

  if ((unint64_t)[v5 count] >= 2)
  {
    id v6 = [(MFAddressAtomStatusManager *)self otherSigners];
    v7 = objc_msgSend(v6, "ef_map:", &__block_literal_global_53);

    [v3 setOtherSigners:v7];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MFAddressAtomStatusManager_updateTrustForDisplayedAtoms__block_invoke_2;
  v8[3] = &unk_1E6D1AE08;
  v8[4] = self;
  [v3 iterateDisplayedAtomListsWithBlock:v8];
}

id __58__MFAddressAtomStatusManager_updateTrustForDisplayedAtoms__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 signingCertificateTrustInfo];
  v3 = [v2 sender];

  return v3;
}

uint64_t __58__MFAddressAtomStatusManager_updateTrustForDisplayedAtoms__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateAtomsInList:a2];
}

- (void)_updateOtherSignersList:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F60808]);
  [v29 setShouldIncludeDisplayName:1];
  v32 = [v27 addressAtoms];
  v26 = [(MFAddressAtomStatusManager *)self otherSigners];
  uint64_t v5 = [v26 count];
  if (v5 != [v32 count])
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MFAddressAtomStatusManager.m" lineNumber:153 description:@"Signers do not match"];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v26;
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    int v7 = 0;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        v11 = [v10 signingCertificateTrustInfo];
        uint64_t v12 = [v11 firstEmailAddress];

        char v13 = [v32 objectAtIndexedSubscript:v9 + v8];
        if (v12)
        {
          v14 = (void *)MEMORY[0x1E4F60800];
          v15 = [v12 stringValue];
          v16 = [v14 componentsWithString:v15];

          v17 = [v10 signingCertificateTrustInfo];
          v18 = [v17 commonName];
          [v16 setDisplayName:v18];

          v19 = [v16 emailAddressValue];
          char v20 = v19;
          if (!v19)
          {
            v3 = [v12 stringValue];
            char v20 = v3;
          }
          v21 = [v29 stringFromEmailAddressConvertible:v20];
          if (!v19) {

          }
          [v13 setAddress:v21];
        }
        v22 = [v10 signingCertificateTrustInfo];
        int v23 = [(MFAddressAtomStatusManager *)self actionForTrustInformation:v22];

        if (v23 == 1) {
          uint64_t v24 = 32;
        }
        else {
          uint64_t v24 = 257;
        }
        [v13 setPresentationOptions:v24];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      int v7 = v9 + v8;
    }
    while (v6);
  }

  [v27 updateAtomsForVIP];
}

- (void)updateWithReplyToInformation:(id)a3
{
  id v4 = a3;
  [(MFAddressAtomStatusManager *)self setReplyToList:v4];
  uint64_t v5 = [(MFAddressAtomStatusManager *)self atomProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MFAddressAtomStatusManager_updateWithReplyToInformation___block_invoke;
  v6[3] = &unk_1E6D1AE08;
  v6[4] = self;
  [v5 iterateDisplayedAtomListsWithBlock:v6];
}

uint64_t __59__MFAddressAtomStatusManager_updateWithReplyToInformation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateAtomsInList:a2];
}

- (void)_updateAtomsInList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 title];
  uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  int v7 = [v6 localizedStringForKey:@"OTHER_SIGNERS_TITLE" value:&stru_1F39E2A88 table:@"Main"];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(MFAddressAtomStatusManager *)self _updateOtherSignersList:v4];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:25];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke;
    v10[3] = &unk_1E6D1AB90;
    id v11 = v4;
    uint64_t v12 = self;
    [v9 performBlock:v10];
  }
}

void __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) addressAtoms];
  v3 = [v2 firstObject];
  if (*(void *)(a1 + 32)
    && ([*(id *)(a1 + 40) atomProvider],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 shouldDecorateAtomListWithSMIMEStatus:*(void *)(a1 + 32)],
        v4,
        v5))
  {
    uint64_t v6 = [*(id *)(a1 + 40) securityInformation];
    int v7 = [*(id *)(a1 + 40) smimeError];
    int v8 = [v6 isSigned];
    int v9 = [v6 isEncrypted];
    if (v7)
    {
      uint64_t v10 = 257;
    }
    else
    {
      int v11 = v9;
      if (v8)
      {
        uint64_t v12 = [v6 signers];
        char v13 = [v12 firstObject];

        v14 = *(void **)(a1 + 40);
        v15 = [v13 signingCertificateTrustInfo];
        int v16 = [v14 actionForTrustInformation:v15];

        uint64_t v10 = 257;
        if (v13 && v16 == 1)
        {
          if (v11) {
            uint64_t v17 = 160;
          }
          else {
            uint64_t v17 = 32;
          }
          v18 = [v13 signingCertificateTrustInfo];
          [v18 emailAddresses];
          v26 = uint64_t v25 = v17;

          v19 = [v3 emailAddress];
          uint64_t v35 = 0;
          long long v36 = &v35;
          uint64_t v37 = 0x2020000000;
          char v38 = 0;
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_2;
          v32[3] = &unk_1E6D1AE30;
          id v33 = v19;
          long long v34 = &v35;
          id v20 = v19;
          [v26 enumerateObjectsUsingBlock:v32];
          if (*((unsigned char *)v36 + 24)) {
            uint64_t v10 = v25;
          }
          else {
            uint64_t v10 = 257;
          }

          _Block_object_dispose(&v35, 8);
        }
      }
      else if (v9)
      {
        uint64_t v10 = 128;
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_3;
  v28[3] = &unk_1E6D1AE58;
  id v21 = v2;
  id v29 = v21;
  uint64_t v31 = v10;
  int8x16_t v27 = *(int8x16_t *)(a1 + 32);
  id v22 = (id)v27.i64[0];
  int8x16_t v30 = vextq_s8(v27, v27, 8uLL);
  int v23 = v28;
  uint64_t v24 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v24 performSyncBlock:v23];
}

void __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 emailAddressValue];
  int v9 = [v6 simpleAddress];

  int v7 = v9;
  if (v9)
  {
    int v8 = objc_msgSend(v9, "ef_caseInsensitiveIsEqualToString:", *(void *)(a1 + 32));
    int v7 = v9;
    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_3(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v2)
  {

    return;
  }
  LOBYTE(v3) = 0;
  uint64_t v22 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (*(void *)v25 != v22) {
        objc_enumerationMutation(obj);
      }
      int v5 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      uint64_t v23 = *(void *)(a1 + 56);
      if ([*(id *)(a1 + 40) _atomContainsVIPSender:v5]) {
        v23 |= 0x10uLL;
      }
      uint64_t v6 = [MEMORY[0x1E4F60D58] currentDevice];
      if ([v6 isInternal])
      {
        int v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
        int v8 = [v7 BOOLForKey:@"PresentationOptionsEncodedIntoAddress"];

        if (!v8) {
          goto LABEL_12;
        }
        int v9 = (void *)MEMORY[0x1E4F5A0D0];
        uint64_t v6 = [v5 emailAddress];
        [v9 presentationOptions:&v23 encodedIntoAddress:v6];
      }

LABEL_12:
      if (v3)
      {
        BOOL v3 = 1;
        uint64_t v10 = v23;
      }
      else
      {
        int v11 = [v5 presentationOptions];
        uint64_t v10 = v23;
        BOOL v3 = ((v23 ^ v11) & 0x1F0) != 0;
      }
      [v5 setPresentationOptions:v10];
      uint64_t v12 = [*(id *)(a1 + 40) replyToList];
      if (v12)
      {
        char v13 = [*(id *)(a1 + 32) lastObject];
        BOOL v14 = v5 == v13;

        if (v14)
        {
          v15 = [*(id *)(a1 + 40) replyToList];
          int v16 = [v15 firstObject];
          uint64_t v17 = [v16 emailAddressValue];
          v18 = [v17 simpleAddress];
          v19 = [v5 emailAddress];
          BOOL v20 = v18 == v19;

          if (v20)
          {
            objc_msgSend(v5, "setPresentationOptions:", objc_msgSend(v5, "presentationOptions") | 0x100);
            BOOL v3 = 1;
          }
        }
      }
    }
    uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v2);

  if (v3) {
    [*(id *)(a1 + 48) updateAtomsForVIP];
  }
}

- (int)actionForTrustInformation:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F77BA0]) initWithTrustInformation:v3];
  int v5 = [v4 action];

  return v5;
}

- (void)_legacyAccountsDidChange:(id)a3
{
  id v4 = [(MFAddressAtomStatusManager *)self legacyAccount];

  if (v4)
  {
    int v5 = (void *)MEMORY[0x1E4F77C70];
    uint64_t v6 = [(MFAddressAtomStatusManager *)self legacyAccount];
    int v7 = [v6 uniqueID];
    id v8 = [v5 accountWithUniqueId:v7];

    [(MFAddressAtomStatusManager *)self setLegacyAccount:v8];
    [(MFAddressAtomStatusManager *)self updateTrustForDisplayedAtoms];
  }
}

- (void)_updateVIPStatus
{
  id v3 = [(MFAddressAtomStatusManager *)self atomProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MFAddressAtomStatusManager__updateVIPStatus__block_invoke;
  v4[3] = &unk_1E6D1AE08;
  v4[4] = self;
  [v3 iterateDisplayedAtomListsWithBlock:v4];
}

void __46__MFAddressAtomStatusManager__updateVIPStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "addressAtoms", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) _atomContainsVIPSender:v8]) {
          unint64_t v9 = [v8 presentationOptions] | 0x10;
        }
        else {
          unint64_t v9 = [v8 presentationOptions] & 0xFFFFFFFFFFFFFFEFLL;
        }
        [v8 setPresentationOptions:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [v3 updateAtomsForVIP];
}

- (BOOL)_atomContainsVIPSender:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F605B8]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = (const void *)[v3 ABPerson];
  if (v6)
  {
    CFTypeRef v7 = ABRecordCopyValue(v6, *MEMORY[0x1E4F49AC0]);
    id v8 = v7;
    if (v7)
    {
      CFArrayRef v9 = ABMultiValueCopyArrayOfAllValues(v7);
      [v4 addObjectsFromArray:v9];
      CFRelease(v8);
    }
    long long v10 = (const void *)ABPersonCopyPreferredLinkedPersonForName();
    long long v11 = (void *)ABPersonCopyCompositeName();
    if (v11) {
      [v5 addObject:v11];
    }
    CFRelease(v10);
  }
  long long v12 = [v3 emailAddress];
  if (!v12)
  {
    long long v12 = [v3 unmodifiedAddressString];
  }
  [v4 addObject:v12];
  id v13 = [v3 unmodifiedAddressString];
  BOOL v14 = [v13 emailAddressValue];
  uint64_t v15 = [v14 displayName];
  int v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v13 stringValue];
  }
  v18 = v17;

  if (v18) {
    [v5 addObject:v18];
  }
  v19 = +[VIPManager defaultInstance];
  BOOL v20 = [v5 allObjects];
  id v21 = [v19 vipForEmailAddresses:v4 andDisplayNames:v20];

  return v21 != 0;
}

- (MFAddressAtomProvider)atomProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_atomProvider);
  return (MFAddressAtomProvider *)WeakRetained;
}

- (EMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MailAccount)legacyAccount
{
  return self->_legacyAccount;
}

- (void)setLegacyAccount:(id)a3
{
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
}

- (NSArray)replyToList
{
  return self->_replyToList;
}

- (void)setReplyToList:(id)a3
{
}

- (NSError)smimeError
{
  return self->_smimeError;
}

- (void)setSMIMEError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smimeError, 0);
  objc_storeStrong((id *)&self->_replyToList, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_legacyAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_atomProvider);
}

@end