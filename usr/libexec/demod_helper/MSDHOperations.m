@interface MSDHOperations
+ (id)sharedInstance;
- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6;
- (BOOL)collectDemoLogsToFolder:(id)a3;
- (BOOL)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7;
- (BOOL)deleteNvram:(id)a3;
- (BOOL)destroyWorkContainerInUserHome;
- (BOOL)disableLaunchdServicesForWatch;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)generateLogsForPredicate:(id)a3 toFile:(id)a4;
- (BOOL)manageDataVolume:(id)a3;
- (BOOL)manageDemoVolume:(id)a3;
- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4;
- (BOOL)migratePreferencesFile;
- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)moveUserHomeStagingToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)prepareDirectory:(id)a3 writableByNonRoot:(BOOL)a4;
- (BOOL)prepareWorkContainerInUserHome:(BOOL)a3;
- (BOOL)preserveBluetoothFileToShelter:(id)a3;
- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4;
- (BOOL)quitHelper;
- (BOOL)reboot;
- (BOOL)removeDirectory:(id)a3;
- (BOOL)restartBluetooth;
- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7;
- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6;
- (BOOL)runPreflightChecksOnSecondPartyAppData:(id)a3 withReturnErrorMsg:(id *)a4;
- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4;
- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6;
- (BOOL)switchToBackupFolder;
- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4;
- (BOOL)updateSignedManifest;
- (BOOL)writeDictionary:(id)a3 toFile:(id)a4;
- (BOOL)writeNVRam:(id)a3 withValue:(id)a4;
- (MSDHOperations)init;
- (MSDSignedManifest)signedManifest;
- (OS_os_transaction)transaction;
- (id)getPathInUserHomeDirectory:(id)a3;
- (id)readPlistFile:(id)a3;
- (void)dealloc;
- (void)setSignedManifest:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MSDHOperations

+ (id)sharedInstance
{
  if (qword_100057E60 != -1) {
    dispatch_once(&qword_100057E60, &stru_10004CF68);
  }
  v2 = (void *)qword_100057E58;

  return v2;
}

- (MSDHOperations)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDHOperations;
  v2 = [(MSDHOperations *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(MSDHOperations *)self setSignedManifest:0];
  v3.receiver = self;
  v3.super_class = (Class)MSDHOperations;
  [(MSDHOperations *)&v3 dealloc];
}

- (MSDSignedManifest)signedManifest
{
  signedManifest = self->_signedManifest;
  if (!signedManifest)
  {
    [(MSDHOperations *)self updateSignedManifest];
    signedManifest = self->_signedManifest;
  }

  return signedManifest;
}

- (BOOL)updateSignedManifest
{
  objc_super v3 = (void *)os_transaction_create();
  [(MSDHOperations *)self setTransaction:v3];

  v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[MSDHOperations updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - Loading signed manifest.", (uint8_t *)&v15, 0xCu);
  }

  v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist"];

  if (v6)
  {
    v7 = +[MSDSignedManifestFactory createSignedManifestFromManifestFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist"];
    signedManifest = self->_signedManifest;
    self->_signedManifest = v7;

    if (self->_signedManifest) {
      return 1;
    }
    v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031020(v10, v13, v14);
    }
  }
  else
  {
    v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000310B0(v10, v11, v12);
    }
  }

  return 0;
}

- (BOOL)migratePreferencesFile
{
  v2 = +[NSFileManager defaultManager];
  objc_super v3 = [@"/var/root/Library/Preferences/" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo.plist"];
  v4 = [@"/var/mobile/Library/Preferences/" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo.plist"];
  if (![v2 fileExistsAtPath:v3]
    || ([v2 fileExistsAtPath:v4] & 1) != 0)
  {
    id v9 = 0;
    v7 = 0;
    BOOL v10 = 0;
    goto LABEL_6;
  }
  id v14 = 0;
  unsigned __int8 v5 = [v2 moveItemAtPath:v3 toPath:v4 error:&v14];
  id v6 = v14;
  if ((v5 & 1) == 0)
  {
    uint64_t v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000311A8();
    }
    v7 = 0;
    goto LABEL_14;
  }
  v15[0] = NSFileOwnerAccountName;
  v15[1] = NSFileGroupOwnerAccountName;
  v16[0] = @"mobile";
  v16[1] = @"mobile";
  v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = v6;
  unsigned __int8 v8 = [v2 setAttributes:v7 ofItemAtPath:v4 error:&v13];
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    uint64_t v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100031140();
    }
    id v6 = v9;
LABEL_14:

    BOOL v10 = 0;
    id v9 = v6;
    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)prepareDirectory:(id)a3 writableByNonRoot:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    id v7 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  id v20 = 0;
  unsigned __int8 v14 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v15 = v20;
  id v9 = v15;
  if ((v14 & 1) == 0)
  {
    id v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100031350();
    }
    goto LABEL_17;
  }
  id v7 = v15;
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  id v19 = v7;
  unsigned __int8 v8 = [v6 attributesOfItemAtPath:v5 error:&v19];
  id v9 = v19;

  if (!v8)
  {
    id v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100031218();
    }
LABEL_17:
    uint64_t v11 = 0;
LABEL_18:

    BOOL v16 = 0;
    id v7 = v9;
    goto LABEL_12;
  }
  BOOL v10 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)[v8 filePosixPermissions] | 0x3Fu);
  uint64_t v11 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSFilePosixPermissions, 0);

  id v18 = v9;
  unsigned __int8 v12 = [v6 setAttributes:v11 ofItemAtPath:v5 error:&v18];
  id v7 = v18;

  if ((v12 & 1) == 0)
  {
    id v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000312B4();
    }
    id v9 = v7;
    goto LABEL_18;
  }
LABEL_11:
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (BOOL)removeDirectory:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSFileManager defaultManager];
  if ([v4 fileExistsAtPath:v3]) {
    unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:0];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(MSDHOperations *)self signedManifest];

  if (!v17)
  {
    v26 = sub_100027250();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000313EC(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_11;
  }
  id v18 = [(MSDHOperations *)self signedManifest];
  id v19 = [v18 getManifestDataFromSection:v13 forIdentifier:v12];

  if (!v19)
  {
    v26 = sub_100027250();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100031464();
    }
LABEL_11:
    id v19 = 0;
    id v20 = 0;
    v21 = 0;
LABEL_14:

    goto LABEL_15;
  }
  id v20 = [[MSDManifest alloc] initWithDictionary:v19 andUserHomePath:v15];
  [(MSDManifest *)v20 setRootPath:v14];
  v21 = objc_alloc_init(MSDManifest);
  [(MSDManifest *)v21 setRootPath:v14];
  if (![(MSDManifest *)v21 addFilesUsingSourceManifest:v20])
  {
    v26 = sub_100027250();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000314F4(v26, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_14;
  }
  v22 = [(MSDManifest *)v21 dict];
  unsigned __int8 v23 = [(MSDHOperations *)self writeDictionary:v22 toFile:v16];

  if ((v23 & 1) == 0)
  {
LABEL_15:
    BOOL v24 = 0;
    goto LABEL_6;
  }
  BOOL v24 = 1;
LABEL_6:

  return v24;
}

- (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  id v5 = a3;
  id v6 = +[NSOutputStream outputStreamToFileAtPath:a4 append:0];
  [v6 open];
  id v11 = 0;
  uint64_t v7 = +[NSPropertyListSerialization writePropertyList:v5 toStream:v6 format:200 options:0 error:&v11];

  id v8 = v11;
  [v6 close];

  if (v7 <= 0)
  {
    BOOL v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003156C(v8, v10);
    }
  }
  return v7 > 0;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

- (id)readPlistFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSURL fileURLWithPath:v3];
  id v9 = 0;
  unsigned __int8 v5 = +[NSDictionary dictionaryWithContentsOfURL:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    id v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000315F8();
    }
  }

  return v5;
}

- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSFileManager defaultManager];
  id v8 = v7;
  if (!v5)
  {
    id v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100031684();
    }
    goto LABEL_9;
  }
  if (([v7 createFileAtPath:v5 contents:0 attributes:v6] & 1) == 0)
  {
    id v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000316B8();
    }
LABEL_9:

    BOOL v9 = 0;
    goto LABEL_4;
  }
  BOOL v9 = 1;
LABEL_4:

  return v9;
}

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6
{
  uint64_t v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[NSFileManager defaultManager];
  LOBYTE(v6) = [v12 cloneFile:v11 to:v10 expectingHash:v9 correctOwnership:v6];

  return v6;
}

- (BOOL)deleteNvram:(id)a3
{
  kern_return_t v6;
  BOOL v7;
  NSObject *v9;
  NSObject *v10;
  mach_port_t mainPort;

  id v3 = a3;
  mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    id v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100031788();
    }
    goto LABEL_10;
  }
  io_registry_entry_t v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v4)
  {
    id v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100031720();
    }
LABEL_10:

    uint64_t v7 = 0;
    goto LABEL_5;
  }
  io_object_t v5 = v4;
  uint64_t v6 = IORegistryEntrySetCFProperty(v4, @"IONVRAM-DELETE-PROPERTY", v3);
  uint64_t v7 = v6 == 0;
  if (v6)
  {
    id v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031754();
    }
  }
  IOObjectRelease(v5);
LABEL_5:

  return v7;
}

- (BOOL)writeNVRam:(id)a3 withValue:(id)a4
{
  io_object_t v5 = (__CFString *)a3;
  id v6 = a4;
  mach_port_t mainPort = 0;
  BOOL v7 = 0;
  if ([(__CFString *)v5 isEqualToString:@"ownership-warning"])
  {
    if (IOMasterPort(bootstrap_port, &mainPort))
    {
      id v11 = sub_100027250();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100031788();
      }
    }
    else
    {
      io_registry_entry_t v8 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
      if (v8)
      {
        io_object_t v9 = v8;
        if (IORegistryEntrySetCFProperty(v8, v5, [v6 dataUsingEncoding:4]))
        {
          id v12 = sub_100027250();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000317BC();
          }
        }
        else
        {
          if (!IORegistryEntrySetCFProperty(v9, @"IONVRAM-SYNCNOW-PROPERTY", v5))
          {
            BOOL v7 = 1;
LABEL_7:
            IOObjectRelease(v9);
            goto LABEL_8;
          }
          id v12 = sub_100027250();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_100031754();
          }
        }

        BOOL v7 = 0;
        goto LABEL_7;
      }
      id v11 = sub_100027250();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100031720();
      }
    }

    BOOL v7 = 0;
  }
LABEL_8:

  return v7;
}

- (BOOL)manageDataVolume:(id)a3
{
  id v3 = a3;
  io_registry_entry_t v4 = +[MSDHVolumeManager sharedInstance];
  if ([v3 isEqualToString:@"CreateSnapshot"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"DeleteSnapshot"])
  {
    CFStringRef v5 = @"DeleteSnapshot";
    goto LABEL_5;
  }
  if ([v3 isEqualToString:@"RevertSnapshot"])
  {
    if ([v4 manageSnapshot:@"RevertSnapshot" forVolumeAt:@"/private/var"])
    {
      io_registry_entry_t v8 = objc_alloc_init(MSDHSnapshottedDataSaver);
      [(MSDHSnapshottedDataSaver *)v8 rescueDataToShelterFromSnapshottedVolumes];

      unsigned __int8 v6 = 1;
      goto LABEL_6;
    }
    goto LABEL_22;
  }
  if (![v3 isEqualToString:@"CommitSnapshot"])
  {
    if ([v3 isEqualToString:@"MountSnapshot"])
    {
      io_object_t v9 = +[NSFileManager defaultManager];
      id v17 = 0;
      unsigned __int8 v10 = [v9 createDirectoryAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" withIntermediateDirectories:1 attributes:0 error:&v17];
      id v11 = v17;
      if (v10)
      {
        unsigned __int8 v6 = [v4 mountSnapshotAt:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" forVolumeAt:@"/private/var"];
      }
      else
      {
        id v14 = sub_100027250();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000317F0(v11);
        }

        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      if (![v3 isEqualToString:@"UnmountSnapshot"])
      {
        id v13 = sub_100027250();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v19 = v3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unknown volume operation: %{public}@", buf, 0xCu);
        }

        goto LABEL_22;
      }
      io_object_t v9 = +[NSFileManager defaultManager];
      unsigned __int8 v6 = [v4 unmountSnapshotAt:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var"];
      id v16 = 0;
      unsigned __int8 v12 = [v9 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot" error:&v16];
      id v11 = v16;
      if ((v12 & 1) == 0)
      {
        id v15 = sub_100027250();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100031884(v11);
        }
      }
    }

    goto LABEL_6;
  }
  if (![v4 manageSnapshot:@"DeleteSnapshot" forVolumeAt:@"/private/var"])
  {
LABEL_22:
    unsigned __int8 v6 = 0;
    goto LABEL_6;
  }
LABEL_2:
  CFStringRef v5 = @"CreateSnapshot";
LABEL_5:
  unsigned __int8 v6 = [v4 manageSnapshot:v5 forVolumeAt:@"/private/var"];
LABEL_6:

  return v6;
}

- (BOOL)manageDemoVolume:(id)a3
{
  id v3 = a3;
  io_registry_entry_t v4 = +[MSDHVolumeManager sharedInstance];
  if ([v3 isEqualToString:@"Setup"])
  {
    unsigned __int8 v5 = [v4 setupDemoVolume];
LABEL_5:
    BOOL v6 = v5;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"Delete"])
  {
    unsigned __int8 v5 = [v4 deleteDemoVolume];
    goto LABEL_5;
  }
  BOOL v7 = sub_100027250();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknown volume operation: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4
{
  unsigned __int8 v5 = (__CFString *)a3;
  id v6 = a4;
  BOOL v7 = +[MSDHVolumeManager sharedInstance];
  if (!v6)
  {
    io_registry_entry_t v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100031918();
    }
    goto LABEL_23;
  }
  if (([(__CFString *)v5 isEqualToString:@"CreateSnapshot"] & 1) == 0
    && ([(__CFString *)v5 isEqualToString:@"DeleteSnapshot"] & 1) == 0
    && ![(__CFString *)v5 isEqualToString:@"RevertSnapshot"])
  {
    if ([(__CFString *)v5 isEqualToString:@"CommitSnapshot"])
    {
      io_registry_entry_t v8 = [v7 userHomePath];
      if (v8)
      {
        if ([v7 manageSnapshot:@"DeleteSnapshot" forVolumeAt:v8])
        {
          CFStringRef v10 = @"CreateSnapshot";
          int v9 = v7;
          goto LABEL_7;
        }
LABEL_23:
        unsigned __int8 v11 = 0;
        goto LABEL_8;
      }
      id v15 = sub_100027250();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    if ([(__CFString *)v5 isEqualToString:@"MountSnapshot"])
    {
      io_registry_entry_t v8 = [v7 userHomePath];
      if (v8)
      {
        id v13 = [@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" stringByAppendingPathComponent:v6];
        unsigned __int8 v14 = [v7 mountSnapshotAt:v13 forVolumeAt:v8];
LABEL_19:
        unsigned __int8 v11 = v14;
LABEL_20:

        goto LABEL_8;
      }
      id v13 = sub_100027250();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
LABEL_34:
      }
        sub_10003194C();
    }
    else
    {
      if (![(__CFString *)v5 isEqualToString:@"UnmountSnapshot"])
      {
        io_registry_entry_t v8 = sub_100027250();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138543362;
          id v17 = v5;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown volume operation: %{public}@", (uint8_t *)&v16, 0xCu);
        }
        goto LABEL_23;
      }
      io_registry_entry_t v8 = [v7 userHomePath];
      if (v8)
      {
        id v13 = [@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" stringByAppendingPathComponent:v6];
        unsigned __int8 v14 = [v7 unmountSnapshotAt:v13];
        goto LABEL_19;
      }
      id v13 = sub_100027250();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }
    unsigned __int8 v11 = 0;
    goto LABEL_20;
  }
  io_registry_entry_t v8 = [v7 userHomePath];
  if (!v8)
  {
    id v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
LABEL_27:
    }
      sub_10003194C();
LABEL_28:

    goto LABEL_23;
  }
  int v9 = v7;
  CFStringRef v10 = v5;
LABEL_7:
  unsigned __int8 v11 = [v9 manageSnapshot:v10 forVolumeAt:v8];
LABEL_8:

  return v11;
}

- (BOOL)prepareWorkContainerInUserHome:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    unsigned __int8 v5 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata";
  }
  else
  {
    id v6 = +[MSDHVolumeManager sharedInstance];
    unsigned __int8 v5 = [v6 userHomePath];
  }
  BOOL v7 = [(__CFString *)v5 stringByAppendingPathComponent:@"/.MSDWorkContainer"];
  uint64_t v40 = [v7 stringByAppendingPathComponent:@"/MSD_staging"];
  uint64_t v39 = [v7 stringByAppendingPathComponent:@"/MSD_secondary_staging"];
  uint64_t v38 = [v7 stringByAppendingPathComponent:@"/MSD_stashed_staging"];
  uint64_t v37 = [v7 stringByAppendingPathComponent:@"/.backup"];
  io_registry_entry_t v8 = +[NSMutableArray array];
  int v9 = +[NSMutableArray array];
  v41 = +[NSFileManager defaultManager];
  v61[0] = NSFileOwnerAccountName;
  v61[1] = NSFileGroupOwnerAccountName;
  v62[0] = @"mobile";
  v62[1] = @"mobile";
  v61[2] = NSFilePosixPermissions;
  CFStringRef v10 = +[NSNumber numberWithShort:448];
  v62[2] = v10;
  unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];

  unsigned __int8 v12 = sub_100027250();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v58 = "-[MSDHOperations prepareWorkContainerInUserHome:]";
    __int16 v59 = 2114;
    v60 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", buf, 0x16u);
  }

  uint64_t v36 = v7;
  if (v3)
  {
    v56[0] = v7;
    id v13 = v39;
    v56[1] = v40;
    v56[2] = v39;
    unsigned __int8 v14 = v38;
    v56[3] = v38;
    id v15 = +[NSArray arrayWithObjects:v56 count:4];
    [v8 addObjectsFromArray:v15];

    v55 = v40;
    int v16 = &v55;
  }
  else
  {
    v54[0] = v7;
    id v13 = v39;
    v54[1] = v40;
    v54[2] = v39;
    unsigned __int8 v14 = v37;
    v54[3] = v37;
    id v17 = +[NSArray arrayWithObjects:v54 count:4];
    [v8 addObjectsFromArray:v17];

    v53 = v40;
    int v16 = &v53;
  }
  v16[1] = v13;
  void v16[2] = v14;
  id v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
  [v9 addObjectsFromArray:v18];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v19 = v9;
  id v20 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        [(MSDHOperations *)self removeDirectory:*(void *)(*((void *)&v47 + 1) + 8 * i)];
      }
      id v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v21);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v24 = v8;
  id v25 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v35 = v5;
    id v27 = 0;
    uint64_t v28 = *(void *)v44;
    while (2)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v27;
      do
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v24);
        }
        uint64_t v31 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v29);
        id v42 = v30;
        unsigned __int8 v32 = [v41 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:v11 error:&v42];
        id v27 = v42;

        if ((v32 & 1) == 0)
        {
          uint64_t v33 = sub_100027250();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_1000319B4();
          }

          goto LABEL_29;
        }
        uint64_t v29 = (char *)v29 + 1;
        uint64_t v30 = v27;
      }
      while (v26 != v29);
      id v26 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v26) {
        continue;
      }
      break;
    }
LABEL_29:

    unsigned __int8 v5 = v35;
  }
  else
  {
    unsigned __int8 v32 = 1;
  }

  return v32;
}

- (BOOL)destroyWorkContainerInUserHome
{
  BOOL v3 = +[MSDHVolumeManager sharedInstance];
  io_registry_entry_t v4 = [v3 userHomePath];

  unsigned __int8 v5 = [v4 stringByAppendingPathComponent:@"/.MSDWorkContainer"];
  id v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"/.MSDWorkContainer"];
  if (![(MSDHOperations *)self removeDirectory:v5])
  {
    int v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (![(MSDHOperations *)self removeDirectory:v6])
  {
    int v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
LABEL_8:
    }
      sub_100031A40();
LABEL_9:

    BOOL v7 = 0;
    goto LABEL_4;
  }
  BOOL v7 = 1;
LABEL_4:

  return v7;
}

- (BOOL)moveUserHomeStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  io_registry_entry_t v8 = +[NSFileManager defaultManager];
  int v9 = +[MSDHVolumeManager sharedInstance];
  CFStringRef v10 = [v9 userHomePath];

  unsigned __int8 v11 = [v7 stringByAppendingPathComponent:v10];

  id v32 = 0;
  unsigned __int8 v12 = [v8 attributesOfItemAtPath:v11 error:&v32];
  id v13 = v32;
  if (v12)
  {
    unsigned __int8 v14 = [v12 fileType];
    unsigned int v15 = [v14 isEqualToString:NSFileTypeSymbolicLink];

    if (v15)
    {
      int v16 = [(MSDHOperations *)self getPathInUserHomeDirectory:v6];
      id v31 = v13;
      id v17 = [v8 destinationOfSymbolicLinkAtPath:v11 error:&v31];
      id v18 = v31;

      id v19 = sub_100027250();
      id v20 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v11;
          __int16 v35 = 2114;
          uint64_t v36 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found valid wormhole in staging from %{public}@ to %{public}@", buf, 0x16u);
        }

        if (![(MSDHOperations *)self moveStagingToFinal:v17 finalPath:v16]) {
          goto LABEL_28;
        }
        id v21 = sub_100027250();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v11;
          __int16 v35 = 2114;
          uint64_t v36 = v16;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Creating new wormhole in staging from %{public}@ to %{public}@", buf, 0x16u);
        }

        id v30 = v18;
        unsigned __int8 v22 = [v8 removeItemAtPath:v11 error:&v30];
        id v23 = v30;

        if (v22)
        {
          id v29 = v23;
          unsigned __int8 v24 = [v8 createSymbolicLinkAtPath:v11 withDestinationPath:v16 error:&v29];
          id v18 = v29;

          if (v24)
          {

            BOOL v25 = 1;
LABEL_12:
            id v13 = v18;
            goto LABEL_16;
          }
          id v20 = sub_100027250();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = [v18 localizedDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v34 = v11;
            __int16 v35 = 2114;
            uint64_t v36 = v16;
            __int16 v37 = 2114;
            uint64_t v38 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Cannot create symlink from %{public}@ to %{public}@ - %{public}@", buf, 0x20u);
          }
        }
        else
        {
          id v20 = sub_100027250();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100031BC0();
          }
          id v18 = v23;
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        sub_100031B34();
      }

LABEL_28:
      BOOL v25 = 0;
      goto LABEL_12;
    }
    int v16 = sub_100027250();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v12 fileType];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v11;
      __int16 v35 = 2114;
      uint64_t v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wormhole in staging %{public}@ has unexpected file type - %{public}@", buf, 0x16u);
    }
    BOOL v25 = 1;
  }
  else
  {
    int v16 = sub_100027250();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100031AA8();
    }
    BOOL v25 = 0;
  }
LABEL_16:

  return v25;
}

- (BOOL)disableLaunchdServicesForWatch
{
  v2 = +[NSArray arrayWithObjects:@"com.apple.atc", @"com.apple.eventkitsyncd", @"com.apple.imautomatichistorydeletionagent", 0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v12 + 1) + 8 * (void)v6);
        [v7 UTF8String];
        int service_enabled = launch_get_service_enabled();
        if (service_enabled)
        {
          int v9 = service_enabled;
          CFStringRef v10 = sub_100027250();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = v7;
            __int16 v18 = 1024;
            int v19 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get status for launchd service '%{public}@' with error - %d", buf, 0x12u);
          }
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v4);
  }

  return 1;
}

- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v36 = v6;
  char v45 = 0;
  io_registry_entry_t v8 = +[NSFileManager defaultManager];
  int v9 = sub_100027250();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v48 = "-[MSDHOperations moveStagingToFinal:finalPath:]";
    __int16 v49 = 2114;
    id v50 = v5;
    __int16 v51 = 2114;
    id v52 = v36;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - stagingPath:  %{public}@ - finalPath:  %{public}@", buf, 0x20u);
  }

  if ([v8 fileExistsAtPath:v5 isDirectory:&v45]) {
    BOOL v10 = v45 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    obj = sub_100027250();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_100031CD8();
    }
    id v25 = 0;
    goto LABEL_38;
  }
  id v34 = v5;
  if ([v8 fileExistsAtPath:v36])
  {
    [v8 enumeratorAtPath:v5];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v11)
    {
      id v12 = v11;
      __int16 v35 = 0;
      uint64_t v13 = *(void *)v42;
      uint64_t v33 = v8;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          id v17 = [v7 stringByAppendingPathComponent:v15];
          if ([v8 fileExistsAtPath:v17])
          {
            __int16 v18 = [v36 stringByAppendingPathComponent:v15];
            int v19 = [v18 stringByDeletingLastPathComponent];
            if (([v8 fileExistsAtPath:v18] & 1) == 0
              && [v8 fileExistsAtPath:v19])
            {
              id v20 = sub_100027250();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                long long v48 = v17;
                __int16 v49 = 2114;
                id v50 = v18;
                _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Moving %{public}@ to %{public}@", buf, 0x16u);
              }

              id v40 = v35;
              unsigned __int8 v21 = [v8 moveItemAtPath:v17 toPath:v18 error:&v40];
              id v22 = v40;

              if ((v21 & 1) == 0)
              {
                id v29 = sub_100027250();
                id v25 = v22;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  id v31 = [v22 localizedDescription];
                  *(_DWORD *)buf = 138543874;
                  long long v48 = v17;
                  __int16 v49 = 2114;
                  id v50 = v18;
                  __int16 v51 = 2114;
                  id v52 = v31;
                  _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Cannot move %{public}@ to %{public}@ - %{public}@", buf, 0x20u);
                }
                id v30 = obj;
                io_registry_entry_t v8 = v33;
                id v7 = v34;
                goto LABEL_37;
              }
              __int16 v35 = v22;
              io_registry_entry_t v8 = v33;
              id v7 = v34;
            }
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      __int16 v35 = 0;
    }

    id v39 = v35;
    unsigned __int8 v27 = [v8 removeItemAtPath:v7 error:&v39];
    id v25 = v39;

    if (v27)
    {
      BOOL v26 = 1;
LABEL_31:
      id v7 = v34;
LABEL_32:

      goto LABEL_33;
    }
    id v30 = sub_100027250();
    id v7 = v34;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100031C4C();
    }
LABEL_37:

    goto LABEL_38;
  }
  id v23 = sub_100027250();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v48 = (const char *)v5;
    __int16 v49 = 2114;
    id v50 = v36;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Moving %{public}@ to %{public}@", buf, 0x16u);
  }

  id v38 = 0;
  unsigned __int8 v24 = [v8 moveItemAtPath:v5 toPath:v36 error:&v38];
  id v25 = v38;
  if ((v24 & 1) == 0)
  {
    obj = sub_100027250();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      BOOL v26 = 0;
      goto LABEL_31;
    }
    id v32 = [v25 localizedDescription];
    *(_DWORD *)buf = 138543874;
    long long v48 = (const char *)v5;
    __int16 v49 = 2114;
    id v50 = v36;
    __int16 v51 = 2114;
    id v52 = v32;
    _os_log_error_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "Could not move %{public}@ to %{public}@ with error - %{public}@", buf, 0x20u);

    id v7 = v5;
LABEL_38:
    BOOL v26 = 0;
    goto LABEL_32;
  }
  BOOL v26 = 1;
  id v7 = v5;
LABEL_33:

  return v26;
}

- (BOOL)switchToBackupFolder
{
  v2 = sub_100027250();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v32 = @"/private/var/.backup";
    __int16 v33 = 2114;
    CFStringRef v34 = @"/private/var/backup";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Renaming %{public}@ to %{public}@...", buf, 0x16u);
  }

  id v3 = (const std::__fs::filesystem::path *)[@"/private/var/.backup" fileSystemRepresentation];
  id v4 = (const std::__fs::filesystem::path *)[@"/private/var/backup" fileSystemRepresentation];
  rename(v3, v4, v5);
  if (!v6)
  {
    id v7 = +[NSFileManager defaultManager];
    int v9 = +[MSDHVolumeManager sharedInstance];
    BOOL v10 = [v9 userHomePath];

    id v11 = [v10 stringByAppendingPathComponent:@"/backup"];
    id v12 = [v11 stringByAppendingPathComponent:v10];
    uint64_t v13 = [@"/private/var/backup" stringByAppendingPathComponent:v10];
    id v30 = 0;
    unsigned __int8 v14 = [v7 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v30];
    id v15 = v30;
    id v16 = v15;
    if ((v14 & 1) == 0)
    {
      id v20 = sub_100027250();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100031EE0();
      }
      unsigned __int8 v21 = 0;
      goto LABEL_21;
    }
    id v29 = v15;
    id v17 = [v7 destinationOfSymbolicLinkAtPath:v13 error:&v29];
    id v18 = v29;

    int v19 = sub_100027250();
    id v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v32 = v17;
        __int16 v33 = 2114;
        CFStringRef v34 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Renaming %{public}@ to %{public}@...", buf, 0x16u);
      }

      unsigned __int8 v21 = v17;
      id v22 = (const std::__fs::filesystem::path *)[(__CFString *)v21 fileSystemRepresentation];
      id v23 = (const std::__fs::filesystem::path *)[(__CFString *)v12 fileSystemRepresentation];
      rename(v22, v23, v24);
      if (!v25)
      {
        id v28 = v18;
        unsigned __int8 v27 = [v7 removeItemAtPath:v13 error:&v28];
        id v16 = v28;

        if (v27)
        {
          BOOL v8 = 1;
          goto LABEL_22;
        }
        id v20 = sub_100027250();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100031DCC();
        }
LABEL_21:

        BOOL v8 = 0;
LABEL_22:

        goto LABEL_23;
      }
      id v20 = sub_100027250();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100031E58(v20);
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100031D40();
      }
      unsigned __int8 v21 = 0;
    }
    id v16 = v18;
    goto LABEL_21;
  }
  id v7 = sub_100027250();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100031F6C(v7);
  }
  BOOL v8 = 0;
LABEL_23:

  return v8;
}

- (BOOL)reboot
{
  int v2 = reboot3();
  if (v2)
  {
    int v3 = v2;
    id v4 = sub_100027250();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100031FF4(v3, v4, v5);
    }
  }
  return 0;
}

- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  unsigned __int8 v14 = [[MSDHFileMetadataRestore alloc] initWithManifestUID:v13 deviceUID:v12];

  if (!v14)
  {
    id v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100032064();
    }
    goto LABEL_13;
  }
  id v15 = [(MSDHOperations *)self signedManifest];

  if (!v15)
  {
    id v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100032098(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_13;
  }
  id v16 = [(MSDHOperations *)self signedManifest];
  id v17 = [v16 mergedBackupManifest:location length:length];

  if (!v17)
  {
    id v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100032110();
    }
LABEL_13:

    id v17 = 0;
    goto LABEL_14;
  }
  if (![(MSDHFileMetadataRestore *)v14 restoreAttributesUnder:v11 fromManifestData:v17])
  {
LABEL_14:
    BOOL v18 = 0;
    goto LABEL_6;
  }
  BOOL v18 = 1;
LABEL_6:

  return v18;
}

- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  id v17 = [[MSDHFileMetadataRestore alloc] initWithManifestUID:v16 deviceUID:v15];

  if (!v17)
  {
    id v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003218C();
    }
    goto LABEL_12;
  }
  BOOL v18 = [(MSDHOperations *)self signedManifest];

  if (!v18)
  {
    id v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000321C0(v20, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_12;
  }
  int v19 = [(MSDHOperations *)self signedManifest];
  id v20 = [v19 getManifestDataFromSection:v13 forIdentifier:v14];

  if (!v20)
  {
    id v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100032238();
    }
LABEL_12:
    unsigned __int8 v21 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v21 = [(MSDHFileMetadataRestore *)v17 restoreAttributesUnder:v12 fromManifestData:v20];
LABEL_5:

  return v21;
}

- (BOOL)quitHelper
{
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSFileManager defaultManager];
  int v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:v4];

  if ([v5 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"])
  {
    id v37 = 0;
    unsigned __int8 v7 = [v5 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz" error:&v37];
    id v8 = v37;
    id v9 = v8;
    if ((v7 & 1) == 0)
    {
      id v14 = sub_100027250();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100032494();
      }
      goto LABEL_37;
    }
    BOOL v10 = v8;
  }
  else
  {
    BOOL v10 = 0;
  }
  if ([v5 fileExistsAtPath:v6])
  {
    id v36 = v10;
    unsigned __int8 v11 = [v5 removeItemAtPath:v6 error:&v36];
    id v9 = v36;

    if ((v11 & 1) == 0)
    {
      id v14 = sub_100027250();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100032460();
      }
      goto LABEL_37;
    }
    BOOL v10 = v9;
  }
  id v35 = v10;
  unsigned __int8 v12 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v35];
  id v9 = v35;

  if ((v12 & 1) == 0)
  {
    id v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003242C();
    }
    goto LABEL_37;
  }
  id v13 = MGCopyAnswer();
  if (!v13)
  {
    id v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000322A8();
    }
    BOOL v30 = 1;
    goto LABEL_19;
  }
  id v14 = v13;
  id v15 = [v13 objectForKey:kMGQDiskUsageAmountDataAvailable];
  id v16 = v15;
  if (!v15 || (uint64_t)[v15 longLongValue] <= 52428800)
  {
    sub_100027250();
    uint64_t v24 = (MSDFileArchiver *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR)) {
      sub_1000322DC(v16, &v24->super);
    }
    goto LABEL_36;
  }
  id v17 = [v6 stringByAppendingPathComponent:@"demod.log"];
  unsigned __int8 v18 = [(MSDHOperations *)self generateLogsForPredicate:@"subsystem == 'com.apple.MobileStoreDemo'" toFile:v17];

  if ((v18 & 1) == 0)
  {
    sub_100027250();
    uint64_t v24 = (MSDFileArchiver *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR)) {
      sub_1000323F8();
    }
    goto LABEL_36;
  }
  int v19 = [v6 stringByAppendingPathComponent:@"demoloop.log"];
  unsigned __int8 v20 = [(MSDHOperations *)self generateLogsForPredicate:@"subsystem == 'com.apple.ist.dcota'" toFile:v19];

  if ((v20 & 1) == 0)
  {
    sub_100027250();
    uint64_t v24 = (MSDFileArchiver *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR)) {
      sub_1000323C4();
    }
LABEL_36:

LABEL_37:
    BOOL v30 = 0;
    goto LABEL_19;
  }
  if (![v5 fileExistsAtPath:@"/var/logs/demod/demod-finish-demo-restore.log"])
  {
LABEL_17:
    uint64_t v24 = objc_alloc_init(MSDFileArchiver);
    uint64_t v25 = +[NSURL URLWithString:v6];
    uint64_t v26 = +[NSURL URLWithString:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"];
    unsigned __int8 v27 = [(MSDFileArchiver *)v24 compressContent:v25 toPath:v26];

    if (v27)
    {
      v38[0] = NSFileOwnerAccountName;
      v38[1] = NSFileGroupOwnerAccountName;
      v39[0] = @"mobile";
      v39[1] = @"mobile";
      v38[2] = NSFilePosixPermissions;
      uint64_t v28 = +[NSNumber numberWithShort:448];
      v39[2] = v28;
      uint64_t v29 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];

      [v5 changeFileAttributes:v29 atPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"];
      BOOL v30 = 1;
      id v14 = v29;
      goto LABEL_19;
    }
    CFStringRef v32 = sub_100027250();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10003235C();
    }

    goto LABEL_36;
  }
  unsigned __int8 v21 = [v6 stringByAppendingPathComponent:@"demod-finish-demo-restore.log"];
  id v34 = v9;
  unsigned __int8 v22 = [v5 copyItemAtPath:@"/var/logs/demod/demod-finish-demo-restore.log" toPath:v21 error:&v34];
  id v23 = v34;

  if (v22)
  {
    id v9 = v23;
    goto LABEL_17;
  }
  __int16 v33 = sub_100027250();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_100032390();
  }

  BOOL v30 = 0;
  id v9 = v23;
LABEL_19:

  if ([v5 fileExistsAtPath:v6]) {
    [v5 removeItemAtPath:v6 error:0];
  }

  return v30;
}

- (BOOL)generateLogsForPredicate:(id)a3 toFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = +[NSFileManager defaultManager];
  id v8 = +[OSLogEventStore localStore];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_10002264C;
  id v39 = sub_10002265C;
  id v40 = 0;
  uint64_t v31 = 0;
  CFStringRef v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_10002264C;
  uint64_t v29 = sub_10002265C;
  id v30 = 0;
  [v7 createFileAtPath:v6 contents:0 attributes:0];
  uint64_t v10 = +[NSFileHandle fileHandleForWritingAtPath:v6];
  unsigned __int8 v11 = (void *)v26[5];
  v26[5] = v10;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100022664;
  v19[3] = &unk_10004CFE0;
  unsigned __int8 v22 = &v35;
  id v12 = v5;
  id v20 = v12;
  id v23 = &v31;
  id v13 = v9;
  unsigned __int8 v21 = v13;
  uint64_t v24 = &v25;
  [v8 prepareWithCompletionHandler:v19];
  dispatch_time_t v14 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    id v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request to collect MobileStoreDemo logs timed out.", v18, 2u);
    }

    [(id)v36[5] invalidate];
  }
  [(id)v26[5] closeFile];
  char v16 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v16;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = sub_100027250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, ">>> Copying item from '%{public}@'", buf, 0xCu);
  }

  if ([v4 fileExistsAtPath:v3])
  {
    id v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" stringByAppendingPathComponent:v3];
    unsigned __int8 v7 = [v6 stringByDeletingLastPathComponent];
    id v14 = 0;
    unsigned __int8 v8 = [v4 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v14];
    dispatch_semaphore_t v9 = v14;
    if (v8)
    {
      if ([v4 cloneFile:v3 to:v6 expectingHash:0 correctOwnership:0])
      {
        BOOL v10 = +[MSDXattr setContentRoot:v6];

        goto LABEL_7;
      }
      id v12 = sub_100027250();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v9 localizedDescription];
        *(_DWORD *)buf = 138543874;
        id v16 = v3;
        __int16 v17 = 2114;
        unsigned __int8 v18 = v6;
        __int16 v19 = 2114;
        id v20 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to copy item from %{public}@ to %{public}@ with error - %{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v12 = sub_100027250();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000324C8();
      }
    }

    BOOL v10 = 0;
    goto LABEL_7;
  }
  dispatch_semaphore_t v9 = sub_100027250();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100032554();
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (BOOL)runPreflightChecksOnSecondPartyAppData:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v5 = a3;
  char v24 = 0;
  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = objc_alloc_init(MSDHSnapshottedDataSaver);
  if ([v6 fileExistsAtPath:v5 isDirectory:&v24]) {
    BOOL v8 = v24 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    +[NSString stringWithFormat:@"App data folder does not exist or is not a folder:  %@", v5, v22, v23];
LABEL_22:
    __int16 v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v15 = 0;
    goto LABEL_23;
  }
  dispatch_semaphore_t v9 = [(MSDHSnapshottedDataSaver *)v7 getFileSizeForItemAtPath:v5];
  BOOL v10 = sub_100027250();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000326F4();
  }

  if (v9 == (char *)-1)
  {
    +[NSString stringWithFormat:@"Failed to calculate size of source data:  %@", v5, v22, v23];
    goto LABEL_22;
  }
  if ((unint64_t)v9 > 0x280000000)
  {
    +[NSString stringWithFormat:@"Size of source data:  %lld at:  %@ exceeds max size of:  %llu", v9, v5, 0x280000000];
    goto LABEL_22;
  }
  if (![(MSDHSnapshottedDataSaver *)v7 canDeviceHaveEnoughSpaceForItemDomainWithSize:v9])
  {
    +[NSString stringWithFormat:@"Device does not have enough space to preserve data - Data size:  %lld", v9, v22, v23];
    goto LABEL_22;
  }
  if ([v6 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter"])
  {
    id v12 = [(MSDHSnapshottedDataSaver *)v7 getFileSizeForItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter"];
    if (v12 == (char *)-1)
    {
      id v15 = 0;
      __int16 v17 = @"Failed to calculate current size of second party app data shelter.";
      goto LABEL_23;
    }
    id v13 = v12;
    id v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10003268C();
    }

    id v15 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter" stringByAppendingPathComponent:v5];
    if ([v6 fileExistsAtPath:v15])
    {
      int64_t v16 = [(MSDHSnapshottedDataSaver *)v7 getFileSizeForItemAtPath:v15];
      if (v16 == -1)
      {
        __int16 v17 = @"Failed to calculate size of existing second party app data";
        goto LABEL_23;
      }
      v13 -= v16;
    }
  }
  else
  {
    id v13 = 0;
    id v15 = 0;
  }
  unsigned __int8 v21 = sub_100027250();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100032624();
  }

  if (&v9[(void)v13] <= (char *)0x280000000)
  {
    BOOL v19 = 1;
    goto LABEL_29;
  }
  __int16 v17 = +[NSString stringWithFormat:@"The current size of the second-party data shelter is %llu.  Saving this data of size %lld bytes will cause it to exceed the data cap of %lld bytes.", v13, v9, 0x280000000];
LABEL_23:
  if (a4 && v17) {
    *a4 = v17;
  }
  unsigned __int8 v18 = sub_100027250();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000325BC();
  }

  BOOL v19 = 0;
LABEL_29:

  return v19;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = +[NSFileManager defaultManager];
  id v32 = 0;
  unsigned int v8 = [(MSDHOperations *)self runPreflightChecksOnSecondPartyAppData:v6 withReturnErrorMsg:&v32];
  id v9 = v32;
  if (!v8)
  {
    uint64_t v22 = 0;
    BOOL v10 = 0;
    id v15 = 0;
    goto LABEL_19;
  }
  BOOL v10 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter" stringByAppendingPathComponent:v6];
  if ([v7 fileExistsAtPath:v10])
  {
    id v31 = 0;
    unsigned __int8 v11 = [v7 removeItemAtPath:v10 error:&v31];
    id v12 = v31;
    id v13 = v12;
    if ((v11 & 1) == 0)
    {
      uint64_t v19 = [v12 localizedDescription];
      uint64_t v20 = +[NSString stringWithFormat:@"Failed to delete destination folder in persitent storage - Error:  %@", v19];

      id v15 = 0;
      goto LABEL_15;
    }
    id v14 = v12;
  }
  else
  {
    id v14 = 0;
  }
  id v15 = [v10 stringByDeletingLastPathComponent];
  if ([v7 fileExistsAtPath:v10])
  {
    id v13 = v14;
LABEL_9:
    if ([v7 cloneFile:v6 to:v10 expectingHash:0 correctOwnership:0])
    {
      if (+[MSDXattr setContentRoot:v10])
      {
        BOOL v17 = 1;
        goto LABEL_31;
      }
      unsigned __int8 v21 = __error();
      +[NSString stringWithFormat:@"Failed to set xattr for destination folder in persistent storage - Error:  %s", strerror(*v21), v28];
    }
    else
    {
      unsigned __int8 v18 = __error();
      +[NSString stringWithFormat:@"Failed to copy source data  %@ to persistent storage - Error:  %s", v6, strerror(*v18)];
    uint64_t v20 = };
    goto LABEL_18;
  }
  id v30 = v14;
  unsigned __int8 v16 = [v7 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v13 = v30;

  if (v16) {
    goto LABEL_9;
  }
  uint64_t v19 = [v13 localizedDescription];
  uint64_t v20 = +[NSString stringWithFormat:@"Failed to create parent destination folder in persistent storage - Error:  %@", v19];

LABEL_15:
  id v9 = (id)v19;
LABEL_18:

  uint64_t v22 = v13;
  id v9 = (id)v20;
LABEL_19:
  if ([v7 fileExistsAtPath:v10])
  {
    id v29 = v22;
    unsigned __int8 v23 = [v7 removeItemAtPath:v10 error:&v29];
    id v13 = v29;

    if ((v23 & 1) == 0)
    {
      char v24 = sub_100027250();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [v13 localizedDescription];
        *(_DWORD *)buf = 138412546;
        char v34 = v10;
        __int16 v35 = 2112;
        id v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to remove folder:  %@ - Error:  %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v13 = v22;
  }
  if (a4 && v9) {
    *a4 = v9;
  }
  uint64_t v26 = sub_100027250();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_1000325BC();
  }

  BOOL v17 = 0;
LABEL_31:

  return v17;
}

- (BOOL)restartBluetooth
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v2 = (uint64_t (*)(const __CFString *, void, const __CFString *))off_100057E68;
  BOOL v10 = off_100057E68;
  if (!off_100057E68)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100023964;
    v6[3] = &unk_10004D008;
    v6[4] = &v7;
    sub_100023964((uint64_t)v6);
    int v2 = (uint64_t (*)(const __CFString *, void, const __CFString *))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
  {
    LODWORD(v2) = v2(@"bluetoothd", 0, @"Restarting bluetoothd to restore bluetooth pairing record for DeKOTA devices.");
    if (!v2) {
      return v2 == 0;
    }
  }
  else
  {
    sub_10003275C();
  }
  id v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100032780((int)v2, v4, v5);
  }

  return v2 == 0;
}

- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4
{
  uint64_t v5 = (__CFString *)a3;
  id v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    BOOL v17 = "-[MSDHOperations setComputerNameAndHostname:encoding:]";
    __int16 v18 = 2114;
    uint64_t v19 = v5;
    __int16 v20 = 1026;
    unsigned int v21 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - computerName:  %{public}@ - encoding:  0x%{public}x", (uint8_t *)&v16, 0x1Cu);
  }

  uint64_t v7 = SCPreferencesCreate(0, @"demod_helper:setComputerName", 0);
  if (!v7)
  {
    id v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000327F0(v14);
    }

    goto LABEL_22;
  }
  unsigned int v8 = v7;
  if (!SCPreferencesSetComputerName(v7, v5, a4))
  {
    unsigned __int8 v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100032874(v11);
    }
    goto LABEL_21;
  }
  CFStringRef v9 = (const __CFString *)_CSCopyLocalHostnameForComputerName();
  BOOL v10 = sub_100027250();
  unsigned __int8 v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000328F8();
    }
LABEL_21:

    CFRelease(v8);
LABEL_22:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100032AB8();
  }

  if (!SCPreferencesSetLocalHostName(v8, v9))
  {
    id v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003292C(v15);
    }
    goto LABEL_29;
  }
  if (!SCPreferencesCommitChanges(v8))
  {
    id v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000329B0(v15);
    }
    goto LABEL_29;
  }
  if (!SCPreferencesApplyChanges(v8))
  {
    id v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100032A34(v15);
    }
LABEL_29:

    BOOL v12 = 0;
    goto LABEL_12;
  }
  BOOL v12 = 1;
LABEL_12:
  CFRelease(v8);
  CFRelease(v9);
LABEL_13:

  return v12;
}

- (id)getPathInUserHomeDirectory:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDHVolumeManager sharedInstance];
  uint64_t v5 = [v4 userHomePath];

  if ([v3 hasPrefix:@"/var/MSDWorkContainer"])
  {
    id v6 = [v5 stringByAppendingPathComponent:@"/.MSDWorkContainer"];
    uint64_t v7 = @"/var/MSDWorkContainer";
LABEL_5:
    uint64_t v8 = [v3 substringFromIndex:-[__CFString length](v7, "length")];
    goto LABEL_7;
  }
  if ([v3 hasPrefix:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer"])
  {
    id v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"/.MSDWorkContainer"];
    uint64_t v7 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer";
    goto LABEL_5;
  }
  id v6 = [v5 stringByAppendingPathComponent:@"/.MSDWorkContainer"];
  uint64_t v8 = [v3 lastPathComponent];
LABEL_7:
  CFStringRef v9 = (void *)v8;
  BOOL v10 = [v6 stringByAppendingPathComponent:v8];

  return v10;
}

- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6
{
  CFStringRef v9 = (__CFString *)a6;
  BOOL v10 = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a3, a4, v10, v9, kCFPreferencesAnyHost);
  int v11 = CFPreferencesSynchronize(v10, v9, kCFPreferencesAnyHost);

  if (!v11)
  {
    id v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100032B20(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  return v11 != 0;
}

- (void)setSignedManifest:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_signedManifest, 0);
}

@end