@interface NSString(SplitWithLimit)
- (id)componentsSeparatedByString:()SplitWithLimit limit:;
@end

@implementation NSString(SplitWithLimit)

- (id)componentsSeparatedByString:()SplitWithLimit limit:
{
  id v6 = a3;
  if (a4)
  {
    v7 = [MEMORY[0x263EFF980] array];
    v8 = [MEMORY[0x263F08B08] scannerWithString:a1];
    if (([v8 isAtEnd] & 1) == 0 && a4 != 1)
    {
      id v9 = 0;
      unint64_t v10 = 2;
      do
      {
        v11 = v9;
        id v17 = v9;
        int v12 = [v8 scanUpToString:v6 intoString:&v17];
        id v9 = v17;

        if (v12) {
          [v7 addObject:v9];
        }
        [v8 scanString:v6 intoString:0];
        if ([v8 isAtEnd]) {
          break;
        }
      }
      while (v10++ < a4);
    }
    v14 = objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v8, "scanLocation"));
    [v7 addObject:v14];
    v15 = (void *)[v7 copy];
  }
  else
  {
    v15 = (void *)MEMORY[0x263EFFA68];
  }

  return v15;
}

@end