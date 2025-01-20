@interface UIButtonConfigurationStyleBehaviors
@end

@implementation UIButtonConfigurationStyleBehaviors

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  if (!v8)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_2;
    v20[3] = &unk_1E52DA210;
    id v21 = v9;
    __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_2((uint64_t)v20, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if ((a4 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    v14 = (void (**)(void *, id))&__block_literal_global_67_2;
LABEL_16:
    v14[2](v14, v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  id v11 = v8;
  if ((a4 & 2) != 0) {
    goto LABEL_11;
  }
LABEL_3:
  if ((a4 & 0x10) != 0 && [v10 userInterfaceIdiom] != 6)
  {
    v12 = (id *)v19;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_4;
    v19[3] = &unk_1E52DA210;
LABEL_14:
    v13 = v11;
    goto LABEL_15;
  }
  if ((a4 & 1) != 0 && [v10 userInterfaceIdiom] != 6)
  {
    v12 = (id *)v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_5;
    v18[3] = &unk_1E52DA210;
    goto LABEL_14;
  }
  if ((a4 & 0x14) == 0 || [v10 userInterfaceIdiom] != 6) {
    goto LABEL_17;
  }
  v12 = (id *)v17;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_6;
  v17[3] = &unk_1E52DA210;
  v13 = v8;
LABEL_15:
  v12[4] = v13;
  v14 = (void (**)(void *, id))_Block_copy(v12);

  if (v14) {
    goto LABEL_16;
  }
LABEL_17:
  id v15 = v11;
LABEL_18:

  return v15;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_12()
{
  return 0;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_7(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v7 userInterfaceIdiom] == 6) {
    +[UIColor clearColor];
  }
  else {
  uint64_t v8 = +[UIColor tintColor];
  }
  id v9 = (void *)v8;
  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = (void *)v8;
  }
  id v11 = v10;
  if ((a3 & 2) != 0)
  {
    if ([v7 userInterfaceIdiom] != 6)
    {
      id v15 = (void (**)(void *, id))&__block_literal_global_71_2;
LABEL_21:
      v17 = v15[2](v15, v7);

      goto LABEL_24;
    }
    goto LABEL_16;
  }
  if ((a3 & 0x10) != 0 && [v7 userInterfaceIdiom] != 6)
  {
    v12 = v21;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v13 = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_9;
    goto LABEL_20;
  }
  if ((a3 & 1) != 0 && [v7 userInterfaceIdiom] != 6)
  {
    v12 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v13 = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_10;
    goto LABEL_20;
  }
  if ((a3 & 0x14) != 0 && [v7 userInterfaceIdiom] == 6)
  {
LABEL_16:
    id v14 = +[UIColor clearColor];
    goto LABEL_23;
  }
  v12 = v19;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v13 = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_11;
LABEL_20:
  v12[2] = v13;
  v12[3] = &unk_1E52DA210;
  id v16 = v11;
  v12[4] = v16;
  id v15 = (void (**)(void *, id))_Block_copy(v12);

  if (v15) {
    goto LABEL_21;
  }
  id v14 = v16;
LABEL_23:
  v17 = v14;
LABEL_24:

  return v17;
}

uint64_t __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_6()
{
  return 0;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_11(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a2];
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_11()
{
  return 0;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_5(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = v7;
  if ((a3 & 1) != 0 && [v7 userInterfaceIdiom] == 6 || !_AXSButtonShapesEnabled())
  {
    uint64_t v9 = +[UIColor clearColor];
  }
  else
  {
    uint64_t v9 = +[UIColor tertiarySystemFillColor];
  }
  id v10 = (void *)v9;

  return v10;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32)
    || [v3 userInterfaceIdiom] == 6
    || (+[UIColor tintColor],
        v5 = objc_claimAutoreleasedReturnValue(),
        +[UIColor whiteColor],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int isSameColor = _isSameColor(v5, v6, v4),
        v6,
        v5,
        !isSameColor))
  {
    uint64_t v8 = +[UIColor labelColor];
    id v9 = v4;
    if ([v9 userInterfaceStyle] != 2)
    {
      id v10 = v9;
      uint64_t v11 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = +[UIColor labelColor];
    id v9 = v4;
    if ([v9 userInterfaceStyle] == 2)
    {
      id v10 = v9;
      uint64_t v11 = 1;
LABEL_9:
      id v12 = [v10 _traitCollectionByReplacingNSIntegerValue:v11 forTraitToken:0x1ED3F5A48];
      goto LABEL_10;
    }
  }
  id v12 = v9;
LABEL_10:
  v13 = v12;

  id v14 = (id)[v8 resolvedColorWithTraitCollection:v13];
  return v14;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor tertiaryLabelColor];
  v4 = (void *)[v3 resolvedColorWithTraitCollection:v2];

  id v5 = v4;
  return v5;
}

UIColor *__76___UIButtonConfigurationStyleBehaviors_effectiveBehaviorWithoutButtonShapes__block_invoke()
{
  return +[UIColor clearColor];
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_6(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[UIColor tintColor];
  }
  id v9 = v8;
  if ((a3 & 2) != 0)
  {
    uint64_t v11 = (void (**)(void *, id))&__block_literal_global_58_0;
    goto LABEL_17;
  }
  if ((a3 & 0x10) != 0 && [v7 userInterfaceIdiom] != 6)
  {
    id v12 = v19;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v13 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_8;
    goto LABEL_16;
  }
  if ((a3 & 1) != 0 && [v7 userInterfaceIdiom] != 6)
  {
    id v12 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v13 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_9;
LABEL_16:
    v12[2] = v13;
    v12[3] = &unk_1E52DA210;
    id v14 = v9;
    v12[4] = v14;
    uint64_t v11 = (void (**)(void *, id))_Block_copy(v12);

    if (!v11)
    {
      id v10 = v14;
      goto LABEL_19;
    }
LABEL_17:
    id v15 = v11[2](v11, v7);

    goto LABEL_20;
  }
  if ((a3 & 0x14) == 0 || [v7 userInterfaceIdiom] != 6)
  {
    id v12 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v13 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_10;
    goto LABEL_16;
  }
  id v10 = +[UIColor clearColor];
LABEL_19:
  id v15 = v10;
LABEL_20:

  return v15;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_11()
{
  return 0;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = _tintBehaviorAlphaReduction(v3, v4, 1.0, 1.0);
  id v6 = _colorByReducingAlpha(*(void **)(a1 + 32), (uint64_t)v4, v5);

  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor secondarySystemFillColor];
  id v4 = _colorByReducingAlpha(v3, (uint64_t)v2, 0.75);

  return v4;
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_6(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[UIColor secondarySystemFillColor];
  }
  id v9 = v8;
  if ((a3 & 2) != 0)
  {
    uint64_t v11 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v12 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_7;
  }
  else if ((a3 & 0x10) != 0 && [v7 userInterfaceIdiom] != 6)
  {
    uint64_t v11 = v19;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v12 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_8;
  }
  else if ((a3 & 1) != 0 && [v7 userInterfaceIdiom] != 6)
  {
    uint64_t v11 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v12 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_9;
  }
  else
  {
    if ((a3 & 0x14) != 0 && [v7 userInterfaceIdiom] == 6)
    {
      id v10 = +[UIColor clearColor];
      goto LABEL_19;
    }
    uint64_t v11 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v12 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_10;
  }
  v11[2] = v12;
  v11[3] = &unk_1E52DA210;
  id v13 = v9;
  v11[4] = v13;
  id v14 = (void (**)(void *, id))_Block_copy(v11);

  if (v14)
  {
    id v15 = v14[2](v14, v7);

    goto LABEL_20;
  }
  id v10 = v13;
LABEL_19:
  id v15 = v10;
LABEL_20:

  return v15;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a2];
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  uint64_t v9 = fallbackForegroundColorForTraitCollection(v8);
  id v10 = (void *)v9;
  if (v7) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = (void *)v9;
  }
  id v12 = v11;
  if ((a4 & 2) != 0)
  {
    id v13 = (void (**)(void *, id))&__block_literal_global_52_1;
    goto LABEL_13;
  }
  if ((a4 & 0x10) != 0 && [v8 userInterfaceIdiom] != 6)
  {
    id v15 = v19;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v16 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_3;
    goto LABEL_16;
  }
  if ((a4 & 1) != 0 && [v8 userInterfaceIdiom] != 6)
  {
    id v15 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v16 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_4;
LABEL_16:
    v15[2] = v16;
    v15[3] = &unk_1E52DA210;
    v15[4] = v12;
    id v13 = (void (**)(void *, id))_Block_copy(v15);

    if (v13) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  if ((a4 & 0x14) != 0 && [v8 userInterfaceIdiom] == 6)
  {
    id v13 = (void (**)(void *, id))&__block_literal_global_54_1;
LABEL_13:
    v13[2](v13, v8);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
LABEL_17:
  id v14 = v12;
LABEL_18:

  return v14;
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  uint64_t v9 = fallbackForegroundColorForTraitCollection(v8);
  id v10 = (void *)v9;
  if (v7) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = (void *)v9;
  }
  id v12 = v11;
  if ((a4 & 2) != 0)
  {
    id v13 = (void (**)(void *, id))&__block_literal_global_39_0;
    goto LABEL_13;
  }
  if ((a4 & 0x10) != 0 && [v8 userInterfaceIdiom] != 6)
  {
    id v15 = v19;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v16 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_3;
    goto LABEL_16;
  }
  if ((a4 & 1) != 0 && [v8 userInterfaceIdiom] != 6)
  {
    id v15 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v16 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_4;
LABEL_16:
    v15[2] = v16;
    v15[3] = &unk_1E52DA210;
    v15[4] = v12;
    id v13 = (void (**)(void *, id))_Block_copy(v15);

    if (v13) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  if ((a4 & 0x14) != 0 && [v8 userInterfaceIdiom] == 6)
  {
    id v13 = (void (**)(void *, id))&__block_literal_global_41_0;
LABEL_13:
    v13[2](v13, v8);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
LABEL_17:
  id v14 = v12;
LABEL_18:

  return v14;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  uint64_t v9 = fallbackForegroundColorForTraitCollection(v8);
  id v10 = (void *)v9;
  if (v7) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = (void *)v9;
  }
  id v12 = v11;
  if ((a4 & 2) != 0)
  {
    id v15 = (void (**)(void *, id))&__block_literal_global_28_2;
LABEL_12:
    v15[2](v15, v8);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if ((a4 & 0x10) != 0)
  {
    id v13 = v19;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v14 = __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_3;
  }
  else
  {
    if ((a4 & 1) == 0 || [v8 userInterfaceIdiom] == 6) {
      goto LABEL_13;
    }
    id v13 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v14 = __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_4;
  }
  v13[2] = v14;
  v13[3] = &unk_1E52DA210;
  v13[4] = v12;
  id v15 = (void (**)(void *, id))_Block_copy(v13);

  if (v15) {
    goto LABEL_12;
  }
LABEL_13:
  id v16 = v12;
LABEL_14:

  return v16;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor tertiaryLabelColor];
  id v4 = (void *)[v3 resolvedColorWithTraitCollection:v2];

  id v5 = v4;
  return v5;
}

UIColor *__54___UIButtonConfigurationStyleBehaviors_emptyBehaviors__block_invoke()
{
  return +[UIColor clearColor];
}

UIColor *__54___UIButtonConfigurationStyleBehaviors_emptyBehaviors__block_invoke_2()
{
  return +[UIColor clearColor];
}

uint64_t __54___UIButtonConfigurationStyleBehaviors_emptyBehaviors__block_invoke_3()
{
  return 0;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 userInterfaceIdiom] == 6)
  {
    id v4 = +[UIColor blackColor];
    id v5 = (id)[v4 resolvedColorWithTraitCollection:v3];
  }
  else
  {
    _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), v3, 0.5, 0.4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_4(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor tertiaryLabelColor];
  id v4 = (void *)[v3 resolvedColorWithTraitCollection:v2];

  id v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_3(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_4(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.1);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor blackColor];
  id v4 = (void *)[v3 resolvedColorWithTraitCollection:v2];

  id v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return _colorByReducingAlpha(*(void **)(a1 + 32), a2, 0.75);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_8(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.1);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_9(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.05);
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor tertiaryLabelColor];
  id v4 = (void *)[v3 resolvedColorWithTraitCollection:v2];

  id v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_3(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_4(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.1);
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor blackColor];
  id v4 = (void *)[v3 resolvedColorWithTraitCollection:v2];

  id v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIColor secondarySystemFillColor];
  id v4 = _colorByReducingAlpha(v3, (uint64_t)v2, 0.75);

  return v4;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = _tintBehaviorAlphaReduction(v3, v4, 0.5, 0.55);
  id v6 = _colorByReducingAlpha(*(void **)(a1 + 32), (uint64_t)v4, v5);

  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = _tintBehaviorAlphaReduction(v3, v4, 0.65, 0.7);
  id v6 = _colorByReducingAlpha(*(void **)(a1 + 32), (uint64_t)v4, v5);

  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return _colorByReducingAlpha(*(void **)(a1 + 32), a2, 0.5);
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return _colorByReducingAlpha(*(void **)(a1 + 32), a2, 0.75);
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  double v5 = v4;
  if (!v4)
  {
    double v5 = +[UIColor blackColor];
  }
  id v6 = (id)[v5 resolvedColorWithTraitCollection:v3];
  if (!v4) {

  }
  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_9(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_10(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.2);
}

@end