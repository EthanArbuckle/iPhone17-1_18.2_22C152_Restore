@interface SBDeviceApplicationScenePlaceholderContentContext
- (BOOL)canShowUserContent;
- (BOOL)hasOrientationMismatchForClassicApp;
- (BOOL)prefersLiveXIB;
- (NSString)requestedLaunchIdentifier;
- (NSURL)url;
- (SBActivationSettings)activationSettings;
- (SBDeviceApplicationScenePlaceholderContentContext)init;
- (SBDeviceApplicationScenePlaceholderContentContext)initWithActivationSettings:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)layoutEnvironment;
- (int64_t)sizingPolicy;
- (unint64_t)preferredContentType;
- (void)setActivationSettings:(id)a3;
- (void)setHasOrientationMismatchForClassicApp:(BOOL)a3;
- (void)setLayoutEnvironment:(int64_t)a3;
- (void)setPreferredContentType:(unint64_t)a3;
- (void)setPrefersLiveXIB:(BOOL)a3;
- (void)setRequestedLaunchIdentifier:(id)a3;
- (void)setSizingPolicy:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation SBDeviceApplicationScenePlaceholderContentContext

- (SBDeviceApplicationScenePlaceholderContentContext)initWithActivationSettings:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBDeviceApplicationScenePlaceholderContentContext;
  v6 = [(SBDeviceApplicationScenePlaceholderContentContext *)&v14 init];
  v7 = v6;
  if (v6)
  {
    p_settings = (id *)&v6->_settings;
    objc_storeStrong((id *)&v6->_settings, a3);
    uint64_t v9 = [(SBActivationSettings *)v7->_settings objectForActivationSetting:5];
    url = v7->_url;
    v7->_url = (NSURL *)v9;

    uint64_t v11 = [(SBActivationSettings *)v7->_settings objectForActivationSetting:17];
    requestedLaunchIdentifier = v7->_requestedLaunchIdentifier;
    v7->_requestedLaunchIdentifier = (NSString *)v11;

    if (v7->_requestedLaunchIdentifier
      || ([*p_settings BOOLForActivationSetting:41] & 1) != 0
      || [*p_settings BOOLForActivationSetting:53])
    {
      v7->_preferredContentType = 2;
    }
    if ([v5 BOOLForActivationSetting:9]) {
      v7->_preferredContentType = 1;
    }
  }

  return v7;
}

- (void)setSizingPolicy:(int64_t)a3
{
  self->_sizingPolicy = a3;
}

- (void)setLayoutEnvironment:(int64_t)a3
{
  self->_layoutEnvironment = a3;
}

- (void)setHasOrientationMismatchForClassicApp:(BOOL)a3
{
  self->_hasOrientationMismatchForClassicApp = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (SBActivationSettings)activationSettings
{
  return self->_settings;
}

- (NSString)requestedLaunchIdentifier
{
  return self->_requestedLaunchIdentifier;
}

- (BOOL)prefersLiveXIB
{
  return self->_prefersLiveXIB;
}

- (unint64_t)preferredContentType
{
  return self->_preferredContentType;
}

- (int64_t)layoutEnvironment
{
  return self->_layoutEnvironment;
}

- (BOOL)hasOrientationMismatchForClassicApp
{
  return self->_hasOrientationMismatchForClassicApp;
}

- (BOOL)canShowUserContent
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_requestedLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (SBDeviceApplicationScenePlaceholderContentContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationScenePlaceholderContentContext.m" lineNumber:43 description:@"Initializer unavailable; please use -[SBDeviceApplicationScenePlaceholderContentContext initWithDeviceApplicationSceneHandle:activationSettings:] instead."];

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationScenePlaceholderContentContext;
  return [(SBDeviceApplicationScenePlaceholderContentContext *)&v6 init];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SBMutableDeviceApplicationScenePlaceholderContentContext alloc];
  id v5 = [(SBDeviceApplicationScenePlaceholderContentContext *)self activationSettings];
  objc_super v6 = [(SBDeviceApplicationScenePlaceholderContentContext *)v4 initWithActivationSettings:v5];

  [(SBDeviceApplicationScenePlaceholderContentContext *)v6 setLayoutEnvironment:[(SBDeviceApplicationScenePlaceholderContentContext *)self layoutEnvironment]];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v6 setPrefersLiveXIB:[(SBDeviceApplicationScenePlaceholderContentContext *)self prefersLiveXIB]];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v6 setPreferredContentType:[(SBDeviceApplicationScenePlaceholderContentContext *)self preferredContentType]];
  v7 = [(SBDeviceApplicationScenePlaceholderContentContext *)self url];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v6 setUrl:v7];

  v8 = [(SBDeviceApplicationScenePlaceholderContentContext *)self requestedLaunchIdentifier];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v6 setRequestedLaunchIdentifier:v8];

  [(SBDeviceApplicationScenePlaceholderContentContext *)v6 setHasOrientationMismatchForClassicApp:[(SBDeviceApplicationScenePlaceholderContentContext *)self hasOrientationMismatchForClassicApp]];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v6 setSizingPolicy:[(SBDeviceApplicationScenePlaceholderContentContext *)self sizingPolicy]];
  return v6;
}

- (void)setActivationSettings:(id)a3
{
}

- (void)setRequestedLaunchIdentifier:(id)a3
{
}

- (void)setUrl:(id)a3
{
}

- (void)setPrefersLiveXIB:(BOOL)a3
{
  self->_prefersLiveXIB = a3;
}

- (void)setPreferredContentType:(unint64_t)a3
{
  self->_preferredContentType = a3;
}

- (int64_t)sizingPolicy
{
  return self->_sizingPolicy;
}

@end