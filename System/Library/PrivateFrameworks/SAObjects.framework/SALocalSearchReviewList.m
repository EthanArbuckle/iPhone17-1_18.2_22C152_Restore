@interface SALocalSearchReviewList
+ (id)reviewList;
- (NSArray)selectReviews;
- (NSNumber)totalReviewCount;
- (NSString)providerId2;
- (NSURL)providerId;
- (SALocalSearchRating)rating;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setProviderId2:(id)a3;
- (void)setProviderId:(id)a3;
- (void)setRating:(id)a3;
- (void)setSelectReviews:(id)a3;
- (void)setTotalReviewCount:(id)a3;
@end

@implementation SALocalSearchReviewList

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ReviewList";
}

+ (id)reviewList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)providerId
{
  return (NSURL *)AceObjectURLForProperty(self, @"providerId");
}

- (void)setProviderId:(id)a3
{
}

- (NSString)providerId2
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerId2"];
}

- (void)setProviderId2:(id)a3
{
}

- (SALocalSearchRating)rating
{
  return (SALocalSearchRating *)AceObjectAceObjectForProperty(self, @"rating");
}

- (void)setRating:(id)a3
{
}

- (NSArray)selectReviews
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"selectReviews", v3);
}

- (void)setSelectReviews:(id)a3
{
}

- (NSNumber)totalReviewCount
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"totalReviewCount"];
}

- (void)setTotalReviewCount:(id)a3
{
}

@end