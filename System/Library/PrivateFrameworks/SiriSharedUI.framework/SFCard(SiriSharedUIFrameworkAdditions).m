@interface SFCard(SiriSharedUIFrameworkAdditions)
- (uint64_t)afui_hasContentEqualTo:()SiriSharedUIFrameworkAdditions;
@end

@implementation SFCard(SiriSharedUIFrameworkAdditions)

- (uint64_t)afui_hasContentEqualTo:()SiriSharedUIFrameworkAdditions
{
  id v4 = a3;
  v5 = [a1 cardSections];
  uint64_t v6 = [v5 count];
  v7 = [v4 cardSections];
  uint64_t v8 = [v7 count];

  if (v6 != v8)
  {
LABEL_14:
    uint64_t v22 = 0;
    goto LABEL_15;
  }
  v9 = [a1 cardSections];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    while (1)
    {
      v12 = [a1 cardSections];
      v13 = [v12 objectAtIndex:v11];

      v14 = [v4 cardSections];
      v15 = [v14 objectAtIndex:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      v16 = [v13 nextCard];
      v17 = [v16 cardSections];
      if (v17)
      {

        break;
      }
      v18 = [v15 nextCard];
      v19 = [v18 cardSections];

      if (v19) {
        break;
      }
      [v13 setCardSectionId:&stru_26C1A19D8];
      [v15 setCardSectionId:&stru_26C1A19D8];
      [v13 setResultIdentifier:&stru_26C1A19D8];
      [v15 setResultIdentifier:&stru_26C1A19D8];
      v20 = [v13 dictionaryRepresentation];
      v21 = [v15 dictionaryRepresentation];
      uint64_t v22 = [v20 isEqual:v21];

      if (v22)
      {
        ++v11;
        v23 = [a1 cardSections];
        unint64_t v24 = [v23 count];

        if (v24 > v11) {
          continue;
        }
      }
      goto LABEL_15;
    }

    goto LABEL_14;
  }
  uint64_t v22 = 1;
LABEL_15:

  return v22;
}

@end