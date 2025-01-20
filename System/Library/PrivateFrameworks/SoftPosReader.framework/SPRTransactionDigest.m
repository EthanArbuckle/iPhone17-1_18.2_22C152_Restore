@interface SPRTransactionDigest
+ (BOOL)supportsSecureCoding;
- (NSData)transactionDataDigest;
- (NSString)transactionId;
- (SPRTransactionDigest)initWithCoder:(id)a3;
- (SPRTransactionDigest)initWithTransactionId:(id)a3 transactionDataDigest:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRTransactionDigest

- (SPRTransactionDigest)initWithTransactionId:(id)a3 transactionDataDigest:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSData *)a4;
  transactionId = self->_transactionId;
  self->_transactionId = v6;
  v9 = v6;

  transactionDataDigest = self->_transactionDataDigest;
  self->_transactionDataDigest = v7;

  return self;
}

- (id)description
{
  v6 = NSString;
  transactionId = self->_transactionId;
  v8 = objc_msgSend_asHexString(self->_transactionDataDigest, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_stringWithFormat_(v6, v9, @"{transactionId=%@, transactionDataDigest=%@}", v10, v11, v12, transactionId, v8);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRTransactionDigest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"transactionId", v7, v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionId = self->_transactionId;
  self->_transactionId = v9;

  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"transactionDataDigest", v13, v14);
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();

  transactionDataDigest = self->_transactionDataDigest;
  self->_transactionDataDigest = v15;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  transactionId = self->_transactionId;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)transactionId, @"transactionId", v6, v7);
  objc_msgSend_encodeObject_forKey_(v11, v8, (uint64_t)self->_transactionDataDigest, @"transactionDataDigest", v9, v10);
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSData)transactionDataDigest
{
  return self->_transactionDataDigest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDataDigest, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
}

@end