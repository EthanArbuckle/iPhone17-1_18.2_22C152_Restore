@interface THReflowablePaginationCache
+ (BOOL)supportsSecureCoding;
+ (id)archiveStorageURLForAssetID:(id)a3;
+ (id)loadFromArchiveWithAssetID:(id)a3 bookVersionString:(id)a4 modificationDate:(id)a5;
+ (void)_evictOlderCacheFiles:(id)a3;
- (NSDate)bookModificationDate;
- (NSMutableDictionary)mutableResults;
- (NSString)assetID;
- (NSString)bookVersionString;
- (THReflowablePaginationCache)initWithAssetID:(id)a3 bookVersionString:(id)a4 modificationDate:(id)a5;
- (THReflowablePaginationCache)initWithCoder:(id)a3;
- (id)cachedResultsForKey:(id)a3;
- (id)keyEnumerator;
- (void)archive;
- (void)cacheResult:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setBookModificationDate:(id)a3;
- (void)setBookVersionString:(id)a3;
- (void)setMutableResults:(id)a3;
@end

@implementation THReflowablePaginationCache

+ (id)loadFromArchiveWithAssetID:(id)a3 bookVersionString:(id)a4 modificationDate:(id)a5
{
  if (-[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", @"BKEpubPaginationCache_DisableCacheLoading")|| ![a3 length])
  {
    return 0;
  }
  id v9 = [a1 archiveStorageURLForAssetID:a3];
  uint64_t v19 = 0;
  if (!v9
    || (v10 = +[NSData dataWithContentsOfURL:v9 options:0 error:&v19]) == 0)
  {
    v13 = THLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_2A0BDC();
    }
    return 0;
  }
  id v11 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v10 error:&v19];
  if (v11)
  {
    id v12 = [v11 decodeObjectOfClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forKey:@"root"];
  }
  else
  {
    v15 = THLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2A0C58();
    }
    id v12 = 0;
  }

  if (a4
    && (objc_opt_class(),
        [v12 bookVersionString],
        ![a4 isEqualToString:TSUDynamicCast()])
    || a5
    && (objc_opt_class(),
        [v12 bookModificationDate],
        ![a5 isEqual:TSUDynamicCast()]))
  {
    id v12 = 0;
  }
  id v16 = [v9 URLByDeletingLastPathComponent];
  global_queue = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_121880;
  block[3] = &unk_456DE0;
  block[4] = v16;
  dispatch_async(global_queue, block);
  return v12;
}

+ (id)archiveStorageURLForAssetID:(id)a3
{
  v4 = +[NSFileManager defaultManager];
  v5 = [(NSFileManager *)v4 URLsForDirectory:13 inDomains:1];
  id result = [(NSArray *)v5 count];
  if (result)
  {
    id v7 = [[v5 objectAtIndex:0] URLByAppendingPathComponent:@"PaginationCache"];
    uint64_t v9 = 0;
    unsigned int v8 = [(NSFileManager *)v4 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v9];
    id result = 0;
    if (v8) {
      return [v7 URLByAppendingPathComponent:a3];
    }
  }
  return result;
}

- (THReflowablePaginationCache)initWithAssetID:(id)a3 bookVersionString:(id)a4 modificationDate:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THReflowablePaginationCache;
  unsigned int v8 = [(THReflowablePaginationCache *)&v10 init];
  if (v8)
  {
    v8->_assetID = (NSString *)[a3 copy];
    v8->_bookVersionString = (NSString *)[a4 copy];
    v8->_bookModificationDate = (NSDate *)a5;
    v8->_mutableResults = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THReflowablePaginationCache;
  [(THReflowablePaginationCache *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THReflowablePaginationCache)initWithCoder:(id)a3
{
  v4 = [(THReflowablePaginationCache *)self init];
  if (v4)
  {
    if ([a3 decodeIntegerForKey:@"encodingVersion"] == (char *)&dword_18 + 3)
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = objc_opt_class();
      Class v7 = NSClassFromString(@"THPaginationResultsKey");
      v4->_mutableResults = (NSMutableDictionary *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0), @"cachedResults"), "mutableCopy");
      v4->_assetID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"assetID"), "copy");
      v4->_bookVersionString = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"bookVersionString"), "copy");
      v4->_bookModificationDate = (NSDate *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:27 forKey:@"encodingVersion"];
  [a3 encodeObject:[self assetID] forKey:@"assetID"];
  [a3 encodeObject:[self bookVersionString] forKey:@"bookVersionString"];
  [a3 encodeObject:[self bookModificationDate] forKey:@"modificationDate"];
  id v5 = [(NSMutableDictionary *)self->_mutableResults copy];
  [a3 encodeObject:v5 forKey:@"cachedResults"];
}

- (void)cacheResult:(id)a3 forKey:(id)a4
{
}

- (id)cachedResultsForKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_mutableResults objectForKey:a3];

  return v3;
}

- (id)keyEnumerator
{
  return [(NSMutableDictionary *)self->_mutableResults keyEnumerator];
}

- (void)archive
{
  if ([(NSString *)[(THReflowablePaginationCache *)self assetID] length])
  {
    id v3 = [objc_opt_class() archiveStorageURLForAssetID:[self assetID]];
    id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v4 encodeObject:self forKey:@"root"];
    [v4 finishEncoding];
    uint64_t v6 = 0;
    if ((objc_msgSend(objc_msgSend(v4, "encodedData"), "writeToURL:options:error:", v3, 1, &v6) & 1) == 0)
    {
      id v5 = THLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_2A0D10();
      }
    }
  }
}

+ (void)_evictOlderCacheFiles:(id)a3
{
  v20[0] = NSURLFileSizeKey;
  v20[1] = NSURLContentModificationDateKey;
  id v16 = +[NSFileManager defaultManager];
  id v4 = [(NSFileManager *)v16 enumeratorAtURL:a3 includingPropertiesForKeys:+[NSArray arrayWithObjects:v20 count:2] options:1 errorHandler:0];
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = [(NSDirectoryEnumerator *)v4 nextObject];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    do
    {
      v19[0] = NSURLFileSizeKey;
      v19[1] = NSURLContentModificationDateKey;
      id v9 = [v7 resourceValuesForKeys:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2) error:0];
      id v10 = [[v9 objectForKeyedSubscript:NSURLFileSizeKey] unsignedLongLongValue];
      v17[1] = NSURLFileSizeKey;
      v18[0] = v7;
      v8 += (unint64_t)v10;
      v17[0] = @"url";
      v18[1] = [v9 objectForKeyedSubscript:NSURLFileSizeKey];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2), objc_msgSend(v9, "objectForKeyedSubscript:", NSURLContentModificationDateKey));
      id v7 = [(NSDirectoryEnumerator *)v4 nextObject];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }
  id v11 = [[[v5 allKeys] sortedArrayUsingSelector:@"compare:"] mutableCopy];
  if (v8 > 0x4C4B40)
  {
    id v12 = v11;
    do
    {
      if (![v12 count]) {
        break;
      }
      id v13 = [v12 objectAtIndexedSubscript:0];
      [v16 removeItemAtURL:[v5 objectForKeyedSubscript:v13] error:0];
      unint64_t v14 = [[[v5 objectForKeyedSubscript:v13] objectForKeyedSubscript:NSURLFileSizeKey] unsignedLongLongValue];
      BOOL v15 = v8 >= v14;
      v8 -= v14;
      if (!v15) {
        break;
      }
      [v5 removeObjectForKey:v13];
      [v12 removeObjectAtIndex:0];
    }
    while (v8 > 0x4C4B40);
  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)bookVersionString
{
  return self->_bookVersionString;
}

- (void)setBookVersionString:(id)a3
{
}

- (NSDate)bookModificationDate
{
  return self->_bookModificationDate;
}

- (void)setBookModificationDate:(id)a3
{
}

- (NSMutableDictionary)mutableResults
{
  return self->_mutableResults;
}

- (void)setMutableResults:(id)a3
{
}

@end