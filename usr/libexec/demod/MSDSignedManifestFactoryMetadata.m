@interface MSDSignedManifestFactoryMetadata
+ (id)languageIdentifiersForMetadataList:(id)a3;
+ (id)loadManifestMetadata:(id)a3;
+ (id)metadataWithLanugageIdentifier:(id)a3 fromList:(id)a4;
- (BOOL)isPrimaryBundle;
- (MSDSignedManifestFactoryMetadata)initWithContentPlistFile:(id)a3;
- (NSArray)supportedRegions;
- (NSString)bundleID;
- (NSString)fileName;
- (NSString)languageIdentifier;
- (NSString)name;
- (NSString)regionCode;
- (id)description;
@end

@implementation MSDSignedManifestFactoryMetadata

+ (id)loadManifestMetadata:(id)a3
{
  char v33 = 0;
  uint64_t v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x3032000000;
  v31[2] = sub_100096794;
  v31[3] = sub_1000967A4;
  id v3 = a3;
  id v32 = v3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100096794;
  v28[4] = sub_1000967A4;
  id v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100096794;
  v26 = sub_1000967A4;
  id v27 = (id)objc_opt_new();
  v4 = +[NSFileManager defaultManager];
  if ([v4 fileExistsAtPath:*(void *)(v31[0] + 40) isDirectory:&v33])
  {
    if (v33)
    {
      v5 = [v4 contentsOfDirectoryAtPath:*(void *)(v31[0] + 40) error:0];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000967AC;
      v21[3] = &unk_100153878;
      v21[4] = &v30;
      v21[5] = v28;
      v21[6] = &v22;
      [v5 enumerateObjectsUsingBlock:v21];
      goto LABEL_4;
    }
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D8D08((uint64_t)v31, v8, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D8D7C((uint64_t)v31, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  v5 = 0;
LABEL_4:
  id v6 = [(id)v23[5] copy];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(&v30, 8);

  return v6;
}

+ (id)languageIdentifiersForMetadataList:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 languageIdentifier:v14];
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

+ (id)metadataWithLanugageIdentifier:(id)a3 fromList:(id)a4
{
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 languageIdentifier:v13];
          if ([v11 isEqualToString:v5])
          {
            id v7 = v10;

            goto LABEL_13;
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (MSDSignedManifestFactoryMetadata)initWithContentPlistFile:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MSDSignedManifestFactoryMetadata;
  id v5 = [(MSDSignedManifestFactoryMetadata *)&v38 init];
  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    if ([v6 fileExistsAtPath:v4])
    {
      id v7 = +[NSMutableDictionary dictionaryWithContentsOfFile:v4];
      uint64_t v8 = sub_100068600();
      uint64_t v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v40 = v4;
          __int16 v41 = 2114;
          v42 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Content.plist at path %{public}@: %{public}@", buf, 0x16u);
        }

        uint64_t v10 = [v7 objectForKey:@"Name"];
        name = v5->_name;
        v5->_name = (NSString *)v10;

        uint64_t v12 = [v7 objectForKey:@"ManifestBundleID"];
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v12;

        uint64_t v14 = [v7 objectForKey:@"ManifestFileName"];
        fileName = v5->_fileName;
        v5->_fileName = (NSString *)v14;

        long long v16 = [v7 objectForKey:@"IsPrimaryBundle"];
        uint64_t v17 = [v7 objectForKey:@"ManifestLanguageCode"];
        languageIdentifier = v5->_languageIdentifier;
        v5->_languageIdentifier = (NSString *)v17;

        uint64_t v19 = [v7 objectForKey:@"ManifestRegionCode"];
        regionCode = v5->_regionCode;
        v5->_regionCode = (NSString *)v19;

        uint64_t v21 = [v7 objectForKey:@"SupportRegionCodes"];
        supportedRegions = v5->_supportedRegions;
        v5->_supportedRegions = (NSArray *)v21;

        if (v16) {
          unsigned __int8 v23 = [v16 BOOLValue];
        }
        else {
          unsigned __int8 v23 = 0;
        }
        v5->_isPrimaryBundle = v23;

        goto LABEL_10;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000D8E5C((uint64_t)v4, v9, v32, v33, v34, v35, v36, v37);
      }
    }
    else
    {
      uint64_t v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000D8EC8((uint64_t)v4, v9, v26, v27, v28, v29, v30, v31);
      }
    }

    uint64_t v24 = 0;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v24 = v5;
LABEL_11:

  return v24;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(MSDSignedManifestFactoryMetadata *)self name];
  id v6 = [(MSDSignedManifestFactoryMetadata *)self languageIdentifier];
  id v7 = [(MSDSignedManifestFactoryMetadata *)self regionCode];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: Name: %@; Language: %@; Region: %@>",
    v4,
    v5,
    v6,
  uint64_t v8 = v7);

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (BOOL)isPrimaryBundle
{
  return self->_isPrimaryBundle;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSArray)supportedRegions
{
  return self->_supportedRegions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRegions, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end