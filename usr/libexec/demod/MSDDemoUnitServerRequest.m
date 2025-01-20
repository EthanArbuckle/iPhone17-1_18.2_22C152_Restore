@interface MSDDemoUnitServerRequest
- (BOOL)isValid;
- (BOOL)useBAAAuthentication;
- (MSDDemoUnitServerRequest)init;
- (NSString)getUrl;
- (NSURL)urlOverride;
- (void)setUrlOverride:(id)a3;
- (void)setUseBAAAuthentication:(BOOL)a3;
@end

@implementation MSDDemoUnitServerRequest

- (MSDDemoUnitServerRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDDemoUnitServerRequest;
  v2 = [(MSDDemoUnitServerRequest *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSDCommandServerRequest *)v2 setServer:@"api.demounit.net"];
    [(MSDCommandServerRequest *)v3 setPort:@"443"];
  }
  return v3;
}

- (BOOL)isValid
{
  v3 = [(MSDCommandServerRequest *)self server];
  if (v3)
  {
    v4 = [(MSDCommandServerRequest *)self port];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)useBAAAuthentication
{
  return self->_useBAAAuthentication;
}

- (void)setUseBAAAuthentication:(BOOL)a3
{
  self->_useBAAAuthentication = a3;
}

- (NSURL)urlOverride
{
  return self->_urlOverride;
}

- (void)setUrlOverride:(id)a3
{
}

- (NSString)getUrl
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_urlOverride, 0);
}

@end