@interface MicroPaymentQueueRequest
- (BOOL)usesSoftwareMap;
- (MicroPaymentQueueRequest)init;
- (NSNumber)rangeEndIdentifier;
- (NSNumber)rangeStartIdentifier;
- (NSNumber)userIdentifier;
- (StoreKitClientIdentity)clientIdentity;
- (id)_copyApplicationIdentity:(id *)a3;
- (id)_ntsQueryParameters:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newStoreURLOperation:(id *)a3;
- (int64_t)URLBagType;
- (void)dealloc;
- (void)setClientIdentity:(id)a3;
- (void)setRangeEndIdentifier:(id)a3;
- (void)setRangeStartIdentifier:(id)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation MicroPaymentQueueRequest

- (MicroPaymentQueueRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)MicroPaymentQueueRequest;
  v2 = [(MicroPaymentQueueRequest *)&v4 init];
  if (v2) {
    v2->_lock = (NSLock *)objc_alloc_init((Class)NSLock);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MicroPaymentQueueRequest;
  [(MicroPaymentQueueRequest *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(NSLock *)self->_lock lock];
  v5[1] = [(StoreKitClientIdentity *)self->_clientIdentity copyWithZone:a3];
  v5[3] = [(NSNumber *)self->_rangeEndIdentifier copyWithZone:a3];
  v5[4] = [(NSNumber *)self->_rangeStartIdentifier copyWithZone:a3];
  v5[5] = [(NSNumber *)self->_userIdentifier copyWithZone:a3];
  [(NSLock *)self->_lock unlock];
  return v5;
}

- (StoreKitClientIdentity)clientIdentity
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_clientIdentity;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)newStoreURLOperation:(id *)a3
{
  v11 = 0;
  [(NSLock *)self->_lock lock];
  id v5 = [(MicroPaymentQueueRequest *)self _ntsQueryParameters:&v11];
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_alloc_init((Class)ISStoreURLOperation);
    id v8 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccountIdentifier:self->_userIdentifier];
    objc_msgSend(v8, "setAllowsBootstrapCellularData:", -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
    [v8 setTokenType:1];
    [v7 setAuthenticationContext:v8];

    id v9 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    objc_msgSend(v9, "setAllowsBootstrapCellularData:", -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
    [v9 setCachePolicy:1];
    [v9 setHTTPMethod:@"POST"];
    [v9 setRequestParameters:v6];
    [v9 setShouldDecodeResponse:0];
    if ([(StoreKitClientIdentity *)self->_clientIdentity isSandboxed]) {
      [v9 setURLBagType:1];
    }
    [v7 setRequestProperties:v9];
  }
  else
  {
    id v7 = 0;
  }
  [(NSLock *)self->_lock unlock];
  if (a3) {
    *a3 = v11;
  }
  return v7;
}

- (NSNumber)rangeEndIdentifier
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_rangeEndIdentifier;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (NSNumber)rangeStartIdentifier
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_rangeStartIdentifier;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (void)setClientIdentity:(id)a3
{
  [(NSLock *)self->_lock lock];
  clientIdentity = self->_clientIdentity;
  if (clientIdentity != a3)
  {

    self->_clientIdentity = (StoreKitClientIdentity *)a3;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setRangeEndIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  rangeEndIdentifier = self->_rangeEndIdentifier;
  if (rangeEndIdentifier != a3)
  {

    self->_rangeEndIdentifier = (NSNumber *)a3;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setRangeStartIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  rangeStartIdentifier = self->_rangeStartIdentifier;
  if (rangeStartIdentifier != a3)
  {

    self->_rangeStartIdentifier = (NSNumber *)a3;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setUserIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  userIdentifier = self->_userIdentifier;
  if (userIdentifier != a3)
  {

    self->_userIdentifier = (NSNumber *)a3;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (NSNumber)userIdentifier
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_userIdentifier;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)usesSoftwareMap
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = ![(StoreKitClientIdentity *)self->_clientIdentity usesIdentityAttributes];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (int64_t)URLBagType
{
  [(NSLock *)self->_lock lock];
  int64_t v3 = [(StoreKitClientIdentity *)self->_clientIdentity isSandboxed];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)description
{
  [(NSLock *)self->_lock lock];
  v5.receiver = self;
  v5.super_class = (Class)MicroPaymentQueueRequest;
  int64_t v3 = +[NSString stringWithFormat:@"%@: (%@, user: %@, range: [%@,%@])", [(MicroPaymentQueueRequest *)&v5 description], [(StoreKitClientIdentity *)self->_clientIdentity bundleIdentifier], self->_userIdentifier, self->_rangeStartIdentifier, self->_rangeEndIdentifier];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)_copyApplicationIdentity:(id *)a3
{
  id v4 = [(StoreKitClientIdentity *)self->_clientIdentity copy];
  id v5 = [v4 bundleIdentifier];
  id v6 = +[LSApplicationProxy applicationProxyForIdentifier:v5];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 itemID];
  }
  else
  {
    id v7 = +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:v5];
    id v8 = [v7 itemID];
    if (!v7) {
      goto LABEL_8;
    }
  }
  if ([v8 integerValue] || objc_msgSend(objc_msgSend(v7, "bundleIdentifier"), "length"))
  {
    [v4 setValuesWithSoftwareApplicationProxy:v7];
    id v9 = 0;
    if (!a3) {
      return v4;
    }
    goto LABEL_19;
  }
LABEL_8:
  id v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v12 &= 2u;
  }
  if (v12)
  {
    int v17 = 138412546;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2112;
    id v20 = v5;
    LODWORD(v16) = 22;
    uint64_t v13 = _os_log_send_and_compose_impl();
    if (v13)
    {
      v14 = (void *)v13;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v17, v16);
      free(v14);
      SSFileLog();
    }
  }
  sub_100174DB0();
  id v9 = (void *)ISErrorWithDomain();

  id v4 = 0;
  if (a3)
  {
LABEL_19:
    if (!v4) {
      *a3 = v9;
    }
  }
  return v4;
}

- (id)_ntsQueryParameters:(id *)a3
{
  id v5 = self->_clientIdentity;
  if (![(StoreKitClientIdentity *)v5 usesIdentityAttributes])
  {

    id v5 = [(MicroPaymentQueueRequest *)self _copyApplicationIdentity:a3];
  }
  if (v5)
  {
    id v6 = +[NSMutableDictionary dictionary];
    id v7 = [(StoreKitClientIdentity *)v5 bundleIdentifier];
    if (v7)
    {
      id v8 = [(NSString *)v7 copyUTF8StringOfLength:256];
      if (v8)
      {
        id v9 = v8;
        [v6 setObject:v8 forKey:@"bid"];
      }
    }
    id v10 = [(StoreKitClientIdentity *)v5 bundleVersion];
    if (v10)
    {
      id v11 = [(NSString *)v10 copyUTF8StringOfLength:100];
      if (v11)
      {
        int v12 = v11;
        [v6 setObject:v11 forKey:@"bvrs"];
      }
    }
    uint64_t v13 = [(StoreKitClientIdentity *)v5 storeIdentifier];
    if (v13) {
      objc_msgSend(v6, "setObject:forKey:", -[NSNumber stringValue](v13, "stringValue"), @"appAdamId");
    }
    v14 = [(StoreKitClientIdentity *)v5 storeVersion];
    if (v14) {
      objc_msgSend(v6, "setObject:forKey:", -[NSNumber stringValue](v14, "stringValue"), @"appExtVrsId");
    }
    v15 = [(StoreKitClientIdentity *)v5 vendorIdentifier];
    if (v15) {
      [v6 setObject:v15 forKey:@"vid"];
    }
    id v16 = [+[ISDevice sharedInstance] guid];
    if (v16) {
      [v6 setObject:v16 forKey:@"guid"];
    }
    id v17 = [+[ISDevice sharedInstance] serialNumber];
    if (v17) {
      [v6 setObject:v17 forKey:@"serialNumber"];
    }
    rangeStartIdentifier = self->_rangeStartIdentifier;
    if (rangeStartIdentifier) {
      __int16 v19 = [(NSNumber *)rangeStartIdentifier unsignedLongLongValue];
    }
    else {
      __int16 v19 = 0;
    }
    rangeEndIdentifier = self->_rangeEndIdentifier;
    if (rangeEndIdentifier)
    {
      v21 = (char *)[(NSNumber *)rangeEndIdentifier itemIdentifierValue];
      if (v19 - 1 < v21)
      {
        v22 = v21;
        v23 = +[NSString stringWithFormat:@"%llu", v19];
        [v6 setObject:v23 forKey:kISLoadMoreStartIDParameter];
        v24 = +[NSString stringWithFormat:@"%llu", v22];
        [v6 setObject:v24 forKey:kISLoadMoreEndIDParameter];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end