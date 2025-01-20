@interface MSDFileMetadata
+ (id)accessControlListWithPath:(id)a3;
+ (id)compareResultToNSString:(int)a3;
+ (id)extendedAttributeKeysWithPath:(id)a3;
+ (id)extendedAttributesWithPath:(id)a3;
+ (id)fileAttributesWithPath:(id)a3;
+ (id)fileHashWithPath:(id)a3;
+ (id)fileMetaDataWithMetadataDictionary:(id)a3;
+ (id)fileMetadatatWithPath:(id)a3;
+ (id)targetFileWithPath:(id)a3;
+ (id)valueForExtendedAttributesKey:(id)a3 forPath:(id)a4;
- (BOOL)removeAllExtendedAttributes:(id)a3;
- (BOOL)restoreAttribuesToPath:(id)a3;
- (MSDFileMetadata)initWithDictionary:(id)a3;
- (MSDFileMetadata)initWithPath:(id)a3;
- (NSData)getAccessControlList;
- (NSData)getHash;
- (NSDictionary)dict;
- (NSDictionary)getExtendedAttributes;
- (NSDictionary)getFileAttributes;
- (NSString)getFileType;
- (NSString)getTargetFile;
- (id)fileAttributesAllowSet:(id)a3;
- (int)compareWith:(id)a3;
- (int64_t)getFileSize;
- (void)dealloc;
@end

@implementation MSDFileMetadata

+ (id)fileHashWithPath:(id)a3
{
  id v3 = a3;
  char v11 = 0;
  v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3 isDirectory:&v11];

  if (v5)
  {
    if (v11)
    {
LABEL_3:
      v6 = +[NSData data];
      goto LABEL_5;
    }
    v7 = +[NSURL fileURLWithString:v3];
    v6 = [v7 fileHash];

    if (!v6)
    {
      v9 = sub_100027250();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Maybe it's an iCloud file (%{public}@)?", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
  else
  {
    v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002CD48();
    }

    v6 = 0;
  }
LABEL_5:

  return v6;
}

+ (id)fileAttributesWithPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v5 = [v4 attributesOfItemAtPath:v3 error:&v10];
  id v6 = v10;
  id v7 = [v5 mutableCopy];

  if (v6)
  {
    v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002CDB0((uint64_t)v3, v6);
    }
  }
  else
  {
    v11[0] = @"NSFileExtendedAttributes";
    v11[1] = NSFileReferenceCount;
    v11[2] = NSFileSystemNumber;
    v11[3] = NSFileSystemFileNumber;
    v8 = +[NSArray arrayWithObjects:v11 count:4];
    [v7 removeObjectsForKeys:v8];
  }

  return v7;
}

+ (id)extendedAttributeKeysWithPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:0];
  id v5 = v3;
  id v6 = (const char *)[v5 fileSystemRepresentation];
  ssize_t v7 = listxattr(v6, 0, 0, 1);
  if (v7 < 0)
  {
    v19 = sub_100027250();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002CE44();
    }

    id v11 = 0;
  }
  else
  {
    size_t v8 = v7;
    v9 = +[NSMutableData dataWithLength:v7];
    id v10 = v9;
    if (!v8)
    {
LABEL_6:
      v17 = +[NSArray arrayWithArray:v4];
      id v11 = v10;
      goto LABEL_7;
    }
    id v11 = v9;
    ssize_t v12 = listxattr(v6, (char *)[v11 mutableBytes], v8, 1);
    if (v12 > 0)
    {
      ssize_t v13 = v12;
      [v11 setLength:v12];
      ssize_t v14 = 0;
      do
      {
        v15 = (char *)[v11 bytes] + v14;
        v16 = +[NSString stringWithUTF8String:v15];
        [v4 addObject:v16];
        v14 += strlen(v15) + 1;
      }
      while (v14 < v13);
      goto LABEL_6;
    }
    v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002CEC0();
    }
  }
  v17 = 0;
LABEL_7:

  return v17;
}

+ (id)accessControlListWithPath:(id)a3
{
  id v3 = a3;
  file = acl_get_file((const char *)[v3 fileSystemRepresentation], ACL_TYPE_EXTENDED);
  if (!file)
  {
    if (*__error() == 2)
    {
      id v10 = +[NSData data];
      goto LABEL_9;
    }
    ssize_t v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002CF3C();
    }

    goto LABEL_23;
  }
  id v5 = file;
  if (acl_valid(file))
  {
    ssize_t v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002D070();
    }
    goto LABEL_16;
  }
  ssize_t v6 = acl_size(v5);
  ssize_t v7 = malloc_type_malloc(v6, 0xFA04FA24uLL);
  if (!v7)
  {
    ssize_t v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002CFBC();
    }
LABEL_16:

    acl_free(v5);
LABEL_23:
    id v10 = 0;
    goto LABEL_9;
  }
  size_t v8 = v7;
  ssize_t v9 = acl_copy_ext(v7, v5, v6);
  if (v9 < 0)
  {
    ssize_t v13 = sub_100027250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002CFF0();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = +[NSData dataWithBytes:v8 length:v9];
  }
  acl_free(v5);
  free(v8);
LABEL_9:

  return v10;
}

+ (id)valueForExtendedAttributesKey:(id)a3 forPath:(id)a4
{
  id v5 = a4;
  ssize_t v6 = (const char *)[a3 UTF8String];
  id v7 = v5;
  size_t v8 = (const char *)[v7 fileSystemRepresentation];
  id v9 = +[NSMutableData data];
  ssize_t v10 = getxattr(v8, v6, 0, 0, 0, 1);
  if (v10 < 0)
  {
    ssize_t v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002D0F0();
    }
  }
  else
  {
    id v11 = +[NSMutableData dataWithLength:v10];

    id v9 = v11;
    ssize_t v12 = getxattr(v8, v6, [v9 mutableBytes], v10, 0, 1);
    if ((v12 & 0x8000000000000000) == 0)
    {
      [v9 setLength:v12];
      goto LABEL_4;
    }
    ssize_t v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002D164();
    }
  }

LABEL_4:

  return v9;
}

+ (id)extendedAttributesWithPath:(id)a3
{
  id v3 = a3;
  v4 = +[MSDFileMetadata extendedAttributeKeysWithPath:v3];
  if (v4)
  {
    id v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
    if ([v4 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v18 = v4;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        id v8 = v7;
        id v9 = 0;
        uint64_t v10 = *(void *)v20;
        do
        {
          id v11 = 0;
          ssize_t v12 = v9;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
            id v9 = +[MSDFileMetadata valueForExtendedAttributesKey:v13 forPath:v3];

            [v5 setObject:v9 forKey:v13];
            id v11 = (char *)v11 + 1;
            ssize_t v12 = v9;
          }
          while (v8 != v11);
          id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v8);
      }
      else
      {
        id v9 = 0;
      }

      v4 = v18;
    }
    else
    {
      id v9 = 0;
    }
    ssize_t v14 = +[NSDictionary dictionaryWithDictionary:v5];
  }
  else
  {
    v17 = sub_100027250();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002D1CC();
    }

    id v9 = 0;
    id v5 = 0;
    ssize_t v14 = 0;
  }
  id v15 = v14;

  return v15;
}

+ (id)targetFileWithPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  id v5 = [v4 destinationOfSymbolicLinkAtPath:v3 error:&v9];
  id v6 = v9;

  if (v6)
  {
    id v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002D234((uint64_t)v3, v6);
    }
  }

  return v5;
}

- (MSDFileMetadata)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDFileMetadata;
  id v6 = [(MSDFileMetadata *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dict, a3);
  }

  return v7;
}

- (MSDFileMetadata)initWithPath:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MSDFileMetadata;
  id v5 = [(MSDFileMetadata *)&v19 init];
  if (v5)
  {
    id v6 = +[NSMutableDictionary dictionary];
    id v7 = +[MSDFileMetadata fileAttributesWithPath:v4];
    if (v7)
    {
      uint64_t v8 = +[MSDFileMetadata extendedAttributesWithPath:v4];
      if (v8)
      {
        objc_super v9 = (void *)v8;
        uint64_t v10 = [v7 objectForKey:NSFileType];
        unsigned int v11 = [v10 isEqualToString:NSFileTypeSymbolicLink];

        if (v11)
        {
          uint64_t v12 = +[MSDFileMetadata targetFileWithPath:v4];
          if (v12)
          {
            uint64_t v13 = (void *)v12;
            [v6 setObject:v12 forKey:@"MSDManifestSymbolicLinkTargetFile"];

            [v6 setObject:v7 forKey:@"MSDManifestFileAttributes"];
            ssize_t v14 = 0;
            p_super = 0;
LABEL_11:
            if ([v9 count]) {
              [v6 setObject:v9 forKey:@"MSDManifestFileExtendedAttributes"];
            }
            if (p_super && [p_super length]) {
              [v6 setObject:p_super forKey:@"MSDManifestFileACL"];
            }
            objc_storeStrong((id *)&v5->_dict, v6);

            goto LABEL_17;
          }
          goto LABEL_24;
        }
        uint64_t v16 = +[MSDFileMetadata accessControlListWithPath:v4];
        if (!v16)
        {
LABEL_24:
          p_super = &v5->super;
          goto LABEL_26;
        }
        p_super = v16;
        uint64_t v17 = +[MSDFileMetadata fileHashWithPath:v4];
        if (v17)
        {
          ssize_t v14 = (void *)v17;
          [v6 setObject:v7 forKey:@"MSDManifestFileAttributes"];
          if ([v14 length]) {
            [v6 setObject:v14 forKey:@"MSDManifestFileHash"];
          }
          goto LABEL_11;
        }

LABEL_26:
        id v5 = 0;
LABEL_17:

        goto LABEL_18;
      }
      p_super = sub_100027250();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_10002D330();
      }
    }
    else
    {
      p_super = sub_100027250();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_10002D2C8();
      }
    }
    objc_super v9 = v5;
    goto LABEL_26;
  }
LABEL_18:

  return v5;
}

+ (id)fileMetadatatWithPath:(id)a3
{
  id v3 = a3;
  id v4 = [[MSDFileMetadata alloc] initWithPath:v3];

  return v4;
}

+ (id)fileMetaDataWithMetadataDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[MSDFileMetadata alloc] initWithDictionary:v3];

  return v4;
}

- (void)dealloc
{
  dict = self->_dict;
  self->_dict = 0;

  v4.receiver = self;
  v4.super_class = (Class)MSDFileMetadata;
  [(MSDFileMetadata *)&v4 dealloc];
}

- (BOOL)removeAllExtendedAttributes:(id)a3
{
  id v3 = a3;
  objc_super v4 = (const char *)[v3 fileSystemRepresentation];
  BOOL v5 = 1;
  ssize_t v6 = listxattr(v4, 0, 0, 1);
  if (v6 >= 1)
  {
    size_t v7 = v6;
    uint64_t v8 = (char *)malloc_type_malloc(v6, 0x5903D745uLL);
    if (v8)
    {
      objc_super v9 = v8;
      ssize_t v10 = listxattr(v4, v8, v7, 1);
      if (v10 < 1)
      {
        ssize_t v14 = sub_100027250();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10002D3CC();
        }
      }
      else
      {
        unsigned int v11 = &v9[v10];
        uint64_t v12 = v9;
        while (!removexattr(v4, v12, 1))
        {
          v12 += strlen(v12) + 1;
          if (v12 >= v11)
          {
            BOOL v5 = 1;
            goto LABEL_8;
          }
        }
        ssize_t v14 = sub_100027250();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10002D400();
        }
      }

      BOOL v5 = 0;
LABEL_8:
      free(v9);
    }
    else
    {
      id v15 = sub_100027250();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10002D398();
      }

      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)restoreAttribuesToPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSFileManager defaultManager];
  ssize_t v6 = [(MSDFileMetadata *)self getFileType];
  unsigned int v7 = [v6 isEqualToString:NSFileTypeSymbolicLink];

  v62 = v5;
  if (v7)
  {
    id v8 = v4;
    objc_super v9 = (const char *)[v8 UTF8String];
    ssize_t v10 = [(MSDFileMetadata *)self getFileAttributes];
    unsigned int v11 = [v10 fileOwnerAccountID];
    uid_t v12 = [v11 intValue];
    uint64_t v13 = [(MSDFileMetadata *)self getFileAttributes];
    ssize_t v14 = [v13 fileGroupOwnerAccountID];
    LODWORD(v9) = lchown(v9, v12, (gid_t)[v14 intValue]);

    if (v9)
    {
      v50 = sub_100027250();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_10002D740();
      }
    }
    else
    {
      id v15 = (const char *)[v8 UTF8String];
      uint64_t v16 = [(MSDFileMetadata *)self getFileAttributes];
      LODWORD(v15) = lchmod(v15, (mode_t)[v16 filePosixPermissions]);

      if (!v15)
      {
        id v17 = 0;
        goto LABEL_8;
      }
      v52 = sub_100027250();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_10002D6C4();
      }
    }
    BOOL v48 = 0;
    id v17 = 0;
    goto LABEL_53;
  }
  v18 = [(MSDFileMetadata *)self getFileAttributes];
  objc_super v19 = [(MSDFileMetadata *)self fileAttributesAllowSet:v18];
  id v71 = 0;
  unsigned __int8 v20 = [v5 setAttributes:v19 ofItemAtPath:v4 error:&v71];
  id v17 = v71;

  if ((v20 & 1) == 0)
  {
    v51 = sub_100027250();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v55 = [v17 localizedDescription];
      v56 = [(MSDFileMetadata *)self getFileAttributes];
      v57 = [(MSDFileMetadata *)self fileAttributesAllowSet:v56];
      *(_DWORD *)buf = 138543874;
      id v74 = v4;
      __int16 v75 = 2114;
      v76 = v55;
      __int16 v77 = 2114;
      v78 = v57;
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Could not set file attributes at %{public}@ with error - %{public}@, attributes = %{public}@", buf, 0x20u);
    }
    BOOL v48 = 0;
    id v33 = 0;
    id v30 = 0;
    goto LABEL_41;
  }
  long long v21 = [(MSDFileMetadata *)self getFileAttributes];
  long long v22 = [v21 objectForKey:NSFileProtectionKey];
  v23 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v22, NSFileProtectionKey, 0);
  id v70 = v17;
  unsigned __int8 v24 = [v5 setAttributes:v23 ofItemAtPath:v4 error:&v70];
  id v25 = v70;

  if ((v24 & 1) == 0)
  {
    v53 = sub_100027250();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v58 = [v25 localizedDescription];
      v59 = [(MSDFileMetadata *)self getFileAttributes];
      v60 = [v59 objectForKey:NSFileProtectionKey];
      *(_DWORD *)buf = 138543874;
      id v74 = v4;
      __int16 v75 = 2114;
      v76 = v58;
      __int16 v77 = 2114;
      v78 = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Could not set file protection key at %{public}@ with error - %{public}@, attributes = %{public}@", buf, 0x20u);
    }
    BOOL v48 = 0;
    id v33 = 0;
    id v30 = 0;
    id v17 = v25;
    goto LABEL_57;
  }
  id v17 = v25;
LABEL_8:
  if (![(MSDFileMetadata *)self removeAllExtendedAttributes:v4])
  {
    BOOL v48 = 0;
LABEL_53:
    id v33 = 0;
    id v30 = 0;
LABEL_57:
    BOOL v5 = v62;
    goto LABEL_41;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v26 = [(MSDFileMetadata *)self getExtendedAttributes];
  v27 = [v26 allKeys];

  id obj = v27;
  id v28 = [v27 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (!v28)
  {
    id v30 = 0;
    goto LABEL_21;
  }
  id v29 = v28;
  id v61 = v17;
  id v30 = 0;
  id v31 = 0;
  uint64_t v64 = *(void *)v67;
  v65 = self;
  while (2)
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v67 != v64) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(id *)(*((void *)&v66 + 1) + 8 * i);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v47 = sub_100027250();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_10002D690();
        }
        goto LABEL_34;
      }
      v34 = [(MSDFileMetadata *)v65 getExtendedAttributes];
      v35 = [v34 objectForKey:v33];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v47 = sub_100027250();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_10002D65C();
        }
        id v30 = v35;
        goto LABEL_34;
      }
      id v36 = v4;
      v37 = (const char *)[v4 fileSystemRepresentation];
      id v31 = v33;
      v38 = (const char *)[v31 UTF8String];
      id v30 = v35;
      if (setxattr(v37, v38, [v30 bytes], (size_t)objc_msgSend(v30, "length"), 0, 1))
      {
        v47 = sub_100027250();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_10002D5F4();
        }
        id v4 = v36;
LABEL_34:
        BOOL v5 = v62;
        id v17 = v61;

        goto LABEL_40;
      }
      id v4 = v36;
    }
    id v29 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v29) {
      continue;
    }
    break;
  }

  id v17 = v61;
  self = v65;
LABEL_21:

  [(MSDFileMetadata *)self getFileType];
  v40 = v39 = self;
  unsigned __int8 v41 = [v40 isEqualToString:NSFileTypeSymbolicLink];

  BOOL v5 = v62;
  if ((v41 & 1) == 0)
  {
    v42 = [(MSDFileMetadata *)v39 getAccessControlList];
    id v43 = [v42 length];

    if (v43)
    {
      id v44 = [(MSDFileMetadata *)v39 getAccessControlList];
      v45 = acl_copy_int([v44 bytes]);

      if (!v45)
      {
        v46 = sub_100027250();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_10002D574();
        }
        goto LABEL_65;
      }
LABEL_36:
      if (acl_valid(v45))
      {
        v54 = sub_100027250();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_10002D070();
        }
      }
      else
      {
        if (!acl_set_file((const char *)[v4 fileSystemRepresentation], ACL_TYPE_EXTENDED, v45))goto LABEL_38; {
        v54 = sub_100027250();
        }
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_10002D4F4();
        }
      }

LABEL_38:
      acl_free(v45);
    }
    else
    {
      v45 = acl_init(0);
      if (v45) {
        goto LABEL_36;
      }
      v46 = sub_100027250();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10002D474();
      }
LABEL_65:
    }
  }
  id v33 = 0;
LABEL_40:
  BOOL v48 = 1;
LABEL_41:

  return v48;
}

- (int)compareWith:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(MSDFileMetadata *)self getFileType];
    ssize_t v6 = [v4 getFileType];
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      id v8 = [(MSDFileMetadata *)self getFileType];
      unsigned int v9 = [v8 isEqualToString:NSFileTypeRegular];

      if (v9
        && ([(MSDFileMetadata *)self getHash],
            ssize_t v10 = objc_claimAutoreleasedReturnValue(),
            [v4 getHash],
            unsigned int v11 = objc_claimAutoreleasedReturnValue(),
            unsigned int v12 = [v10 isEqualToData:v11],
            v11,
            v10,
            !v12))
      {
        int v47 = 2;
      }
      else
      {
        uint64_t v13 = [(MSDFileMetadata *)self getFileType];
        unsigned int v14 = [v13 isEqualToString:NSFileTypeSymbolicLink];

        if (!v14
          || ([(MSDFileMetadata *)self getTargetFile],
              id v15 = objc_claimAutoreleasedReturnValue(),
              [v4 getTargetFile],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              unsigned int v17 = [v15 isEqualToString:v16],
              v16,
              v15,
              v17))
        {
          v56 = self;
          v18 = [(MSDFileMetadata *)self getFileAttributes];
          v57 = v4;
          objc_super v19 = [v4 getFileAttributes];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v20 = v18;
          id v21 = [v20 countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v58 = *(void *)v64;
            while (2)
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v64 != v58) {
                  objc_enumerationMutation(v20);
                }
                unsigned __int8 v24 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                if (([v24 isEqualToString:NSFileGroupOwnerAccountID] & 1) != 0
                  || ([v24 isEqualToString:NSFileOwnerAccountID] & 1) != 0
                  || [v24 isEqualToString:NSFilePosixPermissions])
                {
                  id v25 = [v20 objectForKey:v24];
                  [v19 objectForKey:v24];
                  v27 = id v26 = v20;
                  unsigned int v28 = [v25 isEqual:v27];

                  id v20 = v26;
                  if (!v28)
                  {
                    int v47 = 4;
                    v34 = v26;
                    v35 = v19;
                    id v4 = v57;
                    goto LABEL_54;
                  }
                }
                if ([v24 isEqualToString:NSFileProtectionKey])
                {
                  id v29 = [v20 objectForKey:v24];
                  id v30 = [v19 objectForKey:v24];
                  if (([v29 isEqualToString:v30] & 1) == 0)
                  {
                    unsigned __int8 v31 = [v29 isEqualToString:NSFileProtectionNone];
                    unsigned __int8 v32 = v30 ? 0 : v31;
                    if ((v32 & 1) == 0
                      && !v29
                      && ([v30 isEqualToString:NSFileProtectionNone] & 1) != 0)
                    {
                      int v47 = 4;
                      v35 = v19;
                      v34 = v20;
LABEL_52:
                      id v4 = v57;
                      goto LABEL_53;
                    }
                  }
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v63 objects:v68 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          id v33 = v56;
          v34 = [(MSDFileMetadata *)v56 getExtendedAttributes];

          id v4 = v57;
          v35 = [v57 getExtendedAttributes];

          if (v34)
          {
            if (v35)
            {
              id v36 = +[NSMutableDictionary dictionaryWithDictionary:v34];
              id v30 = +[NSMutableDictionary dictionaryWithDictionary:v35];
              [v36 removeObjectForKey:@"com.apple.assetsd.dbRebuildUuid"];
              [v30 removeObjectForKey:@"com.apple.assetsd.dbRebuildUuid"];
              id v37 = [v36 count];
              if (v37 != [v30 count])
              {
                int v47 = 4;
                id v20 = v36;
                goto LABEL_53;
              }
              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id v38 = v36;
              id v39 = [v38 countByEnumeratingWithState:&v59 objects:v67 count:16];
              if (v39)
              {
                id v40 = v39;
                uint64_t v41 = *(void *)v60;
                while (2)
                {
                  for (j = 0; j != v40; j = (char *)j + 1)
                  {
                    if (*(void *)v60 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    uint64_t v43 = *(void *)(*((void *)&v59 + 1) + 8 * (void)j);
                    id v44 = [v38 objectForKey:v43];
                    v45 = [v30 objectForKey:v43];
                    unsigned int v46 = [v44 isEqualToData:v45];

                    if (!v46)
                    {
                      id v20 = v38;

                      int v47 = 4;
                      goto LABEL_52;
                    }
                  }
                  id v40 = [v38 countByEnumeratingWithState:&v59 objects:v67 count:16];
                  if (v40) {
                    continue;
                  }
                  break;
                }
              }

              id v33 = v56;
              id v4 = v57;
LABEL_47:
              BOOL v48 = [(MSDFileMetadata *)v33 getFileType];
              unsigned __int8 v49 = [v48 isEqualToString:NSFileTypeSymbolicLink];

              if (v49)
              {
                int v47 = 5;
                goto LABEL_55;
              }
              id v20 = [(MSDFileMetadata *)v33 getAccessControlList];
              uint64_t v51 = [v4 getAccessControlList];
              id v30 = (void *)v51;
              if (v20)
              {
                if (v51)
                {
                  [(MSDFileMetadata *)v56 getAccessControlList];
                  v53 = id v52 = v20;
                  v54 = [v4 getAccessControlList];
                  unsigned __int8 v55 = [v53 isEqualToData:v54];

                  id v20 = v52;
                  if (v55) {
                    goto LABEL_60;
                  }
                }
              }
              else if (!v51)
              {
LABEL_60:
                int v47 = 5;
                goto LABEL_53;
              }
              int v47 = 4;
LABEL_53:

LABEL_54:
              goto LABEL_55;
            }
          }
          else
          {
            if (!v35) {
              goto LABEL_47;
            }
            v34 = 0;
          }
          int v47 = 4;
LABEL_55:

          goto LABEL_56;
        }
        int v47 = 3;
      }
    }
    else
    {
      int v47 = 1;
    }
  }
  else
  {
    int v47 = 0;
  }
LABEL_56:

  return v47;
}

- (id)fileAttributesAllowSet:(id)a3
{
  id v3 = a3;
  id v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSFileBusy, NSFileHFSCreatorCode, NSFileHFSTypeCode, NSFileImmutable, NSFileCreationDate, NSFileExtensionHidden, NSFileGroupOwnerAccountID, NSFileGroupOwnerAccountName, NSFileModificationDate, NSFileOwnerAccountID, NSFileOwnerAccountName, NSFilePosixPermissions, 0);
  BOOL v5 = [v3 allKeys];
  ssize_t v6 = +[NSMutableArray arrayWithArray:v5];

  [v6 removeObjectsInArray:v4];
  unsigned int v7 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  [v7 removeObjectsForKeys:v6];

  return v7;
}

- (NSData)getHash
{
  v2 = [(NSDictionary *)self->_dict objectForKey:@"MSDManifestFileHash"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSData *)v2;
}

- (NSDictionary)getFileAttributes
{
  v2 = [(NSDictionary *)self->_dict objectForKey:@"MSDManifestFileAttributes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (NSDictionary)getExtendedAttributes
{
  v2 = [(NSDictionary *)self->_dict objectForKey:@"MSDManifestFileExtendedAttributes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (NSData)getAccessControlList
{
  v2 = [(NSDictionary *)self->_dict objectForKey:@"MSDManifestFileACL"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSData *)v2;
}

- (NSString)getFileType
{
  v2 = [(NSDictionary *)self->_dict objectForKey:@"MSDManifestFileAttributes"];
  id v3 = [v2 objectForKey:NSFileType];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)getTargetFile
{
  v2 = [(NSDictionary *)self->_dict objectForKey:@"MSDManifestSymbolicLinkTargetFile"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSString *)v2;
}

- (int64_t)getFileSize
{
  v2 = [(NSDictionary *)self->_dict objectForKey:@"MSDManifestFileAttributes"];
  id v3 = [v2 fileType];
  unsigned int v4 = [v3 isEqualToString:@"NSFileTypeRegular"];

  if (v4) {
    id v5 = [v2 fileSize];
  }
  else {
    id v5 = 0;
  }

  return (int64_t)v5;
}

+ (id)compareResultToNSString:(int)a3
{
  if (a3 > 5) {
    return @"Unknown compare result.";
  }
  else {
    return *(&off_10004CCB8 + a3);
  }
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end