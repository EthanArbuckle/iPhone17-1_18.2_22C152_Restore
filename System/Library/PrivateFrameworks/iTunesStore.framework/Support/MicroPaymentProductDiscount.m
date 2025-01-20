@interface MicroPaymentProductDiscount
- (MicroPaymentProductDiscount)initWithDictionary:(id)a3;
- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod;
- (NSNumber)price;
- (NSString)identifier;
- (id)copyProductDiscount;
- (unint64_t)numberOfPeriods;
- (unint64_t)paymentMode;
- (unint64_t)type;
- (void)setIdentifier:(id)a3;
- (void)setNumberOfPeriods:(unint64_t)a3;
- (void)setPaymentMode:(unint64_t)a3;
- (void)setPrice:(id)a3;
- (void)setSubscriptionPeriod:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MicroPaymentProductDiscount

- (MicroPaymentProductDiscount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(MicroPaymentProductDiscount *)self init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"price"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MicroPaymentProductDiscount *)v5 setPrice:v6];
    }
    v7 = [v4 objectForKey:@"modeType"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v7 isEqualToString:@"PayAsYouGo"])
      {
        uint64_t v8 = 0;
      }
      else if ([v7 isEqualToString:@"PayUpFront"])
      {
        uint64_t v8 = 1;
      }
      else
      {
        if (![v7 isEqualToString:@"FreeTrial"]) {
          goto LABEL_28;
        }
        uint64_t v8 = 2;
      }
      [(MicroPaymentProductDiscount *)v5 setPaymentMode:v8];
    }
    v9 = [v4 objectForKey:@"numOfPeriods"];

    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_15;
    }
    if ([v9 unsignedIntegerValue])
    {
      -[MicroPaymentProductDiscount setNumberOfPeriods:](v5, "setNumberOfPeriods:", [v9 unsignedIntegerValue]);
LABEL_15:
      v10 = [v4 objectForKey:@"recurringSubscriptionPeriod"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = +[MicroPaymentProduct periodFromISO8601String:v10];
        [(MicroPaymentProductDiscount *)v5 setSubscriptionPeriod:v11];
      }
      v12 = [v4 objectForKey:@"recurringSubscriptionPeriod"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = +[MicroPaymentProduct periodFromISO8601String:v12];
        [(MicroPaymentProductDiscount *)v5 setSubscriptionPeriod:v13];
      }
      v14 = [v4 objectForKey:@"type"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_25;
      }
      if ([v14 isEqualToString:@"IntroOffer"])
      {
        uint64_t v15 = 0;
      }
      else
      {
        if (![v14 isEqualToString:@"AdhocOffer"]) {
          goto LABEL_25;
        }
        uint64_t v15 = 1;
      }
      [(MicroPaymentProductDiscount *)v5 setType:v15];
LABEL_25:
      v7 = [v4 objectForKey:@"id"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(MicroPaymentProductDiscount *)v5 setIdentifier:v7];
      }
      goto LABEL_29;
    }
    v7 = v9;
LABEL_28:

    v5 = 0;
LABEL_29:
  }
  return v5;
}

- (id)copyProductDiscount
{
  id v3 = objc_alloc_init((Class)sub_100174E30());
  id v4 = [(MicroPaymentProductDiscount *)self price];
  v5 = [v4 stringValue];
  v6 = +[NSDecimalNumber decimalNumberWithString:v5];
  [v3 _setPrice:v6];

  objc_msgSend(v3, "_setPaymentMode:", -[MicroPaymentProductDiscount paymentMode](self, "paymentMode"));
  objc_msgSend(v3, "_setNumberOfPeriods:", -[MicroPaymentProductDiscount numberOfPeriods](self, "numberOfPeriods"));
  v7 = [(MicroPaymentProductDiscount *)self identifier];
  [v3 _setIdentifier:v7];

  objc_msgSend(v3, "_setType:", -[MicroPaymentProductDiscount type](self, "type"));
  id v8 = objc_alloc_init((Class)sub_100174E18());
  objc_msgSend(v8, "_setUnit:", -[MicroPaymentProductSubscriptionPeriod unit](self->_subscriptionPeriod, "unit"));
  v9 = [(MicroPaymentProductDiscount *)self subscriptionPeriod];
  objc_msgSend(v8, "_setNumberOfUnits:", objc_msgSend(v9, "numberOfUnits"));

  [v3 _setSubscriptionPeriod:v8];
  return v3;
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod
{
  return self->_subscriptionPeriod;
}

- (void)setSubscriptionPeriod:(id)a3
{
}

- (unint64_t)numberOfPeriods
{
  return self->_numberOfPeriods;
}

- (void)setNumberOfPeriods:(unint64_t)a3
{
  self->_numberOfPeriods = a3;
}

- (unint64_t)paymentMode
{
  return self->_paymentMode;
}

- (void)setPaymentMode:(unint64_t)a3
{
  self->_paymentMode = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subscriptionPeriod, 0);

  objc_storeStrong((id *)&self->_price, 0);
}

@end