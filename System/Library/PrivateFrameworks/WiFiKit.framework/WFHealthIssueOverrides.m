@interface WFHealthIssueOverrides
- (BOOL)carrierNetwork;
- (BOOL)commonSSID;
- (BOOL)dnsFiltered;
- (BOOL)hiddenNetwork;
- (BOOL)legacyPHY;
- (BOOL)noInternetConnection;
- (int64_t)cellularOutrankStateOverride;
- (int64_t)privateAddressOverride;
- (int64_t)securityOverride;
- (void)setCarrierNetwork:(BOOL)a3;
- (void)setCellularOutrankStateOverride:(int64_t)a3;
- (void)setCommonSSID:(BOOL)a3;
- (void)setDnsFiltered:(BOOL)a3;
- (void)setHiddenNetwork:(BOOL)a3;
- (void)setLegacyPHY:(BOOL)a3;
- (void)setNoInternetConnection:(BOOL)a3;
- (void)setPrivateAddressOverride:(int64_t)a3;
- (void)setSecurityOverride:(int64_t)a3;
@end

@implementation WFHealthIssueOverrides

- (BOOL)noInternetConnection
{
  return self->_noInternetConnection;
}

- (void)setNoInternetConnection:(BOOL)a3
{
  self->_noInternetConnection = a3;
}

- (BOOL)hiddenNetwork
{
  return self->_hiddenNetwork;
}

- (void)setHiddenNetwork:(BOOL)a3
{
  self->_hiddenNetwork = a3;
}

- (BOOL)commonSSID
{
  return self->_commonSSID;
}

- (void)setCommonSSID:(BOOL)a3
{
  self->_commonSSID = a3;
}

- (BOOL)legacyPHY
{
  return self->_legacyPHY;
}

- (void)setLegacyPHY:(BOOL)a3
{
  self->_legacyPHY = a3;
}

- (BOOL)carrierNetwork
{
  return self->_carrierNetwork;
}

- (void)setCarrierNetwork:(BOOL)a3
{
  self->_carrierNetwork = a3;
}

- (BOOL)dnsFiltered
{
  return self->_dnsFiltered;
}

- (void)setDnsFiltered:(BOOL)a3
{
  self->_dnsFiltered = a3;
}

- (int64_t)securityOverride
{
  return self->_securityOverride;
}

- (void)setSecurityOverride:(int64_t)a3
{
  self->_securityOverride = a3;
}

- (int64_t)privateAddressOverride
{
  return self->_privateAddressOverride;
}

- (void)setPrivateAddressOverride:(int64_t)a3
{
  self->_privateAddressOverride = a3;
}

- (int64_t)cellularOutrankStateOverride
{
  return self->_cellularOutrankStateOverride;
}

- (void)setCellularOutrankStateOverride:(int64_t)a3
{
  self->_cellularOutrankStateOverride = a3;
}

@end