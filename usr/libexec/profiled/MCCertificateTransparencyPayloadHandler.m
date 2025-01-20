@interface MCCertificateTransparencyPayloadHandler
- (BOOL)_installOutError:(id *)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)setExceptions:(id)a3 outError:(id *)a4;
- (id)applicationID;
- (id)exceptionsDictionary;
- (void)_remove;
- (void)remove;
- (void)unsetAside;
@end

@implementation MCCertificateTransparencyPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return -[MCCertificateTransparencyPayloadHandler _installOutError:](self, "_installOutError:", a6, a4, a5);
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCCertificateTransparencyPayloadHandler *)self _remove];
  }
}

- (void)unsetAside
{
}

- (BOOL)_installOutError:(id *)a3
{
  v5 = [(MCCertificateTransparencyPayloadHandler *)self exceptionsDictionary];
  LOBYTE(a3) = [(MCCertificateTransparencyPayloadHandler *)self setExceptions:v5 outError:a3];

  return (char)a3;
}

- (void)_remove
{
}

- (id)applicationID
{
  v3 = [(MCNewPayloadHandler *)self payload];
  unsigned __int8 v4 = [v3 profile];
  v5 = [v4 identifier];

  v6 = [(MCNewPayloadHandler *)self payload];
  v7 = [v6 UUID];

  v8 = [v5 dataUsingEncoding:4];
  v9 = [v7 dataUsingEncoding:4];
  v10 = [v8 base64EncodedStringWithOptions:0];
  v11 = [v9 base64EncodedStringWithOptions:0];
  v12 = +[NSString stringWithFormat:@"com.apple.configurationprofiles.%@.%@", v10, v11];

  return v12;
}

- (BOOL)setExceptions:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  [(MCCertificateTransparencyPayloadHandler *)self applicationID];
  LOBYTE(self) = SecTrustStoreSetCTExceptions();

  return (char)self;
}

- (id)exceptionsDictionary
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v9[0] = kSecCTExceptionsDomainsKey;
  v3 = [v2 domainRules];
  unsigned __int8 v4 = v3;
  if (!v3)
  {
    unsigned __int8 v4 = +[NSArray array];
  }
  v10[0] = v4;
  v9[1] = kSecCTExceptionsCAsKey;
  id v5 = [v2 hashDictionaries];
  v6 = v5;
  if (!v5)
  {
    v6 = +[NSArray array];
  }
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {

  }
  return v7;
}

@end