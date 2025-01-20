@interface SCKPInteractiveCardSectionViewController
+ (id)cardSectionClasses;
- (BOOL)_shouldRenderButtonOverlay;
- (void)_loadCardSectionView;
@end

@implementation SCKPInteractiveCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken != -1) {
    dispatch_once(&cardSectionClasses_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)cardSectionClasses_cardSectionClasses;

  return v2;
}

uint64_t __62__SCKPInteractiveCardSectionViewController_cardSectionClasses__block_invoke()
{
  cardSectionClasses_cardSectionClasses = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (void)_loadCardSectionView
{
  v4.receiver = self;
  v4.super_class = (Class)SCKPInteractiveCardSectionViewController;
  [(CRKCardSectionViewController *)&v4 _loadCardSectionView];
  v3 = [(SCKPInteractiveCardSectionViewController *)self view];
  [v3 setInterceptsTouches:0];
}

- (BOOL)_shouldRenderButtonOverlay
{
  return 0;
}

@end