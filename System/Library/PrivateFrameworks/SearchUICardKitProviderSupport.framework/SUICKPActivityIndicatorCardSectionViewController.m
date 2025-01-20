@interface SUICKPActivityIndicatorCardSectionViewController
+ (id)cardSectionClasses;
- (BOOL)_expectsSearchUIView;
- (BOOL)_isIndicatingActivity;
- (BOOL)_shouldRenderButtonOverlay;
@end

@implementation SUICKPActivityIndicatorCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken_0 != -1) {
    dispatch_once(&cardSectionClasses_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)cardSectionClasses_cardSectionClasses_0;
  return v2;
}

uint64_t __70__SUICKPActivityIndicatorCardSectionViewController_cardSectionClasses__block_invoke()
{
  cardSectionClasses_cardSectionClasses_0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (BOOL)_isIndicatingActivity
{
  return 1;
}

- (BOOL)_shouldRenderButtonOverlay
{
  return 1;
}

- (BOOL)_expectsSearchUIView
{
  return 1;
}

@end