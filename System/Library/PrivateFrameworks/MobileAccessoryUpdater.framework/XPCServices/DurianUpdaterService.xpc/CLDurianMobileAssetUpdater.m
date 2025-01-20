@interface CLDurianMobileAssetUpdater
- (BOOL)createCacheDirectory:(id *)a3;
- (BOOL)isDeploymentAllowed:(id)a3;
- (CLDurianMobileAssetUpdater)init;
- (NSString)firmwareBundleFilename;
- (NSString)updatedSystemVersion;
- (NSURL)firmwareBundleURL;
- (id)assetWithMaxVersion:(id)a3;
- (id)getBuildIdentities;
- (id)getFTAB;
- (id)getUpdatedSystemVersion;
- (id)overrideQueryPredicateFromDict:(id)a3;
- (id)queryPredicate;
- (id)validateAsset;
- (id)validateAssetAttributes:(id)a3;
- (unint64_t)currentMajorVersion;
- (unint64_t)currentMinorVersion;
- (unint64_t)currentReleaseVersion;
- (void)setCurrentMajorVersion:(unint64_t)a3;
- (void)setCurrentMinorVersion:(unint64_t)a3;
- (void)setCurrentReleaseVersion:(unint64_t)a3;
- (void)setCurrentSystemVersion:(id)a3;
- (void)setFirmwareBundleFilename:(id)a3;
- (void)setFirmwareBundleURL:(id)a3;
- (void)setUpdatedSystemVersion:(id)a3;
- (void)splitSuperBinary;
@end

@implementation CLDurianMobileAssetUpdater

- (CLDurianMobileAssetUpdater)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLDurianMobileAssetUpdater;
  v2 = [(CLDurianMobileAssetUpdater *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(CLDurianMobileAssetUpdater *)v2 setAssetType:@"com.apple.MobileAsset.MobileAccessoryUpdate.DurianFirmware"];
    uint64_t v4 = +[NSURL fileURLWithPath:@"/private/var/db/accessoryupdater/DurianUpdaterService/"];
    cacheDir = v3->_cacheDir;
    v3->_cacheDir = (NSURL *)v4;

    [(CLDurianMobileAssetUpdater *)v3 setDownloadOnCellularAllowed:1];
  }
  return v3;
}

- (void)setCurrentSystemVersion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Current system version is %@", (uint8_t *)&v9, 0xCu);
  }
  v5 = [v4 componentsSeparatedByString:@"."];
  v6 = [v5 objectAtIndex:0];
  -[CLDurianMobileAssetUpdater setCurrentMajorVersion:](self, "setCurrentMajorVersion:", [v6 longLongValue]);

  objc_super v7 = [v5 objectAtIndex:1];
  -[CLDurianMobileAssetUpdater setCurrentMinorVersion:](self, "setCurrentMinorVersion:", [v7 longLongValue]);

  v8 = [v5 objectAtIndex:2];
  -[CLDurianMobileAssetUpdater setCurrentReleaseVersion:](self, "setCurrentReleaseVersion:", [v8 longLongValue]);
}

- (void)splitSuperBinary
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [(CLDurianMobileAssetUpdater *)self asset];
    id v4 = [v3 getLocalFileUrl];
    *(_DWORD *)buf = 138412290;
    v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Splitting SuperBinary at URL %@", buf, 0xCu);
  }
  v5 = +[NSMutableDictionary dictionaryWithCapacity:2];
  id v38 = objc_alloc_init((Class)NSMutableArray);
  id v40 = 0;
  v36 = [(CLDurianMobileAssetUpdater *)self firmwareBundleURL];
  v6 = [v36 URLByAppendingPathComponent:@"DurianFirmwareMobileAsset.bin"];
  id v7 = [objc_alloc((Class)NSMutableData) initWithContentsOfURL:v6];
  v8 = (unsigned __int8 *)[v7 bytes];
  v31 = v7;
  [v7 length];
  v35 = v8;
  int v9 = (unsigned __int16 *)parseSuperBinaryAndPayloadHeaders();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 absoluteString];
    int v11 = v9[8];
    *(_DWORD *)buf = 138412546;
    v42 = v10;
    __int16 v43 = 1024;
    int v44 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Splitting SuperBinary image=%@ into %d files", buf, 0x12u);
  }
  v30 = +[NSString stringWithFormat:@"%d.%d.%d", *v8, v8[1], *((unsigned __int16 *)v8 + 1)];
  objc_msgSend(v5, "setObject:forKey:");
  v12 = +[NSNumber numberWithInteger:4];
  v33 = v5;
  [v5 setObject:v12 forKey:@"Alignment"];

  v32 = v6;
  if (v9[8])
  {
    unint64_t v13 = 0;
    v14 = 0;
    v15 = (char *)(v9 + 10);
    v34 = v9;
    do
    {
      id v16 = [objc_alloc((Class)NSString) initWithBytes:v15 length:4 encoding:4];
      uint64_t v17 = +[NSString stringWithFormat:@"%d.%d.%d", v15[8], v15[9], *((unsigned __int16 *)v15 + 5)];
      v18 = +[NSString stringWithFormat:@"%c%c%c%c", *v15, v15[1], v15[2], v15[3]];
      id v19 = objc_alloc_init((Class)NSMutableDictionary);
      v39 = (void *)v17;
      [v19 setObject:v17 forKey:@"Version"];
      [v19 setObject:v18 forKey:@"Tag"];
      v20 = +[NSNumber numberWithInteger:*((unsigned int *)v15 + 1)];
      [v19 setObject:v20 forKey:@"Flags"];

      v21 = +[NSNumber numberWithInteger:*((unsigned int *)v15 + 4)];
      [v19 setObject:v21 forKey:@"Size"];

      v22 = v16;
      if ([v16 isEqualToString:@"IM4M"])
      {
        [v38 addObject:v19];
      }
      else
      {
        v37 = [v36 URLByAppendingPathComponent:v16];

        id v23 = [objc_alloc((Class)NSData) initWithBytes:&v35[*((unsigned int *)v15 + 3)] length:*((unsigned int *)v15 + 4)];
        v24 = [v37 URLByAppendingPathExtension:@"bin"];
        v25 = [v24 path];
        [v23 writeToFile:v25 atomically:0];

        v26 = +[NSString stringWithFormat:@"./%@.bin", v18];
        [v19 setObject:v26 forKey:@"FilePath"];

        [v38 addObject:v19];
        int v9 = v34;
        v14 = v37;
      }

      ++v13;
      v15 += 20;
    }
    while (v13 < v9[8]);
  }
  else
  {
    v14 = 0;
  }
  [v33 setObject:v38 forKey:@"Items"];
  v27 = +[NSPropertyListSerialization dataFromPropertyList:v33 format:100 errorDescription:&v40];
  v28 = [v36 URLByAppendingPathComponent:@"input.plist"];

  v29 = [v28 path];
  [v27 writeToFile:v29 atomically:1];

  free(v9);
}

- (id)getBuildIdentities
{
  v2 = [(CLDurianMobileAssetUpdater *)self asset];
  v3 = [v2 getLocalFileUrl];

  id v4 = [v3 URLByAppendingPathComponent:@"Firmware.acsw"];
  v5 = [v4 filePathURL];

  v6 = +[NSURL fileURLWithPath:@"BuildManifest.plist" isDirectory:0 relativeToURL:v5];
  id v7 = +[NSDictionary dictionaryWithContentsOfURL:v6];

  v8 = [v7 objectForKey:@"BuildIdentities"];

  return v8;
}

- (id)getFTAB
{
  v2 = [(CLDurianMobileAssetUpdater *)self firmwareBundleURL];
  v3 = +[NSURL fileURLWithPath:@"ftab.bin" isDirectory:0 relativeToURL:v2];
  id v4 = +[NSData dataWithContentsOfURL:v3];

  return v4;
}

- (id)getUpdatedSystemVersion
{
  return [(CLDurianMobileAssetUpdater *)self updatedSystemVersion];
}

- (id)overrideQueryPredicateFromDict:(id)a3
{
  return 0;
}

- (id)queryPredicate
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007108;
  v4[3] = &unk_10000C318;
  v4[4] = self;
  v2 = +[NSPredicate predicateWithBlock:v4];
  return v2;
}

- (id)assetWithMaxVersion:(id)a3
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = a3;
  id v29 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v29)
  {
    id v24 = 0;
    id v26 = 0;
    v27 = 0;
    id v30 = 0;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v5 = [v4 attributes];
        v6 = [v5 objectForKey:@"FirmwareVersionMajor"];
        id v7 = [v6 unsignedLongLongValue];
        v8 = [v5 objectForKey:@"FirmwareVersionMinor"];

        id v9 = [v8 unsignedLongLongValue];
        id v10 = [v5 objectForKey:@"FirmwareVersionRelease"];

        id v11 = [v10 unsignedLongLongValue];
        v12 = [v5 objectForKey:@"MinimumRequiredFirmwareVersionMajor"];

        id v13 = [v12 unsignedLongLongValue];
        v14 = [v5 objectForKey:@"MinimumRequiredFirmwareVersionMinor"];

        id v15 = [v14 unsignedLongLongValue];
        id v16 = [v5 objectForKey:@"MinimumRequiredFirmwareVersionRelease"];

        id v17 = [v16 unsignedLongLongValue];
        unint64_t currentMajorVersion = self->_currentMajorVersion;
        if (currentMajorVersion > (unint64_t)v13
          || (id)currentMajorVersion == v13
          && ((unint64_t currentMinorVersion = self->_currentMinorVersion, currentMinorVersion > (unint64_t)v15)
           || (id)currentMinorVersion == v15 && self->_currentReleaseVersion >= (unint64_t)v17))
        {
          if (v7 > v30 || v7 == v30 && (v9 > v26 || v9 == v26 && v11 > v24))
          {
            id v19 = v4;

            id v24 = v11;
            id v26 = v9;
            v27 = v19;
            id v30 = v7;
          }
        }
      }
      id v29 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v29);
  }
  else
  {
    id v24 = 0;
    id v26 = 0;
    v27 = 0;
    id v30 = 0;
  }
  v21 = +[NSString stringWithFormat:@"%llu.%llu.%llu", v30, v26, v24];
  [(CLDurianMobileAssetUpdater *)self setUpdatedSystemVersion:v21];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v27 attributes];
    *(_DWORD *)buf = 138412290;
    v37 = v22;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Asset attributes: %@", buf, 0xCu);
  }
  return v27;
}

- (id)validateAssetAttributes:(id)a3
{
  id v4 = [a3 objectForKey:@"FirmwareBundle"];
  [(CLDurianMobileAssetUpdater *)self setFirmwareBundleFilename:v4];

  return 0;
}

- (BOOL)isDeploymentAllowed:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Querying whether deployment is allowed - attributes: %@", (uint8_t *)&v9, 0xCu);
  }
  id v4 = [v3 objectForKey:@"DeploymentList"];
  if (v4)
  {
    id v5 = [objc_alloc((Class)UARPAssetID) initWithLocationType:3 remotePath:0];
    [v5 processUARPDeploymentRules:v4];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [v5 deploymentAllowed];
      int v9 = 67109120;
      LODWORD(v10) = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Deployment allowed: %d", (uint8_t *)&v9, 8u);
    }
    unsigned __int8 v7 = [v5 deploymentAllowed];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (BOOL)createCacheDirectory:(id *)a3
{
  id v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [(NSURL *)self->_cacheDir path];
  unsigned __int8 v7 = [v5 fileExistsAtPath:v6];

  if (v7) {
    return 1;
  }
  v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 createDirectoryAtURL:self->_cacheDir withIntermediateDirectories:0 attributes:0 error:a3];

  BOOL result = 0;
  if (v9) {
    return 1;
  }
  return result;
}

- (id)validateAsset
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Validating asset from MobileAsset", buf, 2u);
  }
  id v3 = [(CLDurianMobileAssetUpdater *)self asset];
  id v4 = [v3 getLocalFileUrl];

  id v5 = [(CLDurianMobileAssetUpdater *)self firmwareBundleFilename];
  unsigned int v6 = [v4 URLByAppendingPathComponent:v5];
  unsigned __int8 v7 = [v6 filePathURL];
  [(CLDurianMobileAssetUpdater *)self setFirmwareBundleURL:v7];

  v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [(CLDurianMobileAssetUpdater *)self firmwareBundleURL];
  id v10 = [v9 path];
  unsigned __int8 v11 = [v8 isReadableFileAtPath:v10];

  if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000081E8();
  }
  id v39 = 0;
  unsigned __int8 v12 = [(CLDurianMobileAssetUpdater *)self createCacheDirectory:&v39];
  id v13 = v39;
  if (v12)
  {
    cacheDir = self->_cacheDir;
    id v15 = [(CLDurianMobileAssetUpdater *)self firmwareBundleURL];
    id v16 = [v15 lastPathComponent];
    id v17 = [(NSURL *)cacheDir URLByAppendingPathComponent:v16];

    v18 = +[NSFileManager defaultManager];
    id v19 = [v17 path];
    unsigned int v20 = [v18 fileExistsAtPath:v19];

    if (v20)
    {
      v21 = +[NSFileManager defaultManager];
      id v38 = v13;
      unsigned __int8 v22 = [v21 removeItemAtURL:v17 error:&v38];
      id v23 = v38;

      if ((v22 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000080F0();
        }
        goto LABEL_22;
      }
      id v13 = v23;
    }
    id v24 = +[NSFileManager defaultManager];
    v25 = [(CLDurianMobileAssetUpdater *)self firmwareBundleURL];
    id v37 = v13;
    unsigned __int8 v26 = [v24 copyItemAtURL:v25 toURL:v17 error:&v37];
    id v23 = v37;

    if (v26)
    {
      v27 = +[NSFileManager defaultManager];
      uint64_t v28 = [v17 path];
      unsigned __int8 v29 = [v27 isWritableFileAtPath:v28];

      if (v29)
      {
        [(CLDurianMobileAssetUpdater *)self setFirmwareBundleURL:v17];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = [(CLDurianMobileAssetUpdater *)self firmwareBundleURL];
          v31 = [(CLDurianMobileAssetUpdater *)self asset];
          long long v32 = [v31 attributes];
          *(_DWORD *)buf = 138412802;
          v41 = v4;
          __int16 v42 = 2112;
          __int16 v43 = v30;
          __int16 v44 = 2112;
          v45 = v32;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Asset validation complete - original URL: %@, new bundle URL: %@, attributes: %@", buf, 0x20u);
        }
        long long v33 = 0;
        goto LABEL_27;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100007FEC();
      }
      id v35 = objc_alloc((Class)NSError);
      id v34 = [v35 initWithDomain:kCLErrorDomainPrivate code:46 userInfo:&off_10000CA80];
LABEL_26:
      long long v33 = v34;
LABEL_27:

      goto LABEL_28;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100008074();
    }
LABEL_22:
    id v34 = v23;
    id v23 = v34;
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000816C();
  }
  id v23 = v13;
  long long v33 = v23;
LABEL_28:

  return v33;
}

- (NSString)firmwareBundleFilename
{
  return self->_firmwareBundleFilename;
}

- (void)setFirmwareBundleFilename:(id)a3
{
}

- (NSURL)firmwareBundleURL
{
  return self->_firmwareBundleURL;
}

- (void)setFirmwareBundleURL:(id)a3
{
}

- (NSString)updatedSystemVersion
{
  return self->_updatedSystemVersion;
}

- (void)setUpdatedSystemVersion:(id)a3
{
}

- (unint64_t)currentMajorVersion
{
  return self->_currentMajorVersion;
}

- (void)setCurrentMajorVersion:(unint64_t)a3
{
  self->_unint64_t currentMajorVersion = a3;
}

- (unint64_t)currentMinorVersion
{
  return self->_currentMinorVersion;
}

- (void)setCurrentMinorVersion:(unint64_t)a3
{
  self->_unint64_t currentMinorVersion = a3;
}

- (unint64_t)currentReleaseVersion
{
  return self->_currentReleaseVersion;
}

- (void)setCurrentReleaseVersion:(unint64_t)a3
{
  self->_currentReleaseVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedSystemVersion, 0);
  objc_storeStrong((id *)&self->_firmwareBundleURL, 0);
  objc_storeStrong((id *)&self->_firmwareBundleFilename, 0);
  objc_storeStrong((id *)&self->_cacheDir, 0);
}

@end