@interface NSURL(SFUtilityAdditions)
+ (__CFString)properlyEscapedString:()SFUtilityAdditions;
+ (id)filePathURLWithEscapes:()SFUtilityAdditions;
+ (id)relativeURLWithEscapes:()SFUtilityAdditions;
+ (void)improperlyEscapedString:()SFUtilityAdditions;
- (uint64_t)isRelative;
@end

@implementation NSURL(SFUtilityAdditions)

+ (__CFString)properlyEscapedString:()SFUtilityAdditions
{
  v3 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, @";?:@&=+$,", 0x8000100u);
  return v3;
}

+ (void)improperlyEscapedString:()SFUtilityAdditions
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@";?:@&=+$#/%<>'\"\\""];
  v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(a3, "length"));
  [v5 appendString:a3];
  uint64_t v6 = [v5 rangeOfCharacterFromSet:v4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    do
    {
      unsigned int v10 = [v5 characterAtIndex:v8];
      [v5 replaceCharactersInRange:v8, v9, objc_msgSend(NSString, "stringWithFormat:", @"_%d_", v10) withString];
      uint64_t v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v4, 2, v8, objc_msgSend(v5, "length") - v8);
      uint64_t v9 = v11;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
  return v5;
}

+ (id)relativeURLWithEscapes:()SFUtilityAdditions
{
  uint64_t v1 = objc_msgSend(a1, "properlyEscapedString:");
  v2 = (void *)[objc_alloc(NSURL) initWithString:v1];
  return v2;
}

+ (id)filePathURLWithEscapes:()SFUtilityAdditions
{
  uint64_t v4 = objc_msgSend(a1, "properlyEscapedString:");
  if ([a3 hasPrefix:@"/"]) {
    v5 = @"file://localhost";
  }
  else {
    v5 = @"file:";
  }
  uint64_t v6 = objc_msgSend(objc_alloc(NSURL), "initWithString:", -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v4));
  return v6;
}

- (uint64_t)isRelative
{
  if (objc_msgSend((id)objc_msgSend(a1, "relativeString"), "isEqual:", objc_msgSend(a1, "absoluteString")))return objc_msgSend((id)objc_msgSend(a1, "path"), "hasPrefix:", @"/") ^ 1; {
  else
  }
    return 1;
}

@end