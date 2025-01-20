@interface UIButton(VSAdditions)
- (uint64_t)setVs_normalTitle:()VSAdditions;
- (uint64_t)vs_normalTitle;
@end

@implementation UIButton(VSAdditions)

- (uint64_t)vs_normalTitle
{
  return [a1 titleForState:0];
}

- (uint64_t)setVs_normalTitle:()VSAdditions
{
  return [a1 setTitle:a3 forState:0];
}

@end