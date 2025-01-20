@interface RideBookingCurrencyAmount
+ (id)_currencySymbolForCode:(id)a3;
+ (id)_localeForCode:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)currencySymbol;
- (NSString)formattedString;
- (RideBookingCurrencyAmount)initWithAmount:(id)a3 currencyCode:(id)a4;
- (id)formattedStringIncludeSymbol:(BOOL)a3;
@end

@implementation RideBookingCurrencyAmount

- (RideBookingCurrencyAmount)initWithAmount:(id)a3 currencyCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RideBookingCurrencyAmount;
  v8 = [(RideBookingCurrencyAmount *)&v14 init];
  if (v8)
  {
    v9 = (NSDecimalNumber *)[v6 copy];
    amount = v8->_amount;
    v8->_amount = v9;

    v11 = (NSString *)[v7 copy];
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = v11;
  }
  return v8;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

- (NSString)formattedString
{
  return (NSString *)[(RideBookingCurrencyAmount *)self formattedStringIncludeSymbol:1];
}

- (id)formattedStringIncludeSymbol:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(RideBookingCurrencyAmount *)self amount];
  if (v5
    && (id v6 = (void *)v5,
        [(RideBookingCurrencyAmount *)self currencyCode],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    if (qword_101610238 != -1) {
      dispatch_once(&qword_101610238, &stru_1013126E0);
    }
    v8 = [(RideBookingCurrencyAmount *)self currencyCode];
    [(id)qword_101610230 setCurrencyCode:v8];

    if (v3) {
      CFStringRef v9 = 0;
    }
    else {
      CFStringRef v9 = &stru_101324E70;
    }
    [(id)qword_101610230 setCurrencySymbol:v9];
    v11 = (void *)qword_101610230;
    v12 = [(RideBookingCurrencyAmount *)self amount];
    v10 = [v11 stringFromNumber:v12];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)currencySymbol
{
  v2 = [(RideBookingCurrencyAmount *)self currencyCode];
  BOOL v3 = +[RideBookingCurrencyAmount _currencySymbolForCode:v2];

  return (NSString *)v3;
}

+ (id)_localeForCode:(id)a3
{
  id v3 = a3;
  +[NSLocale availableLocaleIdentifiers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_alloc((Class)NSLocale);
        id v11 = [v10 initWithLocaleIdentifier:v9];
        v12 = [v11 objectForKey:NSLocaleCurrencyCode];
        if ([v12 isEqualToString:v3])
        {

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

+ (id)_currencySymbolForCode:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSNumberFormatter);
  id v6 = [a1 _localeForCode:v4];

  if (v6)
  {
    [v5 setLocale:v6];
    [v5 setNumberStyle:2];
    uint64_t v7 = [v5 currencySymbol];
    if ((unint64_t)[v7 length] >= 2)
    {
      uint64_t v8 = [v7 substringToIndex:1];

      uint64_t v7 = (void *)v8;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end