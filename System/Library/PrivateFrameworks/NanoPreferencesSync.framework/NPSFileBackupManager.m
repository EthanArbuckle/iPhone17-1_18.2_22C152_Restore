@interface NPSFileBackupManager
- (BOOL)activeDeviceChanged;
- (NPSDeviceRegistry)deviceRegistry;
- (NPSFileBackupManager)initWithDeviceRegistry:(id)a3;
- (NSMutableDictionary)metadataIndex;
- (NSUUID)activeDeviceID;
- (id)fileURLWithUUID:(id)a3;
- (id)localFileURLForOriginalFileURL:(id)a3;
- (id)metadataIndexReadFromDiskIfNeeded;
- (id)newFileUUID;
- (id)pathToFileWithUUID:(id)a3;
- (void)backupFileAtURL:(id)a3 originalFileURL:(id)a4;
- (void)enumerateFileBackupsUsingBlock:(id)a3;
- (void)persistMetadataIndex;
- (void)setActiveDeviceID:(id)a3;
- (void)setDeviceRegistry:(id)a3;
- (void)setMetadataIndex:(id)a3;
@end

@implementation NPSFileBackupManager

- (NPSFileBackupManager)initWithDeviceRegistry:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPSFileBackupManager;
  v6 = [(NPSFileBackupManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceRegistry, a3);
    v8 = (NSUUID *)[v5 activeDeviceID];
    v7->_activeDeviceID = v8;
  }
  else
  {
    v8 = (NSUUID *)MEMORY[0x10];
  }
  if (v8) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (BOOL)activeDeviceChanged
{
  activeDeviceID = self->_activeDeviceID;
  v3 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDeviceID];
  LOBYTE(activeDeviceID) = [(NSUUID *)activeDeviceID isEqual:v3] ^ 1;

  return (char)activeDeviceID;
}

- (void)backupFileAtURL:(id)a3 originalFileURL:(id)a4
{
  v6 = (char *)a3;
  v7 = (char *)a4;
  v8 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v48 = "-[NPSFileBackupManager backupFileAtURL:originalFileURL:]";
    __int16 v49 = 2112;
    v50 = v6;
    __int16 v51 = 2112;
    v52 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: fileURL: (%@); originalURL: (%@)",
      buf,
      0x20u);
  }
  if ([(NPSFileBackupManager *)self activeDeviceChanged])
  {
    v9 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[NPSFileBackupManager backupFileAtURL:originalFileURL:]";
      v10 = "%s: Skipping, active device has changed";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_49;
    }
    goto LABEL_49;
  }
  if (v7)
  {
    v11 = [(NPSFileBackupManager *)self metadataIndexReadFromDiskIfNeeded];
    uint64_t v12 = [v11 objectForKeyedSubscript:v7];
    v13 = (void *)v12;
    if (!v6)
    {
      if (!v12)
      {
LABEL_48:

        goto LABEL_49;
      }
      v25 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v7;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Removing file (%@) from backup", buf, 0xCu);
      }
      v26 = [v13 uuid];
      v16 = [(NPSFileBackupManager *)self pathToFileWithUUID:v26];

      v27 = +[NSFileManager defaultManager];
      id v44 = 0;
      [v27 removeItemAtPath:v16 error:&v44];
      v20 = (char *)v44;

      if (v20)
      {
        v28 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v16;
          __int16 v49 = 2112;
          v50 = v20;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed to remove file (%@) with error: (%@)", buf, 0x16u);
        }
      }
      [v11 removeObjectForKey:v7];
      [(NPSFileBackupManager *)self persistMetadataIndex];
      v14 = v13;
LABEL_47:

      goto LABEL_48;
    }
    v14 = (void *)v12;
    if (!v12)
    {
      v14 = objc_opt_new();
      id v15 = [(NPSFileBackupManager *)self newFileUUID];
      [v14 setUuid:v15];

      [v14 setUrl:v7];
      [v11 setObject:v14 forKeyedSubscript:v7];
      [(NPSFileBackupManager *)self persistMetadataIndex];
    }
    v16 = [v6 path];
    v17 = [v14 uuid];
    v18 = [(NPSFileBackupManager *)self pathToFileWithUUID:v17];

    if (v18)
    {
      v43 = v11;
      if (v13)
      {
        v19 = +[NSFileManager defaultManager];
        id v46 = 0;
        [v19 removeItemAtPath:v18 error:&v46];
        v20 = (char *)v46;

        if (v20)
        {
          v21 = [v20 domain];
          if (([v21 isEqualToString:NSCocoaErrorDomain] & 1) == 0)
          {

            goto LABEL_40;
          }
          v22 = v16;
          id v23 = [v20 code];

          BOOL v24 = v23 == (id)4;
          v16 = v22;
          if (!v24)
          {
LABEL_40:
            v37 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v48 = v18;
              __int16 v49 = 2112;
              v50 = v20;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to delete old file backup (%@) with error: (%@)", buf, 0x16u);
            }
LABEL_42:
            v11 = v43;
LABEL_46:

            goto LABEL_47;
          }
        }
        else
        {
          v22 = v16;
        }
      }
      else
      {
        v22 = v16;
        v20 = 0;
      }
      v34 = v20;
      v35 = +[NSFileManager defaultManager];
      v45 = v20;
      [v35 moveItemAtPath:v22 toPath:v18 error:&v45];
      v20 = v45;

      if (v20)
      {
        v36 = nps_daemon_log;
        v16 = v22;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v22;
          __int16 v49 = 2112;
          v50 = v18;
          __int16 v51 = 2112;
          v52 = v20;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Failed to move file (%@) to (%@) with error: (%@)", buf, 0x20u);
        }
        v11 = v43;
        [v43 removeObjectForKey:v7];
        [(NPSFileBackupManager *)self persistMetadataIndex];
        goto LABEL_46;
      }
      v16 = v22;
      goto LABEL_42;
    }
    v29 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to generate file backup destination path. File will not get backuped!", buf, 2u);
    }
    if (!MGGetBoolAnswer())
    {
LABEL_45:
      v20 = 0;
      goto LABEL_46;
    }
    deviceRegistry = self->_deviceRegistry;
    if (deviceRegistry)
    {
      v31 = [(NPSDeviceRegistry *)deviceRegistry filesBackupDirectoryPath];

      if (!v31)
      {
        v20 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];

        if (v20)
        {
          v20 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDeviceID];

          if (v20)
          {
            v39 = [(NPSDeviceRegistry *)self->_deviceRegistry pairingDataStore];

            NSExceptionName v32 = NSInvalidArgumentException;
            if (v39) {
              CFStringRef v33 = @"other1";
            }
            else {
              CFStringRef v33 = @"nil pairingDataStore";
            }
            goto LABEL_44;
          }
          NSExceptionName v40 = NSInvalidArgumentException;
          CFStringRef v41 = @"nil pairingID";
        }
        else
        {
          NSExceptionName v40 = NSInvalidArgumentException;
          CFStringRef v41 = @"nil pairedDevice";
        }
        id v42 = +[NSException exceptionWithName:v40 reason:v41 userInfo:0];
        goto LABEL_46;
      }
      NSExceptionName v32 = NSInvalidArgumentException;
      CFStringRef v33 = @"other2";
    }
    else
    {
      NSExceptionName v32 = NSInvalidArgumentException;
      CFStringRef v33 = @"nil _deviceRegistry";
    }
LABEL_44:
    id v38 = +[NSException exceptionWithName:v32 reason:v33 userInfo:0];
    goto LABEL_45;
  }
  v9 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v6;
    v10 = "Error backuping file (%@), originalFileURL is nil";
    goto LABEL_18;
  }
LABEL_49:
}

- (void)enumerateFileBackupsUsingBlock:(id)a3
{
  id v4 = a3;
  if ([(NPSFileBackupManager *)self activeDeviceChanged])
  {
    id v5 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[NPSFileBackupManager enumerateFileBackupsUsingBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Skipping, active device has changed", buf, 0xCu);
    }
  }
  else
  {
    v6 = [(NPSDeviceRegistry *)self->_deviceRegistry filesBackupDirectoryPath];
    v7 = [(NPSFileBackupManager *)self metadataIndexReadFromDiskIfNeeded];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100027F00;
    v9[3] = &unk_10003D528;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

- (id)localFileURLForOriginalFileURL:(id)a3
{
  id v4 = a3;
  if ([(NPSFileBackupManager *)self activeDeviceChanged])
  {
    id v5 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      v16 = "-[NPSFileBackupManager localFileURLForOriginalFileURL:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Skipping, active device has changed", (uint8_t *)&v15, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v7 = [(NPSDeviceRegistry *)self->_deviceRegistry filesBackupDirectoryPath];
    id v8 = [(NPSFileBackupManager *)self metadataIndexReadFromDiskIfNeeded];
    v9 = [v8 objectForKeyedSubscript:v4];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 uuid];
      uint64_t v12 = [v11 UUIDString];
      v13 = [v7 stringByAppendingPathComponent:v12];

      v6 = +[NSURL fileURLWithPath:v13 isDirectory:0];
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)pathToFileWithUUID:(id)a3
{
  deviceRegistry = self->_deviceRegistry;
  id v4 = a3;
  id v5 = [(NPSDeviceRegistry *)deviceRegistry filesBackupDirectoryPath];
  v6 = [v4 UUIDString];

  v7 = [v5 stringByAppendingString:v6];

  return v7;
}

- (id)fileURLWithUUID:(id)a3
{
  v3 = [(NPSFileBackupManager *)self pathToFileWithUUID:a3];
  id v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (id)metadataIndexReadFromDiskIfNeeded
{
  metadataIndex = self->_metadataIndex;
  if (!metadataIndex)
  {
    id v4 = [(NPSDeviceRegistry *)self->_deviceRegistry filesBackupMetadataIndexPath];
    if (v4)
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      id v5 = +[NSArray arrayWithObjects:&v12 count:3];
      v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", v5, v12, v13);

      v7 = +[NPSKeyedArchiverUtil unarchiveObjectOfClasses:v6 withFile:v4];
      id v8 = self->_metadataIndex;
      self->_metadataIndex = v7;
    }
    if (!self->_metadataIndex)
    {
      v9 = (NSMutableDictionary *)objc_opt_new();
      id v10 = self->_metadataIndex;
      self->_metadataIndex = v9;
    }
    metadataIndex = self->_metadataIndex;
  }
  return metadataIndex;
}

- (void)persistMetadataIndex
{
  v3 = [(NPSDeviceRegistry *)self->_deviceRegistry filesBackupMetadataIndexPath];
  if (v3)
  {
    metadataIndex = self->_metadataIndex;
    if (metadataIndex && [(NSMutableDictionary *)metadataIndex count])
    {
      id v5 = +[NPSKeyedArchiverUtil archiveObject:self->_metadataIndex];
      id v13 = 0;
      [v5 writeToFile:v3 options:268435457 error:&v13];
      id v6 = v13;
      if (v6)
      {
        v7 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          int v15 = v3;
          __int16 v16 = 2112;
          id v17 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to write index file (%@) with error: (%@)", buf, 0x16u);
        }
      }

      goto LABEL_15;
    }
    id v8 = +[NSFileManager defaultManager];
    id v12 = 0;
    [v8 removeItemAtPath:v3 error:&v12];
    id v6 = v12;

    if (v6)
    {
      v9 = [v6 domain];
      if ([v9 isEqualToString:NSCocoaErrorDomain])
      {
        id v10 = [v6 code];

        if (v10 == (id)4) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      id v11 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        int v15 = v3;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to delete to-be-empty index file (%@) with error: (%@)", buf, 0x16u);
      }
    }
LABEL_15:
  }
}

- (id)newFileUUID
{
  v2 = [(NPSFileBackupManager *)self metadataIndexReadFromDiskIfNeeded];
  id v3 = 0;
  do
  {
    id v4 = +[NSUUID UUID];

    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100028720;
    v11[3] = &unk_10003D550;
    id v3 = v4;
    id v12 = v3;
    id v13 = &v14;
    [v2 enumerateKeysAndObjectsUsingBlock:v11];
    if (*((unsigned char *)v15 + 24))
    {
      int v5 = 3;
    }
    else
    {
      id v6 = +[NSFileManager defaultManager];
      v7 = [(NPSFileBackupManager *)self pathToFileWithUUID:v3];
      unsigned int v8 = [v6 fileExistsAtPath:v7];

      if (v8) {
        int v5 = 0;
      }
      else {
        int v5 = 2;
      }
    }

    _Block_object_dispose(&v14, 8);
  }
  while (v5 != 2);

  return v3;
}

- (NPSDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (void)setDeviceRegistry:(id)a3
{
}

- (NSUUID)activeDeviceID
{
  return self->_activeDeviceID;
}

- (void)setActiveDeviceID:(id)a3
{
  self->_activeDeviceID = (NSUUID *)a3;
}

- (NSMutableDictionary)metadataIndex
{
  return self->_metadataIndex;
}

- (void)setMetadataIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataIndex, 0);
  objc_storeStrong((id *)&self->_deviceRegistry, 0);
}

@end