@interface RBBundleProperties
- (BOOL)continuousBackgroundMode;
- (BOOL)hasPreferredJetsamBand;
- (BOOL)isExtension;
- (BOOL)supportsBackgroundAudio;
- (BOOL)supportsBackgroundContentFetching;
- (BOOL)supportsBackgroundNetworkAuthentication;
- (BOOL)supportsUnboundedTaskCompletion;
- (BOOL)usesSocketMonitoring;
- (NSDictionary)environmentVariables;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)containerOverrideIdentifier;
- (NSString)debugDescription;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSURL)dataContainerURL;
- (RBBundleProperties)initWithLSProvider:(id)a3 xpcProvider:(id)a4 processIdentity:(id)a5 processIdentifier:(id)a6;
- (id)_bundleProperties;
- (id)_lsBundleProperties;
- (id)_xpcBundleProperties;
- (id)bundleInfoValuesForKeys:(id)a3;
- (int)platform;
- (int)preferredJetsamBand;
@end

@implementation RBBundleProperties

- (RBBundleProperties)initWithLSProvider:(id)a3 xpcProvider:(id)a4 processIdentity:(id)a5 processIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13 && ([v13 isAnonymous] & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)RBBundleProperties;
    v16 = [(RBBundleProperties *)&v19 init];
    p_isa = (id *)&v16->super.isa;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_lsProvider, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 3, a6);
    }
    self = p_isa;
    v15 = self;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcBundleProperties, 0);
  objc_storeStrong((id *)&self->_lsBundleProperties, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcProvider, 0);
  objc_storeStrong((id *)&self->_lsProvider, 0);
}

- (NSString)bundlePath
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v3 = [v2 bundlePath];

  return (NSString *)v3;
}

- (BOOL)continuousBackgroundMode
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 continuousBackgroundMode];

  return v3;
}

- (id)_bundleProperties
{
  if (a1)
  {
    if (*(void *)(a1 + 24)) {
      -[RBBundleProperties _xpcBundleProperties]((id *)a1);
    }
    else {
    a1 = -[RBBundleProperties _lsBundleProperties]((id *)a1);
    }
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (id)_xpcBundleProperties
{
  if (a1)
  {
    v2 = a1;
    id v3 = a1[6];
    if (!v3)
    {
      if (a1[3])
      {
        uint64_t v4 = objc_msgSend(a1[2], "propertiesForIdentifier:");
        id v5 = v2[6];
        v2[6] = (id)v4;

        id v3 = v2[6];
      }
      else
      {
        id v3 = 0;
      }
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSString)bundleIdentifier
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)executablePath
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  id v3 = [v2 executablePath];

  return (NSString *)v3;
}

- (BOOL)usesSocketMonitoring
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 usesSocketMonitoring];

  return v3;
}

- (NSString)extensionPointIdentifier
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 extensionPointIdentifier];

  return (NSString *)v3;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  id v4 = a3;
  id v5 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v6 = [v5 bundleInfoValuesForKeys:v4];

  return v6;
}

- (id)_lsBundleProperties
{
  if (a1)
  {
    v2 = a1;
    id v3 = a1[5];
    if (!v3)
    {
      if (a1[4])
      {
        uint64_t v4 = objc_msgSend(a1[1], "propertiesForIdentity:");
        id v5 = v2[5];
        v2[5] = (id)v4;

        id v3 = v2[5];
      }
      else
      {
        id v3 = 0;
      }
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)supportsBackgroundContentFetching
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 supportsBackgroundContentFetching];

  return v3;
}

- (BOOL)supportsBackgroundNetworkAuthentication
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 supportsBackgroundNetworkAuthentication];

  return v3;
}

- (BOOL)supportsBackgroundAudio
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 supportsBackgroundAudio];

  return v3;
}

- (BOOL)supportsUnboundedTaskCompletion
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 supportsUnboundedTaskCompletion];

  return v3;
}

- (BOOL)hasPreferredJetsamBand
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  char v3 = [v2 hasPreferredJetsamBand];

  return v3;
}

- (BOOL)isExtension
{
  v2 = [(RBBundleProperties *)self extensionPointIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)platform
{
  return [(RBSProcessIdentity *)self->_processIdentity platform];
}

- (int)preferredJetsamBand
{
  v2 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  int v3 = [v2 preferredJetsamBand];

  return v3;
}

- (NSURL)dataContainerURL
{
  v2 = -[RBBundleProperties _lsBundleProperties]((id *)&self->super.isa);
  int v3 = [v2 dataContainerURL];

  return (NSURL *)v3;
}

- (NSString)containerOverrideIdentifier
{
  v2 = -[RBBundleProperties _lsBundleProperties]((id *)&self->super.isa);
  int v3 = [v2 containerOverrideIdentifier];

  return (NSString *)v3;
}

- (NSDictionary)environmentVariables
{
  v2 = -[RBBundleProperties _lsBundleProperties]((id *)&self->super.isa);
  int v3 = [v2 environmentVariables];

  return (NSDictionary *)v3;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  id v5 = (void *)[v3 initWithFormat:@"<%@| lsBundleProperties:%@ xpcBundleProperties:%@ processIdentity:%@ processIdentifier:%@>", v4, self->_lsBundleProperties, self->_xpcBundleProperties, self->_processIdentity, self->_processIdentifier];

  return (NSString *)v5;
}

@end