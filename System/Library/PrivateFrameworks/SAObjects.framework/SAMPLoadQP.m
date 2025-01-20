@interface SAMPLoadQP
+ (id)loadQP;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSNumber)startPlaying;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setStartPlaying:(id)a3;
@end

@implementation SAMPLoadQP

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"LoadQP";
}

+ (id)loadQP
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (NSNumber)startPlaying
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"startPlaying"];
}

- (void)setStartPlaying:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end