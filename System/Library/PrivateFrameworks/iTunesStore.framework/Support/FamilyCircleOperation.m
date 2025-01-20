@interface FamilyCircleOperation
- (BOOL)fetchITunesAccountNames;
- (NSData)clientAuditTokenData;
- (NSString)userAgent;
- (SSFamilyCircle)familyCircle;
- (id)_cachePath;
- (id)_cachedFamilyCircleWithAccountIdentifier:(id)a3;
- (id)_familyCircleForDictionary:(id)a3;
- (int64_t)authenticationPromptStyle;
- (void)_writeCacheWithFamilyCircle:(id)a3 accountIdentifier:(id)a4;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationPromptStyle:(int64_t)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setFetchITunesAccountNames:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation FamilyCircleOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FamilyCircleOperation;
  [(FamilyCircleOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v31 = 0;
  id v3 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  if (!v3)
  {
    id v14 = 0;
    goto LABEL_34;
  }
  v4 = v3;
  v5 = +[SSURLBagContext contextWithBagType:0];
  uint64_t v6 = SSHTTPHeaderUserAgent;
  [(SSURLBagContext *)v5 setValue:self->_userAgent forHTTPHeaderField:SSHTTPHeaderUserAgent];
  id v7 = [(FamilyCircleOperation *)self loadedURLBagWithContext:v5 returningError:&v31];
  if (!v7)
  {
    id v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v18 = objc_opt_class();
      int v32 = 138412290;
      uint64_t v33 = v18;
      LODWORD(v30) = 12;
      v29 = &v32;
      uint64_t v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        v20 = (void *)v19;
        v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v32, v30);
        free(v20);
        v29 = (int *)v21;
        SSFileLog();
      }
    }
    goto LABEL_22;
  }
  v8 = +[NSURL URLWithString:](NSURL, "URLWithString:", [v7 valueForKey:@"family-info"]);
  v9 = v8;
  if (self->_fetchITunesAccountNames) {
    v9 = (NSURL *)[(NSURL *)v8 URLByAppendingQueryParameter:@"fetchAccountNames" value:@"true"];
  }
  if (!v9) {
    goto LABEL_22;
  }
  id v10 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  objc_msgSend(v10, "setClientAuditTokenData:", -[FamilyCircleOperation clientAuditTokenData](self, "clientAuditTokenData"));
  [v10 setURL:v9];
  [v10 setCachePolicy:1];
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", -[FamilyCircleOperation userAgent](self, "userAgent"), v6);
  id v11 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v4];
  objc_msgSend(v11, "setPromptStyle:", -[FamilyCircleOperation authenticationPromptStyle](self, "authenticationPromptStyle"));
  id v12 = objc_alloc_init((Class)ISStoreURLOperation);
  [v12 setAuthenticationContext:v11];
  [v12 setRequestProperties:v10];
  objc_msgSend(v12, "setDataProvider:", +[ISProtocolDataProvider provider](ISProtocolDataProvider, "provider"));
  if (![(FamilyCircleOperation *)self runSubOperation:v12 returningError:&v31])goto LABEL_20; {
  id v13 = objc_msgSend(objc_msgSend(v12, "dataProvider"), "output");
  }
  if (v13)
  {
    id v14 = [(FamilyCircleOperation *)self _familyCircleForDictionary:v13];
    -[FamilyCircleOperation _writeCacheWithFamilyCircle:accountIdentifier:](self, "_writeCacheWithFamilyCircle:accountIdentifier:", v14, [v4 uniqueIdentifier]);
  }
  else
  {
LABEL_20:
    id v14 = 0;
  }

  if (!v14)
  {
LABEL_22:
    id v14 = -[FamilyCircleOperation _cachedFamilyCircleWithAccountIdentifier:](self, "_cachedFamilyCircleWithAccountIdentifier:", objc_msgSend(v4, "uniqueIdentifier", v29));
    if (v14)
    {
      id v22 = +[SSLogConfig sharedDaemonConfig];
      if (!v22) {
        id v22 = +[SSLogConfig sharedConfig];
      }
      unsigned int v23 = [v22 shouldLog];
      if ([v22 shouldLogToDisk]) {
        int v24 = v23 | 2;
      }
      else {
        int v24 = v23;
      }
      if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v24 &= 2u;
      }
      if (v24)
      {
        uint64_t v25 = objc_opt_class();
        int v32 = 138412546;
        uint64_t v33 = v25;
        __int16 v34 = 2112;
        uint64_t v35 = v31;
        LODWORD(v30) = 22;
        v29 = &v32;
        uint64_t v26 = _os_log_send_and_compose_impl();
        if (v26)
        {
          v27 = (void *)v26;
          v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v32, v30);
          free(v27);
          v29 = (int *)v28;
          SSFileLog();
        }
      }
      uint64_t v31 = 0;
    }
  }
LABEL_34:
  -[FamilyCircleOperation setError:](self, "setError:", v31, v29);
  [(FamilyCircleOperation *)self setSuccess:v14 != 0];
  self->_familyCircle = (SSFamilyCircle *)v14;
}

- (id)_cachedFamilyCircleWithAccountIdentifier:(id)a3
{
  id v4 = [(FamilyCircleOperation *)self _cachePath];
  if (v4 && (id v5 = [objc_alloc((Class)NSData) initWithContentsOfFile:v4]) != 0)
  {
    uint64_t v6 = v5;
    id v7 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:0];
    objc_opt_class();
    id v8 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v7 objectForKey:@"account"];
      id v10 = [v7 objectForKey:@"circle"];
      id v11 = [v7 objectForKey:@"timestamp"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [+[NSDate date] timeIntervalSinceDate:v11];
        double v13 = v12;
        unsigned int v14 = [v9 isEqualToNumber:a3];
        id v8 = 0;
        if (v14 && v13 > 2.22044605e-16 && v13 < 604800.0) {
          id v8 = [objc_alloc((Class)SSFamilyCircle) initWithCacheRepresentation:v10];
        }
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_cachePath
{
  id v2 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), @"com.apple.itunesstored", @"JFamilyCircle.plist", 0);
  id v3 = +[NSString pathWithComponents:v2];

  return v3;
}

- (id)_familyCircleForDictionary:(id)a3
{
  id v36 = +[NSMutableArray array];
  id v33 = a3;
  id v4 = [a3 objectForKey:@"family"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKey:@"members"];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v44;
      uint64_t v34 = *(void *)v44;
      id v35 = v5;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v10 objectForKey:@"ITunesPreferredDsid"];
            if (objc_opt_respondsToSelector())
            {
              id v12 = [v10 objectForKey:@"ICloudDsid"];
              if (objc_opt_respondsToSelector()) {
                double v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 longLongValue]);
              }
              else {
                double v13 = 0;
              }
              id v14 = [v10 objectForKey:@"firstName"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                id v14 = 0;
              }
              id v15 = [v10 objectForKey:@"lastName"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                id v15 = 0;
              }
              id v16 = [v10 objectForKey:@"accountName"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                id v16 = 0;
              }
              id v17 = [v10 objectForKey:@"sharingPurchases"];
              id v18 = objc_alloc_init((Class)SSFamilyMember);
              objc_msgSend(v18, "setITunesIdentifier:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v11, "longLongValue")));
              [v18 setFirstName:v14];
              [v18 setLastName:v15];
              [v18 setICloudAccountName:v16];
              [v18 setICloudIdentifier:v13];
              objc_msgSend(v18, "setSharingPurchases:", objc_msgSend(v17, "BOOLValue"));
              [v36 addObject:v18];

              uint64_t v8 = v34;
              id v5 = v35;
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v7);
    }
  }
  id v19 = +[NSMutableArray array];
  id v20 = [v33 objectForKey:@"iTunesAccountNames"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v42 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    id v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v19 addObject:v25];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v22);
    }
  }
  if (![v36 count]) {
    return 0;
  }
  id v26 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
  ISWeakLinkerLoadLibrary();
  id v27 = objc_alloc_init((Class)ACAccountStore);
  id v28 = objc_msgSend(objc_msgSend(v27, "aa_primaryAppleAccount"), "aa_personID");

  id v29 = 0;
  if (v26 && v28)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100016A04;
    v38[3] = &unk_1003A3460;
    v38[4] = v28;
    v38[5] = v26;
    id v29 = objc_msgSend(objc_msgSend(v36, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v38)), "firstObject");
  }
  if (v26 && !v29)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100016A68;
    v37[3] = &unk_1003A3488;
    v37[4] = v26;
    id v30 = objc_msgSend(v36, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v37));
    if ([v30 count] == (id)1) {
      id v29 = [v30 firstObject];
    }
    else {
      id v29 = 0;
    }
  }
  [v29 setMe:1];
  [v36 sortUsingComparator:&stru_1003A34C8];
  id v31 = objc_alloc_init((Class)SSFamilyCircle);
  [v31 setITunesAccountNames:v19];
  [v31 setFamilyMembers:v36];
  return v31;
}

- (void)_writeCacheWithFamilyCircle:(id)a3 accountIdentifier:(id)a4
{
  id v10 = [a3 newCacheRepresentation];
  if (v10)
  {
    id v6 = [(FamilyCircleOperation *)self _cachePath];
    if (v6)
    {
      id v7 = v6;
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
      [v8 setObject:a4 forKey:@"account"];
      [v8 setObject:v10 forKey:@"circle"];
      objc_msgSend(v8, "setObject:forKey:", +[NSDate date](NSDate, "date"), @"timestamp");
      id v9 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:0];
      if (v9) {
        [(NSData *)v9 writeToFile:v7 options:1 error:0];
      }
    }
  }
}

- (int64_t)authenticationPromptStyle
{
  return self->_authenticationPromptStyle;
}

- (void)setAuthenticationPromptStyle:(int64_t)a3
{
  self->_authenticationPromptStyle = a3;
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (SSFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (BOOL)fetchITunesAccountNames
{
  return self->_fetchITunesAccountNames;
}

- (void)setFetchITunesAccountNames:(BOOL)a3
{
  self->_fetchITunesAccountNames = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

@end