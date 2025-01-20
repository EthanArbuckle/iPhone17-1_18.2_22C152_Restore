@interface SAStockObject
+ (id)object;
- (NSArray)requests;
- (NSArray)stockNews;
- (NSNumber)averageDailyVolume;
- (NSNumber)change;
- (NSNumber)changePercent;
- (NSNumber)dividendYield;
- (NSNumber)earningsPerShare;
- (NSNumber)fiftyTwoWeekHigh;
- (NSNumber)fiftyTwoWeekLow;
- (NSNumber)high;
- (NSNumber)low;
- (NSNumber)open;
- (NSNumber)peRatio;
- (NSNumber)prevClose;
- (NSNumber)price;
- (NSNumber)realTimeChange;
- (NSNumber)realTimeChangePercent;
- (NSNumber)realTimePrice;
- (NSNumber)realTimeTS;
- (NSNumber)status;
- (NSNumber)timeStamp;
- (NSNumber)volume;
- (NSString)chartData;
- (NSString)currency;
- (NSString)displayStyle;
- (NSString)exchange;
- (NSString)link;
- (NSString)marketCap;
- (NSString)name;
- (NSString)symbol;
- (NSString)yearRange;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAverageDailyVolume:(id)a3;
- (void)setChange:(id)a3;
- (void)setChangePercent:(id)a3;
- (void)setChartData:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setDisplayStyle:(id)a3;
- (void)setDividendYield:(id)a3;
- (void)setEarningsPerShare:(id)a3;
- (void)setExchange:(id)a3;
- (void)setFiftyTwoWeekHigh:(id)a3;
- (void)setFiftyTwoWeekLow:(id)a3;
- (void)setHigh:(id)a3;
- (void)setLink:(id)a3;
- (void)setLow:(id)a3;
- (void)setMarketCap:(id)a3;
- (void)setName:(id)a3;
- (void)setOpen:(id)a3;
- (void)setPeRatio:(id)a3;
- (void)setPrevClose:(id)a3;
- (void)setPrice:(id)a3;
- (void)setRealTimeChange:(id)a3;
- (void)setRealTimeChangePercent:(id)a3;
- (void)setRealTimePrice:(id)a3;
- (void)setRealTimeTS:(id)a3;
- (void)setRequests:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStockNews:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setTimeStamp:(id)a3;
- (void)setVolume:(id)a3;
- (void)setYearRange:(id)a3;
@end

@implementation SAStockObject

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)averageDailyVolume
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"averageDailyVolume"];
}

- (void)setAverageDailyVolume:(id)a3
{
}

- (NSNumber)change
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"change"];
}

- (void)setChange:(id)a3
{
}

- (NSNumber)changePercent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"changePercent"];
}

- (void)setChangePercent:(id)a3
{
}

- (NSString)chartData
{
  return (NSString *)[(AceObject *)self propertyForKey:@"chartData"];
}

- (void)setChartData:(id)a3
{
}

- (NSString)currency
{
  return (NSString *)[(AceObject *)self propertyForKey:@"currency"];
}

- (void)setCurrency:(id)a3
{
}

- (NSString)displayStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayStyle"];
}

- (void)setDisplayStyle:(id)a3
{
}

- (NSNumber)dividendYield
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"dividendYield"];
}

- (void)setDividendYield:(id)a3
{
}

- (NSNumber)earningsPerShare
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"earningsPerShare"];
}

- (void)setEarningsPerShare:(id)a3
{
}

- (NSString)exchange
{
  return (NSString *)[(AceObject *)self propertyForKey:@"exchange"];
}

- (void)setExchange:(id)a3
{
}

- (NSNumber)fiftyTwoWeekHigh
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"fiftyTwoWeekHigh"];
}

- (void)setFiftyTwoWeekHigh:(id)a3
{
}

- (NSNumber)fiftyTwoWeekLow
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"fiftyTwoWeekLow"];
}

- (void)setFiftyTwoWeekLow:(id)a3
{
}

- (NSNumber)high
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"high"];
}

- (void)setHigh:(id)a3
{
}

- (NSString)link
{
  return (NSString *)[(AceObject *)self propertyForKey:@"link"];
}

- (void)setLink:(id)a3
{
}

- (NSNumber)low
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"low"];
}

- (void)setLow:(id)a3
{
}

- (NSString)marketCap
{
  return (NSString *)[(AceObject *)self propertyForKey:@"marketCap"];
}

- (void)setMarketCap:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSNumber)open
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"open"];
}

- (void)setOpen:(id)a3
{
}

- (NSNumber)peRatio
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"peRatio"];
}

- (void)setPeRatio:(id)a3
{
}

- (NSNumber)prevClose
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"prevClose"];
}

- (void)setPrevClose:(id)a3
{
}

- (NSNumber)price
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"price"];
}

- (void)setPrice:(id)a3
{
}

- (NSNumber)realTimeChange
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"realTimeChange"];
}

- (void)setRealTimeChange:(id)a3
{
}

- (NSNumber)realTimeChangePercent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"realTimeChangePercent"];
}

- (void)setRealTimeChangePercent:(id)a3
{
}

- (NSNumber)realTimePrice
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"realTimePrice"];
}

- (void)setRealTimePrice:(id)a3
{
}

- (NSNumber)realTimeTS
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"realTimeTS"];
}

- (void)setRealTimeTS:(id)a3
{
}

- (NSArray)requests
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"requests", v3);
}

- (void)setRequests:(id)a3
{
}

- (NSNumber)status
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
{
}

- (NSArray)stockNews
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"stockNews", v3);
}

- (void)setStockNews:(id)a3
{
}

- (NSString)symbol
{
  return (NSString *)[(AceObject *)self propertyForKey:@"symbol"];
}

- (void)setSymbol:(id)a3
{
}

- (NSNumber)timeStamp
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timeStamp"];
}

- (void)setTimeStamp:(id)a3
{
}

- (NSNumber)volume
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"volume"];
}

- (void)setVolume:(id)a3
{
}

- (NSString)yearRange
{
  return (NSString *)[(AceObject *)self propertyForKey:@"yearRange"];
}

- (void)setYearRange:(id)a3
{
}

@end