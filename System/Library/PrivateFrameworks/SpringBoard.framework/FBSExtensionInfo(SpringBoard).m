@interface FBSExtensionInfo(SpringBoard)
- (uint64_t)sb_type;
@end

@implementation FBSExtensionInfo(SpringBoard)

- (uint64_t)sb_type
{
  v1 = [a1 typeIdentifier];
  if ([v1 isEqualToString:@"com.apple.services"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"com.apple.ui-services"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"com.apple.keyboard-service"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"com.apple.fileprovider-ui"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"com.apple.fileprovider-nonui"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"com.apple.photo-editing"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"com.apple.share-services"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"com.apple.widget-extension"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"com.apple.watchkit"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"com.apple.usernotifications.service"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"com.apple.usernotifications.content-extension"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"com.apple.callkit.call-directory"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"com.apple.message-payload-provider"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"com.apple.intents-ui-service"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"com.apple.intents-service"])
  {
    uint64_t v2 = 18;
  }
  else if (([v1 isEqualToString:@"com.apple.broadcast-services"] & 1) != 0 {
         || ([v1 isEqualToString:@"com.apple.Safari.sharedlinks-service"] & 1) != 0)
  }
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"com.apple.Safari.content-blocker"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"com.apple.spotlight.index"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"com.apple.AudioUnit-UI"])
  {
    uint64_t v2 = 13;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end