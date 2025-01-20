@interface SASetAssistantData
+ (id)setAssistantData;
- (BOOL)censorSpeech;
- (BOOL)handsFree;
- (BOOL)inRetailStoreDemoMode;
- (BOOL)mediaPlayerExplicitContentDisallowed;
- (BOOL)requiresResponse;
- (BOOL)voiceOver;
- (NSArray)abSources;
- (NSArray)deviceCapabilities;
- (NSArray)meCards;
- (NSArray)parentalRestrictions;
- (NSNumber)allowUserGeneratedContent;
- (NSNumber)debugFlags;
- (NSNumber)holdToTalkThresholdInMilliseconds;
- (NSNumber)storefront;
- (NSNumber)twentyFourHourTimeDisplay;
- (NSNumber)uiScale;
- (NSNumber)voiceTriggerEnabled;
- (NSString)anchor;
- (NSString)countryCode;
- (NSString)deviceColor;
- (NSString)deviceEnclosure;
- (NSString)deviceVersion;
- (NSString)firstName;
- (NSString)fullStorefrontId;
- (NSString)lastName;
- (NSString)osVersion;
- (NSString)preferredLanguage;
- (NSString)region;
- (NSString)temperatureUnit;
- (NSString)timeZoneId;
- (NSString)userInterfaceIdiom;
- (SAMediaContentRatingRestrictions)mediaContentRatingRestrictions;
- (SAVoice)ttsVoice;
- (SAWatchData)watchData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAbSources:(id)a3;
- (void)setAllowUserGeneratedContent:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setCensorSpeech:(BOOL)a3;
- (void)setCountryCode:(id)a3;
- (void)setDebugFlags:(id)a3;
- (void)setDeviceCapabilities:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceEnclosure:(id)a3;
- (void)setDeviceVersion:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullStorefrontId:(id)a3;
- (void)setHandsFree:(BOOL)a3;
- (void)setHoldToTalkThresholdInMilliseconds:(id)a3;
- (void)setInRetailStoreDemoMode:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setMeCards:(id)a3;
- (void)setMediaContentRatingRestrictions:(id)a3;
- (void)setMediaPlayerExplicitContentDisallowed:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setParentalRestrictions:(id)a3;
- (void)setPreferredLanguage:(id)a3;
- (void)setRegion:(id)a3;
- (void)setStorefront:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setTimeZoneId:(id)a3;
- (void)setTtsVoice:(id)a3;
- (void)setTwentyFourHourTimeDisplay:(id)a3;
- (void)setUiScale:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
- (void)setVoiceOver:(BOOL)a3;
- (void)setVoiceTriggerEnabled:(id)a3;
- (void)setWatchData:(id)a3;
@end

@implementation SASetAssistantData

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetAssistantData";
}

+ (id)setAssistantData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)abSources
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"abSources", v3);
}

- (void)setAbSources:(id)a3
{
}

- (NSNumber)allowUserGeneratedContent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"allowUserGeneratedContent"];
}

- (void)setAllowUserGeneratedContent:(id)a3
{
}

- (NSString)anchor
{
  return (NSString *)[(AceObject *)self propertyForKey:@"anchor"];
}

- (void)setAnchor:(id)a3
{
}

- (BOOL)censorSpeech
{
  return AceObjectBoolForProperty(self, @"censorSpeech");
}

- (void)setCensorSpeech:(BOOL)a3
{
}

- (NSString)countryCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"countryCode"];
}

- (void)setCountryCode:(id)a3
{
}

- (NSNumber)debugFlags
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"debugFlags"];
}

- (void)setDebugFlags:(id)a3
{
}

- (NSArray)deviceCapabilities
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"deviceCapabilities"];
}

- (void)setDeviceCapabilities:(id)a3
{
}

- (NSString)deviceColor
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceColor"];
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)deviceEnclosure
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceEnclosure"];
}

- (void)setDeviceEnclosure:(id)a3
{
}

- (NSString)deviceVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceVersion"];
}

- (void)setDeviceVersion:(id)a3
{
}

- (NSString)firstName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"firstName"];
}

- (void)setFirstName:(id)a3
{
}

- (NSString)fullStorefrontId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fullStorefrontId"];
}

- (void)setFullStorefrontId:(id)a3
{
}

- (BOOL)handsFree
{
  return AceObjectBoolForProperty(self, @"handsFree");
}

- (void)setHandsFree:(BOOL)a3
{
}

- (NSNumber)holdToTalkThresholdInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"holdToTalkThresholdInMilliseconds"];
}

- (void)setHoldToTalkThresholdInMilliseconds:(id)a3
{
}

- (BOOL)inRetailStoreDemoMode
{
  return AceObjectBoolForProperty(self, @"inRetailStoreDemoMode");
}

- (void)setInRetailStoreDemoMode:(BOOL)a3
{
}

- (NSString)lastName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastName"];
}

- (void)setLastName:(id)a3
{
}

- (NSArray)meCards
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"meCards", v3);
}

- (void)setMeCards:(id)a3
{
}

- (SAMediaContentRatingRestrictions)mediaContentRatingRestrictions
{
  return (SAMediaContentRatingRestrictions *)AceObjectAceObjectForProperty(self, @"mediaContentRatingRestrictions");
}

- (void)setMediaContentRatingRestrictions:(id)a3
{
}

- (BOOL)mediaPlayerExplicitContentDisallowed
{
  return AceObjectBoolForProperty(self, @"mediaPlayerExplicitContentDisallowed");
}

- (void)setMediaPlayerExplicitContentDisallowed:(BOOL)a3
{
}

- (NSString)osVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"osVersion"];
}

- (void)setOsVersion:(id)a3
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

- (NSNumber)storefront
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"storefront"];
}

- (void)setStorefront:(id)a3
{
}

- (NSString)temperatureUnit
{
  return (NSString *)[(AceObject *)self propertyForKey:@"temperatureUnit"];
}

- (void)setTemperatureUnit:(id)a3
{
}

- (NSString)timeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZoneId"];
}

- (void)setTimeZoneId:(id)a3
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

- (NSNumber)uiScale
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"uiScale"];
}

- (void)setUiScale:(id)a3
{
}

- (NSString)userInterfaceIdiom
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userInterfaceIdiom"];
}

- (void)setUserInterfaceIdiom:(id)a3
{
}

- (BOOL)voiceOver
{
  return AceObjectBoolForProperty(self, @"voiceOver");
}

- (void)setVoiceOver:(BOOL)a3
{
}

- (NSNumber)voiceTriggerEnabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"voiceTriggerEnabled"];
}

- (void)setVoiceTriggerEnabled:(id)a3
{
}

- (SAWatchData)watchData
{
  return (SAWatchData *)AceObjectAceObjectForProperty(self, @"watchData");
}

- (void)setWatchData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end