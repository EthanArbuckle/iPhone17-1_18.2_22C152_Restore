@interface PKSTSTapToProvisionParameters
- (NSData)nonce;
- (NSString)sid;
- (id)stsParameters;
- (int64_t)countryCode;
- (int64_t)currencyCode;
- (int64_t)timeout;
- (void)setCountryCode:(int64_t)a3;
- (void)setCurrencyCode:(int64_t)a3;
- (void)setNonce:(id)a3;
- (void)setSid:(id)a3;
- (void)setTimeout:(int64_t)a3;
@end

@implementation PKSTSTapToProvisionParameters

- (id)stsParameters
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  v12[1] = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
  [v3 getUUIDBytes:v12];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v12 length:16];
  id v5 = objc_alloc((Class)getSTSTapToProvisionParametersClass[0]());
  v6 = [MEMORY[0x1E4F28C28] zero];
  v7 = v6;
  if (v6)
  {
    [v6 decimalValue];
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    int v11 = 0;
  }
  v8 = (void *)[v5 initWithAmount:v10 currencyCode:self->_currencyCode countryCode:self->_countryCode provisionReadTimeout:self->_timeout transactionId:v4 unpredictableNumber:self->_nonce];

  return v8;
}

- (NSString)sid
{
  return self->_sid;
}

- (void)setSid:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (int64_t)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(int64_t)a3
{
  self->_currencyCode = a3;
}

- (int64_t)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(int64_t)a3
{
  self->_countryCode = a3;
}

- (int64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_sid, 0);
}

@end