@interface SKProductDiscount
- (NSDecimalNumber)price;
- (NSLocale)priceLocale;
- (NSString)identifier;
- (NSUInteger)numberOfPeriods;
- (SKProductDiscount)init;
- (SKProductDiscount)initWithDictionary:(id)a3;
- (SKProductDiscount)initWithXPCEncoding:(id)a3;
- (SKProductDiscountPaymentMode)paymentMode;
- (SKProductDiscountType)type;
- (SKProductSubscriptionPeriod)subscriptionPeriod;
- (id)copyXPCEncoding;
- (void)_setIdentifier:(id)a3;
- (void)_setNumberOfPeriods:(unint64_t)a3;
- (void)_setPaymentMode:(unint64_t)a3;
- (void)_setPrice:(id)a3;
- (void)_setPriceLocale:(id)a3;
- (void)_setSubscriptionPeriod:(id)a3;
- (void)_setType:(unint64_t)a3;
@end

@implementation SKProductDiscount

- (SKProductDiscount)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProductDiscount;
  v2 = [(SKProductDiscount *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductDiscountInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 1);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 2);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 4);
}

- (NSUInteger)numberOfPeriods
{
  return *((void *)self->_internal + 5);
}

- (SKProductDiscountPaymentMode)paymentMode
{
  return *((void *)self->_internal + 3);
}

- (NSString)identifier
{
  return (NSString *)*((id *)self->_internal + 7);
}

- (SKProductDiscountType)type
{
  return *((void *)self->_internal + 6);
}

- (void)_setNumberOfPeriods:(unint64_t)a3
{
  *((void *)self->_internal + 5) = a3;
}

- (void)_setPaymentMode:(unint64_t)a3
{
  *((void *)self->_internal + 3) = a3;
}

- (void)_setPrice:(id)a3
{
  objc_storeStrong((id *)self->_internal + 1, a3);
  id v4 = a3;
}

- (void)_setPriceLocale:(id)a3
{
  objc_storeStrong((id *)self->_internal + 2, a3);
  id v4 = a3;
}

- (void)_setSubscriptionPeriod:(id)a3
{
  objc_storeStrong((id *)self->_internal + 4, a3);
  id v4 = a3;
}

- (void)_setIdentifier:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  uint64_t v6 = internal[7];
  internal[7] = v4;

  _objc_release_x1(v4, v6);
}

- (void)_setType:(unint64_t)a3
{
  *((void *)self->_internal + 6) = a3;
}

- (SKProductDiscount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(SKProductDiscount *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"pri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      if (!v7) {
        goto LABEL_12;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = 0;
        goto LABEL_12;
      }
      id v8 = objc_alloc((Class)NSDecimalNumber);
      v9 = [v6 stringValue];
      id v7 = [v8 initWithString:v9];

      if (!v7) {
        goto LABEL_12;
      }
    }
    id v10 = [objc_alloc((Class)NSDecimalNumberHandler) initWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    uint64_t v11 = [v7 decimalNumberByRoundingAccordingToBehavior:v10];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = v7;
    }
    objc_storeStrong((id *)v5->_internal + 1, v13);

LABEL_12:
    v14 = [v4 objectForKeyedSubscript:@"per"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SKProductSubscriptionPeriod alloc] initWithISO8601String:v14];
      id internal = v5->_internal;
      v17 = (void *)internal[4];
      internal[4] = v15;
    }
    v18 = [v4 objectForKeyedSubscript:@"per-count"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *((void *)v5->_internal + 5) = [v18 unsignedIntegerValue];
    }
    v19 = [v4 objectForKeyedSubscript:@"mod"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v19;
      if ([(SKProductDiscount *)v20 isEqualToString:@"FreeTrial"])
      {
        uint64_t v21 = 2;
      }
      else if ([(SKProductDiscount *)v20 isEqualToString:@"PayUpFront"])
      {
        uint64_t v21 = 1;
      }
      else
      {
        if (![(SKProductDiscount *)v20 isEqualToString:@"PayAsYouGo"])
        {
          v22 = v5;
          goto LABEL_29;
        }
        uint64_t v21 = 0;
      }
      *((void *)v5->_internal + 3) = v21;
    }
    v22 = (SKProductDiscount *)v5->_internal;
    if (v22->_internal && *((void *)v5->_internal + 4))
    {
      uint64_t v23 = *((void *)v5->_internal + 5);

      if (v23)
      {
LABEL_31:

        goto LABEL_32;
      }
LABEL_30:

      v5 = 0;
      goto LABEL_31;
    }
    v20 = v5;
LABEL_29:

    v5 = v20;
    goto LABEL_30;
  }
LABEL_32:

  return v5;
}

- (SKProductDiscount)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v6 = [(SKProductDiscount *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    *((void *)v6->_internal + 5) = xpc_dictionary_get_uint64(v5, "0");
    *((void *)v6->_internal + 3) = xpc_dictionary_get_uint64(v5, "1");
    id v8 = [SKProductSubscriptionPeriod alloc];
    v9 = xpc_dictionary_get_dictionary(v5, "4");
    id v10 = [(SKProductSubscriptionPeriod *)v8 initWithXPCEncoding:v9];
    id internal = v6->_internal;
    v12 = (void *)internal[4];
    internal[4] = v10;

    objc_opt_class();
    CFDictionaryRef v13 = sub_10010B0C0(v5, "5");
    v14 = v6->_internal;
    v15 = (void *)v14[7];
    v14[7] = v13;

    *((void *)v6->_internal + 6) = xpc_dictionary_get_uint64(v5, "6");
    CFDictionaryRef v16 = sub_10010B088(v5, "2");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self = v16;
      if (!self) {
        goto LABEL_17;
      }
LABEL_12:
      id v19 = [objc_alloc((Class)NSDecimalNumberHandler) initWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
      uint64_t v20 = [(SKProductDiscount *)self decimalNumberByRoundingAccordingToBehavior:v19];
      uint64_t v21 = (void *)v20;
      if (v20) {
        v22 = (SKProductDiscount *)v20;
      }
      else {
        v22 = self;
      }
      objc_storeStrong((id *)v6->_internal + 1, v22);

      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = objc_alloc((Class)NSDecimalNumber);
      v18 = [(__CFDictionary *)v16 stringValue];
      self = (SKProductDiscount *)[v17 initWithString:v18];

      if (self) {
        goto LABEL_12;
      }
    }
    else
    {
      self = 0;
    }
LABEL_17:

    goto LABEL_4;
  }
  uint64_t v6 = 0;
LABEL_4:

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "0", *((void *)self->_internal + 5));
  xpc_dictionary_set_uint64(v3, "1", *((void *)self->_internal + 3));
  sub_10010B10C(v3, "2", *((__CFString **)self->_internal + 1));
  id v4 = [*((id *)self->_internal + 4) copyXPCEncoding];
  xpc_dictionary_set_value(v3, "4", v4);

  sub_10010B10C(v3, "5", *((__CFString **)self->_internal + 7));
  xpc_dictionary_set_uint64(v3, "6", *((void *)self->_internal + 6));
  return v3;
}

- (void).cxx_destruct
{
}

@end