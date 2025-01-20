@interface MSDFileDownloadCredentials
+ (MSDFileDownloadCredentials)sharedInstance;
- (BOOL)isCachingHubAvailable;
- (BOOL)isExpired:(id)a3;
- (BOOL)isValidForOriginServer:(id)a3;
- (BOOL)loadFromFile;
- (BOOL)saveInfoToFile:(id)a3;
- (BOOL)updateWithResponseFromGetFileDownloadCredentials:(id)a3;
- (BOOL)updateWithResponseFromGetManifestInfo:(id)a3;
- (NSDictionary)credentials;
- (NSDictionary)manifestInfo;
- (NSString)currentOriginServer;
- (id)localCredentialForOriginServer:(id)a3;
- (id)remoteCredentialForOriginServer:(id)a3;
- (void)setCredentials:(id)a3;
- (void)setCurrentOriginServer:(id)a3;
- (void)setManifestInfo:(id)a3;
@end

@implementation MSDFileDownloadCredentials

+ (MSDFileDownloadCredentials)sharedInstance
{
  if (qword_100189C48 != -1) {
    dispatch_once(&qword_100189C48, &stru_100153AF8);
  }
  v2 = (void *)qword_100189C40;

  return (MSDFileDownloadCredentials *)v2;
}

- (BOOL)updateWithResponseFromGetManifestInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"FileDownloadCredentials"];
    [(MSDFileDownloadCredentials *)self setCredentials:v6];

    v7 = [(MSDFileDownloadCredentials *)self credentials];

    if (!v7)
    {
      v8 = +[NSDictionary dictionary];
      [(MSDFileDownloadCredentials *)self setCredentials:v8];
    }
    id v9 = [v5 mutableCopy];
    [v9 removeObjectForKey:@"FileDownloadCredentials"];
    id v10 = [v9 mutableCopy];
    [(MSDFileDownloadCredentials *)self setManifestInfo:v10];

    v11 = [(MSDFileDownloadCredentials *)self credentials];
    [v9 setObject:v11 forKey:@"FileDownloadCredentials"];

    BOOL v12 = [(MSDFileDownloadCredentials *)self saveInfoToFile:v9];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateWithResponseFromGetFileDownloadCredentials:(id)a3
{
  id v4 = a3;
  v5 = [(MSDFileDownloadCredentials *)self manifestInfo];
  id v6 = [v5 mutableCopy];

  [(MSDFileDownloadCredentials *)self setCredentials:v4];
  v7 = [(MSDFileDownloadCredentials *)self credentials];

  if (!v7)
  {
    v8 = +[NSDictionary dictionary];
    [(MSDFileDownloadCredentials *)self setCredentials:v8];
  }
  id v9 = [(MSDFileDownloadCredentials *)self credentials];
  [v6 setObject:v9 forKey:@"FileDownloadCredentials"];

  BOOL v10 = [(MSDFileDownloadCredentials *)self saveInfoToFile:v6];
  return v10;
}

- (NSDictionary)manifestInfo
{
  manifestInfo = self->_manifestInfo;
  if (manifestInfo) {
    goto LABEL_4;
  }
  if ([(MSDFileDownloadCredentials *)self loadFromFile])
  {
    manifestInfo = self->_manifestInfo;
LABEL_4:
    id v4 = manifestInfo;
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_5:

  return v4;
}

- (id)localCredentialForOriginServer:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"default";
  }
  id v6 = [(MSDFileDownloadCredentials *)self credentials];
  v7 = [v6 objectForKey:@"local"];

  if (v7)
  {
    v8 = [v7 objectForKey:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)remoteCredentialForOriginServer:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"default";
  }
  id v6 = [(MSDFileDownloadCredentials *)self credentials];
  v7 = [v6 objectForKey:@"remote"];

  if (v7)
  {
    v8 = [v7 objectForKey:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isValidForOriginServer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSDFileDownloadCredentials *)self localCredentialForOriginServer:v4];
  uint64_t v6 = [(MSDFileDownloadCredentials *)self remoteCredentialForOriginServer:v4];

  if (v5 | v6 && ![(MSDFileDownloadCredentials *)self isExpired:v5]) {
    unsigned int v7 = ![(MSDFileDownloadCredentials *)self isExpired:v6];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isCachingHubAvailable
{
  v2 = [(MSDFileDownloadCredentials *)self credentials];
  v3 = [v2 objectForKey:@"local"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isExpired:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  if (v3)
  {
    unsigned int v7 = [v3 objectForKey:@"Expires"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v8 = (uint64_t)[v7 longLongValue] < (uint64_t)v6 + 30;
    }
    else
    {
      BOOL v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No expire epoch found.", v11, 2u);
      }

      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)loadFromFile
{
  id v3 = +[MSDTargetDevice sharedInstance];
  BOOL v4 = [v3 manifestAndFileDownloadInfoPath];
  double v5 = +[NSURL fileURLWithPath:v4];

  id v11 = 0;
  double v6 = +[NSDictionary dictionaryWithContentsOfURL:v5 error:&v11];
  id v7 = v11;
  if (v6)
  {
    BOOL v8 = +[NSMutableDictionary dictionaryWithDictionary:v6];
    id v9 = [v8 objectForKey:@"FileDownloadCredentials"];
    [(MSDFileDownloadCredentials *)self setCredentials:v9];

    [v8 removeObjectForKey:@"FileDownloadCredentials"];
    [(MSDFileDownloadCredentials *)self setManifestInfo:v8];
  }
  else
  {
    BOOL v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000DAD58(v5, v7);
    }
  }

  return v6 != 0;
}

- (BOOL)saveInfoToFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSFileManager defaultManager];
  double v5 = +[MSDTargetDevice sharedInstance];
  double v6 = [v5 manifestAndFileDownloadInfoPath];

  id v7 = [v6 stringByDeletingLastPathComponent];
  if ([v4 fileExistsAtPath:v7])
  {
    id v8 = 0;
  }
  else
  {
    id v17 = 0;
    unsigned __int8 v9 = [v4 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v8 = v17;
    if ((v9 & 1) == 0)
    {
      v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000DAEB8((uint64_t)v7, v8);
      }
      id v11 = 0;
      goto LABEL_12;
    }
  }
  BOOL v10 = v8;
  id v11 = +[NSURL fileURLWithPath:v6];
  id v16 = v8;
  unsigned __int8 v12 = [v3 writeToURL:v11 error:&v16];
  id v8 = v16;

  if ((v12 & 1) == 0)
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000DAE08(v11, v8);
    }
LABEL_12:

    BOOL v13 = 0;
    goto LABEL_6;
  }
  BOOL v13 = 1;
LABEL_6:

  return v13;
}

- (void)setManifestInfo:(id)a3
{
}

- (NSDictionary)credentials
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCredentials:(id)a3
{
}

- (NSString)currentOriginServer
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentOriginServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOriginServer, 0);
  objc_storeStrong((id *)&self->_credentials, 0);

  objc_storeStrong((id *)&self->_manifestInfo, 0);
}

@end