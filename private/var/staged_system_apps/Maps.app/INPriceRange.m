@interface INPriceRange
+ (id)formattedStringForPriceValueWithAmount:(id)a3 currencyCode:(id)a4 showsCurrencySymbol:(BOOL)a5;
- (BOOL)_shouldCurrencySymbolGoAfterPrice;
- (NSString)_maps_formattedStringWithDefaultShortFormatStrings;
@end

@implementation INPriceRange

+ (id)formattedStringForPriceValueWithAmount:(id)a3 currencyCode:(id)a4 showsCurrencySymbol:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  if (![v7 isEqualToString:@"CNY"])
  {
    if (qword_10160EE40 != -1) {
      dispatch_once(&qword_10160EE40, &stru_1012EC578);
    }
    id v12 = (id)qword_10160EE38;
    [v12 setCurrencyCode:v7];
    if (v5) {
      CFStringRef v13 = 0;
    }
    else {
      CFStringRef v13 = &stru_101324E70;
    }
    [v12 setCurrencySymbol:v13];
    v10 = [v12 stringFromNumber:v8];

    goto LABEL_16;
  }
  if (qword_10160EE30 != -1) {
    dispatch_once(&qword_10160EE30, &stru_1012EC558);
  }
  if (v5) {
    CFStringRef v9 = 0;
  }
  else {
    CFStringRef v9 = &stru_101324E70;
  }
  [(id)qword_10160EE28 setCurrencySymbol:v9];
  v10 = [(id)qword_10160EE28 stringFromNumber:v8];

  if (v5)
  {
    uint64_t v15 = 0;
    id v8 = +[NSRegularExpression regularExpressionWithPattern:@"([￥¥])(\\s*)" options:0 error:&v15];
    if (!v15)
    {
      uint64_t v11 = [v8 stringByReplacingMatchesInString:v10 options:0 range:NSMakeRange([v10 length], 0) withTemplate:@"⁠¥"];

      v10 = (void *)v11;
    }
LABEL_16:
  }

  return v10;
}

- (BOOL)_shouldCurrencySymbolGoAfterPrice
{
  v3 = [(INPriceRange *)self minimumPrice];

  if (v3)
  {
    v4 = +[NSLocale autoupdatingCurrentLocale];
    BOOL v5 = [(INPriceRange *)self currencyCode];
    v6 = [v4 displayNameForKey:NSLocaleCurrencySymbol value:v5];

    if (qword_10160EE40 != -1) {
      dispatch_once(&qword_10160EE40, &stru_1012EC578);
    }
    id v7 = (id)qword_10160EE38;
    id v8 = [(INPriceRange *)self minimumPrice];
    CFStringRef v9 = [v7 stringFromNumber:v8];

    LOBYTE(v8) = [v9 hasSuffix:v6];
    return (char)v8;
  }
  else
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/Shared/Rides/INPriceRange+MapsAdditions.m");
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"Self.minimumPrice should not be nil"];
      int v14 = 136315394;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
}

- (NSString)_maps_formattedStringWithDefaultShortFormatStrings
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"%@ [Ridesharing price range]" value:@"localized string not found" table:0];

  BOOL v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"%@-%@ [Ridesharing price range]" value:@"localized string not found" table:0];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Up to %@ [Ridesharing price range]" value:@"localized string not found" table:0];

  CFStringRef v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"From %@ [Ridesharing price range]" value:@"localized string not found" table:0];

  uint64_t v11 = [(INPriceRange *)self minimumPrice];
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [(INPriceRange *)self maximumPrice];

    if (v13)
    {
      v42 = v6;
      int v14 = [(INPriceRange *)self minimumPrice];
      uint64_t v15 = [(INPriceRange *)self maximumPrice];
      unsigned int v16 = [v14 isEqual:v15];

      if (v16)
      {
        id v17 = objc_alloc((Class)NSString);
        v18 = objc_opt_class();
        v19 = [(INPriceRange *)self minimumPrice];
        v20 = [(INPriceRange *)self currencyCode];
        v21 = [v18 formattedStringForPriceValueWithAmount:v19 currencyCode:v20 showsCurrencySymbol:1];
        v22 = [v17 initWithFormat:v4, v21];
        v6 = v42;
      }
      else
      {
        BOOL v30 = [(INPriceRange *)self _shouldCurrencySymbolGoAfterPrice];
        id v40 = objc_alloc((Class)NSString);
        v31 = objc_opt_class();
        v19 = [(INPriceRange *)self minimumPrice];
        v20 = [(INPriceRange *)self currencyCode];
        v21 = [v31 formattedStringForPriceValueWithAmount:v19 currencyCode:v20 showsCurrencySymbol:v30 ^ 1];
        v41 = v10;
        v32 = v8;
        v33 = v4;
        uint64_t v34 = objc_opt_class();
        v35 = [(INPriceRange *)self maximumPrice];
        v36 = [(INPriceRange *)self currencyCode];
        v37 = (void *)v34;
        v4 = v33;
        v38 = [v37 formattedStringForPriceValueWithAmount:v35 currencyCode:v36 showsCurrencySymbol:v30];
        v22 = [v40 initWithFormat:v42, v21, v38];

        v6 = v42;
        id v8 = v32;
        v10 = v41;
      }
      goto LABEL_11;
    }
  }
  v23 = [(INPriceRange *)self minimumPrice];

  if (v23)
  {
    id v24 = objc_alloc((Class)NSString);
    v25 = objc_opt_class();
    v19 = [(INPriceRange *)self minimumPrice];
    v20 = [(INPriceRange *)self currencyCode];
    v21 = [v25 formattedStringForPriceValueWithAmount:v19 currencyCode:v20 showsCurrencySymbol:1];
    v26 = [v24 initWithFormat:v10, v21];
LABEL_9:
    v22 = v26;
LABEL_11:

    goto LABEL_12;
  }
  v27 = [(INPriceRange *)self maximumPrice];

  if (v27)
  {
    id v28 = objc_alloc((Class)NSString);
    v29 = objc_opt_class();
    v19 = [(INPriceRange *)self maximumPrice];
    v20 = [(INPriceRange *)self currencyCode];
    v21 = [v29 formattedStringForPriceValueWithAmount:v19 currencyCode:v20 showsCurrencySymbol:1];
    v26 = [v28 initWithFormat:v8 v21];
    goto LABEL_9;
  }
  v22 = &stru_101324E70;
LABEL_12:

  return (NSString *)v22;
}

@end