@interface GEOLPRLPRConvertRule
@end

@implementation GEOLPRLPRConvertRule

void __64__GEOLPRLPRConvertRule_MNExtras__rules_forPlateTypes_atIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 plateTypeIndexesCount])
  {
    uint64_t v3 = [v10 plateTypeIndexesCount];
    uint64_t v4 = [v10 plateTypeIndexes];
    if (!v3) {
      goto LABEL_9;
    }
    v5 = (unsigned int *)v4;
    while (1)
    {
      unsigned int v7 = *v5++;
      unint64_t v6 = v7;
      if ([*(id *)(a1 + 40) containsIndex:v7])
      {
        if ([*(id *)(a1 + 48) count] > v6) {
          break;
        }
      }
      if (!--v3) {
        goto LABEL_9;
      }
    }
  }
  v8 = *(void **)(a1 + 32);
  v9 = (void *)[v10 copy];
  [v8 addObject:v9];

LABEL_9:
}

@end