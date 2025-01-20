@interface MSDHMessageResponder
+ (id)sharedInstance;
- (BOOL)clearStagedDeviceAfterUpdateProcess;
- (BOOL)cloneFile:(id)a3;
- (BOOL)collectDemoLogsToFolder:(id)a3;
- (BOOL)createDeviceManifest:(id)a3;
- (BOOL)deleteNvram:(id)a3;
- (BOOL)disableLaunchdServicesForWatch:(id)a3;
- (BOOL)executeTestScriptOfIdentifier:(id)a3;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)hasEntitlementMobileStoreDemod:(id)a3;
- (BOOL)isCommandAllowed:(id)a3;
- (BOOL)manageVolume:(id)a3;
- (BOOL)migratePreferencesFile:(id)a3;
- (BOOL)moveStagingToFinal:(id)a3;
- (BOOL)prepareWorkDirectory:(id)a3;
- (BOOL)preserveBluetoothFileToShelter:(id)a3;
- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 outErrorDict:(id *)a4;
- (BOOL)quitHelper:(id)a3;
- (BOOL)readPlistFile:(id)a3 outContent:(id *)a4;
- (BOOL)reboot:(id)a3;
- (BOOL)removeWorkDirectory:(id)a3;
- (BOOL)restartBluetooth:(id)a3;
- (BOOL)restoreAppDataAttributes:(id)a3;
- (BOOL)restoreBackupAttributes:(id)a3;
- (BOOL)setComputerNameAndHostname:(id)a3;
- (BOOL)setPreferences:(id)a3;
- (BOOL)stageDeviceForUpdateProcess:(id)a3;
- (BOOL)switchToBackupFolder:(id)a3;
- (BOOL)touchFile:(id)a3;
- (BOOL)updateSignedManifest;
- (BOOL)writeNvram:(id)a3;
- (MSDHMessageResponder)init;
- (OS_dispatch_queue)messageHandlerQueue;
- (void)_handleXPCMessage:(id)a3 fromConnection:(id)a4;
- (void)handleXPCMessage:(id)a3 fromConnection:(id)a4;
- (void)sendResponse:(BOOL)a3 withPayload:(id)a4 forRequest:(id)a5 fromConnection:(id)a6;
- (void)setMessageHandlerQueue:(id)a3;
@end

@implementation MSDHMessageResponder

+ (id)sharedInstance
{
  if (qword_100057EE8 != -1) {
    dispatch_once(&qword_100057EE8, &stru_10004D1B0);
  }
  v2 = (void *)qword_100057EE0;

  return v2;
}

- (MSDHMessageResponder)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDHMessageResponder;
  v2 = [(MSDHMessageResponder *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msdmessage", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(MSDHMessageResponder *)v2 setMessageHandlerQueue:v3];

    v4 = v2;
  }

  return v2;
}

- (BOOL)hasEntitlementMobileStoreDemod:(id)a3
{
  long long v28 = 0u;
  long long v29 = 0u;
  xpc_connection_get_audit_token();
  memset(&v27, 0, sizeof(v27));
  dispatch_queue_t v3 = SecTaskCreateWithAuditToken(0, &v27);
  if (!v3)
  {
    v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000336CC(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    return 0;
  }
  v4 = v3;
  CFBooleanRef v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v3, @"com.apple.private.mobilestoredemo.helper", 0);
  if (!v5)
  {
    v18 = sub_100027250();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100033744(v18, v19, v20, v21, v22, v23, v24, v25);
    }

    CFRelease(v4);
    return 0;
  }
  CFBooleanRef v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 == CFBooleanGetTypeID())
  {
    BOOL v8 = CFBooleanGetValue(v6) != 0;
  }
  else
  {
    v26 = sub_100027250();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000337BC();
    }

    BOOL v8 = 0;
  }
  CFRelease(v4);
  CFRelease(v6);
  return v8;
}

- (BOOL)isCommandAllowed:(id)a3
{
  uint64_t v3 = qword_100057EF8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100057EF8, &stru_10004D1D0);
  }
  unsigned __int8 v5 = [(id)qword_100057EF0 containsObject:v4];

  return v5;
}

- (void)handleXPCMessage:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MSDHMessageResponder *)self messageHandlerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000282CC;
  block[3] = &unk_10004D1F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)sendResponse:(BOOL)a3 withPayload:(id)a4 forRequest:(id)a5 fromConnection:(id)a6
{
  id v11 = a4;
  id v9 = (_xpc_connection_s *)a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a5);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  if (v11) {
    a3 &= [v11 saveAsDataInXPCDictionary:reply forKey:"payload"];
  }
  xpc_dictionary_set_BOOL(reply, "result", a3);
  xpc_connection_send_message(v9, reply);
}

- (BOOL)updateSignedManifest
{
  v2 = sub_100027250();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[MSDHMessageResponder updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter:", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v3 = +[MSDHOperations sharedInstance];
  unsigned __int8 v4 = [v3 updateSignedManifest];

  return v4;
}

- (BOOL)migratePreferencesFile:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[MSDHMessageResponder migratePreferencesFile:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  unsigned __int8 v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 migratePreferencesFile];

  return v6;
}

- (BOOL)stageDeviceForUpdateProcess:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 objectForKey:@"ForBackgroundDownload"];
  unsigned int v5 = [v4 BOOLValue];

  unsigned __int8 v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[MSDHMessageResponder stageDeviceForUpdateProcess:]";
    __int16 v55 = 2114;
    id v56 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }
  id v42 = v3;

  id v7 = +[NSMutableArray array];
  int v8 = +[NSMutableArray array];
  id v9 = +[NSMutableArray array];
  unsigned int v41 = v5;
  if (v5)
  {
    [v7 addObjectsFromArray:&off_100052238];
    __int16 v10 = &off_100052250;
    id v11 = v8;
  }
  else
  {
    [v7 addObjectsFromArray:&off_100052268];
    [v8 addObjectsFromArray:&off_100052280];
    __int16 v10 = &off_100052298;
    id v11 = v9;
  }
  [v11 addObjectsFromArray:v10];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v48;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v18 = +[MSDHOperations sharedInstance];
        [v18 removeDirectory:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v14);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v19 = v7;
  id v20 = [v19 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v44;
    while (2)
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8 * (void)j);
        uint64_t v25 = [v9 containsObject:v24] ^ 1;
        v26 = +[MSDHOperations sharedInstance];
        LOBYTE(v25) = [v26 prepareDirectory:v24 writableByNonRoot:v25];

        if ((v25 & 1) == 0)
        {
          v31 = sub_100027250();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_100033874();
          }

          v32 = v19;
          v30 = v42;
          goto LABEL_26;
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  audit_token_t v27 = +[MSDHOperations sharedInstance];
  unsigned __int8 v28 = [v27 prepareWorkContainerInUserHome:v41];

  if (v28)
  {
    BOOL v29 = 1;
    v30 = v42;
  }
  else
  {
    v32 = sub_100027250();
    v30 = v42;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10003383C(v32, v34, v35, v36, v37, v38, v39, v40);
    }
LABEL_26:

    BOOL v29 = 0;
  }

  return v29;
}

- (BOOL)clearStagedDeviceAfterUpdateProcess
{
  v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest"];

  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v44 = 136315138;
    long long v45 = "-[MSDHMessageResponder clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter", (uint8_t *)&v44, 0xCu);
  }

  unsigned int v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 removeDirectory:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer"];

  if ((v6 & 1) == 0)
  {
    uint64_t v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100033A04(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_20;
  }
  if (v3)
  {
    id v7 = sub_100027250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = 138543362;
      long long v45 = @"/var/MSDWorkContainer";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Factory cache exists so spare the work container: %{public}@", (uint8_t *)&v44, 0xCu);
    }
  }
  else
  {
    int v8 = +[MSDHOperations sharedInstance];
    unsigned __int8 v9 = [v8 removeDirectory:@"/var/MSDWorkContainer"];

    if ((v9 & 1) == 0)
    {
      uint64_t v15 = sub_100027250();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10003398C(v15, v37, v38, v39, v40, v41, v42, v43);
      }
      goto LABEL_20;
    }
  }
  __int16 v10 = +[MSDHOperations sharedInstance];
  unsigned __int8 v11 = [v10 removeDirectory:@"/private/var/.backup"];

  if (v11)
  {
    id v12 = +[MSDHOperations sharedInstance];
    unsigned __int8 v13 = [v12 destroyWorkContainerInUserHome];

    if (v13) {
      return 1;
    }
    uint64_t v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000338DC(v15, v30, v31, v32, v33, v34, v35, v36);
    }
  }
  else
  {
    uint64_t v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100033914(v15, v23, v24, v25, v26, v27, v28, v29);
    }
  }
LABEL_20:

  return 0;
}

- (BOOL)prepareWorkDirectory:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    unsigned __int8 v11 = "-[MSDHMessageResponder prepareWorkDirectory:]";
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  unsigned int v5 = [v3 objectForKey:@"Path"];
  unsigned __int8 v6 = [v3 objectForKey:@"WritableByNonRoot"];
  id v7 = +[MSDHOperations sharedInstance];
  unsigned __int8 v8 = [v7 prepareDirectory:v5 writableByNonRoot:[v6 BOOLValue]];

  return v8;
}

- (BOOL)removeWorkDirectory:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[MSDHMessageResponder removeWorkDirectory:]";
    __int16 v21 = 2114;
    id v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    int v9 = 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        __int16 v12 = +[MSDHOperations sharedInstance];
        v9 &= [v12 removeDirectory:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)createDeviceManifest:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    long long v14 = "-[MSDHMessageResponder createDeviceManifest:]";
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id v5 = [v3 objectForKey:@"ComponentID"];
  id v6 = [v3 objectForKey:@"ComponentType"];
  id v7 = [v3 objectForKey:@"RootPath"];
  uint64_t v8 = [v3 objectForKey:@"UserHomePath"];
  int v9 = [v3 objectForKey:@"SavePath"];
  int v10 = +[MSDHOperations sharedInstance];
  unsigned __int8 v11 = [v10 createDeviceManifestForComponent:v5 ofType:v6 withRootPath:v7 userHomePath:v8 andSavePath:v9];

  return v11;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[MSDHMessageResponder fileExistsAtPath:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v3];

  return v6;
}

- (BOOL)readPlistFile:(id)a3 outContent:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[MSDHMessageResponder readPlistFile:outContent:]";
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = +[MSDHOperations sharedInstance];
  int v8 = [v7 readPlistFile:v5];

  if (a4) {
    *a4 = v8;
  }

  return v8 != 0;
}

- (BOOL)touchFile:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    long long v14 = "-[MSDHMessageResponder touchFile:]";
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id v5 = +[NSMutableDictionary dictionary];
  unsigned __int8 v6 = [v3 objectForKey:@"FilePath"];
  id v7 = [v3 objectForKey:@"FileOwnerName"];
  int v8 = [v3 objectForKey:@"FileGroupOwnerName"];
  int v9 = [v3 objectForKey:@"FilePosixPermissions"];
  if (v7) {
    [v5 setObject:v7 forKey:NSFileOwnerAccountName];
  }
  if (v8) {
    [v5 setObject:v8 forKey:NSFileGroupOwnerAccountName];
  }
  if (v9) {
    [v5 setObject:v9 forKey:NSFilePosixPermissions];
  }
  int v10 = +[MSDHOperations sharedInstance];
  unsigned __int8 v11 = [v10 touchFile:v6 fileAttributes:v5];

  return v11;
}

- (BOOL)cloneFile:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100033A7C();
  }

  id v5 = [v3 objectForKey:@"FilePath"];
  unsigned __int8 v6 = [v3 objectForKey:@"StatingPath"];
  id v7 = [v3 objectForKey:@"ExpectedHash"];
  int v8 = [v3 objectForKey:@"CorrectOwnership"];
  int v9 = +[MSDHOperations sharedInstance];
  unsigned __int8 v10 = [v9 cloneFile:v5 to:v6 expectingHash:v7 correctOwnership:[v8 BOOLValue]];

  return v10;
}

- (BOOL)restoreBackupAttributes:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    __int16 v15 = "-[MSDHMessageResponder restoreBackupAttributes:]";
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  id v5 = [v3 objectForKey:@"StagingRootPath"];
  unsigned __int8 v6 = [v3 objectForKey:@"Location"];
  id v7 = [v3 objectForKey:@"Length"];
  id v8 = [v6 integerValue];
  id v9 = [v7 integerValue];
  unsigned __int8 v10 = [v3 objectForKey:@"ManifestUID"];
  unsigned __int8 v11 = [v3 objectForKey:@"DeviceUID"];
  __int16 v12 = +[MSDHOperations sharedInstance];
  LOBYTE(v8) = [v12 restoreBackupAttributesUnder:v5 range:v8 manifestUID:v9 deviceUID:v10];

  return (char)v8;
}

- (BOOL)restoreAppDataAttributes:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    int v14 = "-[MSDHMessageResponder restoreAppDataAttributes:]";
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id v5 = [v3 objectForKey:@"StagingRootPath"];
  unsigned __int8 v6 = [v3 objectForKey:@"ContentType"];
  id v7 = [v3 objectForKey:@"Identifier"];
  id v8 = [v3 objectForKey:@"ManifestUID"];
  id v9 = [v3 objectForKey:@"DeviceUID"];
  unsigned __int8 v10 = +[MSDHOperations sharedInstance];
  unsigned __int8 v11 = [v10 restoreAppDataAttributesUnder:v5 containerType:v6 identifier:v7 manifestUID:v8 deviceUID:v9];

  return v11;
}

- (BOOL)deleteNvram:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[MSDHMessageResponder deleteNvram:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 deleteNvram:v3];

  return v6;
}

- (BOOL)writeNvram:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[MSDHMessageResponder writeNvram:]";
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v5 = [v3 objectForKey:@"Name"];
  unsigned __int8 v6 = [v3 objectForKey:@"Value"];
  id v7 = +[MSDHOperations sharedInstance];
  unsigned __int8 v8 = [v7 writeNVRam:v5 withValue:v6];

  return v8;
}

- (BOOL)manageVolume:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[MSDHMessageResponder manageVolume:]";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  id v5 = [v3 objectForKey:@"Target"];
  unsigned __int8 v6 = [v3 objectForKey:@"Operation"];
  if ([v5 isEqualToString:@"Data"])
  {
    id v7 = +[MSDHOperations sharedInstance];
    unsigned __int8 v8 = [v7 manageDataVolume:v6];
LABEL_7:
    unsigned __int8 v9 = v8;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"Demo"])
  {
    id v7 = +[MSDHOperations sharedInstance];
    unsigned __int8 v8 = [v7 manageDemoVolume:v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"User"])
  {
    id v7 = [v3 objectForKey:@"UserName"];
    id v11 = +[MSDHOperations sharedInstance];
    unsigned __int8 v9 = [v11 manageUserVolume:v6 forUser:v7];
  }
  else
  {
    id v7 = sub_100027250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknown volume target: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    unsigned __int8 v9 = 0;
  }
LABEL_8:

  return v9;
}

- (BOOL)moveStagingToFinal:(id)a3
{
  id v20 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[MSDHMessageResponder moveStagingToFinal:]";
    __int16 v28 = 2114;
    id v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }

  id v5 = [v20 objectForKey:@"StagingPaths"];
  unsigned __int8 v6 = [v20 objectForKey:@"FinalPath"];
  obj = self;
  objc_sync_enter(obj);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v13 = +[MSDHOperations sharedInstance];
        unsigned __int8 v14 = [v13 moveUserHomeStagingToFinal:v11 finalPath:v6];

        if (v14)
        {
          id v15 = +[MSDHOperations sharedInstance];
          unsigned int v16 = [v15 moveStagingToFinal:v11 finalPath:v6];
        }
        else
        {
          unsigned int v16 = 0;
        }
        if (!v16)
        {
          BOOL v17 = 0;
          goto LABEL_16;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_16:

  objc_sync_exit(obj);
  return v17;
}

- (BOOL)switchToBackupFolder:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[MSDHMessageResponder switchToBackupFolder:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 switchToBackupFolder];

  return v6;
}

- (BOOL)disableLaunchdServicesForWatch:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[MSDHMessageResponder disableLaunchdServicesForWatch:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 disableLaunchdServicesForWatch];

  return v6;
}

- (BOOL)reboot:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[MSDHMessageResponder reboot:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 reboot];

  return v6;
}

- (BOOL)quitHelper:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[MSDHMessageResponder quitHelper:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = +[MSDHOperations sharedInstance];
  unsigned __int8 v6 = [v5 quitHelper];

  return v6;
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[MSDHMessageResponder collectDemoLogsToFolder:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v5 = [v3 objectForKey:@"logFileDirectory"];
  unsigned __int8 v6 = +[MSDHOperations sharedInstance];
  unsigned __int8 v7 = [v6 collectDemoLogsToFolder:v5];

  return v7;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v3 = [a3 objectForKey:@"SourcePath"];
  unsigned __int8 v4 = +[MSDHOperations sharedInstance];
  unsigned __int8 v5 = [v4 preserveBluetoothFileToShelter:v3];

  return v5;
}

- (BOOL)restartBluetooth:(id)a3
{
  id v3 = +[MSDHOperations sharedInstance];
  unsigned __int8 v4 = [v3 restartBluetooth];

  return v4;
}

- (BOOL)setComputerNameAndHostname:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[MSDHMessageResponder setComputerNameAndHostname:]";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - request:  %{public}@", (uint8_t *)&v12, 0x16u);
  }

  unsigned __int8 v5 = [v3 objectForKey:@"ComputerName"];
  unsigned __int8 v6 = [v3 objectForKey:@"Encoding"];
  id v7 = [v6 unsignedIntValue];

  int v8 = sub_100027250();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100033AFC();
  }

  int v9 = +[MSDHOperations sharedInstance];
  unsigned __int8 v10 = [v9 setComputerNameAndHostname:v5 encoding:v7];

  return v10;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[MSDHMessageResponder executeTestScriptOfIdentifier:]";
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  unsigned __int8 v5 = sub_100027250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100033B80(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  return 0;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 outErrorDict:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[MSDHMessageResponder preserveSecondPartyAppDataToShelter:outErrorDict:]";
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }

  uint64_t v7 = +[MSDHOperations sharedInstance];
  id v11 = 0;
  unsigned __int8 v8 = [v7 preserveSecondPartyAppDataToShelter:v5 withReturnErrorMsg:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0 && a4 && v9)
  {
    CFStringRef v12 = @"ErrorMsg";
    id v13 = v9;
    *a4 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }

  return v8;
}

- (BOOL)setPreferences:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 objectForKey:@"Key"];
  id v5 = [v3 objectForKey:@"Value"];
  uint64_t v6 = [v3 objectForKey:@"ApplicationId"];
  uint64_t v7 = [v3 objectForKey:@"UserName"];

  unsigned __int8 v8 = sub_100027250();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136316162;
    id v13 = "-[MSDHMessageResponder setPreferences:]";
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    long long v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered - key:  %{public}@ - value:  %{public}@ - appId:  %{public}@ - user:  %{public}@", (uint8_t *)&v12, 0x34u);
  }

  id v9 = +[MSDHOperations sharedInstance];
  unsigned __int8 v10 = [v9 setPreferencesForKey:v4 withValue:v5 forApplication:v6 andUser:v7];

  return v10;
}

- (void)_handleXPCMessage:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[NSSet setWithObjects:@"readPlistFile:outContent:", @"preserveSecondPartyAppDataToShelter:outErrorDict:", 0];
  if ([(MSDHMessageResponder *)self hasEntitlementMobileStoreDemod:v7])
  {
    id v9 = +[NSDictionary dictionaryWithXPCDictionary:v6];
    unsigned __int8 v10 = v9;
    if (!v9)
    {
      uint64_t v16 = 0;
      id v17 = 0;
      id v11 = 0;
      int v12 = 0;
      goto LABEL_10;
    }
    id v11 = [v9 objectForKey:@"command"];
    int v12 = [v10 objectForKey:@"payload"];
    if ([(MSDHMessageResponder *)self isCommandAllowed:v11])
    {
      SEL v13 = NSSelectorFromString(v11);
      if (v13)
      {
        SEL v14 = v13;
        if (objc_opt_respondsToSelector())
        {
          id v15 = (uint64_t (*)(MSDHMessageResponder *, SEL, void *, id *))[(MSDHMessageResponder *)self methodForSelector:v14];
          if ([v8 containsObject:v11])
          {
            id v27 = 0;
            uint64_t v16 = v15(self, v14, v12, &v27);
            id v17 = v27;
            goto LABEL_10;
          }
          uint64_t v16 = ((uint64_t (*)(MSDHMessageResponder *, SEL, void *))v15)(self, v14, v12);
LABEL_9:
          id v17 = 0;
          goto LABEL_10;
        }
        uint64_t v26 = sub_100027250();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100033C60((uint64_t)self, (uint64_t)v11, v26);
        }
      }
      else
      {
        uint64_t v26 = sub_100027250();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100033BF8();
        }
      }
    }
    else
    {
      uint64_t v26 = sub_100027250();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100033D10();
      }
    }

    uint64_t v16 = 0;
    goto LABEL_9;
  }
  __int16 v18 = sub_100027250();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100033D78(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  uint64_t v16 = 0;
  id v17 = 0;
  id v11 = 0;
  int v12 = 0;
  unsigned __int8 v10 = 0;
LABEL_10:
  [(MSDHMessageResponder *)self sendResponse:v16 withPayload:v17 forRequest:v6 fromConnection:v7];
}

- (OS_dispatch_queue)messageHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessageHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end