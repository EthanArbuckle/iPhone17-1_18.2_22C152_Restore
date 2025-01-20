@interface NSFileManager
- (BOOL)crl_directoryExistsAt:(id)a3;
- (BOOL)crl_grantUserWritePosixPermissionAtPath:(id)a3 error:(id *)a4;
@end

@implementation NSFileManager

- (BOOL)crl_grantUserWritePosixPermissionAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v39 = 0;
  v7 = [(NSFileManager *)self attributesOfItemAtPath:v6 error:&v39];
  id v8 = v39;
  v9 = [v7 fileType];
  if (([v9 isEqualToString:NSFileTypeDirectory] & 1) == 0
    && ([v9 isEqualToString:NSFileTypeRegular] & 1) == 0
    && ![v9 isEqualToString:NSFileTypeSymbolicLink])
  {
    BOOL v24 = 1;
    goto LABEL_27;
  }
  v31 = a4;
  v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)[v7 filePosixPermissions] | 0x80);
  v11 = +[NSDictionary dictionaryWithObject:v10 forKey:NSFilePosixPermissions];
  id v38 = v8;
  unsigned int v12 = [(NSFileManager *)self setAttributes:v11 ofItemAtPath:v6 error:&v38];
  id v13 = v38;

  if (v12)
  {
    if (![v9 isEqualToString:NSFileTypeDirectory])
    {
      BOOL v24 = 1;
LABEL_26:
      id v8 = v13;
      goto LABEL_27;
    }
    v30 = v9;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v33 = 0;
    v15 = [(NSFileManager *)self contentsOfDirectoryAtPath:v6 error:&v33];
    id v16 = v33;
    id v17 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v17)
    {
      id v18 = v17;
      v27 = v14;
      v28 = v13;
      v29 = v7;
      uint64_t v19 = *(void *)v35;
      while (2)
      {
        v20 = 0;
        v21 = v16;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v15);
          }
          v22 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v34 + 1) + 8 * (void)v20)];
          id v32 = v21;
          unsigned __int8 v23 = [(NSFileManager *)self crl_grantUserWritePosixPermissionAtPath:v22 error:&v32];
          id v16 = v32;

          if ((v23 & 1) == 0)
          {
            id v16 = v16;

            BOOL v24 = 0;
            id v13 = v16;
            v7 = v29;
            goto LABEL_18;
          }
          v20 = (char *)v20 + 1;
          v21 = v16;
        }
        while (v18 != v20);
        id v18 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      BOOL v24 = 1;
      id v13 = v28;
      v7 = v29;
LABEL_18:
      v14 = v27;
    }
    else
    {
      BOOL v24 = 1;
    }

    v9 = v30;
  }
  else
  {
    BOOL v24 = 0;
  }
  if (!v31 || v24) {
    goto LABEL_26;
  }
  if (v13)
  {
    id v8 = v13;
    BOOL v24 = 0;
    id *v31 = v8;
  }
  else
  {
    id v26 = +[NSError crl_fileWriteUnknownErrorWithUserInfo:0];
    id *v31 = v26;

    BOOL v24 = 0;
    id v8 = 0;
  }
LABEL_27:

  return v24;
}

- (BOOL)crl_directoryExistsAt:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  if (URL.isFileURL.getter())
  {
    HIBYTE(v14) = 0;
    URL.path.getter();
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = [(NSFileManager *)v9 fileExistsAtPath:v10 isDirectory:(char *)&v14 + 7];

    char v12 = v11 & HIBYTE(v14);
  }
  else
  {

    char v12 = 0;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v12;
}

@end