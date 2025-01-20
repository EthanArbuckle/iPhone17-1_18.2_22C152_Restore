@interface MSDHFileMetadataRestore
- (BOOL)_gatherDeviceDemoUserAccountInfo;
- (BOOL)restoreAttributesUnder:(id)a3 fromManifestData:(id)a4;
- (MSDHFileMetadataRestore)initWithManifestUID:(id)a3 deviceUID:(id)a4;
- (NSMutableSet)pathsToSkip;
- (NSNumber)deviceGID;
- (NSNumber)deviceUID;
- (NSNumber)manifestUID;
- (NSString)deviceGroupName;
- (NSString)deviceUserName;
- (NSString)userHomePath;
- (id)_updateFile:(id)a3 withAttributes:(id)a4;
- (id)_updateFileAttributes:(id)a3;
- (id)_updateFileAttributesFromManifestData:(id)a3;
- (void)setDeviceGID:(id)a3;
- (void)setDeviceGroupName:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setDeviceUserName:(id)a3;
- (void)setManifestUID:(id)a3;
- (void)setPathsToSkip:(id)a3;
- (void)setUserHomePath:(id)a3;
@end

@implementation MSDHFileMetadataRestore

- (MSDHFileMetadataRestore)initWithManifestUID:(id)a3 deviceUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSDHFileMetadataRestore;
  v8 = [(MSDHFileMetadataRestore *)&v12 init];
  if (v8
    && (id v9 = objc_alloc_init((Class)NSMutableSet),
        [(MSDHFileMetadataRestore *)v8 setPathsToSkip:v9],
        v9,
        [(MSDHFileMetadataRestore *)v8 setManifestUID:v6],
        [(MSDHFileMetadataRestore *)v8 setDeviceUID:v7],
        [(MSDHFileMetadataRestore *)v8 _gatherDeviceDemoUserAccountInfo]))
  {
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)restoreAttributesUnder:(id)a3 fromManifestData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  id v9 = sub_100027250();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]";
    __int16 v35 = 2114;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Restoring file attributes under: %{public}@", buf, 0x16u);
  }

  v10 = [(MSDHFileMetadataRestore *)self userHomePath];
  v11 = [v6 stringByAppendingPathComponent:v10];

  objc_super v12 = [(MSDHFileMetadataRestore *)self pathsToSkip];
  v13 = [v11 lowercaseString];
  [v12 addObject:v13];

  v14 = [MSDManifest alloc];
  v15 = [(MSDHFileMetadataRestore *)self userHomePath];
  v16 = [(MSDManifest *)v14 initWithDictionary:v7 andUserHomePath:v15];

  if (v16)
  {
    v17 = [(MSDManifest *)v16 pathSet];
    v18 = [v17 allObjects];

    id v19 = [v18 count];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E4A8;
    block[3] = &unk_10004CF48;
    v28 = &v29;
    v24 = v18;
    v25 = v16;
    id v26 = v6;
    v27 = self;
    dispatch_apply((size_t)v19, 0, block);
    BOOL v20 = *((unsigned char *)v30 + 24) != 0;

    v21 = v24;
  }
  else
  {
    v21 = sub_100027250();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100030C84(v21);
    }
    BOOL v20 = 0;
  }

  _Block_object_dispose(&v29, 8);

  return v20;
}

- (BOOL)_gatherDeviceDemoUserAccountInfo
{
  *__error() = 0;
  v3 = [(MSDHFileMetadataRestore *)self deviceUID];
  v4 = getpwuid((uid_t)[v3 unsignedIntValue]);

  if (v4)
  {
    v5 = getgrgid(v4->pw_gid);
    if (v5)
    {
      id v6 = v5;
      id v7 = [objc_alloc((Class)NSString) initWithUTF8String:v4->pw_name];
      [(MSDHFileMetadataRestore *)self setDeviceUserName:v7];

      v8 = +[NSNumber numberWithUnsignedInt:v4->pw_gid];
      [(MSDHFileMetadataRestore *)self setDeviceGID:v8];

      id v9 = [objc_alloc((Class)NSString) initWithUTF8String:v6->gr_name];
      [(MSDHFileMetadataRestore *)self setDeviceGroupName:v9];

      v10 = [(MSDHFileMetadataRestore *)self deviceUserName];
      v11 = NSHomeDirectoryForUser(v10);
      [(MSDHFileMetadataRestore *)self setUserHomePath:v11];

      return 1;
    }
    v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100030E28(self, &v4->pw_gid, v13);
    }
  }
  else
  {
    v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100030D48(self, v13);
    }
  }

  return 0;
}

- (id)_updateFileAttributesFromManifestData:(id)a3
{
  id v3 = a3;
  v23 = +[NSMutableDictionary dictionaryWithDictionary:v3];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  id v24 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  v4 = 0;
  v5 = 0;
  id v6 = 0;
  id v7 = 0;
  if (v24)
  {
    uint64_t v21 = *(void *)v28;
    while (2)
    {
      v8 = 0;
      id v9 = v4;
      v10 = v5;
      v11 = v6;
      objc_super v12 = v7;
      do
      {
        id v26 = v10;
        v13 = obj;
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v8);
        v4 = [obj objectForKey:v14];

        id v6 = [v4 objectForKey:@"MSDManifestFileAttributes"];

        id v7 = [(MSDHFileMetadataRestore *)self _updateFile:v14 withAttributes:v6];

        if (!v7)
        {
          id v19 = sub_100027250();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_100030F18();
          }

          id v7 = 0;
          id v17 = 0;
          v16 = v23;
          v18 = v26;
          goto LABEL_13;
        }
        v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

        [v5 setObject:v7 forKey:@"MSDManifestFileAttributes"];
        [v23 setObject:v5 forKey:v14];
        v8 = (char *)v8 + 1;
        id v9 = v4;
        v10 = v5;
        v11 = v6;
        objc_super v12 = v7;
      }
      while (v24 != v8);
      id v24 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }

  v16 = v23;
  id v17 = v23;
  v18 = v5;
  v13 = obj;
LABEL_13:

  return v17;
}

- (id)_updateFile:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKey:NSFileOwnerAccountID];
  id v9 = [(MSDHFileMetadataRestore *)self manifestUID];
  unsigned __int8 v10 = [v8 isEqualToNumber:v9];

  if (v10)
  {
    id v11 = [(MSDHFileMetadataRestore *)self _updateFileAttributes:v7];
  }
  else
  {
    objc_super v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100030F98((uint64_t)v6, (uint64_t)v8, v12);
    }

    id v11 = v7;
  }
  v13 = v11;

  return v13;
}

- (id)_updateFileAttributes:(id)a3
{
  v4 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  v5 = [(MSDHFileMetadataRestore *)self deviceUserName];
  [v4 setObject:v5 forKey:NSFileOwnerAccountName];

  id v6 = [(MSDHFileMetadataRestore *)self deviceGID];
  [v4 setObject:v6 forKey:NSFileGroupOwnerAccountID];

  id v7 = [(MSDHFileMetadataRestore *)self deviceGroupName];
  [v4 setObject:v7 forKey:NSFileGroupOwnerAccountName];

  v8 = [(MSDHFileMetadataRestore *)self deviceUID];
  [v4 setObject:v8 forKey:NSFileOwnerAccountID];

  return v4;
}

- (NSMutableSet)pathsToSkip
{
  return self->_pathsToSkip;
}

- (void)setPathsToSkip:(id)a3
{
}

- (NSString)userHomePath
{
  return self->_userHomePath;
}

- (void)setUserHomePath:(id)a3
{
}

- (NSNumber)manifestUID
{
  return self->_manifestUID;
}

- (void)setManifestUID:(id)a3
{
}

- (NSNumber)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
}

- (NSString)deviceUserName
{
  return self->_deviceUserName;
}

- (void)setDeviceUserName:(id)a3
{
}

- (NSNumber)deviceGID
{
  return self->_deviceGID;
}

- (void)setDeviceGID:(id)a3
{
}

- (NSString)deviceGroupName
{
  return self->_deviceGroupName;
}

- (void)setDeviceGroupName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroupName, 0);
  objc_storeStrong((id *)&self->_deviceGID, 0);
  objc_storeStrong((id *)&self->_deviceUserName, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_manifestUID, 0);
  objc_storeStrong((id *)&self->_userHomePath, 0);

  objc_storeStrong((id *)&self->_pathsToSkip, 0);
}

@end