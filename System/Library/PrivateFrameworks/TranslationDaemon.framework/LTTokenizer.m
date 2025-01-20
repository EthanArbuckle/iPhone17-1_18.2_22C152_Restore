@interface LTTokenizer
@end

@implementation LTTokenizer

void __41___LTTokenizer__tokenizeString_inLocale___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
}

@end