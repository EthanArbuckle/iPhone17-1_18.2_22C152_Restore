@interface STSTapToProvisionParameters
- ($2F068FC02377E22BA03580A8162C781E)amount;
- (NSData)transactionId;
- (NSData)unpredictableNumber;
- (STSTapToProvisionParameters)initWithAmount:(id *)a3 currencyCode:(int64_t)a4 countryCode:(int64_t)a5 provisionReadTimeout:(int64_t)a6 transactionId:(id)a7 unpredictableNumber:(id)a8;
- (id)toOR;
- (int64_t)countryCode;
- (int64_t)currencyCode;
- (int64_t)provisionReadTimeout;
@end

@implementation STSTapToProvisionParameters

- (STSTapToProvisionParameters)initWithAmount:(id *)a3 currencyCode:(int64_t)a4 countryCode:(int64_t)a5 provisionReadTimeout:(int64_t)a6 transactionId:(id)a7 unpredictableNumber:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)STSTapToProvisionParameters;
  v17 = [(STSTapToProvisionParameters *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_unpredictableNumber, a8);
    objc_storeStrong((id *)&v18->_transactionId, a7);
    long long v19 = *(_OWORD *)a3;
    *(_DWORD *)&v18->_amount._mantissa[6] = *(_DWORD *)&a3->var5[6];
    *(_OWORD *)&v18->_amount = v19;
    v18->_currencyCode = a4;
    v18->_countryCode = a5;
    v18->_provisionReadTimeout = a6;
  }

  return v18;
}

- (id)toOR
{
  id v3 = objc_alloc(MEMORY[0x263F779E8]);
  int64_t currencyCode = self->_currencyCode;
  int64_t countryCode = self->_countryCode;
  int64_t provisionReadTimeout = self->_provisionReadTimeout;
  unpredictableNumber = self->_unpredictableNumber;
  transactionId = self->_transactionId;
  $FCF7D23349B6810E0BB445A99467135A amount = self->_amount;
  v9 = (void *)[v3 initWithAmount:&amount currencyCode:currencyCode countryCode:countryCode provisionReadTimeout:provisionReadTimeout transactionId:transactionId unpredictableNumber:unpredictableNumber];
  return v9;
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