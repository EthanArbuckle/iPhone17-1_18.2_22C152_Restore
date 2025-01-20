@interface PKTransactionAuthenticationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)complete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransactionAuthenticationContext:(id)a3;
- (NSData)nonce;
- (NSData)partialSignature;
- (NSData)signingKeyMaterial;
- (PKTransactionAuthenticationContext)initWithCoder:(id)a3;
- (PKTransactionAuthenticationContext)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)authenticationFailure;
- (int64_t)paymentPINFormat;
- (unint64_t)dataCollectedAuthenticationMechanisms;
- (unint64_t)hash;
- (unint64_t)processedAuthenticationMechanisms;
- (unint64_t)requestedAuthenticationMechanisms;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationFailure:(int64_t)a3;
- (void)setComplete:(BOOL)a3;
- (void)setDataCollectedAuthenticationMechanisms:(unint64_t)a3;
- (void)setNonce:(id)a3;
- (void)setPartialSignature:(id)a3;
- (void)setPaymentPINFormat:(int64_t)a3;
- (void)setProcessedAuthenticationMechanisms:(unint64_t)a3;
- (void)setRequestedAuthenticationMechanisms:(unint64_t)a3;
- (void)setSigningKeyMaterial:(id)a3;
@end

@implementation PKTransactionAuthenticationContext

- (PKTransactionAuthenticationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKTransactionAuthenticationContext;
    self = [(PKTransactionAuthenticationContext *)&v19 init];
    if (self)
    {
      v5 = [v4 PKStringForKey:@"PINFormat"];
      self->_paymentPINFormat = PKTransactionAuthenticationPINFormatFromString(v5);

      v6 = [v4 PKArrayForKey:@"authenticationMechanisms"];
      self->_requestedAuthenticationMechanisms = PKTransactionAuthenticationMechanismFromStrings(v6);

      v7 = [v4 PKArrayForKey:@"processedAuthenticationMechanisms"];
      self->_processedAuthenticationMechanisms = PKTransactionAuthenticationMechanismFromStrings(v7);

      v8 = [v4 PKArrayForKey:@"dataCollectedAuthenticationMechanisms"];
      self->_dataCollectedAuthenticationMechanisms = PKTransactionAuthenticationMechanismFromStrings(v8);

      self->_complete = [v4 PKBoolForKey:@"complete"];
      v9 = [v4 PKStringForKey:@"nonce"];
      objc_msgSend(v9, "pk_decodeHexadecimal");
      v10 = (NSData *)objc_claimAutoreleasedReturnValue();
      nonce = self->_nonce;
      self->_nonce = v10;

      v12 = [v4 PKStringForKey:@"signingKeyMaterial"];
      if ([v12 length])
      {
        v13 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
        signingKeyMaterial = self->_signingKeyMaterial;
        self->_signingKeyMaterial = v13;
      }
      v15 = [v4 PKStringForKey:@"partialTransactionDetailsSignature"];
      if ([v15 length])
      {
        v16 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v15 options:0];
        partialSignature = self->_partialSignature;
        self->_partialSignature = v16;
      }
    }
  }

  return self;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  int64_t paymentPINFormat = self->_paymentPINFormat;
  v6 = @"complex";
  if (paymentPINFormat != 2) {
    v6 = 0;
  }
  if (paymentPINFormat == 1) {
    v7 = @"sixDigits";
  }
  else {
    v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"PINFormat"];
  v8 = PKTransactionAuthenticationMechanismToStrings(self->_requestedAuthenticationMechanisms);
  [v4 setObject:v8 forKeyedSubscript:@"authenticationMechanisms"];

  v9 = PKTransactionAuthenticationMechanismToStrings(self->_processedAuthenticationMechanisms);
  [v4 setObject:v9 forKeyedSubscript:@"processedAuthenticationMechanisms"];

  v10 = PKTransactionAuthenticationMechanismToStrings(self->_dataCollectedAuthenticationMechanisms);
  [v4 setObject:v10 forKeyedSubscript:@"dataCollectedAuthenticationMechanisms"];

  v11 = [NSNumber numberWithBool:self->_complete];
  [v4 setObject:v11 forKeyedSubscript:@"complete"];

  v12 = [(NSData *)self->_nonce hexEncoding];
  [v4 setObject:v12 forKeyedSubscript:@"nonce"];

  v13 = [(NSData *)self->_signingKeyMaterial base64EncodedStringWithOptions:0];
  [v4 setObject:v13 forKeyedSubscript:@"signingKeyMaterial"];

  v14 = [(NSData *)self->_partialSignature base64EncodedStringWithOptions:0];
  [v4 setObject:v14 forKeyedSubscript:@"partialTransactionDetailsSignature"];

  v15 = (void *)[v4 copy];
  return v15;
}

- (id)description
{
  id v3 = NSString;
  id v4 = PKTransactionAuthenticationMechanismToStrings(self->_requestedAuthenticationMechanisms);
  v5 = [v3 stringWithFormat:@"<PKTransactionAuthenticationContext, requested auth mechanisms: %@, PIN format: %ld, nonce: %tu bytes, signing key material: %tu bytes, partial signature: %tu bytes>", v4, self->_paymentPINFormat, -[NSData length](self->_nonce, "length"), -[NSData length](self->_signingKeyMaterial, "length"), -[NSData length](self->_partialSignature, "length")];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t paymentPINFormat = self->_paymentPINFormat;
  id v5 = a3;
  [v5 encodeInteger:paymentPINFormat forKey:@"PINFormat"];
  [v5 encodeInteger:self->_requestedAuthenticationMechanisms forKey:@"authenticationMechanisms"];
  [v5 encodeInteger:self->_processedAuthenticationMechanisms forKey:@"processedAuthenticationMechanisms"];
  [v5 encodeInteger:self->_dataCollectedAuthenticationMechanisms forKey:@"dataCollectedAuthenticationMechanisms"];
  [v5 encodeBool:self->_complete forKey:@"complete"];
  [v5 encodeObject:self->_nonce forKey:@"nonce"];
  [v5 encodeObject:self->_signingKeyMaterial forKey:@"signingKeyMaterial"];
  [v5 encodeObject:self->_partialSignature forKey:@"partialTransactionDetailsSignature"];
  [v5 encodeInteger:self->_authenticationFailure forKey:@"authenticationError"];
}

- (PKTransactionAuthenticationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionAuthenticationContext;
  id v5 = [(PKTransactionAuthenticationContext *)&v13 init];
  if (v5)
  {
    v5->_int64_t paymentPINFormat = [v4 decodeIntegerForKey:@"PINFormat"];
    v5->_requestedAuthenticationMechanisms = [v4 decodeIntegerForKey:@"authenticationMechanisms"];
    v5->_processedAuthenticationMechanisms = [v4 decodeIntegerForKey:@"processedAuthenticationMechanisms"];
    v5->_dataCollectedAuthenticationMechanisms = [v4 decodeIntegerForKey:@"dataCollectedAuthenticationMechanisms"];
    v5->_complete = [v4 decodeBoolForKey:@"complete"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signingKeyMaterial"];
    signingKeyMaterial = v5->_signingKeyMaterial;
    v5->_signingKeyMaterial = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partialTransactionDetailsSignature"];
    partialSignature = v5->_partialSignature;
    v5->_partialSignature = (NSData *)v10;

    v5->_authenticationFailure = [v4 decodeIntegerForKey:@"authenticationError"];
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_nonce];
  [v3 safelyAddObject:self->_signingKeyMaterial];
  [v3 safelyAddObject:self->_partialSignature];
  id v4 = (void *)[v3 copy];
  uint64_t v5 = PKCombinedHash(17, v4);

  unint64_t v6 = self->_requestedAuthenticationMechanisms - v5 + 32 * v5;
  unint64_t v7 = self->_processedAuthenticationMechanisms - v6 + 32 * v6;
  unint64_t v8 = self->_dataCollectedAuthenticationMechanisms - v7 + 32 * v7;
  uint64_t v9 = self->_complete - v8 + 32 * v8;
  unint64_t v10 = self->_authenticationFailure - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKTransactionAuthenticationContext *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionAuthenticationContext *)self isEqualToTransactionAuthenticationContext:v5];

  return v6;
}

- (BOOL)isEqualToTransactionAuthenticationContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_paymentPINFormat != v4[5]
    || self->_requestedAuthenticationMechanisms != v4[2]
    || self->_processedAuthenticationMechanisms != v4[3]
    || self->_dataCollectedAuthenticationMechanisms != v4[4]
    || self->_complete != *((unsigned __int8 *)v4 + 8)
    || self->_authenticationFailure != v4[9])
  {
    goto LABEL_19;
  }
  nonce = self->_nonce;
  unint64_t v7 = (NSData *)v5[6];
  if (nonce && v7)
  {
    if ((-[NSData isEqual:](nonce, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (nonce != v7)
  {
    goto LABEL_19;
  }
  signingKeyMaterial = self->_signingKeyMaterial;
  uint64_t v9 = (NSData *)v5[7];
  if (!signingKeyMaterial || !v9)
  {
    if (signingKeyMaterial == v9) {
      goto LABEL_15;
    }
LABEL_19:
    char v12 = 0;
    goto LABEL_20;
  }
  if ((-[NSData isEqual:](signingKeyMaterial, "isEqual:") & 1) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  partialSignature = self->_partialSignature;
  v11 = (NSData *)v5[8];
  if (partialSignature && v11) {
    char v12 = -[NSData isEqual:](partialSignature, "isEqual:");
  }
  else {
    char v12 = partialSignature == v11;
  }
LABEL_20:

  return v12;
}

- (unint64_t)requestedAuthenticationMechanisms
{
  return self->_requestedAuthenticationMechanisms;
}

- (void)setRequestedAuthenticationMechanisms:(unint64_t)a3
{
  self->_requestedAuthenticationMechanisms = a3;
}

- (unint64_t)processedAuthenticationMechanisms
{
  return self->_processedAuthenticationMechanisms;
}

- (void)setProcessedAuthenticationMechanisms:(unint64_t)a3
{
  self->_processedAuthenticationMechanisms = a3;
}

- (unint64_t)dataCollectedAuthenticationMechanisms
{
  return self->_dataCollectedAuthenticationMechanisms;
}

- (void)setDataCollectedAuthenticationMechanisms:(unint64_t)a3
{
  self->_dataCollectedAuthenticationMechanisms = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (int64_t)paymentPINFormat
{
  return self->_paymentPINFormat;
}

- (void)setPaymentPINFormat:(int64_t)a3
{
  self->_int64_t paymentPINFormat = a3;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)signingKeyMaterial
{
  return self->_signingKeyMaterial;
}

- (void)setSigningKeyMaterial:(id)a3
{
}

- (NSData)partialSignature
{
  return self->_partialSignature;
}

- (void)setPartialSignature:(id)a3
{
}

- (int64_t)authenticationFailure
{
  return self->_authenticationFailure;
}

- (void)setAuthenticationFailure:(int64_t)a3
{
  self->_authenticationFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSignature, 0);
  objc_storeStrong((id *)&self->_signingKeyMaterial, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end