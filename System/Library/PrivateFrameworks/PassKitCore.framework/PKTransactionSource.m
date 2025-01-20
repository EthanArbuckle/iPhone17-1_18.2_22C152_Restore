@interface PKTransactionSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)transactionSourceIdentifiers;
- (PKAccount)account;
- (PKAccountUser)accountUser;
- (PKPaymentPass)paymentPass;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKTransactionSource)initWithAccount:(id)a3;
- (PKTransactionSource)initWithAccountUser:(id)a3;
- (PKTransactionSource)initWithCoder:(id)a3;
- (PKTransactionSource)initWithPaymentPass:(id)a3;
- (PKTransactionSource)initWithPeerPaymentAccount:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKTransactionSource

- (PKTransactionSource)initWithPaymentPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = [(PKTransactionSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentPass, a3);
    v7->_type = 0;
  }

  return v7;
}

- (PKTransactionSource)initWithPeerPaymentAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = [(PKTransactionSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peerPaymentAccount, a3);
    v7->_type = 1;
  }

  return v7;
}

- (PKTransactionSource)initWithAccountUser:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = [(PKTransactionSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountUser, a3);
    v7->_type = 2;
  }

  return v7;
}

- (PKTransactionSource)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSource;
  v6 = [(PKTransactionSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_type = 3;
  }

  return v7;
}

- (NSSet)transactionSourceIdentifiers
{
  switch(self->_type)
  {
    case 0uLL:
      uint64_t v2 = [(PKSecureElementPass *)self->_paymentPass deviceTransactionSourceIdentifiers];
      goto LABEL_6;
    case 1uLL:
      peerPaymentAccount = self->_peerPaymentAccount;
      goto LABEL_8;
    case 2uLL:
      uint64_t v2 = [(PKAccountUser *)self->_accountUser transactionSourceIdentifiers];
LABEL_6:
      v3 = (void *)v2;
      break;
    case 3uLL:
      peerPaymentAccount = self->_account;
LABEL_8:
      id v5 = [peerPaymentAccount transactionSourceIdentifier];
      if (v5)
      {
        v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
      }
      else
      {
        v3 = 0;
      }

      break;
    default:
      v3 = 0;
      break;
  }
  return (NSSet *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionSource;
  id v5 = [(PKTransactionSource *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentPass"];
    paymentPass = v5->_paymentPass;
    v5->_paymentPass = (PKPaymentPass *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentAccount"];
    peerPaymentAccount = v5->_peerPaymentAccount;
    v5->_peerPaymentAccount = (PKPeerPaymentAccount *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUser"];
    accountUser = v5->_accountUser;
    v5->_accountUser = (PKAccountUser *)v10;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  paymentPass = self->_paymentPass;
  id v5 = a3;
  [v5 encodeObject:paymentPass forKey:@"paymentPass"];
  [v5 encodeObject:self->_peerPaymentAccount forKey:@"peerPaymentAccount"];
  [v5 encodeObject:self->_accountUser forKey:@"accountUser"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  unint64_t type = self->_type;
  if (type > 3) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56F3780[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  switch(self->_type)
  {
    case 0uLL:
      v7 = [(PKObject *)self->_paymentPass uniqueID];
      [v4 appendFormat:@"paymentPass uniqueID: '%@'; ", v7];
      goto LABEL_9;
    case 1uLL:
      v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount identifier];
      [v4 appendFormat:@"peerPaymentAccount identifier: '%@'; ", v7];
      goto LABEL_9;
    case 2uLL:
      v7 = [(PKAccountUser *)self->_accountUser altDSID];
      [v4 appendFormat:@"accountUser altDSID: '%@'; ", v7];
      goto LABEL_9;
    case 3uLL:
      v7 = [(PKAccount *)self->_account accountIdentifier];
      [v4 appendFormat:@"account identifier: '%@'; ", v7];
LABEL_9:

      break;
    default:
      break;
  }
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[1])
  {
    id v5 = [(PKTransactionSource *)self transactionSourceIdentifiers];
    uint64_t v6 = [v4 transactionSourceIdentifiers];
    v7 = (void *)v6;
    if (v5 && v6) {
      char v8 = [v5 isEqual:v6];
    }
    else {
      char v8 = v5 == (void *)v6;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PKTransactionSource *)self transactionSourceIdentifiers];
  [v3 safelyAddObject:v4];

  uint64_t v5 = PKCombinedHash(17, v3);
  unint64_t v6 = (unint64_t)(double)self->_type - v5 + 32 * v5;

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
}

@end