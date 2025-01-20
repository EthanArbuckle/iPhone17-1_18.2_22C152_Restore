@interface PKRefreshVPANPaymentCredentialRequest
- (PKRefreshVPANPaymentCredentialRequest)initWithPaymentPass:(id)a3 vpanIdentifier:(id)a4 deviceIdentifier:(id)a5 nonce:(id)a6 encryptionFields:(id)a7;
- (id)endpointComponents;
@end

@implementation PKRefreshVPANPaymentCredentialRequest

- (id)endpointComponents
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PKRetrieveVPANPaymentCredentialRequest *)self deviceIdentifier];
  v5[1] = v2;
  v5[2] = @"virtualCardRefresh";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return v3;
}

- (PKRefreshVPANPaymentCredentialRequest)initWithPaymentPass:(id)a3 vpanIdentifier:(id)a4 deviceIdentifier:(id)a5 nonce:(id)a6 encryptionFields:(id)a7
{
  return [(PKRetrieveVPANPaymentCredentialRequest *)self initWithPaymentPass:a3 vpanIdentifier:a4 deviceIdentifier:a5 nonce:a6 encryptionFields:a7 merchantHost:0];
}

@end