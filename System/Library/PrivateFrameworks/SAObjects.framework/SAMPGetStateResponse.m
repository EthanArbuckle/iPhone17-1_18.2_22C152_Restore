@interface SAMPGetStateResponse
+ (id)getStateResponse;
- (BOOL)requiresResponse;
- (NSNumber)listeningToMusicApplication;
- (NSString)hashedGroupID;
- (NSString)source;
- (SAMPMediaItem)listeningToItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)state;
- (void)setHashedGroupID:(id)a3;
- (void)setListeningToItem:(id)a3;
- (void)setListeningToMusicApplication:(id)a3;
- (void)setSource:(id)a3;
- (void)setState:(int)a3;
@end

@implementation SAMPGetStateResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GetStateResponse";
}

+ (id)getStateResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)hashedGroupID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hashedGroupID"];
}

- (void)setHashedGroupID:(id)a3
{
}

- (SAMPMediaItem)listeningToItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, @"listeningToItem");
}

- (void)setListeningToItem:(id)a3
{
}

- (NSNumber)listeningToMusicApplication
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"listeningToMusicApplication"];
}

- (void)setListeningToMusicApplication:(id)a3
{
}

- (NSString)source
{
  return (NSString *)[(AceObject *)self propertyForKey:@"source"];
}

- (void)setSource:(id)a3
{
}

- (int)state
{
  id v2 = [(AceObject *)self propertyForKey:@"state"];
  int v3 = SAMPPlayStateForString(v2);

  return v3;
}

- (void)setState:(int)a3
{
  stringForSAMPPlayState(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"state", v4);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end