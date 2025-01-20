@interface PKPaymentLocalAppletSubcredentialPassCredential
- (PKAddCarKeyPassConfiguration)configuration;
- (PKAppletSubcredential)credentialToShare;
- (PKPaymentLocalAppletSubcredentialPassCredential)initWithPaymentPass:(id)a3 credentialToShare:(id)a4;
- (PKPaymentPass)paymentPass;
@end

@implementation PKPaymentLocalAppletSubcredentialPassCredential

- (PKPaymentLocalAppletSubcredentialPassCredential)initWithPaymentPass:(id)a3 credentialToShare:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKPaymentCredential *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v10->_credentialToShare, a4);
    v11 = [v7 localizedDescription];
    [(PKPaymentCredential *)v10 setLongDescription:v11];
  }
  return v10;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  v3 = objc_alloc_init(PKAddCarKeyPassConfiguration);
  [(PKAddCarKeyPassConfiguration *)v3 setSupportedRadioTechnologies:[(PKAppletSubcredential *)self->_credentialToShare supportedRadioTechnologies]];
  v4 = [(PKAppletSubcredential *)self->_credentialToShare manufacturerIdentifier];
  uint64_t v5 = [(PKAppletSubcredential *)self->_credentialToShare brandIdentifier];
  v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  [(PKAddSecureElementPassConfiguration *)v3 setIssuerIdentifier:v7];

  [(PKAddCarKeyPassConfiguration *)v3 setManufacturerIdentifier:v4];
  id v8 = [(PKAppletSubcredential *)self->_credentialToShare pairedReaderIdentifier];
  [(PKAddCarKeyPassConfiguration *)v3 setPairedReaderIdentifier:v8];

  return v3;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKAppletSubcredential)credentialToShare
{
  return self->_credentialToShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialToShare, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end