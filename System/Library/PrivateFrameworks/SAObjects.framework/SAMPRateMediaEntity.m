@interface SAMPRateMediaEntity
+ (id)rateMediaEntity;
- (BOOL)requiresResponse;
- (NSString)hashedRouteUID;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)rating;
- (void)setHashedRouteUID:(id)a3;
- (void)setRating:(int64_t)a3;
@end

@implementation SAMPRateMediaEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"RateMediaEntity";
}

+ (id)rateMediaEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)hashedRouteUID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hashedRouteUID"];
}

- (void)setHashedRouteUID:(id)a3
{
}

- (int64_t)rating
{
  return AceObjectIntegerForProperty(self, @"rating");
}

- (void)setRating:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end