@interface NSCharacterSet(FTCallHistorySearchModuleAdditions)
+ (uint64_t)phoneNumberSeparatorCharacterSet;
@end

@implementation NSCharacterSet(FTCallHistorySearchModuleAdditions)

+ (uint64_t)phoneNumberSeparatorCharacterSet
{
  return [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" –_-()+"];
}

@end