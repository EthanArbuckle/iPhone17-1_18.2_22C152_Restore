@interface AllRefinementsMultiSelectCellLogicController
- (BOOL)allowsSelectionWithViewModel:(id)a3;
- (void)didTapOnMultiSelectElement:(id)a3 selectionSequenceNumber:(id)a4;
@end

@implementation AllRefinementsMultiSelectCellLogicController

- (BOOL)allowsSelectionWithViewModel:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [v3 elements];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v12 + 1) + 8 * i) isSelected];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  BOOL v10 = v7 < [v3 maximumNumberOfSelectableElements];
  return v10;
}

- (void)didTapOnMultiSelectElement:(id)a3 selectionSequenceNumber:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setIsSelected:[v6 isSelected] ^ 1];
  [v6 setSelectionSequenceNumber:v5];
}

@end