@interface WBSCyclerTabGroupRepresentation
- (WBSCyclerBookmarkLeafRepresentation)randomTabDescendant;
- (unint64_t)numberOfTabs;
@end

@implementation WBSCyclerTabGroupRepresentation

- (WBSCyclerBookmarkLeafRepresentation)randomTabDescendant
{
  return (WBSCyclerBookmarkLeafRepresentation *)[(WBSCyclerItemListRepresentation *)self randomChildPassingTest:&__block_literal_global_41];
}

uint64_t __54__WBSCyclerTabGroupRepresentation_randomTabDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)numberOfTabs
{
  return [(WBSCyclerItemListRepresentation *)self numberOfChildren] - 1;
}

@end