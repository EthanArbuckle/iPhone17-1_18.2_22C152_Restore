@interface STPINController
+ (unint64_t)pinLength;
- (BOOL)_authenticateWithPIN:(id)a3 forUser:(id)a4 allowPasscodeRecovery:(BOOL)a5 error:(id *)a6;
- (BOOL)_isPINValid:(id)a3;
- (BOOL)_saveChangesForUser:(id)a3 error:(id *)a4;
- (BOOL)_setPasscode:(id)a3 recoveryAppleID:(id)a4 forUser:(id)a5 error:(id *)a6;
- (BOOL)authenticateWithPIN:(id)a3 error:(id *)a4;
- (BOOL)canRecoveryAuthenticate;
- (NSDate)timeoutEndDate;
- (OS_dispatch_source)backoffTimer;
- (STCoreUser)user;
- (STPINController)initWithUser:(id)a3;
- (id)_timeoutEndDateForAttemptNumber:(int64_t)a3;
- (void)_beginTimeoutUntilDate:(id)a3;
- (void)_setNewPIN:(id)a3 currentPIN:(id)a4 recoveryAppleIDPrompt:(id)a5 completionHandler:(id)a6;
- (void)authenticateWithPIN:(id)a3 allowPasscodeRecovery:(BOOL)a4 completionHandler:(id)a5;
- (void)authenticateWithPIN:(id)a3 completionHandler:(id)a4;
- (void)removePIN:(id)a3 completionHandler:(id)a4;
- (void)setBackoffTimer:(id)a3;
- (void)setPIN:(id)a3 withRecoveryAppleIDPrompt:(id)a4 completionHandler:(id)a5;
- (void)setTimeoutEndDate:(id)a3;
- (void)updatePIN:(id)a3 toPIN:(id)a4 withRecoveryAppleIDPrompt:(id)a5 completionHandler:(id)a6;
@end

@implementation STPINController

- (STPINController)initWithUser:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STPINController;
  v6 = [(STPINController *)&v12 init];
  if (v6)
  {
    v7 = +[STLog pinController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(STPINController *)(uint64_t)v6 initWithUser:v7];
    }

    objc_storeStrong((id *)&v6->_user, a3);
    v8 = [v5 passcodeEntryTimeoutEndDate];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v10 = [v8 compare:v9];

      if (v10 == 1)
      {
        objc_storeStrong((id *)&v6->_timeoutEndDate, v8);
        [(STPINController *)v6 _beginTimeoutUntilDate:v8];
      }
    }
  }
  return v6;
}

+ (unint64_t)pinLength
{
  return 4;
}

- (BOOL)canRecoveryAuthenticate
{
  v3 = [(STPINController *)self user];
  v4 = [v3 effectiveRecoveryAltDSID];

  id v5 = [v3 dsid];
  if ([v5 integerValue])
  {
    v6 = [v3 familyMemberType];
    if (([v6 isEqualToString:@"Child"] & 1) != 0
      || ([v6 isEqualToString:@"Teen"] & 1) != 0)
    {
      BOOL v7 = 0;
    }
    else
    {
      v8 = [v3 altDSID];
      BOOL v7 = v8 != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  v9 = [(STPINController *)self timeoutEndDate];
  if (v9) {
    BOOL v10 = [v3 passcodeRecoveryAttemptCount] < 1;
  }
  else {
    BOOL v10 = 1;
  }

  if (v4) {
    char v11 = 1;
  }
  else {
    char v11 = v7;
  }
  BOOL v12 = v11 & v10;

  return v12;
}

- (void)setPIN:(id)a3 withRecoveryAppleIDPrompt:(id)a4 completionHandler:(id)a5
{
}

- (void)updatePIN:(id)a3 toPIN:(id)a4 withRecoveryAppleIDPrompt:(id)a5 completionHandler:(id)a6
{
}

- (void)removePIN:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)_isPINValid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4 == [(id)objc_opt_class() pinLength])
  {
    id v5 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    v6 = [v5 invertedSet];

    BOOL v7 = [v3 rangeOfCharacterFromSet:v6] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_setNewPIN:(id)a3 currentPIN:(id)a4 recoveryAppleIDPrompt:(id)a5 completionHandler:(id)a6
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 || [(STPINController *)self _isPINValid:v11])
  {
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 0;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__13;
    v58 = __Block_byref_object_dispose__13;
    id v59 = 0;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    v15 = [(STPINController *)self user];
    v16 = [v15 managedObjectContext];
    [v16 setMergePolicy:*MEMORY[0x1E4F1BE40]];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke;
    v40[3] = &unk_1E6BC7E10;
    id v17 = v16;
    id v41 = v17;
    id v18 = v15;
    id v42 = v18;
    id v43 = v12;
    v47 = &v54;
    id v19 = v11;
    id v44 = v19;
    v48 = &v50;
    id v20 = v13;
    v49 = &v60;
    v45 = self;
    id v46 = v20;
    [v17 performBlockAndWait:v40];
    if (*((unsigned char *)v61 + 24))
    {
      if (*((unsigned char *)v51 + 24))
      {
        if (!v20)
        {
          v31 = [MEMORY[0x1E4F28B00] currentHandler];
          [v31 handleFailureInMethod:a2 object:self file:@"STPINController.m" lineNumber:163 description:@"Recovery Apple ID prompt must not be nil"];
        }
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_41;
        v32[3] = &unk_1E6BC7E60;
        v38 = &v60;
        id v33 = v17;
        v34 = self;
        id v35 = v19;
        id v36 = v18;
        v39 = &v54;
        id v37 = v14;
        (*((void (**)(id, void *))v20 + 2))(v20, v32);

        goto LABEL_12;
      }
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v30 = v55[5];
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, v30);
LABEL_12:

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);

    _Block_object_dispose(&v60, 8);
    goto LABEL_13;
  }
  v21 = +[STScreenTimeCoreBundle bundle];
  v22 = [v21 localizedStringForKey:@"PINInvalidError" value:&stru_1F3487700 table:0];
  v23 = [v21 localizedStringForKey:@"EnterValidPIN" value:&stru_1F3487700 table:0];
  id v24 = [NSString alloc];
  v25 = [MEMORY[0x1E4F1CA20] currentLocale];
  v26 = objc_msgSend(v24, "initWithFormat:locale:", v23, v25, objc_msgSend((id)objc_opt_class(), "pinLength"));

  uint64_t v27 = *MEMORY[0x1E4F285A0];
  v64[0] = *MEMORY[0x1E4F28568];
  v64[1] = v27;
  v65[0] = v22;
  v65[1] = v26;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:20 userInfo:v28];
  (*((void (**)(id, void *))v14 + 2))(v14, v29);

LABEL_13:
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) refreshObject:*(void *)(a1 + 40) mergeChanges:1];
  v2 = *(void **)(a1 + 40);
  if (v2 && ([v2 isDeleted] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 40) effectivePasscode];
    if (v3 && ([*(id *)(a1 + 48) isEqualToString:v3] & 1) == 0)
    {
      uint64_t v4 = +[STScreenTimeCoreBundle bundle];
      id v5 = [v4 localizedStringForKey:@"PINIncorrectError" value:&stru_1F3487700 table:0];

      id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F28568];
      v36[0] = v5;
      BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      uint64_t v8 = [v6 initWithDomain:@"STErrorDomain" code:18 userInfo:v7];
      uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
      BOOL v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    id v12 = (id *)(v11 + 40);
    if (!v13)
    {
      if (*(void *)(a1 + 56))
      {
        id v14 = [*(id *)(a1 + 40) effectiveRecoveryAltDSID];
        v15 = [*(id *)(a1 + 40) familyMemberType];
        if (!*(void *)(a1 + 72) || v14)
        {
          uint64_t v25 = a1 + 88;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
        }
        else
        {
          v16 = [*(id *)(a1 + 40) dsid];
          uint64_t v17 = [v16 integerValue];
          char v18 = 1;
          if (v17 && v15)
          {
            if ([v15 isEqualToString:@"Unknown"])
            {
              char v18 = 1;
            }
            else if ([v15 isEqualToString:@"Adult"])
            {
              char v18 = [*(id *)(a1 + 40) isManaged] ^ 1;
            }
            else
            {
              char v18 = 0;
            }
          }
          uint64_t v25 = a1 + 88;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v18;
        }
        if (*(unsigned char *)(*(void *)(*(void *)v25 + 8) + 24))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
        }
        else
        {
          uint64_t v28 = *(void *)(a1 + 56);
          uint64_t v27 = *(void **)(a1 + 64);
          uint64_t v29 = *(void *)(a1 + 40);
          uint64_t v30 = *(void *)(*(void *)(a1 + 80) + 8);
          id v34 = *(id *)(v30 + 40);
          char v31 = [v27 _setPasscode:v28 recoveryAppleID:v14 forUser:v29 error:&v34];
          objc_storeStrong((id *)(v30 + 40), v34);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v31;
        }
      }
      else
      {
        uint64_t v19 = *(void *)(a1 + 40);
        id obj = 0;
        BOOL v20 = +[STBlueprint deleteManagedUserBlueprintForUser:v19 error:&obj];
        objc_storeStrong(v12, obj);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v20;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
        {
          [*(id *)(a1 + 40) setEffectivePasscode:0];
          [*(id *)(a1 + 40) setEffectiveRecoveryAltDSID:0];
          [*(id *)(a1 + 40) setContactsEditable:1];
          [*(id *)(a1 + 40) setIsCommunicationSafetySendingRestricted:0];
          [*(id *)(a1 + 40) setIsCommunicationSafetyReceivingRestricted:0];
          [*(id *)(a1 + 40) setIsCommunicationSafetyNotificationEnabled:0];
          [*(id *)(a1 + 40) setIsCommunicationSafetyAnalyticsEnabled:0];
          v21 = *(void **)(a1 + 64);
          uint64_t v22 = *(void *)(a1 + 40);
          uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
          id v32 = *(id *)(v23 + 40);
          char v24 = [v21 _saveChangesForUser:v22 error:&v32];
          objc_storeStrong((id *)(v23 + 40), v32);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v24;
        }
        else
        {
          v26 = +[STLog pinController];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_2();
          }
        }
      }
    }
  }
  else
  {
    id v3 = +[STLog pinController];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_1();
    }
  }
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6BC7E38;
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 72);
    v10[4] = v4;
    id v11 = v6;
    id v12 = v3;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 80);
    id v13 = v7;
    uint64_t v15 = v8;
    [v5 performBlockAndWait:v10];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [v2 _setPasscode:v3 recoveryAppleID:v4 forUser:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v7;
}

- (BOOL)_setPasscode:(id)a3 recoveryAppleID:(id)a4 forUser:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (+[STBlueprint saveManagedUserBlueprintForUser:v12 error:a6])
  {
    [v12 setEffectivePasscode:v10];
    [v12 setEffectiveRecoveryAltDSID:v11];
    BOOL v13 = [(STPINController *)self _saveChangesForUser:v12 error:a6];
  }
  else
  {
    uint64_t v14 = +[STLog pinController];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STPINController _setPasscode:recoveryAppleID:forUser:error:]();
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_saveChangesForUser:(id)a3 error:(id *)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = +[STAdminPersistenceController sharedController];
    char v7 = [v5 managedObjectContext];
    char v8 = [v6 saveContext:v7 error:a4];
  }
  else
  {
    uint64_t v9 = [v5 managedObjectContext];
    char v10 = [v9 save:a4];

    if (v10)
    {
      char v8 = 1;
    }
    else
    {
      id v11 = +[STLog pinController];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[STPINController _saveChangesForUser:error:](v5, (uint64_t *)a4, v11);
      }

      id v12 = +[STScreenTimeCoreBundle bundle];
      BOOL v13 = [v12 localizedStringForKey:@"PersistPINError" value:&stru_1F3487700 table:0];

      uint64_t v14 = *MEMORY[0x1E4F28568];
      v20[0] = v13;
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      v19[0] = v14;
      v19[1] = v15;
      v16 = STXPCSafeErrorFromCoreDataError(*a4, 1);
      v20[1] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:1 userInfo:v17];
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)authenticateWithPIN:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(STPINController *)self user];
  char v8 = [v7 managedObjectContext];
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__13;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__STPINController_authenticateWithPIN_error___block_invoke;
  v13[3] = &unk_1E6BC7E88;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  v16 = &v17;
  [v8 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v11 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __45__STPINController_authenticateWithPIN_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v2 - 16);
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t v6 = *(void *)(v1 + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [v3 _authenticateWithPIN:v4 forUser:v5 allowPasscodeRecovery:0 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v7 & 1) == 0)
  {
    char v8 = +[STLog pinController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __45__STPINController_authenticateWithPIN_error___block_invoke_cold_1();
    }
  }
}

- (void)authenticateWithPIN:(id)a3 allowPasscodeRecovery:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(STPINController *)self user];
  BOOL v11 = [v10 managedObjectContext];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke;
  v15[3] = &unk_1E6BC7EB0;
  v15[4] = self;
  id v16 = v8;
  BOOL v19 = a4;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [v11 performBlock:v15];
}

void __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  id v15 = 0;
  char v6 = [v2 _authenticateWithPIN:v3 forUser:v4 allowPasscodeRecovery:v5 error:&v15];
  id v7 = v15;
  if ((v6 & 1) == 0)
  {
    id v8 = +[STLog pinController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7, [*(id *)(a1 + 48) passcodeEntryAttemptCount]);
}

- (void)authenticateWithPIN:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)_authenticateWithPIN:(id)a3 forUser:(id)a4 allowPasscodeRecovery:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(STPINController *)self timeoutEndDate];

  if (!v12 || v7 && [(STPINController *)self canRecoveryAuthenticate])
  {
    uint64_t v13 = [v11 managedObjectContext];
    [v13 refreshObject:v11 mergeChanges:1];
    if (!v11 || [v11 isDeleted])
    {
      uint64_t v14 = +[STLog pinController];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[STPINController _authenticateWithPIN:forUser:allowPasscodeRecovery:error:](v11, v14);
      }

      if (a6)
      {
        BOOL v15 = 0;
        *a6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:11 userInfo:0];
LABEL_36:

        goto LABEL_37;
      }
LABEL_12:
      BOOL v15 = 0;
      goto LABEL_36;
    }
    BOOL v19 = [v11 effectivePasscode];
    if (v19)
    {
      if (([v10 isEqualToString:v19] & 1) == 0)
      {
        if (v12)
        {
          objc_msgSend(v11, "setPasscodeRecoveryAttemptCount:", objc_msgSend(v11, "passcodeRecoveryAttemptCount") + 1);
          v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:25 userInfo:0];
        }
        else
        {
          uint64_t v22 = [v11 passcodeEntryAttemptCount];
          uint64_t v23 = v22 + 1;
          [v11 setPasscodeEntryAttemptCount:v22 + 1];
          char v24 = +[STScreenTimeCoreBundle bundle];
          uint64_t v25 = [v24 localizedStringForKey:@"PINIncorrectError" value:&stru_1F3487700 table:0];

          if (v22 < 5)
          {
            v35[0] = *MEMORY[0x1E4F28568];
            v35[1] = @"PINAuthenticationAttempts";
            v36[0] = v25;
            v26 = [NSNumber numberWithLongLong:v23];
            v36[1] = v26;
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
          }
          else
          {
            v26 = [(STPINController *)self _timeoutEndDateForAttemptNumber:v23];
            [(STPINController *)self _beginTimeoutUntilDate:v26];
            [v11 setPasscodeEntryTimeoutEndDate:v26];
            uint64_t v27 = *MEMORY[0x1E4F28568];
            v38[0] = v25;
            v37[0] = v27;
            v37[1] = @"PINAuthenticationAttempts";
            uint64_t v28 = [NSNumber numberWithLongLong:v23];
            v37[2] = @"PINTimeoutDate";
            v38[1] = v28;
            v38[2] = v26;
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
          }
          v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:18 userInfo:v29];
        }
        goto LABEL_27;
      }
      [v11 setPasscodeEntryAttemptCount:0];
      [v11 setPasscodeEntryTimeoutEndDate:0];
      [v11 setPasscodeRecoveryAttemptCount:0];
      [(STPINController *)self setTimeoutEndDate:0];
    }
    else
    {
      BOOL v20 = +[STLog pinController];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[STPINController _authenticateWithPIN:forUser:allowPasscodeRecovery:error:](v20);
      }

      [v11 setPasscodeEntryAttemptCount:0];
    }
    v21 = 0;
LABEL_27:
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      id v34 = 0;
      char v30 = [v13 save:&v34];
      id v31 = v34;
      if ((v30 & 1) == 0)
      {
        id v32 = +[STLog pinController];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
          -[STPINController _authenticateWithPIN:forUser:allowPasscodeRecovery:error:]((uint64_t)v31, v32);
        }
      }
    }
    if (a6) {
      *a6 = v21;
    }
    BOOL v15 = v21 == 0;

    goto LABEL_36;
  }
  if (a6)
  {
    id v16 = +[STScreenTimeCoreBundle bundle];
    uint64_t v13 = [v16 localizedStringForKey:@"PINEntryTimeoutError" value:&stru_1F3487700 table:0];

    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40[0] = v13;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    *a6 = (id)[v17 initWithDomain:@"STErrorDomain" code:24 userInfo:v18];

    goto LABEL_12;
  }
  BOOL v15 = 0;
LABEL_37:

  return v15;
}

- (id)_timeoutEndDateForAttemptNumber:(int64_t)a3
{
  double v3 = 0.0;
  unint64_t v4 = a3 - 6;
  if (a3 >= 6)
  {
    if (v4 > 2) {
      double v3 = 3600.0;
    }
    else {
      double v3 = dbl_1DA5B3188[v4];
    }
  }
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v3];
}

- (void)_beginTimeoutUntilDate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(STPINController *)self setTimeoutEndDate:v4];
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  if (!csr_check())
  {
    BOOL v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v8 = [v7 integerForKey:@"com.apple.ScreenTimeAgent.PINTimeoutIntervalOverride"];

    if (v8 >= 1)
    {
      uint64_t v9 = +[STLog pinController];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[STPINController _beginTimeoutUntilDate:](v9);
      }

      double v6 = (double)v8;
    }
  }
  id v10 = +[STLog pinController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v20 = vcvtpd_s64_f64(v6);
    _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_INFO, "Scheduled PIN timeout for %d seconds", buf, 8u);
  }

  id v11 = [MEMORY[0x1E4F28F08] mainQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__STPINController__beginTimeoutUntilDate___block_invoke;
  v17[3] = &unk_1E6BC7D98;
  v17[4] = self;
  id v12 = v4;
  id v18 = v12;
  [v11 addOperationWithBlock:v17];

  uint64_t v13 = [(STPINController *)self backoffTimer];

  if (!v13)
  {
    uint64_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__STPINController__beginTimeoutUntilDate___block_invoke_2;
    handler[3] = &unk_1E6BC7DC0;
    handler[4] = self;
    dispatch_source_set_event_handler(v14, handler);
    [(STPINController *)self setBackoffTimer:v14];
    dispatch_activate(v14);
  }
}

void __42__STPINController__beginTimeoutUntilDate___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v6 = @"TimeoutEndDate";
  v7[0] = v3;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"PINTimeoutDidBegin" object:v4 userInfo:v5];
}

void __42__STPINController__beginTimeoutUntilDate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backoffTimer];
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) setBackoffTimer:0];
  uint64_t v3 = +[STLog pinController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v3, OS_LOG_TYPE_INFO, "PIN backoff time fired", buf, 2u);
  }

  uint64_t v4 = +[STLog pinController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1DA519000, v4, OS_LOG_TYPE_DEFAULT, "PIN backoff time fired", v6, 2u);
  }

  [*(id *)(a1 + 32) setTimeoutEndDate:0];
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PINTimeoutDidEnd" object:*(void *)(a1 + 32) userInfo:0];
}

- (NSDate)timeoutEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimeoutEndDate:(id)a3
{
}

- (STCoreUser)user
{
  return self->_user;
}

- (OS_dispatch_source)backoffTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackoffTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_timeoutEndDate, 0);
}

- (void)initWithUser:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = [a2 dsid];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1DA519000, a3, OS_LOG_TYPE_DEBUG, "Created new PinController: %@ for user: %@", (uint8_t *)&v6, 0x16u);
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to get user: %{public}@", v2, v3, v4, v5, v6);
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to delete managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setPasscode:recoveryAppleID:forUser:error:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to save managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_saveChangesForUser:(NSObject *)a3 error:.cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 objectID];
  uint64_t v6 = *a2;
  int v7 = 138543618;
  __int16 v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1DA519000, a3, OS_LOG_TYPE_ERROR, "Failed to save PIN for %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

void __45__STPINController_authenticateWithPIN_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to authenticate PIN: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_authenticateWithPIN:(void *)a1 forUser:(NSObject *)a2 allowPasscodeRecovery:error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = [a1 isDeleted];
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to get user - was deleted: %d", (uint8_t *)v3, 8u);
}

- (void)_authenticateWithPIN:(uint64_t)a1 forUser:(NSObject *)a2 allowPasscodeRecovery:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Failed to save pin entry attempt count: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_authenticateWithPIN:(os_log_t)log forUser:allowPasscodeRecovery:error:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "WARN: Attempting to authenticate against an unset PIN, this seems unexpected", v1, 2u);
}

- (void)_beginTimeoutUntilDate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Overriding PIN timeout", v1, 2u);
}

@end