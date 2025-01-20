@interface UITraitOverrides
@end

@implementation UITraitOverrides

id __62___UITraitOverrides__traitOverridesWillChange_withApplicator___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (uint64_t *)a1[5];
  v5 = (void **)v4[5];
  if ((void **)a1[4] == v5)
  {
    uint64_t v6 = (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_5;
  }
  if (v5)
  {
    uint64_t v6 = -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v5, v3);
LABEL_5:
    v7 = (void *)v6;

    v4 = (uint64_t *)a1[5];
    goto LABEL_7;
  }
  v7 = v3;
LABEL_7:
  v8 = -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v7, v4[1], v4[2]);

  v9 = *(void ***)(a1[5] + 48);
  if ((void **)a1[4] == v9)
  {
    uint64_t v10 = (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v9, v8);
  }
  v11 = (void *)v10;

  v8 = v11;
LABEL_12:

  return v8;
}

id __71___UITraitOverrides__setOverrideTraitCollection_defaultValueOverrides___block_invoke(uint64_t a1, void *a2)
{
  return -[_UITraitOverrides _traitCollectionByApplyingAllOverridesToTraitCollection:withOverrides:defaultValueOverrides:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

uint64_t __54___UITraitOverrides__rawOverridesDescriptionMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lowercaseString];
  uint64_t v4 = [v3 containsString:*(void *)(a1 + 32)];

  return v4;
}

@end