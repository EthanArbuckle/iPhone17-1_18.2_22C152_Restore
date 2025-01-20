@interface fskitdXPCServer
+ (void)LiveMounterDoUnmount:(id)a3 how:(int)a4 reply:(id)a5;
+ (void)LiveMounterDoUnmountCleanup:(id)a3 how:(int)a4 reply:(id)a5;
+ (void)LiveMounterDoUnmountPreflight:(id)a3 how:(int)a4 reply:(id)a5;
- (BOOL)clientHasEntitlement;
- (BOOL)extensionSupportsResource:(id)a3 resource:(id)a4;
- (BOOL)hasTaskInterest;
- (NSXPCConnection)ourConn;
- (id)applyResource:(id)a3 targetBundle:(id)a4 instanceID:(id)a5 initiatorAuditToken:(id)a6 authorizingAuditToken:(id)a7 isProbe:(BOOL)a8 usingBlock:(id)a9;
- (id)canStartActivateTask:(id)a3 resource:(id)a4;
- (id)canStartDeactivateTask:(id)a3 resource:(id)a4;
- (id)canStartProbeTask:(id)a3 resource:(id)a4;
- (id)canStartTask:(id)a3 resource:(id)a4;
- (id)canStartUnloadTask:(id)a3 resource:(id)a4;
- (id)getBundleIDFromShortName:(id)a3;
- (id)getExtensionModuleFromID:(id)a3 forToken:(id)a4;
- (id)getInitiatorBundleIDForToken:(id *)a3;
- (id)getInitiatorSigningIDForToken:(id *)a3;
- (id)initForEntitledClient:(BOOL)a3;
- (void)LiveMounterMountVolume:(id)a3 provider:(id)a4 on:(id)a5 how:(int)a6 reply:(id)a7;
- (void)LiveMounterReallyMountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 auditToken:(id *)a11 reply:(id)a12;
- (void)_activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)_checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8;
- (void)_currentContainersForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)_currentResourceIDsForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)_currentTasksForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)_deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)_formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8;
- (void)_installedExtensionWithShortName:(id)a3 user:(id)a4 replyHandler:(id)a5;
- (void)_installedExtensionsForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)_loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)_probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6;
- (void)_unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)activateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)cancelTask:(id)a3 replyHandler:(id)a4;
- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8;
- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7;
- (void)checkVolume:(id)a3 options:(id)a4 auditToken:(id *)a5 connection:(id)a6 replyHandler:(id)a7;
- (void)checkVolume:(id)a3 options:(id)a4 connection:(id)a5 replyHandler:(id)a6;
- (void)currentContainers:(id)a3;
- (void)currentContainersForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)currentResourceIDs:(id)a3;
- (void)currentResourceIDsForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)currentTasks:(id)a3;
- (void)currentTasksForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)deactivateVolume:(id)a3 shortName:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6;
- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6;
- (void)doCheckResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 reply:(id)a7;
- (void)doKernelMount:(id)a3 providerName:(id)a4 mountEntry:(id)a5;
- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8;
- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7;
- (void)getProgressPortForTask:(id)a3 replyHandler:(id)a4;
- (void)getRealResource:(id)a3 auditToken:(id)a4 reply:(id)a5;
- (void)handleInvalidated;
- (void)installedExtensionWithShortName:(id)a3 replyHandler:(id)a4;
- (void)installedExtensionWithShortName:(id)a3 user:(id)a4 replyHandler:(id)a5;
- (void)installedExtensions:(id)a3;
- (void)installedExtensionsForAuditToken:(id *)a3 replyHandler:(id)a4;
- (void)listMounts:(BOOL)a3 reply:(id)a4;
- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8 options:(id)a9 reply:(id)a10;
- (void)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8 reply:(id)a9;
- (void)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 auditToken:(id *)a11 reply:(id)a12;
- (void)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 reply:(id)a11;
- (void)probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6;
- (void)probeResource:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5;
- (void)reallyUpdateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5 reply:(id)a6;
- (void)setClientHasEntitlement:(BOOL)a3;
- (void)setEnabledStateForIdentifier:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5;
- (void)setEnabledStateForToken:(id *)a3 identifier:(id)a4 newState:(BOOL)a5 replyHandler:(id)a6;
- (void)setHasTaskInterest:(BOOL)a3;
- (void)setOurConn:(id)a3;
- (void)setTaskUpdateInterest:(BOOL)a3 replyHandler:(id)a4;
- (void)setVerboseLevel:(int)a3 reply:(id)a4;
- (void)switchToFSKit:(id)a3;
- (void)unloadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)unmountVolume:(id)a3 how:(int)a4 reply:(id)a5;
- (void)unmountVolume:(id)a3 provider:(id)a4 how:(int)a5 domainError:(id)a6 reply:(id)a7;
- (void)unmountVolumeByID:(unsigned int)a3 how:(int)a4 reply:(id)a5;
- (void)updateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5 reply:(id)a6;
- (void)verboseLevel:(id)a3;
@end

@implementation fskitdXPCServer

- (id)initForEntitledClient:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)fskitdXPCServer;
  id result = [(fskitdXPCServer *)&v5 init];
  if (result) {
    *((unsigned char *)result + 9) = a3;
  }
  return result;
}

- (void)handleInvalidated
{
  v2 = self;
  objc_sync_enter(v2);
  ourConn = v2->_ourConn;
  v2->_ourConn = 0;

  BOOL hasTaskInterest = v2->_hasTaskInterest;
  objc_sync_exit(v2);

  if (hasTaskInterest)
  {
    objc_super v5 = [(id)qword_100060740 taskUpdateClients];
    objc_sync_enter(v5);
    v6 = v2;
    objc_sync_enter(v6);
    if (v2->_hasTaskInterest)
    {
      v2->_BOOL hasTaskInterest = 0;
      v7 = [(id)qword_100060740 taskUpdateClients];
      [v7 removeObject:v6];
    }
    objc_sync_exit(v6);

    objc_sync_exit(v5);
    v8 = (void *)qword_100060740;
    [v8 taskSetChanged];
  }
}

- (void)switchToFSKit:(id)a3
{
  v4 = (void *)qword_100060740;
  objc_super v5 = (void (**)(id, void))a3;
  [v4 startedWork];
  if (self->_clientHasEntitlement) {
    +[FSKitConstants FSAllClientXPCProtocols];
  }
  else {
  v6 = +[FSKitConstants FSClientXPCProtocol];
  }
  [(NSXPCConnection *)self->_ourConn setExportedInterface:v6];

  v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_clientHasEntitlement) {
      v8 = "yes";
    }
    else {
      v8 = "no";
    }
    int v10 = 136315138;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Hello FSClient! entitlement %s", (uint8_t *)&v10, 0xCu);
  }

  v9 = +[FSKitConstants FSClientHostXPCProtocol];
  [(NSXPCConnection *)self->_ourConn setRemoteObjectInterface:v9];

  v5[2](v5, 0);
}

- (void)listMounts:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  objc_super v5 = (void *)qword_100060740;
  v6 = (void (**)(id, id))a4;
  [v5 startedWork];
  id v7 = [(id)qword_100060780 list:v4];
  v6[2](v6, v7);
}

- (void)LiveMounterReallyMountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 auditToken:(id *)a11 reply:(id)a12
{
  id v18 = a3;
  id v82 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v81 = a10;
  v23 = (void (**)(id, void))a12;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = sub_10001EA90;
  v97 = sub_10001EAA0;
  id v98 = 0;
  id v24 = v18;
  Boolean keyExistsAndHasValidFormat = 0;
  v25 = livefs_std_log();
  v79 = self;
  unsigned int v80 = a9;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    *(void *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v20;
    *(_WORD *)v104 = 2112;
    *(void *)&v104[2] = v21;
    *(_WORD *)&v104[10] = 2112;
    *(void *)&v104[12] = v22;
    __int16 v105 = 1024;
    int v106 = a9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "ReallyMountVolume:volume:%@:displayName:%@:provider:%@:domainError:%@:on:%@:how:0x%08x", buf, 0x3Au);
  }
  v83 = v19;

  if (v21)
  {
    v26 = [v21 domain];
    if (![v26 isEqual:NSPOSIXErrorDomain])
    {
LABEL_9:

      goto LABEL_10;
    }
    BOOL v27 = [v21 code] == (id)80;

    if (v27)
    {
      v28 = livefs_std_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_10003F0F0();
      }

      +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:0];
      v26 = v21;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
LABEL_10:
  if (([v24 containsString:@"/"] & 1) != 0
    || [v24 containsString:@":"])
  {
    uint64_t v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:0];
    BOOL v30 = 0;
    int v31 = 0;
    int v32 = 0;
    id v33 = 0;
    id v84 = 0;
LABEL_13:
    v34 = v94[5];
    v94[5] = v29;
LABEL_41:

    goto LABEL_42;
  }
  if ([v22 isAbsolutePath])
  {
    id v84 = v22;
  }
  else
  {
    id v84 = +[NSString stringWithFormat:@"%@/%@", off_100060710, v22];
  }
  v35 = livefs_std_log();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v84;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "ReallyMountVolume: Enter for provider %{public}@ mounting: %@", buf, 0x16u);
  }

  v36 = (id *)(v94 + 5);
  id obj = (id)v94[5];
  id v33 = [(id)qword_100060780 preflightMountWithName:v24 displayName:v19 storageName:v24 provider:v20 path:v22 error:&obj];
  objc_storeStrong(v36, obj);
  if (v94[5])
  {
    v34 = livefs_std_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003F088();
    }
LABEL_40:
    BOOL v30 = 0;
    int v31 = 0;
    int v32 = 0;
    goto LABEL_41;
  }
  if (v33)
  {
    if ((a9 & 0x40) == 0 && (unint64_t)[v33 currentState] <= 1)
    {
      uint64_t v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:17 userInfo:0];
      BOOL v30 = 0;
      int v31 = 0;
      int v32 = 0;
      goto LABEL_13;
    }
    v37 = [v33 displayName];
    if ([v37 isEqualToString:v19])
    {
      v38 = [v33 storageName];
      if ([v38 isEqualToString:v24])
      {
        v39 = [v33 mntOn];
        unsigned __int8 v40 = [v39 isEqualToString:v84];

        if (v40) {
          goto LABEL_37;
        }
LABEL_36:
        [v33 refreshPath:v84 displayName:v83 storageName:v24];
        goto LABEL_37;
      }
    }
    goto LABEL_36;
  }
  id v41 = [objc_alloc((Class)FSAuditToken) initWithToken:a11];
  LODWORD(v77) = -1;
  id v33 = +[mountEntry newWithName:v24 fileSystem:v82 displayName:v19 storageName:v24 provider:v20 path:v84 mountID:v77 auditToken:v41 mntTable:qword_100060780];

  if (!v33)
  {
    v42 = livefs_std_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10003ED68();
    }

    uint64_t v29 = +[NSError errorWithDomain:NSCocoaErrorDomain code:516 userInfo:0];
    BOOL v30 = 0;
    int v31 = 0;
    int v32 = 0;
    id v33 = 0;
    goto LABEL_13;
  }
LABEL_37:
  uint64_t v43 = [qword_100060770 mkMountPath:v22 mountID:[v33 midx]];
  v44 = (void *)v94[5];
  v94[5] = v43;

  if (v43)
  {
    v34 = livefs_std_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003F020();
    }
    goto LABEL_40;
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"LIFS_DA", @"com.apple.filesystems.livefileproviderd", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat || AppBooleanValue)
  {
    unsigned int v62 = [@"com.apple.filesystems.UserFS.FileProvider" isEqualToString:v20];
    int v63 = a9;
    if (v62) {
      int v63 = a9 | 0x100;
    }
    unsigned int v80 = v63;
  }
  BYTE4(v78) = (v80 & 0x40) != 0;
  LODWORD(v78) = v80;
  uint64_t v64 = [(id)qword_100060740 addMountNamed:v24 displayName:v83 mountID:objc_msgSend(v33 mountedOn:"midx") provider:v22 fpStorage:v20 domainError:v24 how:v21 isReAdd:v78];
  v65 = (void *)v94[5];
  v94[5] = v64;

  if (v94[5])
  {
    v34 = livefs_std_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003EFB8();
    }
    BOOL v30 = 0;
    int v31 = 0;
    goto LABEL_110;
  }
  [v33 setDomainError:v21];
  if (v21)
  {
    v66 = livefs_std_log();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
      sub_10003EF78();
    }

    v80 |= 2u;
  }
  [v33 setCurrentState:1];
  BOOL v30 = (v80 & 4) == 0;
  if ((v80 & 4) == 0)
  {
    dispatch_semaphore_t v67 = dispatch_semaphore_create(0);
    v68 = livefs_std_log();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v21;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Adding domain %@ for provider %@ domainError %@", buf, 0x20u);
    }

    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_10001EAA8;
    v88[3] = &unk_100059568;
    v90 = &v93;
    v34 = v67;
    v89 = v34;
    +[LivefsDomainManager addDomain:v24 displayName:v83 storage:v24 provider:v20 domainError:v21 how:v80 reply:v88];
    dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
    if (v94[5])
    {

      BOOL v30 = 0;
LABEL_109:
      int v31 = 1;
LABEL_110:
      int v32 = 1;
      goto LABEL_41;
    }
    v69 = livefs_std_log();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "addDomain succeeded for provider %@", buf, 0xCu);
    }

    v70 = livefs_std_log();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
      sub_10003EEFC();
    }
  }
  v71 = livefs_std_log();
  v80 |= (v80 >> 5) & 2;
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
    sub_10003EE78();
  }

  if ((v80 & 2) == 0)
  {
    uint64_t v72 = [v33 connect];
    v73 = (void *)v94[5];
    v94[5] = v72;

    if (v72)
    {
      v34 = livefs_std_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10003EE10();
      }
      goto LABEL_109;
    }
  }
  v74 = livefs_std_log();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v80;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v81;
    _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "ReallyMountVolume:mount mp for volume:%@ how:0x%08x mountOptions:%@", buf, 0x1Cu);
  }

  uint64_t v75 = [v33 mount:v80 options:v81];
  v76 = (void *)v94[5];
  v94[5] = v75;

  if (v75)
  {
    v34 = livefs_std_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003EDA8();
    }
    goto LABEL_109;
  }
  if ((v80 & 2) == 0) {
    [(fskitdXPCServer *)v79 doKernelMount:v84 providerName:v20 mountEntry:v33];
  }
  int v31 = 1;
  int v32 = 1;
LABEL_42:
  if (v94[5])
  {
    if (v33) {
      [v33 setCurrentState:2];
    }
    if (v30)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = sub_10001EA90;
      *(void *)v104 = sub_10001EAA0;
      *(void *)&v104[8] = 0;
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_10001EB2C;
      v85[3] = &unk_100059568;
      v87 = buf;
      v45 = dispatch_semaphore_create(0);
      v86 = v45;
      +[LivefsDomainManager removeDomain:v24 provider:v20 how:v80 reply:v85];
      dispatch_semaphore_wait(v45, 0xFFFFFFFFFFFFFFFFLL);
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        v46 = livefs_std_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          uint64_t v47 = v94[5];
          uint64_t v48 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v99 = 138412546;
          uint64_t v100 = v47;
          __int16 v101 = 2112;
          uint64_t v102 = v48;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "While recovering from %@, domain cleanup encountered %@", v99, 0x16u);
        }
      }
      _Block_object_dispose(buf, 8);
    }
    if (v31) {
      id v49 = [(id)qword_100060740 removeMountNamed:v24 provider:v20];
    }
    if (v32)
    {
      if (v33) {
        id v50 = [v33 unmount:7];
      }
      if (rmdir((const char *)[v84 fileSystemRepresentation]))
      {
        int v51 = *__error();
        BOOL v52 = v33 && v51 == 2;
        BOOL v53 = v52;
        if (v51 && !v53)
        {
          v54 = livefs_std_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            sub_10003ECF0(v51, v54);
          }
        }
      }
    }
  }
  if (v94[5])
  {
    v55 = livefs_std_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v56 = v94[5];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v56;
      v57 = "ReallyMountVolume: returning %@";
      v58 = v55;
      os_log_type_t v59 = OS_LOG_TYPE_DEFAULT;
      uint32_t v60 = 12;
LABEL_73:
      _os_log_impl((void *)&_mh_execute_header, v58, v59, v57, buf, v60);
    }
  }
  else
  {
    v55 = livefs_std_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v57 = "ReallyMountVolume:finish:success";
      v58 = v55;
      os_log_type_t v59 = OS_LOG_TYPE_INFO;
      uint32_t v60 = 2;
      goto LABEL_73;
    }
  }

  v23[2](v23, v94[5]);
  _Block_object_dispose(&v93, 8);
}

- (void)doKernelMount:(id)a3 providerName:(id)a4 mountEntry:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EC8C;
  block[3] = &unk_100059590;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

- (void)LiveMounterMountVolume:(id)a3 provider:(id)a4 on:(id)a5 how:(int)a6 reply:(id)a7
{
}

- (void)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8 options:(id)a9 reply:(id)a10
{
  LODWORD(v10) = a8;
  [(fskitdXPCServer *)self mountVolume:a3 fileSystem:0 displayName:a4 provider:a5 domainError:a6 on:a7 how:v10 options:a9 reply:a10];
}

- (void)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 reply:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  if (v17 && v20 && v22)
  {
    [(id)qword_100060740 startedWork];
    v25 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F054;
    block[3] = &unk_1000595B8;
    void block[4] = self;
    id v28 = v17;
    id v29 = v18;
    id v30 = v19;
    id v31 = v20;
    id v32 = v21;
    id v33 = v22;
    int v36 = a9;
    id v34 = v23;
    id v35 = v24;
    dispatch_async(v25, block);
  }
  else
  {
    v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v24 + 2))(v24, v26);
  }
}

- (void)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (v15 && v17 && v19)
  {
    [(id)qword_100060740 startedWork];
    id v21 = dispatch_get_global_queue(2, 0);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001F2D8;
    v23[3] = &unk_1000595E0;
    v23[4] = self;
    id v24 = v15;
    id v25 = v16;
    id v26 = v17;
    id v27 = v18;
    id v28 = v19;
    int v30 = a8;
    id v29 = v20;
    dispatch_async(v21, v23);
  }
  else
  {
    id v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v20 + 2))(v20, v22);
  }
}

- (void)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9 options:(id)a10 auditToken:(id *)a11 reply:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a10;
  id v25 = (void (**)(id, uint64_t))a12;
  if (!self->_clientHasEntitlement)
  {
    id v28 = fskit_std_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10003F26C();
    }

    uint64_t v29 = fs_errorForPOSIXError();
    goto LABEL_10;
  }
  if (!v18 || !v21 || !v23)
  {
    uint64_t v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
LABEL_10:
    int v30 = (void *)v29;
    v25[2](v25, v29);

    goto LABEL_11;
  }
  [(id)qword_100060740 startedWork];
  id v26 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F5E0;
  block[3] = &unk_100059608;
  void block[4] = self;
  id v32 = v18;
  id v33 = v20;
  id v34 = v21;
  id v35 = v22;
  id v36 = v23;
  int v39 = a9;
  id v37 = v24;
  long long v27 = *(_OWORD *)&a11->var0[4];
  long long v40 = *(_OWORD *)a11->var0;
  long long v41 = v27;
  v38 = v25;
  dispatch_async(v26, block);

LABEL_11:
}

- (void)reallyUpdateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  v14 = (void *)qword_100060740;
  id v28 = 0;
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_10001F858;
  id v26 = &unk_100059630;
  id v15 = v12;
  id v27 = v15;
  id v16 = [v14 updateMountEntry:v10 provider:v11 settingsDictionary:&v28 updateBlock:&v23];
  id v17 = v28;
  if (v16)
  {
    v13[2](v13, v16);
  }
  else
  {
    id v18 = [(id)qword_100060780 lookupName:v10 provider:v11];
    id v19 = v18;
    if (v18)
    {
      if (v15)
      {
        [v18 setDomainError:v15];
      }
      else
      {
        id v20 = [v18 domainError];

        [v19 setDomainError:0];
        if (v20)
        {
          [v19 resetConnectError];
          id v21 = [v19 mntOn];
          id v22 = v21;
          if (([v21 isAbsolutePath] & 1) == 0)
          {
            id v22 = +[NSString stringWithFormat:@"%@/%@", off_100060710, v21, v23, v24, v25, v26];
          }
          [(fskitdXPCServer *)self doKernelMount:v22 providerName:v11 mountEntry:v19];
        }
      }
    }
    +[LivefsDomainManager updateDomain:v17 reply:v13];
  }
}

- (void)updateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11)
  {
    [(id)qword_100060740 startedWork];
    v14 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FA84;
    block[3] = &unk_100059658;
    void block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v13 + 2))(v13, v15);
  }
}

+ (void)LiveMounterDoUnmountPreflight:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = livefs_std_log();
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 mntOn];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unmounting %{public}@ how %02x", (uint8_t *)&v14, 0x12u);
    }
    id v12 = [v7 volumeName];
    [v7 unmountPreflight:v6];
    v8[2](v8, 0, v12);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = [0 mntOn];
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ is not mounted", (uint8_t *)&v14, 0xCu);
    }
    id v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
    ((void (**)(id, void *, void *))v8)[2](v8, v12, 0);
  }
}

+ (void)LiveMounterDoUnmountCleanup:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10001EA90;
  int v30 = sub_10001EAA0;
  id v31 = 0;
  if (!v7)
  {
    id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
    v8[2](v8, v9, 0);
  }
  id v10 = [v7 volumeName];
  uint64_t v11 = [v7 unmountPostflight:v6];
  id v12 = (void *)v27[5];
  v27[5] = v11;

  if ((v6 & 2) != 0)
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    int v14 = [v7 providerName];
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    id v22 = sub_10001FEEC;
    id v23 = &unk_100059568;
    id v25 = &v26;
    id v15 = v13;
    uint64_t v24 = v15;
    +[LivefsDomainManager removeDomain:v10 provider:v14 how:v6 reply:&v20];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (!v27[5])
    {
      __int16 v16 = (void *)qword_100060740;
      int v17 = [v7 providerName:v20, v21, v22, v23];
      uint64_t v18 = [v16 removeMountNamed:v10 provider:v17];
      id v19 = (void *)v27[5];
      v27[5] = v18;

      if (!v27[5])
      {
        [(id)qword_100060780 remove:v7];
        [v7 setCurrentState:2];
      }
    }
  }
  ((void (**)(id, void *, void *))v8)[2](v8, (void *)v27[5], v10);

  _Block_object_dispose(&v26, 8);
}

+ (void)LiveMounterDoUnmount:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  uint64_t v34 = 0;
  v35[0] = &v34;
  v35[1] = 0x3032000000;
  v35[2] = sub_10001EA90;
  v35[3] = sub_10001EAA0;
  id v36 = 0;
  if (v7)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 mntOn];
      *(_DWORD *)buf = 138543618;
      v42 = v10;
      __int16 v43 = 1024;
      int v44 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unmounting %{public}@ how %02x", buf, 0x12u);
    }
    uint64_t v11 = [v7 volumeName];
    if ([v7 unmountPreflight:v6])
    {
      uint64_t v12 = [v7 unmount:v6];
      dispatch_semaphore_t v13 = *(void **)(v35[0] + 40);
      *(void *)(v35[0] + 40) = v12;

      if (!*(void *)(v35[0] + 40))
      {
        uint64_t v14 = [v7 unmountPostflight:v6];
        id v15 = *(void **)(v35[0] + 40);
        *(void *)(v35[0] + 40) = v14;
      }
    }
    if (*(void *)(v35[0] + 40))
    {
      __int16 v16 = livefs_std_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = [v7 mntOn];
        sub_10003F2AC(v17, (uint64_t)v35, buf, v16);
      }
    }
    else
    {
      if ((v6 & 2) == 0)
      {
LABEL_19:
        uint64_t v26 = livefs_std_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = *(void *)(v35[0] + 40);
          *(_DWORD *)id v37 = 138412546;
          uint64_t v38 = v27;
          __int16 v39 = 2112;
          long long v40 = v11;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "unmount found mount, returning error %@, name %@", v37, 0x16u);
        }

        v8[2](v8, *(void *)(v35[0] + 40), v11);
        goto LABEL_22;
      }
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      uint64_t v21 = [v7 providerName];
      uint64_t v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_1000203FC;
      id v31 = &unk_100059568;
      id v33 = &v34;
      __int16 v16 = v20;
      id v32 = v16;
      +[LivefsDomainManager removeDomain:v11 provider:v21 how:v6 reply:&v28];

      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      if (!*(void *)(v35[0] + 40))
      {
        id v22 = (void *)qword_100060740;
        id v23 = [v7 providerName:v28, v29, v30, v31];
        uint64_t v24 = [v22 removeMountNamed:v11 provider:v23];
        id v25 = *(void **)(v35[0] + 40);
        *(void *)(v35[0] + 40) = v24;

        if (!*(void *)(v35[0] + 40))
        {
          [(id)qword_100060780 remove:v7];
          [v7 setCurrentState:2];
        }
      }
    }
    goto LABEL_19;
  }
  uint64_t v18 = livefs_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [0 mntOn];
    *(_DWORD *)buf = 138543362;
    v42 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@ is not mounted", buf, 0xCu);
  }
  uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
  ((void (**)(id, void *, void *))v8)[2](v8, v11, 0);
LABEL_22:

  _Block_object_dispose(&v34, 8);
}

- (void)unmountVolume:(id)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  if (dword_100060728)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v7;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unmount for %@ with how %d", buf, 0x12u);
    }
  }
  [(id)qword_100060740 startedWork];
  if ([v7 isAbsolutePath])
  {
    id v10 = v7;
  }
  else
  {
    id v11 = objc_alloc((Class)NSString);
    id v10 = [v11 initWithFormat:@"%@/%@", off_100060710, v7];
  }
  uint64_t v12 = v10;
  dispatch_semaphore_t v13 = [(id)qword_100060780 lookupByPath:v10];
  if (v13)
  {
    [(id)objc_opt_class() LiveMounterDoUnmount:v13 how:v6 reply:v8];
  }
  else
  {
    uint64_t v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@ is not mounted", buf, 0xCu);
    }

    id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
    v8[2](v8, v15, 0);
  }
}

- (void)unmountVolumeByID:(unsigned int)a3 how:(int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = (void (**)(id, void *, void))a5;
  if (dword_100060728)
  {
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109376;
      v10[1] = v6;
      __int16 v11 = 1024;
      int v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unmount for ID %u with how %d", (uint8_t *)v10, 0xEu);
    }
  }
  if ((v6 + 1) > 1)
  {
    [(id)qword_100060740 startedWork];
    id v9 = [(id)qword_100060780 lookup:v6];
    [(id)objc_opt_class() LiveMounterDoUnmount:v9 how:v5 reply:v7];
  }
  else
  {
    id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    v7[2](v7, v9, 0);
  }
}

- (void)unmountVolume:(id)a3 provider:(id)a4 how:(int)a5 domainError:(id)a6 reply:(id)a7
{
  LODWORD(v9) = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (dword_100060728)
  {
    __int16 v16 = livefs_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v13;
      __int16 v34 = 1024;
      int v35 = v9;
      __int16 v36 = 2112;
      id v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unmount of %@ for %@ with how %d domError %@", buf, 0x26u);
    }
  }
  id v17 = [(id)qword_100060780 lookupName:v12 provider:v13];
  if (v17)
  {
    [(id)qword_100060740 startedWork];
    __int16 v18 = [v17 domainError];
    [v17 setDomainError:v14];
    if (((v14 != 0) & (v9 >> 1)) != 0) {
      uint64_t v9 = v9 & 0xFFFFFFFD;
    }
    else {
      uint64_t v9 = v9;
    }
    int v19 = objc_opt_class();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100020AA4;
    v21[3] = &unk_100059680;
    id v22 = v18;
    id v23 = v14;
    int v29 = v9;
    id v24 = v17;
    id v25 = self;
    id v26 = v12;
    id v27 = v13;
    id v28 = v15;
    id v20 = v18;
    [v19 LiveMounterDoUnmount:v24 how:v9 reply:v21];
  }
  else
  {
    id v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
    (*((void (**)(id, id, void))v15 + 2))(v15, v20, 0);
  }
}

- (void)verboseLevel:(id)a3
{
  v3 = (void *)qword_100060740;
  BOOL v4 = (void (**)(id, void))a3;
  [v3 startedWork];
  v4[2](v4, dword_100060728);
}

- (void)setVerboseLevel:(int)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, void))a4;
  [(id)qword_100060740 startedWork];
  if (a3 < 0x65)
  {
    dword_100060728 = a3;
    v5[2](v5, 0);
  }
  else
  {
    NSErrorUserInfoKey v8 = NSDebugDescriptionErrorKey;
    CFStringRef v9 = @"verbose level must be between 0 and 100";
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v6];
    ((void (**)(id, void *))v5)[2](v5, v7);
  }
}

- (void)installedExtensions:(id)a3
{
  id v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020E2C;
  v7[3] = &unk_1000596A8;
  id v8 = v4;
  id v6 = v4;
  [(fskitdXPCServer *)self _installedExtensionsForAuditToken:v9 replyHandler:v7];
}

- (void)setEnabledStateForIdentifier:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  CFStringRef v9 = (void (**)(id, void *))a5;
  if (self->_clientHasEntitlement)
  {
    ourConn = self->_ourConn;
    if (ourConn) {
      [(NSXPCConnection *)ourConn auditToken];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    [(fskitdXPCServer *)self setEnabledStateForToken:v12 identifier:v8 newState:v6 replyHandler:v9];
  }
  else
  {
    __int16 v11 = fs_errorForPOSIXError();
    v9[2](v9, v11);
  }
}

- (void)installedExtensionWithShortName:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  CFStringRef v9 = +[FSAuditToken tokenWithToken:v10];
  [(fskitdXPCServer *)self _installedExtensionWithShortName:v6 user:v9 replyHandler:v7];
}

- (void)installedExtensionWithShortName:(id)a3 user:(id)a4 replyHandler:(id)a5
{
  if (self->_clientHasEntitlement)
  {
    id v10 = a5;
    -[fskitdXPCServer _installedExtensionWithShortName:user:replyHandler:](self, "_installedExtensionWithShortName:user:replyHandler:", a3, a4);
  }
  else
  {
    id v9 = a5;
    fs_errorForPOSIXError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void))a5 + 2))(v9, 0);
  }
}

- (void)_installedExtensionWithShortName:(id)a3 user:(id)a4 replyHandler:(id)a5
{
}

- (id)getExtensionModuleFromID:(id)a3 forToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  int v29 = sub_10001EA90;
  int v30 = sub_10001EAA0;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_10001EA90;
  id v24 = sub_10001EAA0;
  id v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000212B0;
  v19[3] = &unk_100059338;
  v19[4] = &v20;
  v19[5] = &v26;
  [(id)qword_100060768 currentExtensionsForToken:v6 replyHandler:v19];
  if (v21[5])
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    __int16 v16 = sub_10001EA90;
    id v17 = sub_10001EAA0;
    id v18 = 0;
    id v8 = (void *)v27[5];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    _OWORD v10[2] = sub_100021330;
    v10[3] = &unk_1000596D0;
    id v11 = v5;
    id v12 = &v13;
    [v8 enumerateObjectsUsingBlock:v10];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);

  return v7;
}

- (id)getBundleIDFromShortName:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_10001EA90;
  id v14 = sub_10001EAA0;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021510;
  v7[3] = &unk_1000596F8;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [(fskitdXPCServer *)self installedExtensionWithShortName:v4 replyHandler:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (BOOL)extensionSupportsResource:(id)a3 resource:(id)a4
{
  id v5 = a3;
  id v6 = [a4 kind];
  if (v6 == (id)3)
  {
    id v7 = [v5 attributes];
    id v8 = v7;
    id v9 = &FSModuleIdentityAttributeSupportsServerURLs;
    goto LABEL_5;
  }
  if (v6 == (id)1)
  {
    id v7 = [v5 attributes];
    id v8 = v7;
    id v9 = &FSModuleIdentityAttributeSupportsBlockResources;
LABEL_5:
    uint64_t v10 = [v7 objectForKeyedSubscript:*v9];

    if (v10 && ([v10 BOOLValue] & 1) != 0) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v11 = [v5 attributes];
  uint64_t v10 = [v11 objectForKeyedSubscript:FSModuleIdentityAttributeSupportsBlockResources];

  uint64_t v12 = [v5 attributes];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"FSSupportsServerURLs"];

  if ((!v10 || ([v10 BOOLValue] & 1) == 0)
    && (!v13 || ([v13 BOOLValue] & 1) == 0))
  {

LABEL_15:
    BOOL v14 = 1;
    goto LABEL_16;
  }

LABEL_13:
  BOOL v14 = 0;
LABEL_16:

  return v14;
}

- (void)getRealResource:(id)a3 auditToken:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, void))a5;
  if ([v7 kind] != (id)1)
  {
    if ([v7 kind] != (id)2 || !byte_100060758) {
      goto LABEL_23;
    }
    uint64_t v13 = +[FSGenericURLResource dynamicCast:v7];
    BOOL v14 = [(id)qword_100060740 resourceManager];
    objc_sync_enter(v14);
    id v15 = [(id)qword_100060740 resourceManager];
    __int16 v16 = [v13 getResourceID];
    id v17 = [v15 getResource:v16];

    if (!v17)
    {
      id v17 = v13;
      id v18 = [(id)qword_100060740 resourceManager];
      [v18 updateResource:v17];
    }
    objc_sync_exit(v14);

    v9[2](v9, v17, 0);
    id v7 = v17;
    goto LABEL_24;
  }
  uint64_t v43 = 0;
  int v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_10001EA90;
  uint64_t v47 = sub_10001EAA0;
  id v48 = +[FSBlockDeviceResource dynamicCast:v7];
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = sub_10001EA90;
  long long v41 = sub_10001EAA0;
  id v42 = 0;
  uint64_t v10 = (void *)v44[5];
  if (!v10) {
    goto LABEL_13;
  }
  if ([v10 fileDescriptor] != -1)
  {
    if (v44[5])
    {
      id v11 = fskit_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        [v7 getResourceID];
        objc_claimAutoreleasedReturnValue();
        sub_10003F538();
      }

      v9[2](v9, (id)v44[5], 0);
      char v12 = 0;
      goto LABEL_22;
    }
LABEL_13:
    char v12 = 1;
    goto LABEL_22;
  }
  int v19 = [(id)v44[5] BSDName];
  id v20 = [(id)v44[5] isWritable];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100021BCC;
  v36[3] = &unk_100059720;
  v36[4] = &v37;
  v36[5] = &v43;
  +[FSBlockDeviceResource openWithBSDName:v19 writable:v20 auditToken:v8 replyHandler:v36];

  id v21 = (id)v44[5];
  if (v38[5])
  {
    uint64_t v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003F4C0(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    id v30 = 0;
    uint64_t v31 = v38[5];
  }
  else
  {
    __int16 v32 = fskit_std_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      [v21 getResourceID];
      objc_claimAutoreleasedReturnValue();
      sub_10003F46C();
    }

    id v33 = [(id)qword_100060740 resourceManager];
    objc_sync_enter(v33);
    __int16 v34 = [(id)qword_100060740 resourceManager];
    [v34 updateResource:v21];

    objc_sync_exit(v33);
    uint64_t v31 = 0;
    id v30 = v21;
  }
  v9[2](v9, v30, v31);
  char v12 = 0;
  id v7 = v21;
LABEL_22:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  if (v12)
  {
LABEL_23:
    int v35 = fs_errorForPOSIXError();
    ((void (**)(id, id, void *))v9)[2](v9, 0, v35);
  }
LABEL_24:
}

- (id)applyResource:(id)a3 targetBundle:(id)a4 instanceID:(id)a5 initiatorAuditToken:(id)a6 authorizingAuditToken:(id)a7 isProbe:(BOOL)a8 usingBlock:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v50 = (void (**)(id, id, id, id, void *))a9;
  group = dispatch_group_create();
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  char v86 = 1;
  uint64_t v79 = 0;
  unsigned int v80 = (id *)&v79;
  uint64_t v81 = 0x3032000000;
  id v82 = sub_10001EA90;
  v83 = sub_10001EAA0;
  id v84 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = sub_10001EA90;
  uint64_t v77 = sub_10001EAA0;
  id v78 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = sub_10001EA90;
  v71 = sub_10001EAA0;
  id v72 = 0;
  [(id)qword_100060740 startedWork];
  int v19 = fskit_std_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10003F6B4((uint64_t)v14, (uint64_t)v89, (uint64_t)[v14 kind], v19);
  }

  id v20 = [(fskitdXPCServer *)self getExtensionModuleFromID:v15 forToken:v17];
  id v21 = v20;
  if (!v20)
  {
    uint64_t v29 = fskit_std_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10003F58C();
    }
    goto LABEL_19;
  }
  if (([v20 isEnabled] & 1) == 0)
  {
    uint64_t v29 = fskit_std_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditT"
                           "oken:isProbe:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Attempt to start disabled extension %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (![(fskitdXPCServer *)self extensionSupportsResource:v21 resource:v14])
  {
    uint64_t v29 = fskit_std_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = [v14 getResourceID];
      sub_10003F65C(v30, (uint64_t)v15, buf);
    }
LABEL_19:

    fs_errorForPOSIXError();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  uint64_t v22 = (void *)qword_100060748;
  uint64_t v23 = [v16 fs_containerIdentifier];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000226D0;
  v66[3] = &unk_100059748;
  v66[4] = &v79;
  v66[5] = &v67;
  [v22 extensionForBundle:v15 user:v17 instance:v23 replyHandler:v66];

  if (v80[5]
    || ([(id)v68[5] errorFromStartingProc],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        id v25 = v80[5],
        v80[5] = (id)v24,
        v25,
        v80[5]))
  {
    uint64_t v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v80[5];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditT"
                           "oken:isProbe:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      id v88 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: Starting extension for %@ reported error %@", buf, 0x20u);
    }

LABEL_11:
    id v28 = v80[5];
LABEL_20:
    id v31 = v28;
    goto LABEL_21;
  }
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100022750;
  v65[3] = &unk_100059770;
  v65[4] = &v79;
  v65[5] = &v73;
  [(fskitdXPCServer *)self getRealResource:v14 auditToken:v17 reply:v65];
  if (v80[5])
  {
    id v33 = fskit_std_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      [v14 getResourceID];
      objc_claimAutoreleasedReturnValue();
      sub_10003F600();
    }

    [(id)qword_100060740 removeReferencesToTask:v16];
    [(id)qword_100060740 taskSetChanged];
    goto LABEL_11;
  }
  id v34 = (id)v74[5];

  int v35 = (void *)v68[5];
  __int16 v36 = v80;
  id obj = v80[5];
  id v37 = [v35 newXPCConnectionWithError:&obj];
  objc_storeStrong(v36 + 5, obj);
  if (v80[5])
  {
    uint64_t v38 = fskit_std_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = v80[5];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditT"
                           "oken:isProbe:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      id v88 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: Connecting to extension for %@ intending to probe reported error %@", buf, 0x20u);
    }

    id v31 = v80[5];
  }
  else
  {
    long long v40 = fskit_std_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "About to talk to the connection for %@", buf, 0xCu);
    }

    dispatch_group_enter(group);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000227D4;
    v61[3] = &unk_100059568;
    int v63 = &v79;
    long long v41 = group;
    unsigned int v62 = v41;
    id v49 = [v37 remoteObjectProxyWithErrorHandler:v61];
    id v42 = [v16 fs_containerIdentifier];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100022834;
    v58[3] = &unk_100059568;
    uint32_t v60 = &v79;
    uint64_t v43 = v41;
    os_log_type_t v59 = v43;
    [v49 checkIn:v42 replyHandler:v58];

    dispatch_group_wait(v43, 0xFFFFFFFFFFFFFFFFLL);
    if (v80[5])
    {
      int v44 = fskit_std_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = v80[5];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAudi"
                             "tToken:isProbe:usingBlock:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        id v88 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s: checkIn to extension %@ reported error %@", buf, 0x20u);
      }

      id v31 = v80[5];
    }
    else
    {
      v46 = (void *)v68[5];
      uint64_t v47 = [v34 getResourceID];
      [v46 addResourceID:v47];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v88) = 0;
      dispatch_group_enter(v43);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_100022910;
      v52[3] = &unk_100059798;
      id v48 = v43;
      BOOL v53 = v48;
      v55 = buf;
      uint64_t v56 = &v67;
      v57 = v85;
      id v54 = v34;
      v50[2](v50, v15, v54, v37, v52);
      dispatch_group_wait(v48, 0xFFFFFFFFFFFFFFFFLL);
      id v31 = v80[5];

      _Block_object_dispose(buf, 8);
    }
  }
  id v14 = v34;
LABEL_21:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(v85, 8);

  return v31;
}

- (id)canStartProbeTask:(id)a3 resource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v7);
  id v8 = [(id)qword_100060740 resourceManager];
  id v9 = [v6 getResourceID];
  unsigned int v10 = [v8 getResourceState:v9];

  id v11 = +[FSBlockDeviceResource dynamicCast:v6];
  char v12 = v11;
  if (v10 >= 2
    && (v10 - 4 <= 0xFFFFFFFD ? (BOOL v15 = v11 == 0) : (BOOL v15 = 1),
        v15 || ([v11 isWritable] & 1) != 0))
  {
    id v14 = fs_errorForPOSIXError();
    id v16 = fskit_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [v6 getResourceID];
      objc_claimAutoreleasedReturnValue();
      sub_10003F704();
    }
  }
  else
  {
    uint64_t v13 = [(id)qword_100060740 resourceManager];
    [v13 addTaskUUID:v5 resource:v6];

    id v14 = 0;
  }

  objc_sync_exit(v7);

  return v14;
}

- (void)probeResource:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [(fskitdXPCServer *)self _probeResource:v8 usingBundle:v9 auditToken:v12 replyHandler:v10];
}

- (id)canStartTask:(id)a3 resource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v7);
  id v8 = [(id)qword_100060740 resourceManager];
  id v9 = [v6 getResourceID];
  unsigned int v10 = [v8 getResourceState:v9];

  if (v10)
  {
    id v11 = fs_errorForPOSIXError();
    char v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v6 getResourceID];
      objc_claimAutoreleasedReturnValue();
      sub_10003F764();
    }
  }
  else
  {
    uint64_t v13 = [(id)qword_100060740 resourceManager];
    [v13 addTaskUUID:v5 resource:v6];

    id v11 = 0;
  }
  objc_sync_exit(v7);

  return v11;
}

- (id)canStartUnloadTask:(id)a3 resource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10001EA90;
  id v27 = sub_10001EAA0;
  id v28 = 0;
  id v7 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v7);
  id v8 = [(id)qword_100060740 resourceManager];
  id v9 = [v8 getTaskUUIDs:v6];

  if (v9)
  {
    unsigned int v10 = [(id)qword_100060740 tasks];
    objc_sync_enter(v10);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100023280;
    v20[3] = &unk_1000597C0;
    uint64_t v22 = &v23;
    id v21 = v6;
    [v9 enumerateObjectsUsingBlock:v20];

    objc_sync_exit(v10);
  }
  if (!v24[5])
  {
    id v11 = [(id)qword_100060740 resourceManager];
    char v12 = [v6 getResourceID];
    unsigned int v13 = [v11 getResourceState:v12];

    if (v13 <= 6 && ((1 << v13) & 0x71) != 0)
    {
      id v14 = fskit_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        [v6 getResourceID];
        objc_claimAutoreleasedReturnValue();
        sub_10003F818();
      }

      BOOL v15 = [(id)qword_100060740 resourceManager];
      [v15 addTaskUUID:v5 resource:v6];
    }
    else
    {
      uint64_t v18 = fs_errorForPOSIXError();
      int v19 = (void *)v24[5];
      v24[5] = v18;

      BOOL v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [v6 getResourceID];
        objc_claimAutoreleasedReturnValue();
        [(id)v24[5] localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10003F7C4();
      }
    }
  }
  objc_sync_exit(v7);

  id v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (void)doCheckResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  [(fskitdXPCServer *)self _checkResource:v12 usingBundle:v13 options:v14 auditToken:v18 connection:v15 replyHandler:v16];
}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
}

- (void)checkVolume:(id)a3 options:(id)a4 connection:(id)a5 replyHandler:(id)a6
{
  id v6 = (void *)qword_100060740;
  id v7 = (void (**)(id, void, id))a6;
  [v6 startedWork];
  fs_errorForPOSIXError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);
}

- (id)getInitiatorBundleIDForToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v18.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v18.val[4] = v3;
  id v4 = SecTaskCreateWithAuditToken(0, &v18);
  if (v4)
  {
    id v5 = v4;
    id v6 = (__CFString *)SecTaskCopyValueForEntitlement(v4, @"application-identifier", 0);
    if (v6)
    {
      id v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        CFRelease(v5);
        id v9 = fskit_std_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_10003F8E4();
        }
        goto LABEL_11;
      }
      CFRelease(v7);
    }
    CFRelease(v5);
  }
  id v9 = fskit_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10003F86C(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  id v7 = &stru_10005A670;
LABEL_11:

  return v7;
}

- (id)getInitiatorSigningIDForToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  id v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (!v4)
  {
LABEL_6:
    id v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10003F95C(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    id v6 = &stru_10005A670;
    goto LABEL_12;
  }
  id v5 = v4;
  *(void *)cf.val = 0;
  id v6 = (__CFString *)SecTaskCopySigningIdentifier(v4, (CFErrorRef *)&cf);
  CFRelease(v5);
  uint64_t v7 = *(void *)cf.val;
  CFTypeID v8 = fskit_std_log();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003FA58(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    CFRelease(*(CFTypeRef *)cf.val);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003F9D4((uint64_t)v6, v9, v25);
  }

LABEL_12:

  return v6;
}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  [(fskitdXPCServer *)self _formatResource:v12 usingBundle:v13 options:v14 auditToken:v18 connection:v15 replyHandler:v16];
}

- (void)currentTasks:(id)a3
{
  id v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000238D4;
  v7[3] = &unk_1000596A8;
  id v8 = v4;
  id v6 = v4;
  [(fskitdXPCServer *)self _currentTasksForAuditToken:v9 replyHandler:v7];
}

- (void)currentResourceIDs:(id)a3
{
  id v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002399C;
  v7[3] = &unk_1000596A8;
  id v8 = v4;
  id v6 = v4;
  [(fskitdXPCServer *)self _currentResourceIDsForAuditToken:v9 replyHandler:v7];
}

- (void)currentContainers:(id)a3
{
  id v4 = a3;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023A64;
  v7[3] = &unk_1000596A8;
  id v8 = v4;
  id v6 = v4;
  [(fskitdXPCServer *)self _currentContainersForAuditToken:v9 replyHandler:v7];
}

- (void)setTaskUpdateInterest:(BOOL)a3 replyHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = (void (**)(id, void))a4;
  [(id)qword_100060740 startedWork];
  id v6 = [(id)qword_100060740 taskUpdateClients];
  objc_sync_enter(v6);
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (v7->_ourConn)
  {
    v7->_BOOL hasTaskInterest = v4;
    if (v4)
    {
      id v8 = [(id)qword_100060740 taskUpdateClients];
      [v8 addObject:v7];
    }
    else
    {
      id v9 = [(id)qword_100060740 taskUpdateClients];
      unsigned int v10 = [v9 containsObject:v7];

      if (!v10) {
        goto LABEL_7;
      }
      id v8 = [(id)qword_100060740 taskUpdateClients];
      [v8 removeObject:v7];
    }
  }
LABEL_7:
  objc_sync_exit(v7);

  objc_sync_exit(v6);
  [(id)qword_100060740 taskSetChanged];
  v11[2](v11, 0);
}

- (void)getProgressPortForTask:(id)a3 replyHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [(id)qword_100060740 startedWork];
  uint64_t v7 = [(id)qword_100060740 tasks];
  objc_sync_enter(v7);
  id v8 = [(id)qword_100060740 tasks];
  id v9 = [v8 objectForKey:v5];

  objc_sync_exit(v7);
  if (v9
    && ([v9 taskReferenceHolder],
        unsigned int v10 = objc_claimAutoreleasedReturnValue(),
        +[fskitdExtensionInstance dynamicCast:v10],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    id v22 = 0;
    id v12 = [v11 newXPCConnectionWithError:&v22];
    id v13 = v22;
    if (v13)
    {
      id v14 = v13;
      (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v13);
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100023E14;
      v20[3] = &unk_1000591E8;
      id v15 = v6;
      id v21 = v15;
      id v16 = [v12 remoteObjectProxyWithErrorHandler:v20];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100023E30;
      v17[3] = &unk_1000593B0;
      id v19 = v15;
      id v18 = v9;
      [v16 getProgressPortForTask:v5 replyHandler:v17];
    }
  }
  else
  {
    uint64_t v11 = fs_errorForPOSIXError();
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v11);
  }
}

- (void)cancelTask:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10003FC30();
  }

  id v9 = [(id)qword_100060740 tasks];
  objc_sync_enter(v9);
  unsigned int v10 = [(id)qword_100060740 tasks];
  uint64_t v11 = [v10 objectForKey:v6];

  objc_sync_exit(v9);
  if (v11)
  {
    id v12 = [v11 taskReferenceHolder];
    id v13 = +[fskitdExtensionInstance dynamicCast:v12];

    if (v13)
    {
      ourConn = self->_ourConn;
      if (ourConn) {
        [(NSXPCConnection *)ourConn auditToken];
      }
      else {
        memset(v38, 0, sizeof(v38));
      }
      uint64_t v25 = [(fskitdXPCServer *)self getInitiatorBundleIDForToken:v38];
      uint64_t v26 = self->_ourConn;
      if (v26) {
        [(NSXPCConnection *)v26 auditToken];
      }
      else {
        memset(v37, 0, sizeof(v37));
      }
      id v27 = [(fskitdXPCServer *)self getInitiatorSigningIDForToken:v37];
      id v28 = [v11 taskInitiatorID];
      if ([v25 isEqualToString:v28])
      {
        uint64_t v29 = [v11 taskSigningID];
        unsigned int v30 = [v27 isEqualToString:v29];

        if (v30)
        {
          [v13 terminate];
          uint64_t v31 = [v11 updatedDescriptionInState:3 error:0];

          +[fskitdExtensionClient postTaskStatusUpdate:v31];
          __int16 v32 = 0;
LABEL_24:
          id v34 = fskit_std_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_10003FBBC();
          }

          v7[2](v7, v32);
          uint64_t v11 = (void *)v31;
          goto LABEL_27;
        }
      }
      else
      {
      }
      id v33 = fskit_std_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        int v35 = [v11 taskInitiatorID];
        __int16 v36 = [v11 taskSigningID];
        *(_DWORD *)buf = 136316162;
        long long v40 = "-[fskitdXPCServer cancelTask:replyHandler:]";
        __int16 v41 = 2112;
        id v42 = v25;
        __int16 v43 = 2112;
        int v44 = v27;
        __int16 v45 = 2112;
        v46 = v35;
        __int16 v47 = 2112;
        id v48 = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s: Can't cancel task, the initator (%@:%@) isn't the same initator of the task (%@:%@)", buf, 0x34u);
      }
      __int16 v32 = fs_errorForPOSIXError();
      uint64_t v31 = (uint64_t)v11;
      goto LABEL_24;
    }
    id v16 = fskit_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003FB44(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    uint64_t v24 = fs_errorForPOSIXError();
    v7[2](v7, v24);
  }
  else
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003FAD0();
    }

    uint64_t v11 = fs_errorForPOSIXError();
    v7[2](v7, v11);
  }
LABEL_27:
}

- (id)canStartActivateTask:(id)a3 resource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v7);
  id v8 = [(id)qword_100060740 resourceManager];
  id v9 = [v8 getTaskUUIDs:v6];

  if ([v9 count])
  {
    unsigned int v10 = fs_errorForPOSIXError();
    uint64_t v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v6 getResourceID];
      id v13 = [v10 localizedDescription];
      int v19 = 136315906;
      uint64_t v20 = "-[fskitdXPCServer canStartActivateTask:resource:]";
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s:%@: Can't start new task, previous task is running: %@, error: %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    id v14 = [(id)qword_100060740 resourceManager];
    id v15 = [v6 getResourceID];
    unsigned int v16 = [v14 getResourceState:v15];

    if (v16 == 4)
    {
      uint64_t v17 = fskit_std_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        [v6 getResourceID];
        objc_claimAutoreleasedReturnValue();
        sub_10003FCA4();
      }

      uint64_t v11 = [(id)qword_100060740 resourceManager];
      [v11 addTaskUUID:v5 resource:v6];
      unsigned int v10 = 0;
    }
    else
    {
      unsigned int v10 = fs_errorForPOSIXError();
      uint64_t v11 = fskit_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [v6 getResourceID];
        objc_claimAutoreleasedReturnValue();
        [v10 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10003FCF8();
      }
    }
  }

  objc_sync_exit(v7);

  return v10;
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  [(fskitdXPCServer *)self _activateVolume:v10 usingBundle:v11 options:v12 auditToken:v15 replyHandler:v13];
}

- (void)activateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v14 = [(fskitdXPCServer *)self getBundleIDFromShortName:v11];
  if (v14)
  {
    [(fskitdXPCServer *)self activateVolume:v10 usingBundle:v14 options:v12 replyHandler:v13];
  }
  else
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003FD4C();
    }

    unsigned int v16 = fs_errorForPOSIXError();
    v13[2](v13, v16);
  }
}

- (id)canStartDeactivateTask:(id)a3 resource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10001EA90;
  id v27 = sub_10001EAA0;
  id v28 = 0;
  uint64_t v7 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v7);
  id v8 = [(id)qword_100060740 resourceManager];
  id v9 = [v8 getTaskUUIDs:v6];

  if (v9)
  {
    id v10 = [(id)qword_100060740 tasks];
    objc_sync_enter(v10);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000249E4;
    v20[3] = &unk_1000597C0;
    uint64_t v22 = &v23;
    id v21 = v6;
    [v9 enumerateObjectsUsingBlock:v20];

    objc_sync_exit(v10);
  }
  if (!v24[5])
  {
    id v11 = [(id)qword_100060740 resourceManager];
    id v12 = [v6 getResourceID];
    unsigned int v13 = [v11 getResourceState:v12];

    if (v13 - 5 > 1)
    {
      uint64_t v16 = fs_errorForPOSIXError();
      uint64_t v17 = (void *)v24[5];
      v24[5] = v16;

      id v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [v6 getResourceID];
        objc_claimAutoreleasedReturnValue();
        [(id)v24[5] localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10003FE14();
      }
    }
    else
    {
      id v14 = fskit_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        [v6 getResourceID];
        objc_claimAutoreleasedReturnValue();
        sub_10003FDC0();
      }

      id v15 = [(id)qword_100060740 resourceManager];
      [v15 addTaskUUID:v5 resource:v6];
    }
  }
  objc_sync_exit(v7);

  id v18 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v18;
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  [(fskitdXPCServer *)self _deactivateVolume:v10 usingBundle:v11 numericOptions:a5 auditToken:v14 replyHandler:v12];
}

- (void)deactivateVolume:(id)a3 shortName:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  unsigned int v13 = [(fskitdXPCServer *)self getBundleIDFromShortName:v11];
  if (v13)
  {
    [(fskitdXPCServer *)self deactivateVolume:v10 usingBundle:v13 numericOptions:a5 replyHandler:v12];
  }
  else
  {
    id v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003FE68();
    }

    id v15 = fs_errorForPOSIXError();
    v12[2](v12, v15);
  }
}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  [(fskitdXPCServer *)self _loadResource:v10 usingBundle:v11 options:v12 auditToken:v15 replyHandler:v13];
}

- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = [(fskitdXPCServer *)self getBundleIDFromShortName:v11];
  if (v14)
  {
    [(fskitdXPCServer *)self loadResource:v10 usingBundle:v14 options:v12 replyHandler:v13];
  }
  else
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003FEDC();
    }

    uint64_t v16 = fs_errorForPOSIXError();
    v13[2](v13, 0, v16);
  }
}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  ourConn = self->_ourConn;
  if (ourConn) {
    [(NSXPCConnection *)ourConn auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  [(fskitdXPCServer *)self _unloadResource:v10 usingBundle:v11 options:v12 auditToken:v15 replyHandler:v13];
}

- (void)unloadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v14 = [(fskitdXPCServer *)self getBundleIDFromShortName:v11];
  if (v14)
  {
    [(fskitdXPCServer *)self unloadResource:v10 usingBundle:v14 options:v12 replyHandler:v13];
  }
  else
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003FF50();
    }

    uint64_t v16 = fs_errorForPOSIXError();
    v13[2](v13, v16);
  }
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  if (self->_clientHasEntitlement)
  {
    long long v12 = *(_OWORD *)&a6->var0[4];
    v16[0] = *(_OWORD *)a6->var0;
    v16[1] = v12;
    id v13 = a7;
    [(fskitdXPCServer *)self _activateVolume:a3 usingBundle:a4 options:a5 auditToken:v16 replyHandler:v13];
  }
  else
  {
    id v14 = a7;
    fs_errorForPOSIXError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a7 + 2))(v14, v15);
  }
}

- (void)_activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  [(id)qword_100060740 startedWork];
  uint64_t v16 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  long long v17 = *(_OWORD *)&a6->var0[4];
  long long v28 = *(_OWORD *)a6->var0;
  long long v29 = v17;
  block[2] = sub_10002527C;
  block[3] = &unk_100059888;
  id v23 = v13;
  id v24 = v12;
  id v26 = v14;
  id v27 = v15;
  uint64_t v25 = self;
  id v18 = v14;
  id v19 = v15;
  id v20 = v12;
  id v21 = v13;
  dispatch_async(v16, block);
}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  if (self->_clientHasEntitlement)
  {
    long long v14 = *(_OWORD *)&a6->var0[4];
    v18[0] = *(_OWORD *)a6->var0;
    v18[1] = v14;
    id v15 = a8;
    [(fskitdXPCServer *)self _checkResource:a3 usingBundle:a4 options:a5 auditToken:v18 connection:a7 replyHandler:v15];
  }
  else
  {
    id v16 = a8;
    fs_errorForPOSIXError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a8 + 2))(v16, 0, v17);
  }
}

- (void)_checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  [(id)qword_100060740 startedWork];
  id v19 = dispatch_get_global_queue(0, 0);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100025F9C;
  v26[3] = &unk_100059928;
  v26[4] = self;
  id v27 = v14;
  long long v20 = *(_OWORD *)&a6->var0[4];
  long long v32 = *(_OWORD *)a6->var0;
  long long v33 = v20;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v18;
  id v25 = v14;
  dispatch_async(v19, v26);
}

- (void)checkVolume:(id)a3 options:(id)a4 auditToken:(id *)a5 connection:(id)a6 replyHandler:(id)a7
{
  uint64_t v7 = (void *)qword_100060740;
  id v8 = (void (**)(id, void, id))a7;
  [v7 startedWork];
  fs_errorForPOSIXError();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, 0, v9);
}

- (void)currentContainersForAuditToken:(id *)a3 replyHandler:(id)a4
{
  if (self->_clientHasEntitlement)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v6;
    id v7 = a4;
    [(fskitdXPCServer *)self _currentContainersForAuditToken:v10 replyHandler:v7];
  }
  else
  {
    id v8 = a4;
    fs_errorForPOSIXError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v8, 0, v9);
  }
}

- (void)_currentContainersForAuditToken:(id *)a3 replyHandler:(id)a4
{
  BOOL v4 = (void *)qword_100060740;
  id v5 = (void (**)(id, id, void))a4;
  [v4 startedWork];
  id v6 = [(id)qword_100060748 getInstancesInfo];
  v5[2](v5, v6, 0);
}

- (void)currentResourceIDsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  if (self->_clientHasEntitlement)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v6;
    id v7 = a4;
    [(fskitdXPCServer *)self _currentResourceIDsForAuditToken:v10 replyHandler:v7];
  }
  else
  {
    id v8 = a4;
    fs_errorForPOSIXError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v8, 0, v9);
  }
}

- (void)_currentResourceIDsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  id v8 = (void (**)(void))a4;
  [(id)qword_100060740 startedWork];
  BOOL v4 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v4);
  id v5 = [(id)qword_100060740 resourceManager];
  long long v6 = [v5 getResources];

  objc_sync_exit(v4);
  if (v6) {
    [v6 allKeys];
  }
  else {
  id v7 = fs_errorForPOSIXError();
  }
  v8[2]();
}

- (void)currentTasksForAuditToken:(id *)a3 replyHandler:(id)a4
{
  if (self->_clientHasEntitlement)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v6;
    id v7 = a4;
    [(fskitdXPCServer *)self _currentTasksForAuditToken:v10 replyHandler:v7];
  }
  else
  {
    id v8 = a4;
    fs_errorForPOSIXError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v8, 0, v9);
  }
}

- (void)_currentTasksForAuditToken:(id *)a3 replyHandler:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  [(id)qword_100060740 startedWork];
  long long v6 = [(id)qword_100060740 tasks];
  objc_sync_enter(v6);
  id v7 = [(id)qword_100060740 tasks];
  id v8 = [v7 allValues];

  objc_sync_exit(v6);
  if (self->_clientHasEntitlement)
  {
    v5[2](v5, v8, 0);
  }
  else
  {
    ourConn = self->_ourConn;
    if (ourConn) {
      [(NSXPCConnection *)ourConn auditToken];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    [(fskitdXPCServer *)self getInitiatorBundleIDForToken:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _OWORD v12[2] = sub_1000271D4;
    v12[3] = &unk_100059950;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v13;
    id v11 = [v8 fs_filter:v12];
    v5[2](v5, v11, 0);
  }
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  if (self->_clientHasEntitlement)
  {
    long long v12 = *(_OWORD *)&a6->var0[4];
    v16[0] = *(_OWORD *)a6->var0;
    v16[1] = v12;
    id v13 = a7;
    [(fskitdXPCServer *)self _deactivateVolume:a3 usingBundle:a4 numericOptions:a5 auditToken:v16 replyHandler:v13];
  }
  else
  {
    id v14 = a7;
    fs_errorForPOSIXError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a7 + 2))(v14, v15);
  }
}

- (void)_deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  [(id)qword_100060740 startedWork];
  id v15 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  long long v16 = *(_OWORD *)&a6->var0[4];
  long long v26 = *(_OWORD *)a6->var0;
  long long v27 = v16;
  block[2] = sub_100027420;
  block[3] = &unk_1000599C8;
  id v21 = v13;
  id v22 = v12;
  id v23 = self;
  id v24 = v14;
  unint64_t v25 = a5;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  dispatch_async(v15, block);
}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  if (self->_clientHasEntitlement)
  {
    long long v14 = *(_OWORD *)&a6->var0[4];
    v18[0] = *(_OWORD *)a6->var0;
    v18[1] = v14;
    id v15 = a8;
    [(fskitdXPCServer *)self _formatResource:a3 usingBundle:a4 options:a5 auditToken:v18 connection:a7 replyHandler:v15];
  }
  else
  {
    id v16 = a8;
    fs_errorForPOSIXError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a8 + 2))(v16, 0, v17);
  }
}

- (void)_formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  [(id)qword_100060740 startedWork];
  id v19 = dispatch_get_global_queue(0, 0);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100028254;
  v26[3] = &unk_100059928;
  v26[4] = self;
  id v27 = v14;
  long long v20 = *(_OWORD *)&a6->var0[4];
  long long v32 = *(_OWORD *)a6->var0;
  long long v33 = v20;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v18;
  id v25 = v14;
  dispatch_async(v19, v26);
}

- (void)installedExtensionsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  if (self->_clientHasEntitlement)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v6;
    id v7 = a4;
    [(fskitdXPCServer *)self _installedExtensionsForAuditToken:v10 replyHandler:v7];
  }
  else
  {
    id v8 = a4;
    fs_errorForPOSIXError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v8, 0, v9);
  }
}

- (void)_installedExtensionsForAuditToken:(id *)a3 replyHandler:(id)a4
{
  long long v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10001EA90;
  id v28 = sub_10001EAA0;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10001EA90;
  v22[4] = sub_10001EAA0;
  id v23 = 0;
  [(id)qword_100060740 startedWork];
  id v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Getting extensions", buf, 2u);
  }

  id v8 = (void *)qword_100060768;
  long long v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  long long v21 = v9;
  id v10 = +[FSAuditToken tokenWithToken:buf];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100029320;
  v19[3] = &unk_100059338;
  v19[4] = v22;
  v19[5] = &v24;
  [v8 currentExtensionsForToken:v10 replyHandler:v19];

  if (self->_clientHasEntitlement)
  {
    v6[2](v6, v25[5], 0);
  }
  else
  {
    ourConn = self->_ourConn;
    if (ourConn) {
      [(NSXPCConnection *)ourConn auditToken];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    id v12 = [(fskitdXPCServer *)self getInitiatorBundleIDForToken:v18];
    id v13 = (void *)v25[5];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    _OWORD v16[2] = sub_1000293A0;
    v16[3] = &unk_1000599F0;
    id v14 = v12;
    id v17 = v14;
    id v15 = [v13 fs_filter:v16];
    v6[2](v6, (uint64_t)v15, 0);
  }
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(&v24, 8);
}

- (void)setEnabledStateForToken:(id *)a3 identifier:(id)a4 newState:(BOOL)a5 replyHandler:(id)a6
{
  BOOL v6 = a5;
  long long v9 = (void *)qword_100060740;
  id v10 = a6;
  id v11 = a4;
  [v9 startedWork];
  id v12 = (void *)qword_100060768;
  long long v13 = *(_OWORD *)&a3->var0[4];
  v15[0] = *(_OWORD *)a3->var0;
  v15[1] = v13;
  id v14 = +[FSAuditToken tokenWithToken:v15];
  [v12 setEnabledStateForToken:v14 identifier:v11 newState:v6 replyHandler:v10];
}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  if (self->_clientHasEntitlement)
  {
    long long v12 = *(_OWORD *)&a6->var0[4];
    v16[0] = *(_OWORD *)a6->var0;
    v16[1] = v12;
    id v13 = a7;
    [(fskitdXPCServer *)self _loadResource:a3 usingBundle:a4 options:a5 auditToken:v16 replyHandler:v13];
  }
  else
  {
    id v14 = a7;
    fs_errorForPOSIXError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a7 + 2))(v14, 0, v15);
  }
}

- (void)_loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  [(id)qword_100060740 startedWork];
  id v16 = objc_opt_new();
  id v17 = [v16 fs_containerIdentifier];

  id v18 = dispatch_get_global_queue(0, 0);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100029718;
  v25[3] = &unk_100059928;
  long long v19 = *(_OWORD *)&a6->var0[4];
  long long v32 = *(_OWORD *)a6->var0;
  long long v33 = v19;
  id v26 = v13;
  id v27 = v17;
  id v28 = self;
  id v29 = v12;
  id v30 = v14;
  id v31 = v15;
  id v20 = v14;
  id v21 = v12;
  id v22 = v15;
  id v23 = v17;
  id v24 = v13;
  dispatch_async(v18, v25);
}

- (void)probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6
{
  if (self->_clientHasEntitlement)
  {
    long long v10 = *(_OWORD *)&a5->var0[4];
    v14[0] = *(_OWORD *)a5->var0;
    v14[1] = v10;
    id v11 = a6;
    [(fskitdXPCServer *)self _probeResource:a3 usingBundle:a4 auditToken:v14 replyHandler:v11];
  }
  else
  {
    id v12 = a6;
    fs_errorForPOSIXError();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a6 + 2))(v12, 0, v13);
  }
}

- (void)_probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(id)qword_100060740 startedWork];
  id v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [v10 getResourceID];
    *(_DWORD *)buf = 138412290;
    id v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Probe starting on %@", buf, 0xCu);
  }
  id v15 = dispatch_get_global_queue(0, 0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002A684;
  v20[3] = &unk_100059B48;
  void v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  long long v16 = *(_OWORD *)&a5->var0[4];
  long long v24 = *(_OWORD *)a5->var0;
  long long v25 = v16;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  dispatch_async(v15, v20);
}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  if (self->_clientHasEntitlement)
  {
    long long v12 = *(_OWORD *)&a6->var0[4];
    v16[0] = *(_OWORD *)a6->var0;
    v16[1] = v12;
    id v13 = a7;
    [(fskitdXPCServer *)self _unloadResource:a3 usingBundle:a4 options:a5 auditToken:v16 replyHandler:v13];
  }
  else
  {
    id v14 = a7;
    fs_errorForPOSIXError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a7 + 2))(v14, v15);
  }
}

- (void)_unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  [(id)qword_100060740 startedWork];
  long long v16 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  long long v17 = *(_OWORD *)&a6->var0[4];
  long long v28 = *(_OWORD *)a6->var0;
  long long v29 = v17;
  block[2] = sub_10002B314;
  block[3] = &unk_100059888;
  id v23 = v13;
  id v24 = v12;
  id v26 = v14;
  id v27 = v15;
  long long v25 = self;
  id v18 = v14;
  id v19 = v15;
  id v20 = v12;
  id v21 = v13;
  dispatch_async(v16, block);
}

- (NSXPCConnection)ourConn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOurConn:(id)a3
{
}

- (BOOL)hasTaskInterest
{
  return self->_hasTaskInterest;
}

- (void)setHasTaskInterest:(BOOL)a3
{
  self->_BOOL hasTaskInterest = a3;
}

- (BOOL)clientHasEntitlement
{
  return self->_clientHasEntitlement;
}

- (void)setClientHasEntitlement:(BOOL)a3
{
  self->_clientHasEntitlement = a3;
}

- (void).cxx_destruct
{
}

@end