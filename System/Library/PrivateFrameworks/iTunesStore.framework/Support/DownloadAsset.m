@interface DownloadAsset
+ (Class)databaseEntityClass;
- (DownloadAsset)initWithClientXPCAsset:(id)a3;
- (DownloadAsset)initWithExternalManifestDictionary:(id)a3 validateVariants:(BOOL)a4;
- (DownloadAsset)initWithURLRequestProperties:(id)a3;
- (id)copyJobAsset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation DownloadAsset

- (id)copyJobAsset
{
  id v3 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  v4 = [(DownloadAsset *)self valueForProperty:@"asset_type"];
  [v3 setAssetType:v4];

  v5 = [(DownloadAsset *)self valueForProperty:@"url"];
  [v3 setAssetURL:v5];

  v6 = [(DownloadAsset *)self valueForProperty:@"bytes_total"];
  [v3 setBytesTotal:v6];

  v7 = [(DownloadAsset *)self valueForProperty:@"uncompressed_size"];
  [v3 setExpectedDiskspace:v7];

  v8 = [(DownloadAsset *)self valueForProperty:@"hash_array"];
  [v3 setHashArrayData:v8];

  v9 = [(DownloadAsset *)self valueForProperty:@"hash_type"];
  [v3 setHashType:v9];

  v10 = [(DownloadAsset *)self valueForProperty:@"bytes_to_hash"];
  [v3 setNumberOfBytesToHash:v10];

  v11 = [(DownloadAsset *)self valueForProperty:@"sinfs_data"];
  [v3 setSinfs:v11];

  v12 = [(DownloadAsset *)self valueForProperty:@"store_download_key"];
  [v3 setStoreDownloadKey:v12];

  v13 = [(DownloadAsset *)self valueForProperty:@"variant_id"];
  [v3 setVariantID:v13];

  v14 = [(DownloadAsset *)self valueForProperty:@"dpinfo_data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setDPInfo:v14];
  }
  v15 = [(DownloadAsset *)self valueForProperty:@"initial_odr_size"];

  if (objc_opt_respondsToSelector()) {
    [v3 setInitialODRSize:v15];
  }
  v16 = [(DownloadAsset *)self valueForProperty:@"is_local_cache_server"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsLocallyCacheable:", objc_msgSend(v16, "BOOLValue"));
  }
  v17 = [(DownloadAsset *)self valueForExternalProperty:@"is_external"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsExternal:", objc_msgSend(v17, "BOOLValue"));
  }
  v18 = [(DownloadAsset *)self valueForProperty:@"is_zip_streamable"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setIsZipStreamable:", objc_msgSend(v18, "BOOLValue"));
  }

  return v3;
}

- (DownloadAsset)initWithClientXPCAsset:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DownloadAsset;
  v4 = [(DownloadAsset *)&v14 init];
  if (v4)
  {
    [(DownloadAsset *)v4 setDatabaseID:xpc_dictionary_get_int64(a3, "0")];
    objc_opt_class();
    uint64_t v5 = SSXPCDictionaryCopyCFObjectWithClass();
    if (v5)
    {
      v6 = (void *)v5;
      id v7 = +[DownloadAssetEntity copyDatabaseDictionaryToSetClientDictionary:v5];
      [(DownloadAsset *)v4 setValuesWithDictionary:v7];
    }
    id v8 = objc_msgSend(objc_alloc((Class)SSURLRequestProperties), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "2"));
    if (v8)
    {
      v9 = v8;
      id v10 = +[DownloadAssetEntity copyDatabaseDictionaryWithRequestProperties:v8];
      [(DownloadAsset *)v4 setValuesWithDictionary:v10];
    }
    objc_opt_class();
    uint64_t v11 = SSXPCDictionaryCopyObjectWithClass();
    if (v11)
    {
      v12 = (void *)v11;
      +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
    }
  }
  return v4;
}

- (DownloadAsset)initWithExternalManifestDictionary:(id)a3 validateVariants:(BOOL)a4
{
  BOOL v4 = a4;
  v33.receiver = self;
  v33.super_class = (Class)DownloadAsset;
  result = [(DownloadAsset *)&v33 init];
  if (!result) {
    return result;
  }
  id v7 = result;
  id v8 = [a3 objectForKey:@"kind"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v8 isEqualToString:@"full-size-image"])
    {
      v9 = (void **)&SSDownloadAssetTypeArtwork;
LABEL_5:
      id v10 = *v9;
      goto LABEL_10;
    }
    if (([v8 isEqualToString:@"software-package"] & 1) != 0
      || [v8 isEqualToString:@"vpn-plugin-package"])
    {
      id v10 = (void *)SSDownloadAssetTypeMedia;
    }
    else
    {
      if ([v8 isEqualToString:@"newsstand-image"])
      {
        v9 = (void **)&SSDownloadAssetTypeNewsstandArtwork;
        goto LABEL_5;
      }
      if ([v8 isEqualToString:@"transit-data"])
      {
        v9 = (void **)&SSDownloadAssetTypeTransitMapsData;
        goto LABEL_5;
      }
      if ([v8 isEqualToString:@"asset-pack-manifest"]) {
        id v10 = (void *)SSDownloadAssetTypeODRManifest;
      }
      else {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_10:
  id v11 = [a3 objectForKey:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [objc_alloc((Class)NSURL) initWithString:v11];
    if (![v12 host]) {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  if (([v10 isEqualToString:SSDownloadAssetTypeMedia] & 1) == 0
    && ![v10 isEqualToString:SSDownloadAssetTypeODRManifest])
  {
    unsigned int v16 = 0;
    id v13 = 0;
    goto LABEL_23;
  }
  id v13 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
  if (!v13
    || (id v14 = [a3 objectForKey:@"variantIds"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    unsigned int v16 = 0;
LABEL_23:
    int v15 = 1;
    goto LABEL_24;
  }
  if ([v14 containsObject:v13])
  {
    int v15 = 0;
    unsigned int v16 = 1;
  }
  else
  {
    id v27 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "compatibleProductType");
    if (v27)
    {
      id v28 = v27;
      unsigned int v16 = [v14 containsObject:v27];
      int v15 = 0;
      id v13 = v28;
    }
    else
    {
      unsigned int v16 = 0;
      int v15 = 0;
    }
  }
LABEL_24:
  result = 0;
  if (v10 && v11)
  {
    int v17 = v15 | !v4;
    if ((v17 | v16) != 1) {
      return 0;
    }
    [(DownloadAsset *)v7 setValue:+[NSNumber numberWithBool:1] forProperty:@"is_external"];
    [(DownloadAsset *)v7 setValue:v10 forProperty:@"asset_type"];
    [(DownloadAsset *)v7 setValue:v11 forProperty:@"url"];
    if (((v17 | v16 ^ 1) & 1) == 0) {
      [(DownloadAsset *)v7 setValue:v13 forProperty:@"variant_id"];
    }
    id v18 = [a3 objectForKey:@"md5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, 0);
      v20 = +[NSNumber numberWithInteger:0];
      if (!v19) {
        return v7;
      }
    }
    else
    {
      v19 = (NSArray *)[a3 objectForKey:@"md5s"];
      v20 = (NSNumber *)[a3 objectForKey:@"md5-size"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return v7;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [(NSNumber *)v20 longLongValue] < 1) {
        return v7;
      }
      long long v29 = 0u;
      long long v30 = 0u;
      char isKindOfClass = [(NSArray *)v19 count] != 0;
      long long v31 = 0u;
      long long v32 = 0u;
      v23 = (char *)[(NSArray *)v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v23)
      {
        v24 = v23;
        uint64_t v25 = *(void *)v30;
        do
        {
          v26 = 0;
          do
          {
            if (*(void *)v30 != v25) {
              objc_enumerationMutation(v19);
            }
            if (isKindOfClass)
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
            }
            else
            {
              char isKindOfClass = 0;
            }
            ++v26;
          }
          while (v24 != v26);
          v24 = (char *)[(NSArray *)v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v24);
      }
      if ((isKindOfClass & 1) == 0)
      {
        v19 = 0;
        v20 = 0;
      }
      if (!v19) {
        return v7;
      }
    }
    if (v20)
    {
      v21 = +[NSPropertyListSerialization dataWithPropertyList:v19 format:200 options:0 error:0];
      if (v21)
      {
        [(DownloadAsset *)v7 setValue:v21 forProperty:@"hash_array"];
        [(DownloadAsset *)v7 setValue:v20 forProperty:@"bytes_to_hash"];
      }
    }
    return v7;
  }
  return result;
}

- (DownloadAsset)initWithURLRequestProperties:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DownloadAsset;
  BOOL v4 = [(DownloadAsset *)&v7 init];
  if (v4)
  {
    id v5 = +[DownloadAssetEntity copyDatabaseDictionaryWithRequestProperties:a3];
    [(DownloadAsset *)v4 setValuesWithDictionary:v5];
  }
  return v4;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadAsset;
  return [(DownloadAsset *)&v4 copyWithZone:a3];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadAsset;
  return +[NSString stringWithFormat:@"%@ [url = %@, variantID = %@]", [(DownloadAsset *)&v3 description], [(DownloadAsset *)self valueForProperty:@"url"], [(DownloadAsset *)self valueForProperty:@"variant_id"]];
}

@end