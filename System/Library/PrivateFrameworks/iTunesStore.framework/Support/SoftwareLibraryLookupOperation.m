@interface SoftwareLibraryLookupOperation
- (NSArray)bundleIdentifiers;
- (NSArray)itemIdentifiers;
- (NSArray)softwareLibraryItems;
- (SoftwareLibraryLookupOperation)initWithBundleIdentifiers:(id)a3;
- (SoftwareLibraryLookupOperation)initWithItemIdentifiers:(id)a3;
- (id)_newSoftwareLibraryItemWithApplicationRecord:(id)a3;
- (id)_newSoftwareLibraryItemWithContainerPath:(id)a3;
- (void)_loadFromBundleIdentifiers;
- (void)_loadFromItemIdentifiers;
- (void)run;
@end

@implementation SoftwareLibraryLookupOperation

- (SoftwareLibraryLookupOperation)initWithBundleIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v17 = 138543362;
    id v18 = (id)objc_opt_class();
    id v9 = v18;
    LODWORD(v15) = 12;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v17, v15);
    free(v10);
    SSFileLog();
  }

LABEL_12:
  v16.receiver = self;
  v16.super_class = (Class)SoftwareLibraryLookupOperation;
  v11 = [(SoftwareLibraryLookupOperation *)&v16 init];
  if (v11)
  {
    v12 = (NSArray *)[v4 copy];
    bundleIDs = v11->_bundleIDs;
    v11->_bundleIDs = v12;
  }
  return v11;
}

- (SoftwareLibraryLookupOperation)initWithItemIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v17 = 138543362;
    id v18 = (id)objc_opt_class();
    id v9 = v18;
    LODWORD(v15) = 12;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v17, v15);
    free(v10);
    SSFileLog();
  }

LABEL_12:
  v16.receiver = self;
  v16.super_class = (Class)SoftwareLibraryLookupOperation;
  v11 = [(SoftwareLibraryLookupOperation *)&v16 init];
  if (v11)
  {
    v12 = (NSArray *)[v4 copy];
    itemIDs = v11->_itemIDs;
    v11->_itemIDs = v12;
  }
  return v11;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIDs;
}

- (NSArray)itemIdentifiers
{
  return self->_itemIDs;
}

- (NSArray)softwareLibraryItems
{
  [(SoftwareLibraryLookupOperation *)self lock];
  v3 = self->_softwareLibraryItems;
  [(SoftwareLibraryLookupOperation *)self unlock];

  return v3;
}

- (void)run
{
  if (self->_itemIDs) {
    [(SoftwareLibraryLookupOperation *)self _loadFromItemIdentifiers];
  }
  else {
    [(SoftwareLibraryLookupOperation *)self _loadFromBundleIdentifiers];
  }

  [(SoftwareLibraryLookupOperation *)self setSuccess:1];
}

- (void)_loadFromBundleIdentifiers
{
  id v60 = objc_alloc_init((Class)NSMutableArray);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v62 = self;
  obj = self->_bundleIDs;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v72 objects:v83 count:16];
  id v4 = &syslog_ptr;
  v5 = &syslog_ptr;
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_49;
  }
  id v6 = v3;
  id v7 = 0;
  uint64_t v63 = *(void *)v73;
  uint64_t v58 = SSSoftwareLibraryItemBundleVersion;
  uint64_t v59 = SSSoftwareLibraryItemBundleIdentifier;
  do
  {
    v8 = 0;
    do
    {
      if (*(void *)v73 != v63) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v8);
      id v11 = objc_alloc((Class)v5[279]);
      id v71 = v7;
      id v12 = [v11 initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v71];
      id v13 = v71;

      if (v12)
      {
        id v14 = [(SoftwareLibraryLookupOperation *)v62 _newSoftwareLibraryItemWithApplicationRecord:v12];
        if (v14) {
          goto LABEL_8;
        }
        goto LABEL_29;
      }
      uint64_t v15 = [v4[405] sharedDaemonConfig];
      if (!v15)
      {
        uint64_t v15 = [v4[405] sharedConfig];
      }
      unsigned int v16 = objc_msgSend(v15, "shouldLog", v56);
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      id v18 = [v15 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        int v19 = v17;
      }
      else {
        int v19 = v17 & 2;
      }
      if (v19)
      {
        v20 = objc_opt_class();
        int v77 = 138543874;
        v78 = v20;
        __int16 v79 = 2114;
        v80 = v9;
        __int16 v81 = 2114;
        id v82 = v13;
        id v21 = v20;
        LODWORD(v57) = 32;
        v56 = &v77;
        id v4 = &syslog_ptr;
        v22 = (void *)_os_log_send_and_compose_impl();

        v5 = &syslog_ptr;
        if (!v22) {
          goto LABEL_23;
        }
        id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v77, v57);
        free(v22);
        v56 = (int *)v18;
        SSFileLog();
      }
      else
      {
        v5 = &syslog_ptr;
      }

LABEL_23:
      if (![v9 hasPrefix:@"com.apple"])
      {
        id v12 = 0;
LABEL_29:
        id v7 = v13;
        goto LABEL_30;
      }
      id v23 = objc_alloc((Class)v5[279]);
      id v70 = v13;
      id v12 = [v23 initWithBundleIdentifierOfSystemPlaceholder:v9 error:&v70];
      id v7 = v70;

      if (!v12)
      {
        id v14 = [v4[405] sharedDaemonConfig];
        if (!v14)
        {
          id v14 = [v4[405] sharedConfig];
        }
        unsigned int v28 = objc_msgSend(v14, "shouldLog", v56);
        if ([v14 shouldLogToDisk]) {
          v28 |= 2u;
        }
        v29 = [v14 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          int v30 = v28;
        }
        else {
          int v30 = v28 & 2;
        }
        if (v30)
        {
          v31 = objc_opt_class();
          int v77 = 138543874;
          v78 = v31;
          __int16 v79 = 2114;
          v80 = v9;
          __int16 v81 = 2114;
          id v82 = v7;
          id v32 = v31;
          LODWORD(v57) = 32;
          v56 = &v77;
          id v12 = (id)_os_log_send_and_compose_impl();

          if (v12)
          {
            v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v77, v57);
            free(v12);
            v56 = (int *)v29;
            SSFileLog();
            v5 = &syslog_ptr;
            id v4 = &syslog_ptr;
            goto LABEL_44;
          }
          v5 = &syslog_ptr;
          id v4 = &syslog_ptr;
        }
        else
        {
          v5 = &syslog_ptr;
LABEL_44:

          id v12 = 0;
        }
LABEL_9:

        goto LABEL_30;
      }
      v24 = [v12 applicationState];
      unsigned int v25 = [v24 isInstalled];

      if (v25)
      {
        id v14 = objc_alloc_init((Class)SSSoftwareLibraryItem);
        objc_msgSend(v14, "setPlaceholder:", objc_msgSend(v12, "isPlaceholder"));
        v26 = [v12 bundleIdentifier];
        [v14 _setValue:v26 forProperty:v59];

        v27 = [v12 bundleVersion];
        [v14 _setValue:v27 forProperty:v58];

        id v13 = v7;
        v5 = &syslog_ptr;
        if (!v14) {
          goto LABEL_29;
        }
LABEL_8:
        objc_msgSend(v60, "addObject:", v14, v56);
        id v7 = v13;
        goto LABEL_9;
      }
      v5 = &syslog_ptr;
LABEL_30:

      v8 = (char *)v8 + 1;
    }
    while (v6 != v8);
    id v33 = [(NSArray *)obj countByEnumeratingWithState:&v72 objects:v83 count:16];
    id v6 = v33;
  }
  while (v33);
LABEL_49:

  v34 = v62;
  if (![(NSArray *)v62->_bundleIDs count])
  {
    v35 = [v4[405] sharedDaemonConfig];
    if (!v35)
    {
      v35 = [v4[405] sharedConfig];
    }
    unsigned int v36 = objc_msgSend(v35, "shouldLog", v56);
    if ([v35 shouldLogToDisk]) {
      int v37 = v36 | 2;
    }
    else {
      int v37 = v36;
    }
    v38 = [v35 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      int v39 = v37;
    }
    else {
      int v39 = v37 & 2;
    }
    if (v39)
    {
      v40 = objc_opt_class();
      int v77 = 138543362;
      v78 = v40;
      id v41 = v40;
      LODWORD(v57) = 12;
      v56 = &v77;
      v42 = (void *)_os_log_send_and_compose_impl();

      v43 = &syslog_ptr;
      if (v42)
      {
        v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v77, v57);
        free(v42);
        v56 = (int *)v38;
        SSFileLog();
        goto LABEL_62;
      }
    }
    else
    {
      v43 = &syslog_ptr;
LABEL_62:
    }
    id v44 = objc_alloc_init((Class)NSMutableArray);
    v45 = [v43[279] enumeratorWithOptions:192];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v46 = [v45 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (!v46) {
      goto LABEL_76;
    }
    id v47 = v46;
    uint64_t v48 = *(void *)v67;
    while (2)
    {
      uint64_t v49 = 0;
LABEL_66:
      if (*(void *)v67 != v48) {
        objc_enumerationMutation(v45);
      }
      v50 = *(void **)(*((void *)&v66 + 1) + 8 * v49);
      v51 = objc_msgSend(v50, "iTunesMetadata", v56);
      if ([v51 storeItemIdentifier])
      {
        v52 = [v50 applicationState];
        if ([v52 isInstalled])
        {

          goto LABEL_73;
        }
        unsigned int v53 = [v50 isPlaceholder];

        if (v53) {
LABEL_73:
        }
          [v44 addObject:v50];
      }
      else
      {
      }
      if (v47 == (id)++v49)
      {
        id v47 = [v45 countByEnumeratingWithState:&v66 objects:v76 count:16];
        if (!v47)
        {
LABEL_76:
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_100178CDC;
          v64[3] = &unk_1003A8450;
          v34 = v62;
          v64[4] = v62;
          id v65 = v60;
          [v44 enumerateObjectsUsingBlock:v64];

          break;
        }
        continue;
      }
      goto LABEL_66;
    }
  }
  [(SoftwareLibraryLookupOperation *)v34 lock];
  v54 = (NSArray *)[v60 copy];
  softwareLibraryItems = v34->_softwareLibraryItems;
  v34->_softwareLibraryItems = v54;

  [(SoftwareLibraryLookupOperation *)v34 unlock];
}

- (void)_loadFromItemIdentifiers
{
  id v24 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v25 = self;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_itemIDs;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v30;
    uint64_t v26 = *(void *)v30;
    while (1)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        v8 = v5;
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 integerValue])
        {
          id v11 = objc_alloc((Class)LSApplicationRecord);
          id v12 = [v9 unsignedLongLongValue];
          id v28 = v5;
          id v13 = [v11 initWithStoreItemIdentifier:v12 error:&v28];
          id v5 = v28;

          if (v13)
          {
            id v14 = [(SoftwareLibraryLookupOperation *)v25 _newSoftwareLibraryItemWithApplicationRecord:v13];
            if (v14) {
              [v24 addObject:v14];
            }
LABEL_11:
            uint64_t v6 = v26;
          }
          else
          {
            id v14 = +[SSLogConfig sharedDaemonConfig];
            if (!v14)
            {
              id v14 = +[SSLogConfig sharedConfig];
            }
            unsigned int v15 = objc_msgSend(v14, "shouldLog", v22, v23);
            if ([v14 shouldLogToDisk]) {
              v15 |= 2u;
            }
            unsigned int v16 = [v14 OSLogObject];
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              v15 &= 2u;
            }
            if (v15)
            {
              int v17 = objc_opt_class();
              int v33 = 138543874;
              v34 = v17;
              __int16 v35 = 2114;
              unsigned int v36 = v9;
              __int16 v37 = 2114;
              id v38 = v5;
              id v18 = v17;
              LODWORD(v23) = 32;
              v22 = &v33;
              int v19 = (void *)_os_log_send_and_compose_impl();

              if (!v19) {
                goto LABEL_11;
              }
              unsigned int v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v33, v23);
              free(v19);
              v22 = (int *)v16;
              SSFileLog();
            }
            uint64_t v6 = v26;
          }
          continue;
        }
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (!v4) {
        goto LABEL_28;
      }
    }
  }
  id v5 = 0;
LABEL_28:

  [(SoftwareLibraryLookupOperation *)v25 lock];
  v20 = (NSArray *)[v24 copy];
  softwareLibraryItems = v25->_softwareLibraryItems;
  v25->_softwareLibraryItems = v20;

  [(SoftwareLibraryLookupOperation *)v25 unlock];
}

- (id)_newSoftwareLibraryItemWithApplicationRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleContainerURL];
  uint64_t v6 = [v5 path];

  id v7 = [(SoftwareLibraryLookupOperation *)self _newSoftwareLibraryItemWithContainerPath:v6];
  v8 = [v4 iTunesMetadata];
  id v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 storeItemIdentifier]);

  if (!v7)
  {
    if ([v9 integerValue])
    {
      id v7 = objc_alloc_init((Class)SSSoftwareLibraryItem);
      [v7 _setValue:v9 forProperty:SSSoftwareLibraryItemPropertyITunesItemIdentifier];
    }
    else
    {
      id v7 = 0;
    }
  }
  objc_msgSend(v7, "setBeta:", objc_msgSend(v4, "isBeta"));
  objc_msgSend(v7, "setPlaceholder:", objc_msgSend(v4, "isPlaceholder"));
  objc_msgSend(v7, "setProfileValidated:", objc_msgSend(v4, "isProfileValidated"));
  objc_msgSend(v7, "setLaunchProhibited:", objc_msgSend(v4, "isLaunchProhibited"));
  v10 = [v4 bundleIdentifier];
  [v7 _setValue:v10 forProperty:SSSoftwareLibraryItemBundleIdentifier];

  id v11 = [v4 bundleVersion];
  [v7 _setValue:v11 forProperty:SSSoftwareLibraryItemBundleVersion];

  id v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 applicationDSID]);
  [v7 _setValue:v12 forProperty:SSSoftwareLibraryItemPropertyITunesAccountIdentifier];

  id v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 applicationFamilyID]);
  [v7 _setValue:v13 forProperty:SSSoftwareLibraryItemPropertyFamilyAccountIdentifier];

  return v7;
}

- (id)_newSoftwareLibraryItemWithContainerPath:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v3];
    if (v4) {
      id v5 = [objc_alloc((Class)SSSoftwareLibraryItem) _initWithITunesMetadata:v4];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareLibraryItems, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);

  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end