@interface MSDManifest
- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5;
- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6;
- (BOOL)addFilesUsingSourceManifest:(id)a3;
- (BOOL)enumerateAndCollectMetaData:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6 handler:(id)a7;
- (BOOL)folder:(id)a3 contains:(id)a4;
- (BOOL)path:(id)a3 inSuperSet:(id)a4;
- (MSDManifest)init;
- (MSDManifest)initWithDictionary:(id)a3;
- (MSDManifest)initWithDictionary:(id)a3 andUserHomePath:(id)a4;
- (NSDictionary)dict;
- (NSSet)pathSet;
- (NSString)rootPath;
- (id)metadataForFile:(id)a3;
- (void)dealloc;
- (void)setDict:(id)a3;
- (void)setMetadata:(id)a3 forFile:(id)a4;
- (void)setRootPath:(id)a3;
@end

@implementation MSDManifest

- (MSDManifest)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDManifest;
  v2 = [(MSDManifest *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
    dict = v2->_dict;
    v2->_dict = v3;

    rootPath = v2->_rootPath;
    v2->_rootPath = 0;
  }
  return v2;
}

- (MSDManifest)initWithDictionary:(id)a3
{
  return [(MSDManifest *)self initWithDictionary:a3 andUserHomePath:0];
}

- (MSDManifest)initWithDictionary:(id)a3 andUserHomePath:(id)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDManifest;
  v6 = [(MSDManifest *)&v12 init];
  objc_super v7 = v6;
  if (v6)
  {
    rootPath = v6->_rootPath;
    v6->_rootPath = 0;

    v9 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v5];
    dict = v7->_dict;
    v7->_dict = v9;
  }
  return v7;
}

- (void)dealloc
{
  dict = self->_dict;
  self->_dict = 0;

  rootPath = self->_rootPath;
  self->_rootPath = 0;

  v5.receiver = self;
  v5.super_class = (Class)MSDManifest;
  [(MSDManifest *)&v5 dealloc];
}

- (id)metadataForFile:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_dict objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[MSDFileMetadata fileMetaDataWithMetadataDictionary:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMetadata:(id)a3 forFile:(id)a4
{
  dict = self->_dict;
  id v6 = a4;
  id v7 = [a3 dict];
  [(NSMutableDictionary *)dict setObject:v7 forKey:v6];
}

- (BOOL)folder:(id)a3 contains:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v6, "rangeOfString:", v11, (void)v17))
        {
          v13 = v12;
          if (v12 == [v6 length]
            || ([v6 substringFromIndex:v13],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                [v11 stringByAppendingPathComponent:v14],
                v15 = objc_claimAutoreleasedReturnValue(),
                (id)v14,
                LOBYTE(v14) = [v15 isEqualToString:v6],
                v15,
                (v14 & 1) != 0))
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v8;
}

- (BOOL)addFilesUsingSourceManifest:(id)a3
{
  id v4 = a3;
  v31 = +[NSFileManager defaultManager];
  uint64_t v5 = [(MSDManifest *)self rootPath];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 rootPath];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [(MSDManifest *)self rootPath];
      v10 = [v4 rootPath];
      unsigned __int8 v11 = [v9 isEqualToString:v10];

      if (v11)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        obj = [v4 dict];
        id v12 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v12)
        {
          id v13 = v12;
          id v27 = v4;
          uint64_t v30 = *(void *)v33;
          char v28 = 1;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v33 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v14);
              long long v17 = [(MSDManifest *)self rootPath];
              long long v18 = [v17 stringByAppendingPathComponent:v15];

              if ([v31 fileExistsAtPath:v18])
              {
                long long v19 = +[MSDFileMetadata fileMetadatatWithPath:v18];
                if (v19)
                {
                  long long v20 = v19;
                  v21 = [v19 getFileType];
                  unsigned int v22 = [v21 isEqualToString:NSFileTypeSymbolicLink];

                  if (v22)
                  {
                    v23 = sub_100068600();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v37 = "-[MSDManifest addFilesUsingSourceManifest:]";
                      __int16 v38 = 2114;
                      v39 = v18;
                      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is a symlink. Skipping.", buf, 0x16u);
                    }
                  }
                  else
                  {
                    [(MSDManifest *)self setMetadata:v20 forFile:v15];
                  }
                }
                else
                {
                  long long v20 = sub_100068600();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v37 = "-[MSDManifest addFilesUsingSourceManifest:]";
                    __int16 v38 = 2114;
                    v39 = v18;
                    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to get metadata for file: %{public}@. Skipping.", buf, 0x16u);
                  }
                  char v28 = 0;
                }
              }
              uint64_t v14 = (char *)v14 + 1;
            }
            while (v13 != v14);
            id v24 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
            id v13 = v24;
          }
          while (v24);
          id v4 = v27;
          char v25 = v28;
        }
        else
        {
          char v25 = 1;
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
  }
  obj = sub_100068600();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
    sub_1000D129C(obj);
  }
  char v25 = 0;
LABEL_29:

  return v25 & 1;
}

- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5
{
  return [(MSDManifest *)self addFilesFromPath:a3 relativeTo:a4 skip:a5 superSet:0];
}

- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100064394;
  v7[3] = &unk_100152EE0;
  v7[4] = self;
  return [(MSDManifest *)self enumerateAndCollectMetaData:a3 relativeTo:a4 skip:a5 superSet:a6 handler:v7];
}

- (BOOL)path:(id)a3 inSuperSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:@"/private"])
  {
    uint64_t v7 = [v5 substringFromIndex:[@"/private" length]];

    id v5 = (id)v7;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "hasPrefix:", v5, (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v9;
}

- (BOOL)enumerateAndCollectMetaData:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = (uint64_t (**)(void, void *, __CFString *))a7;
  if (self->_rootPath)
  {
    long long v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000D1430(v17);
    }
    BOOL v18 = 0;
    goto LABEL_54;
  }
  v67 = self;
  id v59 = v13;
  p_rootPath = &self->_rootPath;
  objc_storeStrong((id *)&self->_rootPath, a4);
  long long v19 = +[NSFileManager defaultManager];
  id v65 = v12;
  long long v20 = +[NSURL fileURLWithPath:v12];
  v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsRegularFileKey, NSURLIsSymbolicLinkKey, 0);
  unsigned int v22 = [v19 enumeratorAtURL:v20 includingPropertiesForKeys:v21 options:0 errorHandler:&stru_100152F20];

  v69 = v22;
  uint64_t v23 = [v22 nextObject];
  id v24 = 0;
  id v25 = 0;
  id v26 = 0;
  id v27 = 0;
  v64 = 0;
  char v68 = 0;
  BOOL v28 = v23 == 0;
  id v66 = v15;
  v63 = v16;
  while (1)
  {
    while (1)
    {
      id v29 = v14;
      uint64_t v30 = v26;
      v31 = v25;
      long long v32 = v24;
      long long v17 = v23;
      if (v28)
      {
        long long v17 = +[NSURL fileURLWithPath:v65];
        char v68 = 1;
      }
      id v75 = 0;
      id v76 = 0;
      unsigned __int8 v33 = [v17 getResourceValue:&v76 forKey:NSURLIsRegularFileKey error:&v75];
      id v25 = v76;

      id v34 = v75;
      if ((v33 & 1) == 0)
      {
        v51 = sub_100068600();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v54 = [v17 path];
          *(_DWORD *)buf = 138543618;
          NSURLResourceKey v80 = NSURLIsRegularFileKey;
          __int16 v81 = 2114;
          v82 = v54;
          _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Could not get resource for key %{public}@ for %{public}@", buf, 0x16u);
        }
        v61 = 0;
        goto LABEL_42;
      }
      id v73 = 0;
      id v74 = 0;
      unsigned __int8 v35 = [v17 getResourceValue:&v74 forKey:NSURLIsDirectoryKey error:&v73];
      id v24 = v74;

      id v36 = v73;
      if ((v35 & 1) == 0)
      {
        v53 = sub_100068600();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v55 = [v17 path];
          *(_DWORD *)buf = 138543618;
          NSURLResourceKey v80 = NSURLIsDirectoryKey;
          __int16 v81 = 2114;
          v82 = v55;
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Could not get resource for key %{public}@ for %{public}@", buf, 0x16u);

          v61 = 0;
          id v34 = v36;
          v51 = v53;
          goto LABEL_41;
        }
        v61 = 0;
        id v34 = v36;
        long long v32 = v24;
        v51 = v53;
LABEL_42:

        id v27 = v34;
        id v26 = v30;
        id v24 = v32;
        id v14 = v29;
        id v15 = v66;
        long long v16 = v63;
        v50 = v61;
        goto LABEL_34;
      }
      id v71 = 0;
      id v72 = 0;
      unsigned __int8 v37 = [v17 getResourceValue:&v72 forKey:NSURLIsSymbolicLinkKey error:&v71];
      id v26 = v72;

      id v27 = v71;
      if ((v37 & 1) == 0)
      {
        v51 = sub_100068600();
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        v52 = [v17 path];
        *(_DWORD *)buf = 138543618;
        NSURLResourceKey v80 = NSURLIsSymbolicLinkKey;
        __int16 v81 = 2114;
        v82 = v52;
        _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Could not get resource for key %{public}@ for %{public}@", buf, 0x16u);
        goto LABEL_38;
      }
      id v14 = v29;
      id v15 = v66;
      if (!v29
        || ([v17 path],
            __int16 v38 = objc_claimAutoreleasedReturnValue(),
            unsigned int v39 = [(MSDManifest *)v67 folder:v29 contains:v38],
            v38,
            !v39))
      {
        if (!v66) {
          break;
        }
        v40 = [v17 path];
        unsigned __int8 v41 = [(MSDManifest *)v67 path:v40 inSuperSet:v66];

        if (v41) {
          break;
        }
      }
      if ([v24 BOOLValue]) {
        [v69 skipDescendants];
      }
      uint64_t v23 = [v69 nextObject];

      BOOL v28 = v23 == 0;
      if (((v23 == 0) & v68) != 0)
      {

        BOOL v18 = 1;
        long long v17 = v69;
        id v12 = v65;
        id v13 = v59;
        long long v16 = v63;
        goto LABEL_54;
      }
    }
    if (([v25 BOOLValue] & 1) == 0
      && ([v24 BOOLValue] & 1) == 0
      && ![v26 BOOLValue])
    {
      v51 = sub_100068600();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
LABEL_39:
        v61 = 0;
        goto LABEL_40;
      }
      v52 = [v17 path];
      *(_DWORD *)buf = 138543362;
      NSURLResourceKey v80 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ is special file. Leave it along", buf, 0xCu);
LABEL_38:

      goto LABEL_39;
    }
    v42 = [v17 path];
    v43 = (char *)[v42 rangeOfString:*p_rootPath];
    uint64_t v60 = v44;

    if (v43)
    {
      if (v43 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v45 = 0;
        goto LABEL_28;
      }
      v58 = [v17 path];
      v47 = [v58 substringFromIndex:&v43[v60]];
      v45 = [v47 stringByReplacingOccurrencesOfString:*p_rootPath withString:&stru_100155450];

      v46 = v58;
    }
    else
    {
      v46 = [v17 path];
      v45 = [v46 stringByReplacingOccurrencesOfString:*p_rootPath withString:&stru_100155450];
    }

LABEL_28:
    if ([(__CFString *)v45 length])
    {
      v61 = v45;
    }
    else
    {

      v61 = @"/";
    }
    v48 = [v17 path];
    v49 = +[MSDFileMetadata fileMetadatatWithPath:v48];

    if (!v49)
    {
      v51 = sub_100068600();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_1000D1320(v77, v17, &v78, v51);
      }
      v64 = 0;
LABEL_40:
      id v34 = v27;
      uint64_t v30 = v26;
LABEL_41:
      long long v32 = v24;
      goto LABEL_42;
    }
    long long v16 = v63;
    v50 = v61;
    if ((v63[2](v63, v49, v61) & 1) == 0) {
      break;
    }
    v64 = v49;
LABEL_34:

    uint64_t v23 = [v69 nextObject];

    BOOL v28 = v23 == 0;
    if (((v23 == 0) & v68) != 0)
    {

      BOOL v18 = 1;
      long long v17 = v69;
      goto LABEL_55;
    }
  }
  v57 = sub_100068600();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
    sub_1000D1398(v17, v57);
  }

  BOOL v18 = 0;
LABEL_55:
  id v12 = v65;
  id v13 = v59;
LABEL_54:

  return v18;
}

- (NSSet)pathSet
{
  v2 = [(NSMutableDictionary *)self->_dict allKeys];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

- (NSString)rootPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRootPath:(id)a3
{
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);

  objc_storeStrong((id *)&self->_dict, 0);
}

@end