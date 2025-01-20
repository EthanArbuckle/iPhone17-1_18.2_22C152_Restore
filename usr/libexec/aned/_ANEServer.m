@interface _ANEServer
+ (id)createCacheDeleteDictionaryFrom:(id)a3 userInfo:(id)a4;
+ (void)initialize;
- (BOOL)isRootDaemon;
- (NSArray)semaArray;
- (NSUUID)uuidANECompilerServiceLongerDuration;
- (NSUUID)uuidANECompilerServiceRegular;
- (_ANEInMemoryModelCacheManager)modelCacheManager;
- (_ANEModelCacheManager)modelAssetCacheManager;
- (_ANEServer)init;
- (_ANEServer)initWithDataVaultDirectory:(id)a3 dataVaultStorageClass:(id)a4 buildVersion:(id)a5 tempDirectory:(id)a6 cloneDirectory:(id)a7;
- (_ANEXPCServiceHelper)restricted;
- (_ANEXPCServiceHelper)unrestricted;
- (_ANEXPCServiceHelper)unrestrictedUser;
- (id)compileAsNeededAndLoadCachedModel:(id)a3 csIdentity:(id)a4 sandboxExtension:(id)a5 options:(id)a6 qos:(unsigned int)a7 modelFilePath:(id *)a8 modelAttributes:(id *)a9 error:(id *)a10;
- (id)handleCacheDeleteCall:(id)a3 userInfo:(id)a4 urgency:(int)a5;
- (id)initUser;
- (void)_handleIOKitEvent:(id)a3;
- (void)beginRealTimeTaskWithReply:(id)a3;
- (void)compileModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)compiledModelExistsFor:(id)a3 withReply:(id)a4;
- (void)compiledModelExistsMatchingHash:(id)a3 withReply:(id)a4;
- (void)doCompileModel:(id)a3 csIdentity:(id)a4 sandboxExtension:(id)a5 options:(id)a6 qos:(unsigned int)a7 withReply:(id)a8;
- (void)echo:(id)a3 withReply:(id)a4;
- (void)endRealTimeTaskWithReply:(id)a3;
- (void)handleIOKitEvent:(id)a3;
- (void)handleLaunchServicesEvent:(id)a3 userInfo:(id)a4;
- (void)loadModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)prepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 withReply:(id)a7;
- (void)purgeCompiledModel:(id)a3 withReply:(id)a4;
- (void)purgeCompiledModelMatchingHash:(id)a3 withReply:(id)a4;
- (void)reportTelemetryToPPS:(id)a3 playload:(id)a4;
- (void)start;
- (void)startUser;
- (void)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 withReply:(id)a6;
@end

@implementation _ANEServer

+ (void)initialize
{
  qword_100032C00 = +[_ANELog daemon];

  _objc_release_x1();
}

- (_ANEServer)init
{
  v3 = +[_ANEStrings modelDataVaultDirectory];
  v4 = +[_ANEStrings dataVaultStorageClass];
  v5 = +[_ANEDeviceInfo buildVersion];
  v6 = +[_ANEStrings tempDirectory];
  v7 = +[_ANEStrings cloneDirectory];
  v8 = [(_ANEServer *)self initWithDataVaultDirectory:v3 dataVaultStorageClass:v4 buildVersion:v5 tempDirectory:v6 cloneDirectory:v7];

  return v8;
}

- (id)initUser
{
  v3 = +[_ANEStrings userModelDataVaultDirectory];
  v4 = +[_ANEStrings dataVaultStorageClass];
  v5 = +[_ANEDeviceInfo buildVersion];
  v6 = +[_ANEStrings userTempDirectory];
  v7 = +[_ANEStrings userCloneDirectory];
  v8 = [(_ANEServer *)self initWithDataVaultDirectory:v3 dataVaultStorageClass:v4 buildVersion:v5 tempDirectory:v6 cloneDirectory:v7];

  return v8;
}

- (_ANEServer)initWithDataVaultDirectory:(id)a3 dataVaultStorageClass:(id)a4 buildVersion:(id)a5 tempDirectory:(id)a6 cloneDirectory:(id)a7
{
  v12 = (char *)a3;
  id v95 = a4;
  id v94 = a5;
  v96 = (char *)a6;
  v97 = (char *)a7;
  v106.receiver = self;
  v106.super_class = (Class)_ANEServer;
  v13 = [(_ANEServer *)&v106 init];
  v99 = v13;
  if (v13)
  {
    uint64_t v14 = +[NSUUID UUID];
    uuidANECompilerServiceRegular = v13->_uuidANECompilerServiceRegular;
    v13->_uuidANECompilerServiceRegular = (NSUUID *)v14;

    uint64_t v16 = +[NSUUID UUID];
    uuidANECompilerServiceLongerDuration = v13->_uuidANECompilerServiceLongerDuration;
    v13->_uuidANECompilerServiceLongerDuration = (NSUUID *)v16;

    dispatch_semaphore_t v18 = dispatch_semaphore_create(2);
    v108[0] = v18;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(2);
    v108[1] = v19;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(2);
    v108[2] = v20;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(2);
    v108[3] = v21;
    dispatch_semaphore_t v22 = dispatch_semaphore_create(2);
    v108[4] = v22;
    dispatch_semaphore_t v23 = dispatch_semaphore_create(2);
    v108[5] = v23;
    dispatch_semaphore_t v24 = dispatch_semaphore_create(2);
    v108[6] = v24;
    dispatch_semaphore_t v25 = dispatch_semaphore_create(2);
    v108[7] = v25;
    uint64_t v26 = +[NSArray arrayWithObjects:v108 count:8];
    semaArray = v99->_semaArray;
    v99->_semaArray = (NSArray *)v26;

    v28 = qword_100032C00;
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
      __int16 v111 = 2112;
      v112 = v12;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s: dataVaultDirectory=%@", buf, 0x16u);
    }
    v29 = +[NSFileManager defaultManager];
    id v30 = [v95 UTF8String];
    if ([v29 fileExistsAtPath:v12])
    {
      v31 = v12;
      v32 = (const char *)[v31 UTF8String];
      v33 = qword_100032C00;
      if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
        sub_10001C764((uint64_t)v32, v33, v34);
      }
      if (rootless_check_datavault_flag() == 1)
      {
        v35 = qword_100032C00;
        if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "convertToDataVaultAsNeeded";
          __int16 v111 = 2080;
          v112 = v32;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s: cacheDirectory=%s needs conversion to Data Vault", buf, 0x16u);
        }
        if (chmod(v32, 0x1C0u))
        {
          v36 = (id)qword_100032C00;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            int v84 = *__error();
            v85 = __error();
            v86 = strerror(*v85);
            *(_DWORD *)buf = 136316162;
            v110 = "convertToDataVaultAsNeeded";
            __int16 v111 = 2080;
            v112 = v32;
            __int16 v113 = 1024;
            *(_DWORD *)v114 = 448;
            *(_WORD *)&v114[4] = 1024;
            *(_DWORD *)&v114[6] = v84;
            *(_WORD *)&v114[10] = 2080;
            *(void *)&v114[12] = v86;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s: chmod(%s, %o) FAILED : errno=%d (%s)", buf, 0x2Cu);
          }
        }
        if (rootless_convert_to_datavault())
        {
          v37 = (id)qword_100032C00;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            int v90 = *__error();
            v91 = __error();
            v92 = strerror(*v91);
            *(_DWORD *)buf = 136316162;
            v110 = "convertToDataVaultAsNeeded";
            __int16 v111 = 2080;
            v112 = v32;
            __int16 v113 = 2080;
            *(void *)v114 = v30;
            *(_WORD *)&v114[8] = 1024;
            *(_DWORD *)&v114[10] = v90;
            *(_WORD *)&v114[14] = 2080;
            *(void *)&v114[16] = v92;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s: rootless_convert_to_datavault(%s, %s) FAILED : errno=%d (%s)", buf, 0x30u);
          }
        }
      }
    }
    else
    {
      v38 = v12;
      v39 = +[NSFileManager defaultManager];
      v40 = v38;
      v41 = (const char *)[v40 UTF8String];
      v42 = [v40 stringByDeletingLastPathComponent];
      v43 = qword_100032C00;
      if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v110 = "createDataVault";
        __int16 v111 = 2080;
        v112 = v41;
        __int16 v113 = 2112;
        *(void *)v114 = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s: Need to create cacheDirectory=%s as Data Vault. pathToDataVault=%@", buf, 0x20u);
      }
      id v107 = 0;
      unsigned __int8 v44 = [v39 createDirectoryAtPath:v42 withIntermediateDirectories:1 attributes:0 error:&v107];
      id v45 = v107;
      if (v44)
      {
        if (rootless_mkdir_datavault())
        {
          v46 = (id)qword_100032C00;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            int v87 = *__error();
            v88 = __error();
            v89 = strerror(*v88);
            *(_DWORD *)buf = 136316418;
            v110 = "createDataVault";
            __int16 v111 = 2080;
            v112 = v41;
            __int16 v113 = 1024;
            *(_DWORD *)v114 = 448;
            *(_WORD *)&v114[4] = 2080;
            *(void *)&v114[6] = v30;
            *(_WORD *)&v114[14] = 1024;
            *(_DWORD *)&v114[16] = v87;
            *(_WORD *)&v114[20] = 2080;
            *(void *)&v114[22] = v89;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s: rootless_mkdir_datavault(%s, %o, %s) FAILED : errno=%d (%s)", buf, 0x36u);
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR))
      {
        sub_10001C7E8();
      }
    }
    v98 = [v12 stringByAppendingPathComponent:v94];
    v47 = qword_100032C00;
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
      __int16 v111 = 2112;
      v112 = v98;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s: buildSpecificModelStorageDirectory=%@", buf, 0x16u);
    }
    if ([v29 fileExistsAtPath:v98])
    {
      v48 = 0;
    }
    else
    {
      v49 = [v29 enumeratorAtPath:v12];
      v48 = 0;
      *(void *)&long long v50 = 136315650;
      long long v93 = v50;
      while (1)
      {
        v51 = [v49 nextObject:v93];
        if (!v51) {
          break;
        }
        v52 = [v12 stringByAppendingPathComponent:v51];
        LOBYTE(v107) = 0;
        if ([v29 fileExistsAtPath:v52 isDirectory:&v107])
        {
          v53 = +[NSFileManager defaultManager];
          id v105 = v48;
          unsigned int v54 = [v53 removeItemAtPath:v52 error:&v105];
          id v55 = v105;

          v56 = qword_100032C00;
          if (v54)
          {
            if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v93;
              v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
              __int16 v111 = 2112;
              v112 = v52;
              __int16 v113 = 2112;
              *(void *)v114 = v55;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s: Removed %@ : error=%@", buf, 0x20u);
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v93;
            v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
            __int16 v111 = 2112;
            v112 = v52;
            __int16 v113 = 2112;
            *(void *)v114 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s: Failed to remove %@ : error=%@", buf, 0x20u);
          }
        }
        else
        {
          id v55 = v48;
        }

        v48 = v55;
      }
    }
    id v104 = v48;
    unsigned __int8 v57 = [v29 createDirectoryAtPath:v98 withIntermediateDirectories:1 attributes:0 error:&v104];
    id v58 = v104;

    if ((v57 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
      sub_10001C6F0();
    }
    v59 = +[_ANEStrings modelAssetsCacheName];
    v60 = [v98 stringByAppendingPathComponent:v59];

    v61 = qword_100032C00;
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
      __int16 v111 = 2112;
      v112 = v60;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "%s: modelAssetsCacheDirectory=%@", buf, 0x16u);
    }
    id v103 = v58;
    unsigned __int8 v62 = [v29 createDirectoryAtPath:v60 withIntermediateDirectories:1 attributes:0 error:&v103];
    id v63 = v103;

    if ((v62 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
      sub_10001C67C();
    }
    v64 = +[_ANEStrings inMemoryModelCacheName];
    v65 = [v98 stringByAppendingPathComponent:v64];

    v66 = qword_100032C00;
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
      __int16 v111 = 2112;
      v112 = v65;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%s: inMemoryModelCacheDirectory=%@", buf, 0x16u);
    }
    id v102 = v63;
    unsigned __int8 v67 = [v29 createDirectoryAtPath:v65 withIntermediateDirectories:1 attributes:0 error:&v102];
    id v68 = v102;

    v69 = v68;
    if ((v67 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
      sub_10001C608();
    }
    v70 = qword_100032C00;
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
      __int16 v111 = 2112;
      v112 = v96;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s: tempDirectory=%@", buf, 0x16u);
    }
    id v101 = v68;
    unsigned __int8 v71 = [v29 createDirectoryAtPath:v96 withIntermediateDirectories:1 attributes:0 error:&v101];
    id v72 = v101;

    v73 = v72;
    if ((v71 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
      sub_10001C594();
    }
    v74 = qword_100032C00;
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[_ANEServer initWithDataVaultDirectory:dataVaultStorageClass:buildVersion:tempDirectory:cloneDirectory:]";
      __int16 v111 = 2112;
      v112 = v97;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s: cloneDirectory=%@", buf, 0x16u);
    }
    id v100 = v72;
    unsigned __int8 v75 = [v29 createDirectoryAtPath:v97 withIntermediateDirectories:1 attributes:0 error:&v100];
    id v76 = v100;

    if ((v75 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
      sub_10001C520();
    }
    v77 = +[NSURL fileURLWithPath:v60 isDirectory:1];
    v78 = [[_ANEModelCacheManager alloc] initWithURL:v77];
    modelAssetCacheManager = v99->_modelAssetCacheManager;
    v99->_modelAssetCacheManager = v78;

    v80 = +[NSURL fileURLWithPath:v65 isDirectory:1];
    v81 = [[_ANEInMemoryModelCacheManager alloc] initWithURL:v80];
    modelCacheManager = v99->_modelCacheManager;
    v99->_modelCacheManager = v81;
  }
  return v99;
}

- (void)start
{
  v4 = (id)qword_100032C00;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001C904();
  }

  v5 = objc_opt_new();
  v6 = +[_ANEStrings tempDirectory];
  v24[0] = v6;
  v7 = +[_ANEStrings cloneDirectory];
  v24[1] = v7;
  v8 = +[NSArray arrayWithObjects:v24 count:2];

  [v5 scheduleMaintenanceWithName:@"com.apple.aned.temporaryFilesMaintenance" directoryPaths:v8];
  v9 = (id)qword_100032C00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001C8B0();
  }

  v10 = [(_ANEServer *)self modelCacheManager];
  [v10 scheduleMaintenanceWithName:@"com.apple.aned.modelCacheGC" directoryPaths:&__NSArray0__struct];

  v11 = (id)qword_100032C00;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001C85C();
  }

  v12 = [(_ANEServer *)self modelAssetCacheManager];
  [v12 scheduleMaintenanceWithName:@"com.apple.aned.danglingModelsGC" directoryPaths:&__NSArray0__struct];

  v13 = +[_ANEStrings machServiceName];
  uint64_t v14 = _ANEDaemonInterface();
  v15 = +[_ANEXPCServiceHelper serviceWithName:v13 interface:v14 delegate:self requiresEntitlement:0 entitlementString:&stru_10002CA38];
  unrestricted = self->_unrestricted;
  self->_unrestricted = v15;

  v17 = +[_ANEStrings machServiceNamePrivate];
  dispatch_semaphore_t v18 = _ANEDaemonInterfacePrivate();
  dispatch_semaphore_t v19 = +[_ANEStrings restrictedAccessEntitlement];
  dispatch_semaphore_t v20 = +[_ANEXPCServiceHelper serviceWithName:v17 interface:v18 delegate:self requiresEntitlement:1 entitlementString:v19];
  restricted = self->_restricted;
  self->_restricted = v20;

  dispatch_semaphore_t v22 = qword_100032C00;
  if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_semaphore_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Ready to accept restricted and unrestricted XPC connections", v23, 2u);
  }
  self->_isRootDaemon = 1;
}

- (void)startUser
{
  v4 = (id)qword_100032C00;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001CA00();
  }

  v5 = objc_opt_new();
  v6 = +[_ANEStrings userTempDirectory];
  v19[0] = v6;
  v7 = +[_ANEStrings userCloneDirectory];
  v19[1] = v7;
  v8 = +[NSArray arrayWithObjects:v19 count:2];

  [v5 scheduleMaintenanceWithName:@"com.apple.aneuserd.temporaryFilesMaintenance" directoryPaths:v8];
  v9 = (id)qword_100032C00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001C9AC();
  }

  v10 = [(_ANEServer *)self modelCacheManager];
  [v10 scheduleMaintenanceWithName:@"com.apple.aneuserd.modelCacheGC" directoryPaths:&__NSArray0__struct];

  v11 = (id)qword_100032C00;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001C958();
  }

  v12 = [(_ANEServer *)self modelAssetCacheManager];
  [v12 scheduleMaintenanceWithName:@"com.apple.aneuserd.danglingModelsGC" directoryPaths:&__NSArray0__struct];

  v13 = +[_ANEStrings userMachServiceName];
  uint64_t v14 = _ANEDaemonInterface();
  v15 = +[_ANEXPCServiceHelper serviceWithName:v13 interface:v14 delegate:self requiresEntitlement:0 entitlementString:&stru_10002CA38];
  unrestrictedUser = self->_unrestrictedUser;
  self->_unrestrictedUser = v15;

  v17 = qword_100032C00;
  if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_semaphore_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "User daemon is ready to accept unrestrictedUser XPC connections", v18, 2u);
  }
  self->_isRootDaemon = 0;
}

- (void)handleLaunchServicesEvent:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27 = v6;
  if ([v6 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"])
  {
    id v26 = v7;
    v8 = [v7 objectForKeyedSubscript:@"bundleIDs"];
    dispatch_semaphore_t v25 = [v8 copy];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (id)qword_100032C00;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CA9C();
      }
      goto LABEL_26;
    }
    dispatch_semaphore_t v24 = +[LSApplicationWorkspace defaultWorkspace];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v9 = v25;
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v34;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v12);
          uint64_t v14 = (id)qword_100032C00;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v15 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v39 = v15;
            __int16 v40 = 2112;
            uint64_t v41 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v42, 16, v24);
      }
      while (v10);
    }

    id v7 = v26;
  }
  if (objc_msgSend(v6, "isEqualToString:", @"com.apple.LaunchServices.applicationUnregistered", v24))
  {
    id v26 = v7;
    uint64_t v16 = (id)qword_100032C00;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CA54();
    }

    [v7 objectForKeyedSubscript:@"bundleIDs"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v30;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          dispatch_semaphore_t v22 = [(_ANEServer *)self modelAssetCacheManager];
          [v22 removeAllModelsForBundleID:v21];

          dispatch_semaphore_t v23 = [(_ANEServer *)self modelCacheManager];
          [v23 removeAllModelsForBundleID:v21];
        }
        id v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);
    }
    dispatch_semaphore_t v25 = v17;
LABEL_26:

    id v7 = v26;
  }
}

- (void)_handleIOKitEvent:(id)a3
{
  id v3 = a3;
  v4 = +[_ANEStrings launchIOKitEvent];
  if ([v3 isEqualToString:v4])
  {

    goto LABEL_4;
  }
  v5 = +[_ANEStrings launchUserIOKitEvent];
  unsigned int v6 = [v3 isEqualToString:v5];

  if (v6)
  {
LABEL_4:
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
      sub_10001CB70();
    }
    os_unfair_lock_lock_with_options();
    if (!off_100032C18)
    {
      id v7 = (void *)qword_100032C20;
      if (!qword_100032C20)
      {
        id v7 = dlopen("/System/Library/PrivateFrameworks/ANEServices.framework/ANEServices", 4);
        qword_100032C20 = (uint64_t)v7;
        if (!v7)
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_100032C10);
LABEL_12:
          if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
            sub_10001CAEC();
          }
          goto LABEL_16;
        }
      }
      off_100032C18 = dlsym(v7, "H11InitializePlatformServices");
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100032C10);
    if (off_100032C18) {
      ((void (*)(void, void))off_100032C18)(0, 0);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
    sub_10001CBD8();
  }
LABEL_16:
}

- (void)handleIOKitEvent:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000123D0;
  v5[3] = &unk_10002C910;
  v5[4] = self;
  id v6 = a3;
  uint64_t v3 = qword_100032C08;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_100032C08, v5);
  }
}

+ (id)createCacheDeleteDictionaryFrom:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:off_1000329F8];
  if (v7) {
    v8 = (void *)v7;
  }
  else {
    v8 = &__NSDictionary0__struct;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:off_100032A70];
  if (v9) {
    id v10 = (__CFString *)v9;
  }
  else {
    id v10 = &stru_10002CA38;
  }
  CFStringRef v16 = @"COREML_NON_PURGEABLE_BY_APP";
  v17 = v8;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v14[0] = off_100032A70;
  v14[1] = off_100032A78;
  v15[0] = v10;
  v15[1] = &off_10002D838;
  v14[2] = off_100032A80;
  v15[2] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (id)handleCacheDeleteCall:(id)a3 userInfo:(id)a4 urgency:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5 == 4) {
    id v11 = [v9 isEqualToString:off_100032A88];
  }
  else {
    id v11 = 0;
  }
  v12 = (id)qword_100032C00;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    id v23 = v21;
    __int16 v24 = 1024;
    int v25 = a5;
    __int16 v26 = 1024;
    unsigned int v27 = [v9 isEqualToString:off_100032A90];
    __int16 v28 = 1024;
    unsigned int v29 = [v9 isEqualToString:off_100032A88];
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: CacheDelete, urgency: %d and purgeable: %d, purge: %d", buf, 0x1Eu);
  }
  if (([v9 isEqualToString:off_100032A90] & 1) != 0
    || [v9 isEqualToString:off_100032A88])
  {
    uint64_t v13 = [(_ANEServer *)self modelAssetCacheManager];
    uint64_t v14 = [v13 getDiskSpaceItemizedByBundleIDAndPurge:v11];

    v15 = [(_ANEServer *)self modelCacheManager];
    CFStringRef v16 = [v15 getDiskSpaceItemizedByBundleIDAndPurge:v11];

    v17 = +[_ANEStorageHelper mergeModelCacheStorageInformation:v14 with:v16];
    id v18 = [(id)objc_opt_class() createCacheDeleteDictionaryFrom:v17 userInfo:v10];
    uint64_t v19 = (id)qword_100032C00;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC40();
    }

    +[_ANEDataReporter addValue:1 forScalarKey:@"ModelCacheDeleted"];
  }
  else
  {
    id v18 = &__NSDictionary0__struct;
  }

  return v18;
}

- (void)beginRealTimeTaskWithReply:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v6 = +[NSXPCConnection currentConnection];
  if (v6)
  {
    if (+[_ANEXPCServiceHelper allowRestrictedAccessFor:v6])
    {
      int v7 = 1;
      v4[2](v4, 1, 0);
    }
    else
    {
      id v9 = NSStringFromSelector(a2);
      id v10 = +[_ANEErrors entitlementErrorForMethod:v9];
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v10);

      int v7 = 0;
    }
  }
  else
  {
    v8 = (id)qword_100032C00;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    v4[2](v4, 0, 0);
    int v7 = 0;
  }

  if (v7)
  {
    id v11 = (id)qword_100032C00;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = NSStringFromSelector(a2);
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)endRealTimeTaskWithReply:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v6 = +[NSXPCConnection currentConnection];
  if (v6)
  {
    if (+[_ANEXPCServiceHelper allowRestrictedAccessFor:v6])
    {
      int v7 = 1;
      v4[2](v4, 1, 0);
    }
    else
    {
      id v9 = NSStringFromSelector(a2);
      id v10 = +[_ANEErrors entitlementErrorForMethod:v9];
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v10);

      int v7 = 0;
    }
  }
  else
  {
    v8 = (id)qword_100032C00;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    v4[2](v4, 0, 0);
    int v7 = 0;
  }

  if (v7)
  {
    id v11 = (id)qword_100032C00;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = NSStringFromSelector(a2);
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)echo:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void))a4;
  id v9 = +[NSXPCConnection currentConnection];
  if (v9)
  {
    if (+[_ANEXPCServiceHelper allowRestrictedAccessFor:v9])
    {
      int v10 = 1;
      v7[2](v7, 1, 0);
    }
    else
    {
      v12 = NSStringFromSelector(a2);
      int v13 = +[_ANEErrors entitlementErrorForMethod:v12];
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v13);

      int v10 = 0;
    }
  }
  else
  {
    id v11 = (id)qword_100032C00;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    v7[2](v7, 0, 0);
    int v10 = 0;
  }

  if (v10)
  {
    uint64_t v14 = (id)qword_100032C00;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = NSStringFromSelector(a2);
      int v16 = 138412546;
      v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)reportTelemetryToPPS:(id)a3 playload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = +[NSXPCConnection currentConnection];
  if (v9)
  {
    int v10 = [v7 mutableCopy];
    [v9 auditToken];
    uint64_t v11 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", &v14, [v9 processIdentifier]);
    v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    else {
      CFStringRef v13 = &stru_10002CA38;
    }
    [v10 setObject:v13 forKeyedSubscript:@"csIdentity"];
    +[_ANEDataReporter reportTelemetryToPPS:v6 playload:v10];
  }
  else
  {
    int v10 = +[_ANELog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }
  }
}

- (void)compiledModelExistsFor:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, id, id, void))a4;
  [v7 string_id];
  kdebug_trace();
  id v9 = +[NSXPCConnection currentConnection];
  int v10 = v9;
  if (v9)
  {
    [v9 auditToken];
    uint64_t v11 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", v40, [v10 processIdentifier]);
    if (v11)
    {
      v12 = [v7 key];
      unsigned int v13 = [v12 isEqualToString:off_1000327C8];

      if (v13)
      {
        uint64_t v14 = [(_ANEServer *)self modelAssetCacheManager];
        v15 = [v14 cachedModelAllSegmentsPathFor:v7 csIdentity:v11];

        if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
          sub_10001CD68();
        }
        int v16 = [(_ANEServer *)self modelAssetCacheManager];
        id v17 = [v16 scanAllPartitionsForModel:v7 csIdentity:v11 expunge:0];

        __int16 v18 = (id)qword_100032C00;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_10001CD0C();
        }

        id v19 = [v7 getCacheURLIdentifier];
        dispatch_semaphore_t v20 = 0;
        v8[2](v8, v17, v19, 0);
      }
      else
      {
        int v25 = [(_ANEServer *)self modelAssetCacheManager];
        v15 = [v25 cachedModelPathFor:v7 csIdentity:v11];

        if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
          sub_10001CDD0();
        }
        id v39 = &__NSDictionary0__struct;
        uint64_t v26 = +[_ANEStorageHelper memoryMapModelAtPath:v15 modelAttributes:&v39];
        dispatch_semaphore_t v20 = (void *)v26;
        id v19 = v39;
        if (v26)
        {
          unsigned int v27 = [v7 getCacheURLIdentifier];
          BOOL v28 = v27 == 0;

          if (v28)
          {
            uint64_t v41 = 0;
            v42 = &v41;
            uint64_t v43 = 0x3032000000;
            unsigned __int8 v44 = sub_100013818;
            id v45 = sub_100013828;
            id v46 = 0;
            uint64_t v33 = 0;
            long long v34 = &v33;
            uint64_t v35 = 0x3032000000;
            long long v36 = sub_100013818;
            v37 = sub_100013828;
            id v38 = 0;
            unsigned int v29 = [(_ANEServer *)self modelAssetCacheManager];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100013830;
            v32[3] = &unk_10002C938;
            v32[4] = &v41;
            v32[5] = &v33;
            [v29 cacheURLIdentifierForModel:v7 useSourceURL:0 withReply:v32];

            long long v30 = +[NSString stringWithFormat:@"%@_%@", v42[5], v34[5]];
            [v7 setCacheURLIdentifier:v30];

            _Block_object_dispose(&v33, 8);
            _Block_object_dispose(&v41, 8);
          }
        }
        long long v31 = [v7 getCacheURLIdentifier];
        v8[2](v8, (id)(v26 != 0), v31, 0);
      }
      [v7 string_id];
      kdebug_trace();
    }
    else
    {
      dispatch_semaphore_t v22 = (id)qword_100032C00;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CCC8();
      }

      id v23 = NSStringFromSelector(a2);
      __int16 v24 = +[_ANEErrors missingCodeSigningErrorForMethod:v23];
      ((void (**)(id, id, id, void *))v8)[2](v8, 0, 0, v24);

      [v7 string_id];
      kdebug_trace();
    }
  }
  else
  {
    id v21 = (id)qword_100032C00;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    v8[2](v8, 0, 0, 0);
    [v7 string_id];
    kdebug_trace();
  }
}

- (void)purgeCompiledModel:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a4;
  [v7 string_id];
  kdebug_trace();
  id v9 = +[NSXPCConnection currentConnection];
  int v10 = v9;
  if (v9)
  {
    [v9 auditToken];
    uint64_t v11 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", v45, [v10 processIdentifier]);
    if (v11)
    {
      v12 = [v7 modelURL];
      unsigned int v13 = [v12 path];
      unsigned int v14 = +[_ANEModelCacheManager isSystemModelPath:v13];

      if (!v14)
      {
        uint64_t v43 = +[_ANEStrings processModelShareAccessEntitlement];
        unsigned __int8 v44 = [v10 valueForEntitlement:];
        if (v44 && [v44 BOOLValue])
        {
          dispatch_semaphore_t v20 = (id)qword_100032C00;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = NSStringFromSelector(a2);
            unsigned int v22 = [v10 processIdentifier];
            *(_DWORD *)buf = 138412802;
            v47 = v21;
            __int16 v48 = 1024;
            *(_DWORD *)v49 = v22;
            *(_WORD *)&v49[4] = 2112;
            *(void *)&v49[6] = v43;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@: client(%d) : has entitlement(%@)", buf, 0x1Cu);
          }
          id v23 = (id)qword_100032C00;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            sub_10001CF28();
          }

          __int16 v24 = NSStringFromSelector(a2);
          int v25 = +[_ANEErrors systemModelPurgeNotAllowedForMethod:v24];
          v8[2](v8, 0, v25);

          [v7 string_id];
          kdebug_trace();
        }
        else
        {
          uint64_t v26 = [v7 key];
          unsigned int v27 = [v26 isEqualToString:off_1000327C8];

          BOOL v28 = [(_ANEServer *)self modelAssetCacheManager];
          if (v27) {
            [v28 cachedModelAllSegmentsPathFor:v7 csIdentity:v11];
          }
          else {
          v42 = [v28 cachedModelPathFor:v7 csIdentity:v11];
          }

          if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
            sub_10001CEC0();
          }
          unsigned int v41 = +[_ANEStorageHelper removeDirectoryAtPath:v42];
          unsigned int v29 = [(_ANEServer *)self modelAssetCacheManager];
          if (v27) {
            [v29 URLForModel:v7 bundleID:v11 forAllSegments:1];
          }
          else {
          long long v30 = [v29 URLForModel:v7 bundleID:v11];
          }
          long long v31 = [v30 path];

          long long v32 = [v31 stringByAppendingPathComponent:@"shapes/"];
          +[_ANEStorageHelper removeShapesDirectoryAtPath:v32];

          uint64_t v33 = +[_ANEStrings modelPurgeInAllPartitionsEntitlement];

          uint64_t v43 = (void *)v33;
          long long v34 = [v10 valueForEntitlement:v33];

          unsigned __int8 v44 = v34;
          if (v34 && [v34 BOOLValue])
          {
            uint64_t v35 = (id)qword_100032C00;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              id v39 = NSStringFromSelector(a2);
              unsigned int v40 = [v34 BOOLValue];
              *(_DWORD *)buf = 138413058;
              v47 = v39;
              __int16 v48 = 2112;
              *(void *)v49 = v7;
              *(_WORD *)&v49[8] = 2112;
              *(void *)&v49[10] = v43;
              __int16 v50 = 1024;
              unsigned int v51 = v40;
              _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%@: Expunge %@ from ALL partitions. [%@ = %d]", buf, 0x26u);
            }
            long long v36 = [(_ANEServer *)self modelAssetCacheManager];
            unsigned __int8 v37 = [v36 scanAllPartitionsForModel:v7 csIdentity:v11 expunge:1];

            if ((v37 & 1) == 0)
            {
              id v38 = (id)qword_100032C00;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                objc_claimAutoreleasedReturnValue();
                sub_10001CE7C();
              }
            }
          }
          v8[2](v8, v41, 0);
          [v7 string_id];
          kdebug_trace();
        }
        goto LABEL_39;
      }
      v15 = (id)qword_100032C00;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CE38();
      }

      int v16 = NSStringFromSelector(a2);
      id v17 = +[_ANEErrors systemModelPurgeNotAllowedForMethod:v16];
      v8[2](v8, 0, v17);
    }
    else
    {
      id v19 = (id)qword_100032C00;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CCC8();
      }

      int v16 = NSStringFromSelector(a2);
      id v17 = +[_ANEErrors missingCodeSigningErrorForMethod:v16];
      v8[2](v8, 0, v17);
    }

    [v7 string_id];
    kdebug_trace();
LABEL_39:

    goto LABEL_40;
  }
  __int16 v18 = (id)qword_100032C00;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001CC84();
  }

  v8[2](v8, 0, 0);
  [v7 string_id];
  kdebug_trace();
LABEL_40:
}

- (void)compileModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v31 = a4;
  id v32 = a5;
  id v14 = a7;
  [v13 string_id];
  kdebug_trace();
  v15 = +[NSXPCConnection currentConnection];
  int v16 = v15;
  if (v15)
  {
    [v15 auditToken];
    id v17 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", v33, [v16 processIdentifier]);
    if (v17)
    {
      __int16 v18 = [v13 key];
      unsigned int v19 = [v18 isEqualToString:off_1000327C8];

      dispatch_semaphore_t v20 = (id)qword_100032C00;
      id v21 = v20;
      if (!v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          uint64_t v35 = v26;
          __int16 v36 = 2112;
          id v37 = v17;
          __int16 v38 = 2112;
          id v39 = v13;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "START: %@: %@ : %@", buf, 0x20u);
        }
        [(_ANEServer *)self doCompileModel:v13 csIdentity:v17 sandboxExtension:v31 options:v32 qos:v8 withReply:v14];
        unsigned int v27 = [v32 objectForKeyedSubscript:off_1000327B0];
        BOOL v28 = v27;
        if (v27) {
          [v13 setPerfStatsMask:+[_ANEPerformanceStats driverMaskForANEFMask:](_ANEPerformanceStats, "driverMaskForANEFMask:", objc_msgSend(v27, "unsignedIntValue"))];
        }
        unsigned int v29 = (id)qword_100032C00;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          long long v30 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v35 = v30;
          __int16 v36 = 2112;
          id v37 = v13;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "END: %@: %@", buf, 0x16u);
        }
        [v13 string_id];
        kdebug_trace();

        goto LABEL_21;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        [v13 key];
        objc_claimAutoreleasedReturnValue();
        sub_10001CF6C();
      }

      unsigned int v22 = NSStringFromSelector(a2);
      id v23 = +[_ANEErrors invalidModelKeyErrorForMethod:v22];
      (*((void (**)(id, void, void *, void, void *))v14 + 2))(v14, 0, &__NSDictionary0__struct, 0, v23);
    }
    else
    {
      int v25 = (id)qword_100032C00;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CCC8();
      }

      unsigned int v22 = NSStringFromSelector(a2);
      id v23 = +[_ANEErrors missingCodeSigningErrorForMethod:v22];
      (*((void (**)(id, void, void *, void, void *))v14 + 2))(v14, 0, &__NSDictionary0__struct, 0, v23);
    }

    [v13 string_id];
    kdebug_trace();
LABEL_21:

    goto LABEL_22;
  }
  __int16 v24 = (id)qword_100032C00;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001CC84();
  }

  (*((void (**)(id, void, void *, void, void))v14 + 2))(v14, 0, &__NSDictionary0__struct, 0, 0);
  [v13 string_id];
  kdebug_trace();
LABEL_22:
}

- (void)loadModel:(id)a3 sandboxExtension:(id)a4 options:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v167 = a4;
  id v168 = a5;
  id v13 = a7;
  [v12 string_id];
  kdebug_trace();
  v166 = (void *)os_transaction_create();
  id v14 = +[NSXPCConnection currentConnection];
  if (!v14)
  {
    dispatch_semaphore_t v20 = (id)qword_100032C00;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    if (v13) {
      (*((void (**)(id, void, void *, void, void, void, void, void))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, 0);
    }
    goto LABEL_11;
  }
  v15 = [v12 key];
  unsigned int v16 = [v15 isEqualToString:off_1000327C8];

  if (!v16)
  {
    id v21 = [v12 modelURL];
    unsigned int v22 = [v21 pathComponents];

    v164 = v22;
    if ([v22 count])
    {
      if ([v22 count] == (id)1)
      {
        id v23 = [v12 modelURL];
        v159 = [v23 path];
      }
      else
      {
        id v23 = [v22 objectAtIndexedSubscript:[v22 count] - 2];
        int v25 = [v22 objectAtIndexedSubscript:((char *)[v22 count] - 1)];
        v159 = [v23 stringByAppendingPathComponent:v25];
      }
    }
    else
    {
      __int16 v24 = (id)qword_100032C00;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10001D340();
      }

      v159 = @"Unknown";
    }
    id v26 = [v14 processIdentifier];
    [v14 auditToken];
    v160 = +[_ANEModelToken tokenWithAuditToken:v176 modelIdentifier:v159 processIdentifier:v26];
    unsigned int v27 = [v160 teamIdentity];
    BOOL v28 = v27 == 0;

    if (v28)
    {
      unsigned int v29 = (id)qword_100032C00;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v187 = v30;
        __int16 v188 = 1024;
        *(_DWORD *)v189 = v26;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@: client(%d) : missing teamIdentifier", buf, 0x12u);
      }
    }
    v161 = [v160 csIdentity];
    if (v161)
    {
      if (+[_ANEQoSMapper aneRealTimeTaskQoS] != v8
        || +[_ANEXPCServiceHelper allowRestrictedAccessFor:v14])
      {
        id v31 = [v168 objectForKeyedSubscript:off_1000326D0];
        unsigned int v151 = [v31 isEqualToString:off_1000326E8];

        v147 = [v168 objectForKeyedSubscript:off_100032730];
        id v142 = [v147 unsignedIntegerValue];
        id v32 = [v168 objectForKeyedSubscript:off_100032A68];
        unsigned int v150 = [v32 BOOLValue];

        uint64_t v33 = [v12 modelURL];
        long long v34 = [v33 path];
        v149 = +[_ANEDataReporter reportClient:v161 modelName:v34];

        uint64_t v35 = (id)qword_100032C00;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          unsigned int v37 = [v12 perfStatsMask];
          *(_DWORD *)buf = 138413826;
          id v187 = v36;
          __int16 v188 = 2112;
          *(void *)v189 = v161;
          *(_WORD *)&v189[8] = 2112;
          id v190 = v12;
          __int16 v191 = 1024;
          *(_DWORD *)v192 = v151;
          *(_WORD *)&v192[4] = 1024;
          *(_DWORD *)&v192[6] = v150;
          *(_WORD *)&v192[10] = 2112;
          *(void *)&v192[12] = v149;
          *(_WORD *)&v192[20] = 1024;
          *(_DWORD *)&v192[22] = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "START: %@: csIdentity=%@ : model=%@ : isPreCompiledModel=%d : existsInCache=%d : coreAnalyticsClientType=%@ StatsMask=%d", buf, 0x3Cu);
        }
        __int16 v38 = [v168 objectForKeyedSubscript:off_100032740];
        id v139 = [v38 unsignedLongLongValue];

        id v153 = [&__NSDictionary0__struct mutableCopy];
        if (v150)
        {
          id v39 = [v168 objectForKeyedSubscript:off_100032A60];
          BOOL v40 = v39 == 0;

          if (v40
            || (id v41 = objc_alloc((Class)NSString),
                [v168 objectForKeyedSubscript:off_100032A60],
                v42 = objc_claimAutoreleasedReturnValue(),
                uint64_t v43 = [v41 initWithString:v42],
                v42,
                !v43))
          {
            uint64_t v43 = (id)qword_100032C00;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              sub_10001D008();
              id v157 = 0;
LABEL_134:

              goto LABEL_135;
            }
LABEL_87:
            id v157 = 0;
            goto LABEL_134;
          }
          if ([v161 containsString:@"../"])
          {
            unsigned __int8 v44 = (id)qword_100032C00;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              sub_10001D04C();
            }
LABEL_86:

            goto LABEL_87;
          }
          if ([v43 containsString:@".."])
          {
            unsigned __int8 v44 = (id)qword_100032C00;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              sub_10001D090();
            }
            goto LABEL_86;
          }
          v86 = [(_ANEServer *)self modelCacheManager];
          uint64_t v146 = [v86 cachedModelPathMatchingHash:v43 csIdentity:v161];

          int v87 = (id)qword_100032C00;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            v88 = NSStringFromSelector(a2);
            sub_10001D2CC(v88);
          }

          __int16 v48 = (void *)v146;
          if ((v151 & 1) == 0) {
            goto LABEL_48;
          }
        }
        else
        {
          if (!v151)
          {
            id v172 = v153;
            id v173 = 0;
            id v171 = 0;
            v148 = [(_ANEServer *)self compileAsNeededAndLoadCachedModel:v12 csIdentity:v161 sandboxExtension:v167 options:v168 qos:v8 modelFilePath:&v173 modelAttributes:&v172 error:&v171];
            id v145 = v173;
            id v141 = v172;

            id v157 = v171;
            goto LABEL_67;
          }
          __int16 v48 = 0;
        }
        v49 = [v12 modelURL];
        uint64_t v144 = [v49 path];

        __int16 v50 = (id)qword_100032C00;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          id v115 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          id v187 = v115;
          __int16 v188 = 2112;
          *(void *)v189 = v144;
          *(_WORD *)&v189[8] = 1024;
          LODWORD(v190) = v150;
          _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%@: Loading pre-compiled model modelFilePath=%@ : existsInCache=%d", buf, 0x1Cu);
        }
        unsigned int v51 = [v12 modelURL];
        v52 = [v51 path];
        v155 = +[_ANEHashEncoding hexStringForString:v52];

        v53 = [v12 key];
        unsigned int v54 = +[_ANEHashEncoding hexStringForString:v53];

        id v55 = +[NSString stringWithFormat:@"%@_%@", v155, v54];
        v56 = (id)qword_100032C00;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          unsigned __int8 v57 = NSStringFromSelector(a2);
          sub_10001D278(v57);
        }

        [v12 setCacheURLIdentifier:v55];
        __int16 v48 = (void *)v144;
LABEL_48:
        id v175 = 0;
        id v145 = v48;
        id v58 = +[_ANESandboxingHelper consumeSandboxExtension:v167 forModel:v12 error:&v175];
        id v156 = v175;
        id v174 = v153;
        v148 = +[_ANEStorageHelper memoryMapModelAtPath:v48 isPrecompiled:v151 modelAttributes:&v174];
        id v141 = v174;

        if (v156)
        {
          v59 = (id)qword_100032C00;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            v60 = NSStringFromSelector(a2);
            sub_10001D224(v60);
          }
        }
        if (!v148)
        {
          v61 = (id)qword_100032C00;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            id v62 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            id v187 = v62;
            __int16 v188 = 2112;
            *(void *)v189 = v48;
            *(_WORD *)&v189[8] = 1024;
            LODWORD(v190) = v150;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "%@: No model at modelFilePath=%@ : existsInCache=%d", buf, 0x1Cu);
          }
        }
        if ((+[_ANESandboxingHelper releaseSandboxExtension:v167 handle:v58] & 1) == 0)
        {
          id v63 = (id)qword_100032C00;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            id v117 = (id)objc_claimAutoreleasedReturnValue();
            int v118 = *__error();
            *(_DWORD *)buf = 138413058;
            id v187 = v117;
            __int16 v188 = 2112;
            *(void *)v189 = v167;
            *(_WORD *)&v189[8] = 2048;
            id v190 = v58;
            __int16 v191 = 1024;
            *(_DWORD *)v192 = v118;
            _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%@: releaseSandboxExtension:(%@) handle:(%lld) failed (%d)", buf, 0x26u);
          }
        }
        id v157 = 0;
LABEL_67:
        v66 = [v168 objectForKeyedSubscript:off_1000327B0];
        v154 = v66;
        if (v66) {
          [v12 setPerfStatsMask:+[_ANEPerformanceStats driverMaskForANEFMask:](_ANEPerformanceStats, "driverMaskForANEFMask:", [v66 unsignedIntValue])];
        }
        unsigned __int8 v67 = (id)qword_100032C00;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          id v68 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v187 = v68;
          __int16 v188 = 2112;
          *(void *)v189 = v154;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%@: ANEF Perf Stats mask: %@", buf, 0x16u);
        }
        if (v148)
        {
          id v138 = [v148 length];
          id v69 = +[_ANEQoSMapper queueIndexForQoS:v8];
          v70 = [(_ANEServer *)self semaArray];
          dispatch_semaphore_t dsemaa = [v70 objectAtIndexedSubscript:v69];

          dispatch_time_t v71 = dispatch_time(0, 30000000000);
          if (dispatch_semaphore_wait(dsemaa, v71))
          {
            if (v13)
            {
              id v72 = [v12 getCacheURLIdentifier];
              v73 = NSStringFromSelector(a2);
              v74 = +[_ANEErrors timeoutErrorForMethod:v73];
              (*((void (**)(id, void, void *, void, void, void, void *, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, v72, v74);
            }
            [v12 string_id];
            kdebug_trace();
LABEL_133:

            id v153 = v141;
            uint64_t v43 = v148;
            goto LABEL_134;
          }
          v79 = (id)qword_100032C00;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            v80 = NSStringFromSelector(a2);
            sub_10001D1D0(v80);
          }

          v134 = +[_ANEProgramCache programForConnection:v14 model:v12 bundleID:v161];
          [v134 setIntermediateBufferHandle:v142];
          [v134 setIsNewInstance:0];
          if (+[_ANEDeviceInfo isExcessivePowerDrainWhenIdle])unsigned int v137 = 1; {
          else
          }
            unsigned int v137 = +[_ANEXPCServiceHelper allowAggressivePowerSavingFor:v14];
          v126 = [v168 objectForKeyedSubscript:off_100032710];
          if (v126)
          {
            v81 = (id)qword_100032C00;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v119 = (id)objc_claimAutoreleasedReturnValue();
              unsigned int v120 = [v126 BOOLValue];
              *(_DWORD *)buf = 138412802;
              id v187 = v119;
              __int16 v188 = 1024;
              *(_DWORD *)v189 = v137;
              *(_WORD *)&v189[4] = 1024;
              *(_DWORD *)&v189[6] = v120;
              _os_log_debug_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "%@: enableAggressivePowerSaving=%d :  powerSavingsRequested=%d", buf, 0x18u);
            }
            unsigned int v137 = [v126 BOOLValue];
          }
          v133 = [v168 objectForKeyedSubscript:off_100032748];
          if (v133)
          {
            v82 = (id)qword_100032C00;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              v83 = NSStringFromSelector(a2);
              sub_10001D17C(v83);
            }
          }
          v128 = [v168 objectForKeyedSubscript:off_100032718];
          if (v128)
          {
            int v84 = (id)qword_100032C00;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v85 = (id)objc_claimAutoreleasedReturnValue();
              [v128 BOOLValue];
              sub_10001D128();
            }

            unsigned __int8 v136 = [v128 BOOLValue];
          }
          else
          {
            unsigned __int8 v136 = 0;
          }
          v127 = [v168 objectForKeyedSubscript:off_100032728];
          if (v127)
          {
            v89 = (id)qword_100032C00;
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v90 = (id)objc_claimAutoreleasedReturnValue();
              [v127 BOOLValue];
              sub_10001D0D4();
            }

            unsigned __int8 v129 = [v127 BOOLValue];
          }
          else
          {
            unsigned __int8 v129 = 0;
          }
          v91 = [v168 objectForKeyedSubscript:off_100032750];
          BOOL v92 = v91 == 0;

          if (v92)
          {
            v132 = 0;
          }
          else
          {
            v132 = [v168 objectForKeyedSubscript:off_100032750];
          }
          v131 = +[NSDate date];
          unsigned int v93 = [v12 perfStatsMask];
          unsigned int v94 = [v14 processIdentifier];
          id v95 = [v12 getCacheURLIdentifier];
          id v170 = v157;
          LODWORD(v123) = v94;
          LOBYTE(v122) = v136;
          HIDWORD(v121) = v93;
          LOBYTE(v121) = v129;
          unsigned int v130 = [v134 createProgramInstanceForModel:v148 modelToken:v160 modelFilePath:v145 qos:v8 isPreCompiled:v151 enablePowerSaving:v137 skipPreparePhase:v139 statsMask:v121 memoryPoolID:v122 enableLateLatch:v123 modelIdentityStr:v133 owningPid:v95 cacheUrlIdentifier:v132 aotCacheUrlIdentifier:v170 error:&v170];
          id v125 = v170;

          v96 = +[NSDate date];
          [v96 timeIntervalSinceDate:v131];
          double v98 = v97;
          if (v130)
          {
            id v77 = [v134 programHandle];
            id v142 = [v134 intermediateBufferHandle];
            unsigned int v124 = [v134 queueDepth];
            [v134 numInputs];
            [v134 numOutputs];
            id v140 = [v134 wiredMemory];
            v99 = [v134 createSymbolMapping];
            [v141 setObject:v99 forKeyedSubscript:off_100032758];
            id v100 = (id)qword_100032C00;
            if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
            {
              v158 = [v12 modelURL];
              id v101 = [v158 path];
              *(_DWORD *)buf = 134219010;
              id v187 = v138;
              __int16 v188 = 2048;
              *(void *)v189 = v140;
              *(_WORD *)&v189[8] = 2112;
              id v190 = v161;
              __int16 v191 = 2112;
              *(void *)v192 = v101;
              *(_WORD *)&v192[8] = 2112;
              *(void *)&v192[10] = v99;
              _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "[ANE Model Stats] : modelSize=%lu : wiredMemory=%ld : csIdentity=%@ : model=%@ : symbolMappings=%@", buf, 0x34u);
            }
          }
          else
          {
            id v77 = 0;
            unsigned int v124 = 0;
            id v140 = 0;
          }
          dispatch_semaphore_signal(dsemaa);

          double v78 = v98 * 1000.0;
          if (v130)
          {
            +[_ANEDataReporter addValue:1 forScalarKey:@"ANEModelLoaded"];
            unsigned int v76 = v124;
            if (v13)
            {
              id v102 = [v12 getCacheURLIdentifier];
              (*((void (**)(id, uint64_t, id, id, id, void, void *, void))v13 + 2))(v13, 1, v141, v77, v142, v124, v102, 0);

              uint64_t v103 = 1;
              id v157 = v125;
              unsigned int v76 = v124;
            }
            else
            {
              uint64_t v103 = 1;
              id v157 = v125;
            }
LABEL_127:
            id v104 = (id)qword_100032C00;
            if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              id v105 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138414082;
              id v187 = v105;
              __int16 v188 = 2112;
              *(void *)v189 = v161;
              *(_WORD *)&v189[8] = 2112;
              id v190 = v12;
              __int16 v191 = 1024;
              *(_DWORD *)v192 = v151;
              *(_WORD *)&v192[4] = 2048;
              *(void *)&v192[6] = v77;
              *(_WORD *)&v192[14] = 2048;
              *(void *)&v192[16] = v142;
              *(_WORD *)&v192[24] = 2048;
              id v193 = v140;
              __int16 v194 = 1024;
              unsigned int v195 = v76;
              _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "END: %@: csIdentity=%@ : model=%@ : isPreCompiledModel=%d : programHandle=%llu : intermediateBufferHandle=%llu :wiredMemory=%ld : queueDepth=%d", buf, 0x4Au);
            }
            objc_super v106 = [v12 modelURL];
            if (v106) {
              [v12 modelURL];
            }
            else {
            id v107 = [v12 sourceURL];
            }
            v169 = &stru_10002CA38;
            id v108 = +[_ANEStrings trimmedModelPath:v107 trimmedPath:&v169];
            dispatch_semaphore_t dsemaa = v169;

            v177[0] = @"csIdentity";
            v177[1] = @"modelURL";
            v178[0] = v161;
            v178[1] = dsemaa;
            v177[2] = @"privacy_score";
            uint64_t v179 = +[NSNumber numberWithBool:v108];
            v177[3] = @"programHandle";
            v143 = (void *)v179;
            +[NSNumber numberWithUnsignedLongLong:v77];
            v135 = uint64_t v109 = v103;
            v180 = v135;
            v177[4] = @"isPrecompiled";
            v152 = +[NSNumber numberWithBool:v151];
            v181 = v152;
            v177[5] = @"cacheHit";
            v110 = +[NSNumber numberWithBool:v150];
            v182 = v110;
            v177[6] = @"modelLoadingTime";
            __int16 v111 = +[NSNumber numberWithDouble:v78];
            v183 = v111;
            v177[7] = @"modelSize";
            v112 = +[NSNumber numberWithUnsignedLong:v138];
            v184 = v112;
            v177[8] = @"modelLoaded";
            __int16 v113 = +[NSNumber numberWithBool:v109];
            v185 = v113;
            v114 = +[NSDictionary dictionaryWithObjects:v178 forKeys:v177 count:9];
            +[_ANEDataReporter reportTelemetryToPPS:@"modelLoad" playload:v114];

            [v12 string_id];
            kdebug_trace();
            [v12 string_id];
            [v148 length];
            kdebug_trace();
            goto LABEL_133;
          }
          id v157 = v125;
          unsigned int v76 = v124;
        }
        else
        {
          unsigned __int8 v75 = (id)qword_100032C00;
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            v116 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413314;
            id v187 = v116;
            __int16 v188 = 2112;
            *(void *)v189 = v12;
            *(_WORD *)&v189[8] = 2112;
            id v190 = v161;
            __int16 v191 = 1024;
            *(_DWORD *)v192 = v151;
            *(_WORD *)&v192[4] = 2112;
            *(void *)&v192[6] = v157;
            _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%@: Model load failed. model=%@ : csIdentity=%@ : isPreCompiledModel=%d : lErr=%@", buf, 0x30u);
          }
          id v138 = 0;
          id v140 = 0;
          unsigned int v76 = 0;
          id v77 = 0;
          double v78 = 0.0;
        }
        +[_ANEDataReporter addValue:1 forScalarKey:@"ModelFailsToLoad"];
        if (v13) {
          (*((void (**)(id, void, id, void, void, void, void, id))v13 + 2))(v13, 0, v141, 0, 0, 0, 0, v157);
        }
        uint64_t v103 = 0;
        goto LABEL_127;
      }
      if (v13)
      {
        v64 = NSStringFromSelector(a2);
        v65 = +[_ANEErrors entitlementErrorForMethod:v64];
        (*((void (**)(id, void, void *, void, void, void, void, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, v65);
      }
    }
    else
    {
      id v45 = (id)qword_100032C00;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CFB4();
      }

      if (v13)
      {
        id v46 = NSStringFromSelector(a2);
        v47 = +[_ANEErrors missingCodeSigningErrorForMethod:v46];
        (*((void (**)(id, void, void *, void, void, void, void, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, v47);
      }
    }
    [v12 string_id];
    kdebug_trace();
LABEL_135:

    goto LABEL_136;
  }
  id v17 = (id)qword_100032C00;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    [v12 key];
    objc_claimAutoreleasedReturnValue();
    sub_10001CF6C();
  }

  if (v13)
  {
    __int16 v18 = NSStringFromSelector(a2);
    unsigned int v19 = +[_ANEErrors invalidModelKeyErrorForMethod:v18];
    (*((void (**)(id, void, void *, void, void, void, void, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, v19);
  }
LABEL_11:
  [v12 string_id];
  kdebug_trace();
LABEL_136:
}

- (void)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  v80 = a4;
  id v78 = a5;
  id v13 = a7;
  [v12 string_id];
  kdebug_trace();
  id v77 = (void *)os_transaction_create();
  id v14 = (id)qword_100032C00;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v88 = v15;
    __int16 v89 = 2112;
    uint64_t v90 = (uint64_t)v12;
    __int16 v91 = 2112;
    BOOL v92 = v80;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: model:%@ options:%@", buf, 0x20u);
  }
  unsigned int v16 = +[NSXPCConnection currentConnection];
  if (v16)
  {
    unsigned int v17 = +[_ANEDeviceInfo isInternalBuild];
    __int16 v18 = &ANECCreateModelDictionary_ptr;
    if (v17
      && (+[_ANEStrings adapterWeightsAccessEntitlementBypassBootArg](_ANEStrings, "adapterWeightsAccessEntitlementBypassBootArg"), v19 = objc_claimAutoreleasedReturnValue(), v20 = +[_ANEDeviceInfo isBoolBootArgSetTrue:v19], v19, __int16 v18 = &ANECCreateModelDictionary_ptr, v20))
    {
      v79 = (id)qword_100032C00;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        +[_ANEStrings adapterWeightsAccessEntitlementBypassBootArg];
        objc_claimAutoreleasedReturnValue();
        sub_10001D49C();
      }
    }
    else
    {
      v79 = [v18[161] adapterWeightsAccessEntitlement];
      unsigned __int8 v75 = [v16 valueForEntitlement:];
      if (!v75 || ([v75 BOOLValue] & 1) == 0)
      {
        id v32 = (id)qword_100032C00;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          unsigned int v62 = [v75 BOOLValue];
          *(_DWORD *)buf = 136315906;
          v88 = "-[_ANEServer loadModelNewInstance:options:modelInstParams:qos:withReply:]";
          __int16 v89 = 2112;
          uint64_t v90 = (uint64_t)v12;
          __int16 v91 = 2112;
          BOOL v92 = v79;
          __int16 v93 = 1024;
          LODWORD(v94) = v62;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s: %@ : No entitlement! [%@ = %d]", buf, 0x26u);
        }

        if (v13)
        {
          uint64_t v33 = NSStringFromSelector(a2);
          long long v34 = +[_ANEErrors programLoadNewInstanceErrorForMethod:v33];
          (*((void (**)(id, void, void *, void, void, void, void, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, v34);
        }
        [v12 string_id];
        kdebug_trace();
        goto LABEL_59;
      }
    }
    v79 = [v80 objectForKeyedSubscript:off_100032800];
    if (!v79)
    {
      uint64_t v35 = (id)qword_100032C00;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001D3A8();
      }

      if (v13)
      {
        id v36 = NSStringFromSelector(a2);
        unsigned int v37 = +[_ANEErrors baseModelIdentifierNotFoundForNewInstanceMethod:v36];
        (*((void (**)(id, void, void *, void, void, void, void, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, v37);
      }
      __int16 v38 = 0;
      [v12 string_id];
      kdebug_trace();
      goto LABEL_60;
    }
    id v21 = [v16 processIdentifier];
    [v16 auditToken];
    unsigned __int8 v75 = +[_ANEModelToken tokenWithAuditToken:v84 modelIdentifier:v79 processIdentifier:v21];
    unsigned int v22 = [v75 teamIdentity];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      __int16 v24 = (id)qword_100032C00;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        int v25 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v88 = v25;
        __int16 v89 = 1024;
        LODWORD(v90) = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@: client(%d) : missing teamIdentifier", buf, 0x12u);
      }
    }
    uint64_t v73 = [v75 csIdentity];
    if (v73)
    {
      id v70 = [&__NSDictionary0__struct mutableCopy];
      id v26 = [v80 objectForKeyedSubscript:off_100032730];
      v65 = v26;
      if (v26)
      {
        id v27 = [v26 unsignedLongLongValue];
        BOOL v28 = (id)qword_100032C00;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_10001D444();
        }
      }
      else
      {
        id v27 = 0;
      }
      uint64_t v43 = (id)qword_100032C00;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001D3FC();
      }

      v74 = +[_ANEProgramCache programForConnection:v16 model:v12 bundleID:v73];
      [v74 setIntermediateBufferHandle:v27];
      [v74 setIsNewInstance:1];
      unsigned int v83 = 0;
      id v68 = +[NSDate date];
      id v82 = 0;
      unsigned int v44 = [v74 createProgramInstanceWithWeights:v78 modelToken:v75 qos:v8 baseModelIdentifier:v79 owningPid:v21 numWeightFiles:&v83 error:&v82];
      id v67 = v82;
      v64 = +[NSDate date];
      [v64 timeIntervalSinceDate:v68];
      double v46 = v45;
      unsigned int v66 = v44;
      if (v44)
      {
        id v69 = [v74 programHandle];
        id v47 = [v74 intermediateBufferHandle];
        unsigned int v71 = [v74 queueDepth];
        [v74 numInputs];
        [v74 numOutputs];
        __int16 v48 = (const char *)[v74 wiredMemory];
        v49 = [v74 createSymbolMapping];
        [v70 setObject:v49 forKeyedSubscript:off_100032758];
        __int16 v50 = qword_100032C00;
        if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134219010;
          v88 = v48;
          __int16 v89 = 2112;
          uint64_t v90 = v73;
          __int16 v91 = 2112;
          BOOL v92 = v12;
          __int16 v93 = 2112;
          id v94 = v49;
          __int16 v95 = 2048;
          id v96 = v69;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[ANE Model Stats] : wiredMemory=%ld : csIdentity=%@ : model=%@ : symbolMappings=%@ :programHandle = %llu", buf, 0x34u);
        }

        id v27 = v47;
        +[_ANEDataReporter addValue:1 forScalarKey:@"ANEModelNewInstanceLoaded"];
        if (v13)
        {
          unsigned int v51 = [v12 getCacheURLIdentifier];
          (*((void (**)(id, uint64_t, id, id, id, void, void *, void))v13 + 2))(v13, 1, v70, v69, v47, v71, v51, 0);
        }
      }
      else
      {
        +[_ANEDataReporter addValue:1 forScalarKey:@"ModelNewInstanceFailsToLoad"];
        if (v13) {
          (*((void (**)(id, void, id, void, void, void, void, id))v13 + 2))(v13, 0, v70, 0, 0, 0, 0, v67);
        }
        __int16 v48 = 0;
        unsigned int v71 = 0;
        id v69 = 0;
      }
      v52 = (id)qword_100032C00;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v53 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        v88 = v53;
        __int16 v89 = 2112;
        uint64_t v90 = v73;
        __int16 v91 = 2112;
        BOOL v92 = v12;
        __int16 v93 = 2048;
        id v94 = v69;
        __int16 v95 = 2048;
        id v96 = v27;
        __int16 v97 = 2048;
        double v98 = v48;
        __int16 v99 = 1024;
        unsigned int v100 = v71;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "END: %@: csIdentity=%@ : model=%@ : programHandle=%llu : intermediateBufferHandle=%llu :wiredMemory=%ld : queueDepth=%d", buf, 0x44u);
      }
      unsigned int v54 = [v12 modelURL];
      if (v54) {
        [v12 modelURL];
      }
      else {
      id v55 = [v12 sourceURL];
      }
      v81 = &stru_10002CA38;
      id v56 = +[_ANEStrings trimmedModelPath:v55 trimmedPath:&v81];
      id v72 = v81;

      v85[0] = @"csIdentity";
      v85[1] = @"modelURL";
      v86[0] = v73;
      v86[1] = v72;
      v85[2] = @"privacy_score";
      id v63 = +[NSNumber numberWithBool:v56];
      v86[2] = v63;
      v85[3] = @"programHandle";
      unsigned __int8 v57 = +[NSNumber numberWithUnsignedLongLong:v69];
      v86[3] = v57;
      v85[4] = @"numWeightFiles";
      id v58 = +[NSNumber numberWithUnsignedInt:v83];
      v86[4] = v58;
      v85[5] = @"modelLoadingTime";
      v59 = +[NSNumber numberWithDouble:v46 * 1000.0];
      v86[5] = v59;
      v85[6] = @"newInstanceLoaded";
      v60 = +[NSNumber numberWithBool:v66];
      v86[6] = v60;
      v61 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:7];
      +[_ANEDataReporter reportTelemetryToPPS:@"newInstanceModelLoad" playload:v61];

      [v12 string_id];
      kdebug_trace();
      [v12 string_id];
      kdebug_trace();

      v42 = (void *)v73;
    }
    else
    {
      id v39 = (id)qword_100032C00;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CFB4();
      }

      if (v13)
      {
        BOOL v40 = NSStringFromSelector(a2);
        id v41 = +[_ANEErrors missingCodeSigningErrorForMethod:v40];
        (*((void (**)(id, void, void *, void, void, void, void, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, v41);
      }
      v42 = 0;
      [v12 string_id];
      kdebug_trace();
    }

LABEL_59:
    __int16 v38 = v79;
LABEL_60:

    goto LABEL_61;
  }
  unsigned int v29 = (id)qword_100032C00;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001CC84();
  }

  if (v13)
  {
    id v30 = NSStringFromSelector(a2);
    id v31 = +[_ANEErrors programLoadNewInstanceErrorForMethod:v30];
    (*((void (**)(id, void, void *, void, void, void, void, void *))v13 + 2))(v13, 0, &__NSDictionary0__struct, 0, 0, 0, 0, v31);
  }
  [v12 string_id];
  kdebug_trace();
LABEL_61:
}

- (void)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 withReply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v46 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  [v11 string_id];
  kdebug_trace();
  id v13 = (id)qword_100032C00;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v49 = v14;
    __int16 v50 = 2112;
    id v51 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "START: %@: %@", buf, 0x16u);
  }
  v15 = +[NSXPCConnection currentConnection];
  unsigned int v16 = v15;
  if (v15)
  {
    [v15 auditToken];
    unsigned int v44 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", v47, [v16 processIdentifier]);
    if (v44)
    {
      if (v11)
      {
        unsigned int v17 = [v11 key];
        unsigned int v18 = [v17 isEqualToString:off_1000327C8];

        if (!v18)
        {
          unsigned int v29 = [v46 objectForKeyedSubscript:off_1000326D0];
          unsigned int v43 = [v29 isEqualToString:off_1000326E8];

          id v30 = +[_ANEQoSMapper queueIndexForQoS:v7];
          id v31 = [(_ANEServer *)self semaArray];
          id v32 = [v31 objectAtIndexedSubscript:v30];

          dispatch_time_t v33 = dispatch_time(0, 30000000000);
          intptr_t v34 = dispatch_semaphore_wait(v32, v33);
          uint64_t v35 = (id)qword_100032C00;
          id v36 = v35;
          if (v34)
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              sub_10001D52C();
            }

            unsigned int v37 = NSStringFromSelector(a2);
            __int16 v38 = +[_ANEErrors timeoutErrorForMethod:v37];
            v12[2](v12, 0, v38);

            [v11 string_id];
            kdebug_trace();
            int v23 = 1;
          }
          else
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              id v39 = NSStringFromSelector(a2);
              BOOL v40 = [v11 cacheURLIdentifier];
              *(_DWORD *)buf = 138412802;
              v49 = v39;
              __int16 v50 = 2112;
              id v51 = v16;
              __int16 v52 = 2112;
              id v53 = v40;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@:  removeProgramForConnection: %@, Model cacheURLIdentifier:%@", buf, 0x20u);
            }
            +[_ANEProgramCache removeProgramForConnection:v16 model:v11 bundleID:v44];
            v12[2](v12, 1, 0);
            dispatch_semaphore_signal(v32);
            id v41 = (id)qword_100032C00;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138413058;
              v49 = v42;
              __int16 v50 = 2112;
              id v51 = v44;
              __int16 v52 = 2112;
              id v53 = v11;
              __int16 v54 = 1024;
              unsigned int v55 = v43;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "END: %@: %@ : %@ : %d", buf, 0x26u);
            }
            int v23 = 0;
          }

          goto LABEL_21;
        }
        unsigned int v19 = (id)qword_100032C00;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          [v11 key];
          objc_claimAutoreleasedReturnValue();
          sub_10001CF6C();
        }

        unsigned int v20 = NSStringFromSelector(a2);
        id v21 = +[_ANEErrors invalidModelKeyErrorForMethod:v20];
        v12[2](v12, 0, v21);

        [v11 string_id];
LABEL_20:
        kdebug_trace();
        int v23 = 1;
LABEL_21:

        goto LABEL_22;
      }
      BOOL v28 = (id)qword_100032C00;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001D4E8();
      }

      int v25 = NSStringFromSelector(a2);
      id v26 = +[_ANEErrors invalidModelErrorForMethod:v25];
      v12[2](v12, 0, v26);
      id v27 = 0;
    }
    else
    {
      __int16 v24 = (id)qword_100032C00;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CCC8();
      }

      int v25 = NSStringFromSelector(a2);
      id v26 = +[_ANEErrors missingCodeSigningErrorForMethod:v25];
      v12[2](v12, 0, v26);
      id v27 = v11;
    }

    [v27 string_id];
    goto LABEL_20;
  }
  unsigned int v22 = (id)qword_100032C00;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001CC84();
  }

  v12[2](v12, 0, 0);
  [v11 string_id];
  kdebug_trace();
  int v23 = 1;
LABEL_22:

  if (!v23)
  {
    [v11 string_id];
    kdebug_trace();
  }
}

- (void)prepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 withReply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v38 = a4;
  id v39 = a5;
  id v14 = (void (**)(id, void, void *))a7;
  uint64_t v15 = v8;
  kdebug_trace();
  unsigned int v17 = +[NSXPCConnection currentConnection];
  unsigned int v18 = v17;
  if (v17)
  {
    [v17 auditToken];
    unsigned int v37 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", v41, [v18 processIdentifier]);
    id v19 = +[_ANEQoSMapper queueIndexForQoS:v8];
    unsigned int v20 = [(_ANEServer *)self semaArray];
    id v21 = [v20 objectAtIndexedSubscript:v19];

    dispatch_time_t v22 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v21, v22))
    {
      int v23 = NSStringFromSelector(a2);
      __int16 v24 = +[_ANEErrors timeoutErrorForMethod:v23];
      v14[2](v14, 0, v24);

      [v13 string_id];
      kdebug_trace();
      int v25 = 1;
    }
    else
    {
      id v36 = +[_ANEProgramCache programForConnection:v18 model:v13 bundleID:v37];
      id v27 = [v38 objectForKeyedSubscript:off_1000327B0];
      intptr_t v34 = v27;
      if (v27) {
        id v28 = [_ANEPerformanceStats driverMaskForANEFMask:](_ANEPerformanceStats, objc_msgSend(v27, "unsignedIntValue", v27));
      }
      else {
        id v28 = 0;
      }
      id v40 = 0;
      id v29 = [v36 prepareChainingRequest:v39 qos:v8 qIndex:v19 statsMask:v28 error:&v40];
      id v30 = v40;
      if ((v29 & 1) == 0) {
        +[_ANEProgramCache removeProgramForConnection:v18 model:v13 bundleID:v37];
      }
      ((void (**)(id, id, void *))v14)[2](v14, v29, v30);
      dispatch_semaphore_signal(v21);
      id v31 = +[_ANELog daemon];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        id v32 = NSStringFromSelector(a2);
        dispatch_time_t v33 = [v13 modelURL];
        *(_DWORD *)buf = 138413058;
        unsigned int v43 = v32;
        __int16 v44 = 2112;
        double v45 = v37;
        __int16 v46 = 2112;
        id v47 = v33;
        __int16 v48 = 2048;
        uint64_t v49 = v15;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@: %@ : %@ : %lu", buf, 0x2Au);
      }
      int v25 = 0;
    }
  }
  else
  {
    id v26 = +[_ANELog daemon];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    v14[2](v14, 0, 0);
    int v25 = 1;
  }

  if (!v25) {
    kdebug_trace();
  }
}

- (void)compiledModelExistsMatchingHash:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, void))a4;
  kdebug_trace();
  id v9 = +[NSXPCConnection currentConnection];
  int v10 = v9;
  if (v9)
  {
    [v9 auditToken];
    id v11 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", v22, [v10 processIdentifier]);
    if (v11)
    {
      id v12 = [(_ANEServer *)self modelCacheManager];
      id v13 = [v12 cachedModelPathMatchingHash:v7 csIdentity:v11];

      id v14 = (id)qword_100032C00;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001D570();
      }

      id v21 = &__NSDictionary0__struct;
      uint64_t v15 = +[_ANEStorageHelper memoryMapModelAtPath:v13 modelAttributes:&v21];
      id v16 = v21;
      v8[2](v8, v15 != 0, 0);
      kdebug_trace();
    }
    else
    {
      unsigned int v18 = (id)qword_100032C00;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CCC8();
      }

      id v19 = NSStringFromSelector(a2);
      unsigned int v20 = +[_ANEErrors missingCodeSigningErrorForMethod:v19];
      ((void (**)(id, BOOL, void *))v8)[2](v8, 0, v20);

      kdebug_trace();
    }
  }
  else
  {
    unsigned int v17 = (id)qword_100032C00;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    v8[2](v8, 0, 0);
    kdebug_trace();
  }
}

- (void)purgeCompiledModelMatchingHash:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, void))a4;
  kdebug_trace();
  id v9 = +[NSXPCConnection currentConnection];
  int v10 = v9;
  if (v9)
  {
    [v9 auditToken];
    id v11 = +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", &v19, [v10 processIdentifier]);
    if (v11)
    {
      id v12 = [(_ANEServer *)self modelCacheManager];
      id v13 = [v12 cachedModelPathMatchingHash:v7 csIdentity:v11];

      id v14 = (id)qword_100032C00;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001D5B8();
      }

      v8[2](v8, +[_ANEStorageHelper removeDirectoryAtPath:v13], 0);
      kdebug_trace();
    }
    else
    {
      id v16 = (id)qword_100032C00;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10001CCC8();
      }

      unsigned int v17 = NSStringFromSelector(a2);
      unsigned int v18 = +[_ANEErrors missingCodeSigningErrorForMethod:v17];
      ((void (**)(id, BOOL, void *))v8)[2](v8, 0, v18);

      kdebug_trace();
    }
  }
  else
  {
    uint64_t v15 = (id)qword_100032C00;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001CC84();
    }

    v8[2](v8, 0, 0);
    kdebug_trace();
  }
}

- (id)compileAsNeededAndLoadCachedModel:(id)a3 csIdentity:(id)a4 sandboxExtension:(id)a5 options:(id)a6 qos:(unsigned int)a7 modelFilePath:(id *)a8 modelAttributes:(id *)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v57 = a5;
  id v17 = a6;
  id v58 = v16;
  if (![v16 containsString:@"../"])
  {
    unsigned int v20 = [v17 objectForKeyedSubscript:off_100032A60];

    if (v20
      && (id v21 = objc_alloc((Class)NSString),
          [v17 objectForKeyedSubscript:off_100032A60],
          dispatch_time_t v22 = objc_claimAutoreleasedReturnValue(),
          unsigned int v18 = [v21 initWithString:v22],
          v22,
          v18))
    {
      if ([v18 containsString:@".."])
      {
        id v56 = (id)qword_100032C00;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_10001D6F0();
        }
        uint64_t v19 = 0;
        goto LABEL_62;
      }
      int v23 = [(_ANEServer *)self modelCacheManager];
      id v56 = [v23 cachedModelPathMatchingHash:v18 csIdentity:v58];
      char v25 = 1;
    }
    else
    {
      int v23 = [(_ANEServer *)self modelAssetCacheManager];
      __int16 v24 = [v17 objectForKeyedSubscript:off_1000327E8];
      id v56 = [v23 cachedModelPathFor:v15 csIdentity:v58 useSourceURL:[v24 BOOLValue]];

      char v25 = 0;
      unsigned int v18 = 0;
    }

    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_DEBUG)) {
      sub_10001D688();
    }
    id v26 = [v17 objectForKeyedSubscript:off_1000327E0];
    __int16 v52 = a8;
    unsigned int v27 = [v26 BOOLValue];

    uint64_t v69 = 0;
    id v70 = &v69;
    uint64_t v71 = 0x3032000000;
    id v72 = sub_100013818;
    uint64_t v73 = sub_100013828;
    id v74 = 0;
    if (v27)
    {
      uint64_t v53 = -1;
    }
    else
    {
      id obj = 0;
      uint64_t v53 = (uint64_t)+[_ANESandboxingHelper consumeSandboxExtension:v57 forModel:v15 error:&obj];
      objc_storeStrong(&v74, obj);
      if (v53 < 0 && v70[5])
      {
        uint64_t v19 = 0;
LABEL_61:
        _Block_object_dispose(&v69, 8);

LABEL_62:
        goto LABEL_63;
      }
      if ((v25 & 1) == 0)
      {
        id v28 = [v15 modelURL];
        id v29 = [v28 path];
        unsigned int v30 = +[_ANEModelCacheManager removeIfStaleBinary:v56 forModelPath:v29];

        if (v30)
        {
          id v31 = (id)qword_100032C00;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            id v32 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v32;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v56;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@: Stale model at %@ removed from cache", buf, 0x16u);
          }
        }
      }
    }
    id v65 = &__NSDictionary0__struct;
    uint64_t v19 = +[_ANEStorageHelper memoryMapModelAtPath:v56 modelAttributes:&v65];
    id v33 = v65;
    if (v19) {
      uint64_t v34 = 3;
    }
    else {
      uint64_t v34 = 5;
    }
    [v15 updateModelAttributes:v33 state:v34];
    if (!v19 && ((v27 ^ 1) & 1) == 0)
    {
      uint64_t v35 = +[NSFileManager defaultManager];
      buf[0] = 0;
      if (([v35 fileExistsAtPath:v56 isDirectory:buf] & 1) == 0)
      {
        id v36 = (id)qword_100032C00;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_10001D644();
        }
      }
      unsigned int v37 = NSStringFromSelector(a2);
      uint64_t v38 = +[_ANEErrors fileNotFoundErrorForMethod:v37];
      id v39 = (void *)v70[5];
      v70[5] = v38;
    }
    if (v19) {
      char v40 = 1;
    }
    else {
      char v40 = v27;
    }
    if ((v40 & 1) == 0)
    {
      id v41 = (id)qword_100032C00;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        __int16 v50 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        id v68 = v58;
        _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%@: No model in cache, kicking off compilation. model=%@ : csIdentity=%@", buf, 0x20u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v68) = 1;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1000196D4;
      v60[3] = &unk_10002C960;
      unsigned int v62 = buf;
      SEL v64 = a2;
      id v42 = v15;
      id v61 = v42;
      id v63 = &v69;
      [(_ANEServer *)self doCompileModel:v42 csIdentity:v58 sandboxExtension:v57 options:v17 qos:a7 withReply:v60];
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        id v59 = v33;
        uint64_t v19 = +[_ANEStorageHelper memoryMapModelAtPath:v56 modelAttributes:&v59];
        id v43 = v59;

        if (v19) {
          uint64_t v44 = 3;
        }
        else {
          uint64_t v44 = 5;
        }
        [v42 updateModelAttributes:v43 state:v44];
        double v45 = [v17 objectForKeyedSubscript:off_1000327B0];
        __int16 v46 = v45;
        if (v45) {
          [v42 setPerfStatsMask:[_ANEPerformanceStats driverMaskForANEFMask:](_ANEPerformanceStats, "driverMaskForANEFMask:", [v45 unsignedIntValue])];
        }
      }
      else
      {
        [v42 modelAttributes];
        uint64_t v19 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        id v43 = v33;
      }

      _Block_object_dispose(buf, 8);
      id v33 = v43;
    }
    if ((v27 & 1) == 0
      && (+[_ANESandboxingHelper releaseSandboxExtension:v57 handle:v53] & 1) == 0)
    {
      id v47 = (id)qword_100032C00;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        int v51 = *__error();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v68) = v51;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "releaseSandboxExtension:(%@) handle:(%lld) failed (%d)", buf, 0x1Cu);
      }
    }
    id *v52 = v56;
    if (v19)
    {
      *a9 = [v15 modelAttributes];
    }
    if (a10)
    {
      __int16 v48 = (void *)v70[5];
      if (v48) {
        *a10 = [v48 copy];
      }
    }

    goto LABEL_61;
  }
  unsigned int v18 = (id)qword_100032C00;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001D600();
  }
  uint64_t v19 = 0;
LABEL_63:

  return v19;
}

- (void)doCompileModel:(id)a3 csIdentity:(id)a4 sandboxExtension:(id)a5 options:(id)a6 qos:(unsigned int)a7 withReply:(id)a8
{
  id v13 = a3;
  id v85 = a4;
  id v86 = a5;
  id v14 = a6;
  id v15 = a8;
  id v16 = [v14 objectForKeyedSubscript:off_1000326D0];
  LODWORD(a6) = [v16 isEqualToString:off_1000326E8];

  if (!a6)
  {
    [v13 string_id];
    kdebug_trace();
    id v17 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.ANECompilerService"];
    unsigned int v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____ANECompilerServiceProtocol];
    [v17 setRemoteObjectInterface:v18];

    uint64_t v19 = [v14 objectForKeyedSubscript:off_1000327F8];
    unsigned int v20 = [v19 BOOLValue];

    unsigned int v83 = +[NSXPCConnection currentConnection];
    v79 = +[_ANEStrings secondaryANECompilerServiceAccessEntitlement];
    id v82 = [v83 valueForEntitlement:];
    if (v82 && ([v82 BOOLValue] & v20) == 1)
    {
      id v21 = qword_100032C00;
      if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Using secondary (longer duration) ANECompilerService", buf, 2u);
      }
      uint64_t v22 = 64;
    }
    else
    {
      int v23 = qword_100032C00;
      if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Using primary (regular) ANECompilerService", buf, 2u);
      }
      uint64_t v22 = 72;
    }
    [v17 _setUUID:*(Class *)((char *)&self->super.isa + v22)];
    [v17 resume];
    if (!v17)
    {
      __int16 v24 = qword_100032C00;
      if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
        sub_10001D7BC(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_10001A8AC;
    v104[3] = &unk_10002C988;
    id v105 = @"com.apple.ANECompilerService";
    unsigned int v76 = (void (**)(void))v15;
    objc_super v106 = v76;
    v81 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v104];
    id v103 = 0;
    unint64_t v32 = (unint64_t)+[_ANESandboxingHelper consumeSandboxExtension:v86 forModel:v13 error:&v103];
    id v33 = v103;
    if ((v32 & 0x8000000000000000) != 0 && v33) {
      goto LABEL_58;
    }
    unint64_t v71 = v32;
    id v74 = v33;
    uint64_t v34 = [v14 objectForKeyedSubscript:off_100032A60];
    BOOL v35 = v34 == 0;

    if (v35)
    {
      id v78 = 0;
    }
    else
    {
      id v36 = objc_alloc((Class)NSString);
      unsigned int v37 = [v14 objectForKeyedSubscript:off_100032A60];
      id v78 = [v36 initWithString:v37];
    }
    uint64_t v38 = [v14 objectForKeyedSubscript:off_100032750];
    BOOL v39 = v38 == 0;

    if (v39)
    {
      id v77 = 0;
    }
    else
    {
      id v77 = [v14 objectForKeyedSubscript:off_100032750];
    }
    if (v78)
    {
      if ([v85 containsString:@"../"])
      {
        char v40 = (id)qword_100032C00;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          id v41 = v40;
          sub_10001D734();
LABEL_33:
          char v40 = v41;
          goto LABEL_57;
        }
        goto LABEL_57;
      }
      if ([v78 containsString:@".."])
      {
        char v40 = (id)qword_100032C00;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          id v41 = v40;
          sub_10001D778();
          goto LABEL_33;
        }
LABEL_57:

        id v33 = v74;
LABEL_58:

        goto LABEL_59;
      }
      double v45 = [(_ANEServer *)self modelCacheManager];
      uint64_t v53 = [v45 URLForModelHash:v78 bundleID:v85];
      uint64_t v75 = [v53 path];
    }
    else
    {
      id v42 = [v14 objectForKeyedSubscript:off_1000327E8];
      id v43 = [v42 BOOLValue];

      uint64_t v44 = [(_ANEServer *)self modelAssetCacheManager];
      double v45 = [v44 URLForModel:v13 bundleID:v85 useSourceURL:v43 aotCacheUrlIdentifier:v77];

      uint64_t v46 = [v45 path];
      id v47 = [v13 getCacheURLIdentifier];
      uint64_t v75 = v46;
      LODWORD(v44) = v47 == 0;

      if (v44)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v116 = sub_100013818;
        *(void *)id v117 = sub_100013828;
        *(void *)&v117[8] = 0;
        uint64_t v97 = 0;
        double v98 = &v97;
        uint64_t v99 = 0x3032000000;
        unsigned int v100 = sub_100013818;
        id v101 = sub_100013828;
        id v102 = 0;
        __int16 v48 = [(_ANEServer *)self modelAssetCacheManager];
        v96[0] = _NSConcreteStackBlock;
        v96[1] = 3221225472;
        v96[2] = sub_10001A944;
        v96[3] = &unk_10002C938;
        v96[4] = buf;
        v96[5] = &v97;
        [v48 cacheURLIdentifierForModel:v13 useSourceURL:v43 withReply:v96];

        uint64_t v49 = v98[5];
        if (v77)
        {
          uint64_t v50 = +[NSString stringWithFormat:@"%@_shapes_%@_%@", v77, *(void *)(*(void *)&buf[8] + 40), v49];
          int v51 = [(_ANEServer *)self modelAssetCacheManager];
          id v70 = (void *)v50;
          __int16 v52 = [v51 getModelBinaryPathFromURLIdentifier:v77 bundleID:v85];
          id v72 = +[NSString stringWithFormat:@"%@/", v52];
        }
        else
        {
          +[NSString stringWithFormat:@"%@_%@", *(void *)(*(void *)&buf[8] + 40), v49];
          v70 = id v72 = 0;
        }
        __int16 v54 = qword_100032C00;
        if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id v107 = 138412290;
          id v108 = v70;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "cacheURLIdentifier:%@", v107, 0xCu);
        }
        _Block_object_dispose(&v97, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_40;
      }
    }
    id v70 = 0;
    id v72 = 0;
LABEL_40:

    uint64_t v73 = +[NSURL fileURLWithPath:v75 isDirectory:1];
    unsigned int v55 = +[NSFileManager defaultManager];
    [v55 createDirectoryAtPath:v75 withIntermediateDirectories:1 attributes:0 error:0];

    id v56 = (id)qword_100032C00;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      id v57 = [v13 modelURL];
      id v58 = [v13 sourceURL];
      id v59 = [v13 key];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v57;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      v116 = (uint64_t (*)(uint64_t, uint64_t))v85;
      *(_WORD *)id v117 = 2112;
      *(void *)&v117[2] = v59;
      *(_WORD *)&v117[10] = 2112;
      *(void *)&v117[12] = v73;
      __int16 v118 = 2112;
      id v119 = v14;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Calling ANECompilerService: modelURL=%@ : sourceURL=%@ : csIdentity=%@ : key=%@ : outputURL=%@ : options=%@", buf, 0x3Eu);
    }
    uint64_t v92 = 0;
    __int16 v93 = &v92;
    uint64_t v94 = 0x2020000000;
    char v95 = 1;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v116 = sub_100013818;
    *(void *)id v117 = sub_100013828;
    *(void *)&v117[8] = 0;
    uint64_t v97 = 0;
    double v98 = &v97;
    uint64_t v99 = 0x3032000000;
    unsigned int v100 = sub_100013818;
    id v101 = sub_100013828;
    id v102 = &__NSDictionary0__struct;
    if (self->_isRootDaemon) {
      +[_ANEStrings tempDirectory];
    }
    else {
    v60 = +[_ANEStrings userTempDirectory];
    }
    if (self->_isRootDaemon) {
      +[_ANEStrings cloneDirectory];
    }
    else {
    id v61 = +[_ANEStrings userCloneDirectory];
    }
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10001A9E8;
    v87[3] = &unk_10002C9B0;
    __int16 v89 = &v92;
    uint64_t v90 = &v97;
    __int16 v91 = buf;
    id v62 = v13;
    id v88 = v62;
    [v81 compileModelAt:v62 csIdentity:v85 sandboxExtension:v86 options:v14 tempDirectory:v60 cloneDirectory:v61 outputURL:v73 aotModelBinaryPath:v72 withReply:v87];

    if (v76) {
      v76[2]();
    }
    [v17 invalidate];
    unsigned __int8 v63 = +[_ANESandboxingHelper releaseSandboxExtension:v86 handle:v71];
    *((unsigned char *)v93 + 24) = v63;
    if ((v63 & 1) == 0)
    {
      SEL v64 = (id)qword_100032C00;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        int v69 = *__error();
        *(_DWORD *)id v107 = 138412802;
        id v108 = v86;
        __int16 v109 = 2048;
        unint64_t v110 = v71;
        __int16 v111 = 1024;
        LODWORD(v112) = v69;
        _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "releaseSandboxExtension:(%@) handle:(%lld) failed (%d)", v107, 0x1Cu);
      }
    }
    [v62 string_id];
    kdebug_trace();
    id v65 = (id)qword_100032C00;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v66 = (id)objc_claimAutoreleasedReturnValue();
      id v67 = [v62 modelURL];
      id v68 = [v62 key];
      *(_DWORD *)id v107 = 138413058;
      id v108 = v66;
      __int16 v109 = 2112;
      unint64_t v110 = (unint64_t)v85;
      __int16 v111 = 2112;
      v112 = v67;
      __int16 v113 = 2112;
      v114 = v68;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "END: %@: %@ : %@ : %@", v107, 0x2Au);
    }
    _Block_object_dispose(&v97, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v92, 8);

    char v40 = v75;
    goto LABEL_57;
  }
  if (v15) {
    (*((void (**)(id, uint64_t, void *, void, void))v15 + 2))(v15, 1, &__NSDictionary0__struct, 0, 0);
  }
LABEL_59:
}

- (_ANEModelCacheManager)modelAssetCacheManager
{
  return self->_modelAssetCacheManager;
}

- (_ANEInMemoryModelCacheManager)modelCacheManager
{
  return self->_modelCacheManager;
}

- (NSArray)semaArray
{
  return self->_semaArray;
}

- (_ANEXPCServiceHelper)unrestricted
{
  return self->_unrestricted;
}

- (_ANEXPCServiceHelper)restricted
{
  return self->_restricted;
}

- (_ANEXPCServiceHelper)unrestrictedUser
{
  return self->_unrestrictedUser;
}

- (NSUUID)uuidANECompilerServiceLongerDuration
{
  return self->_uuidANECompilerServiceLongerDuration;
}

- (NSUUID)uuidANECompilerServiceRegular
{
  return self->_uuidANECompilerServiceRegular;
}

- (BOOL)isRootDaemon
{
  return self->_isRootDaemon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidANECompilerServiceRegular, 0);
  objc_storeStrong((id *)&self->_uuidANECompilerServiceLongerDuration, 0);
  objc_storeStrong((id *)&self->_unrestrictedUser, 0);
  objc_storeStrong((id *)&self->_restricted, 0);
  objc_storeStrong((id *)&self->_unrestricted, 0);
  objc_storeStrong((id *)&self->_semaArray, 0);
  objc_storeStrong((id *)&self->_modelCacheManager, 0);

  objc_storeStrong((id *)&self->_modelAssetCacheManager, 0);
}

@end