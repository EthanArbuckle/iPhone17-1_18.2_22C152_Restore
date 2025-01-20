@interface NSString(SCRCMathExpression)
+ (id)stringWithDollarCode:()SCRCMathExpression;
- (id)stringWrappedInMathMLTag:()SCRCMathExpression withAttributes:;
- (uint64_t)stringWrappedInMathMLTag:()SCRCMathExpression;
@end

@implementation NSString(SCRCMathExpression)

+ (id)stringWithDollarCode:()SCRCMathExpression
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [a1 stringWithFormat:@"%@%@%@", @"\x1C", v4, @"\x1F"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)stringWrappedInMathMLTag:()SCRCMathExpression
{
  return [a1 stringWrappedInMathMLTag:a3 withAttributes:0];
}

- (id)stringWrappedInMathMLTag:()SCRCMathExpression withAttributes:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@", v6];
  unint64_t v9 = [v7 count];
  if (v9 >= 2)
  {
    unint64_t v10 = v9 >> 1;
    uint64_t v11 = 1;
    do
    {
      v12 = [v7 objectAtIndex:v11 - 1];
      v13 = [v7 objectAtIndex:v11];
      [v8 appendFormat:@" %@=\"%@\"", v12, v13];

      v11 += 2;
      --v10;
    }
    while (v10);
  }
  [v8 appendString:@">"];
  v14 = [NSString stringWithFormat:@"</%@>", v6];
  v15 = [NSString stringWithFormat:@"%@%@%@", v8, a1, v14];

  return v15;
}

@end