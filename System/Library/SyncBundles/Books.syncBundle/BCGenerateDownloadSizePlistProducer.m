@interface BCGenerateDownloadSizePlistProducer
- (BOOL)_addDownloadSizeFromITunesMetadataToEntry:(id)a3;
- (id)_addEstimatedDownloadSizeFromITunesMetadataDictionary:(id)a3 assetPath:(id)a4 toEntry:(id)a5;
- (id)_addSizeOnDiskFromITunesMetadataDictionary:(id)a3 toEntry:(id)a4;
- (id)_artworkFileSizeForAssetPath:(id)a3 isDirectory:(BOOL)a4;
- (id)_fileSizeForPath:(id)a3;
- (id)_metadataAssetFileSize:(id)a3 book:(id)a4;
- (id)produceData;
- (void)_addComputedSizeOnDiskToEntries:(id)a3;
@end

@implementation BCGenerateDownloadSizePlistProducer

- (id)_metadataAssetFileSize:(id)a3 book:(id)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  v6 = (void *)BCDynamicCast(v5, (uint64_t)[a3 objectForKeyedSubscript:@"asset-info"]);
  if (!v6 || (id result = [v6 objectForKeyedSubscript:@"file-size"]) == 0)
  {
    return [a3 objectForKeyedSubscript:@"file-size"];
  }
  return result;
}

- (id)_fileSizeForPath:(id)a3
{
  uint64_t v7 = 0;
  v4 = [+[NSFileManager defaultManager] attributesOfItemAtPath:a3 error:&v7];
  if (v4) {
    return [(NSDictionary *)v4 objectForKeyedSubscript:NSFileSize];
  }
  v6 = BCDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_14E58((uint64_t)a3, &v7, v6);
  }
  return 0;
}

- (id)_artworkFileSizeForAssetPath:(id)a3 isDirectory:(BOOL)a4
{
  if (a4) {
    id v5 = [a3 stringByAppendingPathComponent:@"iTunesArtwork"];
  }
  else {
    id v5 = objc_msgSend(objc_msgSend(a3, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", @"jpg");
  }

  return [(BCGenerateDownloadSizePlistProducer *)self _fileSizeForPath:v5];
}

- (id)_addEstimatedDownloadSizeFromITunesMetadataDictionary:(id)a3 assetPath:(id)a4 toEntry:(id)a5
{
  id v8 = [(BCGenerateDownloadSizePlistProducer *)self _metadataAssetFileSize:a3 book:a5];
  if (!v8) {
    return 0;
  }
  v9 = (char *)[v8 unsignedLongLongValue];
  id v10 = [(BCGenerateDownloadSizePlistProducer *)self _artworkFileSizeForAssetPath:a4 isDirectory:1];
  if (v10) {
    v9 = &v9[(void)[v10 unsignedLongLongValue]];
  }
  v11 = +[NSNumber numberWithUnsignedLongLong:v9];
  if (v11)
  {
    v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = [a5 objectForKeyedSubscript:@"Artist"];
      __int16 v16 = 2112;
      id v17 = [a5 objectForKeyedSubscript:@"Name"];
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "[BCGenerateDownloadSizePlistProducer] Adding 'Estimated Download Size' for {%@ - %@}: %@", (uint8_t *)&v14, 0x20u);
    }
    [a5 setObject:v11 forKeyedSubscript:@"Estimated Download Size"];
  }
  return v11;
}

- (id)_addSizeOnDiskFromITunesMetadataDictionary:(id)a3 toEntry:(id)a4
{
  id v5 = [a3 objectForKeyedSubscript:@"BKAllocatedSize"];
  if (v5)
  {
    v6 = BCDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138544130;
      CFStringRef v9 = @"BKAllocatedSize";
      __int16 v10 = 2112;
      id v11 = [a4 objectForKeyedSubscript:@"Artist"];
      __int16 v12 = 2112;
      id v13 = [a4 objectForKeyedSubscript:@"Name"];
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[BCGenerateDownloadSizePlistProducer] Adding 'Size On Disk' based on %{public}@ for {%@ - %@}: %@", (uint8_t *)&v8, 0x2Au);
    }
    [a4 setObject:v5 forKeyedSubscript:@"Size On Disk"];
  }
  return v5;
}

- (void)_addComputedSizeOnDiskToEntries:(id)a3
{
  if ([a3 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [a3 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v22;
      *(void *)&long long v5 = 138412546;
      long long v19 = v5;
      do
      {
        int v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(a3);
          }
          CFStringRef v9 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v8);
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = BCDynamicCast(v10, (uint64_t)[v9 objectForKeyedSubscript:@"Path"]);
          if (v11)
          {
            [[(NSString *)self->super._path stringByDeletingLastPathComponent] stringByAppendingPathComponent:v11];
            uint64_t v12 = ATGetDiskUsageForPath();
            id v13 = BCDefaultLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = [v9 objectForKeyedSubscript:@"Artist"];
              id v15 = [v9 objectForKeyedSubscript:@"Name"];
              *(_DWORD *)buf = 138412802;
              id v26 = v14;
              __int16 v27 = 2112;
              id v28 = v15;
              __int16 v29 = 2048;
              uint64_t v30 = v12;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[BCGenerateDownloadSizePlistProducer] Adding 'Size On Disk' based on disk usage for {%@ - %@}: %llu", buf, 0x20u);
            }
            objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12, v19), @"Size On Disk");
          }
          else
          {
            __int16 v16 = BCDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v17 = [v9 objectForKeyedSubscript:@"Artist"];
              id v18 = [v9 objectForKeyedSubscript:@"Name"];
              *(_DWORD *)buf = v19;
              id v26 = v17;
              __int16 v27 = 2112;
              id v28 = v18;
              _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "[BCGenerateDownloadSizePlistProducer] Path not found before getting disk usage for {%@ - %@}", buf, 0x16u);
            }
          }
          int v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [a3 countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_addDownloadSizeFromITunesMetadataToEntry:(id)a3
{
  long long v5 = +[NSFileManager defaultManager];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = BCDynamicCast(v6, (uint64_t)[a3 objectForKeyedSubscript:@"Path"]);
  if (!v7)
  {
    uint64_t v12 = BCDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_14EE4(a3);
    }
    goto LABEL_10;
  }
  int v8 = [[(NSString *)self->super._path stringByDeletingLastPathComponent] stringByAppendingPathComponent:v7];
  if (![(NSFileManager *)v5 isDirectoryPath:v8])
  {
LABEL_10:
    id v11 = 0;
    return v11 != 0;
  }
  CFStringRef v9 = +[NSDictionary dictionaryWithContentsOfFile:[(NSString *)v8 stringByAppendingPathComponent:@"iTunesMetadata.plist"]];
  if (!v9)
  {
    id v13 = BCDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_14F8C(a3);
    }
    goto LABEL_10;
  }
  uint64_t v10 = v9;
  id v11 = [(BCGenerateDownloadSizePlistProducer *)self _addEstimatedDownloadSizeFromITunesMetadataDictionary:v9 assetPath:v8 toEntry:a3];
  if (!v11) {
    id v11 = [(BCGenerateDownloadSizePlistProducer *)self _addSizeOnDiskFromITunesMetadataDictionary:v10 toEntry:a3];
  }
  return v11 != 0;
}

- (id)produceData
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:self->super._path];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = (void *)BCDynamicCast(v5, (uint64_t)[(NSMutableDictionary *)v4 objectForKeyedSubscript:@"Books"]);
  if (![v6 count]) {
    goto LABEL_17;
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8)
  {
    [(BCGenerateDownloadSizePlistProducer *)self _addComputedSizeOnDiskToEntries:v7];

LABEL_17:
    self->super._dataUnchanged = 1;
    return v4;
  }
  id v9 = v8;
  long long v23 = self;
  id obj = v6;
  v20 = v4;
  long long v21 = v7;
  char v22 = 0;
  uint64_t v10 = *(void *)v26;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v13 = objc_opt_class();
      id v14 = (void *)BCDynamicCast(v13, v12);
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = BCDynamicCast(v15, (uint64_t)[v14 objectForKeyedSubscript:@"Estimated Download Size"]);
      uint64_t v17 = objc_opt_class();
      if (v16 | BCDynamicCast(v17, (uint64_t)[v14 objectForKeyedSubscript:@"Size On Disk"]))
      {
        [v3 addObject:v14];
      }
      else
      {
        id v18 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v14];
        [v3 addObject:v18];
        if (!-[BCGenerateDownloadSizePlistProducer _addDownloadSizeFromITunesMetadataToEntry:](v23, "_addDownloadSizeFromITunesMetadataToEntry:", v18))[v21 addObject:v18]; {

        }
        char v22 = 1;
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v9);
  self = v23;
  [(BCGenerateDownloadSizePlistProducer *)v23 _addComputedSizeOnDiskToEntries:v21];

  id v4 = v20;
  if ((v22 & 1) == 0) {
    goto LABEL_17;
  }
  [(NSMutableDictionary *)v20 setObject:v3 forKeyedSubscript:@"Books"];
  return v4;
}

@end