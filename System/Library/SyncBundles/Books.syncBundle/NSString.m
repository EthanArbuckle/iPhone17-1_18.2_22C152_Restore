@interface NSString
- (id)numberFromHexDigits;
@end

@implementation NSString

- (id)numberFromHexDigits
{
  id result = [(NSString *)self length];
  if (result)
  {
    uint64_t v5 = 0;
    unsigned int v4 = [+[NSScanner scannerWithString:self] scanHexLongLong:&v5];
    id result = 0;
    if (v4) {
      return +[NSNumber numberWithUnsignedLongLong:v5];
    }
  }
  return result;
}

@end