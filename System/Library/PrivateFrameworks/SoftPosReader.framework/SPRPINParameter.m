@interface SPRPINParameter
+ (BOOL)supportsSecureCoding;
+ (double)defaultTransactionDataLifetime;
- (NSData)digest;
- (NSString)pinToken;
- (SPRPINParameter)init;
- (SPRPINParameter)initWithCoder:(id)a3;
- (SPRPINParameter)initWithDigest:(id)a3 pinToken:(id)a4;
- (SPRPINParameter)initWithDigest:(id)a3 pinToken:(id)a4 transactionDataLifetime:(double)a5;
- (double)transactionDataLifetime;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRPINParameter

+ (double)defaultTransactionDataLifetime
{
  return 60.0;
}

- (SPRPINParameter)init
{
  digest = self->_digest;
  self->_digest = 0;

  pinToken = self->_pinToken;
  self->_pinToken = 0;

  objc_msgSend_defaultTransactionDataLifetime(SPRPINParameter, v5, v6, v7, v8, v9);
  self->_transactionDataLifetime = v10;
  return self;
}

- (SPRPINParameter)initWithDigest:(id)a3 pinToken:(id)a4
{
  uint64_t v6 = (NSData *)a3;
  uint64_t v7 = (NSString *)a4;
  digest = self->_digest;
  self->_digest = v6;
  uint64_t v9 = v6;

  pinToken = self->_pinToken;
  self->_pinToken = v7;
  v11 = v7;

  objc_msgSend_defaultTransactionDataLifetime(SPRPINParameter, v12, v13, v14, v15, v16);
  double v18 = v17;

  self->_transactionDataLifetime = v18;
  return self;
}

- (SPRPINParameter)initWithDigest:(id)a3 pinToken:(id)a4 transactionDataLifetime:(double)a5
{
  uint64_t v8 = (NSData *)a3;
  uint64_t v9 = (NSString *)a4;
  digest = self->_digest;
  self->_digest = v8;
  v11 = v8;

  pinToken = self->_pinToken;
  self->_pinToken = v9;

  self->_transactionDataLifetime = a5;
  return self;
}

- (id)description
{
  uint64_t v7 = NSString;
  uint64_t v8 = objc_msgSend_asHexString(self->_digest, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v7, v9, @"{digest: %@, pin token: %@, transaction data lifetime: %f}", v10, v11, v12, v8, self->_pinToken, *(void *)&self->_transactionDataLifetime);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRPINParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"digest", v7, v8);
  uint64_t v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  digest = self->_digest;
  self->_digest = v9;

  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"pinToken", v13, v14);
  uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  pinToken = self->_pinToken;
  self->_pinToken = v15;

  objc_msgSend_decodeDoubleForKey_(v4, v17, @"transactionDataLifetime", v18, v19, v20);
  double v22 = v21;

  self->_transactionDataLifetime = v22;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  digest = self->_digest;
  id v15 = a3;
  objc_msgSend_encodeObject_forKey_(v15, v5, (uint64_t)digest, @"digest", v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v8, (uint64_t)self->_pinToken, @"pinToken", v9, v10);
  objc_msgSend_encodeDouble_forKey_(v15, v11, @"transactionDataLifetime", v12, v13, v14, self->_transactionDataLifetime);
}

- (NSData)digest
{
  return self->_digest;
}

- (NSString)pinToken
{
  return self->_pinToken;
}

- (double)transactionDataLifetime
{
  return self->_transactionDataLifetime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinToken, 0);
  objc_storeStrong((id *)&self->_digest, 0);
}

@end