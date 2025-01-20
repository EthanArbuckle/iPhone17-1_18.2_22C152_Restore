@interface PKPeerPaymentCredential
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSuperEasyProvisioning;
- (NSString)ownershipTokenIdentifier;
- (NSString)pendingPaymentSenderAddress;
- (NSString)pendingPaymentSenderName;
- (PKCurrencyAmount)amount;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentCredential)initWithPeerPaymentAccount:(id)a3;
- (PKPeerPaymentPassDetailsResponse)passDetailsResponse;
- (id)detailDescriptionWithEnvironment:(unint64_t)a3;
- (id)longDescription;
- (unint64_t)flowState;
- (unint64_t)hash;
- (unint64_t)paymentMode;
- (void)setAmount:(id)a3;
- (void)setFlowState:(unint64_t)a3;
- (void)setPassDetailsResponse:(id)a3;
- (void)setPaymentMode:(unint64_t)a3;
- (void)setPendingPaymentSenderAddress:(id)a3;
@end

@implementation PKPeerPaymentCredential

- (PKPeerPaymentCredential)initWithPeerPaymentAccount:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentCredential;
    v6 = [(PKPaymentCredential *)&v9 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_account, a3);
      [(PKPaymentCredential *)v7 setCardType:1];
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPeerPaymentCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPeerPaymentCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  account = self->_account;
  id v4 = a3;
  BOOL v5 = [(PKPeerPaymentAccount *)account associatedPassSerialNumber];
  v6 = [v4 account];

  v7 = [v6 associatedPassSerialNumber];
  id v8 = v5;
  id v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    char v12 = 1;
  }
  else
  {
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11) {
      char v12 = 0;
    }
    else {
      char v12 = [v8 isEqualToString:v9];
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PKPeerPaymentAccount *)self->_account associatedPassSerialNumber];
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash(17, v3);
  return v5;
}

- (id)longDescription
{
  return PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet.isa, 0);
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  v3 = [(PKPeerPaymentAccount *)self->_account currentBalance];
  id v4 = [v3 amount];
  if (v4
    && ([MEMORY[0x1E4F28C28] notANumber],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqual:v5],
        v5,
        (v6 & 1) == 0))
  {
    id v8 = [v3 minimalFormattedStringValue];
    v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentOnF.isa, &stru_1EE0F6808.isa, v8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)ownershipTokenIdentifier
{
  return [(PKPeerPaymentPassDetailsResponse *)self->_passDetailsResponse ownershipTokenIdentifier];
}

- (NSString)pendingPaymentSenderName
{
  if ([(NSString *)self->_pendingPaymentSenderAddress length]
    && ![(NSString *)self->_pendingPaymentSenderName length])
  {
    pendingPaymentSenderAddress = self->_pendingPaymentSenderAddress;
    if (qword_1E92D9A40 != -1) {
      dispatch_once(&qword_1E92D9A40, &__block_literal_global_1045);
    }
    id v4 = (id)qword_1E92D9A48;
    unint64_t v5 = +[PKPeerPaymentController displayNameForAddress:pendingPaymentSenderAddress contactResolver:v4];
    pendingPaymentSenderName = self->_pendingPaymentSenderName;
    self->_pendingPaymentSenderName = v5;
  }
  v7 = self->_pendingPaymentSenderName;
  return v7;
}

- (BOOL)supportsSuperEasyProvisioning
{
  account = self->_account;
  if (account) {
    LOBYTE(account) = ![(PKPeerPaymentAccount *)account termsAcceptanceRequired];
  }
  return (char)account;
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKPeerPaymentPassDetailsResponse)passDetailsResponse
{
  return self->_passDetailsResponse;
}

- (void)setPassDetailsResponse:(id)a3
{
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (unint64_t)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(unint64_t)a3
{
  self->_flowState = a3;
}

- (NSString)pendingPaymentSenderAddress
{
  return self->_pendingPaymentSenderAddress;
}

- (void)setPendingPaymentSenderAddress:(id)a3
{
}

- (unint64_t)paymentMode
{
  return self->_paymentMode;
}

- (void)setPaymentMode:(unint64_t)a3
{
  self->_paymentMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPaymentSenderAddress, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_passDetailsResponse, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_pendingPaymentSenderName, 0);
}

@end