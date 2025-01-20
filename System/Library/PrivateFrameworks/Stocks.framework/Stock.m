@interface Stock
+ (id)BlankValueString;
+ (id)_potentiallyAbsentKeys;
+ (id)listNameOverridesBySymbol;
+ (id)localizedMagnitudeAbbreviatedStringWithString:(id)a3;
+ (id)localizedMagnitudeAbbreviatedStringWithString:(id)a3 fractionDigits:(unsigned int)a4;
+ (id)postfixCharacterForMagnitude:(unsigned int)a3 unitMagnitude:(unsigned int *)a4;
+ (id)symbolForURL:(id)a3;
+ (id)urlForStock:(id)a3;
+ (id)urlForStockSymbol:(id)a3;
- (BOOL)changeIsNegative;
- (BOOL)changeIsZero;
- (BOOL)doesMetadataNeedUpdate;
- (BOOL)doesQuoteNeedUpdate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndex;
- (BOOL)isMetadataStale;
- (BOOL)isQuoteStale;
- (BOOL)isTransient;
- (BOOL)marketIsOpen;
- (BOOL)shouldUseCompanyNameAsListName:(unint64_t)a3;
- (Exchange)exchange;
- (NSString)averageVolume;
- (NSString)change;
- (NSString)companyName;
- (NSString)currency;
- (NSString)dividendYield;
- (NSString)formattedChange;
- (NSString)formattedChangePercent;
- (NSString)formattedPrice;
- (NSString)high;
- (NSString)low;
- (NSString)marketStatusDescription;
- (NSString)marketcap;
- (NSString)open;
- (NSString)peRatio;
- (NSString)price;
- (NSString)shortCompanyName;
- (NSString)symbol;
- (NSString)symbolType;
- (NSString)volume;
- (NSString)yearHigh;
- (NSString)yearLow;
- (NSURL)infoURL;
- (Stock)initWithDictionary:(id)a3;
- (StockDataSource)dataSource;
- (double)_updateInterval;
- (double)timeMetadataLastUpdated;
- (double)timeQuoteLastUpdated;
- (id)archiveDictionary;
- (id)chartDataForInterval:(int64_t)a3;
- (id)description;
- (id)formattedChangePercent:(BOOL)a3;
- (id)formattedPriceDroppingFractionDigitsIfLengthExceeds:(unint64_t)a3;
- (id)listName;
- (id)listNameOverride;
- (id)listNameWithMaxIndexNameLength:(unint64_t)a3;
- (unint64_t)hash;
- (unsigned)pricePrecision;
- (void)_updatePricePrecision;
- (void)dealloc;
- (void)populateFromDictionary:(id)a3;
- (void)setAverageVolume:(id)a3;
- (void)setChange:(id)a3;
- (void)setChartData:(id)a3 forInterval:(int64_t)a4;
- (void)setCompanyName:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDividendYield:(id)a3;
- (void)setExchange:(id)a3;
- (void)setHigh:(id)a3;
- (void)setInfoURL:(id)a3;
- (void)setLow:(id)a3;
- (void)setMarketcap:(id)a3;
- (void)setOpen:(id)a3;
- (void)setPeRatio:(id)a3;
- (void)setPrice:(id)a3;
- (void)setShortCompanyName:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setSymbolType:(id)a3;
- (void)setTimeMetadataLastUpdated:(double)a3;
- (void)setTimeQuoteLastUpdated:(double)a3;
- (void)setTransient:(BOOL)a3;
- (void)setVolume:(id)a3;
- (void)setYearHigh:(id)a3;
- (void)setYearLow:(id)a3;
- (void)updateMetadataWithDictionary:(id)a3 forTime:(double)a4;
- (void)updateQuoteWithDictionary:(id)a3 forTime:(double)a4;
@end

@implementation Stock

+ (id)urlForStockSymbol:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v8 = @"symbol";
    v9[0] = a3;
    v3 = NSDictionary;
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v6 = +[StocksOpenURLHelper URLForStockComponents:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)urlForStock:(id)a3
{
  id v4 = [a3 symbol];
  v5 = [a1 urlForStockSymbol:v4];

  return v5;
}

+ (id)symbolForURL:(id)a3
{
  v3 = +[StocksOpenURLHelper componentDictionaryFromURL:a3];
  id v4 = [v3 objectForKey:@"symbol"];

  return v4;
}

+ (id)BlankValueString
{
  v2 = (void *)BlankValueString_blankValueString;
  if (!BlankValueString_blankValueString)
  {
    uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 8212);
    id v4 = (void *)BlankValueString_blankValueString;
    BlankValueString_blankValueString = v3;

    v2 = (void *)BlankValueString_blankValueString;
  }

  return v2;
}

+ (id)postfixCharacterForMagnitude:(unsigned int)a3 unitMagnitude:(unsigned int *)a4
{
  *a4 = 0;
  if (a3 >= 0xC) {
    unsigned int v4 = 12;
  }
  else {
    unsigned int v4 = a3;
  }
  if (v4 >= 3)
  {
    v6 = +[StocksBundles getBundle:1];
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"MAGNITUDE_POSTFIX_%u", v4 + 1);
    v8 = [v6 localizedStringForKey:v7 value:&stru_26D5DA820 table:@"Localizable"];

    v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v10 = [(__CFString *)v8 stringByTrimmingCharactersInSet:v9];

    if ([(__CFString *)v8 length])
    {
      while (1)
      {
        v11 = +[StocksBundles getBundle:1];
        v12 = objc_msgSend(NSString, "stringWithFormat:", @"MAGNITUDE_POSTFIX_%u", v4 + 1);
        v13 = [v11 localizedStringForKey:v12 value:&stru_26D5DA820 table:@"Localizable"];

        v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        v15 = [v13 stringByTrimmingCharactersInSet:v14];

        if (([v15 isEqualToString:v10] & 1) == 0) {
          break;
        }

        if (--v4 <= 2) {
          goto LABEL_11;
        }
      }
      *a4 = v4 + 1;
    }
LABEL_11:

    v5 = v8;
  }
  else
  {
    v5 = &stru_26D5DA820;
  }

  return v5;
}

+ (id)localizedMagnitudeAbbreviatedStringWithString:(id)a3 fractionDigits:(unsigned int)a4
{
  LODWORD(v4) = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    [v6 floatValue];
    float v9 = v8;
    float v10 = log10f(v8);
    unsigned int v11 = v10;
    if (v9 <= 0.0 || v11 >= 0xF)
    {
      v13 = +[Stock BlankValueString];
    }
    else
    {
      unsigned int v23 = 0;
      v14 = [a1 postfixCharacterForMagnitude:v10 unitMagnitude:&v23];
      unsigned int v15 = v23;
      if (v23)
      {
        float v9 = v9 / __exp10((float)v23);
        unsigned int v15 = v23;
      }
      unsigned int v16 = v15 - v11 + 3;
      if (v4 == -1) {
        uint64_t v4 = v16;
      }
      else {
        uint64_t v4 = v4;
      }
      v17 = +[StockDataFormatter sharedDataFormatter];
      *(float *)&double v18 = v9;
      v19 = [NSNumber numberWithFloat:v18];
      v20 = [v17 formattedNumber:v19 withPrecision:v4 useGroupSeparator:1];

      if ([v14 length])
      {
        id v21 = [v20 stringByAppendingString:v14];
      }
      else
      {
        id v21 = v20;
      }
      v13 = v21;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)localizedMagnitudeAbbreviatedStringWithString:(id)a3
{
  return (id)[a1 localizedMagnitudeAbbreviatedStringWithString:a3 fractionDigits:0xFFFFFFFFLL];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(Stock *)self listName];
  v5 = [(Stock *)self formattedPrice];
  id v6 = [v3 stringWithFormat:@"<Stock %p>: List name = %@, formatted price = %@", self, v4, v5];

  return v6;
}

- (void)populateFromDictionary:(id)a3
{
  id v57 = a3;
  uint64_t v4 = [v57 objectForKey:@"companyName"];
  [(Stock *)self setCompanyName:v4];

  v5 = [v57 objectForKey:@"shortCompanyName"];
  [(Stock *)self setShortCompanyName:v5];

  id v6 = [v57 objectForKeyedSubscript:@"exchange"];
  if (v6)
  {
    v7 = +[ExchangeManager sharedManager];
    float v8 = [v7 exchangeWithName:v6 createIfNotFound:1];
    [(Stock *)self setExchange:v8];
  }
  float v9 = +[Stock BlankValueString];
  uint64_t v10 = [v57 objectForKey:@"open"];
  unsigned int v11 = (void *)v10;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = v9;
  }
  [(Stock *)self setOpen:v12];

  uint64_t v13 = [v57 objectForKey:@"high"];
  v14 = (void *)v13;
  if (v13) {
    unsigned int v15 = (void *)v13;
  }
  else {
    unsigned int v15 = v9;
  }
  [(Stock *)self setHigh:v15];

  uint64_t v16 = [v57 objectForKey:@"low"];
  v17 = (void *)v16;
  if (v16) {
    double v18 = (void *)v16;
  }
  else {
    double v18 = v9;
  }
  [(Stock *)self setLow:v18];

  uint64_t v19 = [v57 objectForKey:@"yearHigh"];
  v20 = (void *)v19;
  if (v19) {
    id v21 = (void *)v19;
  }
  else {
    id v21 = v9;
  }
  [(Stock *)self setYearHigh:v21];

  uint64_t v22 = [v57 objectForKey:@"yearLow"];
  unsigned int v23 = (void *)v22;
  if (v22) {
    v24 = (void *)v22;
  }
  else {
    v24 = v9;
  }
  [(Stock *)self setYearLow:v24];

  uint64_t v25 = [v57 objectForKey:@"volume"];
  v26 = (void *)v25;
  if (v25) {
    v27 = (void *)v25;
  }
  else {
    v27 = v9;
  }
  [(Stock *)self setVolume:v27];

  uint64_t v28 = [v57 objectForKey:@"averageVolume"];
  v29 = (void *)v28;
  if (v28) {
    v30 = (void *)v28;
  }
  else {
    v30 = v9;
  }
  [(Stock *)self setAverageVolume:v30];

  uint64_t v31 = [v57 objectForKey:@"marketcap"];
  v32 = (void *)v31;
  if (v31) {
    v33 = (void *)v31;
  }
  else {
    v33 = v9;
  }
  [(Stock *)self setMarketcap:v33];

  uint64_t v34 = [v57 objectForKey:@"peRatio"];
  v35 = (void *)v34;
  if (v34) {
    v36 = (void *)v34;
  }
  else {
    v36 = v9;
  }
  [(Stock *)self setPeRatio:v36];

  uint64_t v37 = [v57 objectForKey:@"dividendYield"];
  v38 = (void *)v37;
  if (v37) {
    v39 = (void *)v37;
  }
  else {
    v39 = v9;
  }
  [(Stock *)self setDividendYield:v39];

  uint64_t v40 = [v57 objectForKey:@"type"];
  v41 = (void *)v40;
  if (v40) {
    v42 = (void *)v40;
  }
  else {
    v42 = v9;
  }
  [(Stock *)self setSymbolType:v42];

  v43 = [v57 objectForKeyedSubscript:@"currency"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v44 = v43;
  }
  else {
    v44 = 0;
  }
  [(Stock *)self setCurrency:v44];
  v45 = [v57 objectForKey:@"price"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v46 = v45;
  }
  else {
    v46 = 0;
  }
  [(Stock *)self setPrice:v46];
  v47 = [v57 objectForKey:@"change"];
  [(Stock *)self setChange:v47];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = [(NSString *)self->_change stringValue];
    [(Stock *)self setChange:v48];
  }
  v49 = [v57 objectForKey:@"infoURL"];
  if (v49)
  {
    v50 = [NSURL URLWithString:v49];
    [(Stock *)self setInfoURL:v50];
  }
  v51 = [v57 objectForKey:@"dataSource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [[StockDataSource alloc] initWithDictionary:v51];
    [(Stock *)self setDataSource:v52];
  }
  v53 = [v57 objectForKey:@"lastUpdateTime"];
  [v53 doubleValue];
  self->_timeQuoteLastUpdated = v54;

  v55 = [v57 objectForKey:@"lastMetadataUpdateTime"];
  [v55 doubleValue];
  self->_timeMetadataLastUpdated = v56;

  [(Stock *)self _updatePricePrecision];
}

- (Stock)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Stock;
  v5 = [(Stock *)&v9 init];
  if (v5
    && ([v4 objectForKey:@"symbol"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(Stock *)v5 setSymbol:v6],
        v6,
        v5->_symbol))
  {
    [(Stock *)v5 populateFromDictionary:v4];
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  for (uint64_t i = 0; i != 9; ++i)
    [(Stock *)self setChartData:0 forInterval:i];
  v4.receiver = self;
  v4.super_class = (Class)Stock;
  [(Stock *)&v4 dealloc];
}

- (id)archiveDictionary
{
  if ([(Stock *)self isTransient] || !self->_symbol)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:18];
    [v3 setObject:self->_symbol forKey:@"symbol"];
    companyName = self->_companyName;
    if (companyName) {
      [v3 setObject:companyName forKey:@"companyName"];
    }
    shortCompanyName = self->_shortCompanyName;
    if (shortCompanyName) {
      [v3 setObject:shortCompanyName forKey:@"shortCompanyName"];
    }
    currency = self->_currency;
    if (currency) {
      [v3 setObject:currency forKeyedSubscript:@"currency"];
    }
    price = self->_price;
    if (price) {
      [v3 setObject:price forKey:@"price"];
    }
    change = self->_change;
    if (change) {
      [v3 setObject:change forKey:@"change"];
    }
    exchange = self->_exchange;
    if (exchange)
    {
      uint64_t v10 = [(Exchange *)exchange name];
      [v3 setObject:v10 forKeyedSubscript:@"exchange"];
    }
    uint64_t v11 = +[Stock BlankValueString];
    v12 = (NSString *)v11;
    symbolType = self->_symbolType;
    if (symbolType && symbolType != (NSString *)v11) {
      [v3 setObject:symbolType forKey:@"type"];
    }
    open = self->_open;
    if (open && open != v12) {
      [v3 setObject:open forKey:@"open"];
    }
    high = self->_high;
    if (high && high != v12) {
      [v3 setObject:high forKey:@"high"];
    }
    low = self->_low;
    if (low && low != v12) {
      [v3 setObject:low forKey:@"low"];
    }
    yearHigh = self->_yearHigh;
    if (yearHigh && yearHigh != v12) {
      [v3 setObject:yearHigh forKey:@"yearHigh"];
    }
    yearLow = self->_yearLow;
    if (yearLow && yearLow != v12) {
      [v3 setObject:yearLow forKey:@"yearLow"];
    }
    volume = self->_volume;
    if (volume && volume != v12) {
      [v3 setObject:volume forKey:@"volume"];
    }
    averageVolume = self->_averageVolume;
    if (averageVolume && averageVolume != v12) {
      [v3 setObject:averageVolume forKey:@"averageVolume"];
    }
    marketcap = self->_marketcap;
    if (marketcap && marketcap != v12) {
      [v3 setObject:marketcap forKey:@"marketcap"];
    }
    peRatio = self->_peRatio;
    if (peRatio && peRatio != v12) {
      [v3 setObject:peRatio forKey:@"peRatio"];
    }
    dividendYield = self->_dividendYield;
    if (dividendYield && dividendYield != v12) {
      [v3 setObject:dividendYield forKey:@"dividendYield"];
    }
    infoURL = self->_infoURL;
    if (infoURL)
    {
      uint64_t v25 = [(NSURL *)infoURL absoluteString];
      [v3 setObject:v25 forKey:@"infoURL"];
    }
    if (self->_timeQuoteLastUpdated != 0.0)
    {
      v26 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v3 setObject:v26 forKey:@"lastUpdateTime"];
    }
    if (self->_timeMetadataLastUpdated != 0.0)
    {
      v27 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v3 setObject:v27 forKey:@"lastMetadataUpdateTime"];
    }
    dataSource = self->_dataSource;
    if (dataSource)
    {
      v29 = [(StockDataSource *)dataSource archiveDictionary];
      [v3 setObject:v29 forKey:@"dataSource"];
    }
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(Stock *)self symbol];
    id v6 = [v4 symbol];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(Stock *)self symbol];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)changeIsNegative
{
  unint64_t v3 = [(Stock *)self change];
  if ([v3 length])
  {
    id v4 = [(Stock *)self change];
    BOOL v5 = [v4 characterAtIndex:0] == 45;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)changeIsZero
{
  unint64_t v3 = [(Stock *)self formattedChangePercent:0];
  id v4 = +[StockDataFormatter sharedDataFormatter];
  BOOL v5 = objc_msgSend(v4, "formattedNumber:withPrecision:useGroupSeparator:", &unk_26D5E8E98, -[Stock pricePrecision](self, "pricePrecision"), 1);

  LOBYTE(v4) = [v3 isEqualToString:v5];
  return (char)v4;
}

- (BOOL)isIndex
{
  return [(NSString *)self->_symbolType isEqualToString:@"index"];
}

- (BOOL)marketIsOpen
{
  return [(Exchange *)self->_exchange marketIsOpen];
}

- (double)_updateInterval
{
  [(Exchange *)self->_exchange streamInterval];
  if (result == 0.0)
  {
    BOOL v4 = [(Stock *)self marketIsOpen];
    double result = 300.0;
    if (v4) {
      return 60.0;
    }
  }
  return result;
}

- (BOOL)isQuoteStale
{
  if (self->_timeQuoteLastUpdated == 0.0) {
    return 1;
  }
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - self->_timeQuoteLastUpdated;
  [(Stock *)self _updateInterval];
  return v4 >= v5;
}

- (BOOL)isMetadataStale
{
  if (self->_timeMetadataLastUpdated == 0.0) {
    return 1;
  }
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - self->_timeMetadataLastUpdated;
  [(Stock *)self _updateInterval];
  return v4 >= v5;
}

- (BOOL)doesQuoteNeedUpdate
{
  if (self->_timeQuoteLastUpdated == 0.0) {
    return 1;
  }
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - self->_timeQuoteLastUpdated;
  [(Stock *)self _updateInterval];
  return v4 >= fmax(v5, 300.0);
}

- (BOOL)doesMetadataNeedUpdate
{
  if (self->_timeMetadataLastUpdated == 0.0) {
    return 1;
  }
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - self->_timeMetadataLastUpdated;
  [(Stock *)self _updateInterval];
  return v4 >= fmax(v5, 300.0);
}

- (id)listName
{
  return [(Stock *)self listNameWithMaxIndexNameLength:12];
}

- (id)listNameWithMaxIndexNameLength:(unint64_t)a3
{
  double v5 = [(Stock *)self listNameOverride];
  id v6 = v5;
  if (!v5)
  {
    p_shortCompanyName = &self->_shortCompanyName;
    if (![(NSString *)self->_shortCompanyName length])
    {
      if ([(Stock *)self shouldUseCompanyNameAsListName:a3]) {
        p_shortCompanyName = &self->_companyName;
      }
      else {
        p_shortCompanyName = &self->_symbol;
      }
    }
    id v6 = *p_shortCompanyName;
  }
  float v8 = v6;

  return v8;
}

- (id)listNameOverride
{
  unint64_t v3 = [(id)objc_opt_class() listNameOverridesBySymbol];
  CFAbsoluteTime v4 = [v3 objectForKey:self->_symbol];

  return v4;
}

+ (id)listNameOverridesBySymbol
{
  if (listNameOverridesBySymbol_onceToken != -1) {
    dispatch_once(&listNameOverridesBySymbol_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)listNameOverridesBySymbol_nameOverridesBySymbol;

  return v2;
}

void __34__Stock_listNameOverridesBySymbol__block_invoke()
{
  v0 = (void *)listNameOverridesBySymbol_nameOverridesBySymbol;
  listNameOverridesBySymbol_nameOverridesBySymbol = (uint64_t)&unk_26D5E9048;
}

- (BOOL)shouldUseCompanyNameAsListName:(unint64_t)a3
{
  if (([(NSString *)self->_companyName naui_containsCJKScripts] & 1) != 0
    || (BOOL v5 = [(Stock *)self isIndex]))
  {
    LOBYTE(v5) = [(NSString *)self->_companyName length]
              && [(NSString *)self->_companyName length] <= a3;
  }
  return v5;
}

- (id)chartDataForInterval:(int64_t)a3
{
  BOOL v5 = self->_chartDataArray[a3];
  double Current = CFAbsoluteTimeGetCurrent();
  [(StockChartData *)v5 expirationTime];
  if (Current >= v7)
  {
    if (!v5) {
      goto LABEL_6;
    }
    [(Stock *)self setChartData:0 forInterval:a3];
    float v8 = v5;
    BOOL v5 = 0;
  }
  else
  {
    float v8 = +[StockManager sharedManager];
    [v8 UpdateChartDataInLRU:v5];
  }

LABEL_6:

  return v5;
}

- (void)setChartData:(id)a3 forInterval:(int64_t)a4
{
  Class v7 = (Class)a3;
  float v8 = &self->super.isa + a4;
  Class v11 = v8[1];
  uint64_t v10 = (id *)(v8 + 1);
  Class v9 = v11;
  Class v14 = v7;
  if (v11 != v7)
  {
    v12 = v9;
    uint64_t v13 = +[StockManager sharedManager];
    [v13 RemoveChartDataFromLRU:v12];
    objc_storeStrong(v10, a3);
    [v13 UpdateChartDataInLRU:v14];
  }
}

- (void)updateQuoteWithDictionary:(id)a3 forTime:(double)a4
{
  id v24 = a3;
  id v6 = [v24 objectForKeyedSubscript:@"currency"];
  currency = v6;
  if (!v6) {
    currency = self->_currency;
  }
  [(Stock *)self setCurrency:currency];

  float v8 = [v24 objectForKey:@"price"];
  price = v8;
  if (!v8) {
    price = self->_price;
  }
  [(Stock *)self setPrice:price];

  uint64_t v10 = [v24 objectForKey:@"change"];
  change = v10;
  if (!v10) {
    change = self->_change;
  }
  [(Stock *)self setChange:change];

  v12 = [v24 objectForKey:@"type"];
  symbolType = v12;
  if (!v12) {
    symbolType = self->_symbolType;
  }
  [(Stock *)self setSymbolType:symbolType];

  Class v14 = [v24 objectForKeyedSubscript:@"exchange"];
  if (v14)
  {
    unsigned int v15 = +[ExchangeManager sharedManager];
    uint64_t v16 = [v15 exchangeWithName:v14 createIfNotFound:1];
    [(Stock *)self setExchange:v16];
  }
  v17 = [v24 objectForKey:@"marketcap"];
  double v18 = v17;
  if (v17)
  {
    if ([v17 isEqualToString:@"N/A"])
    {
      uint64_t v19 = +[Stock BlankValueString];
      [(Stock *)self setMarketcap:v19];
    }
    else
    {
      [(Stock *)self setMarketcap:v18];
    }
  }
  v20 = [v24 objectForKey:@"dataSource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [[StockDataSource alloc] initWithDictionary:v20];
    [(Stock *)self setDataSource:v21];
  }
  uint64_t v22 = [v24 objectForKey:@"shortCompanyName"];
  shortCompanyName = v22;
  if (!v22) {
    shortCompanyName = self->_shortCompanyName;
  }
  [(Stock *)self setShortCompanyName:shortCompanyName];

  self->_timeQuoteLastUpdated = a4;
  [(Stock *)self _updatePricePrecision];
}

- (void)updateMetadataWithDictionary:(id)a3 forTime:(double)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  Class v7 = [v6 objectForKey:@"companyName"];
  companyName = v7;
  if (!v7) {
    companyName = self->_companyName;
  }
  [(Stock *)self setCompanyName:companyName];

  Class v9 = [v6 objectForKey:@"exchange"];
  if (v9)
  {
    uint64_t v10 = +[ExchangeManager sharedManager];
    Class v11 = [v10 exchangeWithName:v9 createIfNotFound:1];
    [(Stock *)self setExchange:v11];
  }
  v12 = [v6 objectForKeyedSubscript:@"currency"];
  currency = v12;
  if (!v12) {
    currency = self->_currency;
  }
  [(Stock *)self setCurrency:currency];

  Class v14 = +[Stock BlankValueString];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  unsigned int v15 = +[Stock _potentiallyAbsentKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v46 = v9;
    v47 = self;
    double v18 = 0;
    uint64_t v19 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        id v21 = v18;
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        double v18 = objc_msgSend(v6, "objectForKey:", v22, v46, v47);

        if (v18)
        {
          if (([v18 isEqualToString:@"N/A"] & 1) != 0
            || ([v18 floatValue], v23 == 0.0))
          {
            [v6 setObject:v14 forKey:v22];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v17);

    Class v9 = v46;
    self = v47;
  }

  id v24 = [v6 objectForKey:@"open"];
  open = v24;
  if (!v24) {
    open = self->_open;
  }
  [(Stock *)self setOpen:open];

  v26 = [v6 objectForKey:@"high"];
  high = v26;
  if (!v26) {
    high = self->_high;
  }
  [(Stock *)self setHigh:high];

  uint64_t v28 = [v6 objectForKey:@"low"];
  low = v28;
  if (!v28) {
    low = self->_low;
  }
  [(Stock *)self setLow:low];

  v30 = [v6 objectForKey:@"yearHigh"];
  yearHigh = v30;
  if (!v30) {
    yearHigh = self->_yearHigh;
  }
  [(Stock *)self setYearHigh:yearHigh];

  v32 = [v6 objectForKey:@"yearLow"];
  yearLow = v32;
  if (!v32) {
    yearLow = self->_yearLow;
  }
  [(Stock *)self setYearLow:yearLow];

  uint64_t v34 = [v6 objectForKey:@"volume"];
  volume = v34;
  if (!v34) {
    volume = self->_volume;
  }
  [(Stock *)self setVolume:volume];

  v36 = [v6 objectForKey:@"averageVolume"];
  averageVolume = v36;
  if (!v36) {
    averageVolume = self->_averageVolume;
  }
  [(Stock *)self setAverageVolume:averageVolume];

  v38 = [v6 objectForKey:@"marketcap"];
  marketcap = v38;
  if (!v38) {
    marketcap = self->_marketcap;
  }
  [(Stock *)self setMarketcap:marketcap];

  uint64_t v40 = [v6 objectForKey:@"peRatio"];
  peRatio = v40;
  if (!v40) {
    peRatio = self->_peRatio;
  }
  [(Stock *)self setPeRatio:peRatio];

  v42 = [v6 objectForKey:@"dividendYield"];
  dividendYield = v42;
  if (!v42) {
    dividendYield = self->_dividendYield;
  }
  [(Stock *)self setDividendYield:dividendYield];

  v44 = [v6 objectForKey:@"infoURL"];
  if (v44)
  {
    v45 = [NSURL URLWithString:v44];
    [(Stock *)self setInfoURL:v45];
  }
  else
  {
    [(Stock *)self setInfoURL:0];
  }
  self->_timeMetadataLastUpdated = a4;
}

+ (id)_potentiallyAbsentKeys
{
  v2 = (void *)_potentiallyAbsentKeys_potentiallyAbsentKeys;
  if (!_potentiallyAbsentKeys_potentiallyAbsentKeys)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"open", @"high", @"low", @"yearHigh", @"yearLow", @"volume", @"averageVolume", @"marketcap", @"peRatio", @"dividendYield", 0);
    CFAbsoluteTime v4 = (void *)_potentiallyAbsentKeys_potentiallyAbsentKeys;
    _potentiallyAbsentKeys_potentiallyAbsentKeys = v3;

    v2 = (void *)_potentiallyAbsentKeys_potentiallyAbsentKeys;
  }

  return v2;
}

- (void)_updatePricePrecision
{
  uint64_t v3 = [(Stock *)self price];
  uint64_t v4 = [v3 rangeOfString:@"."];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_pricePrecision = 0;
  }
  else if ([(NSString *)self->_symbol hasSuffix:@"=X"])
  {
    self->_pricePrecision = 3;
  }
  else
  {
    id v8 = [(Stock *)self price];
    if ((unint64_t)([v8 length] - v4) < 3)
    {
      self->_pricePrecision = 2;
    }
    else
    {
      BOOL v5 = [(Stock *)self price];
      [v5 floatValue];
      if (v6 >= 1.0) {
        unsigned int v7 = 2;
      }
      else {
        unsigned int v7 = 3;
      }
      self->_pricePrecision = v7;
    }
  }
}

- (NSString)marketStatusDescription
{
  if ([(Stock *)self marketIsOpen])
  {
    uint64_t v3 = [(Stock *)self dataSource];
    [v3 localizedSourceDescription];
  }
  else
  {
    uint64_t v3 = +[StocksBundles getBundle:1];
    [v3 localizedStringForKey:@"Market closed" value:&stru_26D5DA820 table:@"Localizable"];
  uint64_t v4 = };

  return (NSString *)v4;
}

- (NSString)formattedPrice
{
  uint64_t v3 = +[StockDataFormatter sharedDataFormatter];
  uint64_t v4 = objc_msgSend(v3, "formattedPriceForStock:withPrecision:", self, -[Stock pricePrecision](self, "pricePrecision"));

  return (NSString *)v4;
}

- (NSString)formattedChange
{
  uint64_t v3 = +[StockDataFormatter sharedDataFormatter];
  uint64_t v4 = objc_msgSend(v3, "formattedChangeInPointsForStock:withPrecision:", self, -[Stock pricePrecision](self, "pricePrecision"));

  return (NSString *)v4;
}

- (NSString)formattedChangePercent
{
  uint64_t v3 = +[StockDataFormatter sharedDataFormatter];
  uint64_t v4 = [v3 formattedChangeInPercentForStock:self];

  return (NSString *)v4;
}

- (id)formattedChangePercent:(BOOL)a3
{
  if (a3) {
    [(Stock *)self formattedChangePercent];
  }
  else {
  uint64_t v3 = [(Stock *)self formattedChange];
  }

  return v3;
}

- (id)formattedPriceDroppingFractionDigitsIfLengthExceeds:(unint64_t)a3
{
  BOOL v5 = +[StockDataFormatter sharedDataFormatter];
  float v6 = objc_msgSend(v5, "formattedPriceForStock:withPrecision:droppingFractionDigitsIfLengthExceeds:", self, -[Stock pricePrecision](self, "pricePrecision"), a3);

  return v6;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
}

- (NSString)shortCompanyName
{
  return self->_shortCompanyName;
}

- (void)setShortCompanyName:(id)a3
{
}

- (Exchange)exchange
{
  return self->_exchange;
}

- (void)setExchange:(id)a3
{
}

- (NSString)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (NSString)change
{
  return self->_change;
}

- (void)setChange:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSString)symbolType
{
  return self->_symbolType;
}

- (void)setSymbolType:(id)a3
{
}

- (NSString)open
{
  return self->_open;
}

- (void)setOpen:(id)a3
{
}

- (NSString)high
{
  return self->_high;
}

- (void)setHigh:(id)a3
{
}

- (NSString)low
{
  return self->_low;
}

- (void)setLow:(id)a3
{
}

- (NSString)yearHigh
{
  return self->_yearHigh;
}

- (void)setYearHigh:(id)a3
{
}

- (NSString)yearLow
{
  return self->_yearLow;
}

- (void)setYearLow:(id)a3
{
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (NSString)averageVolume
{
  return self->_averageVolume;
}

- (void)setAverageVolume:(id)a3
{
}

- (NSString)marketcap
{
  return self->_marketcap;
}

- (void)setMarketcap:(id)a3
{
}

- (NSString)peRatio
{
  return self->_peRatio;
}

- (void)setPeRatio:(id)a3
{
}

- (NSString)dividendYield
{
  return self->_dividendYield;
}

- (void)setDividendYield:(id)a3
{
}

- (unsigned)pricePrecision
{
  return self->_pricePrecision;
}

- (NSURL)infoURL
{
  return self->_infoURL;
}

- (void)setInfoURL:(id)a3
{
}

- (StockDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (double)timeQuoteLastUpdated
{
  return self->_timeQuoteLastUpdated;
}

- (void)setTimeQuoteLastUpdated:(double)a3
{
  self->_timeQuoteLastUpdated = a3;
}

- (double)timeMetadataLastUpdated
{
  return self->_timeMetadataLastUpdated;
}

- (void)setTimeMetadataLastUpdated:(double)a3
{
  self->_timeMetadataLastUpdated = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_infoURL, 0);
  objc_storeStrong((id *)&self->_dividendYield, 0);
  objc_storeStrong((id *)&self->_peRatio, 0);
  objc_storeStrong((id *)&self->_marketcap, 0);
  objc_storeStrong((id *)&self->_averageVolume, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_yearLow, 0);
  objc_storeStrong((id *)&self->_yearHigh, 0);
  objc_storeStrong((id *)&self->_low, 0);
  objc_storeStrong((id *)&self->_high, 0);
  objc_storeStrong((id *)&self->_open, 0);
  objc_storeStrong((id *)&self->_symbolType, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_exchange, 0);
  objc_storeStrong((id *)&self->_shortCompanyName, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  uint64_t v3 = 72;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end