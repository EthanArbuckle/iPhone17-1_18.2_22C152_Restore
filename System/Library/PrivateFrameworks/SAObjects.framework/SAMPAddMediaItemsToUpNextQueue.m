@interface SAMPAddMediaItemsToUpNextQueue
+ (id)addMediaItemsToUpNextQueue;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSString)insertLocation;
- (NSString)musicAccountSharedUserId;
- (NSString)speakerSharedUserId;
- (SAMPCollection)mediaCollection;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setInsertLocation:(id)a3;
- (void)setMediaCollection:(id)a3;
- (void)setMusicAccountSharedUserId:(id)a3;
- (void)setSpeakerSharedUserId:(id)a3;
@end

@implementation SAMPAddMediaItemsToUpNextQueue

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"AddMediaItemsToUpNextQueue";
}

+ (id)addMediaItemsToUpNextQueue
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

- (NSString)insertLocation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"insertLocation"];
}

- (void)setInsertLocation:(id)a3
{
}

- (SAMPCollection)mediaCollection
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, @"mediaCollection");
}

- (void)setMediaCollection:(id)a3
{
}

- (NSString)musicAccountSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"musicAccountSharedUserId"];
}

- (void)setMusicAccountSharedUserId:(id)a3
{
}

- (NSString)speakerSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakerSharedUserId"];
}

- (void)setSpeakerSharedUserId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end