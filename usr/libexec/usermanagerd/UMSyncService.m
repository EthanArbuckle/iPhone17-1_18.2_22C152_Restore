@interface UMSyncService
+ (id)sharedService;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3;
- (BOOL)retrievePasscodeFromFileHandle:(id)a3 ofLength:(unint64_t)a4 withbaseaddress:(char *)a5;
- (id)externalizeUserDictionary:(id)a3;
- (id)remoteServiceName;
- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5;
- (void)MKBUserSessionSetInternalTest:(BOOL)a3 withReply:(id)a4;
- (void)addSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5;
- (void)bundleIdentifiersForPersona:(id)a3 completionHandler:(id)a4;
- (void)clearSyncBubbleUserswithReply:(id)a3;
- (void)configureLoginUIWithUserSessionCount:(int)a3 reply:(id)a4;
- (void)createUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 withOpaqueData:(id)a6 reply:(id)a7;
- (void)currentSyncBubbleIDwithReply:(id)a3;
- (void)dataMigrationSetup:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6;
- (void)deleteUserSessionBlobwithReply:(id)a3;
- (void)deleteUserSessionSecureBlobwithReply:(id)a3;
- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchPersonaGenerationNumberWithCompletionHandler:(id)a3;
- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)foregroundUserSessionAttributesWithReply:(id)a3;
- (void)getUserSessionAttributes:(id)a3 reply:(id)a4;
- (void)grantSandboxExtensionForPersonaWithUniqueString:(id)a3 completionHandler:(id)a4;
- (void)isLoginSessionwithReply:(id)a3;
- (void)limitNumberOfUserSessions:(int)a3 withReply:(id)a4;
- (void)listAllUserSessionIDsWithAReply:(id)a3;
- (void)listSyncBubbleUserswithReply:(id)a3;
- (void)listSyncServiceSourcesForUserSession:(id)a3 withReply:(id)a4;
- (void)loadUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6;
- (void)migrateGuestUserVolume:(id)a3 withReply:(id)a4;
- (void)migrateSharedAndPrimaryUserVolumeWithReply:(id)a3;
- (void)mountUserSessionVolumeforID:(int)a3 withReply:(id)a4;
- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5;
- (void)removeSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5;
- (void)removeUserSession:(id)a3 reply:(id)a4;
- (void)replacePersonaMachPortVoucher:(id)a3 withAccountID:(id)a4 generationSet:(BOOL)a5 forPid:(int)a6 withReply:(id)a7;
- (void)retrieveUserSessionBlobwithReply:(id)a3;
- (void)retrieveUserSessionSecureBackupBlobwithReply:(id)a3;
- (void)setBundlesIdentifiers:(id)a3 forPersona:(id)a4 completionHandler:(id)a5;
- (void)setUserKeybagOpaqueData:(id)a3 keybagBlob:(id)a4 withReply:(id)a5;
- (void)setUserSessionAttributes:(id)a3 reply:(id)a4;
- (void)setUserSessionSecureBackupBlob:(id)a3 withReply:(id)a4;
- (void)startUserSyncBubble:(int)a3 withReply:(id)a4;
- (void)stoptUserSyncBubble:(int)a3 withReply:(id)a4;
- (void)switchBlockTasksInfoWithReply:(id)a3;
- (void)switchToLoginUIUserSessionWithReply:(id)a3;
- (void)switchToUserSession:(id)a3 withOpaqueData:(id)a4 reply:(id)a5;
- (void)unloadUserSession:(id)a3 reply:(id)a4;
- (void)unmountUserSessionVolumeforID:(int)a3 withReply:(id)a4;
- (void)userKeybagOpaqueData:(id)a3 KeybagBlobwithReply:(id)a4;
- (void)userSessionDeviceConfigurationInfo:(int)a3 withReply:(id)a4;
- (void)userSessionLRUInfoWithReply:(id)a3;
@end

@implementation UMSyncService

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066EF8;
  block[3] = &unk_1000D4E28;
  block[4] = a1;
  if (qword_1000E4140 != -1) {
    dispatch_once(&qword_1000E4140, block);
  }
  v2 = (void *)qword_1000E4138;

  return v2;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v3 = a3;
  v4 = +[NSXPCConnection currentConnection];
  v5 = [v4 valueForEntitlement:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)remoteServiceName
{
  v2 = +[NSXPCConnection currentConnection];
  id v3 = [v2 serviceName];

  return v3;
}

- (BOOL)retrievePasscodeFromFileHandle:(id)a3 ofLength:(unint64_t)a4 withbaseaddress:(char *)a5
{
  id v7 = a3;
  v8 = v7;
  if (!a4)
  {
LABEL_16:
    BOOL v9 = 1;
    goto LABEL_17;
  }
  if (read((int)[v7 fileDescriptor], a5, a4) != a4)
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    v10 = (id)qword_1000E4158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = sub_100055404(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        v13 = (const char *)_os_log_send_and_compose_impl();
        v14 = (char *)v13;
        if (v13) {
          sub_100055434(v13);
        }
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    goto LABEL_16;
  }
  BOOL v9 = 0;
LABEL_17:

  return v9;
}

- (id)externalizeUserDictionary:(id)a3
{
  id v3 = [a3 mutableCopy];
  v4 = v3;
  if (v3)
  {
    [v3 removeObjectForKey:kUMUserSessionKeybagOpaqueDataKey];
    v5 = +[NSDictionary dictionaryWithDictionary:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)loadUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (void (**)(id, void, uint64_t))a6;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = sub_100067A84;
  v79 = sub_100067A94;
  id v80 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = sub_100067A84;
  v73 = sub_100067A94;
  id v74 = 0;
  vm_address_t address = 0;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v13 = (id)qword_1000E4158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v67 = 0;
    unsigned int v14 = sub_100055404(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v14 & 0xFFFFFFFE;
    }
    if (v15)
    {
      __int16 v66 = 0;
      v16 = (const char *)_os_log_send_and_compose_impl();
      v17 = (char *)v16;
      if (v16) {
        sub_100055434(v16);
      }
    }
    else
    {
      v17 = 0;
    }
    free(v17);
  }

  if (![(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.load"])
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    v23 = (id)qword_1000E4158;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = 0;
      unsigned int v24 = sub_100055404(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v24 & 0xFFFFFFFE;
      }
      if (v25)
      {
        __int16 v66 = 0;
        v26 = (const char *)_os_log_send_and_compose_impl();
        v27 = (char *)v26;
        if (v26) {
          sub_100055434(v26);
        }
      }
      else
      {
        v27 = 0;
      }
      free(v27);
    }

    uint64_t v34 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
LABEL_74:
    v50 = (void *)v70[5];
    v70[5] = v34;

    if (v12)
    {
LABEL_88:
      v12[2](v12, 0, v70[5]);
      goto LABEL_89;
    }
    goto LABEL_89;
  }
  if (vm_page_size < a5)
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    v18 = (id)qword_1000E4158;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = 0;
      unsigned int v19 = sub_100055404(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        __int16 v66 = 0;
        v21 = (const char *)_os_log_send_and_compose_impl();
        v22 = (char *)v21;
        if (v21) {
          sub_100055434(v21);
        }
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    uint64_t v34 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
    goto LABEL_74;
  }
  if (a5)
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      v28 = (id)qword_1000E4158;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v67 = 0;
        unsigned int v29 = sub_100055404(1);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v30 = v29;
        }
        else {
          unsigned int v30 = v29 & 0xFFFFFFFE;
        }
        if (v30)
        {
          __int16 v66 = 0;
          v31 = (const char *)_os_log_send_and_compose_impl();
          v32 = (char *)v31;
          if (v31) {
            sub_100055434(v31);
          }
        }
        else
        {
          v32 = 0;
        }
        free(v32);
      }

      uint64_t v51 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
      v52 = (void *)v70[5];
      v70[5] = v51;

      vm_address_t address = 0;
      goto LABEL_88;
    }
    vm_address_t v33 = address;
    if ([(UMSyncService *)self retrievePasscodeFromFileHandle:v11 ofLength:a5 withbaseaddress:address])
    {
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      v35 = (id)qword_1000E4158;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v67 = 0;
        unsigned int v36 = sub_100055404(1);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v37 = v36;
        }
        else {
          unsigned int v37 = v36 & 0xFFFFFFFE;
        }
        if (v37)
        {
          __int16 v66 = 0;
          v38 = (const char *)_os_log_send_and_compose_impl();
          v39 = (char *)v38;
          if (v38) {
            sub_100055434(v38);
          }
        }
        else
        {
          v39 = 0;
        }
        free(v39);
      }

      uint64_t v53 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
      v54 = (void *)v70[5];
      v70[5] = v53;

      vm_map_t v55 = mach_task_self_;
      vm_address_t v56 = address;
      vm_size_t v57 = vm_page_size;
      if (vm_page_size >= a5) {
        rsize_t v58 = a5;
      }
      else {
        rsize_t v58 = vm_page_size;
      }
      memset_s((void *)address, v58, 0, v58);
      vm_deallocate(v55, v56, v57);
      goto LABEL_88;
    }
  }
  else
  {
    vm_address_t v33 = 0;
  }
  v40 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067A9C;
  block[3] = &unk_1000D5820;
  vm_address_t v64 = v33;
  unint64_t v65 = a5;
  id v60 = v10;
  v61 = self;
  v62 = &v75;
  v63 = &v69;
  dispatch_sync(v40, block);
  vm_address_t v41 = address;
  if (address)
  {
    vm_map_t v42 = mach_task_self_;
    vm_size_t v43 = vm_page_size;
    if (vm_page_size >= a5) {
      rsize_t v44 = a5;
    }
    else {
      rsize_t v44 = vm_page_size;
    }
    memset_s((void *)address, v44, 0, v44);
    vm_deallocate(v42, v41, v43);
  }
  v12[2](v12, v76[5], v70[5]);
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v45 = (id)qword_1000E4158;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v67 = 0;
    unsigned int v46 = sub_100055404(1);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v47 = v46;
    }
    else {
      unsigned int v47 = v46 & 0xFFFFFFFE;
    }
    if (v47)
    {
      __int16 v66 = 0;
      v48 = (const char *)_os_log_send_and_compose_impl();
      v49 = (char *)v48;
      if (v48) {
        sub_100055434(v48);
      }
    }
    else
    {
      v49 = 0;
    }
    free(v49);
  }

LABEL_89:
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
}

- (void)unloadUserSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v28 = 0;
  unsigned int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100067A84;
  v32 = sub_100067A94;
  id v33 = 0;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v8 = (id)qword_1000E4158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = 0;
    unsigned int v9 = sub_100055404(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = v9 & 0xFFFFFFFE;
    }
    if (v10)
    {
      __int16 v26 = 0;
      id v11 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v12 = (char *)v11;
      if (v11) {
        sub_100055434(v11);
      }
    }
    else
    {
      unsigned int v12 = 0;
    }
    free(v12);
  }

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.load"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000681A0;
    block[3] = &unk_1000D5848;
    void block[4] = &v28;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
    v7[2](v7, v29[5]);
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    v13 = (id)qword_1000E4158;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = 0;
      unsigned int v14 = sub_100055404(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        __int16 v26 = 0;
        v16 = (const char *)_os_log_send_and_compose_impl();
        v17 = (char *)v16;
        if (v16) {
          sub_100055434(v16);
        }
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    v18 = (id)qword_1000E4158;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = 0;
      unsigned int v19 = sub_100055404(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        __int16 v26 = 0;
        v21 = (const char *)_os_log_send_and_compose_impl();
        v22 = (char *)v21;
        if (v21) {
          sub_100055434(v21);
        }
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    uint64_t v23 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    unsigned int v24 = (void *)v29[5];
    v29[5] = v23;

    if (v7) {
      v7[2](v7, v29[5]);
    }
  }
  _Block_object_dispose(&v28, 8);
}

- (void)createUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 withOpaqueData:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  unsigned int v15 = (void (**)(id, uint64_t, uint64_t))a7;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_100067A84;
  v86 = sub_100067A94;
  id v87 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = sub_100067A84;
  id v80 = sub_100067A94;
  id v81 = 0;
  vm_address_t address = 0;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v16 = (id)qword_1000E4158;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v74 = 0;
    unsigned int v17 = sub_100055404(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v18 = v17;
    }
    else {
      unsigned int v18 = v17 & 0xFFFFFFFE;
    }
    if (v18)
    {
      __int16 v73 = 0;
      unsigned int v19 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v20 = (char *)v19;
      if (v19) {
        sub_100055434(v19);
      }
    }
    else
    {
      unsigned int v20 = 0;
    }
    free(v20);
  }

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.load"])
  {
    if (vm_page_size >= a5)
    {
      if (a5)
      {
        if (qword_1000E4160 != -1) {
          dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
        }
        id v33 = (id)qword_1000E4158;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v74 = 0;
          unsigned int v34 = sub_100055404(1);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v35 = v34;
          }
          else {
            unsigned int v35 = v34 & 0xFFFFFFFE;
          }
          if (v35)
          {
            __int16 v73 = 0;
            unsigned int v36 = (const char *)_os_log_send_and_compose_impl();
            unsigned int v37 = (char *)v36;
            if (v36) {
              sub_100055434(v36);
            }
          }
          else
          {
            unsigned int v37 = 0;
          }
          free(v37);
        }

        if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
        {
          if (qword_1000E4160 != -1) {
            dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
          }
          v45 = (id)qword_1000E4158;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v74 = 0;
            unsigned int v46 = sub_100055404(1);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
              unsigned int v47 = v46;
            }
            else {
              unsigned int v47 = v46 & 0xFFFFFFFE;
            }
            if (v47)
            {
              __int16 v73 = 0;
              v48 = (const char *)_os_log_send_and_compose_impl();
              v49 = (char *)v48;
              if (v48) {
                sub_100055434(v48);
              }
            }
            else
            {
              v49 = 0;
            }
            free(v49);
          }

          uint64_t v55 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
          vm_address_t v56 = (void *)v77[5];
          v77[5] = v55;

          vm_address_t address = 0;
          goto LABEL_110;
        }
        if ([(UMSyncService *)self retrievePasscodeFromFileHandle:v13 ofLength:a5 withbaseaddress:address])
        {
          if (qword_1000E4160 != -1) {
            dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
          }
          v50 = (id)qword_1000E4158;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v74 = 0;
            unsigned int v51 = sub_100055404(1);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
              unsigned int v52 = v51;
            }
            else {
              unsigned int v52 = v51 & 0xFFFFFFFE;
            }
            if (v52)
            {
              __int16 v73 = 0;
              uint64_t v53 = (const char *)_os_log_send_and_compose_impl();
              v54 = (char *)v53;
              if (v53) {
                sub_100055434(v53);
              }
            }
            else
            {
              v54 = 0;
            }
            free(v54);
          }

          uint64_t v66 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
          uint64_t v67 = (void *)v77[5];
          v77[5] = v66;

          vm_map_t v68 = mach_task_self_;
          vm_address_t v69 = address;
          vm_size_t v70 = vm_page_size;
          if (vm_page_size >= a5) {
            rsize_t v71 = a5;
          }
          else {
            rsize_t v71 = vm_page_size;
          }
          memset_s((void *)address, v71, 0, v71);
          vm_deallocate(v68, v69, v70);
          goto LABEL_110;
        }
      }
      else
      {
        if (qword_1000E4160 != -1) {
          dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
        }
        v38 = (id)qword_1000E4158;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v74 = 0;
          unsigned int v39 = sub_100055404(1);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v40 = v39;
          }
          else {
            unsigned int v40 = v39 & 0xFFFFFFFE;
          }
          if (v40)
          {
            __int16 v73 = 0;
            vm_address_t v41 = (const char *)_os_log_send_and_compose_impl();
            vm_map_t v42 = (char *)v41;
            if (v41) {
              sub_100055434(v41);
            }
          }
          else
          {
            vm_map_t v42 = 0;
          }
          free(v42);
        }
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100068D58;
      block[3] = &unk_1000D53D0;
      void block[4] = &v82;
      void block[5] = &v76;
      dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
      vm_address_t v57 = address;
      if (address)
      {
        vm_map_t v58 = mach_task_self_;
        vm_size_t v59 = vm_page_size;
        if (vm_page_size >= a5) {
          rsize_t v60 = a5;
        }
        else {
          rsize_t v60 = vm_page_size;
        }
        memset_s((void *)address, v60, 0, v60);
        vm_deallocate(v58, v57, v59);
      }
      v15[2](v15, v83[5], v77[5]);
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      v61 = (id)qword_1000E4158;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v74 = 0;
        unsigned int v62 = sub_100055404(1);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v63 = v62;
        }
        else {
          unsigned int v63 = v62 & 0xFFFFFFFE;
        }
        if (v63)
        {
          __int16 v73 = 0;
          vm_address_t v64 = (const char *)_os_log_send_and_compose_impl();
          unint64_t v65 = (char *)v64;
          if (v64) {
            sub_100055434(v64);
          }
        }
        else
        {
          unint64_t v65 = 0;
        }
        free(v65);
      }
    }
    else
    {
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      v21 = (id)qword_1000E4158;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v74 = 0;
        unsigned int v22 = sub_100055404(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v23 = v22;
        }
        else {
          unsigned int v23 = v22 & 0xFFFFFFFE;
        }
        if (v23)
        {
          __int16 v73 = 0;
          unsigned int v24 = (const char *)_os_log_send_and_compose_impl();
          unsigned int v25 = (char *)v24;
          if (v24) {
            sub_100055434(v24);
          }
        }
        else
        {
          unsigned int v25 = 0;
        }
        free(v25);
      }

      uint64_t v43 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
      rsize_t v44 = (void *)v77[5];
      v77[5] = v43;

      if (v15) {
LABEL_110:
      }
        v15[2](v15, 0, v77[5]);
    }
  }
  else
  {
    uint64_t v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v27 = (void *)v77[5];
    v77[5] = v26;

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    uint64_t v28 = (id)qword_1000E4158;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v74 = 0;
      unsigned int v29 = sub_100055404(1);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v30 = v29;
      }
      else {
        unsigned int v30 = v29 & 0xFFFFFFFE;
      }
      if (v30)
      {
        __int16 v73 = 0;
        v31 = (const char *)_os_log_send_and_compose_impl();
        v32 = (char *)v31;
        if (v31) {
          sub_100055434(v31);
        }
      }
      else
      {
        v32 = 0;
      }
      free(v32);
    }

    if (v15) {
      goto LABEL_110;
    }
  }
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
}

- (void)dataMigrationSetup:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  uint64_t v76 = 0;
  uint64_t v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = sub_100067A84;
  id v80 = sub_100067A94;
  id v81 = 0;
  vm_address_t address = 0;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  id v13 = (id)qword_1000E4158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v74 = 0;
    unsigned int v14 = sub_100055404(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v14 & 0xFFFFFFFE;
    }
    if (v15)
    {
      __int16 v73 = 0;
      v16 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v17 = (char *)v16;
      if (v16) {
        sub_100055434(v16);
      }
    }
    else
    {
      unsigned int v17 = 0;
    }
    free(v17);
  }

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.migration"])
  {
    if (vm_page_size >= a5)
    {
      if (a5)
      {
        if (qword_1000E4160 != -1) {
          dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
        }
        unsigned int v30 = (id)qword_1000E4158;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v74 = 0;
          unsigned int v31 = sub_100055404(1);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v32 = v31;
          }
          else {
            unsigned int v32 = v31 & 0xFFFFFFFE;
          }
          if (v32)
          {
            __int16 v73 = 0;
            id v33 = (const char *)_os_log_send_and_compose_impl();
            unsigned int v34 = (char *)v33;
            if (v33) {
              sub_100055434(v33);
            }
          }
          else
          {
            unsigned int v34 = 0;
          }
          free(v34);
        }

        if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
        {
          if (qword_1000E4160 != -1) {
            dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
          }
          vm_map_t v42 = (id)qword_1000E4158;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v74 = 0;
            unsigned int v43 = sub_100055404(1);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
              unsigned int v44 = v43;
            }
            else {
              unsigned int v44 = v43 & 0xFFFFFFFE;
            }
            if (v44)
            {
              __int16 v73 = 0;
              v45 = (const char *)_os_log_send_and_compose_impl();
              unsigned int v46 = (char *)v45;
              if (v45) {
                sub_100055434(v45);
              }
            }
            else
            {
              unsigned int v46 = 0;
            }
            free(v46);
          }

          uint64_t v53 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
          v54 = (void *)v77[5];
          v77[5] = v53;

          vm_address_t address = 0;
          goto LABEL_105;
        }
        vm_address_t v47 = address;
        if ([(UMSyncService *)self retrievePasscodeFromFileHandle:v11 ofLength:a5 withbaseaddress:address])
        {
          if (qword_1000E4160 != -1) {
            dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
          }
          v48 = (id)qword_1000E4158;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v74 = 0;
            unsigned int v49 = sub_100055404(1);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
              unsigned int v50 = v49;
            }
            else {
              unsigned int v50 = v49 & 0xFFFFFFFE;
            }
            if (v50)
            {
              __int16 v73 = 0;
              unsigned int v51 = (const char *)_os_log_send_and_compose_impl();
              unsigned int v52 = (char *)v51;
              if (v51) {
                sub_100055434(v51);
              }
            }
            else
            {
              unsigned int v52 = 0;
            }
            free(v52);
          }

          uint64_t v61 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
          unsigned int v62 = (void *)v77[5];
          v77[5] = v61;

          vm_map_t v63 = mach_task_self_;
          vm_address_t v64 = address;
          vm_size_t v65 = vm_page_size;
          if (vm_page_size >= a5) {
            rsize_t v66 = a5;
          }
          else {
            rsize_t v66 = vm_page_size;
          }
          memset_s((void *)address, v66, 0, v66);
          vm_deallocate(v63, v64, v65);
          goto LABEL_105;
        }
      }
      else
      {
        if (qword_1000E4160 != -1) {
          dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
        }
        unsigned int v35 = (id)qword_1000E4158;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v74 = 0;
          unsigned int v36 = sub_100055404(1);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v37 = v36;
          }
          else {
            unsigned int v37 = v36 & 0xFFFFFFFE;
          }
          if (v37)
          {
            __int16 v73 = 0;
            v38 = (const char *)_os_log_send_and_compose_impl();
            unsigned int v39 = (char *)v38;
            if (v38) {
              sub_100055434(v38);
            }
          }
          else
          {
            unsigned int v39 = 0;
          }
          free(v39);
        }

        vm_address_t v47 = 0;
      }
      uint64_t v55 = qword_1000E4320;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000699AC;
      block[3] = &unk_1000D5870;
      vm_address_t v70 = v47;
      unint64_t v71 = a5;
      id v68 = v10;
      vm_address_t v69 = &v76;
      vm_address_t v72 = address;
      dispatch_sync(v55, block);
      v12[2](v12, v77[5]);
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      vm_address_t v56 = (id)qword_1000E4158;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v74 = 0;
        unsigned int v57 = sub_100055404(1);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v58 = v57;
        }
        else {
          unsigned int v58 = v57 & 0xFFFFFFFE;
        }
        if (v58)
        {
          __int16 v73 = 0;
          vm_size_t v59 = (const char *)_os_log_send_and_compose_impl();
          rsize_t v60 = (char *)v59;
          if (v59) {
            sub_100055434(v59);
          }
        }
        else
        {
          rsize_t v60 = 0;
        }
        free(v60);
      }
    }
    else
    {
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      unsigned int v18 = (id)qword_1000E4158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v74 = 0;
        unsigned int v19 = sub_100055404(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20)
        {
          __int16 v73 = 0;
          v21 = (const char *)_os_log_send_and_compose_impl();
          unsigned int v22 = (char *)v21;
          if (v21) {
            sub_100055434(v21);
          }
        }
        else
        {
          unsigned int v22 = 0;
        }
        free(v22);
      }

      uint64_t v40 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
      vm_address_t v41 = (void *)v77[5];
      v77[5] = v40;

      if (v12) {
LABEL_105:
      }
        v12[2](v12, v77[5]);
    }
  }
  else
  {
    uint64_t v23 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    unsigned int v24 = (void *)v77[5];
    v77[5] = v23;

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v25 = (id)qword_1000E4158;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v74 = 0;
      unsigned int v26 = sub_100055404(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v27 = v26;
      }
      else {
        unsigned int v27 = v26 & 0xFFFFFFFE;
      }
      if (v27)
      {
        __int16 v73 = 0;
        uint64_t v28 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v29 = (char *)v28;
        if (v28) {
          sub_100055434(v28);
        }
      }
      else
      {
        unsigned int v29 = 0;
      }
      free(v29);
    }

    if (v12) {
      goto LABEL_105;
    }
  }
  _Block_object_dispose(&v76, 8);
}

- (void)migrateSharedAndPrimaryUserVolumeWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v40 = 0;
  vm_address_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  unsigned int v43 = sub_100067A84;
  unsigned int v44 = sub_100067A94;
  id v45 = 0;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v5 = (id)qword_1000E4158;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = 0;
    unsigned int v6 = sub_100055404(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = v6 & 0xFFFFFFFE;
    }
    if (v7)
    {
      LOWORD(v32) = 0;
      v8 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v9 = (char *)v8;
      if (v8) {
        sub_100055434(v8);
      }
    }
    else
    {
      unsigned int v9 = 0;
    }
    free(v9);
  }

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.migration"])
  {
    uint64_t v36 = 0;
    unsigned int v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A048;
    block[3] = &unk_1000D5898;
    void block[4] = &v36;
    void block[5] = &v32;
    void block[6] = &v40;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
    if (*((unsigned char *)v33 + 24))
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10006A51C;
      v28[3] = &unk_1000D53D0;
      v28[4] = &v36;
      v28[5] = &v40;
      dispatch_sync((dispatch_queue_t)qword_1000E4338, v28);
    }
    else
    {
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      unsigned int v17 = (id)qword_1000E4158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = 0;
        unsigned int v18 = sub_100055404(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v19 = v18;
        }
        else {
          unsigned int v19 = v18 & 0xFFFFFFFE;
        }
        if (v19)
        {
          __int16 v29 = 0;
          unsigned int v20 = (const char *)_os_log_send_and_compose_impl();
          v21 = (char *)v20;
          if (v20) {
            sub_100055434(v20);
          }
        }
        else
        {
          v21 = 0;
        }
        free(v21);
      }
    }
    if (*((unsigned char *)v33 + 24))
    {
      unsigned int v22 = (const void *)v37[3];
      if (v22)
      {
        CFRelease(v22);
        v37[3] = 0;
      }
    }
    v4[2](v4, v41[5]);
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    uint64_t v23 = (id)qword_1000E4158;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = 0;
      unsigned int v24 = sub_100055404(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v24 & 0xFFFFFFFE;
      }
      if (v25)
      {
        __int16 v29 = 0;
        unsigned int v26 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v27 = (char *)v26;
        if (v26) {
          sub_100055434(v26);
        }
      }
      else
      {
        unsigned int v27 = 0;
      }
      free(v27);
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    uint64_t v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    id v11 = (void *)v41[5];
    v41[5] = v10;

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    id v12 = (id)qword_1000E4158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = 0;
      unsigned int v13 = sub_100055404(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        LOWORD(v32) = 0;
        unsigned int v15 = (const char *)_os_log_send_and_compose_impl();
        v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    if (v4) {
      v4[2](v4, v41[5]);
    }
  }
  _Block_object_dispose(&v40, 8);
}

- (void)migrateGuestUserVolume:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v8 = (id)qword_1000E4158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v59 = 0;
    unsigned int v9 = sub_100055404(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = v9 & 0xFFFFFFFE;
    }
    if (v10)
    {
      LOWORD(v54) = 0;
      id v11 = (const char *)_os_log_send_and_compose_impl();
      id v12 = (char *)v11;
      if (v11) {
        sub_100055434(v11);
      }
    }
    else
    {
      id v12 = 0;
    }
    free(v12);
  }

  uint64_t v59 = 0;
  rsize_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  unsigned int v62 = sub_100067A84;
  vm_map_t v63 = sub_100067A94;
  id v64 = 0;
  int v58 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.migration"])
  {
    unsigned int v13 = +[NSXPCConnection currentConnection];
    id v14 = [v13 processIdentifier];

    unsigned int v15 = [(UMSyncService *)self asidForClient:0 withAuid:&v58 withPid:v14];
    v16 = +[NSXPCConnection currentConnection];
    LODWORD(v13) = sub_100046B20((uint64_t)[v16 processIdentifier]);

    uint64_t v54 = 0;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    uint64_t v50 = 0;
    unsigned int v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    unsigned int v17 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006AEB0;
    block[3] = &unk_1000D58C0;
    unsigned int v47 = v15;
    int v48 = v58;
    int v49 = (int)v13;
    unsigned int v44 = &v54;
    id v18 = v6;
    id v43 = v18;
    id v45 = &v59;
    unsigned int v46 = &v50;
    dispatch_sync(v17, block);
    if (*((unsigned char *)v51 + 24))
    {
      unsigned int v19 = qword_1000E4338;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10006AF6C;
      v38[3] = &unk_1000D58E8;
      uint64_t v39 = v18;
      uint64_t v40 = &v54;
      vm_address_t v41 = &v59;
      dispatch_sync(v19, v38);
      unsigned int v20 = (const void *)v55[3];
      if (v20)
      {
        CFRelease(v20);
        v55[3] = 0;
      }
      v21 = v39;
    }
    else
    {
      if (qword_1000E4160 != -1) {
        dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
      }
      v21 = (id)qword_1000E4158;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v29 = sub_100055404(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v30 = v29;
        }
        else {
          unsigned int v30 = v29 & 0xFFFFFFFE;
        }
        if (v30)
        {
          unsigned int v31 = (const char *)_os_log_send_and_compose_impl();
          uint64_t v32 = (char *)v31;
          if (v31) {
            sub_100055434(v31);
          }
        }
        else
        {
          uint64_t v32 = 0;
        }
        free(v32);
      }
    }

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    id v33 = (id)qword_1000E4158;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v34 = sub_100055404(1);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v35 = v34;
      }
      else {
        unsigned int v35 = v34 & 0xFFFFFFFE;
      }
      if (v35)
      {
        uint64_t v36 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v37 = (char *)v36;
        if (v36) {
          sub_100055434(v36);
        }
      }
      else
      {
        unsigned int v37 = 0;
      }
      free(v37);
    }

    v7[2](v7, v60[5]);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
  }
  else
  {
    uint64_t v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v23 = (void *)v60[5];
    v60[5] = v22;

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v24 = (id)qword_1000E4158;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = 0;
      unsigned int v25 = sub_100055404(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v26 = v25;
      }
      else {
        unsigned int v26 = v25 & 0xFFFFFFFE;
      }
      if (v26)
      {
        LOWORD(v50) = 0;
        unsigned int v27 = (const char *)_os_log_send_and_compose_impl();
        uint64_t v28 = (char *)v27;
        if (v27) {
          sub_100055434(v27);
        }
      }
      else
      {
        uint64_t v28 = 0;
      }
      free(v28);
    }

    if (v7) {
      v7[2](v7, v60[5]);
    }
  }
  _Block_object_dispose(&v59, 8);
}

- (void)removeUserSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  unsigned int v34 = sub_100067A84;
  unsigned int v35 = sub_100067A94;
  id v36 = 0;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v8 = (id)qword_1000E4158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = 0;
    unsigned int v9 = sub_100055404(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = v9 & 0xFFFFFFFE;
    }
    if (v10)
    {
      __int16 v29 = 0;
      id v11 = (const char *)_os_log_send_and_compose_impl();
      id v12 = (char *)v11;
      if (v11) {
        sub_100055434(v11);
      }
    }
    else
    {
      id v12 = 0;
    }
    free(v12);
  }

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.delete"])
  {
    unsigned int v13 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B900;
    block[3] = &unk_1000D5910;
    id v27 = v6;
    uint64_t v28 = &v31;
    dispatch_sync(v13, block);
    v7[2](v7, v32[5]);
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    id v14 = (id)qword_1000E4158;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = 0;
      unsigned int v15 = sub_100055404(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        __int16 v29 = 0;
        unsigned int v17 = (const char *)_os_log_send_and_compose_impl();
        id v18 = (char *)v17;
        if (v17) {
          sub_100055434(v17);
        }
      }
      else
      {
        id v18 = 0;
      }
      free(v18);
    }
  }
  else
  {
    uint64_t v19 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    unsigned int v20 = (void *)v32[5];
    v32[5] = v19;

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    v21 = (id)qword_1000E4158;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = 0;
      unsigned int v22 = sub_100055404(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v23 = v22;
      }
      else {
        unsigned int v23 = v22 & 0xFFFFFFFE;
      }
      if (v23)
      {
        __int16 v29 = 0;
        unsigned int v24 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v25 = (char *)v24;
        if (v24) {
          sub_100055434(v24);
        }
      }
      else
      {
        unsigned int v25 = 0;
      }
      free(v25);
    }

    if (v7) {
      v7[2](v7, v32[5]);
    }
  }
  _Block_object_dispose(&v31, 8);
}

- (void)listAllUserSessionIDsWithAReply:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  v5 = (id)qword_1000E4158;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = sub_100055404(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = v6 & 0xFFFFFFFE;
    }
    if (v7)
    {
      v8 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v9 = (char *)v8;
      if (v8) {
        sub_100055434(v8);
      }
    }
    else
    {
      unsigned int v9 = 0;
    }
    free(v9);
  }

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.info"])
  {
    unsigned int v10 = (void *)sub_10001A428();
    if (v10)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
    }
    v4[2](v4, v10, v11);
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v17 = (id)qword_1000E4158;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = sub_100055404(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v19 = v18;
      }
      else {
        unsigned int v19 = v18 & 0xFFFFFFFE;
      }
      if (v19)
      {
        unsigned int v20 = (const char *)_os_log_send_and_compose_impl();
        v21 = (char *)v20;
        if (v20) {
          sub_100055434(v20);
        }
      }
      else
      {
        v21 = 0;
      }
      free(v21);
    }
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    id v12 = (id)qword_1000E4158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = sub_100055404(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        unsigned int v15 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        unsigned int v16 = 0;
      }
      free(v16);
    }

    id v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v4) {
      v4[2](v4, 0, v11);
    }
  }
}

- (void)retrieveUserSessionBlobwithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unsigned int v18 = sub_100067A84;
  unsigned int v19 = sub_100067A94;
  id v20 = 0;
  uint64_t v9 = 0;
  unsigned int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100067A84;
  unsigned int v13 = sub_100067A94;
  id v14 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.retrieve"])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006BF68;
    v8[3] = &unk_1000D53D0;
    v8[4] = &v9;
    v8[5] = &v15;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v8);
    uint64_t v5 = v10[5];
LABEL_5:
    v4[2](v4, v5, v16[5]);
    goto LABEL_6;
  }
  uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  unsigned int v7 = (void *)v16[5];
  v16[5] = v6;

  if (v4)
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (void)deleteUserSessionBlobwithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_100067A84;
  id v12 = sub_100067A94;
  id v13 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.retrieve"])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006C380;
    v7[3] = &unk_1000D53D0;
    v7[4] = v14;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v7);
LABEL_4:
    v4[2](v4, v9[5]);
    goto LABEL_5;
  }
  uint64_t v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  uint64_t v6 = (void *)v9[5];
  v9[5] = v5;

  if (v4) {
    goto LABEL_4;
  }
LABEL_5:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
}

- (void)switchToUserSession:(id)a3 withOpaqueData:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v18 = 0;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100067A84;
  unsigned int v22 = sub_100067A94;
  id v23 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.switch"])
  {
    uint64_t v11 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C894;
    block[3] = &unk_1000D5938;
    uint64_t v17 = &v18;
    id v15 = v8;
    id v16 = v9;
    dispatch_sync(v11, block);
    v10[2](v10, v19[5]);
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    id v13 = (void *)v19[5];
    v19[5] = v12;

    if (v10) {
      v10[2](v10, v19[5]);
    }
  }
  _Block_object_dispose(&v18, 8);
}

- (void)setUserSessionSecureBackupBlob:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unsigned int v24 = sub_100067A84;
  unsigned int v25 = sub_100067A94;
  id v26 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.securebackup"])
  {
    id v8 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CED0;
    block[3] = &unk_1000D5910;
    id v17 = v6;
    uint64_t v18 = &v21;
    dispatch_sync(v8, block);
    v7[2](v7, v22[5]);
  }
  else
  {
    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v10 = (void *)v22[5];
    v22[5] = v9;

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    uint64_t v11 = (id)qword_1000E4158;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = 0;
      unsigned int v12 = sub_100055404(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        __int16 v19 = 0;
        id v14 = (const char *)_os_log_send_and_compose_impl();
        id v15 = (char *)v14;
        if (v14) {
          sub_100055434(v14);
        }
      }
      else
      {
        id v15 = 0;
      }
      free(v15);
    }

    if (v7) {
      v7[2](v7, v22[5]);
    }
  }
  _Block_object_dispose(&v21, 8);
}

- (void)setUserKeybagOpaqueData:(id)a3 keybagBlob:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unsigned int v24 = sub_100067A84;
  unsigned int v25 = sub_100067A94;
  id v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.keybagopaquedata"])
  {
    uint64_t v11 = qword_1000E4320;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006D380;
    void v14[3] = &unk_1000D5960;
    id v17 = v19;
    id v15 = v8;
    id v16 = v9;
    uint64_t v18 = &v21;
    dispatch_sync(v11, v14);
    v10[2](v10, v22[5]);
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    unsigned int v13 = (void *)v22[5];
    v22[5] = v12;

    if (v10) {
      v10[2](v10, v22[5]);
    }
  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)userKeybagOpaqueData:(id)a3 KeybagBlobwithReply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unsigned int v24 = sub_100067A84;
  unsigned int v25 = sub_100067A94;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100067A84;
  __int16 v19 = sub_100067A94;
  id v20 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.keybagopaquedata"]|| [(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.device"])
  {
    id v8 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006D810;
    block[3] = &unk_1000D5988;
    unsigned int v13 = &v15;
    id v12 = v6;
    id v14 = &v21;
    dispatch_sync(v8, block);
    v7[2](v7, v16[5], v22[5]);
  }
  else
  {
    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v10 = (void *)v22[5];
    v22[5] = v9;

    if (v7) {
      v7[2](v7, v16[5], v22[5]);
    }
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)retrieveUserSessionSecureBackupBlobwithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100067A84;
  __int16 v19 = sub_100067A94;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100067A84;
  unsigned int v13 = sub_100067A94;
  id v14 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.securebackup"])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006DC54;
    v8[3] = &unk_1000D53D0;
    v8[4] = &v9;
    v8[5] = &v15;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v8);
    uint64_t v5 = v10[5];
LABEL_5:
    v4[2](v4, v5, v16[5]);
    goto LABEL_6;
  }
  uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  unsigned int v7 = (void *)v16[5];
  v16[5] = v6;

  if (v4)
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (void)deleteUserSessionSecureBlobwithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_100067A84;
  id v12 = sub_100067A94;
  id v13 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.securebackup"])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006E06C;
    v7[3] = &unk_1000D53D0;
    v7[4] = v14;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v7);
LABEL_4:
    v4[2](v4, v9[5]);
    goto LABEL_5;
  }
  uint64_t v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  uint64_t v6 = (void *)v9[5];
  v9[5] = v5;

  if (v4) {
    goto LABEL_4;
  }
LABEL_5:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
}

- (void)getUserSessionAttributes:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  unsigned int v25 = sub_100067A84;
  id v26 = sub_100067A94;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = sub_100067A84;
  id v20 = sub_100067A94;
  id v21 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.info"])
  {
    uint64_t v8 = qword_1000E4320;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006E5C4;
    v11[3] = &unk_1000D59B0;
    id v12 = v6;
    id v13 = self;
    id v14 = &v22;
    int v15 = &v16;
    dispatch_sync(v8, v11);
    v7[2](v7, v23[5], v17[5]);
  }
  else
  {
    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v10 = (void *)v17[5];
    v17[5] = v9;

    if (v7) {
      v7[2](v7, 0, v17[5]);
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)setUserSessionAttributes:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  unsigned int v34 = sub_100067A84;
  unsigned int v35 = sub_100067A94;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100067A84;
  __int16 v29 = sub_100067A94;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_100067A84;
  uint64_t v23 = sub_100067A94;
  id v24 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.info"])
  {
    if (v6)
    {
      uint64_t v8 = [v6 objectForKey:kUMUserSessionIDKey];
      uint64_t v9 = (void *)v20[5];
      v20[5] = v8;
    }
    uint64_t v10 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E9E0;
    block[3] = &unk_1000D59D8;
    id v14 = v6;
    int v15 = self;
    uint64_t v16 = &v31;
    uint64_t v17 = &v25;
    uint64_t v18 = &v19;
    dispatch_sync(v10, block);
    v7[2](v7, v32[5], v26[5]);
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    id v12 = (void *)v26[5];
    v26[5] = v11;

    if (v7) {
      v7[2](v7, 0, v26[5]);
    }
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

- (void)foregroundUserSessionAttributesWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_100067A84;
  uint64_t v16 = sub_100067A94;
  id v17 = 0;
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100067A84;
  uint64_t v10 = sub_100067A94;
  id v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EDF4;
  block[3] = &unk_1000D5988;
  void block[4] = self;
  void block[5] = &v6;
  void block[6] = &v12;
  dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
  v4[2](v4, v7[5], v13[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

- (void)configureLoginUIWithUserSessionCount:(int)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_100067A84;
  uint64_t v33 = sub_100067A94;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100067A84;
  uint64_t v27 = sub_100067A94;
  id v28 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.loginwindow"])
  {
    if (!_os_feature_enabled_impl())
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006F414;
      block[3] = &unk_1000D5A00;
      int v20 = a3;
      void block[5] = &v29;
      void block[6] = &v23;
      void block[4] = self;
      dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
      v6[2](v6, v24[5], v30[5]);
      goto LABEL_30;
    }
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v7 = (id)qword_1000E4158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = 0;
      unsigned int v8 = sub_100055404(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        __int16 v21 = 0;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl();
        id v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
      }
      else
      {
        id v11 = 0;
      }
      free(v11);
    }

    if (qword_1000E4170 != -1) {
      dispatch_once(&qword_1000E4170, &stru_1000D5BD0);
    }
    id v13 = (id)qword_1000E4168;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = 0;
      unsigned int v14 = sub_100055404(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        __int16 v21 = 0;
        uint64_t v16 = (const char *)_os_log_send_and_compose_impl();
        id v17 = (char *)v16;
        if (v16) {
          sub_100055434(v16);
        }
      }
      else
      {
        id v17 = 0;
      }
      free(v17);
    }

    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  }
  uint64_t v18 = (void *)v30[5];
  v30[5] = v12;

  if (v6) {
    v6[2](v6, 0, v30[5]);
  }
LABEL_30:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

- (void)switchToLoginUIUserSessionWithReply:(id)a3
{
  unsigned int v7 = (void (**)(id, void *))a3;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.loginwindow"])
  {
    int v4 = sub_10002A298();
    if (v4)
    {
      uint64_t v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v4 userInfo:0];
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v6 = v7;
    goto LABEL_8;
  }
  uint64_t v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  uint64_t v6 = v7;
  if (v7) {
LABEL_8:
  }
    v6[2](v6, v5);
}

- (void)addSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  unsigned int v9 = (void (**)(id, void *))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    uint64_t v10 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006FB14;
    block[3] = &unk_1000D5A28;
    int v16 = a4;
    id v14 = v8;
    unsigned int v15 = &v17;
    dispatch_sync(v10, block);
    uint64_t v11 = *((int *)v18 + 6);
    if (v11)
    {
      uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v11 userInfo:0];
    }
    else
    {
      uint64_t v12 = 0;
    }
    v9[2](v9, v12);
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v9) {
      v9[2](v9, v12);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)removeSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  unsigned int v9 = (void (**)(id, void *))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    uint64_t v10 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006FF3C;
    block[3] = &unk_1000D5A28;
    int v16 = a4;
    id v14 = v8;
    unsigned int v15 = &v17;
    dispatch_sync(v10, block);
    uint64_t v11 = *((int *)v18 + 6);
    if (v11)
    {
      uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v11 userInfo:0];
    }
    else
    {
      uint64_t v12 = 0;
    }
    v9[2](v9, v12);
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v9) {
      v9[2](v9, v12);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)startUserSyncBubble:(int)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100070344;
    v9[3] = &unk_1000D54C8;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if (v7)
    {
      id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      id v8 = 0;
    }
    v6[2](v6, v8);
  }
  else
  {
    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      v6[2](v6, v8);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (void)stoptUserSyncBubble:(int)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000707A4;
    v9[3] = &unk_1000D54C8;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if (v7)
    {
      id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      id v8 = 0;
    }
    v6[2](v6, v8);
  }
  else
  {
    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      v6[2](v6, v8);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (void)MKBUserSessionSetInternalTest:(BOOL)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100070C08;
    v9[3] = &unk_1000D5A50;
    BOOL v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if (v7)
    {
      id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      id v8 = 0;
    }
    v6[2](v6, v8);
  }
  else
  {
    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      v6[2](v6, v8);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (void)currentSyncBubbleIDwithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000711C4;
    block[3] = &unk_1000D5848;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
    uint64_t v5 = *((unsigned int *)v9 + 6);
    if (v5 == -1)
    {
      uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
      uint64_t v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      uint64_t v6 = 0;
    }
    v4[2](v4, v5, v6);
  }
  else
  {
    uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v4) {
      v4[2](v4, *((unsigned int *)v9 + 6), v6);
    }
  }
  _Block_object_dispose(&v8, 8);
}

- (void)listSyncServiceSourcesForUserSession:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = -1;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100067A84;
  uint64_t v19 = sub_100067A94;
  id v20 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    if (v6)
    {
      uint64_t v8 = qword_1000E4320;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100071568;
      block[3] = &unk_1000D58E8;
      id v12 = v6;
      uint64_t v13 = &v15;
      int v14 = &v21;
      dispatch_sync(v8, block);
      uint64_t v9 = *((int *)v22 + 6);
      if (v9)
      {
        uint64_t v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v9 userInfo:0];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    v7[2](v7, v16[5], v10);
  }
  else
  {
    uint64_t v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v7) {
      v7[2](v7, v16[5], v10);
    }
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)listSyncBubbleUserswithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = sub_100067A84;
  id v12 = sub_100067A94;
  id v13 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100071A54;
    block[3] = &unk_1000D5848;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
    uint64_t v5 = v9[5];
    if (v5)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      uint64_t v5 = v9[5];
    }
    v4[2](v4, v5, v6);
  }
  else
  {
    id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v4) {
      v4[2](v4, 0, v6);
    }
  }
  _Block_object_dispose(&v8, 8);
}

- (void)clearSyncBubbleUserswithReply:(id)a3
{
  int v4 = (void (**)(id, void *))a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100071C3C;
    block[3] = &unk_1000D5848;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
    uint64_t v5 = *((int *)v9 + 6);
    if (v5)
    {
      id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v5 userInfo:0];
    }
    else
    {
      id v6 = 0;
    }
    v4[2](v4, v6);
  }
  else
  {
    id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v4) {
      v4[2](v4, v6);
    }
  }
  _Block_object_dispose(&v8, 8);
}

- (void)limitNumberOfUserSessions:(int)a3 withReply:(id)a4
{
  uint64_t v8 = a4;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    if (sub_100031FF8(a3) == -1)
    {
      id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v7 = (void (*)(void))v8[2];
  }
  else
  {
    id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v7 = (void (*)(void))v8[2];
  }
  v7();
LABEL_9:
}

- (void)switchBlockTasksInfoWithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100067A84;
  int v16 = sub_100067A94;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100072134;
    v7[3] = &unk_1000D53D0;
    v7[4] = &v12;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v7);
    uint64_t v5 = *((int *)v9 + 6);
    if (v5)
    {
      id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v5 userInfo:0];
    }
    else
    {
      id v6 = 0;
    }
    v4[2](v4, v13[5], v6);
  }
  else
  {
    id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v4) {
      v4[2](v4, 0, v6);
    }
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)userSessionLRUInfoWithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = sub_100067A84;
  uint64_t v12 = sub_100067A94;
  id v13 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100072438;
    block[3] = &unk_1000D5848;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, block);
    uint64_t v5 = v9[5];
    if (v5)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      uint64_t v5 = v9[5];
    }
    v4[2](v4, v5, v6);
  }
  else
  {
    id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v4) {
      v4[2](v4, 0, v6);
    }
  }
  _Block_object_dispose(&v8, 8);
}

- (void)mountUserSessionVolumeforID:(int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100072630;
    v9[3] = &unk_1000D54C8;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if (v7)
    {
      uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
    v6[2](v6, v8);
  }
  else
  {
    uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      v6[2](v6, v8);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (void)unmountUserSessionVolumeforID:(int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.synctest"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100072948;
    v9[3] = &unk_1000D54C8;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if (v7)
    {
      uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
    v6[2](v6, v8);
  }
  else
  {
    uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      v6[2](v6, v8);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (void)isLoginSessionwithReply:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100067A84;
  int v24 = sub_100067A94;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.loginwindow"])
  {
    uint64_t v5 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100072CE4;
    block[3] = &unk_1000D5A78;
    int v14 = &v16;
    uint64_t v15 = &v20;
    id v6 = v4;
    id v13 = v6;
    dispatch_sync(v5, block);
    uint64_t v7 = *((int *)v17 + 6);
    if (v7)
    {
      uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
      uint64_t v9 = (void *)v21[5];
      v21[5] = v8;
    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, v21[5]);
  }
  else
  {
    uint64_t v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v11 = (void *)v21[5];
    v21[5] = v10;

    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, v21[5]);
    }
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)userSessionDeviceConfigurationInfo:(int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.deviceconfig"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100072F18;
    v9[3] = &unk_1000D54C8;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E4320, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if (v7)
    {
      uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
    v6[2](v6, v8);
  }
  else
  {
    uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      v6[2](v6, v8);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (void)replacePersonaMachPortVoucher:(id)a3 withAccountID:(id)a4 generationSet:(BOOL)a5 forPid:(int)a6 withReply:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  int v14 = (void (**)(id, uint64_t, uint64_t))a7;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = sub_100067A84;
  int v58 = sub_100067A94;
  id v59 = 0;
  uint64_t v48 = 0;
  int v49 = &v48;
  uint64_t v50 = 0x3032000000;
  unsigned int v51 = sub_100067A84;
  uint64_t v52 = sub_100067A94;
  id v53 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  int v47 = 22;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  int v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  int v43 = 0;
  if (v9)
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    uint64_t v15 = (id)qword_1000E4158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v61 = 0;
      int v16 = sub_100055404(1);
      id v17 = v15;
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        v16 &= ~1u;
      }
      if (v16)
      {
        uint64_t v18 = [(UMSyncService *)self remoteServiceName];
        LODWORD(v60[0]) = 138412290;
        *(void *)((char *)v60 + 4) = v18;
        LODWORD(v31) = 12;
        id v30 = v60;
        int v19 = (char *)_os_log_send_and_compose_impl();

        if (v19) {
          sub_100055434(v19);
        }
      }
      else
      {

        int v19 = 0;
      }
      free(v19);
    }

    goto LABEL_23;
  }
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.background"])
  {
LABEL_23:
    id v25 = +[NSXPCConnection currentConnection];
    int v26 = sub_100046B20((uint64_t)[v25 processIdentifier]);

    uint64_t v27 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100073800;
    block[3] = &unk_1000D5AA0;
    int v40 = a6;
    id v33 = v12;
    unsigned int v35 = &v54;
    id v34 = v13;
    id v36 = v44;
    int v41 = v26;
    unsigned int v37 = v46;
    uint64_t v38 = v42;
    uint64_t v39 = &v48;
    dispatch_sync(v27, block);
    v14[2](v14, v49[5], v55[5]);

    goto LABEL_24;
  }
  if (qword_1000E4160 != -1) {
    dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
  }
  uint64_t v20 = (id)qword_1000E4158;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v60[0] = 0;
    unsigned int v21 = sub_100055404(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = v21 & 0xFFFFFFFE;
    }
    if (v22)
    {
      LODWORD(v61) = 67109120;
      HIDWORD(v61) = a6;
      uint64_t v23 = (const char *)_os_log_send_and_compose_impl();
      int v24 = (char *)v23;
      if (v23) {
        sub_100055434(v23);
      }
    }
    else
    {
      int v24 = 0;
    }
    free(v24);
  }

  uint64_t v28 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  uint64_t v29 = (void *)v55[5];
  v55[5] = v28;

  if (v14) {
    v14[2](v14, v49[5], v55[5]);
  }
LABEL_24:
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v29 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.fetch"])
  {
    unsigned int v7 = [(UMSyncService *)self asidForClient:0 withAuid:&v29 withPid:v4];
    uint64_t v8 = +[NSXPCConnection currentConnection];
    int v9 = sub_100046B20((uint64_t)[v8 processIdentifier]);

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    int v10 = (id)qword_1000E4158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = 0;
      unsigned int v11 = sub_100055404(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        int v30 = 67109120;
        int v31 = v4;
        id v13 = (const char *)_os_log_send_and_compose_impl();
        int v14 = (char *)v13;
        if (v13) {
          sub_100055434(v13);
        }
      }
      else
      {
        int v14 = 0;
      }
      free(v14);
    }

    uint64_t v20 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074384;
    block[3] = &unk_1000D5AC8;
    int v24 = v4;
    unsigned int v25 = v7;
    int v26 = v29;
    int v27 = v9;
    id v23 = v6;
    dispatch_sync(v20, block);

    unsigned int v21 = 0;
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    uint64_t v15 = (id)qword_1000E4158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = 0;
      unsigned int v16 = sub_100055404(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        int v30 = 67109120;
        int v31 = v4;
        uint64_t v18 = (const char *)_os_log_send_and_compose_impl();
        int v19 = (char *)v18;
        if (v18) {
          sub_100055434(v18);
        }
      }
      else
      {
        int v19 = 0;
      }
      free(v19);
    }

    unsigned int v21 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v21);
    }
  }
}

- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100067A84;
  int v29 = sub_100067A94;
  id v30 = 0;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.fetch"])
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v7 = (id)qword_1000E4158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = 0;
      unsigned int v8 = sub_100055404(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        int v31 = 67109120;
        int v32 = a3;
        int v10 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
      }
      else
      {
        unsigned int v11 = 0;
      }
      free(v11);
    }

    unsigned int v17 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000749A0;
    block[3] = &unk_1000D5AF0;
    int v23 = a3;
    unsigned int v22 = &v25;
    id v21 = v6;
    dispatch_sync(v17, block);
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v12 = (id)qword_1000E4158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = 0;
      unsigned int v13 = sub_100055404(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        int v31 = 67109120;
        int v32 = a3;
        uint64_t v15 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        unsigned int v16 = 0;
      }
      free(v16);
    }

    uint64_t v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    int v19 = (void *)v26[5];
    v26[5] = v18;

    if (v6) {
      (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, v26[5]);
    }
  }
  _Block_object_dispose(&v25, 8);
}

- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v5 = (void (**)(id, void, void *))a4;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.fetch"])
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    id v6 = (id)qword_1000E4158;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v7 = sub_100055404(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        unsigned int v9 = (const char *)_os_log_send_and_compose_impl();
        int v10 = (char *)v9;
        if (v9) {
          sub_100055434(v9);
        }
      }
      else
      {
        int v10 = 0;
      }
      free(v10);
    }

    if (v5)
    {
      unsigned int v16 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
LABEL_28:
      v5[2](v5, 0, v16);
      goto LABEL_29;
    }
    unsigned int v16 = 0;
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v11 = (id)qword_1000E4158;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = sub_100055404(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        unsigned int v14 = (const char *)_os_log_send_and_compose_impl();
        uint64_t v15 = (char *)v14;
        if (v14) {
          sub_100055434(v14);
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      free(v15);
    }

    unsigned int v16 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v5) {
      goto LABEL_28;
    }
  }
LABEL_29:
}

- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v9 = (void (**)(id, void))a5;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  int v40 = sub_100067A84;
  int v41 = sub_100067A94;
  id v42 = 0;
  int v36 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.fetch"])
  {
    if (v8) {
      goto LABEL_28;
    }
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    int v10 = (id)qword_1000E4158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0;
      unsigned int v11 = sub_100055404(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        LOWORD(v43) = 0;
        unsigned int v13 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v14 = (char *)v13;
        if (v13) {
          sub_100055434(v13);
        }
      }
      else
      {
        unsigned int v14 = 0;
      }
      free(v14);
    }

    uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    uint64_t v15 = (id)qword_1000E4158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0;
      unsigned int v16 = sub_100055404(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        int v43 = 67109120;
        int v44 = v6;
        uint64_t v18 = (const char *)_os_log_send_and_compose_impl();
        int v19 = (char *)v18;
        if (v18) {
          sub_100055434(v18);
        }
      }
      else
      {
        int v19 = 0;
      }
      free(v19);
    }

    uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  }
  id v21 = (void *)v38[5];
  v38[5] = v20;

LABEL_28:
  if (v38[5])
  {
    if (v9) {
      v9[2](v9, 0);
    }
  }
  else
  {
    unsigned int v22 = [(UMSyncService *)self asidForClient:0 withAuid:&v36 withPid:v6];
    int v23 = +[NSXPCConnection currentConnection];
    int v24 = sub_100046B20((uint64_t)[v23 processIdentifier]);

    uint64_t v25 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075304;
    block[3] = &unk_1000D5B18;
    id v26 = v8;
    int v31 = v6;
    unsigned int v32 = v22;
    int v33 = v36;
    int v34 = v24;
    id v28 = v26;
    id v30 = &v37;
    int v29 = v9;
    dispatch_sync(v25, block);
  }
  _Block_object_dispose(&v37, 8);
}

- (void)fetchPersonaGenerationNumberWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSXPCConnection currentConnection];
  unsigned int v6 = [v5 processIdentifier];

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.fetch"])
  {
    unsigned int v7 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007589C;
    block[3] = &unk_1000D5150;
    id v15 = v4;
    dispatch_sync(v7, block);
    id v8 = v15;
  }
  else
  {
    if (qword_1000E4180 != -1) {
      dispatch_once(&qword_1000E4180, &stru_1000D5BF0);
    }
    unsigned int v9 = (id)qword_1000E4178;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = 0;
      unsigned int v10 = sub_100055404(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        int v17 = 67109120;
        unsigned int v18 = v6;
        unsigned int v12 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v13 = (char *)v12;
        if (v12) {
          sub_100055434(v12);
        }
      }
      else
      {
        unsigned int v13 = 0;
      }
      free(v13);
    }

    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

- (void)bundleIdentifiersForPersona:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  int v40 = sub_100067A84;
  int v41 = sub_100067A94;
  id v42 = 0;
  int v36 = -1;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = [v8 processIdentifier];

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.fetchbundle"])
  {
    if (v6) {
      goto LABEL_28;
    }
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v10 = (id)qword_1000E4158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0;
      unsigned int v11 = sub_100055404(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        LOWORD(v43) = 0;
        unsigned int v13 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v14 = (char *)v13;
        if (v13) {
          sub_100055434(v13);
        }
      }
      else
      {
        unsigned int v14 = 0;
      }
      free(v14);
    }

    uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    id v15 = (id)qword_1000E4158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0;
      unsigned int v16 = sub_100055404(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        int v43 = 67109120;
        int v44 = (int)v9;
        unsigned int v18 = (const char *)_os_log_send_and_compose_impl();
        int v19 = (char *)v18;
        if (v18) {
          sub_100055434(v18);
        }
      }
      else
      {
        int v19 = 0;
      }
      free(v19);
    }

    uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  }
  id v21 = (void *)v38[5];
  v38[5] = v20;

LABEL_28:
  if (v38[5])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    unsigned int v22 = [(UMSyncService *)self asidForClient:0 withAuid:&v36 withPid:v9];
    int v23 = +[NSXPCConnection currentConnection];
    int v24 = sub_100046B20((uint64_t)[v23 processIdentifier]);

    uint64_t v25 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075D2C;
    block[3] = &unk_1000D5B18;
    id v26 = v6;
    int v31 = (int)v9;
    unsigned int v32 = v22;
    int v33 = v36;
    int v34 = v24;
    id v28 = v26;
    id v30 = &v37;
    int v29 = v7;
    dispatch_sync(v25, block);
  }
  _Block_object_dispose(&v37, 8);
}

- (void)setBundlesIdentifiers:(id)a3 forPersona:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(void))a5;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = sub_100067A84;
  unsigned int v51 = sub_100067A94;
  id v52 = 0;
  int v46 = -1;
  unsigned int v11 = +[NSXPCConnection currentConnection];
  id v12 = [v11 processIdentifier];

  if (![(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.setbundle"])
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v18 = (id)qword_1000E4158;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = 0;
      unsigned int v19 = sub_100055404(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        int v53 = 67109120;
        int v54 = (int)v12;
        id v21 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v22 = (char *)v21;
        if (v21) {
          sub_100055434(v21);
        }
      }
      else
      {
        unsigned int v22 = 0;
      }
      free(v22);
    }

    uint64_t v23 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    goto LABEL_40;
  }
  if (!v9)
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v13 = (id)qword_1000E4158;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = 0;
      unsigned int v14 = sub_100055404(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        LOWORD(v53) = 0;
        unsigned int v16 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v17 = (char *)v16;
        if (v16) {
          sub_100055434(v16);
        }
      }
      else
      {
        unsigned int v17 = 0;
      }
      free(v17);
    }

    uint64_t v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    uint64_t v25 = (void *)v48[5];
    v48[5] = v24;
  }
  if (!v8)
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    id v26 = (id)qword_1000E4158;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = 0;
      unsigned int v27 = sub_100055404(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v28 = v27;
      }
      else {
        unsigned int v28 = v27 & 0xFFFFFFFE;
      }
      if (v28)
      {
        LOWORD(v53) = 0;
        int v29 = (const char *)_os_log_send_and_compose_impl();
        id v30 = (char *)v29;
        if (v29) {
          sub_100055434(v29);
        }
      }
      else
      {
        id v30 = 0;
      }
      free(v30);
    }

    uint64_t v23 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
LABEL_40:
    int v31 = (void *)v48[5];
    v48[5] = v23;
  }
  if (v48[5])
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    unsigned int v32 = [(UMSyncService *)self asidForClient:0 withAuid:&v46 withPid:v12];
    int v33 = +[NSXPCConnection currentConnection];
    int v34 = sub_100046B20((uint64_t)[v33 processIdentifier]);

    uint64_t v35 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100076628;
    block[3] = &unk_1000D5B40;
    id v37 = v9;
    int v41 = (int)v12;
    unsigned int v42 = v32;
    int v43 = v46;
    int v44 = v34;
    id v38 = v8;
    int v40 = &v47;
    uint64_t v39 = v10;
    dispatch_sync(v35, block);
  }
  _Block_object_dispose(&v47, 8);
}

- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v31 = 0;
  unsigned int v32 = &v31;
  uint64_t v33 = 0x3032000000;
  int v34 = sub_100067A84;
  uint64_t v35 = sub_100067A94;
  id v36 = 0;
  int v30 = -1;
  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.observer"])
  {
    unsigned int v10 = [(UMSyncService *)self asidForClient:0 withAuid:&v30 withPid:v6];
    unsigned int v11 = +[NSXPCConnection currentConnection];
    int v12 = sub_100046B20((uint64_t)[v11 processIdentifier]);

    unsigned int v13 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100076CA8;
    block[3] = &unk_1000D5B68;
    id v14 = v8;
    unsigned int v26 = v10;
    int v27 = v30;
    int v28 = v12;
    id v23 = v14;
    uint64_t v25 = &v31;
    id v24 = v9;
    dispatch_sync(v13, block);
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    unsigned int v15 = (id)qword_1000E4158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = 0;
      unsigned int v16 = sub_100055404(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        int v37 = 67109120;
        int v38 = v6;
        unsigned int v18 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v19 = (char *)v18;
        if (v18) {
          sub_100055434(v18);
        }
      }
      else
      {
        unsigned int v19 = 0;
      }
      free(v19);
    }

    uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    id v21 = (void *)v32[5];
    v32[5] = v20;

    if (v9) {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, v32[5]);
    }
  }
  _Block_object_dispose(&v31, 8);
}

- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }
}

- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }
}

- (void)grantSandboxExtensionForPersonaWithUniqueString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = 0;
  int v44 = &v43;
  uint64_t v45 = 0x3032000000;
  int v46 = sub_100067A84;
  uint64_t v47 = sub_100067A94;
  id v48 = 0;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = [v8 processIdentifier];

  if ([(UMSyncService *)self remoteProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.grantSandboxExtension"])
  {
    long long v42 = 0u;
    long long v41 = 0u;
    unsigned int v10 = +[NSXPCConnection currentConnection];
    unsigned int v11 = v10;
    if (v10)
    {
      [v10 auditToken];
    }
    else
    {
      long long v42 = 0u;
      long long v41 = 0u;
    }

    int v40 = -1;
    unsigned int v17 = [(UMSyncService *)self asidForClient:0 withAuid:&v40 withPid:v9];
    unsigned int v18 = +[NSXPCConnection currentConnection];
    int v19 = sub_100046B20((uint64_t)[v18 processIdentifier]);

    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    uint64_t v20 = (id)qword_1000E4158;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = 0;
      unsigned int v21 = sub_100055404(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v22 = v21;
      }
      else {
        unsigned int v22 = v21 & 0xFFFFFFFE;
      }
      if (v22)
      {
        int v49 = 138413058;
        id v50 = v6;
        __int16 v51 = 1024;
        int v52 = (int)v9;
        __int16 v53 = 1024;
        unsigned int v54 = v17;
        __int16 v55 = 1024;
        int v56 = v40;
        id v23 = (const char *)_os_log_send_and_compose_impl();
        id v24 = (char *)v23;
        if (v23) {
          sub_100055434(v23);
        }
      }
      else
      {
        id v24 = 0;
      }
      free(v24);
    }

    int v27 = qword_1000E4320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000775F0;
    block[3] = &unk_1000D5B90;
    unsigned int v33 = v17;
    int v34 = v40;
    int v35 = v19;
    id v28 = v6;
    long long v36 = v41;
    long long v37 = v42;
    int v38 = (int)v9;
    id v30 = v28;
    unsigned int v32 = &v43;
    id v31 = v7;
    dispatch_sync(v27, block);
  }
  else
  {
    if (qword_1000E4160 != -1) {
      dispatch_once(&qword_1000E4160, &stru_1000D5BB0);
    }
    int v12 = (id)qword_1000E4158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)&long long v41 = 0;
      unsigned int v13 = sub_100055404(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        int v49 = 67109120;
        LODWORD(v50) = v9;
        unsigned int v15 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        unsigned int v16 = 0;
      }
      free(v16);
    }

    uint64_t v25 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    unsigned int v26 = (void *)v44[5];
    v44[5] = v25;

    if (v7) {
      (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v44[5]);
    }
  }
  _Block_object_dispose(&v43, 8);
}

- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5
{
  if (a4) {
    *a4 = -1;
  }
  return -1;
}

@end