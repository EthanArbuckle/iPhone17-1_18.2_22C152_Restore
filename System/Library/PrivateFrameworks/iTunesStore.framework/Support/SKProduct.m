@interface SKProduct
+ (id)productsFromDictionaries:(id)a3;
+ (id)productsFromXPCEncodingsArray:(id)a3;
- (BOOL)downloadable;
- (BOOL)isDownloadable;
- (NSArray)contentLengths;
- (NSArray)discounts;
- (NSArray)downloadContentLengths;
- (NSDecimalNumber)price;
- (NSLocale)priceLocale;
- (NSString)_localeIdentifier;
- (NSString)contentVersion;
- (NSString)downloadContentVersion;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)productIdentifier;
- (NSString)subscriptionGroupIdentifier;
- (SKProduct)init;
- (SKProduct)initWithDictionary:(id)a3;
- (SKProduct)initWithXPCEncoding:(id)a3;
- (SKProductDiscount)introductoryPrice;
- (SKProductSubscriptionPeriod)subscriptionPeriod;
- (id)copyXPCEncoding;
- (id)initMinusLocaleWithDictionary:(id)a3;
- (id)initMinusLocaleWithXPCEncoding:(id)a3;
- (void)_setContentVersion:(id)a3;
- (void)_setDiscounts:(id)a3;
- (void)_setDownloadContentLengths:(id)a3;
- (void)_setDownloadable:(BOOL)a3;
- (void)_setIntroductoryPrice:(id)a3;
- (void)_setLocale:(id)a3;
- (void)_setLocaleIdentifier:(id)a3;
- (void)_setLocalizedDescription:(id)a3;
- (void)_setLocalizedTitle:(id)a3;
- (void)_setPrice:(id)a3;
- (void)_setPriceLocale:(id)a3;
- (void)_setProductIdentifier:(id)a3;
- (void)_setSubscriptionGroupIdentifier:(id)a3;
- (void)_setSubscriptionPeriod:(id)a3;
@end

@implementation SKProduct

- (SKProduct)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProduct;
  v2 = [(SKProduct *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

+ (id)productsFromDictionaries:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [[SKProduct alloc] initMinusLocaleWithDictionary:v10];
        v12 = [v10 objectForKeyedSubscript:@"loc"];
        if (!v12
          || ([v4 objectForKeyedSubscript:v12],
              (v13 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v14 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v12];
          v13 = v14;
          if (v12 && v14 != 0) {
            [v4 setObject:v14 forKeyedSubscript:v12];
          }
        }
        [v11 _setLocale:v13];
        v16 = [v11 introductoryPrice];
        [v16 _setPriceLocale:v13];

        [v5 addObject:v11];
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  id v17 = [v5 copy];

  return v17;
}

- (id)initMinusLocaleWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProduct *)self init];
  if (!v5) {
    goto LABEL_35;
  }
  id v6 = [v4 objectForKey:@"desc"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)v5->_internal + 6, v6);
  }
  id v7 = [v4 objectForKey:@"name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)v5->_internal + 7, v7);
  }
  uint64_t v8 = [v4 objectForKey:@"id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)v5->_internal + 10, v8);
  }
  v9 = [v4 objectForKey:@"pri"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = 0;
      goto LABEL_18;
    }
    id v11 = objc_alloc((Class)NSDecimalNumber);
    v12 = [v9 stringValue];
    id v10 = [v11 initWithString:v12];

    if (!v10) {
      goto LABEL_18;
    }
LABEL_13:
    id v13 = [objc_alloc((Class)NSDecimalNumberHandler) initWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    uint64_t v14 = [v10 decimalNumberByRoundingAccordingToBehavior:v13];
    v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = v10;
    }
    objc_storeStrong((id *)v5->_internal + 8, v16);

    goto LABEL_18;
  }
  id v10 = v9;
  if (v10) {
    goto LABEL_13;
  }
LABEL_18:
  id v17 = [v4 objectForKey:@"is-hosted"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 BOOLValue])
  {
    *((unsigned char *)v5->_internal + 16) = 1;
    v18 = [v4 objectForKey:@"hosted-version"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)v5->_internal + 1, v18);
    }
    id v17 = [v4 objectForKey:@"hosted-content-length"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = v17;
      uint64_t v19 = +[NSArray arrayWithObjects:&v34 count:1];
      id internal = v5->_internal;
      long long v21 = (void *)internal[3];
      internal[3] = v19;
    }
  }
  else
  {
    *((unsigned char *)v5->_internal + 16) = 0;
  }
  long long v22 = [v4 objectForKeyedSubscript:@"disc"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    long long v22 = v23;
    if ([v23 count])
    {
      long long v22 = [v23 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [[SKProductDiscount alloc] initWithDictionary:v22];
        v25 = v5->_internal;
        v26 = (void *)v25[4];
        v25[4] = v24;
        v27 = v24;
      }
    }
  }
  v28 = [v4 objectForKey:@"subscriptionFamilyId"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)v5->_internal + 11, v28);
  }
  v29 = [v4 objectForKeyedSubscript:@"per"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [[SKProductSubscriptionPeriod alloc] initWithISO8601String:v29];
    v31 = v5->_internal;
    v32 = (void *)v31[12];
    v31[12] = v30;
  }
LABEL_35:

  return v5;
}

- (SKProduct)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProduct *)self initMinusLocaleWithDictionary:v4];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"loc"];
    id v7 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v6];
    [(SKProduct *)v5 _setLocale:v7];
    uint64_t v8 = [(SKProduct *)v5 introductoryPrice];
    [v8 _setPriceLocale:v7];
  }
  return v5;
}

- (NSArray)contentLengths
{
  return [(SKProduct *)self downloadContentLengths];
}

- (NSString)contentVersion
{
  return [(SKProduct *)self downloadContentVersion];
}

- (NSArray)downloadContentLengths
{
  return (NSArray *)*((id *)self->_internal + 3);
}

- (NSString)downloadContentVersion
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (BOOL)isDownloadable
{
  return *((unsigned char *)self->_internal + 16);
}

- (BOOL)downloadable
{
  return *((unsigned char *)self->_internal + 16);
}

- (SKProductDiscount)introductoryPrice
{
  return (SKProductDiscount *)*((id *)self->_internal + 4);
}

- (NSString)localizedDescription
{
  return (NSString *)*((id *)self->_internal + 6);
}

- (NSString)localizedTitle
{
  return (NSString *)*((id *)self->_internal + 7);
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 8);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 9);
}

- (NSString)productIdentifier
{
  return (NSString *)*((id *)self->_internal + 10);
}

- (NSString)subscriptionGroupIdentifier
{
  return (NSString *)*((id *)self->_internal + 11);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 12);
}

- (NSArray)discounts
{
  return (NSArray *)*((id *)self->_internal + 13);
}

- (NSString)_localeIdentifier
{
  return (NSString *)*((id *)self->_internal + 5);
}

- (void)_setContentVersion:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[1];
    internal[1] = v5;
  }
}

- (void)_setDownloadContentLengths:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[3] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[3];
    internal[3] = v5;
  }
}

- (void)_setDownloadable:(BOOL)a3
{
  *((unsigned char *)self->_internal + 16) = a3;
}

- (void)_setIntroductoryPrice:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 4);
  id v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  _objc_release_x1(v7, v5);
}

- (void)_setLocale:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[9];
    internal[9] = v5;
  }
}

- (void)_setLocaleIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[5] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[5];
    internal[5] = v5;
  }
}

- (void)_setLocalizedDescription:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[6];
    internal[6] = v5;
  }
}

- (void)_setLocalizedTitle:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[7] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[7];
    internal[7] = v5;
  }
}

- (void)_setPrice:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 8);
  id v7 = (id *)(internal + 64);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  _objc_release_x1(v7, v5);
}

- (void)_setPriceLocale:(id)a3
{
  id v6 = a3;
  id v5 = (id *)self->_internal;
  if (v5[9] != v6) {
    objc_storeStrong(v5 + 9, a3);
  }
  [v5[4] _setPriceLocale:v6];
}

- (void)_setProductIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[10] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[10];
    internal[10] = v5;
  }
}

- (void)_setSubscriptionGroupIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[11] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[11];
    internal[11] = v5;
  }
}

- (void)_setSubscriptionPeriod:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 12);
  id v7 = (id *)(internal + 96);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  _objc_release_x1(v7, v5);
}

- (void)_setDiscounts:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  uint64_t v6 = internal[13];
  internal[13] = v4;

  _objc_release_x1(v4, v6);
}

+ (id)productsFromXPCEncodingsArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_array)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100049A8C;
    id v13 = &unk_1003A41C8;
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = v6;
    id v7 = v6;
    id v8 = v14;
    xpc_array_apply(v4, &v10);
    id v5 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)initMinusLocaleWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v8 = [(SKProduct *)self init];
    id v6 = v8;
    if (!v8) {
      goto LABEL_4;
    }
    id v9 = v8->_internal;
    objc_opt_class();
    CFDictionaryRef v10 = sub_10010B0C0(v5, "0");
    uint64_t v11 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v10;

    *((unsigned char *)v9 + 16) = xpc_dictionary_get_BOOL(v5, "2");
    objc_opt_class();
    CFDictionaryRef v12 = sub_10010B0C0(v5, "3");
    id v13 = (void *)*((void *)v9 + 3);
    *((void *)v9 + 3) = v12;

    objc_opt_class();
    CFDictionaryRef v14 = sub_10010B0C0(v5, "5");
    id v15 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v14;

    objc_opt_class();
    CFDictionaryRef v16 = sub_10010B0C0(v5, "1");
    id v17 = (void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v16;

    objc_opt_class();
    CFDictionaryRef v18 = sub_10010B0C0(v5, "7");
    uint64_t v19 = (void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v18;

    objc_opt_class();
    CFDictionaryRef v20 = sub_10010B0C0(v5, "4");
    long long v21 = (void *)*((void *)v9 + 10);
    *((void *)v9 + 10) = v20;

    long long v22 = [SKProductSubscriptionPeriod alloc];
    id v23 = xpc_dictionary_get_dictionary(v5, "8");
    v24 = [(SKProductSubscriptionPeriod *)v22 initWithXPCEncoding:v23];
    v25 = (void *)*((void *)v9 + 12);
    *((void *)v9 + 12) = v24;

    v26 = [SKProductDiscount alloc];
    v27 = xpc_dictionary_get_dictionary(v5, "9");
    v28 = [(SKProductDiscount *)v26 initWithXPCEncoding:v27];
    v29 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = v28;

    objc_opt_class();
    CFDictionaryRef v30 = sub_10010B0C0(v5, "10");
    v31 = (void *)*((void *)v9 + 11);
    *((void *)v9 + 11) = v30;

    v32 = objc_opt_new();
    v33 = xpc_dictionary_get_array(v5, "11");
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100049F6C;
    applier[3] = &unk_1003A4180;
    id v34 = v32;
    id v44 = v34;
    xpc_array_apply(v33, applier);
    CFDictionaryRef v35 = sub_10010B088(v5, "6");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFDictionaryRef v36 = v35;
      if (!v36) {
        goto LABEL_16;
      }
LABEL_11:
      id v39 = [objc_alloc((Class)NSDecimalNumberHandler) initWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
      uint64_t v40 = [(__CFDictionary *)v36 decimalNumberByRoundingAccordingToBehavior:v39];
      v41 = (void *)v40;
      if (v40) {
        v42 = (void *)v40;
      }
      else {
        v42 = v36;
      }
      objc_storeStrong((id *)v9 + 8, v42);

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v37 = objc_alloc((Class)NSDecimalNumber);
      v38 = [(__CFDictionary *)v35 stringValue];
      CFDictionaryRef v36 = (const __CFDictionary *)[v37 initWithString:v38];

      if (v36) {
        goto LABEL_11;
      }
    }
    else
    {
      CFDictionaryRef v36 = 0;
    }
LABEL_16:

    goto LABEL_4;
  }

  id v6 = 0;
LABEL_4:

  return v6;
}

- (SKProduct)initWithXPCEncoding:(id)a3
{
  id v3 = [(SKProduct *)self initMinusLocaleWithXPCEncoding:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [(SKProduct *)v3 _localeIdentifier];
    id v6 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v5];
    [(SKProduct *)v4 _setPriceLocale:v6];
    [(SKProduct *)v4 _setLocaleIdentifier:0];
  }
  return v4;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = self->_internal;
  sub_10010B10C(v3, "0", *((__CFString **)v4 + 1));
  sub_10010B10C(v3, "1", *((__CFString **)v4 + 6));
  xpc_dictionary_set_BOOL(v3, "2", *((unsigned char *)v4 + 16));
  sub_10010B10C(v3, "3", *((__CFString **)v4 + 3));
  sub_10010B10C(v3, "4", *((__CFString **)v4 + 10));
  sub_10010B10C(v3, "5", *((__CFString **)v4 + 5));
  sub_10010B10C(v3, "6", *((__CFString **)v4 + 8));
  sub_10010B10C(v3, "7", *((__CFString **)v4 + 7));
  sub_10010B10C(v3, "10", *((__CFString **)v4 + 11));
  id v5 = [*((id *)v4 + 12) copyXPCEncoding];
  if (v5) {
    xpc_dictionary_set_value(v3, "8", v5);
  }
  id v6 = [*((id *)v4 + 4) copyXPCEncoding];
  if (v6) {
    xpc_dictionary_set_value(v3, "9", v6);
  }
  xpc_object_t v7 = xpc_array_create(0, 0);
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *((id *)v4 + 13);
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        CFDictionaryRef v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "copyXPCEncoding", (void)v15);
          if (v13) {
            xpc_array_append_value(v7, v13);
          }

          CFDictionaryRef v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    xpc_dictionary_set_value(v3, "11", v7);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end