@interface NSString(RCAdditions)
+ (uint64_t)rc_stringWithPersistentID:()RCAdditions;
- (id)rc_reversedString;
- (id)rc_stringFromRealPath;
- (uint64_t)rc_stringByReplacingBreakingWithNonBreakingSpaces;
@end

@implementation NSString(RCAdditions)

- (uint64_t)rc_stringByReplacingBreakingWithNonBreakingSpaces
{
  return [a1 stringByReplacingOccurrencesOfString:@" " withString:@" "];
}

+ (uint64_t)rc_stringWithPersistentID:()RCAdditions
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lli", a3);
}

- (id)rc_reversedString
{
  v2 = objc_opt_new();
  uint64_t v3 = [a1 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__NSString_RCAdditions__rc_reversedString__block_invoke;
  v6[3] = &unk_1E6496D60;
  id v4 = v2;
  id v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 258, v6);

  return v4;
}

- (id)rc_stringFromRealPath
{
  v1 = realpath_DARWIN_EXTSN((const char *)[a1 fileSystemRepresentation], 0);
  if (v1)
  {
    v2 = v1;
    uint64_t v3 = [NSString stringWithUTF8String:v1];
    free(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

@end