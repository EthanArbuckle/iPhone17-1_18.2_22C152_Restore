@interface PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration
- (NSString)firstName;
- (NSString)lastName;
- (PKFamilyMember)familyMember;
- (PKPeerPaymentAssociatedAccountSetupDelegate)associatedAccountSetupDelegate;
- (PKPeerPaymentPreferences)updatedPreferences;
- (PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration)initWithFamilyMember:(id)a3 associatedAccountSetupDelegate:(id)a4 setupType:(int64_t)a5;
- (int64_t)setupType;
- (unint64_t)peerPaymentSetupConfigurationType;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setUpdatedPreferences:(id)a3;
@end

@implementation PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration

- (PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration)initWithFamilyMember:(id)a3 associatedAccountSetupDelegate:(id)a4 setupType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration;
  v11 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_familyMember, a3);
    objc_storeStrong((id *)&v12->_associatedAccountSetupDelegate, a4);
    v12->_setupType = a5;
    uint64_t v13 = [(PKFamilyMember *)v12->_familyMember firstName];
    firstName = v12->_firstName;
    v12->_firstName = (NSString *)v13;

    uint64_t v15 = [(PKFamilyMember *)v12->_familyMember lastName];
    lastName = v12->_lastName;
    v12->_lastName = (NSString *)v15;
  }
  return v12;
}

- (unint64_t)peerPaymentSetupConfigurationType
{
  return 1;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (PKPeerPaymentPreferences)updatedPreferences
{
  return self->_updatedPreferences;
}

- (void)setUpdatedPreferences:(id)a3
{
}

- (int64_t)setupType
{
  return self->_setupType;
}

- (PKPeerPaymentAssociatedAccountSetupDelegate)associatedAccountSetupDelegate
{
  return self->_associatedAccountSetupDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAccountSetupDelegate, 0);
  objc_storeStrong((id *)&self->_updatedPreferences, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end