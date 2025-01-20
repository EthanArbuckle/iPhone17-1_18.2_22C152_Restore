@interface MNNavigationClientProxy
- (MNNavigationClientProxy)init;
- (id)_directionsRequestManager;
- (void)cancelDirectionsRequestWithIdentifier:(id)a3;
- (void)requestDirections:(id)a3 withIdentifier:(id)a4 handler:(id)a5;
@end

@implementation MNNavigationClientProxy

- (MNNavigationClientProxy)init
{
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationClientProxy;
  v2 = [(MNNavigationClientProxy *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F643F0]);
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 bundleIdentifier];
    uint64_t v6 = [v3 initWithProxiedApplicationBundleId:v5];
    auditToken = v2->_auditToken;
    v2->_auditToken = (GEOApplicationAuditToken *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)requestDirections:(id)a3 withIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 auditToken];
  auditToken = v11;
  if (!v11) {
    auditToken = self->_auditToken;
  }
  v13 = auditToken;

  id v14 = [(MNNavigationClientProxy *)self _directionsRequestManager];
  [v14 requestDirections:v10 withIdentifier:v9 auditToken:v13 finishedHandler:v8];
}

- (void)cancelDirectionsRequestWithIdentifier:(id)a3
{
}

- (id)_directionsRequestManager
{
  directionsRequestManager = self->_directionsRequestManager;
  if (!directionsRequestManager)
  {
    v4 = objc_alloc_init(MNDirectionsRequestManager);
    v5 = self->_directionsRequestManager;
    self->_directionsRequestManager = v4;

    directionsRequestManager = self->_directionsRequestManager;
  }
  return directionsRequestManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsRequestManager, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end