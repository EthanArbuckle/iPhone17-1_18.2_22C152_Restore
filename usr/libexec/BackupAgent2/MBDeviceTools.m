@interface MBDeviceTools
+ (id)toolsWithSettingsContext:(id)a3 error:(id *)a4;
- (BOOL)_extractWithManifest:(id)a3 file:(id)a4 keybag:(id)a5 toDrivePath:(id)a6 error:(id *)a7;
- (BOOL)extractWithDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5;
- (BOOL)unbackWithError:(id *)a3;
- (MBDeviceTools)initWithSettingsContext:(id)a3 error:(id *)a4;
- (MBDriveSettingsContext)settingsContext;
- (id)infoWithError:(id *)a3;
- (id)listWithError:(id *)a3;
@end

@implementation MBDeviceTools

+ (id)toolsWithSettingsContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[MBDeviceTools alloc] initWithSettingsContext:v5 error:a4];

  return v6;
}

- (MBDeviceTools)initWithSettingsContext:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBDeviceTools;
  v8 = [(MBDeviceTools *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_settingsContext, a3);
    v10 = [[MBToolsDomainManager alloc] initWithTools:v9 error:a4];
    domainManager = v9->_domainManager;
    v9->_domainManager = (MBDomainManager *)v10;

    if (v9->_domainManager)
    {
      v12 = [[MBBackupHelper alloc] initWithSettingsContext:v9->_settingsContext domainManager:v9->_domainManager];
      backupHelper = v9->_backupHelper;
      v9->_backupHelper = v12;
    }
    else
    {
      backupHelper = v9;
      v9 = 0;
    }
  }
  return v9;
}

- (BOOL)_extractWithManifest:(id)a3 file:(id)a4 keybag:(id)a5 toDrivePath:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_super v15 = [a3 properties];
  LOBYTE(a3) = [v15 hasManifestDB];
  v16 = [v12 fileID];
  v17 = v16;
  if (a3) {
    [v16 filenameWithPrefix];
  }
  else {
  v18 = [v16 filename];
  }

  v19 = [(MBDriveSettingsContext *)self->_settingsContext driveBackupDir];
  v20 = [v19 stringByAppendingPathComponent:v18];

  if (v13)
  {
    v21 = MBTemporaryPath();
    v22 = [v12 encryptionKey];
    if (v22)
    {
      CFStringRef v39 = @"FileHandleFactory";
      v40 = [[MBToolsFileHandleFactory alloc] initWithKeyBag:v13 key:v22];
      v33 = v40;
      v34 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Downloading and decrypting encrypted file from \"%@\"", buf, 0xCu);
        _MBLog();
      }

      v24 = [(MBDriveSettingsContext *)self->_settingsContext drive];
      v32 = a7;
      unsigned int v25 = [v24 downloadFileAtPath:v20 toPath:v21 options:v34 error:a7];

      if (v25)
      {
        v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v14;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Uploading unencrypted file to \"%@\"", buf, 0xCu);
          _MBLog();
        }

        v27 = [(MBDriveSettingsContext *)self->_settingsContext drive];
        unsigned __int8 v28 = [v27 uploadFileAtPath:v21 toPath:v14 options:0 error:v32];

        v29 = +[NSFileManager defaultManager];
        [v29 removeItemAtPath:v21 error:0];
      }
      else
      {
        unsigned __int8 v28 = 0;
      }
    }
    else if (a7)
    {
      +[MBError errorWithCode:205 format:@"Encryption key not found"];
      unsigned __int8 v28 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v28 = 0;
    }
  }
  else
  {
    v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Copying \"%@\" to \"%@\"", buf, 0x16u);
      _MBLog();
    }

    v21 = [(MBDriveSettingsContext *)self->_settingsContext drive];
    unsigned __int8 v28 = [v21 copyItemAtPath:v20 toPath:v14 options:0 error:a7];
  }

  return v28;
}

- (BOOL)extractWithDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Extracting %@-%@", buf, 0x16u);
    id v31 = v8;
    id v32 = v9;
    _MBLog();
  }

  v11 = [(MBBackupHelper *)self->_backupHelper readBackupManifestWithError:a5];
  id v12 = v11;
  if (!v11) {
    goto LABEL_24;
  }
  [v11 buildIndexFromDatabaseIfNeeded];
  id v13 = [v12 properties];
  unsigned int v14 = [v13 encrypted];

  if (!v14)
  {
    v18 = 0;
    goto LABEL_9;
  }
  objc_super v15 = [v12 properties];
  v16 = [v15 keybagData];

  if (v16)
  {
    v17 = [(MBDriveSettingsContext *)self->_settingsContext password];
    v18 = +[MBKeyBag unlockedKeyBagWithData:v16 password:v17 error:a5];

    if (!v18) {
      goto LABEL_24;
    }
LABEL_9:
    v19 = -[MBDomainManager domainForName:](self->_domainManager, "domainForName:", v8, v31, v32);
    if (v19)
    {
      if (MBIsValidRelativePath())
      {
        v34 = +[MBFileID fileIDWithDomain:v19 relativePath:v9];
        v20 = [v12 fetchFileWithID:v34 error:a5];
        v21 = v20;
        if (v20)
        {
          if ([v20 isDirectory])
          {
            v33 = [(MBDriveSettingsContext *)self->_settingsContext drive];
            v22 = [v21 relativePath];
            v23 = [v22 lastPathComponent];
            [v33 removeItemAtPath:v23 options:0 error:0];

            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v42 = sub_10006CB0C;
            v43 = sub_10006CB1C;
            id v44 = 0;
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_10006CB24;
            v35[3] = &unk_1000F2130;
            id v36 = v21;
            __int16 v37 = self;
            v40 = buf;
            id v38 = v12;
            id v39 = v18;
            id v24 = [v38 enumerateFiles:v35 includeUninstalled:1];
            unsigned int v25 = *(void **)(*(void *)&buf[8] + 40);
            unsigned __int8 v26 = v25 == 0;
            if (a5 && v25) {
              *a5 = v25;
            }

            _Block_object_dispose(buf, 8);
            goto LABEL_36;
          }
          if ([v21 isRegularFile])
          {
            v29 = [v9 lastPathComponent];
            unsigned __int8 v26 = [(MBDeviceTools *)self _extractWithManifest:v12 file:v21 keybag:v18 toDrivePath:v29 error:a5];

LABEL_36:
            goto LABEL_37;
          }
          if (a5)
          {
            id v27 = +[MBError errorWithCode:4 format:@"Not a regular file or directory"];
            goto LABEL_34;
          }
        }
        else if (a5)
        {
          id v27 = +[MBError errorWithCode:4 format:@"File not found in manifest"];
LABEL_34:
          unsigned __int8 v26 = 0;
          *a5 = v27;
          goto LABEL_36;
        }
        unsigned __int8 v26 = 0;
        goto LABEL_36;
      }
      if (a5)
      {
        if ([v19 isUninstalledAppDomain]) {
          [v19 name];
        }
        else {
        unsigned __int8 v28 = [v19 rootPath];
        }
        *a5 = +[MBError errorWithCode:1, @"Path to extract must be relative to domain root (%@)", v28 format];
      }
    }
    else if (a5)
    {
      +[MBError errorWithCode:4 format:@"Domain not found"];
      unsigned __int8 v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      goto LABEL_38;
    }
    unsigned __int8 v26 = 0;
    goto LABEL_37;
  }
  if (!a5)
  {
LABEL_24:
    unsigned __int8 v26 = 0;
    goto LABEL_38;
  }
  +[MBError errorWithCode:205 format:@"Keybag data not found"];
  unsigned __int8 v26 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v26;
}

- (id)infoWithError:(id *)a3
{
  v23 = -[MBBackupHelper readStatusWithError:](self->_backupHelper, "readStatusWithError:");
  if (v23)
  {
    id v5 = [(MBBackupHelper *)self->_backupHelper readBackupManifestWithError:a3];
    v22 = v5;
    if (v5)
    {
      [v5 buildIndexFromDatabaseIfNeeded];
      id v24 = +[NSMutableString stringWithCapacity:0x4000];
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      uint64_t v43 = 0;
      uint64_t v36 = 0;
      __int16 v37 = &v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v39 = 0;
      uint64_t v30 = 0;
      id v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = sub_10006CB0C;
      v34 = sub_10006CB1C;
      id v35 = +[NSMutableDictionary dictionaryWithCapacity:0];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10006D1DC;
      v29[3] = &unk_1000F2158;
      v29[4] = &v40;
      v29[5] = &v36;
      v29[6] = &v30;
      id v6 = [v22 enumerateFiles:v29 includeUninstalled:1];
      id v7 = [v23 description];
      [v24 appendFormat:@"%@\n", v7];

      id v8 = [v22 properties];
      id v9 = [v8 description];
      [v24 appendFormat:@"%@\n", v9];

      [v24 appendString:@"\n"];
      [v24 appendString:@" Count   Size (B) Domain name\n"];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v10 = [(id)v31[5] allKeys];
      v11 = [v10 sortedArrayUsingSelector:"compare:"];

      id v12 = [v11 countByEnumeratingWithState:&v25 objects:v44 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v26;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            v16 = [(id)v31[5] objectForKeyedSubscript:v15];
            v17 = [v16 objectAtIndexedSubscript:0];
            id v18 = [v17 longValue];

            v19 = [v16 objectAtIndexedSubscript:1];
            id v20 = [v19 longLongValue];

            [v24 appendFormat:@"  %4ld %10lld %@\n", v18, v20, v15];
          }
          id v12 = [v11 countByEnumeratingWithState:&v25 objects:v44 count:16];
        }
        while (v12);
      }

      [v24 appendFormat:@"  %4ld %10lld %@\n", v41[3], v37[3], @"Total"];
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)listWithError:(id *)a3
{
  if (!a3) {
    sub_10009A3EC();
  }
  v4 = -[MBBackupHelper readBackupManifestWithError:](self->_backupHelper, "readBackupManifestWithError:");
  if (v4)
  {
    id v5 = +[NSMutableString stringWithCapacity:0x4000];
    id v6 = +[NSString stringWithFormat:@"%-41s %-41s %7s %8s %4s %4s %-20s %-20s %-20s %11s %6s %s %s %s %s\n", "ID, ", "Digest, ", "Mode, ", "Inode, ", "UID, ", "GID, ", "Last modified, ", "Last status change, ", "Birth, ", "Size, ", "Class, ", "Domain, ", "Relative path, ", "Target, ", "Extended attributes"];
    [v5 appendString:v6];
    id v7 = objc_alloc_init((Class)NSDateFormatter);
    [v7 setFormatterBehavior:1040];
    [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006D5F0;
    v13[3] = &unk_1000F2180;
    id v14 = v7;
    id v8 = v5;
    id v15 = v8;
    id v9 = v7;
    *a3 = [v4 enumerateFiles:v13];
    v10 = v15;
    id v11 = v8;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)unbackWithError:(id *)a3
{
  id v5 = [(MBDriveSettingsContext *)self->_settingsContext sourceIdentifier];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(MBDriveSettingsContext *)self->_settingsContext targetIdentifier];
  }
  id v8 = v7;

  id v9 = [@"_unback_" stringByAppendingPathComponent:v8];
  id v31 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v10 = [(MBBackupHelper *)self->_backupHelper readBackupManifestWithError:a3];
  id v11 = v10;
  if (v10)
  {
    [v10 buildIndexFromDatabaseIfNeeded];
    id v12 = [v11 properties];
    unsigned int v13 = [v12 encrypted];

    if (v13)
    {
      id v14 = [v11 properties];
      id v15 = [v14 keybagData];

      if (!v15)
      {
        if (!a3)
        {
          id v17 = 0;
LABEL_32:
          id v18 = 0;
          goto LABEL_33;
        }
        id v29 = +[MBError errorWithCode:205 format:@"Keybag data not found"];
        id v17 = 0;
        id v18 = 0;
LABEL_30:
        BOOL v19 = 0;
        *a3 = v29;
LABEL_34:

        goto LABEL_35;
      }
      v16 = [(MBDriveSettingsContext *)self->_settingsContext password];
      id v17 = +[MBKeyBag unlockedKeyBagWithData:v15 password:v16 error:a3];

      if (!v17) {
        goto LABEL_32;
      }
    }
    else
    {
      id v17 = 0;
    }
    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"_unback_";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Creating directory: %@", (uint8_t *)&buf, 0xCu);
      _MBLog();
    }

    v21 = [(MBDriveSettingsContext *)self->_settingsContext drive];
    id v41 = 0;
    unsigned __int8 v22 = [v21 createDirectoryAtPath:@"_unback_" options:0 error:&v41];
    id v18 = v41;

    if ((v22 & 1) != 0
      || (+[MBError isError:v18 withCode:3] & 1) != 0)
    {
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Creating directory: %@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      id v24 = [(MBDriveSettingsContext *)self->_settingsContext drive];
      id v40 = v18;
      unsigned __int8 v25 = [v24 createDirectoryAtPath:v9 options:0 error:&v40];
      id v26 = v40;

      if ((v25 & 1) != 0
        || (+[MBError isError:v26 withCode:3] & 1) != 0)
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v43 = 0x3032000000;
        id v44 = sub_10006CB0C;
        v45 = sub_10006CB1C;
        id v46 = 0;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10006DDF8;
        v32[3] = &unk_1000F21A8;
        id v33 = v9;
        id v34 = v31;
        id v35 = self;
        p_long long buf = &buf;
        id v18 = v26;
        id v36 = v18;
        id v37 = v11;
        id v17 = v17;
        id v38 = v17;
        id v27 = [v37 enumerateFiles:v32 includeUninstalled:1];
        long long v28 = *(void **)(*((void *)&buf + 1) + 40);
        BOOL v19 = v28 == 0;
        if (a3 && v28) {
          *a3 = v28;
        }

        _Block_object_dispose(&buf, 8);
        goto LABEL_34;
      }
      if (!a3)
      {
        BOOL v19 = 0;
        id v18 = v26;
        goto LABEL_34;
      }
      id v29 = v26;
    }
    else
    {
      if (!a3)
      {
LABEL_33:
        BOOL v19 = 0;
        goto LABEL_34;
      }
      id v29 = v18;
    }
    id v18 = v29;
    goto LABEL_30;
  }
  id v18 = 0;
  BOOL v19 = 0;
LABEL_35:

  return v19;
}

- (MBDriveSettingsContext)settingsContext
{
  return self->_settingsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsContext, 0);
  objc_storeStrong((id *)&self->_backupHelper, 0);

  objc_storeStrong((id *)&self->_domainManager, 0);
}

@end