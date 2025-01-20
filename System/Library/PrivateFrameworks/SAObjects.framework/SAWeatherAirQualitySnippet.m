@interface SAWeatherAirQualitySnippet
+ (id)airQualitySnippet;
- (NSArray)aceAirQualities;
- (SAUIAppPunchOut)appPunchOut;
- (SAUIImageResource)attributionImage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceAirQualities:(id)a3;
- (void)setAppPunchOut:(id)a3;
- (void)setAttributionImage:(id)a3;
@end

@implementation SAWeatherAirQualitySnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"AirQualitySnippet";
}

+ (id)airQualitySnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)aceAirQualities
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"aceAirQualities", v3);
}

- (void)setAceAirQualities:(id)a3
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