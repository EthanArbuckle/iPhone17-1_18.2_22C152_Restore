@interface PKProvisioningContext
- (BOOL)isBackground;
- (BOOL)isFollowupProvisioning;
- (BOOL)isFollowupSetupAssistant;
- (NSString)hostApplicationBundleIdentifier;
- (NSString)teamIdentifier;
- (PKGroupsController)groupsController;
- (PKPaymentProvisioningController)provisioningController;
- (PKPeerPaymentWebService)peerPaymentWebService;
- (PKProvisioningAnalyticsSession)analyticsSession;
- (PKProvisioningContext)initWithEnvironment:(int64_t)a3 provisioningController:(id)a4 groupsController:(id)a5;
- (int64_t)environment;
- (int64_t)mode;
- (void)setAnalyticsSession:(id)a3;
- (void)setGroupsController:(id)a3;
- (void)setHostApplicationBundleIdentifier:(id)a3;
- (void)setIsBackground:(BOOL)a3;
- (void)setIsFollowupProvisioning:(BOOL)a3;
- (void)setIsFollowupSetupAssistant:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setPeerPaymentWebService:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation PKProvisioningContext

- (PKProvisioningContext)initWithEnvironment:(int64_t)a3 provisioningController:(id)a4 groupsController:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKProvisioningContext;
  v11 = [(PKProvisioningContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_environment = a3;
    objc_storeStrong((id *)&v11->_provisioningController, a4);
    objc_storeWeak((id *)&v12->_groupsController, v10);
  }

  return v12;
}

- (int64_t)environment
{
  return self->_environment;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKGroupsController)groupsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupsController);
  return (PKGroupsController *)WeakRetained;
}

- (void)setGroupsController:(id)a3
{
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)setPeerPaymentWebService:(id)a3
{
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->_isBackground = a3;
}

- (BOOL)isFollowupProvisioning
{
  return self->_isFollowupProvisioning;
}

- (void)setIsFollowupProvisioning:(BOOL)a3
{
  self->_isFollowupProvisioning = a3;
}

- (BOOL)isFollowupSetupAssistant
{
  return self->_isFollowupSetupAssistant;
}

- (void)setIsFollowupSetupAssistant:(BOOL)a3
{
  self->_isFollowupSetupAssistant = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSString)hostApplicationBundleIdentifier
{
  return self->_hostApplicationBundleIdentifier;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
}

- (PKProvisioningAnalyticsSession)analyticsSession
{
  return self->_analyticsSession;
}

- (void)setAnalyticsSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_destroyWeak((id *)&self->_groupsController);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end