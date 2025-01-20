@interface MSDContentServerURLRetryPolicy
- (BOOL)cachingHubAvailable;
- (BOOL)localHubReachable;
- (MSDContentServerURLRetryPolicy)initWithContext:(id)a3;
- (MSDFileDownloadCredentials)fdc;
- (NSArray)localURLList;
- (NSArray)remoteURLList;
- (NSDictionary)localCredential;
- (NSDictionary)remoteCredential;
- (NSString)serverType;
- (id)buildLocalURLListFromContext:(id)a3;
- (id)getCredential;
- (id)getURLSchemaList:(id)a3;
- (id)nextTry;
- (unint64_t)currentTry;
- (void)setCachingHubAvailable:(BOOL)a3;
- (void)setCurrentTry:(unint64_t)a3;
- (void)setFdc:(id)a3;
- (void)setLocalCredential:(id)a3;
- (void)setLocalHubReachable:(BOOL)a3;
- (void)setLocalURLList:(id)a3;
- (void)setRemoteCredential:(id)a3;
- (void)setRemoteURLList:(id)a3;
- (void)setServerType:(id)a3;
@end

@implementation MSDContentServerURLRetryPolicy

- (MSDContentServerURLRetryPolicy)initWithContext:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MSDContentServerURLRetryPolicy;
  v5 = [(MSDContentServerURLRetryPolicy *)&v20 init];
  if (v5)
  {
    v6 = [v4 fdc];
    [(MSDContentServerURLRetryPolicy *)v5 setFdc:v6];

    v7 = [v4 fdc];
    v8 = [v4 originServer];
    v9 = [v7 localCredentialForOriginServer:v8];
    [(MSDContentServerURLRetryPolicy *)v5 setLocalCredential:v9];

    v10 = [v4 fdc];
    v11 = [v4 originServer];
    v12 = [v10 remoteCredentialForOriginServer:v11];
    [(MSDContentServerURLRetryPolicy *)v5 setRemoteCredential:v12];

    v13 = [(MSDContentServerURLRetryPolicy *)v5 localCredential];
    [(MSDContentServerURLRetryPolicy *)v5 setCachingHubAvailable:v13 != 0];

    [(MSDContentServerURLRetryPolicy *)v5 setServerType:@"remoteCDN"];
    if ([v4 tryCachingHub]
      && [(MSDContentServerURLRetryPolicy *)v5 cachingHubAvailable])
    {
      v14 = [(MSDContentServerURLRetryPolicy *)v5 buildLocalURLListFromContext:v4];
      [(MSDContentServerURLRetryPolicy *)v5 setLocalURLList:v14];

      [(MSDContentServerURLRetryPolicy *)v5 setServerType:@"localCachingHub"];
    }
    v15 = [(MSDContentServerURLRetryPolicy *)v5 remoteCredential];

    if (v15)
    {
      v16 = [(MSDContentServerURLRetryPolicy *)v5 remoteCredential];
      v17 = [(MSDContentServerURLRetryPolicy *)v5 getURLSchemaList:v16];
      [(MSDContentServerURLRetryPolicy *)v5 setRemoteURLList:v17];
    }
    [(MSDContentServerURLRetryPolicy *)v5 setCurrentTry:0];
    -[MSDContentServerURLRetryPolicy setLocalHubReachable:](v5, "setLocalHubReachable:", [v4 tryCachingHub]);
    v18 = v5;
  }

  return v5;
}

- (id)nextTry
{
  v3 = [(MSDContentServerURLRetryPolicy *)self serverType];
  unsigned int v4 = [v3 isEqualToString:@"localCachingHub"];

  if (v4)
  {
    unint64_t v5 = [(MSDContentServerURLRetryPolicy *)self currentTry];
    v6 = [(MSDContentServerURLRetryPolicy *)self localURLList];
    id v7 = [v6 count];

    if (v5 < (unint64_t)v7)
    {
      v8 = [(MSDContentServerURLRetryPolicy *)self localURLList];
      v9 = [v8 objectAtIndex:-[MSDContentServerURLRetryPolicy currentTry](self, "currentTry")];

      goto LABEL_8;
    }
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D2C44((uint64_t)self, v10);
    }

    [(MSDContentServerURLRetryPolicy *)self setLocalHubReachable:0];
    [(MSDContentServerURLRetryPolicy *)self setServerType:@"remoteCDN"];
    [(MSDContentServerURLRetryPolicy *)self setCurrentTry:0];
  }
  v9 = 0;
LABEL_8:
  v11 = [(MSDContentServerURLRetryPolicy *)self serverType];
  unsigned int v12 = [v11 isEqualToString:@"remoteCDN"];

  if (v12)
  {
    if ([(MSDContentServerURLRetryPolicy *)self currentTry]
      || ([(MSDContentServerURLRetryPolicy *)self remoteURLList],
          v14 = objc_claimAutoreleasedReturnValue(),
          id v15 = [v14 count],
          v14,
          !v15))
    {
      v13 = sub_100068600();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000D2BCC((uint64_t)self, v13);
      }
    }
    else
    {
      v13 = [(MSDContentServerURLRetryPolicy *)self remoteURLList];
      uint64_t v16 = [v13 objectAtIndex:0];

      v9 = (void *)v16;
    }
  }
  if (v9)
  {
    v17 = objc_alloc_init(MSDServerRetryInfo);
    [(MSDServerRetryInfo *)v17 setUrlSchema:v9];
    v18 = [(MSDContentServerURLRetryPolicy *)self serverType];
    [(MSDServerRetryInfo *)v17 setServerType:v18];

    [(MSDServerRetryInfo *)v17 setLocalHubReachable:[(MSDContentServerURLRetryPolicy *)self localHubReachable]];
    v19 = [(MSDContentServerURLRetryPolicy *)self getCredential];
    [(MSDServerRetryInfo *)v17 setCredential:v19];
  }
  else
  {
    v17 = 0;
  }
  [(MSDContentServerURLRetryPolicy *)self setCurrentTry:(char *)[(MSDContentServerURLRetryPolicy *)self currentTry] + 1];

  return v17;
}

- (id)getCredential
{
  v3 = [(MSDContentServerURLRetryPolicy *)self serverType];
  if ([v3 isEqualToString:@"localCachingHub"]) {
    [(MSDContentServerURLRetryPolicy *)self localCredential];
  }
  else {
  unsigned int v4 = [(MSDContentServerURLRetryPolicy *)self remoteCredential];
  }

  return v4;
}

- (id)buildLocalURLListFromContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MSDContentServerURLRetryPolicy *)self localCredential];
  v6 = [(MSDContentServerURLRetryPolicy *)self getURLSchemaList:v5];

  id v7 = [v4 cachedLocalURL];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    v9 = [v4 cachedLocalURL];
    [v6 removeObject:v9];

    v10 = [v4 cachedLocalURL];
    [v6 insertObject:v10 atIndex:0];
  }

  return v6;
}

- (id)getURLSchemaList:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [v4 objectForKey:@"URLSchema"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 addObjectsFromArray:v6];
LABEL_6:
      id v7 = v5;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 addObject:v6];
      goto LABEL_6;
    }
    unsigned int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543874;
      unsigned int v12 = self;
      __int16 v13 = 2114;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v10 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Unrecognized URL Scheme type :%{public}@ from download credential %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    unsigned int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D2CBC((uint64_t)self, (uint64_t)v4, v8);
    }
  }

  id v7 = 0;
LABEL_10:

  return v7;
}

- (BOOL)localHubReachable
{
  return self->_localHubReachable;
}

- (void)setLocalHubReachable:(BOOL)a3
{
  self->_localHubReachable = a3;
}

- (MSDFileDownloadCredentials)fdc
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFdc:(id)a3
{
}

- (NSArray)localURLList
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalURLList:(id)a3
{
}

- (NSArray)remoteURLList
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRemoteURLList:(id)a3
{
}

- (unint64_t)currentTry
{
  return self->_currentTry;
}

- (void)setCurrentTry:(unint64_t)a3
{
  self->_currentTry = a3;
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServerType:(id)a3
{
}

- (BOOL)cachingHubAvailable
{
  return self->_cachingHubAvailable;
}

- (void)setCachingHubAvailable:(BOOL)a3
{
  self->_cachingHubAvailable = a3;
}

- (NSDictionary)localCredential
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalCredential:(id)a3
{
}

- (NSDictionary)remoteCredential
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteCredential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_localCredential, 0);
  objc_storeStrong((id *)&self->_serverType, 0);
  objc_storeStrong((id *)&self->_remoteURLList, 0);
  objc_storeStrong((id *)&self->_localURLList, 0);

  objc_storeStrong((id *)&self->_fdc, 0);
}

@end