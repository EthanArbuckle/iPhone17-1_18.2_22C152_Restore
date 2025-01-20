@interface WBSURLCompletionMatch(WBSURLCompletionMatch_WBSResultRankerExtras)
- (id)titlePrefix;
@end

@implementation WBSURLCompletionMatch(WBSURLCompletionMatch_WBSResultRankerExtras)

- (id)titlePrefix
{
  v1 = [a1 title];
  if ([MEMORY[0x1E4F98318] isStreamlinedCompletionListEnabled])
  {
    uint64_t v2 = [v1 lowercaseString];

    v1 = (void *)v2;
  }
  if ((unint64_t)[v1 length] > 0x63) {
    uint64_t v3 = 100;
  }
  else {
    uint64_t v3 = [v1 length];
  }
  v4 = objc_msgSend(v1, "substringWithRange:", 0, v3);

  return v4;
}

@end