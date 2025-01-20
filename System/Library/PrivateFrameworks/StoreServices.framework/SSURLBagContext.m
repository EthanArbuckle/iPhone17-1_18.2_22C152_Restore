@interface SSURLBagContext
+ (SSURLBagContext)contextWithBagType:(int64_t)a3;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)allowsExpiredBags;
- (BOOL)ignoresCaches;
- (BOOL)isEqual:(id)a3;
- (BOOL)useBinCompatBag;
- (BOOL)usesCachedBagsOnly;
- (NSData)clientAuditTokenData;
- (NSDictionary)allHTTPHeaders;
- (NSNumber)userIdentifier;
- (NSString)cacheKey;
- (NSString)clientBundleIdentifier;
- (NSString)description;
- (SSURLBagContext)init;
- (SSURLBagContext)initWithXPCEncoding:(id)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)valueForHTTPHeaderField:(id)a3;
- (int64_t)allowedRetryCount;
- (int64_t)bagType;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAllHTTPHeaders:(id)a3;
- (void)setAllowedRetryCount:(int64_t)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setAllowsExpiredBags:(BOOL)a3;
- (void)setBagType:(int64_t)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setIgnoresCaches:(BOOL)a3;
- (void)setUseBinCompatBag:(BOOL)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUsesCachedBagsOnly:(BOOL)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
@end

@implementation SSURLBagContext

- (SSURLBagContext)init
{
  result = [(SSURLBagContext *)self _init];
  if (result) {
    result->_allowedRetryCount = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSURLBagContext;
  [(SSURLBagContext *)&v3 dealloc];
}

+ (SSURLBagContext)contextWithBagType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setBagType:a3];
  return (SSURLBagContext *)v4;
}

- (NSDictionary)allHTTPHeaders
{
  v2 = (void *)[(NSMutableDictionary *)self->_httpHeaders copy];
  return (NSDictionary *)v2;
}

- (NSString)cacheKey
{
  objc_super v3 = (__CFString *)[(NSMutableDictionary *)self->_httpHeaders objectForKey:@"X-Apple-Store-Front"];
  id v4 = (__CFString *)[(NSMutableDictionary *)self->_httpHeaders objectForKey:@"User-Agent"];
  v5 = [(SSURLBagContext *)self userIdentifier];
  if (v3)
  {
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = +[SSAccountStore defaultStore];
  v10 = v9;
  if (v5)
  {
    v11 = (void *)[v9 accountWithUniqueIdentifier:v5];
    if (v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v11 = (void *)[v9 activeAccount];
  if (!v11) {
LABEL_8:
  }
    v11 = (void *)[v10 localiTunesAccount];
LABEL_9:
  objc_super v3 = (__CFString *)SSVStoreFrontIdentifierForAccount(v11);
  if (!v4) {
LABEL_3:
  }
    id v4 = (__CFString *)SSVDefaultUserAgent();
LABEL_4:
  v6 = NSString;
  int64_t v7 = [(SSURLBagContext *)self bagType];
  if (v5) {
    v8 = [(NSNumber *)v5 stringValue];
  }
  else {
    v8 = @"nil";
  }
  if (v4) {
    v12 = v4;
  }
  else {
    v12 = @"nil";
  }
  if (v3) {
    v13 = v3;
  }
  else {
    v13 = @"nil";
  }
  if (self->_useBinCompatBag) {
    v14 = @"binCompat";
  }
  else {
    v14 = @"nonBinCompat";
  }
  return (NSString *)[v6 stringWithFormat:@"%ld-%@-%@-%@-%@", v7, v8, v12, v13, v14];
}

- (NSString)clientBundleIdentifier
{
  if ([(NSData *)[(SSURLBagContext *)self clientAuditTokenData] length] != 32) {
    return 0;
  }
  [(NSData *)[(SSURLBagContext *)self clientAuditTokenData] getBytes:&v5 length:32];
  objc_super v3 = (const void *)CPCopyBundleIdentifierFromAuditToken();
  return (NSString *)(id)CFMakeCollectable(v3);
}

- (void)setAllHTTPHeaders:(id)a3
{
  httpHeaders = self->_httpHeaders;
  if (httpHeaders != a3)
  {

    self->_httpHeaders = (NSMutableDictionary *)[a3 copy];
  }
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  httpHeaders = self->_httpHeaders;
  if (a3)
  {
    if (!httpHeaders)
    {
      httpHeaders = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_httpHeaders = httpHeaders;
    }
    [(NSMutableDictionary *)httpHeaders setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)httpHeaders removeObjectForKey:a4];
  }
}

- (id)valueForHTTPHeaderField:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_httpHeaders objectForKey:a3];
  return v3;
}

- (NSNumber)userIdentifier
{
  [(NSLock *)self->_lock lock];
  userIdentifier = self->_userIdentifier;
  if (!userIdentifier)
  {
    if ([(SSURLBagContext *)self bagType] == 1) {
      id v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E4F4D9F0]), "ams_activeiTunesAccount"), "ams_DSID");
    }
    else {
      id v4 = objc_msgSend((id)objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
    }
    userIdentifier = v4;
    self->_userIdentifier = userIdentifier;
  }
  [(NSLock *)self->_lock unlock];
  return userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {

    self->_userIdentifier = 0;
  }
  self->_userIdentifier = (NSNumber *)a3;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSURLBagContext;
  return (NSString *)[NSString stringWithFormat:@"%@: [%@]", -[SSURLBagContext description](&v3, sel_description), -[SSURLBagContext cacheKey](self, "cacheKey")];
}

- (unint64_t)hash
{
  int64_t bagType = self->_bagType;
  uint64_t v4 = [(NSData *)self->_clientAuditTokenData hash];
  uint64_t v5 = v4 + bagType + [(NSNumber *)[(SSURLBagContext *)self userIdentifier] hash];
  return v5 + [(NSMutableDictionary *)self->_httpHeaders hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && self->_allowedRetryCount == *((void *)a3 + 1)
    && self->_allowsBootstrapCellularData == *((unsigned __int8 *)a3 + 16)
    && self->_allowsExpiredBags == *((unsigned __int8 *)a3 + 17)
    && self->_bagType == *((void *)a3 + 3)
    && self->_ignoresCaches == *((unsigned __int8 *)a3 + 48)
    && self->_usesCachedBagsOnly == *((unsigned __int8 *)a3 + 72)
    && self->_useBinCompatBag == *((unsigned __int8 *)a3 + 49))
  {
    clientAuditTokenData = self->_clientAuditTokenData;
    if (clientAuditTokenData == *((NSData **)a3 + 4)
      || (int v7 = -[NSData isEqual:](clientAuditTokenData, "isEqual:")) != 0)
    {
      v8 = [(SSURLBagContext *)self userIdentifier];
      if (v8 == (NSNumber *)[a3 userIdentifier]
        || (int v7 = -[NSNumber isEqual:](-[SSURLBagContext userIdentifier](self, "userIdentifier"), "isEqual:", [a3 userIdentifier])) != 0)
      {
        httpHeaders = self->_httpHeaders;
        if (httpHeaders == *((NSMutableDictionary **)a3 + 5))
        {
          LOBYTE(v7) = 1;
        }
        else
        {
          LOBYTE(v7) = -[NSMutableDictionary isEqualToDictionary:](httpHeaders, "isEqualToDictionary:");
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_allowedRetryCount;
  *(unsigned char *)(v5 + 16) = self->_allowsBootstrapCellularData;
  *(unsigned char *)(v5 + 17) = self->_allowsExpiredBags;
  *(void *)(v5 + 24) = self->_bagType;
  *(void *)(v5 + 32) = [(NSData *)self->_clientAuditTokenData copyWithZone:a3];
  *(void *)(v5 + 40) = [(NSMutableDictionary *)self->_httpHeaders mutableCopyWithZone:a3];
  *(unsigned char *)(v5 + 48) = self->_ignoresCaches;
  *(void *)(v5 + 64) = [(NSNumber *)self->_userIdentifier copyWithZone:a3];
  *(unsigned char *)(v5 + 72) = self->_usesCachedBagsOnly;
  *(unsigned char *)(v5 + 49) = self->_useBinCompatBag;
  return (id)v5;
}

- (SSURLBagContext)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = [(SSURLBagContext *)self _init];
    if (!v5) {
      return v5;
    }
    v5->_allowedRetryCount = xpc_dictionary_get_int64(a3, "4");
    v5->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(a3, "7");
    v5->_allowsExpiredBags = xpc_dictionary_get_BOOL(a3, "5");
    v5->_int64_t bagType = xpc_dictionary_get_int64(a3, "0");
    objc_opt_class();
    v5->_clientAuditTokenData = (NSData *)SSXPCDictionaryCopyCFObjectWithClass(a3, "8");
    v5->_ignoresCaches = xpc_dictionary_get_BOOL(a3, "3");
    objc_opt_class();
    v5->_userIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
    v5->_usesCachedBagsOnly = xpc_dictionary_get_BOOL(a3, "6");
    v5->_useBinCompatBag = xpc_dictionary_get_BOOL(a3, "9");
    objc_opt_class();
    self = (SSURLBagContext *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    v5->_httpHeaders = (NSMutableDictionary *)[(SSURLBagContext *)self mutableCopy];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "4", self->_allowedRetryCount);
  xpc_dictionary_set_BOOL(v3, "7", self->_allowsBootstrapCellularData);
  xpc_dictionary_set_BOOL(v3, "5", self->_allowsExpiredBags);
  xpc_dictionary_set_int64(v3, "0", self->_bagType);
  SSXPCDictionarySetCFObject(v3, "8", (__CFString *)self->_clientAuditTokenData);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_httpHeaders);
  xpc_dictionary_set_BOOL(v3, "3", self->_ignoresCaches);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_userIdentifier);
  xpc_dictionary_set_BOOL(v3, "6", self->_usesCachedBagsOnly);
  return v3;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)SSURLBagContext;
  v2 = [(SSURLBagContext *)&v5 init];
  if (v2)
  {
    xpc_object_t v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->_lock = v3;
    [(NSLock *)v3 setName:@"com.apple.StoreServices.SSURLBagContext"];
  }
  return v2;
}

- (int64_t)allowedRetryCount
{
  return self->_allowedRetryCount;
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  self->_allowedRetryCount = a3;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (BOOL)allowsExpiredBags
{
  return self->_allowsExpiredBags;
}

- (void)setAllowsExpiredBags:(BOOL)a3
{
  self->_allowsExpiredBags = a3;
}

- (int64_t)bagType
{
  return self->_bagType;
}

- (void)setBagType:(int64_t)a3
{
  self->_int64_t bagType = a3;
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (BOOL)ignoresCaches
{
  return self->_ignoresCaches;
}

- (void)setIgnoresCaches:(BOOL)a3
{
  self->_ignoresCaches = a3;
}

- (BOOL)useBinCompatBag
{
  return self->_useBinCompatBag;
}

- (void)setUseBinCompatBag:(BOOL)a3
{
  self->_useBinCompatBag = a3;
}

- (BOOL)usesCachedBagsOnly
{
  return self->_usesCachedBagsOnly;
}

- (void)setUsesCachedBagsOnly:(BOOL)a3
{
  self->_usesCachedBagsOnly = a3;
}

@end