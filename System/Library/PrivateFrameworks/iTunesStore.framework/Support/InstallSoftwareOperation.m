@interface InstallSoftwareOperation
- (BOOL)_installPackage:(id *)a3;
- (BOOL)_verifyApplication:(id)a3 error:(id *)a4;
- (InstallSoftwareOperation)initWithSoftwareProperties:(id)a3;
- (SoftwareProperties)softwareProperties;
- (id)_newInstallationOptions;
- (void)dealloc;
- (void)main;
- (void)run;
@end

@implementation InstallSoftwareOperation

- (InstallSoftwareOperation)initWithSoftwareProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)InstallSoftwareOperation;
  v4 = [(InstallSoftwareOperation *)&v6 init];
  if (v4) {
    v4->_softwareProperties = (SoftwareProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)InstallSoftwareOperation;
  [(InstallSoftwareOperation *)&v3 dealloc];
}

- (SoftwareProperties)softwareProperties
{
  id v2 = [(SoftwareProperties *)self->_softwareProperties copy];

  return (SoftwareProperties *)v2;
}

- (void)main
{
  if (objc_msgSend(+[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"), "isMultiUser"))
  {
    objc_super v3 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"com.apple.itunesstored.install_software.%@", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString")];
    IOPMAssertionID AssertionID = 0;
    IOReturn v4 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", v3, 0, @"itunesstored install software", 0, 180.0, @"TimeoutActionRelease", &AssertionID);
    id v5 = +[SSLogConfig sharedDaemonConfig];
    id v6 = v5;
    if (v4)
    {
      if (!v5) {
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
        int v25 = 138412546;
        uint64_t v26 = v9;
        __int16 v27 = 1024;
        LODWORD(v28) = v4;
        LODWORD(v20) = 18;
        v19 = &v25;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v25, v20);
          free(v11);
          v19 = (int *)v12;
          SSFileLog();
        }
      }
      v22.receiver = self;
      v22.super_class = (Class)InstallSoftwareOperation;
      [(InstallSoftwareOperation *)&v22 main];
    }
    else
    {
      if (!v5) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      unsigned int v13 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
        v14 &= 2u;
      }
      if (v14)
      {
        uint64_t v15 = objc_opt_class();
        int v25 = 138412546;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        v28 = v3;
        LODWORD(v20) = 22;
        v19 = &v25;
        uint64_t v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          v17 = (void *)v16;
          v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v25, v20);
          free(v17);
          v19 = (int *)v18;
          SSFileLog();
        }
      }
      v23.receiver = self;
      v23.super_class = (Class)InstallSoftwareOperation;
      [(InstallSoftwareOperation *)&v23 main];
      IOPMAssertionRelease(AssertionID);
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)InstallSoftwareOperation;
    [(InstallSoftwareOperation *)&v21 main];
  }
}

- (void)run
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setMaxValue:100];
  [*(id *)&self->ISOperation_opaque[v4] setOperationType:1];
  [(InstallSoftwareOperation *)self sendProgressToDelegate];
  uint64_t v6 = 0;
  if ([(InstallSoftwareOperation *)self _installPackage:&v6])
  {
    id v5 = +[DistributedNotificationCenter defaultCenter];
    [v5 postNotificationName:kISSoftwareMapInvalidatedNotification];
    [(InstallSoftwareOperation *)self setSuccess:1];
  }
  else
  {
    if (!v6) {
      ISError();
    }
    -[InstallSoftwareOperation setError:](self, "setError:");
  }
}

- (BOOL)_installPackage:(id *)a3
{
  if (a3) {
    *a3 = (id)SSError();
  }
  return 0;
}

- (id)_newInstallationOptions
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = [(SoftwareProperties *)self->_softwareProperties artworkData];
  if (v4) {
    [v3 setObject:v4 forKey:LSiTunesArtworkKey];
  }
  id v5 = [(SoftwareProperties *)self->_softwareProperties newsstandArtworkData];
  if (v5) {
    [v3 setObject:v5 forKey:LSNewsstandArtworkKey];
  }
  uint64_t v6 = [(SoftwareProperties *)self->_softwareProperties transitMapData];
  if (v6) {
    [v3 setObject:v6 forKey:LSGeoJSONKey];
  }
  unsigned int v7 = [(SoftwareProperties *)self->_softwareProperties ITunesMetadata];
  if (v7)
  {
    uint64_t v30 = 0;
    int v8 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:200 options:0 error:&v30];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      [v3 setObject:v8 forKey:LSiTunesMetadataKey];
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
      if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v23 &= 2u;
      }
      if (v23)
      {
        uint64_t v24 = objc_opt_class();
        int v31 = 138412546;
        uint64_t v32 = v24;
        __int16 v33 = 2112;
        uint64_t v34 = v30;
        LODWORD(v29) = 22;
        v28 = &v31;
        uint64_t v25 = _os_log_send_and_compose_impl();
        if (v25)
        {
          uint64_t v26 = (void *)v25;
          __int16 v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v31, v29);
          free(v26);
          v28 = (int *)v27;
          SSFileLog();
        }
      }
    }
  }
  else
  {
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
      int v31 = 138412290;
      uint64_t v32 = objc_opt_class();
      LODWORD(v29) = 12;
      v28 = &v31;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        int v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v31, v29);
        free(v14);
        v28 = (int *)v15;
        SSFileLog();
      }
    }
    BOOL v9 = 0;
  }
  uint64_t v16 = [(SoftwareProperties *)self->_softwareProperties sinfData];
  if (v16) {
    [v3 setObject:v16 forKey:LSApplicationSINFKey];
  }
  v17 = [(SoftwareProperties *)self->_softwareProperties installType];
  if (v17) {
    [v3 setObject:v17 forKey:LSInstallTypeKey];
  }
  v18 = +[NSNumber numberWithBool:1];
  [v3 setObject:v18 forKey:LSSupressNotificationKey];
  [v3 setObject:LSPackageTypeCustomer forKey:LSPackageTypeKey];
  v19 = [(SoftwareProperties *)self->_softwareProperties bundleIdentifier];
  if ([(NSString *)v19 length]) {
    [v3 setObject:v19 forKey:@"CFBundleIdentifier"];
  }
  if (!v9)
  {

    return 0;
  }
  return v3;
}

- (BOOL)_verifyApplication:(id)a3 error:(id *)a4
{
  unsigned int v7 = objc_opt_new();
  [v7 setSourceURL:a3];
  objc_msgSend(v7, "setBundleIdentifier:", -[SoftwareProperties bundleIdentifier](self->_softwareProperties, "bundleIdentifier"));
  objc_msgSend(v7, "setBundleVersion:", -[SoftwareProperties bundleVersion](self->_softwareProperties, "bundleVersion"));
  id v10 = 0;
  unsigned __int8 v8 = [v7 validate:&v10];

  if (a4) {
    *a4 = v10;
  }
  return v8;
}

@end