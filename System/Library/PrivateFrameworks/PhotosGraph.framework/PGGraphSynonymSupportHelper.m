@interface PGGraphSynonymSupportHelper
+ (id)localizedSynonymsForLocalizationKey:(id)a3;
+ (id)synonymsByIndexCategoryMaskForGraph:(id)a3;
@end

@implementation PGGraphSynonymSupportHelper

+ (id)synonymsByIndexCategoryMaskForGraph:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:@"PGHighlightTripSearchableText"];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"PGHighlightTripSearchableText" value:@"PGHighlightTripSearchableText" table:@"Localizable"];
  [v5 setObject:v6 forKeyedSubscript:v8];

  v36 = v5;
  [v4 setObject:v5 forKeyedSubscript:&unk_1F28D2868];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke;
  v49[3] = &unk_1E68EDAB8;
  id v10 = v9;
  id v50 = v10;
  [v3 enumerateNodesWithLabel:0 domain:700 usingBlock:v49];
  v35 = v10;
  [v4 setObject:v10 forKeyedSubscript:&unk_1F28D2880];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_251;
  v47[3] = &unk_1E68EF068;
  id v12 = v11;
  id v48 = v12;
  [v3 enumerateNodesWithLabel:@"Season" domain:400 usingBlock:v47];
  v34 = v12;
  [v4 setObject:v12 forKeyedSubscript:&unk_1F28D2898];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_255;
  v45[3] = &unk_1E68ED8D0;
  id v14 = v13;
  id v46 = v14;
  [v3 enumerateNodesWithLabel:0 domain:502 usingBlock:v45];
  [v4 setObject:v14 forKeyedSubscript:&unk_1F28D28B0];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_259;
  v43[3] = &unk_1E68ED410;
  id v16 = v15;
  id v44 = v16;
  [v3 enumerateNodesWithLabel:0 domain:901 usingBlock:v43];
  [v4 setObject:v16 forKeyedSubscript:&unk_1F28D28C8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  +[PGUserDefaults relationshipTagMinConfidenceThreshold];
  double v19 = v18;
  v20 = +[PGLogging sharedLogging];
  v21 = [v20 loggingConnection];

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v52 = v19;
    _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_DEFAULT, "Using PGUserDefaults.relationshipTagMinConfidenceThreshold value %f", buf, 0xCu);
  }

  v22 = +[PGGraphPersonRelationshipTagNode personWithTagWithConfidence:v19];
  v23 = +[PGGraphNodeCollection nodesInGraph:v3];
  v24 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v23 relation:v22 targetsClass:objc_opt_class()];
  v25 = [v24 transposed];

  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27 = [v25 targets];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_268;
  v41[3] = &unk_1E68ED438;
  id v28 = v26;
  id v42 = v28;
  [v27 enumerateNodesUsingBlock:v41];

  v29 = [v25 sources];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_2;
  v37[3] = &unk_1E68ED488;
  id v38 = v25;
  id v39 = v28;
  id v40 = v17;
  id v30 = v17;
  id v31 = v28;
  id v32 = v25;
  [v29 enumerateUUIDsUsingBlock:v37];

  [v4 setObject:v30 forKeyedSubscript:&unk_1F28D28E0];
  return v4;
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 localizedName];
  v4 = [v3 localizedSynonyms];

  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_251(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 localizedName];
  v4 = [v3 localizedSynonyms];

  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_255(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 localizedName];
  v4 = [v3 localizedSynonyms];

  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_259(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 localizedName];
  v4 = [v3 localizedSynonyms];

  if (v5 && v4) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
  }
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_268(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = [v3 localizedSynonyms];
  v4 = [v3 localizedName];
  id v5 = [v10 arrayByAddingObject:v4];
  v6 = *(void **)(a1 + 32);
  v7 = NSNumber;
  uint64_t v8 = [v3 identifier];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  [v6 setObject:v5 forKeyedSubscript:v9];
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [a1[4] targetsForSourceIdentifier:a2];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_3;
  id v13 = &unk_1E68ED460;
  id v14 = a1[5];
  id v15 = v7;
  id v9 = v7;
  [v8 enumerateIdentifiersAsCollectionsWithBlock:&v10];
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v9, v6, v10, v11, v12, v13);
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v5 = [v3 objectForKeyedSubscript:v4];

  [*(id *)(a1 + 40) addObjectsFromArray:v5];
}

+ (id)localizedSynonymsForLocalizationKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 stringByAppendingString:@"Synonyms"];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:v3 value:v3 table:@"Localizable"];

  if ([v5 isEqualToString:v3])
  {
    id v6 = +[PGLogging sharedLogging];
    id v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      uint64_t v11 = v3;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Missing localization for synonyms key %@", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_7;
  }
  if (![v5 length] || (objc_msgSend(v5, "isEqualToString:", @"NULL") & 1) != 0)
  {
LABEL_7:
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_8;
  }
  uint64_t v8 = [v5 componentsSeparatedByString:@"|"];
LABEL_8:

  return v8;
}

@end