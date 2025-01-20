@interface WFLinkAction(ChronoServices)
- (void)setWidgetFamily:()ChronoServices;
@end

@implementation WFLinkAction(ChronoServices)

- (void)setWidgetFamily:()ChronoServices
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_26E8D8230;
  objc_msgSendSuper2(&v5, sel_setWidgetFamily_);
  switch([a1 widgetFamily])
  {
    case 1:
      v2 = (uint64_t *)MEMORY[0x263F51828];
      goto LABEL_8;
    case 2:
    case 5:
    case 13:
      v2 = (uint64_t *)MEMORY[0x263F51820];
      goto LABEL_8;
    case 3:
    case 4:
    case 6:
      v2 = (uint64_t *)MEMORY[0x263F51818];
      goto LABEL_8;
    case 10:
      v2 = (uint64_t *)MEMORY[0x263F51800];
      goto LABEL_8;
    case 11:
      v2 = (uint64_t *)MEMORY[0x263F51810];
      goto LABEL_8;
    case 12:
      v2 = (uint64_t *)MEMORY[0x263F51808];
LABEL_8:
      uint64_t v3 = *v2;
      v4 = [a1 actionConfigurationContext];
      [v4 setWidgetFamily:v3];

      break;
    default:
      return;
  }
}

@end