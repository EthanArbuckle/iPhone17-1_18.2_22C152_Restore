@interface IMBasePlatformLookupService
- (IMBasePlatformLookupService)init;
- (NSString)protocolVersion;
- (id)baseUrl;
- (id)platformAction;
- (id)urlRequest;
- (void)performRequest:(id)a3;
- (void)setProtocolVersion:(id)a3;
@end

@implementation IMBasePlatformLookupService

- (IMBasePlatformLookupService)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMBasePlatformLookupService;
  v2 = [(IMBaseStoreService *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IMBaseStoreService *)v2 setWantsJSSignature:1];
  }
  return v3;
}

- (NSString)protocolVersion
{
  protocolVersion = self->_protocolVersion;
  if (protocolVersion) {
    v3 = protocolVersion;
  }
  else {
    v3 = @"1";
  }
  return (NSString *)v3;
}

- (id)platformAction
{
  return 0;
}

- (id)baseUrl
{
  v2 = [(IMBaseStoreService *)self bag];
  v3 = [v2 URLForKey:@"storeplatform-base-url-unpersonalized"];
  v4 = [v3 valueWithError:0];

  if (!v4)
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://client-api.itunes.apple.com/WebObjects/MZStorePlatform.woa/wa/"];
  }
  objc_super v5 = objc_msgSend(v4, "pf_components");
  v6 = [v5 path];
  if ([v6 hasSuffix:@"lookup"])
  {
    v7 = [v6 stringByDeletingLastPathComponent];
    [v5 setPath:v7];
  }
  v8 = [v5 URL];

  return v8;
}

- (id)urlRequest
{
  v3 = [(IMBasePlatformLookupService *)self baseUrl];
  v4 = [(IMBasePlatformLookupService *)self platformAction];
  objc_super v5 = [v3 URLByAppendingPathComponent:v4];

  v6 = +[PFClientUtil clientIdentifier];
  v7 = objc_msgSend(v5, "pf_URLByAppendingQueryParameterKey:value:", @"caller", v6);

  v8 = objc_msgSend(v7, "pf_URLByAppendingQueryParameterKey:value:", @"platform", @"iphone");

  v9 = [(IMBasePlatformLookupService *)self protocolVersion];
  v10 = objc_msgSend(v8, "pf_URLByAppendingQueryParameterKey:value:", @"version", v9);

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v10];
  return v11;
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(IMBasePlatformLookupService *)self urlRequest];
  [(IMBaseStoreService *)self performUrlRequest:v5 callback:v4];
}

- (void)setProtocolVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end