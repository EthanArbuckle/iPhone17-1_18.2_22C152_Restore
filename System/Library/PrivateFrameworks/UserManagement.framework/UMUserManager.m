@interface UMUserManager
+ (id)sharedManager;
- (BOOL)canAccessUserProperties;
- (BOOL)haveValidPersonaContextForIDString:(id)a3;
- (BOOL)haveValidPersonaContextForPersonaUniqueString:(id)a3;
- (BOOL)isLoginSession;
- (BOOL)isMultiUser;
- (BOOL)isSharedIPad;
- (BOOL)migrateGuestUserVolume:(id)a3 withError:(id *)a4;
- (BOOL)migrateSharedAndPrimaryUserVolumeWithError:(id *)a3;
- (BOOL)personaLoginWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5;
- (BOOL)personaLogoutWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5;
- (BOOL)setBundleIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 withError:(id *)a5;
- (BOOL)setKeybagOpaqueDataForUser:(id)a3 withOpaqueData:(id)a4 withError:(id *)a5;
- (BOOL)userExists:(id)a3;
- (NSArray)allUsers;
- (NSArray)allUsersUnfiltered;
- (UMUser)currentUser;
- (UMUser)loginUser;
- (UMUserManager)init;
- (UMUserPersona)currentPersona;
- (id)bundleIdentifiersforPersonaWithPersonaUniqueString:(id)a3 withError:(id *)a4;
- (id)currentUserSwitchContext;
- (id)keybagOpaqueDataForUser:(id)a3 withError:(id *)a4;
- (id)listAllPersonaAttributesWithError:(id *)a3;
- (id)listAllPersonaWithAttributes;
- (unint64_t)maxNumberOfUsers;
- (unint64_t)personaGenerationIdentifierWithError:(id *)a3;
- (unint64_t)userQuotaSize;
- (void)createUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)createUserPersona:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)createUserPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 completionHandler:(id)a6;
- (void)currentUserSwitchContextHasBeenUsed;
- (void)deleteUser:(id)a3 completionHandler:(id)a4;
- (void)deleteUserPersonaWithIDString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)deleteUserPersonaWithPersonaUniqueString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)deleteUserPersonaWithProfileInfo:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)deleteUserPersonaWithType:(int)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)disableUser:(id)a3 completionHandler:(id)a4;
- (void)disableUserPersonaWithProfileInfo:(id)a3 completionHandler:(id)a4;
- (void)fetchAllPersonasForAllUsersWithCompletionHandler:(id)a3;
- (void)fetchAllPersonasWithCompletionHandler:(id)a3;
- (void)fetchAsidMapOfAllUsersWithCompletionHandler:(id)a3;
- (void)fetchBundleIdentifierForPersonaWithIDString:(id)a3 completionHandler:(id)a4;
- (void)fetchBundleIdentifierForPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4;
- (void)fetchBundleIdentifierForType:(int)a3 completionHandler:(id)a4;
- (void)fetchMultiPersonaBundleIdentifierWithcompletionHandler:(id)a3;
- (void)fetchPersonaWithIDString:(id)a3 CompletionHandler:(id)a4;
- (void)fetchPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4;
- (void)fetchPersonaWithType:(int)a3 CompletionHandler:(id)a4;
- (void)loadUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)loginUICheckInWithCompletionHandler:(id)a3;
- (void)logoutToLoginSessionWithCompletionHandler:(id)a3;
- (void)registerCriticalUserSwitchStakeHolder:(id)a3;
- (void)registerPersonaListUpdateObserver:(id)a3 completionHandler:(id)a4;
- (void)registerPersonaListUpdateObserver:(id)a3 withMachService:(id)a4 completionHandler:(id)a5;
- (void)registerUserListUpdateObserver:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4;
- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4;
- (void)resumeQuotas;
- (void)resumeSync;
- (void)setBundlesIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 completionHandler:(id)a5;
- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaType:(int)a4 completionHandler:(id)a5;
- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaWithIDString:(id)a4 completionHandler:(id)a5;
- (void)setMultiPersonaBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setupUMUserSessionProvisioning:(id)a3 WithCompletionHandler:(id)a4;
- (void)suspendQuotasWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)terminateSyncWithCompletionHandler:(id)a3;
- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5;
- (void)userInteractionIsEnabled;
- (void)userListDidUpdate;
@end

@implementation UMUserManager

- (BOOL)isLoginSession
{
  return sub_190C3A468();
}

- (UMUserPersona)currentPersona
{
  return sub_190C3A85C();
}

- (BOOL)isSharedIPad
{
  return sub_190C3AB20();
}

- (BOOL)isMultiUser
{
  return sub_190C3AB20();
}

- (UMUserManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)UMUserManager;
  result = [(UMUserManager *)&v3 init];
  if (result) {
    result->_switchIsOccurring = 0;
  }
  return result;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C3A094;
  block[3] = &unk_1E56C5FF8;
  block[4] = a1;
  if (qword_1EB2197F8 != -1) {
    dispatch_once(&qword_1EB2197F8, block);
  }
  v2 = (void *)qword_1EB2197F0;
  return v2;
}

- (unint64_t)personaGenerationIdentifierWithError:(id *)a3
{
  v4 = sub_190C3C34C();
  unint64_t v5 = sub_190C3BE3C((uint64_t)v4, a3);

  return v5;
}

- (unint64_t)maxNumberOfUsers
{
  return sub_190C3F224();
}

- (unint64_t)userQuotaSize
{
  return sub_190C3F610();
}

- (BOOL)canAccessUserProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C46080;
  block[3] = &unk_1E56C6280;
  block[4] = self;
  if (qword_1E92A9940 != -1) {
    dispatch_once(&qword_1E92A9940, block);
  }
  return (byte_1E92A9938 & 1) == 0;
}

- (UMUser)currentUser
{
  return (UMUser *)sub_190C3F7D8();
}

- (UMUser)loginUser
{
  return (UMUser *)sub_190C3F878();
}

- (void)userListDidUpdate
{
  sub_190C46128(self);
  if (self)
  {
    p_userListUpdateObserver = &self->_userListUpdateObserver;
    id WeakRetained = objc_loadWeakRetained((id *)p_userListUpdateObserver);

    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)p_userListUpdateObserver);
      objc_msgSend_userListDidUpdate(v7, v5, v6);
    }
  }
}

- (void)loadUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_190C3C52C();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_190C463EC;
  v15[3] = &unk_1E56C62F8;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  sub_190C3C78C((uint64_t)v11, self, v15);
}

- (void)createUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_190C3C52C();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_190C46684;
  v15[3] = &unk_1E56C62F8;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  sub_190C3C78C((uint64_t)v11, self, v15);
}

- (void)deleteUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_190C3C52C();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190C46948;
  v11[3] = &unk_1E56C6320;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_190C3C78C((uint64_t)v8, self, v11);
}

- (void)disableUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_190C3C52C();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190C46BE8;
  v11[3] = &unk_1E56C6348;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  sub_190C3C78C((uint64_t)v8, self, v11);
}

- (void)registerUserListUpdateObserver:(id)a3
{
  id obj = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    sub_190C3E6E4((uint64_t)UMAbort, @"%@ does not implement necessary observer methods", v4, v5, v6, v7, v8, v9, (uint64_t)obj);
  }
  if (self) {
    objc_storeWeak((id *)&self->_userListUpdateObserver, obj);
  }
  MEMORY[0x1F41817F8]();
}

- (void)switchToLoginUserWithCompletionHandler:(id)a3
{
}

- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_190C4705C;
  v55[3] = &unk_1E56C6370;
  v55[4] = self;
  id v8 = v7;
  id v56 = v8;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x192FD5500](v55);
  if (!objc_msgSend_isSharedIPad(self, v10, v11))
  {
    unint64_t v28 = 0;
    goto LABEL_6;
  }
  id v12 = sub_190C49D0C();
  sub_190C49FC4((uint64_t)v12, @"Switch to login screen", v13, v14, v15, v16, v17, v18, v53);

  if (self)
  {
    if (self->_switchIsOccurring)
    {
      v21 = sub_190C49D0C();
      sub_190C49FC4((uint64_t)v21, @"A switch was already initiated", v22, v23, v24, v25, v26, v27, v54);

      unint64_t v28 = 5;
LABEL_6:
      v29 = sub_190C3D020((uint64_t)UMError, v28);
      ((void (**)(void, void *))v9)[2](v9, v29);
      goto LABEL_7;
    }
    self->_switchIsOccurring = 1;
  }
  if (v6)
  {
    v30 = objc_msgSend_currentUser(self, v19, v20);
    v33 = objc_msgSend_mutableCopy(v30, v31, v32);

    objc_msgSend_setErrorCausingLogout_(v33, v34, (uint64_t)v6);
    objc_msgSend_setDebugErrorCausingLogout_(v33, v35, (uint64_t)v6);
    objc_msgSend_commitChanges(v33, v36, v37);
    v44 = sub_190C3B80C((uint64_t)UMLogMessage, @"An error caused this switch", v38, v39, v40, v41, v42, v43, v54);
    sub_190C4CE30((uint64_t)v44, @"Error: %@", v45, v46, v47, v48, v49, v50, (uint64_t)v6);
    v51 = sub_190C49DF4();
    sub_190C3B464((uint64_t)v51, v44);
  }
  v29 = sub_190C4D8F4();
  objc_msgSend_switchToLoginUserWithCompletionHandler_(v29, v52, (uint64_t)v9);
LABEL_7:
}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = (uint64_t)sub_190C47254;
  v26[3] = (uint64_t)&unk_1E56C6370;
  v26[4] = (uint64_t)self;
  id v5 = v4;
  id v27 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x192FD5500](v26);
  if (!objc_msgSend_isSharedIPad(self, v7, v8))
  {
    unint64_t v23 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v9, @"Switch to login screen", v10, v11, v12, v13, v14, v15, v26[0]);

  if (!self)
  {
LABEL_8:
    uint64_t v24 = sub_190C4D8F4();
    objc_msgSend_logoutToLoginSessionWithCompletionHandler_(v24, v25, (uint64_t)v6);
    goto LABEL_9;
  }
  if (!self->_switchIsOccurring)
  {
    self->_switchIsOccurring = 1;
    goto LABEL_8;
  }
  uint64_t v16 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v16, @"A switch was already initiated", v17, v18, v19, v20, v21, v22, v26[0]);

  unint64_t v23 = 5;
LABEL_6:
  uint64_t v24 = sub_190C3D020((uint64_t)UMError, v23);
  ((void (**)(void, void *))v6)[2](v6, v24);
LABEL_9:
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6
{
}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = (uint64_t)sub_190C476A4;
  v86[3] = (uint64_t)&unk_1E56C6370;
  v86[4] = (uint64_t)self;
  id v17 = v16;
  id v87 = v17;
  uint64_t v18 = (void (**)(void, void))MEMORY[0x192FD5500](v86);
  if (!objc_msgSend_isSharedIPad(self, v19, v20))
  {
    uint64_t v28 = sub_190C3C3A4();
    v35 = (void *)v28;
    v36 = @"NOT IN MULTISUER/LOGINUSER directswitch not Supported";
    goto LABEL_5;
  }
  unint64_t v23 = objc_msgSend_currentUser(self, v21, v22);
  int isLoginUser = objc_msgSend_isLoginUser(v23, v24, v25);

  if (isLoginUser)
  {
    uint64_t v28 = sub_190C3C3A4();
    v35 = (void *)v28;
    v36 = @"directswitch from LoginUI User notsupported";
LABEL_5:
    sub_190C49FC4(v28, v36, v29, v30, v31, v32, v33, v34, v86[0]);

    unint64_t v37 = 0;
LABEL_6:
    uint64_t v38 = sub_190C3D020((uint64_t)UMError, v37);
    goto LABEL_7;
  }
  if (!objc_msgSend_userExists_(self, v27, (uint64_t)v12))
  {
    uint64_t v48 = sub_190C3C3A4();
    sub_190C49FC4((uint64_t)v48, @"directswitch non existing user", v49, v50, v51, v52, v53, v54, v86[0]);

    unint64_t v37 = 2;
    goto LABEL_6;
  }
  if (self)
  {
    BOOL switchIsOccurring = self->_switchIsOccurring;
    uint64_t v40 = sub_190C3C3A4();
    uint64_t v47 = (void *)v40;
    if (switchIsOccurring)
    {
      sub_190C49FC4(v40, @"switch(from directswitch) was already initiated", v41, v42, v43, v44, v45, v46, v86[0]);

      unint64_t v37 = 5;
      goto LABEL_6;
    }
    v55 = sub_190C4CFC8((uint64_t)UMLogMessage, v12, @"DirectSwitch to user", v42, v43, v44, v45, v46, v86[0]);
    sub_190C3B464((uint64_t)v47, v55);

    self->_BOOL switchIsOccurring = 1;
  }
  else
  {
    v79 = sub_190C3C3A4();
    v85 = sub_190C4CFC8((uint64_t)UMLogMessage, v12, @"DirectSwitch to user", v80, v81, v82, v83, v84, v86[0]);
    sub_190C3B464((uint64_t)v79, v85);
  }
  uint64_t v38 = sub_190C40C4C((uint64_t)UMMobileKeyBag, v12, v13);
  v61 = sub_190C3C3A4();
  if (!v38)
  {
    v63 = sub_190C4CFC8((uint64_t)UMLogMessage, v12, @"loaduser NO ERROR", v56, v57, v58, v59, v60, v86[0]);
    sub_190C3B464((uint64_t)v61, v63);

    v66 = objc_msgSend_mutableCopy(v12, v64, v65);
    objc_msgSend_setDebugErrorCausingLogout_(v66, v67, 0);
    objc_msgSend_commitChanges(v66, v68, v69);
    v70 = sub_190C3C3A4();
    v76 = sub_190C4CFC8((uint64_t)UMLogMessage, v12, @"calling xpcserver direct switch user", v71, v72, v73, v74, v75, v86[0]);
    sub_190C3B464((uint64_t)v70, v76);

    v77 = sub_190C4D8F4();
    objc_msgSend_directSwitchToUser_passcodeData_context_preferences_completionHandler_(v77, v78, (uint64_t)v12, v13, v14, v15, v18);

    goto LABEL_8;
  }
  v62 = sub_190C4CFC8((uint64_t)UMLogMessage, v12, @"load user failed", v56, v57, v58, v59, v60, v86[0]);
  sub_190C3B464((uint64_t)v61, v62);

LABEL_7:
  ((void (**)(void, void *))v18)[2](v18, v38);
LABEL_8:
}

- (void)loginUICheckInWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_190C4D8F4();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginUICheckInWithCompletionHandler_(v5, v4, (uint64_t)v3);
}

- (void)registerUserSwitchStakeHolder:(id)a3
{
}

- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4
{
  id v24 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v7, @"Register user switch stakeholder", v8, v9, v10, v11, v12, v13, v23);

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    sub_190C3E6E4((uint64_t)UMAbort, @"%@ does not implement necessary stakeholder methods", v15, v16, v17, v18, v19, v20, (uint64_t)v24);
  }
  if (objc_msgSend_isSharedIPad(self, v14, v15))
  {
    uint64_t v21 = sub_190C4D8F4();
    objc_msgSend_registerUserSwitchStakeHolder_completionHandler_(v21, v22, (uint64_t)v24, v6);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  id v6 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v6, @"Register user sync stakeholder", v7, v8, v9, v10, v11, v12, v21);

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    sub_190C3E6E4((uint64_t)UMAbort, @"%@ does not implement necessary stakeholder methods", v13, v14, v15, v16, v17, v18, (uint64_t)v22);
  }
  uint64_t v19 = sub_190C4D8F4();
  objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(v19, v20, (uint64_t)v22, v5);
}

- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  sub_190C4D8F4();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterStakeHolder_status_reason_(v10, v9, (uint64_t)v8, a4, v7);
}

- (void)terminateSyncWithCompletionHandler:(id)a3
{
  uint64_t v16 = (void (**)(void))a3;
  id v4 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v4, @"Terminate sync", v5, v6, v7, v8, v9, v10, v15);

  if (objc_msgSend_isSharedIPad(self, v11, v12))
  {
    uint64_t v13 = sub_190C4D8F4();
    objc_msgSend_terminateSyncWithCompletionHandler_(v13, v14, (uint64_t)v16);
  }
  else if (v16)
  {
    v16[2]();
  }
}

- (void)resumeSync
{
  id v3 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v3, @"Resume sync", v4, v5, v6, v7, v8, v9, v14);

  if (objc_msgSend_isSharedIPad(self, v10, v11))
  {
    sub_190C4D8F4();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resumeSync(v15, v12, v13);
  }
}

- (void)createUserPersona:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
}

- (void)createUserPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  sub_190C4D8F4();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C53BE8((uint64_t)v12, v11, v10, a5, v9);
}

- (void)deleteUserPersonaWithIDString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
}

- (void)deleteUserPersonaWithPersonaUniqueString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = kUMUserPersonaUniqueStringKey;
  v15[0] = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v11, (uint64_t)v15, &v14, 1);
  uint64_t v13 = sub_190C4D8F4();

  sub_190C53DB4((uint64_t)v13, v12, (uint64_t)v9, v8);
}

- (void)deleteUserPersonaWithType:(int)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = a5;
  id v9 = a4;
  id v11 = objc_msgSend_numberWithInt_(v7, v10, v6);
  id v15 = kUMUserPersonaTypeKey;
  v16[0] = v11;
  uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v16, &v15, 1);
  uint64_t v14 = sub_190C4D8F4();
  sub_190C53DB4((uint64_t)v14, v13, (uint64_t)v9, v8);
}

- (void)deleteUserPersonaWithProfileInfo:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  sub_190C4D8F4();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C53DB4((uint64_t)v10, v9, (uint64_t)v8, v7);
}

- (void)disableUserPersonaWithProfileInfo:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  sub_190C4D8F4();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C53F58((uint64_t)v7, v6, v5);
}

- (void)fetchPersonaWithIDString:(id)a3 CompletionHandler:(id)a4
{
}

- (void)fetchPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v11 = kUMUserPersonaUniqueStringKey;
  v12[0] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v12, &v11, 1);
  id v10 = sub_190C4D8F4();

  sub_190C54A18((uint64_t)v10, v9, v6);
}

- (void)fetchPersonaWithType:(int)a3 CompletionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = a4;
  id v8 = objc_msgSend_numberWithInt_(v5, v7, v4);
  id v12 = kUMUserPersonaTypeKey;
  v13[0] = v8;
  id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v13, &v12, 1);
  id v11 = sub_190C4D8F4();
  sub_190C54A18((uint64_t)v11, v10, v6);
}

- (void)fetchAllPersonasWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_190C4D8F4();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C540FC((uint64_t)v4, v3);
}

- (void)fetchAllPersonasForAllUsersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_190C4D8F4();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C54288((uint64_t)v4, v3);
}

- (void)fetchAsidMapOfAllUsersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_190C4D8F4();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C552D8((uint64_t)v4, v3);
}

- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaWithIDString:(id)a4 completionHandler:(id)a5
{
}

- (void)setBundlesIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = kUMUserPersonaUniqueStringKey;
  v15[0] = a4;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v11, (uint64_t)v15, &v14, 1);
  uint64_t v13 = sub_190C4D8F4();

  sub_190C55464((uint64_t)v13, v10, v12, v8);
}

- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaType:(int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend_numberWithInt_(v7, v10, v5);
  id v15 = kUMUserPersonaTypeKey;
  v16[0] = v11;
  uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v16, &v15, 1);
  uint64_t v14 = sub_190C4D8F4();
  sub_190C55464((uint64_t)v14, v9, v13, v8);
}

- (void)setMultiPersonaBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  sub_190C4D8F4();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C55C00((uint64_t)v7, v6, v5);
}

- (void)fetchBundleIdentifierForPersonaWithIDString:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchBundleIdentifierForPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v11 = kUMUserPersonaUniqueStringKey;
  v12[0] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v12, &v11, 1);
  id v10 = sub_190C4D8F4();

  sub_190C55A58((uint64_t)v10, v9, v6);
}

- (void)fetchBundleIdentifierForType:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = a4;
  id v8 = objc_msgSend_numberWithInt_(v5, v7, v4);
  id v12 = kUMUserPersonaTypeKey;
  v13[0] = v8;
  id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v13, &v12, 1);
  id v11 = sub_190C4D8F4();
  sub_190C55A58((uint64_t)v11, v10, v6);
}

- (void)fetchMultiPersonaBundleIdentifierWithcompletionHandler:(id)a3
{
  id v3 = a3;
  sub_190C4D8F4();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C55DA4((uint64_t)v4, v3);
}

- (id)bundleIdentifiersforPersonaWithPersonaUniqueString:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_isSharedIPad(self, v7, v8))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v9, *MEMORY[0x1E4F28798], 45, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v12 = sub_190C4D8F4();
    id v14 = 0;
    id v11 = sub_190C55F30(v12, v6, &v14);
    id v10 = v14;

    if (!a4) {
      goto LABEL_7;
    }
  }
  if (v10) {
    *a4 = v10;
  }
LABEL_7:

  return v11;
}

- (BOOL)setBundleIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_isSharedIPad(self, v10, v11))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, *MEMORY[0x1E4F28798], 45, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v14 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = sub_190C4D8F4();
    id v17 = 0;
    BOOL v14 = sub_190C5561C(v15, v8, v9, &v17);
    id v13 = v17;

    if (!a5) {
      goto LABEL_7;
    }
  }
  if (v13) {
    *a5 = v13;
  }
LABEL_7:

  return v14;
}

- (id)listAllPersonaAttributesWithError:(id *)a3
{
  id v3 = a3;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  if (objc_msgSend_isSharedIPad(self, a2, (uint64_t)a3))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v4, *MEMORY[0x1E4F28798], 45, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  id v6 = sub_190C4D8F4();
  id v67 = 0;
  id v7 = sub_190C54414(v6, &v67);
  id v5 = v67;

  if (!v7)
  {
LABEL_25:
    id obj = 0;
    uint64_t v18 = 0;
    id v56 = (id)MEMORY[0x1E4F1CBF0];
    if (!v3) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  uint64_t v59 = (uint64_t)v3;
  id v10 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v11 = objc_msgSend_count(v7, v8, v9);
  id v13 = objc_msgSend_arrayWithCapacity_(v10, v12, v11);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v7;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v63, v68, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v64;
    unint64_t v20 = 0x1E92A8000uLL;
LABEL_8:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v64 != v19) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(void **)(*((void *)&v63 + 1) + 8 * v21);
      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v22, v16, (uint64_t)kUMUserPersonaUniqueStringKey);

      if (v23) {
        break;
      }
      uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v22, v24, *(void *)(v20 + 3936));

      if (v30)
      {
        uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v22, v31, *(void *)(v20 + 3936));
        v35 = v32;
        if (v32)
        {
          int v36 = objc_msgSend_integerValue(v32, v33, v34);
          id v61 = v5;
          uint64_t v38 = objc_msgSend_personaAttributesForPersonaType_withError_(UMUserPersonaAttributes, v37, v36, &v61);
          id v28 = v61;

          if (!v38)
          {

LABEL_30:
            uint64_t v18 = 0;
            id v56 = (id)MEMORY[0x1E4F1CBF0];
            id v5 = v28;
            goto LABEL_31;
          }
          objc_msgSend_addObject_(v13, v39, v38);
          uint64_t v18 = (void *)v38;
          id v5 = v28;
        }
        else
        {
          uint64_t v48 = sub_190C3C3A4();
          v55 = sub_190C3B80C((uint64_t)UMLogMessage, @"Invalid Persona type", v49, v50, v51, v52, v53, v54, v59);
          sub_190C3B464((uint64_t)v48, v55);
        }
        goto LABEL_21;
      }
      uint64_t v40 = sub_190C3C3A4();
      uint64_t v47 = sub_190C3B80C((uint64_t)UMLogMessage, @"Invalid Persona attrib", v41, v42, v43, v44, v45, v46, v59);
      sub_190C3B464((uint64_t)v40, v47);

LABEL_22:
      if (v17 == ++v21)
      {
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v63, v68, 16);
        if (v17) {
          goto LABEL_8;
        }
        goto LABEL_28;
      }
    }
    uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)kUMUserPersonaUniqueStringKey);
    id v62 = v5;
    uint64_t v27 = objc_msgSend_personaAttributesForPersonaUniqueString_withError_(UMUserPersonaAttributes, v26, (uint64_t)v25, &v62);
    id v28 = v62;

    if (!v27) {
      goto LABEL_30;
    }
    objc_msgSend_addObject_(v13, v29, v27);
    id v5 = v28;
    uint64_t v18 = (void *)v27;
LABEL_21:
    unint64_t v20 = 0x1E92A8000;
    goto LABEL_22;
  }
  uint64_t v18 = 0;
LABEL_28:

  id v56 = v13;
LABEL_31:
  id v3 = (id *)v59;

  if (v59)
  {
LABEL_32:
    if (v5) {
      *id v3 = v5;
    }
  }
LABEL_34:
  id v57 = v56;

  return v57;
}

- (id)listAllPersonaWithAttributes
{
  int v3 = 4;
  while (1)
  {
    id v4 = objc_msgSend_listAllPersonaAttributesWithError_(self, a2, 0);
    id v5 = v4;
    if (v4) {
      break;
    }
    if (--v3 <= 1) {
      goto LABEL_6;
    }
  }
  id v6 = v4;
LABEL_6:

  return v5;
}

- (BOOL)haveValidPersonaContextForIDString:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_haveValidPersonaContextForPersonaUniqueString_, a3);
}

- (BOOL)haveValidPersonaContextForPersonaUniqueString:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_currentPersona(self, v5, v6);
  id v10 = v7;
  if (v7)
  {
    uint64_t v11 = objc_msgSend_userPersonaUniqueString(v7, v8, v9);
    BOOL v13 = objc_msgSend_compare_(v11, v12, (uint64_t)v4) == 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)personaLoginWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5
{
  if (a5)
  {
    *a5 = 0;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, *MEMORY[0x1E4F28798], 45, 0);
    id v6 = objc_claimAutoreleasedReturnValue();
    *a5 = v6;
  }
  return 0;
}

- (BOOL)personaLogoutWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5
{
  if (a5)
  {
    *a5 = 0;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, *MEMORY[0x1E4F28798], 45, 0);
    id v6 = objc_claimAutoreleasedReturnValue();
    *a5 = v6;
  }
  return 0;
}

- (void)registerPersonaListUpdateObserver:(id)a3 completionHandler:(id)a4
{
}

- (void)registerPersonaListUpdateObserver:(id)a3 withMachService:(id)a4 completionHandler:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  id v10 = sub_190C3B928();
  uint64_t v17 = sub_190C3B80C((uint64_t)UMLogMessage, @"Registering registerPersonaListUpdateObserver", v11, v12, v13, v14, v15, v16, v27);
  sub_190C3B464((uint64_t)v10, v17);

  if (objc_msgSend_isSharedIPad(self, v18, v19))
  {
    v9[2](v9, 0);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      sub_190C3E6E4((uint64_t)UMAbort, @"%@ does not implement necessary observer methods", v20, v21, v22, v23, v24, v25, (uint64_t)v28);
    }
    uint64_t v26 = sub_190C4D8F4();
    sub_190C56FCC(v26, v28, v8, v9);
  }
}

- (void)setupUMUserSessionProvisioning:(id)a3 WithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_190C3B928();
  uint64_t v14 = sub_190C3B80C((uint64_t)UMLogMessage, @"Provisioning iOS for sharediPad", v8, v9, v10, v11, v12, v13, v15);
  sub_190C3B464((uint64_t)v7, v14);

  sub_190C4D8F4();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C571C8(v16, v6, v5);
}

- (BOOL)migrateSharedAndPrimaryUserVolumeWithError:(id *)a3
{
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Migration of SDV & User volume  Requested", v5, v6, v7, v8, v9, v10, v24);
  sub_190C3B464((uint64_t)v4, v11);

  id v26 = 0;
  int v12 = sub_190C4224C((uint64_t)UMMobileKeyBag, &v26);
  id v13 = v26;
  uint64_t v20 = sub_190C3C3A4();
  if (v12)
  {
    uint64_t v21 = @"Migration of SDV & User volume  Completed";
  }
  else
  {
    uint64_t v25 = (uint64_t)v13;
    uint64_t v21 = @"Migration of SDV & User volume  failed with error:%@";
  }
  uint64_t v22 = sub_190C3B80C((uint64_t)UMLogMessage, v21, v14, v15, v16, v17, v18, v19, v25);
  sub_190C3B464((uint64_t)v20, v22);

  if (a3) {
    *a3 = v13;
  }

  return v12;
}

- (BOOL)migrateGuestUserVolume:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = sub_190C3C3A4();
  id v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"Migration of PersonaVolume of Persona:%@ requested", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  sub_190C3B464((uint64_t)v6, v13);

  id v27 = 0;
  int v14 = sub_190C42530((uint64_t)UMMobileKeyBag, v5, &v27);

  id v15 = v27;
  uint64_t v22 = sub_190C3C3A4();
  if (v14)
  {
    uint64_t v23 = @"Migration of PersonaVolume  Completed";
  }
  else
  {
    uint64_t v26 = (uint64_t)v15;
    uint64_t v23 = @"Migration of PersonaVolume failed with error:%@";
  }
  uint64_t v24 = sub_190C3B80C((uint64_t)UMLogMessage, v23, v16, v17, v18, v19, v20, v21, v26);
  sub_190C3B464((uint64_t)v22, v24);

  if (a4) {
    *a4 = v15;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userPersonaUpdateObserver);
  objc_destroyWeak((id *)&self->_userListUpdateObserver);
  objc_storeStrong((id *)&self->_allUsers, 0);
}

- (NSArray)allUsers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_190C39F6C;
  uint64_t v11 = sub_190C39F3C;
  id v12 = 0;
  int v3 = sub_190C3C65C();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190C4936C;
  v6[3] = &unk_1E56C6398;
  v6[4] = &v7;
  sub_190C3BBDC((uint64_t)v3, self, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)allUsersUnfiltered
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_190C39F6C;
  uint64_t v11 = sub_190C39F3C;
  id v12 = 0;
  int v3 = sub_190C3C65C();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190C4951C;
  v6[3] = &unk_1E56C6398;
  v6[4] = &v7;
  sub_190C3BBDC((uint64_t)v3, self, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)userExists:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend_allUsers(self, v5, v6, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend_isEqualToUser_(*(void **)(*((void *)&v14 + 1) + 8 * i), v9, (uint64_t)v4))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v14, v18, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)keybagOpaqueDataForUser:(id)a3 withError:(id *)a4
{
  return sub_190C436C0((uint64_t)UMMobileKeyBag, a3, a4);
}

- (BOOL)setKeybagOpaqueDataForUser:(id)a3 withOpaqueData:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_userExists_(self, v10, (uint64_t)v8))
  {
    char v12 = sub_190C43B68((uint64_t)UMMobileKeyBag, v8, v9, a5);
    id v13 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28798], 2, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    char v12 = 0;
    if (a5 && v13)
    {
      id v13 = v13;
      char v12 = 0;
      *a5 = v13;
    }
  }

  return v12;
}

- (void)registerCriticalUserSwitchStakeHolder:(id)a3
{
  id v19 = a3;
  int v3 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v3, @"Register critical user switch stakeholder", v4, v5, v6, v7, v8, v9, v18);

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    sub_190C3E6E4((uint64_t)UMAbort, @"%@ does not implement necessary stakeholder methods", v10, v11, v12, v13, v14, v15, (uint64_t)v19);
  }
  long long v16 = sub_190C4D8F4();
  objc_msgSend_registerCriticalUserSwitchStakeHolder_(v16, v17, (uint64_t)v19);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v56 = MEMORY[0x1E4F143A8];
  uint64_t v57 = 3221225472;
  uint64_t v58 = sub_190C49B38;
  uint64_t v59 = &unk_1E56C6370;
  uint64_t v60 = self;
  id v17 = v16;
  id v61 = v17;
  uint64_t v18 = (void (**)(void, void))MEMORY[0x192FD5500](&v56);
  if (objc_msgSend_isSharedIPad(self, v19, v20))
  {
    uint64_t v23 = objc_msgSend_currentUser(self, v21, v22, v56, v57, v58, v59, v60);
    int isLoginUser = objc_msgSend_isLoginUser(v23, v24, v25);

    if (!isLoginUser)
    {
      unint64_t v38 = 0;
      goto LABEL_12;
    }
  }
  if (!objc_msgSend_isSharedIPad(self, v21, v22, v56)
    || !objc_msgSend_isLoginUser(v12, v27, v28))
  {
    if (objc_msgSend_userExists_(self, v27, (uint64_t)v12))
    {
      if (self)
      {
        BOOL switchIsOccurring = self->_switchIsOccurring;
        uint64_t v30 = sub_190C49D0C();
        unint64_t v37 = (void *)v30;
        if (switchIsOccurring)
        {
          sub_190C49FC4(v30, @"A switch was already initiated", v31, v32, v33, v34, v35, v36, v56);

          unint64_t v38 = 5;
LABEL_12:
          uint64_t v39 = sub_190C3D020((uint64_t)UMError, v38);
          goto LABEL_13;
        }
        uint64_t v40 = sub_190C4CFC8((uint64_t)UMLogMessage, v12, @"Switch to user", v32, v33, v34, v35, v36, v56);
        sub_190C3B464((uint64_t)v37, v40);

        self->_BOOL switchIsOccurring = 1;
      }
      else
      {
        uint64_t v49 = sub_190C49D0C();
        v55 = sub_190C4CFC8((uint64_t)UMLogMessage, v12, @"Switch to user", v50, v51, v52, v53, v54, v56);
        sub_190C3B464((uint64_t)v49, v55);
      }
      uint64_t v39 = sub_190C40C4C((uint64_t)UMMobileKeyBag, v12, v13);
      if (!v39)
      {
        uint64_t v43 = objc_msgSend_mutableCopy(v12, v41, v42);
        objc_msgSend_setDebugErrorCausingLogout_(v43, v44, 0);
        objc_msgSend_commitChanges(v43, v45, v46);
        uint64_t v47 = sub_190C4D8F4();
        objc_msgSend_switchToUser_passcodeData_context_preferences_completionHandler_(v47, v48, (uint64_t)v12, v13, v14, v15, v18);

        goto LABEL_14;
      }
LABEL_13:
      ((void (**)(void, void *))v18)[2](v18, v39);
LABEL_14:

      goto LABEL_15;
    }
    unint64_t v38 = 2;
    goto LABEL_12;
  }
  v18[2](v18, 0);
LABEL_15:
}

- (void)suspendQuotasWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_190C4D8F4();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_suspendQuotasWithCompletionHandler_(v5, v4, (uint64_t)v3);
}

- (void)resumeQuotas
{
  sub_190C4D8F4();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resumeQuotas(v4, v2, v3);
}

- (void)userInteractionIsEnabled
{
  if (objc_msgSend_isSharedIPad(self, a2, v2))
  {
    sub_190C4D8F4();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userInteractionIsEnabled(v5, v3, v4);
  }
}

- (id)currentUserSwitchContext
{
  return sub_190C40474();
}

- (void)currentUserSwitchContextHasBeenUsed
{
}

@end