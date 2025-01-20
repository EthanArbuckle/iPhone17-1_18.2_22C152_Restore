@interface FinishDownloadAssetMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isDRMFree;
- (BOOL)isExternalAsset;
- (NSArray)SINFs;
- (NSData)DPInfoData;
- (NSData)SINFData;
- (NSDictionary)fileAttributes;
- (NSString)assetType;
- (NSString)destinationFileName;
- (NSString)destinationURLString;
- (NSString)downloadKind;
- (NSString)fileProtectionType;
- (NSString)localPath;
- (NSString)pathExtension;
- (NSString)sourceURLString;
- (NSString)variantIdentifier;
- (int64_t)mediaLibraryProtectionType;
- (unint64_t)processingTypes;
- (void)setDownloadKind:(id)a3;
@end

@implementation FinishDownloadAssetMemoryEntity

- (NSString)assetType
{
  return (NSString *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"asset_type"];
}

- (NSString)destinationFileName
{
  v3 = [(FinishDownloadAssetMemoryEntity *)self destinationURLString];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
    if ([v4 isFileURL])
    {
      if (v4)
      {
        v5 = [v4 lastPathComponent];
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  id v4 = [(FinishDownloadAssetMemoryEntity *)self pathExtension];
  if (![v4 length])
  {
    v6 = [(FinishDownloadAssetMemoryEntity *)self localPath];
    uint64_t v7 = [v6 pathExtension];

    id v4 = (id)v7;
  }
  v8 = [(FinishDownloadAssetMemoryEntity *)self sourceURLString];
  if (![v4 length] && v8)
  {
    id v9 = [objc_alloc((Class)NSURL) initWithString:v8];
    uint64_t v10 = [v9 pathExtension];

    id v4 = (id)v10;
  }
  v5 = +[NSString stringWithFormat:@"%lld", [(FinishDownloadAssetMemoryEntity *)self databaseID]];
  if ([v4 length])
  {
    uint64_t v11 = [v5 stringByAppendingPathExtension:v4];

    v5 = (void *)v11;
  }

LABEL_14:

  return (NSString *)v5;
}

- (NSString)destinationURLString
{
  return (NSString *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"destination_url"];
}

- (NSData)DPInfoData
{
  return (NSData *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"dpinfo_data"];
}

- (NSDictionary)fileAttributes
{
  v2 = [(FinishDownloadAssetMemoryEntity *)self fileProtectionType];
  if ([v2 length])
  {
    v3 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v2, NSFileProtectionKey, 0);
  }
  else
  {
    v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSString)fileProtectionType
{
  return (NSString *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"file_protection"];
}

- (BOOL)isDRMFree
{
  v2 = [(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"is_drm_free"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isExternalAsset
{
  v2 = [(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"is_external"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)mediaLibraryProtectionType
{
  v2 = [(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"protection_type"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)localPath
{
  id v3 = [(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"local_path"];
  if (!v3)
  {
    id v4 = [(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"is_hls"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 BOOLValue])
    {
      v5 = [(FinishDownloadAssetMemoryEntity *)self downloadKind];
      v6 = sub_10018A454(v5);

      uint64_t v7 = [(FinishDownloadAssetMemoryEntity *)self destinationFileName];
      id v3 = [v6 stringByAppendingPathComponent:v7];
    }
    else
    {
      v8 = [(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"download_id"];
      id v9 = [v8 longLongValue];

      id v10 = [(FinishDownloadAssetMemoryEntity *)self databaseID];
      v6 = [(FinishDownloadAssetMemoryEntity *)self downloadKind];
      id v3 = +[ScratchManager directoryPathForDownloadID:v9 assetID:v10 kind:v6 createIfNeeded:1];
    }
  }

  return (NSString *)v3;
}

- (NSString)pathExtension
{
  return (NSString *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"path_extension"];
}

- (unint64_t)processingTypes
{
  v2 = [(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"processing_types"];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (NSData)SINFData
{
  return (NSData *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"sinfs_data"];
}

- (NSArray)SINFs
{
  v2 = [(FinishDownloadAssetMemoryEntity *)self SINFData];
  if (v2)
  {
    id v3 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:0];
    objc_opt_class();
    id v4 = 0;
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSString)sourceURLString
{
  return (NSString *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"url"];
}

- (NSString)variantIdentifier
{
  return (NSString *)[(FinishDownloadAssetMemoryEntity *)self valueForProperty:@"variant_id"];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"destination_url";
  v4[1] = @"download_id";
  v4[2] = @"dpinfo_data";
  v4[3] = @"file_protection";
  v4[4] = @"is_drm_free";
  v4[5] = @"is_external";
  v4[6] = @"is_hls";
  v4[7] = @"path_extension";
  v4[8] = @"processing_types";
  v4[9] = @"protection_type";
  v4[10] = @"local_path";
  v4[11] = @"sinfs_data";
  v4[12] = @"asset_type";
  v4[13] = @"url";
  v4[14] = @"variant_id";
  v2 = +[NSArray arrayWithObjects:v4 count:15];

  return v2;
}

- (NSString)downloadKind
{
  return self->_downloadKind;
}

- (void)setDownloadKind:(id)a3
{
}

- (void).cxx_destruct
{
}

@end