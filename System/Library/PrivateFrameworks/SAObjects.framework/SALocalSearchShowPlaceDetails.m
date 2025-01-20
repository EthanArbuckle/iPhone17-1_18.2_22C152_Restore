@interface SALocalSearchShowPlaceDetails
+ (id)showPlaceDetails;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)itemIndex;
- (void)setItemIndex:(int64_t)a3;
@end

@implementation SALocalSearchShowPlaceDetails

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ShowPlaceDetails";
}

+ (id)showPlaceDetails
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)itemIndex
{
  return AceObjectIntegerForProperty(self, @"itemIndex");
}

- (void)setItemIndex:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end