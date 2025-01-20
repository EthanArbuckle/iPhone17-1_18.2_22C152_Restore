@interface SSKSceneHostingDisplayControllerProvider
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SSKSceneHostingDisplayControllerProvider)initWithProfileConfiguration:(id)a3;
- (SSKSceneHostingDisplayControllerProviderDelegate)delegate;
- (id)controller:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4;
- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)controller:(id)a3 modifyInitialSceneParameters:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SSKSceneHostingDisplayControllerProvider

- (SSKSceneHostingDisplayControllerProvider)initWithProfileConfiguration:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SSKSceneHostingDisplayControllerProvider.m", 30, @"Invalid parameter not satisfying: %@", @"[profileConfigurationBox isKindOfClass:[SSKDisplayProfileConfiguration class]]" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SSKSceneHostingDisplayControllerProvider;
  v7 = [(SSKSceneHostingDisplayControllerProvider *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_profileConfigurationBox, a3);
  }

  return v8;
}

- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = [[SSKSceneHostingDisplayController alloc] initWithProfileConfiguration:self->_profileConfigurationBox displayIdentity:v5];

  [(SSKSceneHostingDisplayController *)v6 setDelegate:self];
  return v6;
}

- (id)controller:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = [WeakRetained provider:self rootSceneWindowForDisplayConfiguration:v6];

  return v8;
}

- (void)controller:(id)a3 modifyInitialSceneParameters:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained provider:self modifyInitialSceneParameters:v6];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_profileConfigurationBox];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  profileConfigurationBox = self->_profileConfigurationBox;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__SSKSceneHostingDisplayControllerProvider_isEqual___block_invoke;
  v10[3] = &unk_2654B16E0;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:profileConfigurationBox counterpart:v10];
  LOBYTE(profileConfigurationBox) = [v5 isEqual];

  return (char)profileConfigurationBox;
}

id __52__SSKSceneHostingDisplayControllerProvider_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3 = (id)[a3 appendObject:self->_profileConfigurationBox withName:@"profileConfiguration"];
}

- (SSKSceneHostingDisplayControllerProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSKSceneHostingDisplayControllerProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profileConfigurationBox, 0);
}

@end