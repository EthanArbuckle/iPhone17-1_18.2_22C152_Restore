@interface NSString(SBPasscodeLockEntryFieldExtras)
- (uint64_t)isNewline;
- (uint64_t)isSingleCharacterAndMemberOfSet:()SBPasscodeLockEntryFieldExtras;
@end

@implementation NSString(SBPasscodeLockEntryFieldExtras)

- (uint64_t)isSingleCharacterAndMemberOfSet:()SBPasscodeLockEntryFieldExtras
{
  id v4 = a3;
  if ([a1 length] == 1) {
    uint64_t v5 = objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", 0));
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)isNewline
{
  v2 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v3 = [a1 isSingleCharacterAndMemberOfSet:v2];

  return v3;
}

@end