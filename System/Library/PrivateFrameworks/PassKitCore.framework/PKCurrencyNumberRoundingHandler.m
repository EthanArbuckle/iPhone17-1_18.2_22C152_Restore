@interface PKCurrencyNumberRoundingHandler
@end

@implementation PKCurrencyNumberRoundingHandler

void ___PKCurrencyNumberRoundingHandler_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:4 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  v1 = (void *)qword_1EB402940;
  qword_1EB402940 = v0;
}

@end