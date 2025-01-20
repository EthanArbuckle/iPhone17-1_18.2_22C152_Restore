@interface UIView(SBSAC2PropertyAnimating)
- (BOOL)sbsa_isPropertyActivelyC2AnimatingForKeyPath:()SBSAC2PropertyAnimating;
- (id)_sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath:()SBSAC2PropertyAnimating caLayerRelativeKeyPath:;
- (id)sbsa_presentationModifierValueForKeyPath:()SBSAC2PropertyAnimating;
@end

@implementation UIView(SBSAC2PropertyAnimating)

- (BOOL)sbsa_isPropertyActivelyC2AnimatingForKeyPath:()SBSAC2PropertyAnimating
{
  id v4 = a3;
  id v16 = 0;
  v5 = objc_msgSend(a1, "_sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath:caLayerRelativeKeyPath:", v4, &v16);
  id v6 = v16;
  v7 = [v5 presentationModifiers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__UIView_SBSAC2PropertyAnimating__sbsa_isPropertyActivelyC2AnimatingForKeyPath___block_invoke;
  v12[3] = &unk_1E6AFCC90;
  id v13 = v6;
  v14 = a1;
  id v15 = v4;
  id v8 = v4;
  id v9 = v6;
  v10 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v12);

  return v10 != 0;
}

- (id)_sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath:()SBSAC2PropertyAnimating caLayerRelativeKeyPath:
{
  id v6 = a3;
  v7 = [v6 componentsSeparatedByString:@"."];
  id v8 = (void *)[v7 mutableCopy];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = ___CAKeyPathFromUIKeyPath_block_invoke;
  v25 = &unk_1E6AFCD08;
  v27 = &v28;
  id v9 = v8;
  id v26 = v9;
  [v7 enumerateObjectsUsingBlock:&v22];
  objc_msgSend(v9, "componentsJoinedByString:", @".", v22, v23, v24, v25);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (([v10 containsString:@"layer"] & 1) == 0
    && [v9 count]
    && !*((unsigned char *)v29 + 24))
  {
    objc_msgSend(v9, "insertObject:atIndex:", @"layer", objc_msgSend(v9, "count") - 1);
    uint64_t v11 = [v9 componentsJoinedByString:@"."];

    id v10 = (id)v11;
  }

  _Block_object_dispose(&v28, 8);
  if (v10)
  {
    v12 = [a1 layer];
    if ([v10 hasPrefix:@"layer."])
    {
      uint64_t v13 = [v10 substringFromIndex:objc_msgSend(@"layer.", "length")];

      id v10 = (id)v13;
    }
    if ([v10 containsString:@"layer"])
    {
      v14 = [v10 componentsSeparatedByString:@"."];
      id v15 = (void *)[v14 mutableCopy];

      uint64_t v16 = [v15 indexOfObjectWithOptions:2 passingTest:&__block_literal_global_51] + 1;
      v17 = objc_msgSend(v15, "subarrayWithRange:", 0, v16);
      v18 = [v17 componentsJoinedByString:@"."];

      uint64_t v19 = [a1 valueForKeyPath:v18];

      objc_msgSend(v15, "removeObjectsInRange:", 0, v16);
      uint64_t v20 = [v15 componentsJoinedByString:@"."];

      v12 = (void *)v19;
      id v10 = (id)v20;
    }
    if (a4)
    {
      id v10 = v10;
      *a4 = v10;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)sbsa_presentationModifierValueForKeyPath:()SBSAC2PropertyAnimating
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v54 = 0;
  v5 = objc_msgSend(a1, "_sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath:caLayerRelativeKeyPath:", v4, &v54);
  id v6 = v54;
  v7 = [v5 presentationModifiers];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke;
  v52[3] = &unk_1E6AFCCB8;
  id v44 = v6;
  id v53 = v44;
  id v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v52);

  v42 = v8;
  id v9 = [v8 value];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [a1 _independentlyAnimatableMemberKeyPathsForPropertyKeyPath:v4];
  uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        id v15 = [v5 presentationModifiers];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke_2;
        v45[3] = &unk_1E6AFCCE0;
        id v16 = v44;
        id v46 = v16;
        uint64_t v47 = v14;
        v17 = objc_msgSend(v15, "bs_firstObjectPassingTest:", v45);

        uint64_t v18 = [v17 value];
        uint64_t v19 = (void *)v18;
        if (v17 && v18)
        {
          if (!v9)
          {
            id v9 = [v5 valueForKey:v16];
          }
          if ([v4 containsString:@"center"])
          {
            objc_msgSend(v9, "bs_CGPointValue");
            double v21 = v20;
            double v23 = v22;
            if (BSEqualObjects())
            {
              objc_msgSend(v19, "bs_CGFloatValue");
              double v21 = v24;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v19, "bs_CGFloatValue");
              double v23 = v25;
            }
            uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", v21, v23);
          }
          else
          {
            if (![v4 containsString:@"bounds"]) {
              goto LABEL_27;
            }
            objc_msgSend(v9, "bs_CGRectValue");
            double v28 = v27;
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;
            if (BSEqualObjects())
            {
              objc_msgSend(v19, "bs_CGFloatValue");
              double v28 = v35;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v19, "bs_CGFloatValue");
              double v30 = v36;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v19, "bs_CGFloatValue");
              double v32 = v37;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v19, "bs_CGFloatValue");
              double v34 = v38;
            }
            uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v28, v30, v32, v34);
          }
          v39 = (void *)v26;

          id v9 = v39;
        }
LABEL_27:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v11);
  }

  id v40 = v9;
  return v40;
}

@end