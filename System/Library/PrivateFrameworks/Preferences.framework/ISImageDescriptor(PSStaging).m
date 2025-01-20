@interface ISImageDescriptor(PSStaging)
- (uint64_t)ps_appearanceVariant;
- (uint64_t)setPs_appearanceVariant:()PSStaging;
@end

@implementation ISImageDescriptor(PSStaging)

- (uint64_t)ps_appearanceVariant
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [a1 appearanceVariant];
}

- (uint64_t)setPs_appearanceVariant:()PSStaging
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a1 setAppearanceVariant:a3];
  }
  return result;
}

@end