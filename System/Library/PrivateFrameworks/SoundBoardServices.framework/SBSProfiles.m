@interface SBSProfiles
- (SBSProfiles)init;
- (SBSProfiles)initWithTarget:(id)a3;
- (void)dealloc;
- (void)getInstalledProfiles:(id)a3;
- (void)installProfileData:(id)a3 completion:(id)a4;
- (void)removeProfileByIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SBSProfiles

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSProfiles;
  [(SBSProfiles *)&v3 dealloc];
}

- (void)removeProfileByIdentifier:(id)a3 completion:(id)a4
{
}

- (void)installProfileData:(id)a3 completion:(id)a4
{
}

- (void)getInstalledProfiles:(id)a3
{
  if (a3)
  {
    sbProxy = self->_sbProxy;
    -[SBSProfilesImplementer getInstalledProfiles:](sbProxy, "getInstalledProfiles:");
  }
  else
  {
    v4 = _SBSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v5, 2u);
    }
  }
}

- (SBSProfiles)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSProfiles;
  v5 = [(SBSProfiles *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:0 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSProfilesImplementer *)v6;
  }
  return v5;
}

- (SBSProfiles)init
{
  return [(SBSProfiles *)self initWithTarget:@"localhost"];
}

@end