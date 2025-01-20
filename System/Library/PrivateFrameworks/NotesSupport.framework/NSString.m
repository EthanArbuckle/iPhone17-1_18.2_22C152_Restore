@interface NSString
@end

@implementation NSString

uint64_t __54__NSString_IC__ic_whitespaceAndNewlineCoalescedString__block_invoke()
{
  ic_whitespaceAndNewlineCoalescedString_regex = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[\r\n\\s]+" options:0 error:0];
  return MEMORY[0x270F9A758]();
}

BOOL __54__NSString_IC__ic_stringByRemovingWhitespaceOnlyLines__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  v4 = [v2 whitespaceAndNewlineCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  BOOL v6 = [v5 length] != 0;
  return v6;
}

void __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  if ([v9 isEqualToString:*MEMORY[0x263F082F8]]
    && (unint64_t)[v9 length] >= *(void *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    [v7 addObject:v8];
  }
}

uint64_t __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke_133(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:a2];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v3 appendString:@" "];
}

void __58__NSString_IC__ic_stringByReplacingCharactersInStringMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v12 = v3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v12;
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = (void *)MEMORY[0x263F08D40];
  uint64_t v9 = [v3 range];
  v11 = objc_msgSend(v8, "valueWithRange:", v9, v10);
  [v4 addObject:v11];
}

NSUInteger __41__NSString_IC__ic_sentenceRangeForRange___block_invoke(uint64_t a1, int a2, NSRange range1, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  NSUInteger length = range1.length;
  NSUInteger location = range1.location;
  NSRange v17 = *(NSRange *)(a1 + 40);
  v16.NSUInteger location = location;
  v16.NSUInteger length = length;
  NSRange v12 = NSIntersectionRange(v16, v17);
  if (v12.length) {
    BOOL v13 = v12.location == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    v12.NSUInteger location = *(void *)(v14 + 32);
    if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v14 + 32) = location;
      *(void *)(v14 + 40) = length;
    }
    else
    {
      v12.NSUInteger length = *(void *)(v14 + 40);
      v18.NSUInteger location = location;
      v18.NSUInteger length = length;
      NSRange v12 = NSUnionRange(v12, v18);
      *(NSRange *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v12;
    }
  }
  if ((unint64_t)(a4 + a5) > *(void *)(a1 + 48) + *(void *)(a1 + 40)) {
    *a6 = 1;
  }
  return v12.location;
}

unint64_t __38__NSString_IC__ic_lengthOfLongestLine__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a2 length];
  if (v3 <= result) {
    unint64_t v5 = result;
  }
  else {
    unint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

id __45__NSString_HTMLStrings___HTMLTagNameClosing___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAtEnd])
  {
    v2 = 0;
  }
  else
  {
    unint64_t v3 = [*(id *)(a1 + 32) string];
    v2 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "scanLocation"));
  }
  return v2;
}

@end