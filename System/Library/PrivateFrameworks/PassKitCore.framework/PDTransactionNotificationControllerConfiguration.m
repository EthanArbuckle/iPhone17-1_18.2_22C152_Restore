@interface PDTransactionNotificationControllerConfiguration
- (BOOL)shouldReceiveNotificationsForPeerPaymentNotificationType:(unint64_t)a3;
- (NSString)transactionSourceIdentifier;
- (PKAccountUser)accountUser;
- (PKFamilyMember)currentUser;
- (PKFamilyMember)familyMember;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentOfferInstallmentCriteria)installmentCriteria;
- (PKPaymentPass)paymentPass;
- (PKPeerPaymentAccount)associatedPeerPaymentAccount;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKPeerPaymentPreferences)preferences;
- (id)description;
- (id)passUniqueIdentifier;
- (unint64_t)transactionSourceType;
- (void)setAccountUser:(id)a3;
- (void)setAssociatedPeerPaymentAccount:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setInstallmentCriteria:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)setTransactionSourceType:(unint64_t)a3;
@end

@implementation PDTransactionNotificationControllerConfiguration

- (id)passUniqueIdentifier
{
  return [(PKPaymentPass *)self->_paymentPass uniqueID];
}

- (BOOL)shouldReceiveNotificationsForPeerPaymentNotificationType:(unint64_t)a3
{
  if (self->_transactionSourceType != 1) {
    return 1;
  }
  preferences = self->_preferences;
  v5 = [(PKPeerPaymentAccount *)self->_associatedPeerPaymentAccount altDSID];
  v6 = [(PKPeerPaymentPreferences *)preferences notificationWithType:a3 altDSID:v5];

  LOBYTE(preferences) = [v6 value];
  return (char)preferences;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  [v3 appendFormat:@"transactionSourceIdentifier: '%@'; ", self->_transactionSourceIdentifier];
  v4 = PKTransactionSourceTypeToString();
  [v3 appendFormat:@"transactionSourceType: '%@'; ", v4];

  [v3 appendFormat:@"paymentApplication: '%@'; ", self->_paymentApplication];
  v5 = [(PDTransactionNotificationControllerConfiguration *)self passUniqueIdentifier];
  [v3 appendFormat:@"paymentPass: '%@'; ", v5];

  [v3 appendFormat:@"familyMember: '%@'; ", self->_familyMember];
  [v3 appendFormat:@"currentUser: '%@'; ", self->_currentUser];
  v6 = [(PKPeerPaymentAccount *)self->_associatedPeerPaymentAccount identifier];
  [v3 appendFormat:@"associatedPeerPaymentAccount identifier: '%@'; ", v6];

  v7 = [(PKPeerPaymentAccount *)self->_associatedPeerPaymentAccount altDSID];
  [v3 appendFormat:@"associatedPeerPaymentAccount altDSID: '%@'; ", v7];

  v8 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount identifier];
  [v3 appendFormat:@"peerPaymentAccount: '%@'; ", v8];

  [v3 appendFormat:@"preferences: '%@'; ", self->_preferences];
  v9 = [(PKAccountUser *)self->_accountUser altDSID];
  [v3 appendFormat:@"accountUser altDSID: '%@'; ", v9];

  id v10 = [v3 copy];
  return v10;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (unint64_t)transactionSourceType
{
  return self->_transactionSourceType;
}

- (void)setTransactionSourceType:(unint64_t)a3
{
  self->_transactionSourceType = a3;
}

- (PKPeerPaymentAccount)associatedPeerPaymentAccount
{
  return self->_associatedPeerPaymentAccount;
}

- (void)setAssociatedPeerPaymentAccount:(id)a3
{
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (PKPeerPaymentPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (PKFamilyMember)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
}

- (PKPaymentOfferInstallmentCriteria)installmentCriteria
{
  return self->_installmentCriteria;
}

- (void)setInstallmentCriteria:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentCriteria, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_associatedPeerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
}

@end