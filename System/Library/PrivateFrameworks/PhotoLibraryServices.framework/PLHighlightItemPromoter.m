@interface PLHighlightItemPromoter
- (PLHighlightItemPromoter)initWithRule:(id)a3;
- (PLHighlightItemPromoterRule)rule;
- (void)processHighlightItemsInHighlightItemList:(id)a3 currentlyPromotedHighlightItems:(id)a4 withSharingConsideration:(int64_t)a5 resultBlock:(id)a6;
@end

@implementation PLHighlightItemPromoter

- (void).cxx_destruct
{
}

- (PLHighlightItemPromoterRule)rule
{
  return self->_rule;
}

- (void)processHighlightItemsInHighlightItemList:(id)a3 currentlyPromotedHighlightItems:(id)a4 withSharingConsideration:(int64_t)a5 resultBlock:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = a4;
  v31 = (void (**)(id, id, void *, BOOL))a6;
  v10 = [a3 sortedChildHighlightItems];
  v11 = [MEMORY[0x1E4F1CA80] set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * v16);
        v18 = [(PLHighlightItemPromoter *)self rule];
        int v19 = [v18 highlightItemHasMinimumRequirementToBePromoted:v17 withSharingConsideration:a5];

        if (v19) {
          [v11 addObject:v17];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  v20 = [(PLHighlightItemPromoter *)self rule];
  unint64_t v21 = [v20 maximumNumberOfHighlightItemsToPromote];

  id v22 = [MEMORY[0x1E4F1CAD0] set];
  if ([v11 count] <= v21)
  {
    if ([v11 count])
    {
      v25 = v22;
      id v22 = v11;
      goto LABEL_15;
    }
    v29 = [(PLHighlightItemPromoter *)self rule];
    v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    v25 = [v29 fallbackHighlightItemFromAllHighlightItems:v30 withSharingConsideration:a5];

    if (!v25) {
      goto LABEL_15;
    }
    uint64_t v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v25];
  }
  else
  {
    v23 = [(PLHighlightItemPromoter *)self rule];
    v24 = [v23 highlightItemsSortedByImportance:v11 withSharingConsideration:a5];

    v25 = objc_msgSend(v24, "subarrayWithRange:", 0, v21);

    uint64_t v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v25];
  }
  v27 = (void *)v26;

  id v22 = v27;
LABEL_15:

  v28 = [MEMORY[0x1E4F1CA80] setWithSet:v32];
  [v28 minusSet:v22];
  v31[2](v31, v22, v28, [v22 count] != 0);
}

- (PLHighlightItemPromoter)initWithRule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLHighlightItemPromoter;
  v6 = [(PLHighlightItemPromoter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rule, a3);
  }

  return v7;
}

@end