@interface NSCharacterSet(TelephonyUtilities)
+ (uint64_t)phoneNumberSeparatorCharacterSet;
@end

@implementation NSCharacterSet(TelephonyUtilities)

+ (uint64_t)phoneNumberSeparatorCharacterSet
{
  return [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" –_-()+"];
}

@end