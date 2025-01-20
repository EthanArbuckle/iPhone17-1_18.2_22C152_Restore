@interface WebSecurityOrigin
+ (id)webSecurityOriginFromDatabaseIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (WebSecurityOrigin)initWithURL:(id)a3;
- (id)_initWithString:(id)a3;
- (id)_initWithWebCoreSecurityOrigin:(void *)a3;
- (id)databaseIdentifier;
- (id)databaseQuotaManager;
- (id)host;
- (id)protocol;
- (id)stringValue;
- (id)toString;
- (unint64_t)quota;
- (unint64_t)usage;
- (unsigned)port;
- (void)_core;
- (void)dealloc;
- (void)setQuota:(unint64_t)a3;
@end

@implementation WebSecurityOrigin

+ (id)webSecurityOriginFromDatabaseIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  WTF::initializeMainThread((WTF *)a1);
  MEMORY[0x1E4E442D0](&v15, a3);
  WebCore::SecurityOriginData::fromDatabaseIdentifier();
  v6 = v15;
  v15 = 0;
  if (!v6)
  {
LABEL_4:
    if (v19) {
      goto LABEL_5;
    }
    return 0;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v6, v5);
  if (!v19) {
    return 0;
  }
LABEL_5:
  v7 = [WebSecurityOrigin alloc];
  unsigned int add = v19;
  if (v19)
  {
    v10 = v7;
    WebCore::SecurityOriginData::securityOrigin((uint64_t *)&v15, (WebCore::SecurityOriginData *)v17);
    a3 = (id)CFMakeCollectable([(WebSecurityOrigin *)v10 _initWithWebCoreSecurityOrigin:v15]);
    v3 = v15;
    v15 = 0;
    if (!v3 || (unsigned int add = atomic_fetch_add((atomic_uint *volatile)v3, 0xFFFFFFFF), add != 1))
    {
      if (!v19) {
        return a3;
      }
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  atomic_store(add, (unsigned int *)v3);
  v12 = (WTF::StringImpl *)*((void *)v3 + 6);
  *((void *)v3 + 6) = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v8);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  v13 = (WTF::StringImpl *)*((void *)v3 + 5);
  *((void *)v3 + 5) = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v8);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = *((unsigned int *)v3 + 8);
  if (v14 != -1) {
    ((void (*)(char *, char *))off_1F3C7D7A8[v14])(&v16, (char *)v3 + 8);
  }
  *((_DWORD *)v3 + 8) = -1;
  WTF::fastFree(v3, v8);
  if (v19)
  {
LABEL_9:
    if (v18 != -1) {
      ((void (*)(WTF::StringImpl **, unsigned char *))off_1F3C7D7A8[v18])(&v15, v17);
    }
  }
  return a3;
}

- (WebSecurityOrigin)initWithURL:(id)a3
{
  WTF::initializeMainThread((WTF *)self);
  v12.receiver = self;
  v12.super_class = (Class)WebSecurityOrigin;
  v5 = [(WebSecurityOrigin *)&v12 init];
  if (!v5) {
    return v5;
  }
  MEMORY[0x1E4E441F0](v10, [a3 absoluteURL]);
  WebCore::SecurityOrigin::create((uint64_t *)&v11, (WebCore::SecurityOrigin *)v10, v6);
  v5->_private = v11;
  v11 = 0;
  v8 = v10[0];
  v10[0] = 0;
  if (!v8) {
    return v5;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    return v5;
  }
  WTF::StringImpl::destroy(v8, v7);
  return v5;
}

- (id)protocol
{
  v2 = self->_private;
  int v3 = *((_DWORD *)v2 + 8);
  if (!v3)
  {
    if (*((void *)v2 + 1)) {
      goto LABEL_4;
    }
    return &stru_1F3C7DA90;
  }
  if (v3 != 1)
  {
    v5 = (WebSecurityOrigin *)std::__throw_bad_variant_access[abi:sn180100]();
    return [(WebSecurityOrigin *)v5 host];
  }
  if (!*MEMORY[0x1E4F30980]) {
    return &stru_1F3C7DA90;
  }
LABEL_4:
  return (id)WTF::StringImpl::operator NSString *();
}

- (id)host
{
  v2 = self->_private;
  int v3 = *((_DWORD *)v2 + 8);
  if (v3 == 1)
  {
    if (*MEMORY[0x1E4F30980]) {
      goto LABEL_4;
    }
    return &stru_1F3C7DA90;
  }
  if (v3)
  {
    v5 = (WebSecurityOrigin *)std::__throw_bad_variant_access[abi:sn180100]();
    return [(WebSecurityOrigin *)v5 databaseIdentifier];
  }
  if (!*((void *)v2 + 2)) {
    return &stru_1F3C7DA90;
  }
LABEL_4:
  return (id)WTF::StringImpl::operator NSString *();
}

- (id)databaseIdentifier
{
  WebCore::SecurityOriginData::databaseIdentifier((uint64_t *)&v6, (WebCore::SecurityOriginData *)((char *)self->_private + 8));
  if (!v6) {
    return &stru_1F3C7DA90;
  }
  int v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  SEL v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)toString
{
  WebCore::SecurityOrigin::toString((uint64_t *)&v6, (WebCore::SecurityOrigin *)self->_private);
  if (!v6) {
    return &stru_1F3C7DA90;
  }
  int v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  SEL v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)stringValue
{
  WebCore::SecurityOrigin::toString((uint64_t *)&v6, (WebCore::SecurityOrigin *)self->_private);
  if (!v6) {
    return &stru_1F3C7DA90;
  }
  int v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  SEL v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (unsigned)port
{
  v2 = self->_private;
  int v3 = *((_DWORD *)v2 + 8);
  if (v3)
  {
    if (v3 == 1) {
      return 0;
    }
    std::__throw_bad_variant_access[abi:sn180100]();
  }
  int v4 = *((_DWORD *)v2 + 6);
  if ((v4 & 0xFF0000) != 0) {
    return v4;
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    SEL v6 = [(WebSecurityOrigin *)self _core];
    uint64_t v7 = [a3 _core];
    LOBYTE(v5) = MEMORY[0x1F4174C08](v6, v7);
  }
  return v5;
}

- (void)dealloc
{
  int v3 = self->_private;
  if (v3 && atomic_fetch_add((atomic_uint *volatile)v3, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)v3);
    int v5 = (WTF::StringImpl *)*((void *)v3 + 6);
    *((void *)v3 + 6) = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, (StringImpl *)a2);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
    SEL v6 = (WTF::StringImpl *)*((void *)v3 + 5);
    *((void *)v3 + 5) = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, (StringImpl *)a2);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    uint64_t v7 = *((unsigned int *)v3 + 8);
    if (v7 != -1) {
      ((void (*)(char *, char *))off_1F3C7D7A8[v7])(&v9, (char *)v3 + 8);
    }
    *((_DWORD *)v3 + 8) = -1;
    WTF::fastFree((WTF *)v3, (void *)a2);
    databaseQuotaManager = self->_databaseQuotaManager;
    if (databaseQuotaManager) {
      goto LABEL_4;
    }
  }
  else
  {
    databaseQuotaManager = self->_databaseQuotaManager;
    if (databaseQuotaManager) {
LABEL_4:
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)WebSecurityOrigin;
  [(WebSecurityOrigin *)&v8 dealloc];
}

- (id)_initWithWebCoreSecurityOrigin:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WebSecurityOrigin;
  id result = [(WebSecurityOrigin *)&v5 init];
  if (result)
  {
    atomic_fetch_add((atomic_uint *volatile)a3, 1u);
    *((void *)result + 1) = a3;
  }
  return result;
}

- (id)_initWithString:(id)a3
{
  MEMORY[0x1E4E442D0](&v14, a3);
  WebCore::SecurityOrigin::createFromString((uint64_t *)&v15, (WebCore::SecurityOrigin *)&v14, v3);
  objc_super v5 = v14;
  uint64_t v14 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  SEL v6 = [WebSecurityOrigin alloc];
  id result = (id)CFMakeCollectable(-[WebSecurityOrigin _initWithWebCoreSecurityOrigin:](v6, "_initWithWebCoreSecurityOrigin:", v15, v14));
  id v9 = result;
  v10 = v15;
  v15 = 0;
  if (v10 && atomic_fetch_add((atomic_uint *volatile)v10, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)v10);
    v11 = (WTF::StringImpl *)*((void *)v10 + 6);
    *((void *)v10 + 6) = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v8);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    objc_super v12 = (WTF::StringImpl *)*((void *)v10 + 5);
    *((void *)v10 + 5) = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v8);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    uint64_t v13 = *((unsigned int *)v10 + 8);
    if (v13 != -1) {
      ((void (*)(WTF::StringImpl **, char *))off_1F3C7D7A8[v13])(&v14, (char *)v10 + 8);
    }
    *((_DWORD *)v10 + 8) = -1;
    WTF::fastFree(v10, v8);
    return v9;
  }
  return result;
}

- (void)_core
{
  return self->_private;
}

- (id)databaseQuotaManager
{
  id result = self->_databaseQuotaManager;
  if (!result)
  {
    id result = [[WebDatabaseQuotaManager alloc] initWithOrigin:self];
    self->_databaseQuotaManager = (WebQuotaManager *)result;
  }
  return result;
}

- (unint64_t)usage
{
  uint64_t v3 = WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  int v4 = (char *)self->_private + 8;
  return MEMORY[0x1F416E090](v3, v4);
}

- (unint64_t)quota
{
  uint64_t v3 = WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  int v4 = (char *)self->_private + 8;
  return MEMORY[0x1F416E088](v3, v4);
}

- (void)setQuota:(unint64_t)a3
{
  uint64_t v5 = WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  SEL v6 = (char *)self->_private + 8;
  MEMORY[0x1F416E0A0](v5, v6, a3);
}

@end