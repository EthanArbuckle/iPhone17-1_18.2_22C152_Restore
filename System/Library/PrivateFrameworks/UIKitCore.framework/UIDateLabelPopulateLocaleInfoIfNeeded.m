@interface UIDateLabelPopulateLocaleInfoIfNeeded
@end

@implementation UIDateLabelPopulateLocaleInfoIfNeeded

void ___UIDateLabelPopulateLocaleInfoIfNeeded_block_invoke()
{
  _UIDateLabelUpdateLocaleInfo();
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = [v2 addObserverForName:0x1ED15D020 object:0 queue:0 usingBlock:&__block_literal_global_119_1];
  v1 = (void *)_UIDateLabelPopulateLocaleInfoIfNeeded_token;
  _UIDateLabelPopulateLocaleInfoIfNeeded_token = v0;
}

@end