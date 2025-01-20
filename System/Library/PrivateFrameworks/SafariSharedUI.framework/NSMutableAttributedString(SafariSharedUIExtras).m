@interface NSMutableAttributedString(SafariSharedUIExtras)
- (BOOL)safari_replaceOccurrenceOfString:()SafariSharedUIExtras withString:link:;
@end

@implementation NSMutableAttributedString(SafariSharedUIExtras)

- (BOOL)safari_replaceOccurrenceOfString:()SafariSharedUIExtras withString:link:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [a1 string];
  uint64_t v12 = [v11 rangeOfString:v10];
  uint64_t v14 = v13;

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4F42530], v9, v12, v14);
    objc_msgSend(a1, "replaceCharactersInRange:withString:", v12, v14, v8);
  }

  return v12 != 0x7FFFFFFFFFFFFFFFLL;
}

@end