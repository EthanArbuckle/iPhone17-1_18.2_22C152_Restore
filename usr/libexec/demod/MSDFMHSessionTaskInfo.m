@interface MSDFMHSessionTaskInfo
- (BOOL)addAuthHeader;
- (BOOL)useBAAAuthentication;
- (NSURL)fmhURLOverride;
- (void)setFmhURLOverride:(id)a3;
- (void)setUseBAAAuthentication:(BOOL)a3;
@end

@implementation MSDFMHSessionTaskInfo

- (BOOL)addAuthHeader
{
  v2 = self;
  if (![(MSDFMHSessionTaskInfo *)self useBAAAuthentication])
  {
    v10.receiver = v2;
    v10.super_class = (Class)MSDFMHSessionTaskInfo;
    LOBYTE(v2) = [(MSDHubSessionTaskInfo *)&v10 addAuthHeader];
    return (char)v2;
  }
  v3 = +[MSDBAAInterface sharedInstance];
  if (([v3 generateBAACertficate:0] & 1) == 0)
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CE050();
    }
    LOBYTE(v2) = 0;
    goto LABEL_15;
  }
  v4 = [(MSDSessionTaskInfo *)v2 request];
  v5 = [(MSDSessionTaskInfo *)v2 postData];
  id v9 = 0;
  LODWORD(v2) = [v3 addBAAAuthenticationHeadersToRequest:v4 withBody:v5 error:&v9];
  v6 = v9;

  if (!v2 || v6)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CDFE8();
    }

LABEL_15:
    goto LABEL_6;
  }
  LOBYTE(v2) = 1;
LABEL_6:

  return (char)v2;
}

- (NSURL)fmhURLOverride
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFmhURLOverride:(id)a3
{
}

- (BOOL)useBAAAuthentication
{
  return self->_useBAAAuthentication;
}

- (void)setUseBAAAuthentication:(BOOL)a3
{
  self->_useBAAAuthentication = a3;
}

- (void).cxx_destruct
{
}

@end