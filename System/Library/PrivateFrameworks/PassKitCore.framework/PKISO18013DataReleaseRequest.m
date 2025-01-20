@interface PKISO18013DataReleaseRequest
- (BOOL)isTrustedRelyingParty;
- (NSData)authenticationACL;
- (NSData)externalizedAuthenticationContext;
- (NSData)iconData;
- (NSNumber)industryCode;
- (NSString)analyticsIdentifier;
- (NSString)analyticsOrganizationName;
- (NSString)organizationName;
- (NSString)organizationUnit;
- (NSString)rpIdentifier;
- (NSURL)iconURL;
- (PKTransactionReleasedData)releasedData;
- (void)setAnalyticsIdentifier:(id)a3;
- (void)setAnalyticsOrganizationName:(id)a3;
- (void)setAuthenticationACL:(id)a3;
- (void)setExternalizedAuthenticationContext:(id)a3;
- (void)setIconData:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIndustryCode:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationUnit:(id)a3;
- (void)setReleasedData:(id)a3;
- (void)setRpIdentifier:(id)a3;
- (void)setTrustedRelyingParty:(BOOL)a3;
@end

@implementation PKISO18013DataReleaseRequest

- (PKTransactionReleasedData)releasedData
{
  return self->_releasedData;
}

- (void)setReleasedData:(id)a3
{
}

- (NSString)rpIdentifier
{
  return self->_rpIdentifier;
}

- (void)setRpIdentifier:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationUnit
{
  return self->_organizationUnit;
}

- (void)setOrganizationUnit:(id)a3
{
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSNumber)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(id)a3
{
}

- (NSData)authenticationACL
{
  return self->_authenticationACL;
}

- (void)setAuthenticationACL:(id)a3
{
}

- (NSData)externalizedAuthenticationContext
{
  return self->_externalizedAuthenticationContext;
}

- (void)setExternalizedAuthenticationContext:(id)a3
{
}

- (BOOL)isTrustedRelyingParty
{
  return self->_trustedRelyingParty;
}

- (void)setTrustedRelyingParty:(BOOL)a3
{
  self->_trustedRelyingParty = a3;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
}

- (NSString)analyticsOrganizationName
{
  return self->_analyticsOrganizationName;
}

- (void)setAnalyticsOrganizationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsOrganizationName, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_externalizedAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_authenticationACL, 0);
  objc_storeStrong((id *)&self->_industryCode, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_organizationUnit, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_rpIdentifier, 0);
  objc_storeStrong((id *)&self->_releasedData, 0);
}

@end