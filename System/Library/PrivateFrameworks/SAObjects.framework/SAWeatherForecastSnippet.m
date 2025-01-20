@interface SAWeatherForecastSnippet
+ (id)forecastSnippet;
- (NSArray)aceWeathers;
- (SAUIAppPunchOut)appPunchOut;
- (SAUIImageResource)attributionImage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceWeathers:(id)a3;
- (void)setAppPunchOut:(id)a3;
- (void)setAttributionImage:(id)a3;
@end

@implementation SAWeatherForecastSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"ForecastSnippet";
}

+ (id)forecastSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)aceWeathers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"aceWeathers", v3);
}

- (void)setAceWeathers:(id)a3
{
}

- (SAUIAppPunchOut)appPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"appPunchOut");
}

- (void)setAppPunchOut:(id)a3
{
}

- (SAUIImageResource)attributionImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"attributionImage");
}

- (void)setAttributionImage:(id)a3
{
}

@end