@interface NSString(PosterUIFoundation)
- (uint64_t)pui_isSuitableForArabicJustification;
- (uint64_t)pui_isSuitableForVerticalLayout;
@end

@implementation NSString(PosterUIFoundation)

- (uint64_t)pui_isSuitableForVerticalLayout
{
  return MEMORY[0x270EE9EE0](a1, 0);
}

- (uint64_t)pui_isSuitableForArabicJustification
{
  return MEMORY[0x270EE9ED8]();
}

@end