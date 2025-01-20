@interface QueryController
- (BOOL)isEnabled;
- (NSArray)excludedDomainIdentifiers;
- (NSDictionary)cep_server_values;
- (NSString)applicationNameForUserAgent;
- (PRSSearchSession)session;
- (QueryController)init;
- (double)gSessionStartTime;
- (double)sessionStartTime;
- (id)createResultObject;
- (id)supportedDomainIdentifiers;
- (id)userId;
- (void)sessionReceivedBagWithEnabledDomains:(id)a3;
- (void)setCepServerValues:(id)a3;
- (void)setCep_server_values:(id)a3;
- (void)setGSessionStartTime:(double)a3;
- (void)setSession:(id)a3;
- (void)updateCorrectionDict:(id)a3;
@end

@implementation QueryController

- (id)createResultObject
{
  v2 = objc_alloc_init(SFSearchResult_Compatibility);

  return v2;
}

- (NSString)applicationNameForUserAgent
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__QueryController_applicationNameForUserAgent__block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  if (applicationNameForUserAgent_onceToken != -1) {
    dispatch_once(&applicationNameForUserAgent_onceToken, block);
  }
  return (NSString *)(id)applicationNameForUserAgent_applicationNameForUserAgent;
}

void __46__QueryController_applicationNameForUserAgent__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [v0 infoDictionary];
  id v4 = [v1 objectForKeyedSubscript:@"CFBundleVersion"];

  uint64_t v2 = [NSString stringWithFormat:@"Spotlight/%@", v4];
  v3 = (void *)applicationNameForUserAgent_applicationNameForUserAgent;
  applicationNameForUserAgent_applicationNameForUserAgent = v2;
}

- (NSArray)excludedDomainIdentifiers
{
  return 0;
}

- (QueryController)init
{
  v3.receiver = self;
  v3.super_class = (Class)QueryController;
  return [(QueryController *)&v3 init];
}

- (id)userId
{
  return 0;
}

- (void)setCepServerValues:(id)a3
{
}

- (double)sessionStartTime
{
  return self->_gSessionStartTime;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)supportedDomainIdentifiers
{
  return 0;
}

- (void)sessionReceivedBagWithEnabledDomains:(id)a3
{
  SPSetInternetDomainsAvailable([a3 count] != 0);
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
  if (self->_session)
  {
    id v7 = v4;
    int v5 = [v4 BOOLForKey:@"disableAsTypedSuggestion"];
    BOOL v6 = v5 == [(PRSSearchSession *)self->_session disableAsTypedSuggestion];
    id v4 = v7;
    if (!v6)
    {
      objc_msgSend(v7, "setBool:forKey:", -[PRSSearchSession disableAsTypedSuggestion](self->_session, "disableAsTypedSuggestion"), @"disableAsTypedSuggestion");
      [v7 synchronize];
      id v4 = v7;
    }
  }
}

- (void)updateCorrectionDict:(id)a3
{
  id v3 = a3;
  id v4 = +[SPCorrectionProxy sharedHandler];
  [v4 updateWithFileHandle:v3];
}

- (double)gSessionStartTime
{
  return self->_gSessionStartTime;
}

- (void)setGSessionStartTime:(double)a3
{
  self->_gSessionStartTime = a3;
}

- (NSDictionary)cep_server_values
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCep_server_values:(id)a3
{
}

- (PRSSearchSession)session
{
  return (PRSSearchSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_cep_server_values, 0);
}

@end