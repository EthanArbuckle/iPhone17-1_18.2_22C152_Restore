@interface MicroPaymentProduct
+ (id)periodFromISO8601String:(id)a3;
- (BOOL)isHosted;
- (MicroPaymentProduct)initWithDictionary:(id)a3;
- (MicroPaymentProductDiscount)introductoryPrice;
- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod;
- (NSArray)discounts;
- (NSNumber)price;
- (NSString)contentVersion;
- (NSString)localeIdentifier;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)productIdentifier;
- (NSString)subscriptionGroupIdentifier;
- (id)copyProduct;
- (int64_t)contentSize;
- (void)dealloc;
- (void)setContentSize:(int64_t)a3;
- (void)setContentVersion:(id)a3;
- (void)setDiscounts:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setIntroductoryPrice:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPrice:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setSubscriptionGroupIdentifier:(id)a3;
- (void)setSubscriptionPeriod:(id)a3;
@end

@implementation MicroPaymentProduct

- (MicroPaymentProduct)initWithDictionary:(id)a3
{
  v4 = [(MicroPaymentProduct *)self init];
  if (v4)
  {
    id v5 = [a3 objectForKey:@"icu-locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MicroPaymentProduct *)v4 setLocaleIdentifier:v5];
    }
    id v6 = [a3 objectForKey:@"description"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MicroPaymentProduct *)v4 setLocalizedDescription:v6];
    }
    id v7 = [a3 objectForKey:@"is-hosted"];
    if (objc_opt_respondsToSelector()) {
      -[MicroPaymentProduct setHosted:](v4, "setHosted:", [v7 BOOLValue]);
    }
    id v8 = [a3 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MicroPaymentProduct *)v4 setLocalizedTitle:v8];
    }
    id v9 = [a3 objectForKey:@"offerName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MicroPaymentProduct *)v4 setProductIdentifier:v9];
    }
    id v10 = [a3 objectForKey:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MicroPaymentProduct *)v4 setContentVersion:v10];
    }
    id v11 = [a3 objectForKey:@"subscriptionFamilyId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MicroPaymentProduct *)v4 setSubscriptionGroupIdentifier:v11];
    }
    id v12 = [a3 objectForKey:@"recurringSubscriptionPeriod"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MicroPaymentProduct setSubscriptionPeriod:](v4, "setSubscriptionPeriod:", [(id)objc_opt_class() periodFromISO8601String:v12]);
    }
    id v13 = [a3 objectForKey:SSItemProtocolKeyStoreOffers];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v13 objectForKey:@"STDQ"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [v14 objectForKey:@"price"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(MicroPaymentProduct *)v4 setPrice:v15];
        }
        id v16 = [v14 objectForKey:@"size"];
        if (objc_opt_respondsToSelector()) {
          -[MicroPaymentProduct setContentSize:](v4, "setContentSize:", [v16 longLongValue]);
        }
      }
    }
    id v17 = [a3 objectForKey:@"discounts"];
    v18 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v19 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v17);
          }
          v23 = [[MicroPaymentProductDiscount alloc] initWithDictionary:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if ([(MicroPaymentProductDiscount *)v23 type])
          {
            if ((id)[(MicroPaymentProductDiscount *)v23 type] == (id)1) {
              [v18 addObject:v23];
            }
          }
          else
          {
            [(MicroPaymentProduct *)v4 setIntroductoryPrice:v23];
          }
        }
        id v20 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v20);
    }
    [(MicroPaymentProduct *)v4 setDiscounts:+[NSArray arrayWithArray:v18]];

    if (!v4->_productIdentifier || !v4->_localeIdentifier || !v4->_price)
    {
      id v24 = +[SSLogConfig sharedDaemonConfig];
      if (!v24) {
        id v24 = +[SSLogConfig sharedConfig];
      }
      unsigned int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v26 &= 2u;
      }
      if (v26)
      {
        uint64_t v27 = objc_opt_class();
        int v36 = 138412290;
        uint64_t v37 = v27;
        LODWORD(v31) = 12;
        uint64_t v28 = _os_log_send_and_compose_impl();
        if (v28)
        {
          v29 = (void *)v28;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v36, v31);
          free(v29);
          SSFileLog();
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MicroPaymentProduct;
  [(MicroPaymentProduct *)&v3 dealloc];
}

- (id)copyProduct
{
  id v3 = objc_alloc_init((Class)sub_100174E24());
  v4 = [(MicroPaymentProduct *)self price];
  if ([(MicroPaymentProduct *)self isHosted])
  {
    objc_msgSend(v3, "_setContentVersion:", -[MicroPaymentProduct contentVersion](self, "contentVersion"));
    [v3 _setDownloadable:1];
    objc_msgSend(v3, "_setDownloadContentLengths:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[MicroPaymentProduct contentSize](self, "contentSize"))));
  }
  objc_msgSend(v3, "_setLocaleIdentifier:", -[MicroPaymentProduct localeIdentifier](self, "localeIdentifier"));
  objc_msgSend(v3, "_setLocalizedDescription:", -[MicroPaymentProduct localizedDescription](self, "localizedDescription"));
  objc_msgSend(v3, "_setLocalizedTitle:", -[MicroPaymentProduct localizedTitle](self, "localizedTitle"));
  objc_msgSend(v3, "_setPrice:", +[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", -[NSNumber stringValue](v4, "stringValue")));
  objc_msgSend(v3, "_setProductIdentifier:", -[MicroPaymentProduct productIdentifier](self, "productIdentifier"));
  objc_msgSend(v3, "_setSubscriptionGroupIdentifier:", -[MicroPaymentProduct subscriptionGroupIdentifier](self, "subscriptionGroupIdentifier"));
  id v5 = objc_alloc_init((Class)sub_100174E18());
  objc_msgSend(v5, "_setUnit:", -[MicroPaymentProductSubscriptionPeriod unit](self->_subscriptionPeriod, "unit"));
  objc_msgSend(v5, "_setNumberOfUnits:", -[MicroPaymentProductSubscriptionPeriod numberOfUnits](-[MicroPaymentProduct subscriptionPeriod](self, "subscriptionPeriod"), "numberOfUnits"));
  [v3 _setSubscriptionPeriod:v5];
  objc_msgSend(v3, "_setIntroductoryPrice:", -[MicroPaymentProductDiscount copyProductDiscount](-[MicroPaymentProduct introductoryPrice](self, "introductoryPrice"), "copyProductDiscount"));
  id v6 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(MicroPaymentProduct *)self discounts];
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "copyProductDiscount"));
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  objc_msgSend(v3, "_setDiscounts:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));

  return v3;
}

+ (id)periodFromISO8601String:(id)a3
{
  id v3 = +[NSScanner scannerWithString:a3];
  id v8 = 0;
  [(NSScanner *)v3 scanString:@"P" intoString:&v8];
  if (!v8) {
    return 0;
  }
  uint64_t v7 = 0;
  [(NSScanner *)v3 scanInteger:&v7];
  if (!v7) {
    return 0;
  }
  id v8 = 0;
  [(NSScanner *)v3 scanCharactersFromSet:+[NSCharacterSet characterSetWithCharactersInString:@"DWMY"] intoString:&v8];
  if (!v8 || [v8 length] != (id)1) {
    return 0;
  }
  if (([v8 isEqualToString:@"D"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"W"])
    {
      uint64_t v4 = 1;
      goto LABEL_13;
    }
    if ([v8 isEqualToString:@"M"])
    {
      uint64_t v4 = 2;
      goto LABEL_13;
    }
    if ([v8 isEqualToString:@"Y"])
    {
      uint64_t v4 = 3;
      goto LABEL_13;
    }
    return 0;
  }
  uint64_t v4 = 0;
LABEL_13:
  id v5 = (id)objc_opt_new();
  [v5 setNumberOfUnits:v7];
  [v5 setUnit:v4];
  return v5;
}

- (int64_t)contentSize
{
  return self->_contentSize;
}

- (void)setContentSize:(int64_t)a3
{
  self->_contentSize = a3;
}

- (NSString)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_hosted = a3;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSArray)discounts
{
  return self->_discounts;
}

- (void)setDiscounts:(id)a3
{
}

- (MicroPaymentProductDiscount)introductoryPrice
{
  return self->_introductoryPrice;
}

- (void)setIntroductoryPrice:(id)a3
{
}

- (NSString)subscriptionGroupIdentifier
{
  return self->_subscriptionGroupIdentifier;
}

- (void)setSubscriptionGroupIdentifier:(id)a3
{
}

- (MicroPaymentProductSubscriptionPeriod)subscriptionPeriod
{
  return self->_subscriptionPeriod;
}

- (void)setSubscriptionPeriod:(id)a3
{
}

@end