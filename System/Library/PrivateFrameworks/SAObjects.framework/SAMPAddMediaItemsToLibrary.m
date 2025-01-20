@interface SAMPAddMediaItemsToLibrary
+ (id)addMediaItemsToLibrary;
- (BOOL)requiresResponse;
- (NSString)influencedUserSharedUserId;
- (SAMPCollection)mediaItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInfluencedUserSharedUserId:(id)a3;
- (void)setMediaItems:(id)a3;
@end

@implementation SAMPAddMediaItemsToLibrary

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"AddMediaItemsToLibrary";
}

+ (id)addMediaItemsToLibrary
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)influencedUserSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"influencedUserSharedUserId"];
}

- (void)setInfluencedUserSharedUserId:(id)a3
{
}

- (SAMPCollection)mediaItems
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, @"mediaItems");
}

- (void)setMediaItems:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end