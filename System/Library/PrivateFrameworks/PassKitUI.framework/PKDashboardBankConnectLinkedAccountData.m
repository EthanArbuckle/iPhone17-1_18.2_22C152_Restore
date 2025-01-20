@interface PKDashboardBankConnectLinkedAccountData
- (FKAccount)account;
- (FKBackgroundRefreshConfirmationPromptToken)backgroundRefreshConfirmationToken;
- (FKInstitution)institution;
- (id)accountID;
- (unint64_t)consentStatus;
- (void)setAccount:(id)a3;
- (void)setBackgroundRefreshConfirmationToken:(id)a3;
- (void)setConsentStatus:(unint64_t)a3;
- (void)setInstitution:(id)a3;
@end

@implementation PKDashboardBankConnectLinkedAccountData

- (id)accountID
{
  v2 = [(PKDashboardBankConnectLinkedAccountData *)self account];
  v3 = [v2 fullyQualifiedAccountIdentifier];
  v4 = [v3 accountID];

  return v4;
}

- (FKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (FKInstitution)institution
{
  return self->_institution;
}

- (void)setInstitution:(id)a3
{
}

- (unint64_t)consentStatus
{
  return self->_consentStatus;
}

- (void)setConsentStatus:(unint64_t)a3
{
  self->_consentStatus = a3;
}

- (FKBackgroundRefreshConfirmationPromptToken)backgroundRefreshConfirmationToken
{
  return self->_backgroundRefreshConfirmationToken;
}

- (void)setBackgroundRefreshConfirmationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundRefreshConfirmationToken, 0);
  objc_storeStrong((id *)&self->_institution, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end