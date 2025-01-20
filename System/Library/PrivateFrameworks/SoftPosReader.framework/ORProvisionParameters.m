@interface ORProvisionParameters
+ (BOOL)supportsSecureCoding;
- ($2F068FC02377E22BA03580A8162C781E)amount;
- (NSData)transactionId;
- (NSData)unpredictableNumber;
- (ORProvisionParameters)initWithAmount:(id *)a3 currencyCode:(int64_t)a4 countryCode:(int64_t)a5 provisionReadTimeout:(int64_t)a6 transactionId:(id)a7 unpredictableNumber:(id)a8;
- (ORProvisionParameters)initWithCoder:(id)a3;
- (id)description;
- (int64_t)countryCode;
- (int64_t)currencyCode;
- (int64_t)provisionReadTimeout;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ORProvisionParameters

- (ORProvisionParameters)initWithAmount:(id *)a3 currencyCode:(int64_t)a4 countryCode:(int64_t)a5 provisionReadTimeout:(int64_t)a6 transactionId:(id)a7 unpredictableNumber:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v34.receiver = self;
  v34.super_class = (Class)ORProvisionParameters;
  v16 = [(ORProvisionParameters *)&v34 init];
  v22 = v16;
  if (v16)
  {
    long long v23 = *(_OWORD *)a3;
    *(_DWORD *)&v16->_amount._mantissa[6] = *(_DWORD *)&a3->var5[6];
    *(_OWORD *)&v16->_amount = v23;
    v16->_currencyCode = a4;
    v16->_countryCode = a5;
    v16->_provisionReadTimeout = a6;
    uint64_t v24 = objc_msgSend_copy(v14, v17, v18, v19, v20, v21);
    transactionId = v22->_transactionId;
    v22->_transactionId = (NSData *)v24;

    uint64_t v31 = objc_msgSend_copy(v15, v26, v27, v28, v29, v30);
    unpredictableNumber = v22->_unpredictableNumber;
    v22->_unpredictableNumber = (NSData *)v31;
  }
  return v22;
}

- (id)description
{
  v6 = NSString;
  $FCF7D23349B6810E0BB445A99467135A amount = self->_amount;
  v7 = objc_msgSend_decimalNumberWithDecimal_(MEMORY[0x263F087B0], a2, (uint64_t)&amount, v2, v3, v4);
  long long v27 = *(_OWORD *)&self->_currencyCode;
  int64_t provisionReadTimeout = self->_provisionReadTimeout;
  id v14 = objc_msgSend_asHexString(self->_transactionId, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_asHexString(self->_unpredictableNumber, v15, v16, v17, v18, v19);
  v25 = objc_msgSend_stringWithFormat_(v6, v21, @"{amount=%@, currencyCode=%ld, countryCode=%ld, provisionReadTimeout=%ld, transactionId=%@, unpredictableNumber=%@}", v22, v23, v24, v7, v27, provisionReadTimeout, v14, v20);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ORProvisionParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ORProvisionParameters;
  v5 = [(ORProvisionParameters *)&v35 init];
  uint64_t v10 = v5;
  if (v5)
  {
    p_$FCF7D23349B6810E0BB445A99467135A amount = &v5->_amount;
    if (v4)
    {
      objc_msgSend_decodeDecimalForKey_(v4, v6, @"amount", v7, v8, v9);
    }
    else
    {
      long long v33 = 0uLL;
      int v34 = 0;
    }
    *(_OWORD *)p_$FCF7D23349B6810E0BB445A99467135A amount = v33;
    *(_DWORD *)&v10->_amount._mantissa[6] = v34;
    v10->_currencyCode = objc_msgSend_decodeIntegerForKey_(v4, v6, @"currencyCode", v7, v8, v9);
    v10->_countryCode = objc_msgSend_decodeIntegerForKey_(v4, v12, @"countryCode", v13, v14, v15);
    v10->_int64_t provisionReadTimeout = objc_msgSend_decodeIntegerForKey_(v4, v16, @"provisionReadTimeout", v17, v18, v19);
    uint64_t v20 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"transactionId", v22, v23);
    transactionId = v10->_transactionId;
    v10->_transactionId = (NSData *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"unpredictableNumber", v28, v29);
    unpredictableNumber = v10->_unpredictableNumber;
    v10->_unpredictableNumber = (NSData *)v30;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  long long amount = (__int128)self->_amount;
  LODWORD(v24) = *(_DWORD *)&self->_amount._mantissa[6];
  id v4 = a3;
  objc_msgSend_encodeDecimal_forKey_(v4, v5, (uint64_t)&amount, @"amount", v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_currencyCode, @"currencyCode", v9, v10, amount, v24);
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_countryCode, @"countryCode", v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v14, self->_provisionReadTimeout, @"provisionReadTimeout", v15, v16);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_transactionId, @"transactionId", v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)self->_unpredictableNumber, @"unpredictableNumber", v21, v22);
}

- (NSData)unpredictableNumber
{
  return self->_unpredictableNumber;
}

- (NSData)transactionId
{
  return self->_transactionId;
}

- ($2F068FC02377E22BA03580A8162C781E)amount
{
  *($FCF7D23349B6810E0BB445A99467135A *)retstr = *($FCF7D23349B6810E0BB445A99467135A *)((char *)self + 48);
  return self;
}

- (int64_t)currencyCode
{
  return self->_currencyCode;
}

- (int64_t)countryCode
{
  return self->_countryCode;
}

- (int64_t)provisionReadTimeout
{
  return self->_provisionReadTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_unpredictableNumber, 0);
}

@end