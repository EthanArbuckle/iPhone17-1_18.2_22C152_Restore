@interface PASGetQuotationMarkCharacterSet
@end

@implementation PASGetQuotationMarkCharacterSet

CFCharacterSetRef ___PASGetQuotationMarkCharacterSet_block_invoke()
{
  CFCharacterSetRef result = CFCharacterSetCreateWithCharactersInString(0, @"\"'«»‘’‚‛“”„‟‹›「」『』〝〞〟﹁﹂﹃﹄＂＇｢｣");
  _PASGetQuotationMarkCharacterSet_quotationMarks = (uint64_t)result;
  return result;
}

@end