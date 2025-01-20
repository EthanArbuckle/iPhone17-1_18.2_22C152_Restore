@interface MZKeyValueStoreTransaction
- (MZKeyValueStoreTransaction)initWithType:(int)a3 domain:(id)a4 URL:(id)a5 keys:(id)a6;
- (MZKeyValueStoreTransactionProcessing)processor;
- (NSArray)keys;
- (NSMutableDictionary)userInfo;
- (NSString)action;
- (NSString)domain;
- (NSString)sinceDomainVersion;
- (NSURL)URL;
- (id)assertionName;
- (id)description;
- (id)userInfoValueForKey:(id)a3;
- (int)type;
- (void)setDomain:(id)a3;
- (void)setProcessor:(id)a3;
- (void)setSinceDomainVersion:(id)a3;
- (void)setType:(int)a3;
- (void)setURL:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoValue:(id)a3 forKey:(id)a4;
@end

@implementation MZKeyValueStoreTransaction

- (MZKeyValueStoreTransaction)initWithType:(int)a3 domain:(id)a4 URL:(id)a5 keys:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MZKeyValueStoreTransaction;
  v13 = [(MZKeyValueStoreTransaction *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v15 = (NSString *)[v10 copy];
    domain = v14->_domain;
    v14->_domain = v15;

    sinceDomainVersion = v14->_sinceDomainVersion;
    v14->_sinceDomainVersion = 0;

    objc_storeStrong((id *)&v14->_URL, a5);
    objc_storeStrong((id *)&v14->_keys, a6);
  }

  return v14;
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(MZKeyValueStoreTransaction *)v7 userInfo];

  if (!v8)
  {
    v9 = +[NSMutableDictionary dictionary];
    [(MZKeyValueStoreTransaction *)v7 setUserInfo:v9];
  }
  id v10 = [(MZKeyValueStoreTransaction *)v7 userInfo];
  [v10 setValue:v11 forKey:v6];

  objc_sync_exit(v7);
}

- (id)userInfoValueForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MZKeyValueStoreTransaction *)v5 userInfo];
  v7 = [v6 objectForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (id)description
{
  unsigned int v3 = [(MZKeyValueStoreTransaction *)self type];
  switch(v3)
  {
    case 3u:
      id v6 = &stru_10056A8A0;
      CFStringRef v7 = @"REMOVE";
      break;
    case 2u:
      id v6 = &stru_10056A8A0;
      CFStringRef v7 = @"SET";
      break;
    case 1u:
      id v4 = [(MZKeyValueStoreTransaction *)self keys];
      id v5 = [v4 count];

      if (v5)
      {
        id v6 = &stru_10056A8A0;
        CFStringRef v7 = @"GET";
      }
      else
      {
        v8 = [(MZKeyValueStoreTransaction *)self sinceDomainVersion];
        +[NSString stringWithFormat:@" since-domain-version=%@", v8];
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        CFStringRef v7 = @"GET-ALL";
      }
      break;
    default:
      id v6 = &stru_10056A8A0;
      CFStringRef v7 = @"Unknown";
      break;
  }
  v9 = [(MZKeyValueStoreTransaction *)self URL];
  id v10 = [v9 absoluteString];
  if ([v10 length])
  {
    id v11 = [(MZKeyValueStoreTransaction *)self URL];
    id v12 = [v11 absoluteString];
    unsigned __int8 v13 = [v12 isEqualToString:@"(null)"];

    if (v13)
    {
      v14 = &stru_10056A8A0;
      goto LABEL_16;
    }
    v9 = [(MZKeyValueStoreTransaction *)self URL];
    +[NSString stringWithFormat:@" url=%@", v9];
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v14 = &stru_10056A8A0;
  }

LABEL_16:
  v15 = [(MZKeyValueStoreTransaction *)self keys];
  v16 = [v15 componentsJoinedByString:@","];
  v17 = +[NSString stringWithFormat:@" keys=%@", v16];

  v18 = (objc_class *)objc_opt_class();
  objc_super v19 = NSStringFromClass(v18);
  v20 = +[NSString stringWithFormat:@"<%@:%p type:%@%@%@%@>", v19, self, v7, v14, v17, v6];

  return v20;
}

- (id)assertionName
{
  unsigned int v3 = [(MZKeyValueStoreTransaction *)self type];
  if (v3 == 3)
  {
    CFStringRef v6 = @"REMOVE";
    goto LABEL_9;
  }
  if (v3 == 2)
  {
    CFStringRef v6 = @"SET";
    goto LABEL_9;
  }
  if (v3 != 1)
  {
    CFStringRef v6 = @"Unknown";
    goto LABEL_9;
  }
  id v4 = [(MZKeyValueStoreTransaction *)self keys];
  id v5 = [v4 count];

  if (v5)
  {
    CFStringRef v6 = @"GET";
LABEL_9:
    CFStringRef v7 = &stru_10056A8A0;
    goto LABEL_10;
  }
  id v12 = [(MZKeyValueStoreTransaction *)self sinceDomainVersion];
  +[NSString stringWithFormat:@" since-domain-version=%@", v12];
  CFStringRef v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFStringRef v6 = @"GET-ALL";
LABEL_10:
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v10 = +[NSString stringWithFormat:@"<%@ type:%@>", v9, v6];

  return v10;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDomain:(id)a3
{
}

- (NSString)sinceDomainVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSinceDomainVersion:(id)a3
{
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURL:(id)a3
{
}

- (MZKeyValueStoreTransactionProcessing)processor
{
  return (MZKeyValueStoreTransactionProcessing *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessor:(id)a3
{
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_sinceDomainVersion, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (NSString)action
{
  unsigned int v3 = [(MZKeyValueStoreTransaction *)self processor];
  id v4 = [v3 dataForSetTransaction:self key:kPodcastsPushNotificationActionKey version:0];

  id v12 = 0;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v12];
  id v6 = v12;
  CFStringRef v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    v9 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Processor returned data for action that isn't a valid archive. Error: %@", buf, 0xCu);
    }
  }

  return (NSString *)v5;
}

@end