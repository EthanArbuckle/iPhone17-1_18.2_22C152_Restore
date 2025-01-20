@interface PKSubcredentialProvisioningOwnerConfiguration
- (NSString)appIdentifier;
- (NSString)issuerIdentifier;
- (NSString)keyName;
- (NSString)manufacturerIdentifier;
- (NSString)pairingPassword;
- (PKAppletSubcredentialPairingSession)session;
- (PKSubcredentialProvisioningOwnerConfiguration)initWithSession:(id)a3 pairingPassword:(id)a4 keyName:(id)a5 issuerIdentifier:(id)a6 manufacturerIdentifier:(id)a7 webService:(id)a8 registrationMetadata:(id)a9 radioTechnologies:(unint64_t)a10;
- (id)description;
- (id)transitionTable;
- (int64_t)startingState;
- (unint64_t)radioTechnologies;
- (void)setAppIdentifier:(id)a3;
@end

@implementation PKSubcredentialProvisioningOwnerConfiguration

- (PKSubcredentialProvisioningOwnerConfiguration)initWithSession:(id)a3 pairingPassword:(id)a4 keyName:(id)a5 issuerIdentifier:(id)a6 manufacturerIdentifier:(id)a7 webService:(id)a8 registrationMetadata:(id)a9 radioTechnologies:(unint64_t)a10
{
  id v16 = a3;
  id v23 = a4;
  id v22 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = [(PKSubcredentialProvisioningLocalDeviceConfiguration *)self initWithWebService:a8 registrationMetadata:a9 configurationType:0];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_session, v16);
    objc_storeStrong((id *)&v20->_pairingPassword, a4);
    objc_storeStrong((id *)&v20->_keyName, a5);
    objc_storeStrong((id *)&v20->_issuerIdentifier, a6);
    objc_storeStrong((id *)&v20->_manufacturerIdentifier, a7);
    v20->_radioTechnologies = a10;
  }

  return v20;
}

- (id)transitionTable
{
  v2 = objc_alloc_init(PKSubcredentialProvisioningOwnerPairingTransitionTable);
  return v2;
}

- (int64_t)startingState
{
  return 2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  keyName = self->_keyName;
  issuerIdentifier = self->_issuerIdentifier;
  manufacturerIdentifier = self->_manufacturerIdentifier;
  pairingPassword = self->_pairingPassword;
  v9 = PKRadioTechnologyToString(self->_radioTechnologies);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; keyName: %@; issuerIdentifier: %@; manufacturerIdentifier: %@; pairingPassword: %@; radioTechnologies: %@ >",
    v4,
    self,
    keyName,
    issuerIdentifier,
    manufacturerIdentifier,
    pairingPassword,
  v10 = v9);

  return v10;
}

- (PKAppletSubcredentialPairingSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (PKAppletSubcredentialPairingSession *)WeakRetained;
}

- (NSString)pairingPassword
{
  return self->_pairingPassword;
}

- (NSString)keyName
{
  return self->_keyName;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (unint64_t)radioTechnologies
{
  return self->_radioTechnologies;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_pairingPassword, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end