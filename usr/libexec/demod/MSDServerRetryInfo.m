@interface MSDServerRetryInfo
- (BOOL)localHubReachable;
- (NSDictionary)credential;
- (NSString)serverType;
- (NSString)urlSchema;
- (void)setCredential:(id)a3;
- (void)setLocalHubReachable:(BOOL)a3;
- (void)setServerType:(id)a3;
- (void)setUrlSchema:(id)a3;
@end

@implementation MSDServerRetryInfo

- (NSDictionary)credential
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCredential:(id)a3
{
}

- (NSString)urlSchema
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrlSchema:(id)a3
{
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerType:(id)a3
{
}

- (BOOL)localHubReachable
{
  return self->_localHubReachable;
}

- (void)setLocalHubReachable:(BOOL)a3
{
  self->_localHubReachable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverType, 0);
  objc_storeStrong((id *)&self->_urlSchema, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

@end