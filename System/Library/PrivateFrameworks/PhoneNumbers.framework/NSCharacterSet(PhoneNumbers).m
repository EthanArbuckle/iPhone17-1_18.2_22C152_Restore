@interface NSCharacterSet(PhoneNumbers)
+ (uint64_t)pn_verticalServiceCharacterSet;
@end

@implementation NSCharacterSet(PhoneNumbers)

+ (uint64_t)pn_verticalServiceCharacterSet
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"*#"];
}

@end