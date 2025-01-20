@interface UIImage(UIKit_SiriUIFrameworkAdditions)
+ (id)siriui_semiTransparentChevronImageAndAllowNaturalLayout:()UIKit_SiriUIFrameworkAdditions;
+ (id)siriui_semiTransparentChevronImageWithColor:()UIKit_SiriUIFrameworkAdditions allowNaturalLayout:;
+ (uint64_t)siriui_semiTransparentChevronImage;
@end

@implementation UIImage(UIKit_SiriUIFrameworkAdditions)

+ (uint64_t)siriui_semiTransparentChevronImage
{
  return objc_msgSend(a1, "siriui_semiTransparentChevronImageAndAllowNaturalLayout:", 0);
}

+ (id)siriui_semiTransparentChevronImageAndAllowNaturalLayout:()UIKit_SiriUIFrameworkAdditions
{
  v4 = (void *)MEMORY[0x263F1C6B0];
  v5 = objc_msgSend(MEMORY[0x263F1C550], "siriui_semiTransparentTextColor");
  v6 = objc_msgSend(v4, "siriui_semiTransparentChevronImageWithColor:allowNaturalLayout:", v5, a3);

  return v6;
}

+ (id)siriui_semiTransparentChevronImageWithColor:()UIKit_SiriUIFrameworkAdditions allowNaturalLayout:
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__UIImage_UIKit_SiriUIFrameworkAdditions__siriui_semiTransparentChevronImageWithColor_allowNaturalLayout___block_invoke;
  block[3] = &unk_26469EFA8;
  id v9 = v3;
  uint64_t v4 = siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__onceToken, block);
  }
  id v6 = (id)siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__chevronImage;

  return v6;
}

@end