@interface UITraitCollection(SBUISystemApertureStylingPrivate)
+ (id)sbui_bestTraitCollection;
+ (id)sbui_traitCollectionForElement:()SBUISystemApertureStylingPrivate;
- (id)sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:()SBUISystemApertureStylingPrivate;
- (id)sbui_traitCollectionAllowingTraitsForCustomLayoutMode:()SBUISystemApertureStylingPrivate;
@end

@implementation UITraitCollection(SBUISystemApertureStylingPrivate)

+ (id)sbui_bestTraitCollection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = +[SBUISystemApertureElementSource openSources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) systemApertureElement];
        if (v7)
        {
          v8 = (void *)v7;
          v9 = objc_msgSend(a1, "sbui_traitCollectionForElement:", v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
  v9 = 0;
LABEL_11:

  return v9;
}

+ (id)sbui_traitCollectionForElement:()SBUISystemApertureStylingPrivate
{
  id v3 = a3;
  uint64_t v4 = [v3 traitCollection];
  uint64_t v5 = [v3 activeLayoutMode];

  v6 = objc_msgSend(v4, "sbui_traitCollectionAllowingTraitsForCustomLayoutMode:", v5 == 4);

  return v6;
}

- (id)sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:()SBUISystemApertureStylingPrivate
{
  id v5 = (id)*MEMORY[0x1E4F437B0];
  if (a3)
  {
    v6 = [a1 preferredContentSizeCategory];
    uint64_t v7 = UIContentSizeCategoryClip(v6, v5, (void *)*MEMORY[0x1E4F43790]);

    id v5 = (id)v7;
  }
  return v5;
}

- (id)sbui_traitCollectionAllowingTraitsForCustomLayoutMode:()SBUISystemApertureStylingPrivate
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:");
  id v3 = a1;
  uint64_t v4 = [v3 preferredContentSizeCategory];
  char v5 = [v4 isEqualToString:v2];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4F42F80];
    v11[0] = v3;
    uint64_t v7 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v2];
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v9 = [v6 traitCollectionWithTraitsFromCollections:v8];

    id v3 = (id)v9;
  }

  return v3;
}

@end