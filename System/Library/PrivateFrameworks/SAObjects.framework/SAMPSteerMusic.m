@interface SAMPSteerMusic
+ (id)steerMusic;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSString)steerableBlob;
- (SAMPCollection)currentListeningToCollection;
- (SAMPMediaItem)currentListeningToItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCurrentListeningToCollection:(id)a3;
- (void)setCurrentListeningToItem:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setSteerableBlob:(id)a3;
@end

@implementation SAMPSteerMusic

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SteerMusic";
}

+ (id)steerMusic
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMPCollection)currentListeningToCollection
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, @"currentListeningToCollection");
}

- (void)setCurrentListeningToCollection:(id)a3
{
}

- (SAMPMediaItem)currentListeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, @"currentListeningToItem");
}

- (void)setCurrentListeningToItem:(id)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (NSString)steerableBlob
{
  return (NSString *)[(AceObject *)self propertyForKey:@"steerableBlob"];
}

- (void)setSteerableBlob:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end