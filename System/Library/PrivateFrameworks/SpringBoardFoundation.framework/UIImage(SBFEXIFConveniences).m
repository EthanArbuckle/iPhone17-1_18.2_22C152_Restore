@interface UIImage(SBFEXIFConveniences)
- (uint64_t)sbf_EXIFOrientation;
@end

@implementation UIImage(SBFEXIFConveniences)

- (uint64_t)sbf_EXIFOrientation
{
  uint64_t v1 = [a1 imageOrientation];
  return MEMORY[0x1F4102E50](v1);
}

@end