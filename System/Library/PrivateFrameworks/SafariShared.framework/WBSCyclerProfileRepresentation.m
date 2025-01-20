@interface WBSCyclerProfileRepresentation
- (id)randomTabGroupDescendant;
@end

@implementation WBSCyclerProfileRepresentation

- (id)randomTabGroupDescendant
{
  return [(WBSCyclerItemListRepresentation *)self randomDescendantPassingTest:&__block_literal_global_40];
}

uint64_t __58__WBSCyclerProfileRepresentation_randomTabGroupDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end