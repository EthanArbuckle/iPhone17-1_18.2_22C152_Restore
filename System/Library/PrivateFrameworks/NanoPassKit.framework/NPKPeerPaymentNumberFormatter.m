@interface NPKPeerPaymentNumberFormatter
- (NPKPeerPaymentNumberFormatter)init;
- (NPKPeerPaymentNumberFormatter)initWithCurrencyCode:(id)a3;
- (NSString)currencyCode;
- (id)currencySymbol;
- (id)stringFromNumber:(id)a3;
- (void)setCurrencyCode:(id)a3;
@end

@implementation NPKPeerPaymentNumberFormatter

- (NPKPeerPaymentNumberFormatter)init
{
  return [(NPKPeerPaymentNumberFormatter *)self initWithCurrencyCode:0];
}

- (NPKPeerPaymentNumberFormatter)initWithCurrencyCode:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKPeerPaymentNumberFormatter;
  v6 = [(NPKPeerPaymentNumberFormatter *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currencyCode, a3);
    uint64_t v8 = NPKPeerPaymentDecimalNumberFormatterForCurrencyCode();
    decimalNumberFormatter = v7->_decimalNumberFormatter;
    v7->_decimalNumberFormatter = (NSNumberFormatter *)v8;

    uint64_t v10 = NPKPeerPaymentNumberFormatterForCurrencyCode();
    nonDecimalNumberFormatter = v7->_nonDecimalNumberFormatter;
    v7->_nonDecimalNumberFormatter = (NSNumberFormatter *)v10;
  }
  return v7;
}

- (void)setCurrencyCode:(id)a3
{
  if (self->_currencyCode != a3)
  {
    decimalNumberFormatter = self->_decimalNumberFormatter;
    id v5 = a3;
    [(NSNumberFormatter *)decimalNumberFormatter setCurrencyCode:v5];
    [(NSNumberFormatter *)self->_nonDecimalNumberFormatter setCurrencyCode:v5];
  }
}

- (id)stringFromNumber:(id)a3
{
  id v4 = a3;
  int HasDecimals = NPKPeerPaymentValueHasDecimals(v4);
  uint64_t v6 = 16;
  if (HasDecimals) {
    uint64_t v6 = 8;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  uint64_t v8 = [v7 stringFromNumber:v4];

  return v8;
}

- (id)currencySymbol
{
  return [(NSNumberFormatter *)self->_decimalNumberFormatter currencySymbol];
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_nonDecimalNumberFormatter, 0);
  objc_storeStrong((id *)&self->_decimalNumberFormatter, 0);
}

@end