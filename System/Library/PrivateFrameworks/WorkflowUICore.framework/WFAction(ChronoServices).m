@interface WFAction(ChronoServices)
- (uint64_t)widgetFamily;
- (void)setWidgetFamily:()ChronoServices;
@end

@implementation WFAction(ChronoServices)

- (uint64_t)widgetFamily
{
  id v1 = [a1 widgetSizeClass];
  if ([v1 isEqualToString:*MEMORY[0x263F0F740]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F0F738]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F0F730]])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F0F728]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F0F710]])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F0F720]])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F0F718]])
  {
    uint64_t v2 = 12;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)setWidgetFamily:()ChronoServices
{
  uint64_t v4 = INCodableAttributeArraySizeClassFromCHSWidgetFamily(a3);
  id v6 = (id)v4;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = *MEMORY[0x263F0F730];
  }
  [a1 setWidgetSizeClass:v5];
}

@end