@interface MBPlaceholderEntitlementsManifest
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (MBPlaceholderEntitlementsManifest)init;
- (MBPlaceholderEntitlementsManifest)initWithFile:(id)a3 error:(id *)a4;
- (id)entryAtIndex:(int64_t)a3;
- (id)propertyList;
- (int64_t)entryCount;
- (void)addEntriesForApp:(id)a3;
- (void)addEntriesForApps:(id)a3;
- (void)addEntry:(id)a3;
- (void)dealloc;
@end

@implementation MBPlaceholderEntitlementsManifest

- (MBPlaceholderEntitlementsManifest)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBPlaceholderEntitlementsManifest;
  v2 = [(MBPlaceholderEntitlementsManifest *)&v4 init];
  if (v2) {
    v2->_entries = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (MBPlaceholderEntitlementsManifest)initWithFile:(id)a3 error:(id *)a4
{
  v6 = +[NSData dataWithContentsOfFile:a3 options:0 error:a4];
  if (!v6) {
    return 0;
  }
  id v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:a4];
  if (!v7) {
    return 0;
  }
  v8 = v7;
  v20.receiver = self;
  v20.super_class = (Class)MBPlaceholderEntitlementsManifest;
  v9 = [(MBPlaceholderEntitlementsManifest *)&v20 init];
  if (v9)
  {
    v9->_entries = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = [[MBPlaceholderEntitlements alloc] initWithPropertyList:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [(NSMutableArray *)v9->_entries addObject:v14];
        }
        id v11 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBPlaceholderEntitlementsManifest;
  [(MBPlaceholderEntitlementsManifest *)&v3 dealloc];
}

- (int64_t)entryCount
{
  return (int64_t)[(NSMutableArray *)self->_entries count];
}

- (id)entryAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_entries objectAtIndexedSubscript:a3];
}

- (void)addEntry:(id)a3
{
}

- (void)addEntriesForApp:(id)a3
{
  if (([a3 isSystemApp] & 1) == 0)
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "bundleDir"), "stringByStandardizingPath");
    id v6 = [v5 stringByDeletingLastPathComponent];
    id v7 = -[MBPlaceholderEntitlements initWithBundleID:relativePath:entitlements:]([MBPlaceholderEntitlements alloc], "initWithBundleID:relativePath:entitlements:", [a3 bundleID], objc_msgSend(objc_msgSend(v5, "substringFromIndex:", (char *)objc_msgSend(v6, "length") + 1), "stringByAppendingPathComponent:", @"PlaceholderEntitlements.plist"), objc_msgSend(a3, "entitlements"));
    [(NSMutableArray *)self->_entries addObject:v7];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id obj = [a3 plugins];
    id v8 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = -[MBPlaceholderEntitlements initWithBundleID:relativePath:entitlements:]([MBPlaceholderEntitlements alloc], "initWithBundleID:relativePath:entitlements:", [a3 bundleID], objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "bundleDir"), "stringByStandardizingPath"), "substringFromIndex:", (char *)objc_msgSend(v6, "length") + 1), "stringByAppendingPathComponent:", @"PlaceholderEntitlements.plist"), objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "entitlements"));
          [(NSMutableArray *)self->_entries addObject:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)addEntriesForApps:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(MBPlaceholderEntitlementsManifest *)self addEntriesForApp:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)propertyList
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  entries = self->_entries;
  id v5 = [(NSMutableArray *)entries countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(entries);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "propertyList"));
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)entries countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6 = +[NSPropertyListSerialization dataWithPropertyList:[(MBPlaceholderEntitlementsManifest *)self propertyList] format:200 options:0 error:a4];
  if (v6)
  {
    LOBYTE(v6) = [(NSData *)v6 writeToFile:a3 options:1 error:a4];
  }
  return (char)v6;
}

@end