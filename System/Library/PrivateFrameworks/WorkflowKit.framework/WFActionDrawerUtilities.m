@interface WFActionDrawerUtilities
+ (id)activitySectionsForDonations:(id)a3;
+ (id)localizedAppNames;
+ (id)suggestionSectionsForDonations:(id)a3 excludingConvertedLinkActions:(BOOL)a4;
@end

@implementation WFActionDrawerUtilities

+ (id)activitySectionsForDonations:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke;
  v17[3] = &unk_1E6554500;
  id v18 = v7;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  [v5 enumerateObjectsUsingBlock:v17];

  v10 = [v9 array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke_2;
  v14[3] = &unk_1E6554528;
  id v15 = v8;
  id v16 = a1;
  id v11 = v8;
  v12 = objc_msgSend(v10, "if_compactMap:", v14);

  return v12;
}

void __56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v11;
  if (isKindOfClass)
  {
    id v8 = v11;
    id v9 = [v8 sourceAppIdentifierForDisplay];
    [*(id *)(a1 + 32) addObject:v9];
    if ([v9 length])
    {
      id v10 = [*(id *)(a1 + 40) objectForKey:v9];
      if (!v10)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [*(id *)(a1 + 40) setObject:v10 forKey:v9];
      }
      if ((unint64_t)[v10 count] > 9) {
        *a4 = 1;
      }
      else {
        [v10 addObject:v8];
      }
    }
    id v7 = v11;
  }
}

WFActionDrawerSection *__56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKey:v3];
  id v5 = [(id)objc_opt_class() localizedAppNames];
  id v6 = [v5 objectForKey:v3];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v3];
  id v6 = [v7 localizedName];

  if (v6)
  {
    id v8 = [(id)objc_opt_class() localizedAppNames];
    [v8 setObject:v6 forKey:v3];

LABEL_4:
    id v9 = [[WFActionDrawerSection alloc] initWithLocalizedTitle:v6 donations:v4 bundleIdentifier:v3 sectionType:4];

    goto LABEL_5;
  }
  id v9 = 0;
LABEL_5:

  return v9;
}

+ (id)suggestionSectionsForDonations:(id)a3 excludingConvertedLinkActions:(BOOL)a4
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__46697;
  v20 = __Block_byref_object_dispose__46698;
  id v21 = 0;
  id v6 = [v5 valueForKeyPath:@"sourceAppIdentifier"];
  id v7 = [MEMORY[0x1E4F304C8] sharedConnection];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke;
  v12[3] = &unk_1E65544D8;
  id v9 = v5;
  id v13 = v9;
  v14 = &v16;
  BOOL v15 = a4;
  objc_msgSend(v7, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v8, v12);

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_2;
  v17[3] = &unk_1E6554488;
  id v18 = v4;
  id v19 = v3;
  id v6 = v2;
  id v20 = v6;
  id v7 = v3;
  id v8 = v4;
  [v5 enumerateObjectsUsingBlock:v17];
  id v9 = [v7 array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_3;
  v14[3] = &unk_1E65544B0;
  id v15 = v6;
  char v16 = *(unsigned char *)(a1 + 48);
  id v10 = v6;
  uint64_t v11 = objc_msgSend(v9, "if_compactMap:", v14);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_2(id *a1, void *a2)
{
  id v47 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v47;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_23;
  }
  id v5 = v47;
  v46 = [v5 interaction];
  id v6 = [v46 intent];
  id v7 = [v6 _keyParameter];
  id v8 = [v6 _codableDescription];
  id v9 = [v8 keyAttribute];

  v44 = a1;
  if (v9)
  {
    id v10 = [v9 propertyName];
    int v11 = [v6 _isValidKey:v10];

    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
    int v11 = 0;
    if (v7)
    {
LABEL_7:
      uint64_t v12 = [v6 _emptyCopy];
      if (v7)
      {
        id v13 = [v7 value];
        v14 = [v7 codableAttribute];
        [v14 propertyName];
        v16 = id v15 = v9;
        [v12 setValue:v13 forKey:v16];

        id v9 = v15;
      }
      if (v11)
      {
        v17 = [v9 propertyName];
        id v18 = [v6 valueForKey:v17];
        id v19 = [v9 propertyName];
        [v12 setValue:v18 forKey:v19];
      }
      [v46 _setIntent:v12];
      id v20 = objc_alloc(MEMORY[0x1E4FB4520]);
      id v21 = [v5 identifier];
      v22 = [v5 sourceAppIdentifier];
      uint64_t v23 = [v20 initWithIdentifier:v21 sourceAppIdentifier:v22 interaction:v46];

      id v5 = (id)v23;
      goto LABEL_12;
    }
  }
  if (v11) {
    goto LABEL_7;
  }
LABEL_12:
  v24 = [v6 typeName];
  uint64_t v25 = [v5 sourceAppIdentifierForDisplay];
  v26 = (void *)v25;
  v27 = NSString;
  v45 = v9;
  if (v7)
  {
    v28 = [NSString stringWithFormat:@"%@-%@", v24, v25];
    v29 = NSString;
    v30 = [v7 value];
    [MEMORY[0x1E4F30788] localizerForLanguage:0];
    v42 = v6;
    v31 = id v43 = v5;
    [v7 codableAttribute];
    v33 = v32 = v26;
    [v33 metadata];
    v35 = v34 = v24;
    v36 = objc_msgSend(v30, "_intents_readableTitleWithLocalizer:metadata:", v31, v35);
    id v37 = [v29 stringWithFormat:@"%@-%@", v28, v36];

    v24 = v34;
    v26 = v32;

    id v6 = v42;
    id v5 = v43;
  }
  else
  {
    v38 = [v5 uniqueProperty];
    v39 = [v27 stringWithFormat:@"%@-%@-%@", v24, v26, v38];

    id v37 = v39;
    v28 = v37;
  }
  v40 = [v44[4] objectForKeyedSubscript:v37];

  if (!v40)
  {
    [v44[4] setObject:v5 forKeyedSubscript:v37];
    [v44[5] addObject:v28];
    if ([v24 length])
    {
      id v41 = [v44[6] objectForKey:v28];
      if (!v41)
      {
        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v44[6] setObject:v41 forKey:v28];
      }
      if ((unint64_t)[v41 count] <= 9) {
        [v41 addObject:v5];
      }
    }
  }

  id v4 = v47;
LABEL_23:
}

WFActionDrawerSection *__88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  id v4 = [v3 firstObject];
  id v5 = [v4 interaction];
  id v6 = [v5 intent];

  id v7 = +[WFActionRegistry sharedRegistry];
  id v8 = [v7 replacementActionForDonatedIntent:v6];

  if (!v8 || (id v9 = 0, [v8 visibleForUse:0]))
  {
    id v10 = [v4 interaction];
    int v11 = [v10 intent];
    uint64_t v12 = [v11 _codableDescription];

    if (v8) {
      [v8 localizedName];
    }
    else {
    uint64_t v31 = [v12 localizedTitle];
    }
    id v13 = [v6 _keyParameter];
    v14 = [v13 codableAttribute];

    v30 = v12;
    if (v14)
    {
      v29 = v3;
      id v15 = [v13 codableAttribute];
      char v16 = [v15 propertyName];
      if ([v6 _isValidKey:v16])
      {
        v17 = [v13 codableAttribute];
        [v17 propertyName];
        id v18 = v28 = v2;
        id v19 = [v6 valueForKey:v18];
        BOOL v20 = v19 != 0;

        uint64_t v2 = v28;
      }
      else
      {
        BOOL v20 = 0;
      }

      id v3 = v29;
    }
    else
    {
      BOOL v20 = 0;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && *(unsigned char *)(v2 + 40))
    {
      id v9 = 0;
      v22 = v30;
      uint64_t v23 = (void *)v31;
LABEL_24:

      goto LABEL_25;
    }
    if (!v14)
    {
      uint64_t v24 = 2;
      v22 = v30;
      uint64_t v23 = (void *)v31;
LABEL_23:
      uint64_t v25 = [WFActionDrawerSection alloc];
      v26 = [v4 sourceAppIdentifierForDisplay];
      id v9 = [(WFActionDrawerSection *)v25 initWithLocalizedTitle:v23 donations:v3 bundleIdentifier:v26 sectionType:v24];

      goto LABEL_24;
    }
    if (v20)
    {
      uint64_t v23 = (void *)v31;
      if (v8)
      {
LABEL_18:
        uint64_t v24 = 1;
LABEL_22:
        v22 = v30;
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v23 = (void *)v31;
      if (!((v8 == 0) | isKindOfClass & 1)) {
        goto LABEL_18;
      }
    }
    uint64_t v24 = 2;
    goto LABEL_22;
  }
LABEL_25:

  return v9;
}

+ (id)localizedAppNames
{
  if (localizedAppNames_onceToken != -1) {
    dispatch_once(&localizedAppNames_onceToken, &__block_literal_global_46717);
  }
  uint64_t v2 = (void *)localizedAppNames_localizedAppNames;
  return v2;
}

void __44__WFActionDrawerUtilities_localizedAppNames__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)localizedAppNames_localizedAppNames;
  localizedAppNames_localizedAppNames = (uint64_t)v0;
}

@end