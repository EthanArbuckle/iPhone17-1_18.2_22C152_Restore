@interface MSDCDNServerRequest
- (BOOL)isValid;
- (MSDFileDownloadCredentials)downloadCredentials;
- (NSString)originServer;
- (void)setDownloadCredentials:(id)a3;
- (void)setOriginServer:(id)a3;
@end

@implementation MSDCDNServerRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDCDNServerRequest;
  if (![(MSDServerRequest *)&v6 isValid]) {
    return 0;
  }
  v3 = [(MSDCDNServerRequest *)self downloadCredentials];
  BOOL v4 = v3 != 0;

  return v4;
}

- (MSDFileDownloadCredentials)downloadCredentials
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDownloadCredentials:(id)a3
{
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOriginServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originServer, 0);

  objc_storeStrong((id *)&self->_downloadCredentials, 0);
}

@end