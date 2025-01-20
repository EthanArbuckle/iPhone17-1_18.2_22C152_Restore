@interface PSAccountSecurityController
- (NSString)securityCode;
- (PSAccountSecurityController)init;
- (id)passcodeSpecifiers;
- (id)specifiers;
- (id)useRecoveryForSepecifier:(id)a3;
- (int)securityCodeType;
- (void)_setShowsDoneButton:(BOOL)a3;
- (void)_showSecurityCodeChangeSheetOnSpecifier:(id)a3;
- (void)cancelPressed;
- (void)changeSecurityCode:(id)a3;
- (void)disableRecovery;
- (void)handleBurnedRecord;
- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)navCancelPressed;
- (void)navDonePressed;
- (void)phoneSettingsFragment:(id)a3 didChangePhoneNumber:(id)a4 countryInfo:(id)a5;
- (void)reloadSpecifiers;
- (void)saveSMSTargetChanges;
- (void)setSecurityCode:(id)a3;
- (void)setSecurityCodeType:(int)a3;
- (void)setUseRecovery:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSAccountSecurityController

- (PSAccountSecurityController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSAccountSecurityController;
  v2 = [(PSListController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PSKeychainSyncManager);
    manager = v2->_manager;
    v2->_manager = v3;
  }
  return v2;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)PSAccountSecurityController;
  [(PSListController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSAccountSecurityController;
  [(PSListController *)&v6 viewDidAppear:a3];
  if ([(PSAccountSecurityController *)self isMovingToParentViewController])
  {
    v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PSAccountSecurityController_viewDidAppear___block_invoke;
    block[3] = &unk_1E5C5D680;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

void __45__PSAccountSecurityController_viewDidAppear___block_invoke(uint64_t a1)
{
  v2 = PSSecureBackupAccountInfo(0, 0);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  BOOL v3 = (id *)getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  uint64_t v24 = getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordStatusKeySymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getkSecureBackupRecordStatusKeySymbolLoc_block_invoke;
    v19 = &unk_1E5C5D4D8;
    v20 = &v21;
    v4 = (void *)CloudServicesLibrary_0();
    v22[3] = (uint64_t)dlsym(v4, "kSecureBackupRecordStatusKey");
    getkSecureBackupRecordStatusKeySymbolLoc_ptr = *(void *)(v20[1] + 24);
    BOOL v3 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
  {
    -[PSContactsAuthorizationLevelController dealloc]();
LABEL_16:
    -[PSContactsAuthorizationLevelController dealloc]();
    goto LABEL_17;
  }
  id v5 = *v3;
  objc_super v6 = [v2 objectForKey:v5];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v7 = (id *)getkSecureBackupRecordStatusInvalidSymbolLoc_ptr;
  uint64_t v24 = getkSecureBackupRecordStatusInvalidSymbolLoc_ptr;
  if (!getkSecureBackupRecordStatusInvalidSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getkSecureBackupRecordStatusInvalidSymbolLoc_block_invoke;
    v19 = &unk_1E5C5D4D8;
    v20 = &v21;
    v8 = (void *)CloudServicesLibrary_0();
    v22[3] = (uint64_t)dlsym(v8, "kSecureBackupRecordStatusInvalid");
    getkSecureBackupRecordStatusInvalidSymbolLoc_ptr = *(void *)(v20[1] + 24);
    v7 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v7) {
    goto LABEL_16;
  }
  id v9 = *v7;
  if ([v6 isEqualToString:v9])
  {

LABEL_13:
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__PSAccountSecurityController_viewDidAppear___block_invoke_2;
    v15[3] = &unk_1E5C5D680;
    v15[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v15);
    goto LABEL_14;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v10 = (void *)getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr;
  uint64_t v24 = getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getkSecureBackupEscrowTrustStatusKeySymbolLoc_block_invoke;
    v19 = &unk_1E5C5D4D8;
    v20 = &v21;
    v11 = (void *)CloudServicesLibrary_0();
    v22[3] = (uint64_t)dlsym(v11, "kSecureBackupEscrowTrustStatusKey");
    getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr = *(void *)(v20[1] + 24);
    v10 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v10)
  {
LABEL_17:
    v14 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v14);
  }
  v12 = [v2 objectForKey:*v10];
  int v13 = [v12 intValue];

  if (v13 == 2) {
    goto LABEL_13;
  }
LABEL_14:
}

uint64_t __45__PSAccountSecurityController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBurnedRecord];
}

- (id)passcodeSpecifiers
{
  passcodeSpecifiers = self->_passcodeSpecifiers;
  if (!passcodeSpecifiers)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = +[PSSpecifier emptyGroupSpecifier];
    [(NSArray *)v4 addObject:v5];
    objc_super v6 = PS_LocalizedStringForKeychainSync(@"CHANGE_SECURITY_CODE");
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v7 setButtonAction:sel_changeSecurityCode_];
    [(NSArray *)v4 addObject:v7];
    v8 = self->_passcodeSpecifiers;
    self->_passcodeSpecifiers = v4;

    passcodeSpecifiers = self->_passcodeSpecifiers;
  }
  return passcodeSpecifiers;
}

- (id)specifiers
{
  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PSAccountSecurityController_specifiers__block_invoke;
    block[3] = &unk_1E5C5D680;
    block[4] = self;
    dispatch_async(v4, block);

    id v5 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    objc_super v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
    v7 = self->super._specifiers;
    self->super._specifiers = v6;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

void __41__PSAccountSecurityController_specifiers__block_invoke(uint64_t a1)
{
  __int16 v17 = 0;
  v16[1] = 0;
  int CircleMembershipStatus = PSKeychainSyncGetCircleMembershipStatus((unsigned char *)&v17 + 1, (BOOL *)&v17);
  id v3 = 0;
  v4 = v3;
  if (CircleMembershipStatus)
  {
    v16[0] = v3;
    id v5 = PSSecureBackupAccountInfo(v16, 1);
    id v6 = v16[0];

    v4 = v6;
  }
  else
  {
    id v5 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PSAccountSecurityController_specifiers__block_invoke_2;
  block[3] = &unk_1E5C5E6D8;
  char v14 = CircleMembershipStatus;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v7;
  id v13 = v5;
  __int16 v15 = v17;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__PSAccountSecurityController_specifiers__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(v2 + 1424);
    *(void *)(v2 + 1424) = 0;

    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 1432);
    *(void *)(v4 + 1432) = 0;

    if (*(void *)(a1 + 32))
    {
      NSLog(&cfstr_Getaccountstat.isa, *(void *)(a1 + 32));
LABEL_4:
      LOBYTE(v6) = 0;
LABEL_25:
      v31 = [MEMORY[0x1E4F1CA48] array];
      v32 = +[PSSpecifier emptyGroupSpecifier];
      v33 = PS_LocalizedStringForKeychainSync(@"KEYCHAIN_RECOVERY_DESCRIPTION");
      [v32 setProperty:v33 forKey:@"footerText"];

      [v31 addObject:v32];
      uint64_t v34 = *(void *)(a1 + 40);
      v35 = *(void **)(v34 + 1384);
      if (!v35)
      {
        v36 = PS_LocalizedStringForKeychainSync(@"KEYCHAIN_RECOVERY");
        uint64_t v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:*(void *)(a1 + 40) set:sel_setUseRecovery_specifier_ get:sel_useRecoveryForSepecifier_ detail:0 cell:6 edit:0];
        uint64_t v38 = *(void *)(a1 + 40);
        v39 = *(void **)(v38 + 1384);
        *(void *)(v38 + 1384) = v37;

        uint64_t v34 = *(void *)(a1 + 40);
        v35 = *(void **)(v34 + 1384);
      }
      if (*(unsigned char *)(a1 + 57))
      {
        uint64_t v40 = 1;
      }
      else if (*(unsigned char *)(a1 + 58))
      {
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = *(unsigned __int8 *)(v34 + 1440);
      }
      v42 = [MEMORY[0x1E4F28ED0] numberWithInt:v40];
      [v35 setProperty:v42 forKey:@"enabled"];

      [v31 addObject:*(void *)(*(void *)(a1 + 40) + 1384)];
      uint64_t v43 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v43 + 1440) && *(unsigned char *)(a1 + 57))
      {
        v44 = [(id)v43 passcodeSpecifiers];
        [v31 addObjectsFromArray:v44];

        uint64_t v43 = *(void *)(a1 + 40);
        char v45 = *(unsigned char *)(v43 + 1440) ? v6 : 1;
        if ((v45 & 1) == 0 && *(unsigned char *)(a1 + 57))
        {
          v46 = *(void **)(v43 + 1416);
          if (!v46)
          {
            v47 = [[KeychainSyncPhoneSettingsFragment alloc] initWithListController:*(void *)(a1 + 40)];
            uint64_t v48 = *(void *)(a1 + 40);
            v49 = *(void **)(v48 + 1416);
            *(void *)(v48 + 1416) = v47;

            v50 = *(void **)(*(void *)(a1 + 40) + 1416);
            v51 = PS_LocalizedStringForKeychainSync(@"VERIFICATION_NUMBER");
            [v50 setTitle:v51];

            objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1416), "setDelegate:");
            v46 = *(void **)(*(void *)(a1 + 40) + 1416);
          }
          v52 = [v46 specifiers];
          [v31 addObjectsFromArray:v52];

          uint64_t v53 = [*(id *)(*(void *)(a1 + 40) + 1416) unformattedPhoneNumber];
          uint64_t v54 = *(void *)(a1 + 40);
          v55 = *(void **)(v54 + 1424);
          *(void *)(v54 + 1424) = v53;

          uint64_t v56 = [*(id *)(*(void *)(a1 + 40) + 1416) countryInfo];
          uint64_t v57 = *(void *)(a1 + 40);
          v58 = *(void **)(v57 + 1432);
          *(void *)(v57 + 1432) = v56;

          uint64_t v43 = *(void *)(a1 + 40);
        }
      }
      [(id)v43 beginUpdates];
      [*(id *)(a1 + 40) removeSpecifierAtIndex:0];
      [*(id *)(a1 + 40) insertContiguousSpecifiers:v31 atIndex:0];
      [*(id *)(a1 + 40) endUpdates];

      return;
    }
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    id v8 = (id *)getkSecureBackupIsEnabledKeySymbolLoc_ptr;
    uint64_t v64 = getkSecureBackupIsEnabledKeySymbolLoc_ptr;
    if (!getkSecureBackupIsEnabledKeySymbolLoc_ptr)
    {
      id v9 = (void *)CloudServicesLibrary_0();
      v62[3] = (uint64_t)dlsym(v9, "kSecureBackupIsEnabledKey");
      getkSecureBackupIsEnabledKeySymbolLoc_ptr = v62[3];
      id v8 = (id *)v62[3];
    }
    _Block_object_dispose(&v61, 8);
    if (v8)
    {
      id v10 = *v8;
      id v11 = [v7 objectForKey:v10];
      *(unsigned char *)(*(void *)(a1 + 40) + 1440) = [v11 BOOLValue];

      if (!*(unsigned char *)(*(void *)(a1 + 40) + 1440)) {
        goto LABEL_4;
      }
      uint64_t v12 = *(void **)(a1 + 48);
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x2020000000;
      id v13 = (void *)getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr;
      uint64_t v64 = getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr;
      if (!getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr)
      {
        char v14 = (void *)CloudServicesLibrary_0();
        v62[3] = (uint64_t)dlsym(v14, "kSecureBackupUsesRandomPassphraseKey");
        getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr = v62[3];
        id v13 = (void *)v62[3];
      }
      _Block_object_dispose(&v61, 8);
      if (v13)
      {
        __int16 v15 = [v12 objectForKey:*v13];
        int v6 = [v15 BOOLValue];

        uint64_t v16 = *(void **)(a1 + 48);
        __int16 v17 = getkSecureBackupMetadataKey();
        v18 = [v16 objectForKey:v17];
        uint64_t v61 = 0;
        v62 = &v61;
        uint64_t v63 = 0x2020000000;
        v19 = (void *)getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
        uint64_t v64 = getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
        if (!getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr)
        {
          v20 = (void *)CloudServicesLibrary_0();
          v62[3] = (uint64_t)dlsym(v20, "kSecureBackupUsesComplexPassphraseKey");
          getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr = v62[3];
          v19 = (void *)v62[3];
        }
        _Block_object_dispose(&v61, 8);
        if (v19)
        {
          uint64_t v21 = [v18 objectForKey:*v19];
          int v22 = [v21 BOOLValue];

          uint64_t v23 = *(void **)(a1 + 48);
          uint64_t v24 = getkSecureBackupMetadataKey();
          v25 = [v23 objectForKey:v24];
          uint64_t v61 = 0;
          v62 = &v61;
          uint64_t v63 = 0x2020000000;
          v26 = (void *)getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
          uint64_t v64 = getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
          if (!getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr)
          {
            v27 = (void *)CloudServicesLibrary_0();
            v62[3] = (uint64_t)dlsym(v27, "kSecureBackupUsesNumericPassphraseKey");
            getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr = v62[3];
            v26 = (void *)v62[3];
          }
          _Block_object_dispose(&v61, 8);
          if (v26)
          {
            v28 = [v25 objectForKey:*v26];
            int v29 = [v28 BOOLValue];

            if (v6) {
              uint64_t v30 = 2;
            }
            else {
              uint64_t v30 = v22 & ~v29;
            }
            [*(id *)(a1 + 40) setSecurityCodeType:v30];
            goto LABEL_25;
          }
LABEL_52:
          v59 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
          _Block_object_dispose(&v61, 8);
          _Unwind_Resume(v59);
        }
LABEL_51:
        -[PSContactsAuthorizationLevelController dealloc]();
        goto LABEL_52;
      }
    }
    else
    {
      -[PSContactsAuthorizationLevelController dealloc]();
    }
    -[PSContactsAuthorizationLevelController dealloc]();
    goto LABEL_51;
  }
  id v60 = [*(id *)(a1 + 32) domain];
  if ([v60 isEqualToString:*MEMORY[0x1E4F3B4D0]])
  {
    if ([*(id *)(a1 + 32) code] == 1)
    {
    }
    else
    {
      uint64_t v41 = [*(id *)(a1 + 32) code];

      if (v41 != 2) {
        return;
      }
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1448), "promptForPasswordOverController:withCompletion:");
    return;
  }
}

void __41__PSAccountSecurityController_specifiers__block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    [v2 reloadSpecifiers];
  }
  else
  {
    id v4 = [v2 navigationController];
    id v3 = (id)[v4 popViewControllerAnimated:1];
  }
}

- (void)reloadSpecifiers
{
  [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment reloadSpecifiers];
  v3.receiver = self;
  v3.super_class = (Class)PSAccountSecurityController;
  [(PSListController *)&v3 reloadSpecifiers];
  [(PSAccountSecurityController *)self _setShowsDoneButton:0];
}

- (void)_showSecurityCodeChangeSheetOnSpecifier:(id)a3
{
  id v4 = a3;
  int v5 = [(PSAccountSecurityController *)self securityCodeType];
  manager = self->_manager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke;
  v7[3] = &unk_1E5C5E700;
  BOOL v8 = v5 == 2;
  v7[4] = self;
  [(PSKeychainSyncManager *)manager showChangeSecurityCodeFlowWithSpecifier:v4 overController:self completion:v7];
}

void __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke(uint64_t a1, int a2, void *a3, int a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  if (a2)
  {
    if (a4 == 2 || *(unsigned char *)(a1 + 40))
    {
      [*(id *)(a1 + 32) reloadSpecifiers];
      if (a4 == 2) {
        goto LABEL_10;
      }
    }
    else
    {
      v26.receiver = *(id *)(a1 + 32);
      v26.super_class = (Class)PSAccountSecurityController;
      objc_msgSendSuper2(&v26, sel_reloadSpecifiers);
    }
    if (PSIsUsingPasscode(0))
    {
      id v11 = [MEMORY[0x1E4F74230] sharedConnection];
      if ([v11 passcode:v9 meetsCurrentConstraintsOutError:0])
      {
        [*(id *)(a1 + 32) setSecurityCode:v9];
        uint64_t v12 = (void *)MEMORY[0x1E4F42728];
        id v13 = PS_LocalizedStringForKeychainSync(@"USE_SECURITY_CODE_AS_DEVICE_PASSCODE");
        char v14 = [v12 alertControllerWithTitle:v13 message:0 preferredStyle:1];

        __int16 v15 = (void *)MEMORY[0x1E4F42720];
        uint64_t v16 = PS_LocalizedStringForKeychainSync(@"DONT_CHANGE_PASSCODE");
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_2;
        v25[3] = &unk_1E5C5DAE8;
        v25[4] = *(void *)(a1 + 32);
        __int16 v17 = [v15 actionWithTitle:v16 style:1 handler:v25];
        [v14 addAction:v17];

        v18 = (void *)MEMORY[0x1E4F42720];
        v19 = PS_LocalizedStringForKeychainSync(@"USE_SAME_CODE_ICSC_TO_DEVICE");
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_3;
        v24[3] = &unk_1E5C5DAE8;
        v24[4] = *(void *)(a1 + 32);
        v20 = [v18 actionWithTitle:v19 style:0 handler:v24];
        [v14 addAction:v20];

        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_4;
        v22[3] = &unk_1E5C5DDD0;
        v22[4] = *(void *)(a1 + 32);
        id v23 = v14;
        id v21 = v14;
        dispatch_async(MEMORY[0x1E4F14428], v22);
      }
    }
  }
LABEL_10:
}

uint64_t __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSecurityCode:0];
}

void __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PSSetupController);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1400);
  *(void *)(v3 + 1400) = v2;

  int v5 = *(void **)(*(void *)(a1 + 32) + 992);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 setProperty:v7 forKey:@"customControllerClass"];

  [*(id *)(*(void *)(a1 + 32) + 1400) setSpecifier:*(void *)(*(void *)(a1 + 32) + 992)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1400), "setParentController:");
  [*(id *)(*(void *)(a1 + 32) + 1400) setupController];
  BOOL v8 = [*(id *)(*(void *)(a1 + 32) + 1400) viewControllers];
  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 1408);
  *(void *)(v10 + 1408) = v9;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1408), "setDelegate:");
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 1408);
  id v13 = PS_LocalizedStringForKeychainSync(@"ENTER_CURRENT_PASSCODE");
  [v12 setEnterPasscodeTitle:v13];

  char v14 = *(void **)(*(void *)(a1 + 32) + 1408);
  __int16 v15 = PS_LocalizedStringForKeychainSync(@"ENTER_CURRENT_PASSCODE_DESCRIPTION");
  [v14 setEnterPasscodeReason:v15];

  id v17 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:sel_cancelPressed];
  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 1408) navigationItem];
  [v16 setLeftBarButtonItem:v17];

  [*(id *)(a1 + 32) presentViewController:*(void *)(*(void *)(a1 + 32) + 1400) animated:1 completion:0];
}

uint64_t __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)changeSecurityCode:(id)a3
{
  phoneSettingsFragment = self->_phoneSettingsFragment;
  id v6 = a3;
  int v5 = [(KeychainSyncPhoneSettingsFragment *)phoneSettingsFragment phoneNumberCell];
  [v5 resignFirstResponder];

  [(PSAccountSecurityController *)self _showSecurityCodeChangeSheetOnSpecifier:v6];
}

- (void)disableRecovery
{
  id v3 = objc_alloc_init((Class)getSecureBackupClass());
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PSAccountSecurityController_disableRecovery__block_invoke;
  v4[3] = &unk_1E5C5DA48;
  v4[4] = self;
  [v3 disableWithInfo:0 completionBlock:v4];
}

void __46__PSAccountSecurityController_disableRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PSAccountSecurityController_disableRecovery__block_invoke_2;
  v6[3] = &unk_1E5C5DDD0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __46__PSAccountSecurityController_disableRecovery__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    NSLog(&cfstr_FailedToDisabl.isa, *(void *)(a1 + 32));
    uint64_t v2 = (void *)MEMORY[0x1E4F42728];
    id v3 = PS_LocalizedStringForKeychainSync(@"DISABLE_BACKUP_KEYCHAIN_ERROR_TITLE");
    id v12 = [v2 alertControllerWithTitle:v3 message:0 preferredStyle:1];

    uint64_t v4 = (void *)MEMORY[0x1E4F42720];
    id v5 = PS_LocalizedStringForKeychainSync(@"OK");
    id v6 = [v4 actionWithTitle:v5 style:0 handler:0];
    [v12 addAction:v6];

    [*(id *)(a1 + 40) presentViewController:v12 animated:1 completion:0];
    [*(id *)(a1 + 40) reloadSpecifier:*(void *)(*(void *)(a1 + 40) + 1384) animated:1];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 1440) = 0;
    BOOL v13 = 0;
    if (PSKeychainSyncGetCircleMembershipStatus(0, &v13))
    {
      id v7 = *(void **)(*(void *)(a1 + 40) + 1384);
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v13];
      [v7 setProperty:v8 forKey:@"enabled"];
    }
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9[174])
    {
      [v9 beginUpdates];
      [*(id *)(a1 + 40) reloadSpecifier:*(void *)(*(void *)(a1 + 40) + 1384)];
      uint64_t v10 = *(id **)(a1 + 40);
      id v11 = [v10[177] specifiers];
      [v10 removeContiguousSpecifiers:v11 animated:1];

      [*(id *)(a1 + 40) removeContiguousSpecifiers:*(void *)(*(void *)(a1 + 40) + 1392) animated:1];
      [*(id *)(a1 + 40) endUpdates];
    }
    else
    {
      [v9 reloadSpecifier:v9[173] animated:1];
    }
    [*(id *)(a1 + 40) _setShowsDoneButton:0];
  }
}

- (void)setUseRecovery:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  if ([a3 BOOLValue])
  {
    manager = self->_manager;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke;
    v20[3] = &unk_1E5C5E728;
    v20[4] = self;
    [(PSKeychainSyncManager *)manager showEnableEscrowFlowWithSpecifier:v6 overController:self completion:v20];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F42728];
    uint64_t v9 = PS_LocalizedStringForKeychainSync(@"DONT_USE_SECURITY_CODE");
    uint64_t v10 = PS_LocalizedStringForKeychainSync(@"DISABLE_RECOVERY_DESCRIPTION");
    id v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    id v12 = (void *)MEMORY[0x1E4F42720];
    BOOL v13 = PS_LocalizedStringForKeychainSync(@"CANCEL");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_2;
    v19[3] = &unk_1E5C5DAE8;
    v19[4] = self;
    char v14 = [v12 actionWithTitle:v13 style:1 handler:v19];
    [v11 addAction:v14];

    __int16 v15 = (void *)MEMORY[0x1E4F42720];
    uint64_t v16 = PS_LocalizedStringForKeychainSync(@"DONT_USE");
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_3;
    v18[3] = &unk_1E5C5DAE8;
    v18[4] = self;
    id v17 = [v15 actionWithTitle:v16 style:0 handler:v18];
    [v11 addAction:v17];

    [(PSAccountSecurityController *)self presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 1384)];
}

uint64_t __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) disableRecovery];
}

- (id)useRecoveryForSepecifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28ED0] numberWithBool:self->_secureBackupEnabled];
}

- (void)handleBurnedRecord
{
  [(PSKeychainSyncManager *)self->_manager startNavigationSpinnerInViewController:self];
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PSAccountSecurityController_handleBurnedRecord__block_invoke;
  block[3] = &unk_1E5C5D680;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __49__PSAccountSecurityController_handleBurnedRecord__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)getSecureBackupClass());
  id v3 = [v2 disableWithInfo:0];
  NSLog(&cfstr_ErrorDisabling.isa, v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_2;
  block[3] = &unk_1E5C5D680;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  [*(id *)(*(void *)(a1 + 32) + 1448) stopNavigationSpinner];
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[181];
  uint64_t v4 = [v2 specifier];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_3;
  uint64_t v9 = &unk_1E5C5E728;
  uint64_t v10 = v5;
  objc_msgSend(v3, "showEnableEscrowFlowWithSpecifier:overController:completion:", v4);
}

uint64_t __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (self->_devicePINController == a3)
  {
    [(PSKeychainSyncManager *)self->_manager startNavigationSpinnerInViewController:a3];
    uint64_t v8 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v9 = [(PSAccountSecurityController *)self securityCode];
    id v20 = 0;
    char v10 = [v8 changePasscodeFrom:v7 to:v9 outError:&v20];
    id v11 = v20;

    if (v10)
    {
      id v12 = [MEMORY[0x1E4F42B30] sharedInputModeController];
      [v12 saveDeviceUnlockPasscodeInputModes];
    }
    else
    {
      NSLog(&cfstr_ErrorChangingP.isa, v11);
      BOOL v13 = (void *)MEMORY[0x1E4F42728];
      char v14 = PS_LocalizedStringForKeychainSync(@"ERROR_CHANGING_PASSCODE");
      id v12 = [v13 alertControllerWithTitle:v14 message:0 preferredStyle:1];

      __int16 v15 = (void *)MEMORY[0x1E4F42720];
      uint64_t v16 = PS_LocalizedStringForKeychainSync(@"OK");
      id v17 = [v15 actionWithTitle:v16 style:0 handler:0];
      [v12 addAction:v17];

      [(PSAccountSecurityController *)self presentViewController:v12 animated:1 completion:0];
    }

    [(PSKeychainSyncManager *)self->_manager stopNavigationSpinner];
    v18 = [(PSViewController *)self rootController];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PSAccountSecurityController_keychainSyncController_didFinishWithResult_error___block_invoke;
    v19[3] = &unk_1E5C5D680;
    v19[4] = self;
    [v18 dismissViewControllerAnimated:1 completion:v19];
  }
}

void __80__PSAccountSecurityController_keychainSyncController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSecurityCode:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1408);
  *(void *)(v2 + 1408) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1400);
  *(void *)(v4 + 1400) = 0;
}

- (void)saveSMSTargetChanges
{
}

void __51__PSAccountSecurityController_saveSMSTargetChanges__block_invoke(uint64_t a1, int a2, void *a3)
{
  v76[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v63 = [*(id *)(*(void *)(a1 + 32) + 1416) unformattedPhoneNumber];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1416) countryInfo];
    __int16 v64 = 0;
    int CircleMembershipStatus = PSKeychainSyncGetCircleMembershipStatus((unsigned char *)&v64 + 1, (BOOL *)&v64);
    id v8 = 0;
    uint64_t v9 = v8;
    if (!CircleMembershipStatus)
    {
      NSLog(&cfstr_FailedToSetNew.isa, v8);
LABEL_32:

      goto LABEL_33;
    }
    if (!HIBYTE(v64) || !(_BYTE)v64) {
      goto LABEL_32;
    }
    v62 = v6;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v10 = (id *)getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0;
    uint64_t v73 = getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0;
    if (!getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0)
    {
      uint64_t v65 = MEMORY[0x1E4F143A8];
      uint64_t v66 = 3221225472;
      v67 = __getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_block_invoke_0;
      v68 = &unk_1E5C5D4D8;
      v69 = &v70;
      id v11 = (void *)CloudServicesLibrary_0();
      id v12 = dlsym(v11, "kSecureBackupSMSTargetPhoneNumberKey");
      *(void *)(v69[1] + 24) = v12;
      getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0 = *(void *)(v69[1] + 24);
      char v10 = (id *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (v10)
    {
      id v58 = *v10;
      v74[0] = v58;
      v76[0] = v63;
      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2020000000;
      BOOL v13 = (id *)getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0;
      uint64_t v73 = getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0;
      if (!getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0)
      {
        uint64_t v65 = MEMORY[0x1E4F143A8];
        uint64_t v66 = 3221225472;
        v67 = __getkSecureBackupCountryDialCodeKeySymbolLoc_block_invoke_0;
        v68 = &unk_1E5C5D4D8;
        v69 = &v70;
        char v14 = (void *)CloudServicesLibrary_0();
        __int16 v15 = dlsym(v14, "kSecureBackupCountryDialCodeKey");
        *(void *)(v69[1] + 24) = v15;
        getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0 = *(void *)(v69[1] + 24);
        BOOL v13 = (id *)v71[3];
      }
      _Block_object_dispose(&v70, 8);
      if (v13)
      {
        id v57 = *v13;
        v74[1] = v57;
        id v60 = [v62 dialingPrefix];
        v76[1] = v60;
        uint64_t v70 = 0;
        v71 = &v70;
        uint64_t v72 = 0x2020000000;
        uint64_t v16 = (id *)getkSecureBackupCountryCodeKeySymbolLoc_ptr_0;
        uint64_t v73 = getkSecureBackupCountryCodeKeySymbolLoc_ptr_0;
        if (!getkSecureBackupCountryCodeKeySymbolLoc_ptr_0)
        {
          uint64_t v65 = MEMORY[0x1E4F143A8];
          uint64_t v66 = 3221225472;
          v67 = __getkSecureBackupCountryCodeKeySymbolLoc_block_invoke_0;
          v68 = &unk_1E5C5D4D8;
          v69 = &v70;
          id v17 = (void *)CloudServicesLibrary_0();
          v18 = dlsym(v17, "kSecureBackupCountryCodeKey");
          *(void *)(v69[1] + 24) = v18;
          getkSecureBackupCountryCodeKeySymbolLoc_ptr_0 = *(void *)(v69[1] + 24);
          uint64_t v16 = (id *)v71[3];
        }
        _Block_object_dispose(&v70, 8);
        if (v16)
        {
          id v19 = *v16;
          v74[2] = v19;
          id v20 = [v62 countryCode];
          v76[2] = v20;
          uint64_t v70 = 0;
          v71 = &v70;
          uint64_t v72 = 0x2020000000;
          id v21 = (id *)getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
          uint64_t v73 = getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
          if (!getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr)
          {
            uint64_t v65 = MEMORY[0x1E4F143A8];
            uint64_t v66 = 3221225472;
            v67 = __getkSecureBackupAuthenticationAppleIDSymbolLoc_block_invoke;
            v68 = &unk_1E5C5D4D8;
            v69 = &v70;
            int v22 = (void *)CloudServicesLibrary_0();
            id v23 = dlsym(v22, "kSecureBackupAuthenticationAppleID");
            *(void *)(v69[1] + 24) = v23;
            getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr = *(void *)(v69[1] + 24);
            id v21 = (id *)v71[3];
          }
          _Block_object_dispose(&v70, 8);
          if (v21)
          {
            id v24 = *v21;
            v74[3] = v24;
            v25 = [*(id *)(*(void *)(a1 + 32) + 1448) appleIDUsername];
            v76[3] = v25;
            uint64_t v70 = 0;
            v71 = &v70;
            uint64_t v72 = 0x2020000000;
            objc_super v26 = (id *)getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
            uint64_t v73 = getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
            if (!getkSecureBackupAuthenticationPasswordSymbolLoc_ptr)
            {
              uint64_t v65 = MEMORY[0x1E4F143A8];
              uint64_t v66 = 3221225472;
              v67 = __getkSecureBackupAuthenticationPasswordSymbolLoc_block_invoke;
              v68 = &unk_1E5C5D4D8;
              v69 = &v70;
              v27 = (void *)CloudServicesLibrary_0();
              v28 = dlsym(v27, "kSecureBackupAuthenticationPassword");
              *(void *)(v69[1] + 24) = v28;
              getkSecureBackupAuthenticationPasswordSymbolLoc_ptr = *(void *)(v69[1] + 24);
              objc_super v26 = (id *)v71[3];
            }
            _Block_object_dispose(&v70, 8);
            if (v26)
            {
              id v75 = *v26;
              int v29 = *(void **)(*(void *)(a1 + 32) + 1448);
              id v30 = v75;
              [v29 appleIDPasswordOrEquivalentToken];
              v31 = uint64_t v6 = v62;
              v76[4] = v31;
              v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v74 count:5];

              id v32 = objc_alloc_init((Class)getSecureBackupClass());
              uint64_t v33 = [v32 changeSMSTargetWithInfo:v59];
              uint64_t v34 = (void *)v33;
              if (!v33)
              {
                uint64_t v41 = [*(id *)(a1 + 32) navigationController];
                id v51 = (id)[v41 popViewControllerAnimated:1];
                goto LABEL_31;
              }
              NSLog(&cfstr_FailedToChange.isa, v33);
              v35 = [v34 domain];
              uint64_t v70 = 0;
              v71 = &v70;
              uint64_t v72 = 0x2020000000;
              v36 = (void *)getkSecureBackupErrorDomainSymbolLoc_ptr;
              uint64_t v73 = getkSecureBackupErrorDomainSymbolLoc_ptr;
              if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
              {
                uint64_t v65 = MEMORY[0x1E4F143A8];
                uint64_t v66 = 3221225472;
                v67 = __getkSecureBackupErrorDomainSymbolLoc_block_invoke;
                v68 = &unk_1E5C5D4D8;
                v69 = &v70;
                uint64_t v37 = (void *)CloudServicesLibrary_0();
                uint64_t v38 = dlsym(v37, "kSecureBackupErrorDomain");
                *(void *)(v69[1] + 24) = v38;
                getkSecureBackupErrorDomainSymbolLoc_ptr = *(void *)(v69[1] + 24);
                v36 = (void *)v71[3];
              }
              _Block_object_dispose(&v70, 8);
              if (v36)
              {
                int v39 = [v35 isEqualToString:*v36];
                uint64_t v6 = v62;
                if (v39)
                {
                  BOOL v40 = [v34 code] == 29;

                  if (v40)
                  {
                    uint64_t v41 = +[PSKeychainSyncPhoneNumber phoneNumberWithDigits:v63 countryInfo:v62];
                    v42 = NSString;
                    uint64_t v43 = PS_LocalizedStringForKeychainSync(@"INVALID_PHONE_NUMBER");
                    v44 = [v41 formattedStringWithDialingPrefix];
                    uint64_t v61 = objc_msgSend(v42, "stringWithFormat:", v43, v44);

                    char v45 = (void *)MEMORY[0x1E4F42728];
                    v46 = PS_LocalizedStringForKeychainSync(@"KEYCHAIN_VERIFICATION");
                    v47 = [v45 alertControllerWithTitle:v46 message:v61 preferredStyle:1];

                    uint64_t v48 = (void *)MEMORY[0x1E4F42720];
                    v49 = PS_LocalizedStringForKeychainSync(@"OK");
                    v50 = [v48 actionWithTitle:v49 style:0 handler:0];
                    [v47 addAction:v50];

                    [*(id *)(a1 + 32) presentViewController:v47 animated:1 completion:0];
LABEL_31:

                    goto LABEL_32;
                  }
                }
                else
                {
                }
                v52 = (void *)MEMORY[0x1E4F42728];
                uint64_t v53 = PS_LocalizedStringForKeychainSync(@"FAILED_TO_CHANGE_PHONE_NUMBER");
                uint64_t v41 = [v52 alertControllerWithTitle:v53 message:0 preferredStyle:1];

                uint64_t v54 = (void *)MEMORY[0x1E4F42720];
                v55 = PS_LocalizedStringForKeychainSync(@"OK");
                uint64_t v56 = [v54 actionWithTitle:v55 style:0 handler:0];
                [v41 addAction:v56];

                [*(id *)(a1 + 32) presentViewController:v41 animated:1 completion:0];
                goto LABEL_31;
              }
            }
          }
        }
      }
    }
    -[PSContactsAuthorizationLevelController dealloc]();
    __break(1u);
  }
LABEL_33:
}

- (void)navCancelPressed
{
  id v3 = [(PSAccountSecurityController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (void)navDonePressed
{
  [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment resignFirstResponder];
  [(PSAccountSecurityController *)self saveSMSTargetChanges];
}

- (void)_setShowsDoneButton:(BOOL)a3
{
  if (a3)
  {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_navCancelPressed];
    uint64_t v4 = [(PSAccountSecurityController *)self navigationItem];
    [v4 setLeftBarButtonItem:v8];

    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_navDonePressed];
    uint64_t v6 = [(PSAccountSecurityController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
  else
  {
    id v7 = [(PSAccountSecurityController *)self navigationItem];
    [v7 setLeftBarButtonItem:0];

    id v8 = [(PSAccountSecurityController *)self navigationItem];
    [v8 setRightBarButtonItem:0];
  }
}

- (void)phoneSettingsFragment:(id)a3 didChangePhoneNumber:(id)a4 countryInfo:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  if ([(NSString *)self->_SMSTarget isEqualToString:v13]
    && [(KeychainSyncCountryInfo *)self->_SMSTargetCountryInfo isEqual:v7])
  {
    [(PSAccountSecurityController *)self _setShowsDoneButton:0];
  }
  else
  {
    [(PSAccountSecurityController *)self _setShowsDoneButton:1];
    id v8 = [(PSAccountSecurityController *)self navigationItem];
    uint64_t v9 = [v8 rightBarButtonItem];

    uint64_t v10 = [v13 length];
    if (v7) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    uint64_t v12 = !v11;
    [v9 setEnabled:v12];
  }
}

- (void)cancelPressed
{
  id v3 = [(PSViewController *)self rootController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PSAccountSecurityController_cancelPressed__block_invoke;
  v4[3] = &unk_1E5C5D680;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __44__PSAccountSecurityController_cancelPressed__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 1400);
  *(void *)(v1 + 1400) = 0;
}

- (int)securityCodeType
{
  return self->_securityCodeType;
}

- (void)setSecurityCodeType:(int)a3
{
  self->_securityCodeType = a3;
}

- (NSString)securityCode
{
  return self->_securityCode;
}

- (void)setSecurityCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityCode, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_SMSTargetCountryInfo, 0);
  objc_storeStrong((id *)&self->_SMSTarget, 0);
  objc_storeStrong((id *)&self->_phoneSettingsFragment, 0);
  objc_storeStrong((id *)&self->_devicePINController, 0);
  objc_storeStrong((id *)&self->_devicePasscodeChangeSetupController, 0);
  objc_storeStrong((id *)&self->_passcodeSpecifiers, 0);
  objc_storeStrong((id *)&self->_recoverySwitch, 0);
}

@end