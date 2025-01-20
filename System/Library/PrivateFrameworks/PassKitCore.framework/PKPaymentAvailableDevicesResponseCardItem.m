@interface PKPaymentAvailableDevicesResponseCardItem
- (BOOL)supportsInApp;
- (NSNumber)cardTypeCode;
- (NSString)cardType;
- (NSString)currentStatus;
- (PKPaymentAvailableDevicesResponseCardItem)initWithDictionary:(id)a3;
- (void)setCardType:(id)a3;
- (void)setCardTypeCode:(id)a3;
- (void)setCurrentStatus:(id)a3;
- (void)setSupportsInApp:(BOOL)a3;
@end

@implementation PKPaymentAvailableDevicesResponseCardItem

- (PKPaymentAvailableDevicesResponseCardItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentAvailableDevicesResponseCardItem;
  v5 = [(PKPaymentAvailableDevicesResponseCardItem *)&v15 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"cardType"];
      cardType = v6->_cardType;
      v6->_cardType = (NSString *)v7;

      uint64_t v9 = [v4 objectForKeyedSubscript:@"cardTypeCode"];
      cardTypeCode = v6->_cardTypeCode;
      v6->_cardTypeCode = (NSNumber *)v9;

      uint64_t v11 = [v4 objectForKeyedSubscript:@"currentStatus"];
      currentStatus = v6->_currentStatus;
      v6->_currentStatus = (NSString *)v11;

      v13 = [v4 objectForKeyedSubscript:@"supportsInApp"];
      v6->_supportsInApp = [v13 BOOLValue];
    }
    else
    {
      v13 = v5;
      v6 = 0;
    }
  }
  return v6;
}

- (NSString)cardType
{
  return self->_cardType;
}

- (void)setCardType:(id)a3
{
}

- (NSNumber)cardTypeCode
{
  return self->_cardTypeCode;
}

- (void)setCardTypeCode:(id)a3
{
}

- (NSString)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(id)a3
{
}

- (BOOL)supportsInApp
{
  return self->_supportsInApp;
}

- (void)setSupportsInApp:(BOOL)a3
{
  self->_supportsInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_storeStrong((id *)&self->_cardTypeCode, 0);
  objc_storeStrong((id *)&self->_cardType, 0);
}

@end