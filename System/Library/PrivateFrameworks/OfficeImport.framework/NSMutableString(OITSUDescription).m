@interface NSMutableString(OITSUDescription)
- (void)tsu_indentBy:()OITSUDescription;
@end

@implementation NSMutableString(OITSUDescription)

- (void)tsu_indentBy:()OITSUDescription
{
  v5 = (void *)[@"          " mutableCopy];
  id v6 = v5;
  while ([v5 length] < a3)
  {
    [v6 appendString:v6];
    v5 = v6;
  }
  objc_msgSend(v6, "deleteCharactersInRange:", a3, objc_msgSend(v6, "length") - a3);
  [a1 insertString:v6 atIndex:0];
  [a1 replaceOccurrencesOfString:@"\n", objc_msgSend(NSString, "stringWithFormat:", @"\n%@", v6), 0, 0, objc_msgSend(a1, "length") withString options range];
}

@end