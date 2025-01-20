@interface PKTransactionAuthenticationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDataForAllRequestedAuthenticationMechanisms;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransactionAuthenticationResult:(id)a3;
- (NSData)encryptedPIN;
- (NSData)transactionDetailsSignature;
- (NSData)userConfirmation;
- (NSString)transactionServiceIdentifier;
- (PKTransactionAuthenticationContext)authenticationContext;
- (PKTransactionAuthenticationResult)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setEncryptedPIN:(id)a3;
- (void)setTransactionDetailsSignature:(id)a3;
- (void)setTransactionServiceIdentifier:(id)a3;
- (void)setUserConfirmation:(id)a3;
@end

@implementation PKTransactionAuthenticationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  encryptedPIN = self->_encryptedPIN;
  id v5 = a3;
  [v5 encodeObject:encryptedPIN forKey:@"encryptedPIN"];
  [v5 encodeObject:self->_userConfirmation forKey:@"userConfirmation"];
  [v5 encodeObject:self->_transactionDetailsSignature forKey:@"transactionDetailsSignature"];
  [v5 encodeObject:self->_authenticationContext forKey:@"authenticationContext"];
  [v5 encodeObject:self->_transactionServiceIdentifier forKey:@"transactionServiceIdentifier"];
}

- (PKTransactionAuthenticationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKTransactionAuthenticationResult;
  id v5 = [(PKTransactionAuthenticationResult *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedPIN"];
    encryptedPIN = v5->_encryptedPIN;
    v5->_encryptedPIN = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userConfirmation"];
    userConfirmation = v5->_userConfirmation;
    v5->_userConfirmation = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDetailsSignature"];
    transactionDetailsSignature = v5->_transactionDetailsSignature;
    v5->_transactionDetailsSignature = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationContext"];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKTransactionAuthenticationContext *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionServiceIdentifier"];
    transactionServiceIdentifier = v5->_transactionServiceIdentifier;
    v5->_transactionServiceIdentifier = (NSString *)v14;
  }
  return v5;
}

- (BOOL)hasDataForAllRequestedAuthenticationMechanisms
{
  int v3 = [(PKTransactionAuthenticationContext *)self->_authenticationContext requestedAuthenticationMechanisms];
  return (v3 & ~[(PKTransactionAuthenticationContext *)self->_authenticationContext dataCollectedAuthenticationMechanisms] & 7) == 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PKTransactionAuthenticationResult, PIN: <%tu bytes>, user confirmation: <%tu bytes>, transaction signature: <%tu bytes>", -[NSData length](self->_encryptedPIN, "length"), -[NSData length](self->_userConfirmation, "length"), -[NSData length](self->_transactionDetailsSignature, "length")];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_encryptedPIN];
  [v3 safelyAddObject:self->_userConfirmation];
  [v3 safelyAddObject:self->_transactionDetailsSignature];
  [v3 safelyAddObject:self->_authenticationContext];
  [v3 safelyAddObject:self->_transactionServiceIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKTransactionAuthenticationResult *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionAuthenticationResult *)self isEqualToTransactionAuthenticationResult:v5];

  return v6;
}

- (BOOL)isEqualToTransactionAuthenticationResult:(id)a3
{
  unint64_t v4 = a3;
  encryptedPIN = self->_encryptedPIN;
  BOOL v6 = (NSData *)v4[2];
  if (encryptedPIN) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (encryptedPIN != v6) {
      goto LABEL_26;
    }
  }
  else if ((-[NSData isEqual:](encryptedPIN, "isEqual:") & 1) == 0)
  {
    goto LABEL_26;
  }
  userConfirmation = self->_userConfirmation;
  v9 = (NSData *)v4[4];
  if (userConfirmation && v9)
  {
    if ((-[NSData isEqual:](userConfirmation, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (userConfirmation != v9)
  {
    goto LABEL_26;
  }
  transactionDetailsSignature = self->_transactionDetailsSignature;
  v11 = (NSData *)v4[3];
  if (transactionDetailsSignature && v11)
  {
    if ((-[NSData isEqual:](transactionDetailsSignature, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (transactionDetailsSignature != v11)
  {
    goto LABEL_26;
  }
  authenticationContext = self->_authenticationContext;
  v13 = (PKTransactionAuthenticationContext *)v4[1];
  if (!authenticationContext || !v13)
  {
    if (authenticationContext == v13) {
      goto LABEL_22;
    }
LABEL_26:
    char v16 = 0;
    goto LABEL_27;
  }
  if (!-[PKTransactionAuthenticationContext isEqual:](authenticationContext, "isEqual:")) {
    goto LABEL_26;
  }
LABEL_22:
  transactionServiceIdentifier = self->_transactionServiceIdentifier;
  v15 = (NSString *)v4[5];
  if (transactionServiceIdentifier && v15) {
    char v16 = -[NSString isEqual:](transactionServiceIdentifier, "isEqual:");
  }
  else {
    char v16 = transactionServiceIdentifier == v15;
  }
LABEL_27:

  return v16;
}

- (PKTransactionAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (NSData)encryptedPIN
{
  return self->_encryptedPIN;
}

- (void)setEncryptedPIN:(id)a3
{
}

- (NSData)transactionDetailsSignature
{
  return self->_transactionDetailsSignature;
}

- (void)setTransactionDetailsSignature:(id)a3
{
}

- (NSData)userConfirmation
{
  return self->_userConfirmation;
}

- (void)setUserConfirmation:(id)a3
{
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (void)setTransactionServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_userConfirmation, 0);
  objc_storeStrong((id *)&self->_transactionDetailsSignature, 0);
  objc_storeStrong((id *)&self->_encryptedPIN, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end