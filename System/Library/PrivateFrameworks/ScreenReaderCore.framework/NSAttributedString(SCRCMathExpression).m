@interface NSAttributedString(SCRCMathExpression)
+ (id)_scrcStringWithFormat:()SCRCMathExpression args:;
+ (id)scrcString;
+ (id)scrcStringWithDollarCode:()SCRCMathExpression treePosition:;
+ (id)scrcStringWithFormat:()SCRCMathExpression;
+ (id)scrcStringWithLiteralString:()SCRCMathExpression treePosition:;
+ (id)scrcStringWithString:()SCRCMathExpression treePosition:;
+ (uint64_t)scrcPauseString;
+ (uint64_t)scrcSpaceString;
+ (uint64_t)scrcStringWithLiteralString:()SCRCMathExpression;
+ (uint64_t)scrcStringWithString:()SCRCMathExpression;
- (id)scrcStringByAddingAttribute:()SCRCMathExpression value:;
- (id)scrcStringByAppendingAttributedString:()SCRCMathExpression;
- (id)scrcStringByReplacingOccurrencesOfString:()SCRCMathExpression withString:;
- (uint64_t)_scrcHasPauseCommaAtIndex:()SCRCMathExpression;
- (uint64_t)_scrcRangeOfFormatSpecifierWithIndex:()SCRCMathExpression;
- (uint64_t)_scrcRangeOfVanillaFormatSpecifier;
- (uint64_t)scrcContainsPause;
@end

@implementation NSAttributedString(SCRCMathExpression)

- (uint64_t)_scrcRangeOfVanillaFormatSpecifier
{
  v1 = [a1 string];
  uint64_t v2 = [v1 rangeOfString:@"%@"];

  return v2;
}

- (uint64_t)_scrcRangeOfFormatSpecifierWithIndex:()SCRCMathExpression
{
  v4 = [a1 string];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%%%lu$@", a3);
  uint64_t v6 = [v4 rangeOfString:v5];

  return v6;
}

+ (id)_scrcStringWithFormat:()SCRCMathExpression args:
{
  id v6 = a3;
  v25 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
  uint64_t v8 = [v7 _scrcRangeOfVanillaFormatSpecifier];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    do
    {
      v12 = v25++;
      id v13 = *v12;
      if (!v13)
      {
        id v13 = [MEMORY[0x263F086A0] scrcStringWithString:@"(null)"];
      }
      objc_msgSend(v7, "replaceCharactersInRange:withAttributedString:", v10, v11, v13);
      uint64_t v10 = [v7 _scrcRangeOfVanillaFormatSpecifier];
      uint64_t v11 = v14;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }
  uint64_t v15 = [v7 _scrcRangeOfFormatSpecifierWithIndex:1];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = v15;
    uint64_t v18 = v16;
    uint64_t v19 = 2;
    do
    {
      v20 = v25++;
      id v21 = *v20;
      if (!v21)
      {
        id v21 = [MEMORY[0x263F086A0] scrcStringWithString:@"(null)"];
      }
      objc_msgSend(v7, "replaceCharactersInRange:withAttributedString:", v17, v18, v21);
      uint64_t v17 = [v7 _scrcRangeOfFormatSpecifierWithIndex:v19];
      uint64_t v18 = v22;

      ++v19;
    }
    while (v17 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v23 = (void *)[[a1 alloc] initWithAttributedString:v7];

  return v23;
}

+ (id)scrcStringWithFormat:()SCRCMathExpression
{
  uint64_t v9 = [a1 _scrcStringWithFormat:a3 args:&a9];
  return v9;
}

+ (uint64_t)scrcStringWithString:()SCRCMathExpression
{
  return [a1 scrcStringWithString:a3 treePosition:0];
}

+ (id)scrcStringWithString:()SCRCMathExpression treePosition:
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
    uint64_t v11 = @"kSCRCMathStringAttributeTreePosition";
    v12[0] = a4;
    v7 = NSDictionary;
    id v8 = a4;
    a4 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  uint64_t v9 = (void *)[[a1 alloc] initWithString:v6 attributes:a4];

  return v9;
}

+ (uint64_t)scrcStringWithLiteralString:()SCRCMathExpression
{
  return [a1 scrcStringWithLiteralString:a3 treePosition:0];
}

+ (id)scrcStringWithLiteralString:()SCRCMathExpression treePosition:
{
  v21[2] = *MEMORY[0x263EF8340];
  if (a4)
  {
    v20[0] = @"kSCRCMathStringAttributeSpeakLiteralCharacters";
    v20[1] = @"kSCRCMathStringAttributeTreePosition";
    v21[0] = MEMORY[0x263EFFA88];
    v21[1] = a4;
    id v6 = NSDictionary;
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = v21;
    uint64_t v10 = (__CFString **)v20;
    uint64_t v11 = v6;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v18 = @"kSCRCMathStringAttributeSpeakLiteralCharacters";
    uint64_t v19 = MEMORY[0x263EFFA88];
    id v13 = NSDictionary;
    id v7 = 0;
    id v14 = a3;
    uint64_t v9 = &v19;
    uint64_t v10 = &v18;
    uint64_t v11 = v13;
    uint64_t v12 = 1;
  }
  uint64_t v15 = [v11 dictionaryWithObjects:v9 forKeys:v10 count:v12];

  uint64_t v16 = (void *)[[a1 alloc] initWithString:a3 attributes:v15];
  return v16;
}

+ (id)scrcStringWithDollarCode:()SCRCMathExpression treePosition:
{
  id v6 = a4;
  id v7 = [NSString stringWithDollarCode:a3];
  if ([v7 length])
  {
    id v8 = [a1 scrcStringWithString:v7 treePosition:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)scrcString
{
  id v1 = objc_alloc_init(a1);
  return v1;
}

+ (uint64_t)scrcPauseString
{
  return [a1 scrcStringWithString:@", "];
}

+ (uint64_t)scrcSpaceString
{
  return [a1 scrcStringWithString:@" "];
}

- (id)scrcStringByAppendingAttributedString:()SCRCMathExpression
{
  v4 = (objc_class *)MEMORY[0x263F089B8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithAttributedString:a1];
  objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", objc_msgSend(a1, "length"), 0, v5);

  id v7 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v6];
  return v7;
}

- (id)scrcStringByReplacingOccurrencesOfString:()SCRCMathExpression withString:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:a1];
  uint64_t v9 = [v8 string];
  uint64_t v10 = [v9 rangeOfString:v6];
  uint64_t v12 = v11;

  while (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "replaceCharactersInRange:withString:", v10, v12, v7);
    id v13 = [v8 string];
    uint64_t v10 = [v13 rangeOfString:v6];
    uint64_t v12 = v14;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v8];

  return v15;
}

- (id)scrcStringByAddingAttribute:()SCRCMathExpression value:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[a1 mutableCopy];
  objc_msgSend(v8, "addAttribute:value:range:", v7, v6, 0, objc_msgSend(a1, "length"));

  return v8;
}

- (uint64_t)_scrcHasPauseCommaAtIndex:()SCRCMathExpression
{
  id v5 = [a1 string];
  int v6 = [v5 characterAtIndex:a3];

  if (v6 != 44) {
    return 0;
  }
  id v7 = [a1 attribute:@"kSCRCMathStringAttributeSpeakLiteralCharacters" atIndex:a3 effectiveRange:0];
  uint64_t v8 = [v7 BOOLValue] ^ 1;

  return v8;
}

- (uint64_t)scrcContainsPause
{
  uint64_t result = [a1 length];
  if (result)
  {
    unint64_t v3 = result;
    if ([a1 _scrcHasPauseCommaAtIndex:0])
    {
      return 1;
    }
    else
    {
      uint64_t v4 = 1;
      do
      {
        unint64_t v5 = v4;
        if (v3 == v4) {
          break;
        }
        int v6 = [a1 _scrcHasPauseCommaAtIndex:v4];
        uint64_t v4 = v5 + 1;
      }
      while (!v6);
      return v5 < v3;
    }
  }
  return result;
}

@end