@interface SALocalSearchBusiness2
+ (id)business2;
- (NSArray)categories;
- (NSArray)commands;
- (NSArray)offerLists;
- (NSArray)photoList;
- (NSArray)reviewList;
- (NSData)placeData2;
- (NSDate)extSessionGuidCreatedTimestamp;
- (NSDictionary)identifierMap;
- (NSString)currencySymbol;
- (NSString)descriptionText;
- (NSString)extSessionGuid;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)priceRange;
- (NSURL)businessUrl;
- (SALocalSearchOperationHours)operationHours;
- (SALocation)address;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAddress:(id)a3;
- (void)setBusinessUrl:(id)a3;
- (void)setCategories:(id)a3;
- (void)setCommands:(id)a3;
- (void)setCurrencySymbol:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setExtSessionGuid:(id)a3;
- (void)setExtSessionGuidCreatedTimestamp:(id)a3;
- (void)setIdentifierMap:(id)a3;
- (void)setName:(id)a3;
- (void)setOfferLists:(id)a3;
- (void)setOperationHours:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhotoList:(id)a3;
- (void)setPlaceData2:(id)a3;
- (void)setPriceRange:(id)a3;
- (void)setReviewList:(id)a3;
@end

@implementation SALocalSearchBusiness2

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Business2";
}

+ (id)business2
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocation)address
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"address");
}

- (void)setAddress:(id)a3
{
}

- (NSURL)businessUrl
{
  return (NSURL *)AceObjectURLForProperty(self, @"businessUrl");
}

- (void)setBusinessUrl:(id)a3
{
}

- (NSArray)categories
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"categories"];
}

- (void)setCategories:(id)a3
{
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (NSString)currencySymbol
{
  return (NSString *)[(AceObject *)self propertyForKey:@"currencySymbol"];
}

- (void)setCurrencySymbol:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"descriptionText"];
}

- (void)setDescriptionText:(id)a3
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

- (NSDictionary)identifierMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"identifierMap"];
}

- (void)setIdentifierMap:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSArray)offerLists
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"offerLists", v3);
}

- (void)setOfferLists:(id)a3
{
}

- (SALocalSearchOperationHours)operationHours
{
  return (SALocalSearchOperationHours *)AceObjectAceObjectForProperty(self, @"operationHours");
}

- (void)setOperationHours:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phoneNumber"];
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSArray)photoList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"photoList", v3);
}

- (void)setPhotoList:(id)a3
{
}

- (NSData)placeData2
{
  return (NSData *)[(AceObject *)self propertyForKey:@"placeData2"];
}

- (void)setPlaceData2:(id)a3
{
}

- (NSString)priceRange
{
  return (NSString *)[(AceObject *)self propertyForKey:@"priceRange"];
}

- (void)setPriceRange:(id)a3
{
}

- (NSArray)reviewList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"reviewList", v3);
}

- (void)setReviewList:(id)a3
{
}

@end