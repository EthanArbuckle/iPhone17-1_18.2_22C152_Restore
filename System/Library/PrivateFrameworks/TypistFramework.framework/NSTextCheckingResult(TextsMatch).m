@interface NSTextCheckingResult(TextsMatch)
+ (id)matchText:()TextsMatch withPattern:;
@end

@implementation NSTextCheckingResult(TextsMatch)

+ (id)matchText:()TextsMatch withPattern:
{
  v5 = (void *)MEMORY[0x263F08AE8];
  uint64_t v10 = 0;
  id v6 = a3;
  v7 = [v5 regularExpressionWithPattern:a4 options:0 error:&v10];
  v8 = objc_msgSend(v7, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v8;
}

@end