@interface MSDHelperAgent
+ (MSDHelperAgent)sharedInstance;
- (BOOL)clearStagedDeviceAfterUpdateProcess;
- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5;
- (BOOL)collectDemoLogsToFolder:(id)a3;
- (BOOL)deleteNvram:(id)a3;
- (BOOL)disableLaunchdServicesForWatch;
- (BOOL)executeTestScriptOfIdentifier:(id)a3;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)manageDataVolume:(id)a3;
- (BOOL)manageDemoVolume:(id)a3;
- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4;
- (BOOL)migratePreferencesFile;
- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)moveStagingsToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)prepareWorkDirectory:(id)a3 writableByNonRoot:(BOOL)a4;
- (BOOL)preserveBluetoothFileToShelter:(id)a3;
- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4;
- (BOOL)quitHelper;
- (BOOL)reboot;
- (BOOL)removeFileAtPath:(id)a3;
- (BOOL)removeWorkDirectories:(id)a3;
- (BOOL)removeWorkDirectory:(id)a3;
- (BOOL)restartBluetooth;
- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7;
- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6;
- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4;
- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6;
- (BOOL)stageDeviceForUpdateProcess:(BOOL)a3;
- (BOOL)switchToBackupFolder;
- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4;
- (BOOL)updateSignedManifest;
- (BOOL)writeNvram:(id)a3 withValue:(id)a4;
- (MSDHelperAgent)init;
- (OS_dispatch_semaphore)xpc_sema;
- (OS_xpc_object)xpc_conn;
- (id)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7;
- (id)readPlistFile:(id)a3;
- (id)sendXPCRequest:(id)a3;
- (void)setXpc_conn:(id)a3;
- (void)setXpc_sema:(id)a3;
@end

@implementation MSDHelperAgent

+ (MSDHelperAgent)sharedInstance
{
  if (qword_100189CE8 != -1) {
    dispatch_once(&qword_100189CE8, &stru_100153FB8);
  }
  v2 = (void *)qword_100189CE0;

  return (MSDHelperAgent *)v2;
}

- (MSDHelperAgent)init
{
  v18.receiver = self;
  v18.super_class = (Class)MSDHelperAgent;
  v2 = [(MSDHelperAgent *)&v18 init];
  if (!v2)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  dispatch_semaphore_t v3 = dispatch_semaphore_create(5);
  [(MSDHelperAgent *)v2 setXpc_sema:v3];

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemodhelper", 0, 0);
  [(MSDHelperAgent *)v2 setXpc_conn:mach_service];

  v5 = [(MSDHelperAgent *)v2 xpc_conn];

  if (!v5)
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DC4F8(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    goto LABEL_7;
  }
  v6 = [(MSDHelperAgent *)v2 xpc_conn];
  xpc_connection_set_event_handler(v6, &stru_100153FD8);

  v7 = [(MSDHelperAgent *)v2 xpc_conn];
  xpc_connection_resume(v7);

  v8 = v2;
LABEL_8:

  return v8;
}

- (BOOL)updateSignedManifest
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[MSDHelperAgent updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "updateSignedManifest");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[MSDHelperAgent updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = xpc_dictionary_get_BOOL(v5, "result");
  return v7;
}

- (BOOL)migratePreferencesFile
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[MSDHelperAgent migratePreferencesFile]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "migratePreferencesFile:");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[MSDHelperAgent migratePreferencesFile]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = xpc_dictionary_get_BOOL(v5, "result");
  return v7;
}

- (BOOL)stageDeviceForUpdateProcess:(BOOL)a3
{
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[MSDHelperAgent stageDeviceForUpdateProcess:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v12, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v6, "ForBackgroundDownload", a3);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "command", "stageDeviceForUpdateProcess:");
  xpc_dictionary_set_value(v7, "payload", v6);
  v8 = [(MSDHelperAgent *)self sendXPCRequest:v7];
  int v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[MSDHelperAgent stageDeviceForUpdateProcess:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v12, 0xCu);
  }

  BOOL v10 = xpc_dictionary_get_BOOL(v8, "result");
  return v10;
}

- (BOOL)clearStagedDeviceAfterUpdateProcess
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    BOOL v10 = "-[MSDHelperAgent clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "clearStagedDeviceAfterUpdateProcess");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  xpc_object_t v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    BOOL v10 = "-[MSDHelperAgent clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = xpc_dictionary_get_BOOL(v5, "result");
  return v7;
}

- (BOOL)prepareWorkDirectory:(id)a3 writableByNonRoot:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[MSDHelperAgent prepareWorkDirectory:writableByNonRoot:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v16, 0xCu);
  }

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = v6;
  BOOL v10 = (const char *)[v9 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v8, "Path", v10);
  xpc_dictionary_set_BOOL(v8, "WritableByNonRoot", a4);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v11, "command", "prepareWorkDirectory:");
  xpc_dictionary_set_value(v11, "payload", v8);
  int v12 = [(MSDHelperAgent *)self sendXPCRequest:v11];
  uint64_t v13 = sub_100068600();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[MSDHelperAgent prepareWorkDirectory:writableByNonRoot:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v16, 0xCu);
  }

  BOOL v14 = xpc_dictionary_get_BOOL(v12, "result");
  return v14;
}

- (BOOL)removeWorkDirectory:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];

  LOBYTE(self) = -[MSDHelperAgent removeWorkDirectories:](self, "removeWorkDirectories:", v5, v7);
  return (char)self;
}

- (BOOL)removeWorkDirectories:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[MSDHelperAgent removeWorkDirectories:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", buf, 0xCu);
  }

  xpc_object_t v6 = xpc_array_create(0, 0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        xpc_object_t v13 = xpc_string_create((const char *)[v12 UTF8String]);
        xpc_array_append_value(v6, v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "command", "removeWorkDirectory:");
  xpc_dictionary_set_value(v14, "payload", v6);
  uint64_t v15 = [(MSDHelperAgent *)self sendXPCRequest:v14];
  int v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[MSDHelperAgent removeWorkDirectories:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  BOOL v17 = xpc_dictionary_get_BOOL(v15, "result");
  return v17;
}

- (id)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = sub_100068600();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v49 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
    __int16 v50 = 2114;
    id v51 = v12;
    __int16 v52 = 2114;
    id v53 = v13;
    __int16 v54 = 2114;
    id v55 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: entered for component: %{public}@ of type: %{public}@ root path: %{public}@", buf, 0x2Au);
  }

  objc_super v18 = +[NSFileManager defaultManager];
  unsigned int v19 = [v18 fileExistsAtPath:v16];

  v45 = v12;
  v46 = v16;
  if (v19)
  {
    id v44 = v14;
    long long v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = (const char *)v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device manifest already exists at path: %{public}@; Skipping XPC request.",
        buf,
        0xCu);
    }
    id v40 = v13;
    id v42 = v15;

    xpc_object_t v21 = 0;
    xpc_object_t v22 = 0;
    v23 = 0;
    goto LABEL_9;
  }
  xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v22, "ComponentID", (const char *)[v12 cStringUsingEncoding:4]);
  xpc_dictionary_set_string(v22, "ComponentType", (const char *)[v13 cStringUsingEncoding:4]);
  xpc_dictionary_set_string(v22, "RootPath", (const char *)[v14 cStringUsingEncoding:4]);
  xpc_dictionary_set_string(v22, "UserHomePath", (const char *)[v15 cStringUsingEncoding:4]);
  xpc_dictionary_set_string(v22, "SavePath", (const char *)[v16 cStringUsingEncoding:4]);
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v21, "command", "createDeviceManifest:");
  xpc_dictionary_set_value(v21, "payload", v22);
  v23 = [(MSDHelperAgent *)self sendXPCRequest:v21];
  if (xpc_dictionary_get_BOOL(v23, "result"))
  {
    id v42 = v15;
    id v44 = v14;
    id v40 = v13;
LABEL_9:
    v24 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16, v40, v42);
    id v47 = 0;
    id v25 = +[NSDictionary dictionaryWithContentsOfURL:v24 error:&v47];
    id v26 = v47;

    if (!v25)
    {
      v27 = sub_100068600();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000DC5CC((uint64_t)v46, v26, v27);
      }

      id v25 = objc_alloc_init((Class)NSDictionary);
    }

    id v13 = v41;
    v28 = v43;
    id v14 = v44;
    goto LABEL_17;
  }
  v29 = sub_100068600();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_1000DC690(v29, v30, v31, v32, v33, v34, v35, v36);
  }
  v28 = v15;

  id v25 = objc_alloc_init((Class)NSDictionary);
LABEL_17:
  v37 = [[MSDManifest alloc] initWithDictionary:v25];
  [(MSDManifest *)v37 setRootPath:v14];
  v38 = sub_100068600();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  return v37;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[MSDHelperAgent fileExistsAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v13, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "command", "fileExistsAtPath:");
  id v7 = v4;
  id v8 = (const char *)[v7 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v6, "payload", v8);
  id v9 = [(MSDHelperAgent *)self sendXPCRequest:v6];
  uint64_t v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[MSDHelperAgent fileExistsAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v13, 0xCu);
  }

  BOOL v11 = xpc_dictionary_get_BOOL(v9, "result");
  return v11;
}

- (BOOL)removeFileAtPath:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[MSDHelperAgent removeFileAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(MSDHelperAgent *)self removeWorkDirectory:v4];
  return v6;
}

- (id)readPlistFile:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[MSDHelperAgent readPlistFile:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v13, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "command", "readPlistFile:outContent:");
  id v7 = v4;
  int v8 = (const char *)[v7 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v6, "payload", v8);
  id v9 = [(MSDHelperAgent *)self sendXPCRequest:v6];
  uint64_t v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[MSDHelperAgent readPlistFile:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v13, 0xCu);
  }

  if (xpc_dictionary_get_BOOL(v9, "result"))
  {
    BOOL v11 = +[NSDictionary dictionaryFromXPCDictionary:v9 withDataFromKey:"payload"];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    xpc_object_t v21 = "-[MSDHelperAgent touchFile:fileAttributes:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v20, 0xCu);
  }

  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  id v10 = v7;
  BOOL v11 = (const char *)[v10 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v9, "FilePath", v11);
  id v12 = [v6 objectForKey:@"FileOwnerName"];
  int v13 = [v6 objectForKey:@"FileGroupOwnerName"];
  id v14 = [v6 objectForKey:@"FilePosixPermissions"];

  if (v12) {
    xpc_dictionary_set_string(v9, "FileOwnerName", (const char *)[v12 UTF8String]);
  }
  if (v13) {
    xpc_dictionary_set_string(v9, "FileGroupOwnerName", (const char *)[v13 UTF8String]);
  }
  if (v14) {
    xpc_dictionary_set_int64(v9, "FilePosixPermissions", (int)[v14 shortValue]);
  }
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "command", "touchFile:");
  xpc_dictionary_set_value(v15, "payload", v9);
  id v16 = [(MSDHelperAgent *)self sendXPCRequest:v15];
  BOOL v17 = sub_100068600();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    xpc_object_t v21 = "-[MSDHelperAgent touchFile:fileAttributes:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v20, 0xCu);
  }

  BOOL v18 = xpc_dictionary_get_BOOL(v16, "result");
  return v18;
}

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000DC7F8(v11);
  }

  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  id v13 = v8;
  xpc_dictionary_set_string(v12, "FilePath", (const char *)[v13 cStringUsingEncoding:4]);
  id v14 = v10;
  xpc_object_t v15 = (const char *)[v14 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v12, "StatingPath", v15);
  if (v9 && [v9 length])
  {
    id v16 = v9;
    xpc_dictionary_set_data(v12, "ExpectedHash", [v16 bytes], (size_t)[v16 length]);
  }
  xpc_dictionary_set_BOOL(v12, "CorrectOwnership", 1);
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v17, "command", "cloneFile:");
  xpc_dictionary_set_value(v17, "payload", v12);
  BOOL v18 = [(MSDHelperAgent *)self sendXPCRequest:v17];
  BOOL v19 = xpc_dictionary_get_BOOL(v18, "result");
  if (!v19)
  {
    xpc_object_t v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000DC78C((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
    }
  }
  int v20 = sub_100068600();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1000DC708(v20);
  }

  return v19;
}

- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6
{
  int64_t length = a4.length;
  int64_t location = a4.location;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315138;
    uint64_t v26 = "-[MSDHelperAgent restoreBackupAttributesUnder:range:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v25, 0xCu);
  }

  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  id v16 = v13;
  xpc_object_t v17 = (const char *)[v16 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v15, "StagingRootPath", v17);
  xpc_dictionary_set_int64(v15, "Location", location);
  xpc_dictionary_set_int64(v15, "Length", length);
  id v18 = [v12 integerValue];

  xpc_dictionary_set_int64(v15, "ManifestUID", (int64_t)v18);
  id v19 = [v11 integerValue];

  xpc_dictionary_set_int64(v15, "DeviceUID", (int64_t)v19);
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v20, "command", "restoreBackupAttributes:");
  xpc_dictionary_set_value(v20, "payload", v15);
  xpc_object_t v21 = [(MSDHelperAgent *)self sendXPCRequest:v20];
  xpc_object_t v22 = sub_100068600();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315138;
    uint64_t v26 = "-[MSDHelperAgent restoreBackupAttributesUnder:range:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v25, 0xCu);
  }

  BOOL v23 = xpc_dictionary_get_BOOL(v21, "result");
  return v23;
}

- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  xpc_object_t v17 = sub_100068600();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136315138;
    uint64_t v33 = "-[MSDHelperAgent restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v32, 0xCu);
  }

  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  id v19 = v16;
  xpc_object_t v20 = (const char *)[v19 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v18, "StagingRootPath", v20);
  id v21 = v15;
  xpc_object_t v22 = (const char *)[v21 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v18, "ContentType", v22);
  id v23 = v14;
  uint64_t v24 = (const char *)[v23 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v18, "Identifier", v24);
  id v25 = [v13 integerValue];

  xpc_dictionary_set_int64(v18, "ManifestUID", (int64_t)v25);
  id v26 = [v12 integerValue];

  xpc_dictionary_set_int64(v18, "DeviceUID", (int64_t)v26);
  xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v27, "command", "restoreAppDataAttributes:");
  xpc_dictionary_set_value(v27, "payload", v18);
  uint64_t v28 = [(MSDHelperAgent *)self sendXPCRequest:v27];
  v29 = sub_100068600();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136315138;
    uint64_t v33 = "-[MSDHelperAgent restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v32, 0xCu);
  }

  BOOL v30 = xpc_dictionary_get_BOOL(v28, "result");
  return v30;
}

- (BOOL)deleteNvram:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[MSDHelperAgent deleteNvram:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v13, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "command", "deleteNvram:");
  id v7 = v4;
  id v8 = (const char *)[v7 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v6, "payload", v8);
  id v9 = [(MSDHelperAgent *)self sendXPCRequest:v6];
  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[MSDHelperAgent deleteNvram:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v13, 0xCu);
  }

  BOOL v11 = xpc_dictionary_get_BOOL(v9, "result");
  return v11;
}

- (BOOL)writeNvram:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    xpc_object_t v20 = "-[MSDHelperAgent writeNvram:withValue:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v19, 0xCu);
  }

  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  id v10 = v7;
  BOOL v11 = (const char *)[v10 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v9, "Name", v11);
  id v12 = v6;
  int v13 = (const char *)[v12 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v9, "Value", v13);
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "command", "writeNvram:");
  xpc_dictionary_set_value(v14, "payload", v9);
  id v15 = [(MSDHelperAgent *)self sendXPCRequest:v14];
  id v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    xpc_object_t v20 = "-[MSDHelperAgent writeNvram:withValue:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v19, 0xCu);
  }

  BOOL v17 = xpc_dictionary_get_BOOL(v15, "result");
  return v17;
}

- (BOOL)manageDataVolume:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[MSDHelperAgent manageDataVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v14, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "Target", "Data");
  id v7 = v4;
  id v8 = (const char *)[v7 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v6, "Operation", v8);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "command", "manageVolume:");
  xpc_dictionary_set_value(v9, "payload", v6);
  id v10 = [(MSDHelperAgent *)self sendXPCRequest:v9];
  BOOL v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[MSDHelperAgent manageDataVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v14, 0xCu);
  }

  BOOL v12 = xpc_dictionary_get_BOOL(v10, "result");
  return v12;
}

- (BOOL)manageDemoVolume:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[MSDHelperAgent manageDemoVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v14, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "Target", "Demo");
  id v7 = v4;
  id v8 = (const char *)[v7 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v6, "Operation", v8);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "command", "manageVolume:");
  xpc_dictionary_set_value(v9, "payload", v6);
  id v10 = [(MSDHelperAgent *)self sendXPCRequest:v9];
  BOOL v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[MSDHelperAgent manageDemoVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v14, 0xCu);
  }

  BOOL v12 = xpc_dictionary_get_BOOL(v10, "result");
  return v12;
}

- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    xpc_object_t v20 = "-[MSDHelperAgent manageUserVolume:forUser:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v19, 0xCu);
  }

  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "Target", "User");
  id v10 = v7;
  BOOL v11 = (const char *)[v10 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v9, "Operation", v11);
  id v12 = v6;
  int v13 = (const char *)[v12 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v9, "UserName", v13);
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "command", "manageVolume:");
  xpc_dictionary_set_value(v14, "payload", v9);
  id v15 = [(MSDHelperAgent *)self sendXPCRequest:v14];
  id v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    xpc_object_t v20 = "-[MSDHelperAgent manageUserVolume:forUser:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v19, 0xCu);
  }

  BOOL v17 = xpc_dictionary_get_BOOL(v15, "result");
  return v17;
}

- (BOOL)disableLaunchdServicesForWatch
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDHelperAgent disableLaunchdServicesForWatch]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "disableLaunchdServicesForWatch:");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDHelperAgent disableLaunchdServicesForWatch]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = xpc_dictionary_get_BOOL(v5, "result");
  return v7;
}

- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v10 count:1];

  LOBYTE(v7) = -[MSDHelperAgent moveStagingsToFinal:finalPath:](self, "moveStagingsToFinal:finalPath:", v8, v6, v10);
  return (char)v7;
}

- (BOOL)moveStagingsToFinal:(id)a3 finalPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v30 = "-[MSDHelperAgent moveStagingsToFinal:finalPath:]";
    __int16 v31 = 2114;
    id v32 = v6;
    __int16 v33 = 2114;
    id v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s entered.  stagingPaths:  %{public}@ - finalPath:  %{public}@", buf, 0x20u);
  }

  xpc_object_t v9 = xpc_array_create(0, 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        xpc_object_t v16 = xpc_string_create([v15 UTF8String]);
        xpc_array_append_value(v9, v16);
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v17, "StagingPaths", v9);
  id v18 = v7;
  xpc_dictionary_set_string(v17, "FinalPath", (const char *)[v18 cStringUsingEncoding:4]);
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v19, "command", "moveStagingToFinal:");
  xpc_dictionary_set_value(v19, "payload", v17);
  xpc_object_t v20 = [(MSDHelperAgent *)self sendXPCRequest:v19];
  id v21 = sub_100068600();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v30 = "-[MSDHelperAgent moveStagingsToFinal:finalPath:]";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  BOOL v22 = xpc_dictionary_get_BOOL(v20, "result");
  return v22;
}

- (BOOL)switchToBackupFolder
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDHelperAgent switchToBackupFolder]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s entered.", (uint8_t *)&v9, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "switchToBackupFolder:");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDHelperAgent switchToBackupFolder]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = xpc_dictionary_get_BOOL(v5, "result");
  return v7;
}

- (BOOL)reboot
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDHelperAgent reboot]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "reboot:");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDHelperAgent reboot]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = xpc_dictionary_get_BOOL(v5, "result");
  return v7;
}

- (BOOL)quitHelper
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[MSDHelperAgent quitHelper]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v10, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "quitHelper:");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[MSDHelperAgent quitHelper]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = v5 == &_xpc_error_connection_invalid || v5 == &_xpc_error_connection_interrupted;
  return v8;
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[MSDHelperAgent collectDemoLogsToFolder:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v14, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  id v7 = v4;
  BOOL v8 = (const char *)[v7 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v6, "logFileDirectory", v8);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "command", "collectDemoLogsToFolder:");
  xpc_dictionary_set_value(v9, "payload", v6);
  int v10 = [(MSDHelperAgent *)self sendXPCRequest:v9];
  id v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[MSDHelperAgent collectDemoLogsToFolder:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v14, 0xCu);
  }

  BOOL v12 = xpc_dictionary_get_BOOL(v10, "result");
  return v12;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    int v14 = "-[MSDHelperAgent preserveBluetoothFileToShelter:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s entered.  sourcePath:  %{public}@", (uint8_t *)&v13, 0x16u);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  id v7 = v4;
  xpc_dictionary_set_string(v6, "SourcePath", (const char *)[v7 cStringUsingEncoding:4]);
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "preserveBluetoothFileToShelter:");
  xpc_dictionary_set_value(v8, "payload", v6);
  xpc_object_t v9 = [(MSDHelperAgent *)self sendXPCRequest:v8];
  int v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    int v14 = "-[MSDHelperAgent preserveBluetoothFileToShelter:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v13, 0xCu);
  }

  BOOL v11 = xpc_dictionary_get_BOOL(v9, "result");
  return v11;
}

- (BOOL)restartBluetooth
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[MSDHelperAgent restartBluetooth]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "restartBluetooth:");
  v5 = [(MSDHelperAgent *)self sendXPCRequest:v4];
  xpc_object_t v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[MSDHelperAgent restartBluetooth]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = xpc_dictionary_get_BOOL(v5, "result");
  return v7;
}

- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4
{
  id v6 = a3;
  BOOL v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    id v16 = "-[MSDHelperAgent setComputerNameAndHostname:encoding:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 1026;
    unsigned int v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:  entered - computerName:  %{public}@ - encoding:  %{public}x", (uint8_t *)&v15, 0x1Cu);
  }

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = v6;
  xpc_dictionary_set_string(v8, "ComputerName", (const char *)[v9 cStringUsingEncoding:4]);
  xpc_dictionary_set_uint64(v8, "Encoding", a4);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "command", "setComputerNameAndHostname:");
  xpc_dictionary_set_value(v10, "payload", v8);
  BOOL v11 = [(MSDHelperAgent *)self sendXPCRequest:v10];
  BOOL v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[MSDHelperAgent setComputerNameAndHostname:encoding:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  BOOL v13 = xpc_dictionary_get_BOOL(v11, "result");
  return v13;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  dispatch_semaphore_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000DC87C(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    __int16 v19 = "-[MSDHelperAgent preserveSecondPartyAppDataToShelter:withReturnErrorMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:  entered.", (uint8_t *)&v18, 0xCu);
  }

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "preserveSecondPartyAppDataToShelter:outErrorDict:");
  id v9 = v6;
  uint64_t v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, "payload", v10);
  BOOL v11 = [(MSDHelperAgent *)self sendXPCRequest:v8];
  BOOL v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    __int16 v19 = "-[MSDHelperAgent preserveSecondPartyAppDataToShelter:withReturnErrorMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v18, 0xCu);
  }

  BOOL v13 = xpc_dictionary_get_BOOL(v11, "result");
  BOOL v14 = v13;
  if (a4 && !v13)
  {
    int v15 = +[NSDictionary dictionaryFromXPCDictionary:v11 withDataFromKey:"payload"];
    id v16 = v15;
    if (v15)
    {
      *a4 = [v15 objectForKey:@"ErrorMsg"];
    }
  }
  return v14;
}

- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136316162;
    long long v26 = "-[MSDHelperAgent setPreferencesForKey:withValue:forApplication:andUser:]";
    __int16 v27 = 2114;
    id v28 = v10;
    __int16 v29 = 2114;
    id v30 = v11;
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v33 = 2114;
    id v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: entered - key:  %{public}@ - value:  %{public}@ - appId:  %{public}@ - user:  %{public}@", (uint8_t *)&v25, 0x34u);
  }

  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  id v16 = v10;
  xpc_dictionary_set_string(v15, "Key", (const char *)[v16 cStringUsingEncoding:4]);
  __int16 v17 = [v11 createXPCDictionary];
  xpc_dictionary_set_value(v15, "Value", v17);

  id v18 = v12;
  xpc_dictionary_set_string(v15, "ApplicationId", (const char *)[v18 cStringUsingEncoding:4]);
  id v19 = v13;
  xpc_dictionary_set_string(v15, "UserName", (const char *)[v19 cStringUsingEncoding:4]);
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v20, "command", "setPreferences:");
  xpc_dictionary_set_value(v20, "payload", v15);
  id v21 = [(MSDHelperAgent *)self sendXPCRequest:v20];
  BOOL v22 = xpc_dictionary_get_BOOL(v21, "result");
  id v23 = sub_100068600();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315394;
    long long v26 = "-[MSDHelperAgent setPreferencesForKey:withValue:forApplication:andUser:]";
    __int16 v27 = 1024;
    LODWORD(v28) = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: will return with rval %d", (uint8_t *)&v25, 0x12u);
  }

  return v22;
}

- (id)sendXPCRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSDHelperAgent *)self xpc_sema];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(MSDHelperAgent *)self xpc_conn];
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

  xpc_object_t v8 = [(MSDHelperAgent *)self xpc_sema];
  dispatch_semaphore_signal(v8);

  return v7;
}

- (OS_xpc_object)xpc_conn
{
  return self->_xpc_conn;
}

- (void)setXpc_conn:(id)a3
{
}

- (OS_dispatch_semaphore)xpc_sema
{
  return self->_xpc_sema;
}

- (void)setXpc_sema:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpc_sema, 0);

  objc_storeStrong((id *)&self->_xpc_conn, 0);
}

@end