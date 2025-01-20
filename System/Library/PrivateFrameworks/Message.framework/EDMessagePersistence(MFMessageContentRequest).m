@interface EDMessagePersistence(MFMessageContentRequest)
- (uint64_t)mailDropAttachmentPresentForMessage:()MFMessageContentRequest;
- (uint64_t)setIsMailDropAttachmentPresent:()MFMessageContentRequest forMessage:;
@end

@implementation EDMessagePersistence(MFMessageContentRequest)

- (uint64_t)mailDropAttachmentPresentForMessage:()MFMessageContentRequest
{
  v3 = [a1 cachedMetadataJSONForKey:@"maild.isMailDropAttachmentPresent" messageID:a3];
  if ([v3 isEqualToString:@"1"])
  {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else if ([v3 isEqualToString:@"0"])
  {
    uint64_t v4 = MEMORY[0x1E4F1CC28];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)setIsMailDropAttachmentPresent:()MFMessageContentRequest forMessage:
{
  if (a3) {
    uint64_t v4 = @"1";
  }
  else {
    uint64_t v4 = @"0";
  }
  return [a1 setCachedMetadataJSON:v4 forKey:@"maild.isMailDropAttachmentPresent" messageID:a4];
}

@end