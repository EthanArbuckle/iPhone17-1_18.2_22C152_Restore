@interface SALocalSearchMapItem
+ (id)mapItem;
- (NSArray)attributions;
- (NSData)placeData;
- (NSData)placeData2;
- (NSData)resultDetourInfoData;
- (NSDate)extSessionGuidCreatedTimestamp;
- (NSNumber)distanceInMiles;
- (NSNumber)localSearchProviderId;
- (NSNumber)placeId;
- (NSString)detailType;
- (NSString)directionRole;
- (NSString)extSessionGuid;
- (NSString)label;
- (NSString)spokenAddress;
- (NSString)spokenName;
- (NSString)suggestionsEntryType;
- (SAAceSerializable)detail;
- (SADistance)distance;
- (SALocation)location;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributions:(id)a3;
- (void)setDetail:(id)a3;
- (void)setDetailType:(id)a3;
- (void)setDirectionRole:(id)a3;
- (void)setDistance:(id)a3;
- (void)setDistanceInMiles:(id)a3;
- (void)setExtSessionGuid:(id)a3;
- (void)setExtSessionGuidCreatedTimestamp:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocalSearchProviderId:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPlaceData2:(id)a3;
- (void)setPlaceData:(id)a3;
- (void)setPlaceId:(id)a3;
- (void)setResultDetourInfoData:(id)a3;
- (void)setSpokenAddress:(id)a3;
- (void)setSpokenName:(id)a3;
- (void)setSuggestionsEntryType:(id)a3;
@end

@implementation SALocalSearchMapItem

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"MapItem";
}

+ (id)mapItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)attributions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"attributions", v3);
}

- (void)setAttributions:(id)a3
{
}

- (SAAceSerializable)detail
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"detail");
}

- (void)setDetail:(id)a3
{
}

- (NSString)detailType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"detailType"];
}

- (void)setDetailType:(id)a3
{
}

- (NSString)directionRole
{
  return (NSString *)[(AceObject *)self propertyForKey:@"directionRole"];
}

- (void)setDirectionRole:(id)a3
{
}

- (SADistance)distance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, @"distance");
}

- (void)setDistance:(id)a3
{
}

- (NSNumber)distanceInMiles
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"distanceInMiles"];
}

- (void)setDistanceInMiles:(id)a3
{
}

- (NSString)extSessionGuid
{
  return (NSString *)[(AceObject *)self propertyForKey:@"extSessionGuid"];
}

- (void)setExtSessionGuid:(id)a3
{
}

- (NSDate)extSessionGuidCreatedTimestamp
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"extSessionGuidCreatedTimestamp"];
}

- (void)setExtSessionGuidCreatedTimestamp:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSNumber)localSearchProviderId
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"localSearchProviderId"];
}

- (void)setLocalSearchProviderId:(id)a3
{
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (NSData)placeData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"placeData"];
}

- (void)setPlaceData:(id)a3
{
}

- (NSData)placeData2
{
  return (NSData *)[(AceObject *)self propertyForKey:@"placeData2"];
}

- (void)setPlaceData2:(id)a3
{
}

- (NSNumber)placeId
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"placeId"];
}

- (void)setPlaceId:(id)a3
{
}

- (NSData)resultDetourInfoData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"resultDetourInfoData"];
}

- (void)setResultDetourInfoData:(id)a3
{
}

- (NSString)spokenAddress
{
  return (NSString *)[(AceObject *)self propertyForKey:@"spokenAddress"];
}

- (void)setSpokenAddress:(id)a3
{
}

- (NSString)spokenName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"spokenName"];
}

- (void)setSpokenName:(id)a3
{
}

- (NSString)suggestionsEntryType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"suggestionsEntryType"];
}

- (void)setSuggestionsEntryType:(id)a3
{
}

@end