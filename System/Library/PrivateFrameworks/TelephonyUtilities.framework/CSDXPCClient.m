@interface CSDXPCClient
- (BOOL)isEntitledForCapability:(id)a3;
- (BOOL)isRemote;
- (BOOL)supportsClientAssertions;
- (CSDXPCClient)initWithConnection:(id)a3 queue:(id)a4;
- (NSSet)entitledCapabilities;
- (RBSAssertion)processAssertion;
- (TUFeatureFlags)featureFlags;
- (id)acquireAssertionIfNecessary;
- (id)newProcessAssertion;
- (id)objectForBlock;
- (id)processBundleIdentifier;
- (id)processName;
- (id)propertiesDescription;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (void)dealloc;
- (void)invalidate;
- (void)performBlockAfterCoalescing:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setSupportsClientAssertions:(BOOL)a3;
@end

@implementation CSDXPCClient

- (BOOL)isEntitledForCapability:(id)a3
{
  id v4 = a3;
  v5 = [(CSDXPCClient *)self entitledCapabilities];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)entitledCapabilities
{
  return self->_entitledCapabilities;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(CSDXPCClient *)self connection];
  unsigned __int8 v6 = [v5 valueForEntitlement:v4];

  return v6;
}

- (void)setSupportsClientAssertions:(BOOL)a3
{
  self->_supportsClientAssertions = a3;
}

- (CSDXPCClient)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSDXPCClient;
  v8 = [(CSDClient *)&v28 initWithObject:v7 queue:a4];
  if (v8)
  {
    unsigned int v9 = [v7 processIdentifier];
    if (v9 == getpid())
    {
      v10 = +[NSString stringWithFormat:@"callservicesd is attempting to create an XPC client for itself."];
      NSLog(@"** TUAssertion failure: %@", v10);

      if (_TUAssertShouldCrashApplication())
      {
        unsigned int v11 = [v7 processIdentifier];
        if (v11 == getpid())
        {
          v27 = +[NSAssertionHandler currentHandler];
          [v27 handleFailureInMethod:a2 object:v8 file:@"CSDXPCClient.m" lineNumber:48 description:@"callservicesd is attempting to create an XPC client for itself."];
        }
      }
    }
    v8->_processIdentifier = [v7 processIdentifier];
    uint64_t v12 = [v7 processName];
    processName = v8->_processName;
    v8->_processName = (NSString *)v12;

    uint64_t v14 = [v7 processBundleIdentifier];
    processBundleIdentifier = v8->_processBundleIdentifier;
    v8->_processBundleIdentifier = (NSString *)v14;

    uint64_t v16 = +[NSSet set];
    entitledCapabilities = v8->_entitledCapabilities;
    v8->_entitledCapabilities = (NSSet *)v16;

    v18 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v8->_featureFlags;
    v8->_featureFlags = v18;

    uint64_t v20 = TUBundleIdentifierCallServicesDaemon;
    v21 = [(CSDXPCClient *)v8 valueForEntitlement:TUBundleIdentifierCallServicesDaemon];
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = +[NSSet setWithArray:v21];
        p_super = &v8->_entitledCapabilities->super;
        v8->_entitledCapabilities = (NSSet *)v22;
      }
      else
      {
        p_super = sub_100008DCC();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = objc_opt_class();
          v26 = v8->_processName;
          *(_DWORD *)buf = 138413058;
          uint64_t v30 = v20;
          __int16 v31 = 2112;
          uint64_t v32 = v25;
          __int16 v33 = 2112;
          v34 = v21;
          __int16 v35 = 2112;
          v36 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Entitlement for key '%@' is non-nil but is of class %@ rather than an NSArray (%@), so assuming process %@ has no entitlements", buf, 0x2Au);
        }
      }
    }
  }

  return v8;
}

- (id)processName
{
  return self->_processName;
}

- (BOOL)isRemote
{
  return 1;
}

- (id)propertiesDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CSDXPCClient;
  v3 = [(CSDClient *)&v7 propertiesDescription];
  id v4 = [(CSDXPCClient *)self entitledCapabilities];
  v5 = +[NSString stringWithFormat:@"%@ entitlementCapabilities=%@", v3, v4];

  return v5;
}

- (void)dealloc
{
  [(CSDXPCClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSDXPCClient;
  [(CSDXPCClient *)&v3 dealloc];
}

- (id)objectForBlock
{
  v2 = [(CSDXPCClient *)self connection];
  objc_super v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)newProcessAssertion
{
  v2 = +[RBSTarget targetWithPid:[(CSDXPCClient *)self processIdentifier]];
  objc_super v3 = +[RBSDomainAttribute attributeWithDomain:TURunningBoardAssertionDomainCallservicesDaemon name:@"IPCHack"];
  id v4 = objc_alloc((Class)RBSAssertion);
  v8 = v3;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];
  id v6 = [v4 initWithExplanation:@"UI process assertion for message handling" target:v2 attributes:v5];

  return v6;
}

- (id)acquireAssertionIfNecessary
{
  if ([(CSDXPCClient *)self supportsClientAssertions]
    && [(CSDXPCClient *)self isEntitledForCapability:@"needs-ui-assertion"])
  {
    objc_super v3 = [(CSDXPCClient *)self processAssertion];
    id v4 = [(CSDXPCClient *)self newProcessAssertion];
    id v8 = 0;
    [v4 acquireWithError:&v8];
    id v5 = v8;
    if (!v5)
    {
      [v3 invalidate];
      [(CSDXPCClient *)self setProcessAssertion:v4];
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)performBlockAfterCoalescing:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BB698;
  v8[3] = &unk_100505C70;
  v8[4] = self;
  id v9 = a3;
  id v4 = objc_retainBlock(v8);
  id v5 = [(CSDXPCClient *)self acquireAssertionIfNecessary];
  if (v5)
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1003AA328(self, (uint64_t)v5, v6);
    }
  }
  objc_super v7 = [(CSDXPCClient *)self connection];
  [v7 addBarrierBlock:v4];
}

- (void)invalidate
{
  objc_super v3 = [(CSDXPCClient *)self processAssertion];
  [v3 invalidate];

  id v4 = [(CSDXPCClient *)self connection];
  [v4 invalidate];
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (id)processBundleIdentifier
{
  return self->_processBundleIdentifier;
}

- (BOOL)supportsClientAssertions
{
  return self->_supportsClientAssertions;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_entitledCapabilities, 0);
  objc_storeStrong((id *)&self->_processBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

@end