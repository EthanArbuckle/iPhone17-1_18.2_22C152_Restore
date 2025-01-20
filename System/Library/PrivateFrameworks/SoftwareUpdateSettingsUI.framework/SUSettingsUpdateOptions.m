@interface SUSettingsUpdateOptions
- (BOOL)allowUnrestrictedCellularDownload;
- (BOOL)bypassTermsAndConditions;
- (BOOL)clientIsBuddy;
- (SUSUIUpdateAgreementManager)agreementManager;
- (void)setAgreementManager:(id)a3;
- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3;
- (void)setBypassTermsAndConditions:(BOOL)a3;
- (void)setClientIsBuddy:(BOOL)a3;
@end

@implementation SUSettingsUpdateOptions

- (BOOL)allowUnrestrictedCellularDownload
{
  return self->_allowUnrestrictedCellularDownload;
}

- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3
{
  self->_allowUnrestrictedCellularDownload = a3;
}

- (BOOL)clientIsBuddy
{
  return self->_clientIsBuddy;
}

- (void)setClientIsBuddy:(BOOL)a3
{
  self->_clientIsBuddy = a3;
}

- (SUSUIUpdateAgreementManager)agreementManager
{
  return self->_agreementManager;
}

- (void)setAgreementManager:(id)a3
{
}

- (BOOL)bypassTermsAndConditions
{
  return self->_bypassTermsAndConditions;
}

- (void)setBypassTermsAndConditions:(BOOL)a3
{
  self->_bypassTermsAndConditions = a3;
}

- (void).cxx_destruct
{
}

@end