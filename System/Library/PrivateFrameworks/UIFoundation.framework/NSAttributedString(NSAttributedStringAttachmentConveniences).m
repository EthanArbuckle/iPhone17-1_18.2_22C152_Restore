@interface NSAttributedString(NSAttributedStringAttachmentConveniences)
+ (id)attributedStringWithAttachment:()NSAttributedStringAttachmentConveniences;
+ (id)attributedStringWithAttachment:()NSAttributedStringAttachmentConveniences attributes:;
+ (uint64_t)_sharedAttachmentString;
- (uint64_t)initWithAttachment:()NSAttributedStringAttachmentConveniences attributes:;
@end

@implementation NSAttributedString(NSAttributedStringAttachmentConveniences)

+ (id)attributedStringWithAttachment:()NSAttributedStringAttachmentConveniences
{
  if (attributedStringWithAttachment__onceToken != -1) {
    dispatch_once(&attributedStringWithAttachment__onceToken, &__block_literal_global_273);
  }
  if (attributedStringWithAttachment__useInitWithAttachment)
  {
    id v5 = [a1 alloc];
    v6 = (void *)[v5 initWithAttachment:a3 attributes:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B18] _sharedAttachmentString];
    v6 = (void *)[objc_allocWithZone(MEMORY[0x1E4F28E48]) initWithString:v7];
    objc_msgSend(v6, "addAttribute:value:range:", @"NSAttachment", a3, 0, 1);
  }

  return v6;
}

- (uint64_t)initWithAttachment:()NSAttributedStringAttachmentConveniences attributes:
{
  v6 = (void *)[a4 mutableCopy];
  uint64_t v7 = [MEMORY[0x1E4F28B18] _sharedAttachmentString];
  [v6 setObject:a3 forKeyedSubscript:@"NSAttachment"];
  uint64_t v8 = [a1 initWithString:v7 attributes:v6];

  return v8;
}

+ (uint64_t)_sharedAttachmentString
{
  return _NSFaultInObject();
}

+ (id)attributedStringWithAttachment:()NSAttributedStringAttachmentConveniences attributes:
{
  v4 = (void *)[[a1 alloc] initWithAttachment:a3 attributes:a4];

  return v4;
}

@end