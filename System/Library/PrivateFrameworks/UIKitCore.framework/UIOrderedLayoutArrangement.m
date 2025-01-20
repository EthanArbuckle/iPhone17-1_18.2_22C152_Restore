@interface UIOrderedLayoutArrangement
@end

@implementation UIOrderedLayoutArrangement

uint64_t __64___UIOrderedLayoutArrangement__indexOfItemForLocationAttribute___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _mutableItems];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    unint64_t v4 = v3 - 1;
    do
    {
      unint64_t v5 = v4;
      if ((v4 & 0x8000000000000000) != 0) {
        break;
      }
      v6 = *(void **)(a1 + 32);
      v7 = [v2 objectAtIndexedSubscript:v4];
      LODWORD(v6) = [v6 _itemWantsLayoutAsIfVisible:v7];

      unint64_t v4 = v5 - 1;
    }
    while (!v6);
  }
  else
  {
    unint64_t v5 = -1;
  }
  if (v5 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v8 = v5;
  }

  return v8;
}

uint64_t __42___UIOrderedLayoutArrangement_setSpacing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSpacing:*(double *)(a1 + 32)];
}

uint64_t __58___UIOrderedLayoutArrangement_setCustomSpacing_afterItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomSpacing:*(void *)(a1 + 32) afterItem:*(double *)(a1 + 40)];
}

uint64_t __47___UIOrderedLayoutArrangement_setDistribution___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDistribution:*(void *)(a1 + 32)];
}

uint64_t __62___UIOrderedLayoutArrangement_setBaselineRelativeArrangement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBaselineRelativeArrangement:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __71___UIOrderedLayoutArrangement__visibleItemAtEndWithEnumerationOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) _itemWantsLayoutAsIfVisible:a2];
  *a4 = result;
  return result;
}

id __50___UIOrderedLayoutArrangement_insertItem_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)_UIOrderedLayoutArrangement;
  return objc_msgSendSuper2(&v4, sel_insertItem_atIndex_, v1, v2);
}

id __42___UIOrderedLayoutArrangement_removeItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createUnanimatedConfigurationTargetIfNecessary];
  uint64_t v2 = [*(id *)(a1 + 32) customSpacings];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) _orderedPropertySource];
  objc_super v4 = [v3 customSpacings];
  [v4 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v5 = *(void *)(a1 + 40);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)_UIOrderedLayoutArrangement;
  return objc_msgSendSuper2(&v7, sel_removeItem_, v5);
}

void __79___UIOrderedLayoutArrangement__insertIndividualGuidesAndConstraintsAsNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [*(id *)(a1 + 40) _setUpMultilineTextWidthDisambiguationConstraintForItem:v3 numberOfVisibleMultilineItems:*(void *)(a1 + 48)];
}

@end