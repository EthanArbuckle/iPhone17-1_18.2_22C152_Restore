@interface NSString
- (BOOL)mf_isScrollConversationViewTest;
- (BOOL)mf_isScrollMessageListTest;
- (BOOL)mf_isSelectConversationTest;
- (id)mf_fancyRedactedString;
@end

@implementation NSString

- (BOOL)mf_isScrollMessageListTest
{
  if ([(NSString *)self mf_containsSubstring:@"ScrollMessageList"]) {
    return 1;
  }

  return [(NSString *)self mf_containsSubstring:@"ScrollSenderListNatural"];
}

- (BOOL)mf_isScrollConversationViewTest
{
  if ([(NSString *)self mf_containsSubstring:@"ScrollConversationView"]) {
    return 1;
  }

  return [(NSString *)self mf_containsSubstring:@"ScrollDigestViewNatural"];
}

- (BOOL)mf_isSelectConversationTest
{
  if ([(NSString *)self mf_containsSubstring:@"SelectConversation"]) {
    return 1;
  }

  return [(NSString *)self mf_containsSubstring:@"SelectDigestView"];
}

- (id)mf_fancyRedactedString
{
  NSUInteger v2 = [(NSString *)self length];
  if (v2)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%@; length = %lu]",
      @"<REDACTED>",
      v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"[Empty String]";
  }

  return v3;
}

@end