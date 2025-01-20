@interface IMPersistentCache
- (BOOL)_createStorageForDb:(id)a3;
- (BOOL)_insertCGImage:(CGImage *)a3 forKey:(id)a4;
- (BOOL)_insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 scale:(double)a6 properties:(id)a7;
- (BOOL)_unknownKeysContainsObject:(id)a3;
- (BOOL)enableCaseSensitiveLike;
- (BOOL)hasItemForKey:(id)a3;
- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5;
- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 properties:(id)a6;
- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 scale:(double)a6 properties:(id)a7;
- (BOOL)insertCGImages:(id)a3 forKey:(id)a4 mimeType:(id)a5 baseSize:(CGSize)a6 properties:(id)a7;
- (CGImage)_copyCGImageForRow:(id)a3 size:(CGSize *)a4 resourceSize:(int64_t *)a5 scale:(double *)a6;
- (CGImage)copyCGImageForKey:(id)a3;
- (CGImage)copyCGImageForKey:(id)a3 resourceSize:(int64_t *)a4;
- (CGImage)copyCGImageForKey:(id)a3 resourceSize:(int64_t *)a4 scale:(double *)a5;
- (IMPersistentCache)initWithPath:(id)a3 maxSize:(unint64_t)a4;
- (NSString)path;
- (id)CGImagesForKey:(id)a3 size:(CGSize *)a4 resourceSize:(int64_t *)a5;
- (id)allKeys;
- (id)dataForKey:(id)a3;
- (id)dataForKey:(id)a3 mimeType:(id)a4;
- (id)deleteItemsForMimeType:(id)a3;
- (id)firstImageKeyWithRootKey:(id)a3;
- (id)itemsForMimeType:(id)a3;
- (id)metadataForKey:(id)a3;
- (int64_t)version;
- (unint64_t)_loadCacheSize;
- (unint64_t)resourceSizeForKey:(id)a3;
- (void)_LRUCleanupForMimeType:(id)a3;
- (void)_accessedIdsAddObject:(id)a3;
- (void)_accessedIdsRemoveAllObjects;
- (void)_adjustCacheSizeBy:(int64_t)a3;
- (void)_createCacheTable:(id)a3;
- (void)_saveCacheSize:(int64_t)a3;
- (void)_unknownKeysAddObject:(id)a3;
- (void)_unknownKeysRemoveObject:(id)a3;
- (void)_updateCaches:(id)a3;
- (void)clear;
- (void)deleteItemForKey:(id)a3;
- (void)deleteItemsWithAllKeysContaining:(id)a3;
- (void)deleteItemsWithKeyLike:(id)a3;
- (void)insertData:(id)a3 forKey:(id)a4 mimeType:(id)a5;
- (void)replaceDataForKey:(id)a3 withData:(id)a4 mimeType:(id)a5;
@end

@implementation IMPersistentCache

- (IMPersistentCache)initWithPath:(id)a3 maxSize:(unint64_t)a4
{
  id v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)IMPersistentCache;
  v7 = [(IMPersistentCache *)&v43 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_18;
  }
  v7->_maxSize = a4;
  uint64_t v9 = objc_opt_new();
  accessedIds = v8->_accessedIds;
  v8->_accessedIds = (NSMutableSet *)v9;

  v11 = +[NSUserDefaults standardUserDefaults];
  v12 = +[NSNumber numberWithBool:0];
  v13 = +[NSDictionary dictionaryWithObject:v12 forKey:@"RemoveImageCacheFiles"];
  [v11 registerDefaults:v13];

  v14 = +[NSProcessInfo processInfo];
  v15 = [v14 environment];
  v16 = [v15 objectForKey:@"RemoveImageCacheFiles"];
  if ([v16 BOOLValue])
  {
  }
  else
  {
    unsigned __int8 v17 = [v11 BOOLForKey:@"RemoveImageCacheFiles"];

    if ((v17 & 1) == 0) {
      goto LABEL_6;
    }
  }
  id v18 = objc_alloc_init((Class)NSFileManager);
  [v18 removeItemAtPath:v6 error:0];
  [v11 setBool:0 forKey:@"RemoveImageCacheFiles"];

LABEL_6:
  v19 = [[IMDatabaseHandle alloc] initWithPath:v6];
  db = v8->_db;
  v8->_db = v19;

  v21 = [[IMAdminTable alloc] initWithDatabaseHandle:v8->_db];
  adminTable = v8->_adminTable;
  v8->_adminTable = v21;

  if (![(IMAdminTable *)v8->_adminTable hasDatabaseVersion])
  {
    v23 = [(IMDatabaseHandle *)v8->_db tableNames];
    v24 = [v23 valueForKey:@"name"];
    unsigned int v25 = [v24 containsObject:@"items"];

    if (v25) {
      [(IMAdminTable *)v8->_adminTable setDatabaseVersion:1];
    }
  }
  if (![(IMPersistentCache *)v8 _createStorageForDb:v8->_db])
  {
    v26 = v8->_db;
    v8->_db = 0;

    v27 = +[NSFileManager defaultManager];
    [v27 removeItemAtPath:v6 error:0];

    v28 = [[IMDatabaseHandle alloc] initWithPath:v6];
    v29 = v8->_db;
    v8->_db = v28;

    [(IMPersistentCache *)v8 _createStorageForDb:v8->_db];
    v30 = BCIMLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "-[IMPersistentCache initWithPath:maxSize:]";
      __int16 v46 = 2080;
      v47 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Cache/BCPersistentCache.m";
      __int16 v48 = 1024;
      int v49 = 113;
      _os_log_impl(&def_7D91C, v30, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v31 = BCIMLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_7D91C, v31, OS_LOG_TYPE_INFO, "@\"Could not create cache structure, reinitialized backing store\"", buf, 2u);
    }
  }
  v8->_cacheSize = [(IMPersistentCache *)v8 _loadCacheSize];
  uint64_t v32 = objc_opt_new();
  unknownKeys = v8->_unknownKeys;
  v8->_unknownKeys = (NSMutableSet *)v32;

  v8->_accessedIdsLock._os_unfair_lock_opaque = 0;
  v8->_unknownKeysLock._os_unfair_lock_opaque = 0;
  v8->_cacheSizeLock._os_unfair_lock_opaque = 0;
  v34 = v8->_adminTable;
  v35 = +[NSDate date];
  [(IMAdminTable *)v34 setLastAccessDate:v35];

  if (a4)
  {
    id v36 = objc_alloc((Class)NSTimer);
    v37 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
    v38 = (NSTimer *)[v36 initWithFireDate:v37 interval:v8 target:"_updateCaches:" selector:0 userInfo:1 repeats:300.0];
    scanTimer = v8->_scanTimer;
    v8->_scanTimer = v38;

    v40 = +[NSRunLoop currentRunLoop];
    [v40 addTimer:v8->_scanTimer forMode:NSDefaultRunLoopMode];
  }
  v41 = v8;

LABEL_18:
  return v8;
}

- (void)_createCacheTable:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:@"create table if not exists items (pk %@, key %@, accessDate %@, width %@, height %@, bpc %@, bpp %@, bpr %@, scale %@, mimeType %@, resourceSize %@, resourceData %@)", @"integer primary key", @"text", @"date", @"integer", @"integer", @"integer", @"integer", @"integer", @"float", @"text", @"integer", @"blob"];
  [v4 addObject:v5];
  [v4 addObject:@"create index if not exists items_key_index on items (key)"];

  [(IMAdminTable *)self->_adminTable setDatabaseVersion:2];
}

- (BOOL)_createStorageForDb:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  int64_t v6 = [(IMAdminTable *)self->_adminTable databaseVersion];
  if (v6 == 1)
  {
    v7 = +[NSString stringWithFormat:@"alter table items add column scale %@", @"integer"];
    [v5 addObject:v7];

    v8 = +[UIScreen mainScreen];
    [v8 scale];
    uint64_t v10 = (uint64_t)v9;

    v11 = +[NSString stringWithFormat:@"update items set scale = %ld", v10];
    [v5 addObject:v11];

    [(IMAdminTable *)self->_adminTable setDatabaseVersion:2];
  }
  else if (!v6)
  {
    [(IMPersistentCache *)self _createCacheTable:v5];
  }
  [v4 runStatement:@"pragma page_size=32768" arguments:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        [v4 runStatement:*(void *)(*((void *)&v17 + 1) + 8 * (void)v15) arguments:0];
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  [v4 runStatement:@"pragma journal_mode=WAL" arguments:0];
  [v4 runStatement:@"pragma synchronous=normal" arguments:0];

  return 1;
}

- (BOOL)enableCaseSensitiveLike
{
  return [(IMDatabaseHandle *)self->_db runStatement:@"pragma case_sensitive_like=ON" arguments:0];
}

- (void)insertData:(id)a3 forKey:(id)a4 mimeType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSString stringWithFormat:@"insert into items (key, accessDate, mimeType, resourceSize, resourceData) values (?,?,?,?,?)"];
  id v12 = +[NSDate date];
  id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 length]);
  uint64_t v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v12, v10, v13, v8, 0);

  if ([(IMDatabaseHandle *)self->_db runStatement:v11 arguments:v14])
  {
    -[IMPersistentCache _adjustCacheSizeBy:](self, "_adjustCacheSizeBy:", [v8 length]);
    [(IMPersistentCache *)self _unknownKeysRemoveObject:v9];
  }
}

- (BOOL)_insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 scale:(double)a6 properties:(id)a7
{
  id v28 = a4;
  id v12 = a5;
  id v26 = a7;
  id v13 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  if ([v12 isEqualToString:@"image/jpeg"])
  {
    uint64_t v14 = (__CFString *)kUTTypeJPEG;
  }
  else
  {
    uint64_t v14 = [UTTypePNG identifier];
  }
  v15 = CGImageDestinationCreateWithData(v13, v14, 1uLL, 0);
  if (v15)
  {
    v16 = v15;
    CGImageDestinationAddImage(v15, a3, (CFDictionaryRef)v26);
    CGImageDestinationFinalize(v16);
    CFRelease(v16);
  }
  v27 = +[NSNumber numberWithInteger:CGImageGetWidth(a3)];
  long long v17 = +[NSNumber numberWithInteger:CGImageGetHeight(a3)];
  long long v18 = +[NSString stringWithFormat:@"insert into items (key, accessDate, width, height, scale, mimeType, resourceSize, resourceData) values (?,?,?,?,?,?,?,?)"];
  long long v19 = +[NSDate date];
  *(float *)&double v20 = a6;
  v21 = +[NSNumber numberWithFloat:v20];
  v22 = +[NSNumber numberWithInteger:[(__CFData *)v13 length]];
  v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v19, v27, v17, v21, v12, v22, v13, 0);

  if ([(IMDatabaseHandle *)self->_db runStatement:v18 arguments:v23])
  {
    [(IMPersistentCache *)self _adjustCacheSizeBy:[(__CFData *)v13 length]];
    [(IMPersistentCache *)self _unknownKeysRemoveObject:v28];
    BOOL v24 = 1;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 scale:(double)a6 properties:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (([v13 isEqualToString:@"image/jpeg"] & 1) != 0
    || [v13 isEqualToString:@"image/png"])
  {
    unsigned __int8 v15 = [(IMPersistentCache *)self _insertCGImage:a3 forKey:v12 mimeType:v13 scale:v14 properties:a6];
  }
  else
  {
    unsigned __int8 v15 = [(IMPersistentCache *)self _insertCGImage:a3 forKey:v12];
  }
  BOOL v16 = v15;

  return v16;
}

- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5 properties:(id)a6
{
  return [(IMPersistentCache *)self insertCGImage:a3 forKey:a4 mimeType:a5 scale:a6 properties:1.0];
}

- (BOOL)insertCGImage:(CGImage *)a3 forKey:(id)a4 mimeType:(id)a5
{
  return [(IMPersistentCache *)self insertCGImage:a3 forKey:a4 mimeType:a5 properties:0];
}

- (BOOL)_insertCGImage:(CGImage *)a3 forKey:(id)a4
{
  id v6 = a4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  size_t v10 = ((14 * (_BYTE)Width) & 0xE) + 2 * Width;
  size_t v11 = v10 * Height;
  id v12 = malloc_type_calloc(1uLL, v10 * Height, 0x7D1788F0uLL);
  if (!v12) {
    goto LABEL_7;
  }
  id v13 = v12;
  CGContextRef v14 = CGBitmapContextCreate(v12, Width, Height, 5uLL, v10, DeviceRGB, 0x1006u);
  if (!v14)
  {
    free(v13);
LABEL_7:
    CGColorSpaceRelease(DeviceRGB);
    BOOL v25 = 0;
    goto LABEL_12;
  }
  unsigned __int8 v15 = v14;
  id v31 = v6;
  CGColorSpaceRelease(DeviceRGB);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = (double)Width;
  v32.size.height = (double)Height;
  CGContextDrawImage(v15, v32, a3);
  Data = CGBitmapContextGetData(v15);
  if (Data)
  {
    id v28 = self;
    id v30 = [objc_alloc((Class)NSData) initWithBytes:Data length:v11];
    v29 = +[NSString stringWithFormat:@"insert into items (key, accessDate, width, height, bpc, bpp, bpr, mimeType, resourceSize, resourceData) values (?,?,?,?,?,?,?,?,?,?)"];
    id v27 = objc_alloc((Class)NSArray);
    long long v17 = +[NSDate date];
    long long v18 = +[NSNumber numberWithInteger:Width];
    long long v19 = +[NSNumber numberWithInteger:Height];
    double v20 = +[NSNumber numberWithInteger:5];
    v21 = +[NSNumber numberWithInteger:2];
    v22 = +[NSNumber numberWithInteger:v10];
    v23 = +[NSNumber numberWithInteger:v11];
    id v24 = [v27 initWithObjects:v31, v17, v18, v19, v20, v21, v22, @"image/argb1555", v23, v30, 0];

    if ([(IMDatabaseHandle *)v28->_db runStatement:v29 arguments:v24])
    {
      -[IMPersistentCache _adjustCacheSizeBy:](v28, "_adjustCacheSizeBy:", [v30 length]);
      [(IMPersistentCache *)v28 _unknownKeysRemoveObject:v31];
      BOOL v25 = 1;
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }
  free(v13);
  CGContextRelease(v15);
  id v6 = v31;
LABEL_12:

  return v25;
}

- (CGImage)copyCGImageForKey:(id)a3
{
  return [(IMPersistentCache *)self copyCGImageForKey:a3 resourceSize:0];
}

- (CGImage)_copyCGImageForRow:(id)a3 size:(CGSize *)a4 resourceSize:(int64_t *)a5 scale:(double *)a6
{
  id v10 = a3;
  if ([v10 count])
  {
    size_t v11 = [v10 objectAtIndex:0];
    [(IMPersistentCache *)self _accessedIdsAddObject:v11];

    id v12 = [v10 objectAtIndex:9];
    if (v12)
    {
      id v13 = [v10 objectAtIndex:1];
      id v36 = [v13 integerValue];

      CGContextRef v14 = [v10 objectAtIndex:2];
      id v37 = [v14 integerValue];

      unsigned __int8 v15 = [v10 objectAtIndex:3];
      id bitsPerComponent = [v15 integerValue];

      BOOL v16 = [v10 objectAtIndex:4];
      id v17 = [v16 integerValue];

      long long v18 = [v10 objectAtIndex:5];
      id v19 = [v18 integerValue];

      double v20 = [v10 objectAtIndex:6];
      [v20 floatValue];
      float v22 = v21;

      v23 = [v10 objectAtIndex:7];
      id v24 = +[NSNull null];
      if ([v23 isEqual:v24])
      {
        BOOL v25 = 0;
      }
      else
      {
        BOOL v25 = [v10 objectAtIndex:7];
      }

      id v27 = v12;
      id v28 = CGDataProviderCreateWithData(v27, [v27 bytes], (size_t)[v27 length], (CGDataProviderReleaseDataCallback)sub_C95A8);
      if ([v25 isEqualToString:@"image/argb1555"])
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        size_t v30 = 8 * (void)v17;
        uint64_t v31 = (uint64_t)v36;
        id v26 = CGImageCreate((size_t)v36, (size_t)v37, (size_t)bitsPerComponent, v30, (size_t)v19, DeviceRGB, 0x1006u, v28, 0, 0, kCGRenderingIntentDefault);
        CGColorSpaceRelease(DeviceRGB);
      }
      else if ([v25 isEqualToString:@"image/jpeg"])
      {
        id v26 = CGImageCreateWithJPEGDataProvider(v28, 0, 1, kCGRenderingIntentDefault);
        uint64_t v31 = (uint64_t)v36;
      }
      else
      {
        uint64_t v31 = (uint64_t)v36;
        if ([v25 isEqualToString:@"image/png"]) {
          id v26 = CGImageCreateWithPNGDataProvider(v28, 0, 1, kCGRenderingIntentDefault);
        }
        else {
          id v26 = 0;
        }
      }
      double v32 = v22;
      CGDataProviderRelease(v28);
      if (a4)
      {
        a4->width = (double)v31 / v32;
        a4->height = (double)(uint64_t)v37 / v32;
      }
      if (a6) {
        *a6 = v32;
      }
      if (a5)
      {
        v33 = [v10 objectAtIndex:8];
        *a5 = (int64_t)[v33 integerValue];
      }
    }
    else
    {
      id v26 = 0;
    }
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (CGImage)copyCGImageForKey:(id)a3 resourceSize:(int64_t *)a4 scale:(double *)a5
{
  id v8 = a3;
  if (v8)
  {
    if ([(IMPersistentCache *)self _unknownKeysContainsObject:v8])
    {
      id v9 = 0;
    }
    else
    {
      db = self->_db;
      id v12 = +[NSArray arrayWithObject:v8];
      id v9 = [(IMDatabaseHandle *)db arrayForQuery:@"select pk, width, height, bpc, bpp, bpr, scale, mimeType, resourceSize, resourcedata from items where key = ? limit 1" arguments:v12 rawRows:1];
    }
    if ([v9 count])
    {
      id v13 = [v9 objectAtIndex:0];
      id v10 = [(IMPersistentCache *)self _copyCGImageForRow:v13 size:0 resourceSize:a4 scale:a5];
    }
    else
    {
      [(IMPersistentCache *)self _unknownKeysAddObject:v8];
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)insertCGImages:(id)a3 forKey:(id)a4 mimeType:(id)a5 baseSize:(CGSize)a6 properties:(id)a7
{
  double width = a6.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (([v14 isEqualToString:@"image/jpeg"] & 1) != 0
    || [v14 isEqualToString:@"image/png"])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = v12;
    id v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v17)
    {
      id v18 = v17;
      id v32 = v12;
      char v19 = 0;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v16);
          }
          float v22 = *(CGImage **)(*((void *)&v37 + 1) + 8 * i);
          size_t v23 = CGImageGetWidth(v22);
          if (v23)
          {
            double v24 = round((double)v23 / width);
            if (v24 < 1.0) {
              double v24 = 1.0;
            }
          }
          else
          {
            double v24 = 1.0;
          }
          if ([(IMPersistentCache *)self _insertCGImage:v22 forKey:v13 mimeType:v14 scale:v15 properties:v24])
          {
            char v19 = 1;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v18);
      LOBYTE(v25) = v19 & 1;
      id v12 = v32;
      goto LABEL_27;
    }
LABEL_26:
    LOBYTE(v25) = 0;
    goto LABEL_27;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v12;
  id v27 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v27) {
    goto LABEL_26;
  }
  id v28 = v27;
  int v25 = 0;
  uint64_t v29 = *(void *)v34;
  do
  {
    for (j = 0; j != v28; j = (char *)j + 1)
    {
      if (*(void *)v34 != v29) {
        objc_enumerationMutation(v26);
      }
      v25 |= [(IMPersistentCache *)self _insertCGImage:*(void *)(*((void *)&v33 + 1) + 8 * (void)j) forKey:v13];
    }
    id v28 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
  }
  while (v28);
LABEL_27:

  return v25 & 1;
}

- (id)CGImagesForKey:(id)a3 size:(CGSize *)a4 resourceSize:(int64_t *)a5
{
  id v6 = a3;
  if (v6)
  {
    if ([(IMPersistentCache *)self _unknownKeysContainsObject:v6])
    {
      v7 = 0;
    }
    else
    {
      db = self->_db;
      id v10 = +[NSArray arrayWithObject:v6];
      v7 = [(IMDatabaseHandle *)db arrayForQuery:@"select pk, width, height, bpc, bpp, bpr, scale, mimeType, resourceSize, resourcedata from items where key = ?" arguments:v10 rawRows:1];
    }
    if ([v7 count])
    {
      id v26 = v7;
      id v27 = v6;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = v7;
      id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v12)
      {
        id v13 = v12;
        id v8 = 0;
        int v14 = 0;
        int v15 = 0;
        uint64_t v16 = *(void *)v31;
LABEL_9:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v11);
          }
          if (v14 & v15) {
            break;
          }
          id v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
          char v19 = [v18 objectAtIndex:6];
          [v19 floatValue];
          float v21 = v20;

          if ((v14 & (v21 == 1.0)) != 0)
          {
            int v14 = 1;
          }
          else if ((v21 != 2.0) | (v15 ^ 1) & 1)
          {
            float v22 = [(IMPersistentCache *)self _copyCGImageForRow:v18 size:a4 resourceSize:a5 scale:0];
            if (v22)
            {
              size_t v23 = v22;
              if (!v8)
              {
                id v8 = +[NSMutableArray array];
              }
              BOOL v24 = v21 != 1.0;
              v14 |= v21 == 1.0;
              if (v21 != 2.0) {
                BOOL v24 = 0;
              }
              v15 |= v24;
              [v8 addObject:v23, v26, v27];
              CFRelease(v23);
            }
          }
          if (v13 == (id)++v17)
          {
            id v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
            if (v13) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
      else
      {
        id v8 = 0;
      }

      v7 = v26;
      id v6 = v27;
    }
    else
    {
      [(IMPersistentCache *)self _unknownKeysAddObject:v6];
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CGImage)copyCGImageForKey:(id)a3 resourceSize:(int64_t *)a4
{
  return [(IMPersistentCache *)self copyCGImageForKey:a3 resourceSize:a4 scale:0];
}

- (id)firstImageKeyWithRootKey:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"%%%@%%", v4];

  db = self->_db;
  v7 = +[NSArray arrayWithObject:v5];
  id v8 = [(IMDatabaseHandle *)db arrayForQuery:@"select key from items where key like ? order by width desc limit 1" arguments:v7 rawRows:1];

  if ([v8 count])
  {
    id v9 = [v8 firstObject];
    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)itemsForMimeType:(id)a3
{
  db = self->_db;
  id v4 = +[NSArray arrayWithObject:a3];
  id v5 = [(IMDatabaseHandle *)db arrayForQuery:@"select * from items where mimeType = ?" arguments:v4 rawRows:0];

  return v5;
}

- (id)deleteItemsForMimeType:(id)a3
{
  id v4 = [a3 stringByAppendingString:@"%%"];
  db = self->_db;
  id v6 = +[NSArray arrayWithObject:v4];
  [(IMDatabaseHandle *)db runStatement:@"delete from items where mimeType like ?" arguments:v6];

  [(IMDatabaseHandle *)self->_db runStatement:@"vacuum" arguments:0];
  return 0;
}

- (BOOL)hasItemForKey:(id)a3
{
  id v4 = a3;
  if ([(IMPersistentCache *)self _unknownKeysContainsObject:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [objc_alloc((Class)NSArray) initWithObjects:v4, 0];
    v7 = [(IMDatabaseHandle *)self->_db arrayForQuery:@"select pk from items where key = ? limit 1" arguments:v6 rawRows:1];
    id v8 = [v7 count];
    BOOL v5 = v8 != 0;
    if (!v8) {
      [(IMPersistentCache *)self _unknownKeysAddObject:v4];
    }
  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_13;
  }
  if ([(IMPersistentCache *)self _unknownKeysContainsObject:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    db = self->_db;
    id v8 = +[NSArray arrayWithObject:v4];
    BOOL v5 = [(IMDatabaseHandle *)db arrayForQuery:@"select pk, resourcedata from items where key = ? limit 1" arguments:v8 rawRows:1];
  }
  if (![v5 count])
  {
    [(IMPersistentCache *)self _unknownKeysAddObject:v4];
LABEL_11:
    id v6 = 0;
    goto LABEL_12;
  }
  id v9 = [v5 objectAtIndex:0];
  if (![v9 count])
  {

    goto LABEL_11;
  }
  id v10 = [v9 objectAtIndex:0];
  [(IMPersistentCache *)self _accessedIdsAddObject:v10];

  id v6 = [v9 objectAtIndex:1];

LABEL_12:
LABEL_13:

  return v6;
}

- (void)deleteItemForKey:(id)a3
{
  id v4 = a3;
  if ([(IMPersistentCache *)self hasItemForKey:v4])
  {
    db = self->_db;
    id v6 = +[NSArray arrayWithObject:v4];
    v7 = [(IMDatabaseHandle *)db arrayForQuery:@"select resourceSize from items where key = ?" arguments:v6 rawRows:1];

    if ([v7 count])
    {
      id v8 = [v7 objectAtIndex:0];
      if ([v8 count])
      {
        id v9 = [v8 objectAtIndex:0];
        uint64_t v10 = (uint64_t)[v9 integerValue];

        if (v10 >= 1)
        {
          id v11 = self->_db;
          id v12 = +[NSArray arrayWithObject:v4];
          LODWORD(v11) = [(IMDatabaseHandle *)v11 runStatement:@"delete from items where key = ?" arguments:v12];

          if (v11) {
            [(IMPersistentCache *)self _adjustCacheSizeBy:-v10];
          }
        }
      }
    }
  }
}

- (void)deleteItemsWithKeyLike:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = +[NSArray arrayWithObject:v5];
    [(IMPersistentCache *)self deleteItemsWithAllKeysContaining:v4];
  }
}

- (void)deleteItemsWithAllKeysContaining:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v27 = v3;
    if ([v3 count])
    {
      unint64_t v4 = 0;
      id v5 = &stru_2CE418;
      do
      {
        if ([(__CFString *)v5 length])
        {
          uint64_t v6 = [(__CFString *)v5 stringByAppendingString:@" AND "];

          id v5 = (__CFString *)v6;
        }
        v7 = [(__CFString *)v5 stringByAppendingString:@" key like ? "];

        ++v4;
        id v5 = v7;
      }
      while (v4 < (unint64_t)[v27 count]);
    }
    else
    {
      v7 = &stru_2CE418;
    }
    BOOL v24 = [@"select resourceSize, pk from items where " stringByAppendingString:v7];
    id v26 = [(IMDatabaseHandle *)self->_db arrayForQuery:v24 arguments:v27 rawRows:1];
    if ([v26 count])
    {
      id v8 = +[NSMutableSet set];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v9 = v26;
      uint64_t v10 = 0;
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v29;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            int v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([v14 count] == (char *)&def_7D91C + 2)
            {
              int v15 = [v14 objectAtIndex:0];
              id v16 = [v15 integerValue];

              uint64_t v17 = [v14 objectAtIndex:1];
              [v8 addObject:v17];

              v10 += (uint64_t)v16;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }

      if ([v8 count])
      {
        id v18 = +[IMDatabaseHandle questionMarkListForCollection:v8];
        char v19 = +[NSString stringWithFormat:@"delete from items where pk in %@", v18];

        db = self->_db;
        float v21 = [v8 allObjects];
        unsigned int v22 = [(IMDatabaseHandle *)db runStatement:v19 arguments:v21];

        if (v10) {
          unsigned int v23 = v22;
        }
        else {
          unsigned int v23 = 0;
        }
        if (v23 == 1) {
          [(IMPersistentCache *)self _adjustCacheSizeBy:-v10];
        }
      }
      else
      {
        char v19 = v24;
      }
    }
    else
    {
      char v19 = v24;
    }

    id v3 = v27;
  }
}

- (void)replaceDataForKey:(id)a3 withData:(id)a4 mimeType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(IMPersistentCache *)self deleteItemForKey:v10];
  [(IMPersistentCache *)self insertData:v9 forKey:v10 mimeType:v8];
}

- (id)dataForKey:(id)a3 mimeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v9 = 0;
    goto LABEL_13;
  }
  if ([(IMPersistentCache *)self _unknownKeysContainsObject:v6])
  {
    id v8 = 0;
  }
  else
  {
    db = self->_db;
    id v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, v7, 0);
    id v8 = [(IMDatabaseHandle *)db arrayForQuery:@"select pk, resourcedata from items where key = ? and mimeType = ? limit 1" arguments:v11 rawRows:1];
  }
  if (![v8 count])
  {
    [(IMPersistentCache *)self _unknownKeysAddObject:v6];
LABEL_11:
    id v9 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = [v8 objectAtIndex:0];
  if (![v12 count])
  {

    goto LABEL_11;
  }
  id v13 = [v12 objectAtIndex:0];
  [(IMPersistentCache *)self _accessedIdsAddObject:v13];

  id v9 = [v12 objectAtIndex:1];

LABEL_12:
LABEL_13:

  return v9;
}

- (unint64_t)resourceSizeForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    db = self->_db;
    id v6 = +[NSArray arrayWithObject:v4];
    id v7 = [(IMDatabaseHandle *)db arrayForQuery:@"select resourceSize from items where key = ?" arguments:v6 rawRows:1];

    if (v7)
    {
      id v8 = [v7 firstObject];
      id v9 = v8;
      if (v8)
      {
        id v10 = [v8 firstObject];
        unint64_t v11 = (unint64_t)[v10 unsignedIntegerValue];
      }
      else
      {
        unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)allKeys
{
  return [(IMDatabaseHandle *)self->_db stringColumnDataForQuery:@"select key from items" withArguments:0];
}

- (void)clear
{
  if ([(IMDatabaseHandle *)self->_db runStatement:@"delete from items" arguments:0])
  {
    os_unfair_lock_lock(&self->_cacheSizeLock);
    self->_cacheSize = 0;
    os_unfair_lock_unlock(&self->_cacheSizeLock);
    [(IMPersistentCache *)self _saveCacheSize:0];
    [(IMPersistentCache *)self _accessedIdsRemoveAllObjects];
  }
}

- (id)metadataForKey:(id)a3
{
  id v4 = a3;
  db = self->_db;
  id v6 = +[NSArray arrayWithObject:v4];
  id v7 = [(IMDatabaseHandle *)db arrayForQuery:@"select key, accessDate, width, height, mimeType, scale, resourceSize from items where key = ?" arguments:v6 rawRows:0];

  id v8 = [v7 firstObject];

  return v8;
}

- (void)_adjustCacheSizeBy:(int64_t)a3
{
  p_cacheSizeLock = &self->_cacheSizeLock;
  os_unfair_lock_lock(&self->_cacheSizeLock);
  unint64_t v6 = self->_cacheSize + a3;
  self->_cacheSize = v6;
  os_unfair_lock_unlock(p_cacheSizeLock);

  [(IMPersistentCache *)self _saveCacheSize:v6];
}

- (void)_saveCacheSize:(int64_t)a3
{
  adminTable = self->_adminTable;
  id v4 = +[NSNumber numberWithInteger:a3];
  [(IMAdminTable *)adminTable setProperty:v4 forKey:@"cacheSize" domain:@"statistics"];
}

- (unint64_t)_loadCacheSize
{
  v2 = [(IMAdminTable *)self->_adminTable numberValueForKey:@"cacheSize" domain:@"statistics"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (void)_LRUCleanupForMimeType:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  BOOL v24 = [v4 stringByAppendingString:@"%%"];

  unint64_t v6 = @"select pk, accessDate, resourceSize from items where mimeType like ?";
  if (!v24) {
    unint64_t v6 = @"select pk, accessDate, resourceSize from items";
  }
  id v26 = v6;
  if (v24)
  {
    uint64_t v7 = +[NSArray arrayWithObject:v24];
  }
  else
  {
    uint64_t v7 = 0;
  }
  unsigned int v23 = (void *)v7;
  int v25 = -[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", v26);
  id v27 = +[NSMutableSet set];
  os_unfair_lock_lock(&self->_cacheSizeLock);
  unint64_t cacheSize = self->_cacheSize;
  os_unfair_lock_t lock = &self->_cacheSizeLock;
  os_unfair_lock_unlock(&self->_cacheSizeLock);
  id v9 = [v25 objectEnumerator];
  id v10 = [v9 nextObject];
  if (v10)
  {
    do
    {
      unint64_t v11 = [v10 objectForKey:@"accessDate"];
      id v12 = [v11 compare:v5];

      if (v12 == (id)-1)
      {
        id v13 = [v10 objectForKey:@"resourceSize"];
        id v14 = [v13 integerValue];

        int v15 = [v10 objectForKey:@"pk"];
        cacheSize -= (unint64_t)v14;
        [v27 addObject:v15];

        if (cacheSize < self->_maxSize) {
          break;
        }
      }
      uint64_t v16 = [v9 nextObject];

      id v10 = (void *)v16;
    }
    while (v16);
  }
  if ([v27 count])
  {
    uint64_t v17 = +[IMDatabaseHandle questionMarkListForCollection:v27];
    id v18 = +[NSString stringWithFormat:@"delete from items where pk in %@", v17];

    db = self->_db;
    float v20 = [v27 allObjects];
    LODWORD(db) = [(IMDatabaseHandle *)db runStatement:v18 arguments:v20];

    [(IMDatabaseHandle *)self->_db runStatement:@"vacuum" arguments:0];
    if (db)
    {
      os_unfair_lock_lock(lock);
      self->_unint64_t cacheSize = cacheSize;
      os_unfair_lock_unlock(lock);
      [(IMPersistentCache *)self _saveCacheSize:cacheSize];
    }
  }
}

- (void)_updateCaches:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessedIdsLock);
  id v5 = [(NSMutableSet *)self->_accessedIds copy];
  os_unfair_lock_unlock(&self->_accessedIdsLock);
  if ([v5 count])
  {
    unint64_t v6 = +[IMDatabaseHandle questionMarkListForCollection:v5];
    uint64_t v7 = +[NSString stringWithFormat:@"update items set accessDate = ? where pk in %@", v6];

    id v8 = +[NSDate date];
    id v9 = +[NSMutableArray arrayWithObject:v8];

    id v10 = [v5 allObjects];
    [v9 addObjectsFromArray:v10];

    if ([(IMDatabaseHandle *)self->_db runStatement:v7 arguments:v9]) {
      [(IMPersistentCache *)self _accessedIdsRemoveAllObjects];
    }
  }
  os_unfair_lock_lock(&self->_cacheSizeLock);
  unint64_t cacheSize = self->_cacheSize;
  os_unfair_lock_unlock(&self->_cacheSizeLock);
  if (cacheSize > self->_maxSize) {
    [(IMPersistentCache *)self _LRUCleanupForMimeType:0];
  }
}

- (int64_t)version
{
  v2 = [(IMAdminTable *)self->_adminTable numberValueForKey:@"version" domain:@"database"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (BOOL)_unknownKeysContainsObject:(id)a3
{
  id v3 = self;
  p_unknownKeysLock = &self->_unknownKeysLock;
  id v5 = a3;
  os_unfair_lock_lock(p_unknownKeysLock);
  LOBYTE(v3) = [(NSMutableSet *)v3->_unknownKeys containsObject:v5];

  os_unfair_lock_unlock(p_unknownKeysLock);
  return (char)v3;
}

- (void)_unknownKeysRemoveObject:(id)a3
{
  p_unknownKeysLock = &self->_unknownKeysLock;
  id v5 = a3;
  os_unfair_lock_lock(p_unknownKeysLock);
  [(NSMutableSet *)self->_unknownKeys removeObject:v5];

  os_unfair_lock_unlock(p_unknownKeysLock);
}

- (void)_unknownKeysAddObject:(id)a3
{
  p_unknownKeysLock = &self->_unknownKeysLock;
  id v5 = a3;
  os_unfair_lock_lock(p_unknownKeysLock);
  [(NSMutableSet *)self->_unknownKeys addObject:v5];

  os_unfair_lock_unlock(p_unknownKeysLock);
}

- (void)_accessedIdsRemoveAllObjects
{
  p_accessedIdsLock = &self->_accessedIdsLock;
  os_unfair_lock_lock(&self->_accessedIdsLock);
  [(NSMutableSet *)self->_accessedIds removeAllObjects];

  os_unfair_lock_unlock(p_accessedIdsLock);
}

- (void)_accessedIdsAddObject:(id)a3
{
  p_accessedIdsLock = &self->_accessedIdsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessedIdsLock);
  [(NSMutableSet *)self->_accessedIds addObject:v5];

  os_unfair_lock_unlock(p_accessedIdsLock);
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_unknownKeys, 0);
  objc_storeStrong((id *)&self->_accessedIds, 0);
  objc_storeStrong((id *)&self->_adminTable, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end