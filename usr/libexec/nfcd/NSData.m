@interface NSData
- ($BE749665CD263385F3F5ED554982D87D)DERItem;
@end

@implementation NSData

- ($BE749665CD263385F3F5ED554982D87D)DERItem
{
  v2 = self;
  id v3 = [(NSData *)v2 bytes];
  NSUInteger v4 = [(NSData *)v2 length];
  v5 = (char *)v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

@end