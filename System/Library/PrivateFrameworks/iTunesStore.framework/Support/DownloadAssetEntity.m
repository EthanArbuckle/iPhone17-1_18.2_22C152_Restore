@interface DownloadAssetEntity
+ (Class)memoryEntityClass;
+ (id)copyDatabaseDictionaryWithRequestProperties:(id)a3;
+ (id)databasePropertyToGetClientProperty:(id)a3;
+ (id)databasePropertyToSetClientProperty:(id)a3;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)newDownloadKeyCookieWithValue:(id)a3 URL:(id)a4;
+ (void)initialize;
- (BOOL)deleteFromDatabase;
- (NSArray)sinfs;
- (id)copyStoreDownloadKeyCookie;
- (id)copyURLRequestProperties;
@end

@implementation DownloadAssetEntity

+ (id)copyDatabaseDictionaryWithRequestProperties:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (a3)
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "allowedRetryCount")), @"retry_count");
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "isITunesStoreRequest") ^ 1), @"is_external");
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "networkServiceType")), @"service_type");
    [a3 timeoutInterval];
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"timeout_interval");
    id v5 = [a3 HTTPBody];
    if (v5) {
      [v4 setObject:v5 forKey:@"body_data"];
    }
    id v6 = [a3 HTTPHeaders];
    if (v6)
    {
      v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:0];
      if (v7) {
        [v4 setObject:v7 forKey:@"http_headers"];
      }
    }
    id v8 = [a3 HTTPMethod];
    if (v8) {
      [v4 setObject:v8 forKey:@"http_method"];
    }
    id v9 = [a3 requestParameters];
    if (v9)
    {
      v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:0];
      if (v10) {
        [v4 setObject:v10 forKey:@"request_parameters"];
      }
    }
    id v11 = [a3 URL];
    id v12 = [v11 absoluteString];
    if (v12)
    {
      id v13 = v12;
      id v14 = objc_msgSend(objc_msgSend(v11, "path"), "pathExtension");
      if (v14) {
        [v4 setObject:v14 forKey:@"path_extension"];
      }
      [v4 setObject:v13 forKey:@"url"];
    }
  }
  return v4;
}

+ (id)newDownloadKeyCookieWithValue:(id)a3 URL:(id)a4
{
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 604800), NSHTTPCookieMaximumAge);
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(a4, "host"), NSHTTPCookieDomain);
  [v6 setObject:@"downloadKey" forKey:NSHTTPCookieName];
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(a4, "path"), NSHTTPCookiePath);
  [v6 setObject:a4 forKey:NSHTTPCookieOriginURL];
  [v6 setObject:a3 forKey:NSHTTPCookieValue];
  id v7 = [objc_alloc((Class)NSHTTPCookie) initWithProperties:v6];

  return v7;
}

- (id)copyStoreDownloadKeyCookie
{
  v10[0] = @"download_id";
  v10[1] = @"store_download_key";
  v10[2] = @"asset_type";
  v10[3] = @"url";
  [(DownloadAssetEntity *)self getValues:&v6 forProperties:v10 count:4];
  if (!v7 && [v8 isEqualToString:SSDownloadAssetTypeMedia])
  {
    v3 = [DownloadEntity alloc];
    id v4 = -[DownloadEntity initWithPersistentID:inDatabase:](v3, "initWithPersistentID:inDatabase:", [v6 longLongValue], -[DownloadAssetEntity database](self, "database"));
    id v7 = [(DownloadEntity *)v4 valueForProperty:@"store_download_key"];
  }
  id result = 0;
  if (v7)
  {
    if (v9) {
      return +[DownloadAssetEntity newDownloadKeyCookieWithValue:URL:](DownloadAssetEntity, "newDownloadKeyCookieWithValue:URL:", v7, +[NSURL URLWithString:](NSURL, "URLWithString:"));
    }
  }
  return result;
}

- (id)copyURLRequestProperties
{
  id v3 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v3 setRequiresExtendedValidationCertificates:0];
  v41[0] = @"retry_count";
  v41[1] = @"bytes_total";
  v41[2] = @"body_data";
  v41[3] = @"body_data_file_path";
  v41[4] = @"http_headers";
  v41[5] = @"http_method";
  v41[6] = @"is_external";
  v41[7] = @"is_local_cache_server";
  v41[8] = @"service_type";
  v41[9] = @"request_parameters";
  v41[10] = @"timeout_interval";
  v41[11] = @"asset_type";
  v41[12] = @"url";
  [(DownloadAssetEntity *)self getValues:&v30 forProperties:v41 count:13];
  objc_msgSend(v3, "setAllowedRetryCount:", objc_msgSend(v30, "integerValue"));
  [v3 setCachePolicy:1];
  [v3 setHTTPMethod:v35];
  objc_msgSend(v3, "setNetworkServiceType:", objc_msgSend(v37, "integerValue"));
  [v39 doubleValue];
  if (v4 > 2.22044605e-16)
  {
    [v39 doubleValue];
    objc_msgSend(v3, "setTimeoutInterval:");
  }
  if ([v33 length])
  {
    id v5 = objc_alloc_init((Class)NSFileManager);
    unsigned int v6 = [v5 fileExistsAtPath:v33];
    id v7 = +[SSLogConfig sharedDaemonConfig];
    id v8 = v7;
    if (v6)
    {
      if (!v7) {
        id v8 = +[SSLogConfig sharedConfig];
      }
      unsigned int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_INFO)) {
        v10 &= 2u;
      }
      if (v10)
      {
        int v26 = 138412546;
        uint64_t v27 = objc_opt_class();
        __int16 v28 = 2112;
        id v29 = v33;
        LODWORD(v25) = 22;
        v24 = &v26;
        uint64_t v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          id v12 = (void *)v11;
          id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v26, v25);
          free(v12);
          v24 = (int *)v13;
          SSFileLog();
        }
      }
      id v14 = objc_alloc((Class)NSInputStream);
      id v15 = [v14 initWithFileAtPath:v33];
      [v3 setHTTPBodyStream:v15];
    }
    else
    {
      if (!v7) {
        id v8 = +[SSLogConfig sharedConfig];
      }
      unsigned int v16 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v17 &= 2u;
      }
      if (v17)
      {
        int v26 = 138412546;
        uint64_t v27 = objc_opt_class();
        __int16 v28 = 2112;
        id v29 = v33;
        LODWORD(v25) = 22;
        v24 = &v26;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v26, v25);
          free(v19);
          v24 = (int *)v20;
          SSFileLog();
        }
      }
    }
  }
  else
  {
    [v3 setHTTPBody:v32];
  }
  unsigned int v21 = objc_msgSend(v36, "BOOLValue", v24);
  if (v21) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 0;
  }
  [v3 setITunesStoreRequest:v21 ^ 1];
  [v3 setURLBagType:v22];
  if (v34) {
    objc_msgSend(v3, "setHTTPHeaders:", +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v34, 0, 0, 0));
  }
  if (v38) {
    objc_msgSend(v3, "setRequestParameters:", +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v38, 0, 0, 0));
  }
  if (v40) {
    objc_msgSend(v3, "setURL:", +[NSURL URLWithString:](NSURL, "URLWithString:"));
  }
  if (v31) {
    objc_msgSend(v3, "setExpectedContentLength:", objc_msgSend(v31, "longLongValue"));
  }
  return v3;
}

- (NSArray)sinfs
{
  v11[0] = @"download_id";
  v11[1] = @"sinfs_data";
  v11[2] = @"asset_type";
  [(DownloadAssetEntity *)self getValues:&v8 forProperties:v11 count:3];
  if (v9) {
    return (NSArray *)+[NSPropertyListSerialization propertyListWithData:v9 options:0 format:0 error:0];
  }
  if (![v10 isEqualToString:SSDownloadAssetTypeMedia]) {
    return 0;
  }
  double v4 = [DownloadEntity alloc];
  id v5 = -[DownloadEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", [v8 longLongValue], -[DownloadAssetEntity database](self, "database"));
  id v6 = [(DownloadEntity *)v5 copyStoreDownloadMetadata];
  id v3 = (NSArray *)[v6 sinfs];

  return v3;
}

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  return [(id)qword_100401D10 objectForKey:a3];
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  id result = objc_msgSend((id)qword_100401D18, "objectForKey:");
  if (!result)
  {
    id v5 = (void *)qword_100401D10;
    return [v5 objectForKey:a3];
  }
  return result;
}

+ (id)databaseTable
{
  return @"asset";
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id result = objc_msgSend((id)qword_100401D20, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___DownloadAssetEntity;
    return objc_msgSendSuper2(&v6, "disambiguatedSQLForProperty:", a3);
  }
  return result;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteFromDatabase
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadAssetEntity;
  BOOL v3 = [(DownloadAssetEntity *)&v6 deleteFromDatabase];
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000A02D8;
    v5[3] = &unk_1003A52B0;
    v5[4] = self;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyExternalUsingTransactionBlock:", v5);
  }
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = [objc_alloc((Class)NSMutableDictionary) initWithObjectsAndKeys:@"IFNULL(asset.local_path, ITSDGetAssetPath(asset.download_id, asset.ROWID))", @"IFNULL(asset.blocked_reason, 0)", @"IFNULL(asset.blocked_reason, 0)", 0];
    id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"retry_count", @"asset_order", @"avfoundation_blocked", @"bytes_total", @"destination_url", @"download_id", @"download_token", @"dpinfo_data", @"uncompressed_size", @"file_protection", @"hash_array", @"hash_type", @"body_data", @"body_data_file_path", @"http_headers", @"http_method", @"is_discretionary",
           @"is_downloaded",
           @"is_drm_free",
           @"is_external",
           @"is_hls",
           @"is_local_cache_server",
           @"is_zip_streamable",
           @"local_path",
           @"service_type",
           @"bytes_to_hash",
           @"path_extension",
           @"processing_types",
           @"protection_type",
           @"request_parameters",
           @"server_guid",
           @"sinfs_data",
           @"store_flavor",
           @"timeout_interval",
           @"asset_type",
           @"url",
           @"video_dimensions",
           0);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "setObject:forKey:", objc_msgSend(a1, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v11 + 1) + 8 * i)), *(void *)(*((void *)&v11 + 1) + 8 * i));
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    qword_100401D20 = (uint64_t)[v3 copy];

    id v10 = objc_alloc((Class)NSDictionary);
    uint64_t v9 = SSDownloadAssetPropertyLocalPath;
    qword_100401D10 = (uint64_t)objc_msgSend(v10, "initWithObjectsAndKeys:", @"retry_count", SSDownloadAssetPropertyAllowedRetryCount, @"bytes_total", SSDownloadAssetPropertyBytesTotal, @"destination_url", SSDownloadAssetPropertyDestinationURL, @"download_token", SSDownloadAssetPropertyDownloadToken, @"dpinfo_data", SSDownloadAssetPropertyDPInfo, @"file_protection", SSDownloadAssetPropertyFileProtectionType, @"uncompressed_size", SSDownloadAssetPropertyExpectedDiskSpace, @"hash_array", SSDownloadAssetPropertyHashes, @"hash_type",
                                 SSDownloadAssetPropertyHashType,
                                 @"body_data",
                                 SSDownloadAssetPropertyHTTPBodyData,
                                 @"body_data_file_path",
                                 SSDownloadAssetPropertyHTTPBodyDataFilePath,
                                 @"http_headers",
                                 SSDownloadAssetPropertyHTTPHeaderData,
                                 @"http_method",
                                 SSDownloadAssetPropertyHTTPMethod,
                                 @"initial_odr_size",
                                 SSDownloadAssetPropertyInitialODRSize,
                                 @"is_discretionary",
                                 SSDownloadAssetPropertyIsDiscretionary,
                                 @"is_drm_free",
                                 SSDownloadAssetPropertyIsDRMFree,
                                 @"is_external",
                                 SSDownloadAssetPropertyIsExternal,
                                 @"is_hls",
                                 SSDownloadAssetPropertyIsHLS,
                                 @"is_zip_streamable",
                                 SSDownloadAssetPropertyIsZipStreamable,
                                 @"is_local_cache_server",
                                 SSDownloadAssetPropertyIsLocalCacheServer,
                                 @"bytes_to_hash",
                                 SSDownloadAssetPropertyNumberOfBytesToHash,
                                 @"path_extension",
                                 SSDownloadAssetPropertyPathExtension,
                                 @"processing_types",
                                 SSDownloadAssetPropertyProcessingTypes,
                                 @"request_parameters",
                                 SSDownloadAssetPropertyRequestParameterData,
                                 @"IFNULL(asset.local_path, ITSDGetAssetPath(asset.download_id, asset.ROWID))",
                                 SSDownloadAssetPropertyLocalPath,
                                 @"sinfs_data",
                                 SSDownloadAssetPropertySINFData,
                                 @"store_flavor",
                                 SSDownloadAssetPropertyStoreFlavor,
                                 @"timeout_interval",
                                 SSDownloadAssetPropertyTimeoutInterval,
                                 @"asset_type",
                                 SSDownloadAssetPropertyType,
                                 @"url",
                                 SSDownloadAssetPropertyURL,
                                 @"video_dimensions");
    qword_100401D18 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"local_path", v9, 0);
  }
}

@end