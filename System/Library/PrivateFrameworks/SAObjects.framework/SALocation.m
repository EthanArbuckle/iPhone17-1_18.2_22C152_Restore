@interface SALocation
+ (id)location;
- (NSArray)entryPoints;
- (NSData)forwardGeoData;
- (NSNumber)accuracy;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)travelDistance;
- (NSNumber)travelTime;
- (NSString)city;
- (NSString)countryCode;
- (NSString)label;
- (NSString)postalCode;
- (NSString)regionType;
- (NSString)stateCode;
- (NSString)street;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (NSString)timezoneId;
- (SADistance)relativeDistance;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccuracy:(id)a3;
- (void)setCity:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setEntryPoints:(id)a3;
- (void)setForwardGeoData:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setRegionType:(id)a3;
- (void)setRelativeDistance:(id)a3;
- (void)setStateCode:(id)a3;
- (void)setStreet:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)setSubThoroughfare:(id)a3;
- (void)setThoroughfare:(id)a3;
- (void)setTimezoneId:(id)a3;
- (void)setTravelDistance:(id)a3;
- (void)setTravelTime:(id)a3;
@end

@implementation SALocation

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Location";
}

+ (id)location
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)accuracy
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"accuracy"];
}

- (void)setAccuracy:(id)a3
{
}

- (NSString)city
{
  return (NSString *)[(AceObject *)self propertyForKey:@"city"];
}

- (void)setCity:(id)a3
{
}

- (NSString)countryCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"countryCode"];
}

- (void)setCountryCode:(id)a3
{
}

- (NSArray)entryPoints
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"entryPoints", v3);
}

- (void)setEntryPoints:(id)a3
{
}

- (NSData)forwardGeoData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"forwardGeoData"];
}

- (void)setForwardGeoData:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSNumber)latitude
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"latitude"];
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)longitude
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"longitude"];
}

- (void)setLongitude:(id)a3
{
}

- (NSString)postalCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"postalCode"];
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)regionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"regionType"];
}

- (void)setRegionType:(id)a3
{
}

- (SADistance)relativeDistance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, @"relativeDistance");
}

- (void)setRelativeDistance:(id)a3
{
}

- (NSString)stateCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"stateCode"];
}

- (void)setStateCode:(id)a3
{
}

- (NSString)street
{
  return (NSString *)[(AceObject *)self propertyForKey:@"street"];
}

- (void)setStreet:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subAdministrativeArea"];
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (NSString)subLocality
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subLocality"];
}

- (void)setSubLocality:(id)a3
{
}

- (NSString)subThoroughfare
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subThoroughfare"];
}

- (void)setSubThoroughfare:(id)a3
{
}

- (NSString)thoroughfare
{
  return (NSString *)[(AceObject *)self propertyForKey:@"thoroughfare"];
}

- (void)setThoroughfare:(id)a3
{
}

- (NSString)timezoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timezoneId"];
}

- (void)setTimezoneId:(id)a3
{
}

- (NSNumber)travelDistance
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"travelDistance"];
}

- (void)setTravelDistance:(id)a3
{
}

- (NSNumber)travelTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"travelTime"];
}

- (void)setTravelTime:(id)a3
{
}

@end