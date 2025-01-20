@interface UITraitCollection
@end

@implementation UITraitCollection

void __81__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageAppearance___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = self;
  [v6 setObject:v3 forTrait:v4];

  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "sbh_userInterfaceStyleForIconImageAppearance:", *(void *)(a1 + 32));
  if (v5) {
    [v6 setUserInterfaceStyle:v5];
  }
}

void __75__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconTintColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forTrait:v4];
}

void __89__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forTrait:v4];
}

void __108__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration_userInterfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) configurationType];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = self;
  [v8 setObject:v4 forTrait:v5];

  if ((unint64_t)(v3 - 1) < 2)
  {
    uint64_t v6 = 1;
  }
  else if ((unint64_t)(v3 - 3) >= 2)
  {
    v7 = v8;
    if (v3) {
      goto LABEL_8;
    }
    uint64_t v6 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v6 = 2;
  }
  [v8 setUserInterfaceStyle:v6];
  v7 = v8;
LABEL_8:
}

void __90__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithHomeScreenStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = self;
  [v6 setObject:v3 forTrait:v4];

  unint64_t v5 = [*(id *)(a1 + 32) configurationType];
  if (v5 <= 4) {
    [v6 setUserInterfaceStyle:qword_1D81E52D0[v5]];
  }
}

@end