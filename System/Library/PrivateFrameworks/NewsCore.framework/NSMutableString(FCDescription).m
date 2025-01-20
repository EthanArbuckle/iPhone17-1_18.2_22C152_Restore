@interface NSMutableString(FCDescription)
- (void)indentBy:()FCDescription;
@end

@implementation NSMutableString(FCDescription)

- (void)indentBy:()FCDescription
{
  v5 = (void *)[@"          " mutableCopy];
  id v7 = v5;
  while ([v5 length] < a3)
  {
    [v7 appendString:v7];
    v5 = v7;
  }
  objc_msgSend(v7, "deleteCharactersInRange:", a3, objc_msgSend(v7, "length") - a3);
  [a1 insertString:v7 atIndex:0];
  v6 = [NSString stringWithFormat:@"\n%@", v7];
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\n", v6, 0, 0, objc_msgSend(a1, "length"));
}

@end