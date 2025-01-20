@interface SoftwareLibraryUpdateOperation
- (NSDictionary)changeset;
- (NSString)bundleIdentifier;
- (SoftwareLibraryUpdateOperation)initWithBundleIdentifier:(id)a3 changeset:(id)a4;
- (void)dealloc;
- (void)run;
@end

@implementation SoftwareLibraryUpdateOperation

- (SoftwareLibraryUpdateOperation)initWithBundleIdentifier:(id)a3 changeset:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SoftwareLibraryUpdateOperation;
  v6 = [(SoftwareLibraryUpdateOperation *)&v8 init];
  if (v6)
  {
    v6->_bundleID = (NSString *)[a3 copy];
    v6->_changeset = (NSDictionary *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SoftwareLibraryUpdateOperation;
  [(SoftwareLibraryUpdateOperation *)&v3 dealloc];
}

- (NSString)bundleIdentifier
{
  v2 = self->_bundleID;

  return v2;
}

- (NSDictionary)changeset
{
  v2 = self->_changeset;

  return v2;
}

- (void)run
{
  NSUInteger v28 = 0;
  if (!self->_bundleID) {
    goto LABEL_35;
  }
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:"), "bundleContainerURL"), "path"), "stringByAppendingPathComponent:", @"iTunesMetadata.plist");
  if (!v3) {
    goto LABEL_35;
  }
  id v4 = v3;
  uint64_t v5 = (uint64_t)[objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v3];
  if (v5)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6) {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      NSUInteger v10 = [(NSDictionary *)self->_changeset count];
      bundleID = self->_bundleID;
      int v29 = 138413058;
      uint64_t v30 = v9;
      __int16 v31 = 2048;
      NSUInteger v32 = v10;
      __int16 v33 = 2112;
      v34 = bundleID;
      __int16 v35 = 2112;
      id v36 = v4;
      LODWORD(v26) = 42;
      v25 = &v29;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v29, v26);
        free(v13);
        v25 = (int *)v14;
        SSFileLog();
      }
    }
    changeset = self->_changeset;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100179958;
    v27[3] = &unk_1003A8478;
    v27[4] = v5;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](changeset, "enumerateKeysAndObjectsUsingBlock:", v27, v25);
    v16 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v28];
    if (v16)
    {
      uint64_t v5 = 1;
      if ([(NSData *)v16 writeToFile:v4 options:1 error:&v28]) {
        goto LABEL_36;
      }
      id v17 = +[SSLogConfig sharedDaemonConfig];
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig];
      }
      unsigned int v18 = [v17 shouldLog];
      if ([v17 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v19 &= 2u;
      }
      if (!v19) {
        goto LABEL_35;
      }
    }
    else
    {
      id v20 = +[SSLogConfig sharedDaemonConfig];
      if (!v20) {
        id v20 = +[SSLogConfig sharedConfig];
      }
      unsigned int v21 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v22 &= 2u;
      }
      if (!v22) {
        goto LABEL_35;
      }
    }
    uint64_t v23 = objc_opt_class();
    int v29 = 138412546;
    uint64_t v30 = v23;
    __int16 v31 = 2112;
    NSUInteger v32 = v28;
    LODWORD(v26) = 22;
    v25 = &v29;
    uint64_t v5 = _os_log_send_and_compose_impl();
    if (v5)
    {
      v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v5, 4, &v29, v26);
      free((void *)v5);
      v25 = (int *)v24;
      SSFileLog();
LABEL_35:
      uint64_t v5 = 0;
    }
  }
LABEL_36:
  -[SoftwareLibraryUpdateOperation setError:](self, "setError:", v28, v25);
  [(SoftwareLibraryUpdateOperation *)self setSuccess:v5];
}

@end