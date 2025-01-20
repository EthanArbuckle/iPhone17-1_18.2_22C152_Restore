@interface SALocalSearchBusiness
+ (id)business;
- (NSArray)categories;
- (NSArray)phoneNumbers;
- (NSArray)reviews;
- (NSDate)extSessionGuidCreatedTimestamp;
- (NSDictionary)businessIds;
- (NSNumber)businessId;
- (NSString)extSessionGuid;
- (NSString)name;
- (NSString)openingHours;
- (NSURL)businessUrl;
- (NSURL)photo;
- (SALocalSearchRating)rating;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)totalNumberOfReviews;
- (void)setBusinessId:(id)a3;
- (void)setBusinessIds:(id)a3;
- (void)setBusinessUrl:(id)a3;
- (void)setCategories:(id)a3;
- (void)setExtSessionGuid:(id)a3;
- (void)setExtSessionGuidCreatedTimestamp:(id)a3;
- (void)setName:(id)a3;
- (void)setOpeningHours:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPhoto:(id)a3;
- (void)setRating:(id)a3;
- (void)setReviews:(id)a3;
- (void)setTotalNumberOfReviews:(int64_t)a3;
@end

@implementation SALocalSearchBusiness

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Business";
}

+ (id)business
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)businessId
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"businessId"];
}

- (void)setBusinessId:(id)a3
{
}

- (NSDictionary)businessIds
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"businessIds"];
}

- (void)setBusinessIds:(id)a3
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

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSString)openingHours
{
  return (NSString *)[(AceObject *)self propertyForKey:@"openingHours"];
}

- (void)setOpeningHours:(id)a3
{
}

- (NSArray)phoneNumbers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"phoneNumbers", v3);
}

- (void)setPhoneNumbers:(id)a3
{
}

- (NSURL)photo
{
  return (NSURL *)AceObjectURLForProperty(self, @"photo");
}

- (void)setPhoto:(id)a3
{
}

- (SALocalSearchRating)rating
{
  return (SALocalSearchRating *)AceObjectAceObjectForProperty(self, @"rating");
}

- (void)setRating:(id)a3
{
}

- (NSArray)reviews
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"reviews", v3);
}

- (void)setReviews:(id)a3
{
}

- (int64_t)totalNumberOfReviews
{
  return AceObjectIntegerForProperty(self, @"totalNumberOfReviews");
}

- (void)setTotalNumberOfReviews:(int64_t)a3
{
}

@end