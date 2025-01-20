@interface ExternalDownloadManifest
- (BOOL)_parsePropertyList:(id)a3;
- (ExternalDownloadManifest)init;
- (ExternalDownloadManifest)initWithPropertyList:(id)a3;
- (ExternalDownloadManifest)initWithValidDownloads:(id)a3 invalidDownloads:(id)a4;
- (NSArray)invalidDownloads;
- (NSArray)validDownloads;
- (void)dealloc;
@end

@implementation ExternalDownloadManifest

- (ExternalDownloadManifest)init
{
  return [(ExternalDownloadManifest *)self initWithPropertyList:0];
}

- (ExternalDownloadManifest)initWithPropertyList:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExternalDownloadManifest;
  v4 = [(ExternalDownloadManifest *)&v6 init];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![(ExternalDownloadManifest *)v4 _parsePropertyList:a3])
    {

      return 0;
    }
  }
  return v4;
}

- (ExternalDownloadManifest)initWithValidDownloads:(id)a3 invalidDownloads:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ExternalDownloadManifest;
  objc_super v6 = [(ExternalDownloadManifest *)&v8 init];
  if (v6)
  {
    v6->_invalidDownloads = (NSArray *)[a4 copy];
    v6->_validDownloads = (NSArray *)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ExternalDownloadManifest;
  [(ExternalDownloadManifest *)&v3 dealloc];
}

- (NSArray)invalidDownloads
{
  return self->_invalidDownloads;
}

- (NSArray)validDownloads
{
  return self->_validDownloads;
}

- (BOOL)_parsePropertyList:(id)a3
{
  v35 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  v34 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  id v4 = [a3 objectForKey:@"items"];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    CFStringRef v8 = @"metadata";
    CFStringRef v9 = @"bundle-identifier";
    uint64_t v36 = *(void *)v38;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "objectForKey:", v8, v31, v32);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v12 objectForKey:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v13)
            {
              CFStringRef v14 = v8;
              CFStringRef v15 = v9;
              id v16 = v4;
              id v17 = +[LSApplicationProxy applicationProxyForIdentifier:v13];
              unsigned int v18 = [v17 isInstalled];
              unsigned int v19 = objc_msgSend(objc_msgSend(v17, "applicationType"), "isEqualToString:", @"User");
              unsigned int v20 = [v17 profileValidated];
              if (!v18 || (v19 & v20 & 1) != 0)
              {
                v28 = [[Download alloc] initWithExternalManifestDictionary:v11];
                if ([(Download *)v28 valueForProperty:@"download_state.download_error"]) {
                  v29 = v35;
                }
                else {
                  v29 = v34;
                }
                [(NSArray *)v29 addObject:v28];

                id v4 = v16;
                CFStringRef v9 = v15;
                CFStringRef v8 = v14;
                uint64_t v7 = v36;
              }
              else
              {
                id v21 = +[SSLogConfig sharedDaemonConfig];
                if (!v21) {
                  id v21 = +[SSLogConfig sharedConfig];
                }
                unsigned int v22 = [v21 shouldLog];
                if ([v21 shouldLogToDisk]) {
                  int v23 = v22 | 2;
                }
                else {
                  int v23 = v22;
                }
                if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_ERROR)) {
                  v23 &= 2u;
                }
                id v4 = v16;
                CFStringRef v9 = v15;
                CFStringRef v8 = v14;
                uint64_t v7 = v36;
                if (v23)
                {
                  uint64_t v24 = objc_opt_class();
                  int v41 = 138412546;
                  uint64_t v42 = v24;
                  __int16 v43 = 2112;
                  id v44 = v13;
                  LODWORD(v32) = 22;
                  v31 = &v41;
                  uint64_t v25 = _os_log_send_and_compose_impl();
                  if (v25)
                  {
                    v26 = (void *)v25;
                    v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v41, v32);
                    free(v26);
                    v31 = (int *)v27;
                    SSFileLog();
                  }
                }
              }
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v6);
  }
  self->_invalidDownloads = v35;
  self->_validDownloads = v34;
  return 1;
}

@end