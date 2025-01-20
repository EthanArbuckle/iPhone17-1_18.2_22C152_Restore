@interface UIImage
@end

@implementation UIImage

void __106__UIImage_UIKit_SiriUIFrameworkAdditions__siriui_semiTransparentChevronImageWithColor_allowNaturalLayout___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F1C6B0] kitImageNamed:@"UITableNext"];
  v2 = [v5 _flatImageWithColor:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 imageFlippedForRightToLeftLayoutDirection];
  v4 = (void *)siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__chevronImage;
  siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__chevronImage = v3;
}

@end