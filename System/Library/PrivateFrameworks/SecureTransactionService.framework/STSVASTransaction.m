@interface STSVASTransaction
+ (BOOL)supportsSecureCoding;
+ (id)vasTransactionForCredential:(id)a3 withDictionary:(id)a4;
- (NSData)merchantId;
- (NSNumber)terminalAppVersion;
- (NSString)signupUrl;
- (STSVASTransaction)initWithCoder:(id)a3;
- (id)initForCredential:(id)a3 withDictionary:(id)a4;
- (id)vasCredential;
- (int64_t)terminalMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSVASTransaction

+ (id)vasTransactionForCredential:(id)a3 withDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[STSVASTransaction alloc] initForCredential:v6 withDictionary:v5];

  return v7;
}

- (id)initForCredential:(id)a3 withDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:0x26D2FEAC0];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)STSVASTransaction;
  v10 = [(STSAuxiliaryTransaction *)&v17 initWithCredential:v6 error:v9];
  if (v10)
  {
    v11 = [v7 objectForKeyedSubscript:@"STSVASTransactionKeyMerchantId"];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v10->_merchantId, v11);
      }
    }
    v12 = [v7 objectForKeyedSubscript:@"STSVASTransactionKeySignupUrl"];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v10->_signupUrl, v12);
      }
    }
    v13 = [v7 objectForKeyedSubscript:@"STSVASTransactionKeyTerminalAppVersion"];

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v10->_terminalAppVersion, v13);
      }
    }
    v8 = [v7 objectForKeyedSubscript:@"STSVASTransactionKeyTerminalMode"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v14 = [v8 unsignedShortValue] - 2;
        if (v14 > 6) {
          int64_t v15 = 0;
        }
        else {
          int64_t v15 = qword_2211A6790[(__int16)v14];
        }
        v10->_terminalMode = v15;
      }
    }
  }

  return v10;
}

- (id)vasCredential
{
  return (id)MEMORY[0x270F9A6D0](self, sel_credential);
}

- (STSVASTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSVASTransaction;
  id v5 = [(STSAuxiliaryTransaction *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSVASTransactionKeyMerchantId"];
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSVASTransactionKeySignupUrl"];
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSVASTransactionKeyTerminalAppVersion"];
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v10;

    v5->_terminalMode = (int)[v4 decodeIntForKey:@"STSVASTransactionKeyTerminalMode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSVASTransaction;
  id v4 = a3;
  [(STSAuxiliaryTransaction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_merchantId, @"STSVASTransactionKeyMerchantId", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_signupUrl forKey:@"STSVASTransactionKeySignupUrl"];
  [v4 encodeObject:self->_terminalAppVersion forKey:@"STSVASTransactionKeyTerminalAppVersion"];
  [v4 encodeInteger:self->_terminalMode forKey:@"STSVASTransactionKeyTerminalMode"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)merchantId
{
  return self->_merchantId;
}

- (NSString)signupUrl
{
  return self->_signupUrl;
}

- (NSNumber)terminalAppVersion
{
  return self->_terminalAppVersion;
}

- (int64_t)terminalMode
{
  return self->_terminalMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalAppVersion, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end