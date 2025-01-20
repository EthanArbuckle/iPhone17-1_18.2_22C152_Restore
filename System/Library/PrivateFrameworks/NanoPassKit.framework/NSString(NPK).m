@interface NSString(NPK)
- (BOOL)npkHasContent;
- (uint64_t)isAllCaps;
@end

@implementation NSString(NPK)

- (BOOL)npkHasContent
{
  v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (uint64_t)isAllCaps
{
  if ([a1 isEqualToString:&stru_26CFEBA18]) {
    return 0;
  }
  v3 = [a1 uppercaseString];
  uint64_t v4 = [v3 isEqualToString:a1];

  return v4;
}

@end