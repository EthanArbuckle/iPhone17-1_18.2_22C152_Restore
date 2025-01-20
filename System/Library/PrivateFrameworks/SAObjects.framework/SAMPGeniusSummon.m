@interface SAMPGeniusSummon
+ (id)geniusSummon;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSNumber)startPlaying;
- (NSString)upNextQueueInsertLocation;
- (SAMPMediaItem)mediaItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setStartPlaying:(id)a3;
- (void)setUpNextQueueInsertLocation:(id)a3;
@end

@implementation SAMPGeniusSummon

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GeniusSummon";
}

+ (id)geniusSummon
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

- (SAMPMediaItem)mediaItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, @"mediaItem");
}

- (void)setMediaItem:(id)a3
{
}

- (NSNumber)startPlaying
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"startPlaying"];
}

- (void)setStartPlaying:(id)a3
{
}

- (NSString)upNextQueueInsertLocation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"upNextQueueInsertLocation"];
}

- (void)setUpNextQueueInsertLocation:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end