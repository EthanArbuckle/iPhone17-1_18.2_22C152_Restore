@interface SAHomeMemberSettings
+ (id)homeMemberSettings;
- (BOOL)mediaPlayerExplicitContentDisallowed;
- (NSArray)parentalRestrictions;
- (NSNumber)twentyFourHourTimeDisplay;
- (NSString)countryCode;
- (NSString)preferredLanguage;
- (NSString)region;
- (NSString)temperatureUnit;
- (SAPerson)meCard;
- (SAVoice)ttsVoice;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCountryCode:(id)a3;
- (void)setMeCard:(id)a3;
- (void)setMediaPlayerExplicitContentDisallowed:(BOOL)a3;
- (void)setParentalRestrictions:(id)a3;
- (void)setPreferredLanguage:(id)a3;
- (void)setRegion:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setTtsVoice:(id)a3;
- (void)setTwentyFourHourTimeDisplay:(id)a3;
@end

@implementation SAHomeMemberSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"HomeMemberSettings";
}

+ (id)homeMemberSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)countryCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"countryCode"];
}

- (void)setCountryCode:(id)a3
{
}

- (SAPerson)meCard
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, @"meCard");
}

- (void)setMeCard:(id)a3
{
}

- (BOOL)mediaPlayerExplicitContentDisallowed
{
  return AceObjectBoolForProperty(self, @"mediaPlayerExplicitContentDisallowed");
}

- (void)setMediaPlayerExplicitContentDisallowed:(BOOL)a3
{
}

- (NSArray)parentalRestrictions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"parentalRestrictions"];
}

- (void)setParentalRestrictions:(id)a3
{
}

- (NSString)preferredLanguage
{
  return (NSString *)[(AceObject *)self propertyForKey:@"preferredLanguage"];
}

- (void)setPreferredLanguage:(id)a3
{
}

- (NSString)region
{
  return (NSString *)[(AceObject *)self propertyForKey:@"region"];
}

- (void)setRegion:(id)a3
{
}

- (NSString)temperatureUnit
{
  return (NSString *)[(AceObject *)self propertyForKey:@"temperatureUnit"];
}

- (void)setTemperatureUnit:(id)a3
{
}

- (SAVoice)ttsVoice
{
  return (SAVoice *)AceObjectAceObjectForProperty(self, @"ttsVoice");
}

- (void)setTtsVoice:(id)a3
{
}

- (NSNumber)twentyFourHourTimeDisplay
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"twentyFourHourTimeDisplay"];
}

- (void)setTwentyFourHourTimeDisplay:(id)a3
{
}

@end