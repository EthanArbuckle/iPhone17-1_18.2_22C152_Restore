@interface MFMessageStore(MailMessageStore)
- (uint64_t)storagePath;
@end

@implementation MFMessageStore(MailMessageStore)

- (uint64_t)storagePath
{
  return 0;
}

@end