@interface MFMessage(MFMailMessage)
- (uint64_t)storageLocationForAttachment:()MFMailMessage;
@end

@implementation MFMessage(MFMailMessage)

- (uint64_t)storageLocationForAttachment:()MFMailMessage
{
  return 0;
}

@end