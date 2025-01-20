@interface UIButtonConfiguration
@end

@implementation UIButtonConfiguration

id __56__UIButtonConfiguration_IC__ic_plainButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  if (UIAccessibilityButtonShapesEnabled()) {
    [v2 setObject:&unk_1F09A4400 forKeyedSubscript:*MEMORY[0x1E4FB0808]];
  }
  v3 = (void *)[v2 copy];

  return v3;
}

@end