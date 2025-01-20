@interface MBServiceConfiguration
+ (id)configurationWithPropertyList:(id)a3;
+ (id)configurationWithURL:(id)a3 error:(id *)a4;
+ (id)defaultConfiguration;
- (MBServiceConfiguration)initWithPropertyList:(id)a3;
- (NSArray)bundleIDsNotToBackUp;
- (NSDictionary)propertyList;
- (NSSet)domainNamesNotToBackUp;
- (unint64_t)_positiveIntegerForKey:(id)a3 defaultValue:(unint64_t)a4;
- (unint64_t)addFilesCount;
- (unint64_t)addFilesSize;
- (unint64_t)getFilesCount;
- (unint64_t)getFilesSize;
- (unint64_t)listFilesCount;
- (unint64_t)maxFileAttributesSize;
- (unint64_t)maxInflightContainers;
- (unint64_t)removeFilesCount;
- (void)dealloc;
@end

@implementation MBServiceConfiguration

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(MBServiceConfiguration);

  return v2;
}

+ (id)configurationWithPropertyList:(id)a3
{
  v3 = [[MBServiceConfiguration alloc] initWithPropertyList:a3];

  return v3;
}

+ (id)configurationWithURL:(id)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  id v6 = +[MBURLConnection sendSyncRequest:properties:connection:response:error:](MBURLConnection, "sendSyncRequest:properties:connection:response:error:", +[MBURLRequest requestWithURL:](MBURLRequest, "requestWithURL:"), 0, 0, 0, &v13);
  if (v6)
  {
    id v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v13];
    if (v7) {
      return +[MBServiceConfiguration configurationWithPropertyList:v7];
    }
    if (a4)
    {
      uint64_t v10 = v13;
      CFStringRef v11 = @"Error deserializing configuration";
      uint64_t v9 = 1;
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    uint64_t v9 = (int)+[MBError codeForNSError:v13];
    uint64_t v10 = v13;
    CFStringRef v11 = @"Error getting configuration";
LABEL_8:
    v12 = +[MBError errorWithCode:v9 error:v10 URL:a3 format:v11];
    id result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

- (MBServiceConfiguration)initWithPropertyList:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBServiceConfiguration;
  v4 = [(MBServiceConfiguration *)&v6 init];
  if (v4) {
    v4->_plist = (NSDictionary *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBServiceConfiguration;
  [(MBServiceConfiguration *)&v3 dealloc];
}

- (NSDictionary)propertyList
{
  return self->_plist;
}

- (NSArray)bundleIDsNotToBackUp
{
  v2 = [(NSDictionary *)self->_plist objectForKeyedSubscript:@"bundleIDsNotToBackUp"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_4:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v2);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 0;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          goto LABEL_4;
        }
        return v2;
      }
    }
  }
  return v2;
}

- (NSSet)domainNamesNotToBackUp
{
  id v3 = (NSSet *)+[NSMutableSet set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(MBServiceConfiguration *)self bundleIDsNotToBackUp];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSSet *)v3 addObject:+[MBDomain nameWithAppID:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)]];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (unint64_t)_positiveIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v5 = [(NSDictionary *)self->_plist objectForKeyedSubscript:a3];
  if (!v5) {
    return a4;
  }
  id v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t)[v6 integerValue] < 1) {
    return a4;
  }

  return (unint64_t)[v6 unsignedIntegerValue];
}

- (unint64_t)addFilesCount
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"addFilesCount" defaultValue:100];
}

- (unint64_t)addFilesSize
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"addFilesSize" defaultValue:0x2000000];
}

- (unint64_t)getFilesCount
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"getFilesCount" defaultValue:100];
}

- (unint64_t)getFilesSize
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"getFilesSize" defaultValue:0x2000000];
}

- (unint64_t)removeFilesCount
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"removeFilesCount" defaultValue:100];
}

- (unint64_t)listFilesCount
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"listFilesCount" defaultValue:1000];
}

- (unint64_t)maxInflightContainers
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"maxInflightContainers" defaultValue:4];
}

- (unint64_t)maxFileAttributesSize
{
  return [(MBServiceConfiguration *)self _positiveIntegerForKey:@"maxFileAttributesSize" defaultValue:2048];
}

@end