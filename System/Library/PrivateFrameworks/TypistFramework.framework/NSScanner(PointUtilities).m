@interface NSScanner(PointUtilities)
- (double)scanPoint;
@end

@implementation NSScanner(PointUtilities)

- (double)scanPoint
{
  uint64_t v6 = 0;
  double v7 = 0.0;
  v2 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  v3 = (void *)[v2 mutableCopy];

  [v3 addCharactersInString:@"-"];
  [a1 scanUpToCharactersFromSet:v3 intoString:0];
  [a1 scanDouble:&v7];
  [a1 scanUpToCharactersFromSet:v3 intoString:0];
  [a1 scanDouble:&v6];
  double v4 = v7;

  return v4;
}

@end