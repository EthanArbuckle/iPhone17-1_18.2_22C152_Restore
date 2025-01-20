@interface SCLSchoolModeManagerConfiguration
- (BOOL)allowsNonTinkerPairing;
- (BOOL)managesSchoolTimeSession;
- (IDSService)service;
- (NRPairedDeviceRegistry)deviceRegistry;
- (OS_dispatch_workloop)workloop;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowsNonTinkerPairing:(BOOL)a3;
- (void)setDeviceRegistry:(id)a3;
- (void)setManagesSchoolTimeSession:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setWorkloop:(id)a3;
@end

@implementation SCLSchoolModeManagerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SCLSchoolModeManagerConfiguration);
  v5 = [(SCLSchoolModeManagerConfiguration *)self deviceRegistry];
  [(SCLSchoolModeManagerConfiguration *)v4 setDeviceRegistry:v5];

  v6 = [(SCLSchoolModeManagerConfiguration *)self service];
  [(SCLSchoolModeManagerConfiguration *)v4 setService:v6];

  [(SCLSchoolModeManagerConfiguration *)v4 setManagesSchoolTimeSession:[(SCLSchoolModeManagerConfiguration *)self managesSchoolTimeSession]];
  [(SCLSchoolModeManagerConfiguration *)v4 setAllowsNonTinkerPairing:[(SCLSchoolModeManagerConfiguration *)self allowsNonTinkerPairing]];
  v7 = [(SCLSchoolModeManagerConfiguration *)self workloop];
  [(SCLSchoolModeManagerConfiguration *)v4 setWorkloop:v7];

  return v4;
}

- (NRPairedDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (void)setDeviceRegistry:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)managesSchoolTimeSession
{
  return self->_managesSchoolTimeSession;
}

- (void)setManagesSchoolTimeSession:(BOOL)a3
{
  self->_managesSchoolTimeSession = a3;
}

- (BOOL)allowsNonTinkerPairing
{
  return self->_allowsNonTinkerPairing;
}

- (void)setAllowsNonTinkerPairing:(BOOL)a3
{
  self->_allowsNonTinkerPairing = a3;
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_deviceRegistry, 0);
}

@end