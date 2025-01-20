@interface KBXPCService
+ (id)sharedService;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3;
- (BOOL)retrievePasscodeFromFileHandle:(id)a3 ofLength:(unint64_t)a4 withbaseaddress:(char *)a5;
- (id)remoteServiceName;
- (void)Event:(int)a3;
- (void)SeshatDebugWithDebugMask:(int)a3 withReply:(id)a4;
- (void)SeshatEnrollWithSecret:(id)a3 secretSize:(unint64_t)a4 withReply:(id)a5;
- (void)SeshatRecoverWithSecret:(id)a3 secretSize:(unint64_t)a4 withReply:(id)a5;
- (void)SeshatUnlockWithSecret:(id)a3 secretSize:(unint64_t)a4 withMemento:(BOOL)a5 verifyOnly:(BOOL)a6 withACMRef:(id)a7 withReply:(id)a8;
- (void)backupUUIDForVolume:(id)a3 reply:(id)a4;
- (void)changeClassKeysGenerationWithSecret:(id)a3 secretSize:(unint64_t)a4 generationOption:(int)a5 reply:(id)a6;
- (void)changeSystemSecretWithEscrow:(id)a3 fromOldSecret:(id)a4 oldSize:(unint64_t)a5 toNewSecret:(id)a6 newSize:(unint64_t)a7 opaqueData:(id)a8 keepstate:(BOOL)a9 reply:(id)a10;
- (void)changeSystemSecretfromOldSecret:(id)a3 oldSize:(unint64_t)a4 toNewSecret:(id)a5 newSize:(unint64_t)a6 opaqueData:(id)a7 withParams:(unsigned int)a8 reply:(id)a9;
- (void)createKeybagForUserSession:(id)a3 withSessionUID:(int)a4 WithSecret:(id)a5 secretSize:(unint64_t)a6 withGracePeriod:(int)a7 withOpaqeStuff:(id)a8 withReply:(id)a9;
- (void)createPersonaKeyForUserSession:(id)a3 forPath:(id)a4 withUID:(unsigned int)a5 WithSecret:(id)a6 secretSize:(unint64_t)a7 withReply:(id)a8;
- (void)createSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5;
- (void)deleteKeybagForUserSession:(int)a3 withReply:(id)a4;
- (void)disableBackupForVolume:(id)a3 reply:(id)a4;
- (void)enableBackupForVolume:(id)a3 withSecret:(id)a4 secretSize:(unint64_t)a5 reply:(id)a6;
- (void)forgottenPasscodeEventWithReply:(id)a3;
- (void)getBackupBlobreply:(id)a3;
- (void)getBackupkeyForVolume:(id)a3 andCryptoID:(unint64_t)a4 withReply:(id)a5;
- (void)getDeviceLockState:(int)a3 needsExtended:(BOOL)a4 withReply:(id)a5;
- (void)getLockSateInfoforUser:(int)a3 WithReply:(id)a4;
- (void)getPasscodeBlobWithReply:(id)a3;
- (void)isKeyRollingInProgresswithreply:(id)a3;
- (void)loadKeybagForUserSession:(id)a3 withSessionID:(int)a4 withSecret:(id)a5 secretSize:(unint64_t)a6 shouldSetGracePeriod:(BOOL)a7 withGracePeriod:(int)a8 isInEarlyStar:(BOOL)a9 withReply:(id)a10;
- (void)loadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5;
- (void)migrationWithReply:(id)a3;
- (void)passcodeUnlockFailedWithReply:(id)a3;
- (void)passcodeUnlockStartWithReply:(id)a3;
- (void)passcodeUnlockSuccessWithReply:(id)a3;
- (void)registerBackupBag:(id)a3 withSecret:(id)a4 secretSize:(unint64_t)a5 reply:(id)a6;
- (void)removePersonaKeyForUserSession:(id)a3 withUID:(unsigned int)a4 withVolumeUUIDString:(id)a5 withReply:(id)a6;
- (void)removeSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5;
- (void)setSpacedRepetitionMode:(unsigned int)a3 reply:(id)a4;
- (void)setSystemSecretBlob:(id)a3 reply:(id)a4;
- (void)setVolumeToPersona:(id)a3 withPersonaString:(id)a4 withReply:(id)a5;
- (void)startBackupSessionForVolume:(id)a3 withReply:(id)a4;
- (void)stashCommitwithUID:(unsigned int)a3 WithFlags:(unsigned int)a4 WithReply:(id)a5;
- (void)stashCreatewithSecret:(id)a3 secrestSize:(unint64_t)a4 withMode:(int)a5 withUID:(unsigned int)a6 WithFlags:(unsigned int)a7 reply:(id)a8;
- (void)stashDestroywithReply:(id)a3;
- (void)stashVerifywithUID:(unsigned int)a3 WithFlags:(unsigned int)a4 WithReply:(id)a5;
- (void)stopBackupSessionForVolume:(id)a3 withReply:(id)a4;
- (void)unloadKeybagForUserSession:(int)a3 withReply:(id)a4;
- (void)unloadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5;
- (void)verifySyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5;
@end

@implementation KBXPCService

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000090B8;
  block[3] = &unk_100030CB0;
  block[4] = a1;
  if (qword_1000398C8 != -1) {
    dispatch_once(&qword_1000398C8, block);
  }
  v2 = (void *)qword_1000398C0;

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
  if (!a4) {
    goto LABEL_5;
  }
  if (read((int)[v7 fileDescriptor], a5, a4) != a4)
  {
    sub_100017164("-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:]", @"Failed to read the retrievePasscodeFromFileHandle", v9, v10, v11, v12, v13, v14, v17);
LABEL_5:
    BOOL v15 = 1;
    goto LABEL_6;
  }
  BOOL v15 = 0;
LABEL_6:

  return v15;
}

- (void)changeSystemSecretfromOldSecret:(id)a3 oldSize:(unint64_t)a4 toNewSecret:(id)a5 newSize:(unint64_t)a6 opaqueData:(id)a7 withParams:(unsigned int)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  v18 = (void (**)(id, void))a9;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = sub_100009728;
  v82 = sub_100009738;
  id v83 = 0;
  vm_address_t address = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  int v76 = -1;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.device"])
  {
    if (vm_page_size < a4 || vm_page_size < a6)
    {
      sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", @"Long Secret, can't handle ...", vm_page_size, v19, v20, v21, v22, v23, v61);
      uint64_t v25 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
      goto LABEL_8;
    }
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", @"FAILED to allocate VM", v27, v28, v29, v30, v31, v32, v61);
      uint64_t v33 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
      v34 = (void *)v79[5];
      v79[5] = v33;

      vm_address_t address = 0;
LABEL_24:
      v18[2](v18, v79[5]);
      goto LABEL_25;
    }
    if (a4)
    {
      vm_address_t v62 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v15, a4))
      {
        sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", @"Failed to retrieve oldpasscode", v35, v36, v37, v38, v39, v40, v62);
        uint64_t v41 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        v42 = (void *)v79[5];
        v79[5] = v41;

        vm_map_t v43 = mach_task_self_;
        vm_address_t v44 = address;
        vm_size_t v45 = vm_page_size;
        if (vm_page_size >= a4) {
          rsize_t v46 = a4;
        }
        else {
          rsize_t v46 = vm_page_size;
        }
LABEL_23:
        memset_s((void *)address, v46, 0, v46);
        vm_deallocate(v43, v44, v45);
        goto LABEL_24;
      }
    }
    else
    {
      vm_address_t v62 = 0;
    }
    if (a6)
    {
      vm_address_t v47 = address + 1024;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v16 ofLength:a6 withbaseaddress:address + 1024])
      {
        sub_100017164("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", @"Failed to retrieve newpasscode", v48, v49, v50, v51, v52, v53, v62);
        uint64_t v54 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        v55 = (void *)v79[5];
        v79[5] = v54;

        vm_map_t v43 = mach_task_self_;
        vm_address_t v44 = address;
        vm_size_t v45 = vm_page_size;
        if (vm_page_size >= a6 + 1024) {
          rsize_t v46 = a6 + 1024;
        }
        else {
          rsize_t v46 = vm_page_size;
        }
        goto LABEL_23;
      }
    }
    else
    {
      vm_address_t v47 = 0;
    }
    v56 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009740;
    block[3] = &unk_100030D18;
    vm_address_t v68 = v62;
    unint64_t v69 = a4;
    vm_address_t v70 = v47;
    unint64_t v71 = a6;
    unsigned int v72 = a8;
    id v64 = v17;
    v65 = v73;
    v66 = &v78;
    v67 = v75;
    dispatch_sync(v56, block);
    vm_map_t v57 = mach_task_self_;
    vm_address_t v58 = address;
    vm_size_t v59 = vm_page_size;
    if (vm_page_size >= a6 + 1024) {
      vm_size_t v60 = a6 + 1024;
    }
    else {
      vm_size_t v60 = vm_page_size;
    }
    memset_s((void *)address, v60, 0, v60);
    vm_deallocate(v57, v58, v59);
    v18[2](v18, v79[5]);

    goto LABEL_25;
  }
  uint64_t v25 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
LABEL_8:
  v26 = (void *)v79[5];
  v79[5] = v25;

  if (v18) {
    goto LABEL_24;
  }
LABEL_25:
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(&v78, 8);
}

- (void)setSpacedRepetitionMode:(unsigned int)a3 reply:(id)a4
{
  id v15 = (void (**)(id, void *))a4;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.device"])
  {
    sub_100017164("-[KBXPCService setSpacedRepetitionMode:reply:]", @"setting spaced repetition verification mode to %d", v6, v7, v8, v9, v10, v11, a3);
    dword_100039850 = a3;
    NSErrorDomain v12 = NSPOSIXErrorDomain;
    uint64_t v13 = 0;
  }
  else
  {
    NSErrorDomain v12 = NSPOSIXErrorDomain;
    uint64_t v13 = 1;
  }
  uint64_t v14 = +[NSError errorWithDomain:v12 code:v13 userInfo:0];
  if (v15) {
    v15[2](v15, v14);
  }
}

- (void)getPasscodeBlobWithReply:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, void))a3;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.device"])
  {
    if (sub_1000053A0()) {
      v4 = 0;
    }
    else {
      v4 = (void *)sub_100018A7C(0);
    }
    v6[2](v6, v4, 0);

    v5 = 0;
  }
  else
  {
    v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      ((void (*)(void))v6[2])();
    }
  }
}

- (void)changeSystemSecretWithEscrow:(id)a3 fromOldSecret:(id)a4 oldSize:(unint64_t)a5 toNewSecret:(id)a6 newSize:(unint64_t)a7 opaqueData:(id)a8 keepstate:(BOOL)a9 reply:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  uint64_t v20 = (void (**)(id, void))a10;
  uint64_t v79 = 0;
  uint64_t v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = sub_100009728;
  id v83 = sub_100009738;
  id v84 = 0;
  vm_address_t address = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  int v77 = -1;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.device"])
  {
    if (vm_page_size < a5 || vm_page_size < a7)
    {
      sub_100017164("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", @"Long Secret, can't handle ...", vm_page_size, v21, v22, v23, v24, v25, v63);
      uint64_t v27 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
      goto LABEL_8;
    }
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_100017164("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", @"FAILED to allocate VM", v29, v30, v31, v32, v33, v34, v63);
      uint64_t v35 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
      uint64_t v36 = (void *)v80[5];
      v80[5] = v35;

      vm_address_t address = 0;
LABEL_24:
      v20[2](v20, v80[5]);
      goto LABEL_25;
    }
    if (a5)
    {
      vm_address_t v65 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v17, a5))
      {
        sub_100017164("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", @"Failed to retrieve oldpasscode", v37, v38, v39, v40, v41, v42, v63);
        uint64_t v43 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        vm_address_t v44 = (void *)v80[5];
        v80[5] = v43;

        vm_map_t v45 = mach_task_self_;
        vm_address_t v46 = address;
        vm_size_t v47 = vm_page_size;
        if (vm_page_size >= a5) {
          rsize_t v48 = a5;
        }
        else {
          rsize_t v48 = vm_page_size;
        }
LABEL_23:
        memset_s((void *)address, v48, 0, v48);
        vm_deallocate(v45, v46, v47);
        goto LABEL_24;
      }
    }
    else
    {
      vm_address_t v65 = 0;
    }
    if (a7)
    {
      vm_address_t v49 = address + 1024;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v18 ofLength:a7 withbaseaddress:address + 1024])
      {
        sub_100017164("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", @"Failed to retrieve newpasscode", v50, v51, v52, v53, v54, v55, v63);
        uint64_t v56 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        vm_map_t v57 = (void *)v80[5];
        v80[5] = v56;

        vm_address_t v46 = address;
        vm_size_t v47 = vm_page_size;
        vm_size_t v58 = a7 + 1024;
        vm_map_t v45 = mach_task_self_;
        if (vm_page_size >= v58) {
          rsize_t v48 = v58;
        }
        else {
          rsize_t v48 = vm_page_size;
        }
        goto LABEL_23;
      }
    }
    else
    {
      vm_address_t v49 = 0;
    }
    queue = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009FB0;
    block[3] = &unk_100030D40;
    vm_address_t v71 = v65;
    unint64_t v72 = a5;
    vm_address_t v73 = v49;
    unint64_t v74 = a7;
    id v67 = v19;
    BOOL v75 = a9;
    id v68 = v16;
    unint64_t v69 = &v79;
    vm_address_t v70 = v76;
    dispatch_sync(queue, block);
    vm_map_t v59 = mach_task_self_;
    vm_address_t v60 = address;
    vm_size_t v61 = vm_page_size;
    if (vm_page_size >= a7 + 1024) {
      vm_size_t v62 = a7 + 1024;
    }
    else {
      vm_size_t v62 = vm_page_size;
    }
    memset_s((void *)address, v62, 0, v62);
    vm_deallocate(v59, v60, v61);
    v20[2](v20, v80[5]);

    goto LABEL_25;
  }
  uint64_t v27 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
LABEL_8:
  uint64_t v28 = (void *)v80[5];
  v80[5] = v27;

  if (v20) {
    goto LABEL_24;
  }
LABEL_25:
  _Block_object_dispose(v76, 8);
  _Block_object_dispose(&v79, 8);
}

- (void)changeClassKeysGenerationWithSecret:(id)a3 secretSize:(unint64_t)a4 generationOption:(int)a5 reply:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void *))a6;
  vm_address_t address = 0;
  if (![(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.device"])
  {
    NSErrorDomain v17 = NSPOSIXErrorDomain;
    uint64_t v18 = 1;
LABEL_5:
    id v19 = +[NSError errorWithDomain:v17 code:v18 userInfo:0];
    if (!v11) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (vm_page_size < a4)
  {
    sub_100017164("-[KBXPCService changeClassKeysGenerationWithSecret:secretSize:generationOption:reply:]", @"Long Secret, can't handle ...", vm_page_size, v12, v13, v14, v15, v16, v40);
    NSErrorDomain v17 = NSPOSIXErrorDomain;
    uint64_t v18 = 7;
    goto LABEL_5;
  }
  if (!vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    if (a4)
    {
      vm_address_t v26 = address;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v10 ofLength:a4 withbaseaddress:address])
      {
        sub_100017164("-[KBXPCService changeClassKeysGenerationWithSecret:secretSize:generationOption:reply:]", @"Failed to retrieve oldpasscode", v27, v28, v29, v30, v31, v32, v40);
        NSErrorDomain v33 = NSPOSIXErrorDomain;
        uint64_t v34 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      vm_address_t v26 = 0;
    }
    int v35 = sub_10001A69C(v26, a4, a5);
    if (!v35)
    {
      id v19 = 0;
      goto LABEL_17;
    }
    NSErrorDomain v33 = NSPOSIXErrorDomain;
    uint64_t v34 = v35;
LABEL_15:
    id v19 = +[NSError errorWithDomain:v33 code:v34 userInfo:0];
LABEL_17:
    vm_map_t v36 = mach_task_self_;
    vm_address_t v37 = address;
    vm_size_t v38 = vm_page_size;
    if (vm_page_size >= a4) {
      rsize_t v39 = a4;
    }
    else {
      rsize_t v39 = vm_page_size;
    }
    memset_s((void *)address, v39, 0, v39);
    vm_deallocate(v36, v37, v38);
    goto LABEL_21;
  }
  sub_100017164("-[KBXPCService changeClassKeysGenerationWithSecret:secretSize:generationOption:reply:]", @"FAILED to allocate VM", v20, v21, v22, v23, v24, v25, v40);
  id v19 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
  vm_address_t address = 0;
LABEL_21:
  v11[2](v11, v19);
LABEL_22:
}

- (void)setSystemSecretBlob:(id)a3 reply:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.device"])
  {
    int v7 = sub_100018BF4((uint64_t)v9);
    if (v7)
    {
      uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
    goto LABEL_7;
  }
  uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  if (v6) {
LABEL_7:
  }
    v6[2](v6, v8);
}

- (void)registerBackupBag:(id)a3 withSecret:(id)a4 secretSize:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  vm_address_t address = 0;
  if (![(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.devicebackup"])
  {
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 1;
LABEL_5:
    uint64_t v20 = +[NSError errorWithDomain:v18 code:v19 userInfo:0];
    if (!v12) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (vm_page_size < a5)
  {
    sub_100017164("-[KBXPCService registerBackupBag:withSecret:secretSize:reply:]", @"Long Secret, can't handle ...", vm_page_size, v13, v14, v15, v16, v17, v41);
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 7;
    goto LABEL_5;
  }
  if (!vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    if (a5)
    {
      vm_address_t v27 = address;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v11 ofLength:a5 withbaseaddress:address])
      {
        sub_100017164("-[KBXPCService registerBackupBag:withSecret:secretSize:reply:]", @"Failed to retrieve oldpasscode", v28, v29, v30, v31, v32, v33, v41);
        NSErrorDomain v34 = NSPOSIXErrorDomain;
        uint64_t v35 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      vm_address_t v27 = 0;
    }
    int v36 = sub_100018D18((uint64_t)v10, v27, a5);
    if (!v36)
    {
      uint64_t v20 = 0;
      goto LABEL_17;
    }
    NSErrorDomain v34 = NSPOSIXErrorDomain;
    uint64_t v35 = v36;
LABEL_15:
    uint64_t v20 = +[NSError errorWithDomain:v34 code:v35 userInfo:0];
LABEL_17:
    vm_map_t v37 = mach_task_self_;
    vm_address_t v38 = address;
    vm_size_t v39 = vm_page_size;
    if (vm_page_size >= a5) {
      rsize_t v40 = a5;
    }
    else {
      rsize_t v40 = vm_page_size;
    }
    memset_s((void *)address, v40, 0, v40);
    vm_deallocate(v37, v38, v39);
    goto LABEL_21;
  }
  sub_100017164("-[KBXPCService registerBackupBag:withSecret:secretSize:reply:]", @"FAILED to allocate VM", v21, v22, v23, v24, v25, v26, v41);
  uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
  vm_address_t address = 0;
LABEL_21:
  v12[2](v12, v20);
LABEL_22:
}

- (void)getBackupBlobreply:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, void))a3;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.devicebackup"])
  {
    v4 = (void *)sub_100018A7C(1);
    v6[2](v6, v4, 0);

    v5 = 0;
  }
  else
  {
    v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v6) {
      ((void (*)(void))v6[2])();
    }
  }
}

- (void)getBackupkeyForVolume:(id)a3 andCryptoID:(unint64_t)a4 withReply:(id)a5
{
  CFDataRef v8 = (const __CFData *)a3;
  id v9 = (void (**)(id, void *, void *))a5;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.devicebackup"])
  {
    uint64_t v12 = 0;
    id v10 = (void *)sub_100018E90(v8, a4, (uint64_t)&v12);
    if (v10) {
      id v11 = 0;
    }
    else {
      id v11 = v12;
    }
    v9[2](v9, v10, v11);
  }
  else
  {
    id v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v9) {
      v9[2](v9, 0, v11);
    }
  }
}

- (void)startBackupSessionForVolume:(id)a3 withReply:(id)a4
{
  CFDataRef v9 = (const __CFData *)a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.devicebackup"])
  {
    int v7 = sub_100019180(v9, 1);
    if (v7)
    {
      CFDataRef v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      CFDataRef v8 = 0;
    }
    goto LABEL_7;
  }
  CFDataRef v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  if (v6) {
LABEL_7:
  }
    v6[2](v6, v8);
}

- (void)stopBackupSessionForVolume:(id)a3 withReply:(id)a4
{
  CFDataRef v9 = (const __CFData *)a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.devicebackup"])
  {
    int v7 = sub_100019180(v9, 0);
    if (v7)
    {
      CFDataRef v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      CFDataRef v8 = 0;
    }
    goto LABEL_7;
  }
  CFDataRef v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  if (v6) {
LABEL_7:
  }
    v6[2](v6, v8);
}

- (void)enableBackupForVolume:(id)a3 withSecret:(id)a4 secretSize:(unint64_t)a5 reply:(id)a6
{
  CFDataRef v10 = (const __CFData *)a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void, void *))a6;
  vm_address_t v44 = 0;
  vm_address_t address = 0;
  if (![(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.devicebackup"])
  {
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 1;
LABEL_5:
    uint64_t v20 = +[NSError errorWithDomain:v18 code:v19 userInfo:0];
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (vm_page_size < a5)
  {
    sub_100017164("-[KBXPCService enableBackupForVolume:withSecret:secretSize:reply:]", @"Long Secret, can't handle ...", vm_page_size, v13, v14, v15, v16, v17, (char)v44);
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 7;
    goto LABEL_5;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_100017164("-[KBXPCService enableBackupForVolume:withSecret:secretSize:reply:]", @"FAILED to allocate VM", v21, v22, v23, v24, v25, v26, (char)v44);
    uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
    vm_address_t address = 0;
LABEL_9:
    v12[2](v12, 0, v20);
    goto LABEL_10;
  }
  if (a5)
  {
    vm_address_t v27 = address;
    if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v11 ofLength:a5 withbaseaddress:address])
    {
      sub_100017164("-[KBXPCService enableBackupForVolume:withSecret:secretSize:reply:]", @"Failed to retrieve oldpasscode", v28, v29, v30, v31, v32, v33, (char)v44);
      uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      vm_map_t v34 = mach_task_self_;
      vm_address_t v35 = address;
      vm_size_t v36 = vm_page_size;
      if (vm_page_size >= a5) {
        rsize_t v37 = a5;
      }
      else {
        rsize_t v37 = vm_page_size;
      }
      memset_s((void *)address, v37, 0, v37);
      vm_deallocate(v34, v35, v36);
      goto LABEL_9;
    }
  }
  else
  {
    vm_address_t v27 = 0;
  }
  int v38 = sub_100019414(v10, v27, a5, (uint64_t)&v44);
  if (v38)
  {
    uint64_t v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v38 userInfo:0];
  }
  else
  {
    uint64_t v20 = 0;
  }
  vm_map_t v39 = mach_task_self_;
  vm_address_t v40 = address;
  vm_size_t v41 = vm_page_size;
  if (vm_page_size >= a5) {
    rsize_t v42 = a5;
  }
  else {
    rsize_t v42 = vm_page_size;
  }
  memset_s((void *)address, v42, 0, v42);
  vm_deallocate(v39, v40, v41);
  uint64_t v43 = v44;
  ((void (**)(id, void *, void *))v12)[2](v12, v44, v20);

LABEL_10:
}

- (void)disableBackupForVolume:(id)a3 reply:(id)a4
{
  CFDataRef v9 = (const __CFData *)a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.devicebackup"])
  {
    int v7 = sub_100019678(v9);
    if (v7)
    {
      CFDataRef v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    else
    {
      CFDataRef v8 = 0;
    }
    goto LABEL_7;
  }
  CFDataRef v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  if (v6) {
LABEL_7:
  }
    v6[2](v6, v8);
}

- (void)backupUUIDForVolume:(id)a3 reply:(id)a4
{
  v4 = (void (**)(id, void, id))a4;
  id v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  v4[2](v4, 0, v5);
}

- (void)stashCreatewithSecret:(id)a3 secrestSize:(unint64_t)a4 withMode:(int)a5 withUID:(unsigned int)a6 WithFlags:(unsigned int)a7 reply:(id)a8
{
  char v9 = a7;
  id v14 = a3;
  uint64_t v15 = (void (**)(id, void *))a8;
  vm_address_t address = 0;
  if (![(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.stash.access"])
  {
    NSErrorDomain v21 = NSPOSIXErrorDomain;
    uint64_t v22 = 1;
LABEL_5:
    uint64_t v23 = +[NSError errorWithDomain:v21 code:v22 userInfo:0];
    if (!v15) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (vm_page_size < a4)
  {
    sub_100017164("-[KBXPCService stashCreatewithSecret:secrestSize:withMode:withUID:WithFlags:reply:]", @"Long Secret, can't handle ...", vm_page_size, v16, v17, v18, v19, v20, v44);
    NSErrorDomain v21 = NSPOSIXErrorDomain;
    uint64_t v22 = 7;
    goto LABEL_5;
  }
  if (!vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    if (a4)
    {
      vm_address_t v30 = address;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v14 ofLength:a4 withbaseaddress:address])
      {
        sub_100017164("-[KBXPCService stashCreatewithSecret:secrestSize:withMode:withUID:WithFlags:reply:]", @"Failed to retrieve Passcode", v31, v32, v33, v34, v35, v36, v44);
        NSErrorDomain v37 = NSPOSIXErrorDomain;
        uint64_t v38 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      vm_address_t v30 = 0;
    }
    int v39 = sub_10001987C(v30, a4, a5, v9, a6);
    if (!v39)
    {
      uint64_t v23 = 0;
      goto LABEL_17;
    }
    NSErrorDomain v37 = NSPOSIXErrorDomain;
    uint64_t v38 = v39;
LABEL_15:
    uint64_t v23 = +[NSError errorWithDomain:v37 code:v38 userInfo:0];
LABEL_17:
    vm_map_t v40 = mach_task_self_;
    vm_address_t v41 = address;
    vm_size_t v42 = vm_page_size;
    if (vm_page_size >= a4) {
      rsize_t v43 = a4;
    }
    else {
      rsize_t v43 = vm_page_size;
    }
    memset_s((void *)address, v43, 0, v43);
    vm_deallocate(v40, v41, v42);
    goto LABEL_21;
  }
  sub_100017164("-[KBXPCService stashCreatewithSecret:secrestSize:withMode:withUID:WithFlags:reply:]", @"FAILED to allocate VM", v24, v25, v26, v27, v28, v29, v44);
  uint64_t v23 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
  vm_address_t address = 0;
LABEL_21:
  v15[2](v15, v23);
LABEL_22:
}

- (void)stashCommitwithUID:(unsigned int)a3 WithFlags:(unsigned int)a4 WithReply:(id)a5
{
  char v5 = a4;
  id v11 = (void (**)(id, void *))a5;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.stash.access"])
  {
    int v8 = sub_10001A398(a3, v5);
    if (v8)
    {
      char v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v8 userInfo:0];
    }
    else
    {
      char v9 = 0;
    }
    CFDataRef v10 = v11;
    goto LABEL_8;
  }
  char v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  CFDataRef v10 = v11;
  if (v11) {
LABEL_8:
  }
    v10[2](v10, v9);
}

- (void)stashVerifywithUID:(unsigned int)a3 WithFlags:(unsigned int)a4 WithReply:(id)a5
{
  char v5 = a4;
  int v8 = (void (**)(id, void, void *))a5;
  unsigned int v11 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.stash.access"])
  {
    int v9 = sub_100019B50(a3, v5, &v11);
    if (v9)
    {
      CFDataRef v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v9 userInfo:0];
    }
    else
    {
      CFDataRef v10 = 0;
    }
    v8[2](v8, v11, v10);
  }
  else
  {
    CFDataRef v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    if (v8) {
      v8[2](v8, 0, v10);
    }
  }
}

- (void)stashDestroywithReply:(id)a3
{
  int v7 = (void (**)(id, void *))a3;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.keystore.stash.access"])
  {
    int v4 = sub_10001A4EC();
    if (v4)
    {
      char v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v4 userInfo:0];
    }
    else
    {
      char v5 = 0;
    }
    uint64_t v6 = v7;
    goto LABEL_8;
  }
  char v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  uint64_t v6 = v7;
  if (v7) {
LABEL_8:
  }
    v6[2](v6, v5);
}

- (void)isKeyRollingInProgresswithreply:(id)a3
{
  id v3 = (void (**)(id, void, void *))a3;
  unsigned int v7 = 0;
  uint64_t v4 = sub_10001A988((uint64_t)&v7);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    unsigned int v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = v7;
  }
  v3[2](v3, v5, v6);
}

- (void)migrationWithReply:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  int v3 = aks_migrate_fs();
  if (v3)
  {
    uint64_t v4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v3 userInfo:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5[2](v5, v4);
}

- (void)forgottenPasscodeEventWithReply:(id)a3
{
  (*((void (**)(id, void))a3 + 2))(a3, 0);

  sub_10001AC14();
}

- (void)getLockSateInfoforUser:(int)a3 WithReply:(id)a4
{
  unsigned int v7 = (void (**)(id, void *, void *))a4;
  uint64_t v5 = (void *)sub_10001AB1C(a3);
  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  v7[2](v7, v5, v6);
}

- (void)getDeviceLockState:(int)a3 needsExtended:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  unsigned int v7 = (void (**)(id, void, void *))a5;
  unsigned int v9 = 0;
  if (sub_10001B2BC(v6, v5, &v9))
  {
    int v8 = 0;
  }
  else
  {
    int v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  v7[2](v7, v9, v8);
}

- (void)passcodeUnlockStartWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v3 = sub_100017160();
  sub_10000F564(v3);
  v4[2](v4, 0);
}

- (void)passcodeUnlockSuccessWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v3 = sub_100017160();
  sub_10000F598(v3);
  v4[2](v4, 0);
}

- (void)passcodeUnlockFailedWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v3 = sub_100017160();
  sub_10000F5CC(v3);
  v4[2](v4, 0);
}

- (void)SeshatEnrollWithSecret:(id)a3 secretSize:(unint64_t)a4 withReply:(id)a5
{
  id v8 = a3;
  id v14 = (void (**)(id, void *))a5;
  vm_address_t address = 0;
  if (vm_page_size < a4)
  {
    sub_100017164("-[KBXPCService SeshatEnrollWithSecret:secretSize:withReply:]", @"Long Secret, can't handle ...", vm_page_size, v9, v10, v11, v12, v13, v36);
    uint64_t v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
    goto LABEL_17;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_100017164("-[KBXPCService SeshatEnrollWithSecret:secretSize:withReply:]", @"FAILED to allocate VM", v16, v17, v18, v19, v20, v21, v36);
    uint64_t v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
    vm_address_t address = 0;
    goto LABEL_17;
  }
  if (a4)
  {
    uint64_t v22 = (const UInt8 *)address;
    if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v8 ofLength:a4 withbaseaddress:address])
    {
      sub_100017164("-[KBXPCService SeshatEnrollWithSecret:secretSize:withReply:]", @"Failed to retrieve oldpasscode", v23, v24, v25, v26, v27, v28, v36);
      NSErrorDomain v29 = NSPOSIXErrorDomain;
      uint64_t v30 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  int v31 = sub_10001B438(v22, a4);
  if (!v31)
  {
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  NSErrorDomain v29 = NSPOSIXErrorDomain;
  uint64_t v30 = v31;
LABEL_11:
  uint64_t v15 = +[NSError errorWithDomain:v29 code:v30 userInfo:0];
LABEL_13:
  vm_map_t v32 = mach_task_self_;
  vm_address_t v33 = address;
  vm_size_t v34 = vm_page_size;
  if (vm_page_size >= a4) {
    rsize_t v35 = a4;
  }
  else {
    rsize_t v35 = vm_page_size;
  }
  memset_s((void *)address, v35, 0, v35);
  vm_deallocate(v32, v33, v34);
LABEL_17:
  v14[2](v14, v15);
}

- (void)Event:(int)a3
{
}

- (void)SeshatUnlockWithSecret:(id)a3 secretSize:(unint64_t)a4 withMemento:(BOOL)a5 verifyOnly:(BOOL)a6 withACMRef:(id)a7 withReply:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a7;
  uint64_t v21 = (void (**)(id, void, id))a8;
  vm_address_t address = 0;
  if (vm_page_size < a4)
  {
    sub_100017164("-[KBXPCService SeshatUnlockWithSecret:secretSize:withMemento:verifyOnly:withACMRef:withReply:]", @"Long Secret, can't handle ...", vm_page_size, v16, v17, v18, v19, v20, v44);
    id v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
LABEL_5:
    v21[2](v21, 0, v22);
    goto LABEL_6;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_100017164("-[KBXPCService SeshatUnlockWithSecret:secretSize:withMemento:verifyOnly:withACMRef:withReply:]", @"FAILED to allocate VM", v23, v24, v25, v26, v27, v28, v44);
    id v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
    vm_address_t address = 0;
    goto LABEL_5;
  }
  if (a4)
  {
    NSErrorDomain v29 = (UInt8 *)address;
    if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v14 ofLength:a4 withbaseaddress:address])
    {
      sub_100017164("-[KBXPCService SeshatUnlockWithSecret:secretSize:withMemento:verifyOnly:withACMRef:withReply:]", @"Failed to retrieve oldpasscode", v30, v31, v32, v33, v34, v35, v44);
      id v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      vm_map_t v36 = mach_task_self_;
      vm_address_t v37 = address;
      vm_size_t v38 = vm_page_size;
      if (vm_page_size >= a4) {
        rsize_t v39 = a4;
      }
      else {
        rsize_t v39 = vm_page_size;
      }
      memset_s((void *)address, v39, 0, v39);
      vm_deallocate(v36, v37, v38);
      goto LABEL_5;
    }
  }
  else
  {
    NSErrorDomain v29 = 0;
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10000BC0C;
  v45[3] = &unk_100030D68;
  id v46 = (id)os_transaction_create();
  vm_size_t v47 = v21;
  id v22 = v46;
  sub_10001BB10(v29, a4, v11, a6, (uint64_t)v15, (uint64_t)v45);
  vm_map_t v40 = mach_task_self_;
  vm_address_t v41 = address;
  vm_size_t v42 = vm_page_size;
  if (vm_page_size >= a4) {
    rsize_t v43 = a4;
  }
  else {
    rsize_t v43 = vm_page_size;
  }
  memset_s((void *)address, v43, 0, v43);
  vm_deallocate(v40, v41, v42);

LABEL_6:
}

- (void)SeshatRecoverWithSecret:(id)a3 secretSize:(unint64_t)a4 withReply:(id)a5
{
  id v8 = a3;
  id v14 = (void (**)(id, void, void *))a5;
  vm_address_t address = 0;
  if (vm_page_size < a4)
  {
    sub_100017164("-[KBXPCService SeshatRecoverWithSecret:secretSize:withReply:]", @"Long Secret, can't handle ...", vm_page_size, v9, v10, v11, v12, v13, v39);
    id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:7 userInfo:0];
LABEL_5:
    v14[2](v14, 0, v15);

    goto LABEL_6;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_100017164("-[KBXPCService SeshatRecoverWithSecret:secretSize:withReply:]", @"FAILED to allocate VM", v16, v17, v18, v19, v20, v21, v39);
    id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
    vm_address_t address = 0;
    goto LABEL_5;
  }
  if (a4)
  {
    id v22 = (UInt8 *)address;
    if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v8 ofLength:a4 withbaseaddress:address])
    {
      sub_100017164("-[KBXPCService SeshatRecoverWithSecret:secretSize:withReply:]", @"Failed to retrieve oldpasscode", v23, v24, v25, v26, v27, v28, v39);
      NSErrorDomain v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      vm_map_t v30 = mach_task_self_;
      vm_address_t v31 = address;
      vm_size_t v32 = vm_page_size;
      if (vm_page_size >= a4) {
        rsize_t v33 = a4;
      }
      else {
        rsize_t v33 = vm_page_size;
      }
      memset_s((void *)address, v33, 0, v33);
      vm_deallocate(v30, v31, v32);
      v14[2](v14, 0, v29);

      goto LABEL_6;
    }
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v34 = sub_10001CCAC(v22, a4);
  vm_map_t v35 = mach_task_self_;
  vm_address_t v36 = address;
  vm_size_t v37 = vm_page_size;
  if (vm_page_size >= a4) {
    rsize_t v38 = a4;
  }
  else {
    rsize_t v38 = vm_page_size;
  }
  memset_s((void *)address, v38, 0, v38);
  vm_deallocate(v35, v36, v37);
  v14[2](v14, v34, 0);
LABEL_6:
}

- (void)SeshatDebugWithDebugMask:(int)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  if (sub_10001D320(a3))
  {
    BOOL v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
  }
  else
  {
    BOOL v5 = 0;
  }
  v6[2](v6, v5);
}

- (void)createKeybagForUserSession:(id)a3 withSessionUID:(int)a4 WithSecret:(id)a5 secretSize:(unint64_t)a6 withGracePeriod:(int)a7 withOpaqeStuff:(id)a8 withReply:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  uint64_t v18 = (void (**)(id, void))a9;
  uint64_t v60 = 0;
  vm_size_t v61 = &v60;
  uint64_t v62 = 0x3032000000;
  char v63 = sub_100009728;
  id v64 = sub_100009738;
  id v65 = 0;
  vm_address_t address = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  int v58 = -1;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_100017164("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]", @"FAILED to allocate VM", v19, v20, v21, v22, v23, v24, v47);
      uint64_t v25 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
      uint64_t v26 = (void *)v61[5];
      v61[5] = v25;

      vm_address_t address = 0;
LABEL_5:
      v18[2](v18, v61[5]);
      goto LABEL_17;
    }
    if (a6)
    {
      vm_address_t v29 = address;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v16 ofLength:a6 withbaseaddress:address])
      {
        sub_100017164("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]", @"Failed to retrieve passcode info", v30, v31, v32, v33, v34, v35, v47);
        uint64_t v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        vm_size_t v37 = (void *)v61[5];
        v61[5] = v36;

        vm_map_t v38 = mach_task_self_;
        vm_address_t v39 = address;
        vm_size_t v40 = vm_page_size;
        if (vm_page_size >= a6) {
          rsize_t v41 = a6;
        }
        else {
          rsize_t v41 = vm_page_size;
        }
        memset_s((void *)address, v41, 0, v41);
        vm_deallocate(v38, v39, v40);
        goto LABEL_5;
      }
    }
    else
    {
      vm_address_t v29 = 0;
    }
    vm_size_t v42 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C2B8;
    block[3] = &unk_100030D90;
    id v49 = v15;
    unint64_t v53 = a6;
    vm_address_t v54 = v29;
    int v55 = a4;
    int v56 = a7;
    id v50 = v17;
    uint64_t v51 = &v60;
    uint64_t v52 = v57;
    dispatch_sync(v42, block);
    vm_map_t v43 = mach_task_self_;
    vm_address_t v44 = address;
    vm_size_t v45 = vm_page_size;
    if (vm_page_size >= a6) {
      rsize_t v46 = a6;
    }
    else {
      rsize_t v46 = vm_page_size;
    }
    memset_s((void *)address, v46, 0, v46);
    vm_deallocate(v43, v44, v45);
    v18[2](v18, v61[5]);
  }
  else
  {
    uint64_t v27 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v28 = (void *)v61[5];
    v61[5] = v27;

    if (v18) {
      goto LABEL_5;
    }
  }
LABEL_17:
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(&v60, 8);
}

- (void)loadKeybagForUserSession:(id)a3 withSessionID:(int)a4 withSecret:(id)a5 secretSize:(unint64_t)a6 shouldSetGracePeriod:(BOOL)a7 withGracePeriod:(int)a8 isInEarlyStar:(BOOL)a9 withReply:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  uint64_t v18 = (void (**)(id, void))a10;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  id v64 = sub_100009728;
  id v65 = sub_100009738;
  id v66 = 0;
  vm_address_t address = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  int v59 = -1;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_100017164("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]", @"FAILED to allocate VM", v19, v20, v21, v22, v23, v24, v47);
      uint64_t v25 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
      uint64_t v26 = (void *)v62[5];
      v62[5] = v25;

      vm_address_t address = 0;
LABEL_5:
      v18[2](v18, v62[5]);
      goto LABEL_17;
    }
    if (a6)
    {
      vm_address_t v29 = address;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v17 ofLength:a6 withbaseaddress:address])
      {
        sub_100017164("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]", @"Failed to retrieve passcode info", v30, v31, v32, v33, v34, v35, v47);
        uint64_t v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        vm_size_t v37 = (void *)v62[5];
        v62[5] = v36;

        vm_map_t v38 = mach_task_self_;
        vm_address_t v39 = address;
        vm_size_t v40 = vm_page_size;
        if (vm_page_size >= a6) {
          rsize_t v41 = a6;
        }
        else {
          rsize_t v41 = vm_page_size;
        }
        memset_s((void *)address, v41, 0, v41);
        vm_deallocate(v38, v39, v40);
        goto LABEL_5;
      }
    }
    else
    {
      vm_address_t v29 = 0;
    }
    vm_size_t v42 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C75C;
    block[3] = &unk_100030DB8;
    unint64_t v52 = a6;
    vm_address_t v53 = v29;
    BOOL v56 = a7;
    int v54 = a4;
    int v55 = a8;
    BOOL v57 = a9;
    id v49 = v16;
    id v50 = &v61;
    uint64_t v51 = v58;
    dispatch_sync(v42, block);
    vm_map_t v43 = mach_task_self_;
    vm_address_t v44 = address;
    vm_size_t v45 = vm_page_size;
    if (vm_page_size >= a6) {
      rsize_t v46 = a6;
    }
    else {
      rsize_t v46 = vm_page_size;
    }
    memset_s((void *)address, v46, 0, v46);
    vm_deallocate(v43, v44, v45);
    v18[2](v18, v62[5]);
  }
  else
  {
    uint64_t v27 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v28 = (void *)v62[5];
    v62[5] = v27;

    if (v18) {
      goto LABEL_5;
    }
  }
LABEL_17:
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(&v61, 8);
}

- (void)unloadKeybagForUserSession:(int)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100009728;
  id v15 = sub_100009738;
  id v16 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C9C8;
    v9[3] = &unk_100030DE0;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_100039870, v9);
LABEL_4:
    v6[2](v6, v12[5]);
    goto LABEL_5;
  }
  uint64_t v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  id v8 = (void *)v12[5];
  v12[5] = v7;

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:
  _Block_object_dispose(&v11, 8);
}

- (void)deleteKeybagForUserSession:(int)a3 withReply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100009728;
  id v16 = sub_100009738;
  id v17 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000CC24;
    v10[3] = &unk_100030DE0;
    int v11 = v4;
    v10[4] = &v12;
    dispatch_sync((dispatch_queue_t)qword_100039870, v10);
    uint64_t v7 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:v4];
    [v7 userDeleted];

LABEL_4:
    v6[2](v6, v13[5]);
    goto LABEL_5;
  }
  uint64_t v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
  uint64_t v9 = (void *)v13[5];
  v13[5] = v8;

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:
  _Block_object_dispose(&v12, 8);
}

- (void)setVolumeToPersona:(id)a3 withPersonaString:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_100009728;
  uint64_t v23 = sub_100009738;
  id v24 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    int v11 = qword_100039870;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000CEB8;
    v14[3] = &unk_100030E08;
    id v15 = v8;
    uint64_t v18 = &v19;
    id v16 = v9;
    id v17 = v10;
    dispatch_sync(v11, v14);
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v13 = (void *)v20[5];
    v20[5] = v12;

    if (v10) {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v20[5]);
    }
  }
  _Block_object_dispose(&v19, 8);
}

- (void)createSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100009728;
  uint64_t v21 = sub_100009738;
  id v22 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    id v10 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D2C4;
    block[3] = &unk_100030E30;
    int v16 = a4;
    id v14 = v8;
    id v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9) {
      v9[2](v9, v18[5]);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)loadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100009728;
  uint64_t v21 = sub_100009738;
  id v22 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    id v10 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D53C;
    block[3] = &unk_100030E30;
    int v16 = a4;
    id v14 = v8;
    id v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9) {
      v9[2](v9, v18[5]);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)verifySyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100009728;
  uint64_t v21 = sub_100009738;
  id v22 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    id v10 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7B4;
    block[3] = &unk_100030E30;
    int v16 = a4;
    id v14 = v8;
    id v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9) {
      v9[2](v9, v18[5]);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)unloadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100009728;
  uint64_t v21 = sub_100009738;
  id v22 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    id v10 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DA2C;
    block[3] = &unk_100030E30;
    int v16 = a4;
    id v14 = v8;
    id v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9) {
      v9[2](v9, v18[5]);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)removeSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100009728;
  uint64_t v21 = sub_100009738;
  id v22 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    id v10 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DCF4;
    block[3] = &unk_100030E30;
    int v16 = a4;
    id v14 = v8;
    id v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9) {
      v9[2](v9, v18[5]);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)createPersonaKeyForUserSession:(id)a3 forPath:(id)a4 withUID:(unsigned int)a5 WithSecret:(id)a6 secretSize:(unint64_t)a7 withReply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v17 = (void (**)(id, void))a8;
  uint64_t v58 = 0;
  int v59 = &v58;
  uint64_t v60 = 0x3032000000;
  uint64_t v61 = sub_100009728;
  uint64_t v62 = sub_100009738;
  id v63 = 0;
  vm_address_t address = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  int v56 = -1;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_100017164("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]", @"FAILED to allocate VM", v18, v19, v20, v21, v22, v23, v46);
      uint64_t v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
      uint64_t v25 = (void *)v59[5];
      v59[5] = v24;

      vm_address_t address = 0;
LABEL_5:
      v17[2](v17, v59[5]);
      goto LABEL_17;
    }
    if (a7)
    {
      vm_address_t v28 = address;
      if ([(KBXPCService *)self retrievePasscodeFromFileHandle:v16 ofLength:a7 withbaseaddress:address])
      {
        sub_100017164("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]", @"Failed to passcode info", v29, v30, v31, v32, v33, v34, v46);
        uint64_t v35 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        uint64_t v36 = (void *)v59[5];
        v59[5] = v35;

        vm_map_t v37 = mach_task_self_;
        vm_address_t v38 = address;
        vm_size_t v39 = vm_page_size;
        if (vm_page_size >= a7) {
          rsize_t v40 = a7;
        }
        else {
          rsize_t v40 = vm_page_size;
        }
        memset_s((void *)address, v40, 0, v40);
        vm_deallocate(v37, v38, v39);
        goto LABEL_5;
      }
    }
    else
    {
      vm_address_t v28 = 0;
    }
    rsize_t v41 = qword_100039870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E1C8;
    block[3] = &unk_100030E58;
    unsigned int v54 = a5;
    id v48 = v15;
    unint64_t v52 = a7;
    vm_address_t v53 = v28;
    id v49 = v14;
    id v50 = &v58;
    uint64_t v51 = v55;
    dispatch_sync(v41, block);
    vm_map_t v42 = mach_task_self_;
    vm_address_t v43 = address;
    vm_size_t v44 = vm_page_size;
    if (vm_page_size >= a7) {
      rsize_t v45 = a7;
    }
    else {
      rsize_t v45 = vm_page_size;
    }
    memset_s((void *)address, v45, 0, v45);
    vm_deallocate(v42, v43, v44);
    v17[2](v17, v59[5]);
  }
  else
  {
    uint64_t v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    uint64_t v27 = (void *)v59[5];
    v59[5] = v26;

    if (v17) {
      goto LABEL_5;
    }
  }
LABEL_17:
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v58, 8);
}

- (void)removePersonaKeyForUserSession:(id)a3 withUID:(unsigned int)a4 withVolumeUUIDString:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void))a6;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100009728;
  uint64_t v25 = sub_100009738;
  id v26 = 0;
  if ([(KBXPCService *)self remoteProcessHasBooleanEntitlement:@"com.apple.mkb.usersession.ops"])
  {
    uint64_t v13 = qword_100039870;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E484;
    v16[3] = &unk_100030E80;
    unsigned int v20 = a4;
    id v17 = v10;
    id v18 = v11;
    uint64_t v19 = &v21;
    dispatch_sync(v13, v16);
    v12[2](v12, v22[5]);
  }
  else
  {
    uint64_t v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    id v15 = (void *)v22[5];
    v22[5] = v14;

    if (v12) {
      v12[2](v12, v22[5]);
    }
  }
  _Block_object_dispose(&v21, 8);
}

@end