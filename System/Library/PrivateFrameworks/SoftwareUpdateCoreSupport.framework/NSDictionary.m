@interface NSDictionary
@end

@implementation NSDictionary

void __45__NSDictionary_SUCoreDictionary__safeSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingString:@","];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  if (isKindOfClass)
  {
    v12 = (void *)[[NSString alloc] initWithFormat:@"%@:", v18];
    uint64_t v13 = [v11 stringByAppendingString:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = [*(id *)(v10 + 40) stringByAppendingString:@"?:"];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v3 = [v5 length];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v3 > *(void *)(v4 + 24)) {
      *(void *)(v4 + 24) = v3;
    }
  }
}

void __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void *)(*(void *)(a1[7] + 8) + 24);
  if ((isKindOfClass & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F1C9E8] _safeKeyName:@"?" paddedToLength:v7];
    v9 = *(void **)(*(void *)(a1[8] + 8) + 40);
    uint64_t v10 = [[NSString alloc] initWithFormat:@"%@ %@%@: ?\n", a1[5], a1[6], v8, v23];
    goto LABEL_6;
  }
  v8 = [MEMORY[0x1E4F1C9E8] _safeKeyName:v24 paddedToLength:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((unint64_t)(a1[9] + 1) > a1[10])
    {
      v9 = *(void **)(*(void *)(a1[8] + 8) + 40);
      uint64_t v10 = [[NSString alloc] initWithFormat:@"%@ %@%@: <sub-dictionary> at depth=%llu\n", a1[5], a1[6], v8, a1[9]];
LABEL_6:
      v11 = (void *)v10;
      uint64_t v12 = [v9 stringByAppendingString:v10];
      uint64_t v13 = *(void *)(a1[8] + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
      goto LABEL_10;
    }
    v11 = objc_msgSend(v5, "_safeDescriptionWithName:atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:", v8);
    v15 = *(void **)(*(void *)(a1[8] + 8) + 40);
    uint64_t v19 = [[NSString alloc] initWithFormat:@"%@ %@%@: <sub-dictionary>:\n%@\n", a1[5], a1[6], v8, v11];
  }
  else
  {
    v15 = *(void **)(*(void *)(a1[8] + 8) + 40);
    id v16 = [NSString alloc];
    uint64_t v18 = a1[5];
    uint64_t v17 = a1[6];
    v11 = [MEMORY[0x1E4F1C9E8] _safeValueName:v5 ofMaxFieldLength:a1[11] providingSubstitutionMap:a1[4]];
    uint64_t v19 = [v16 initWithFormat:@"%@ %@%@: %@\n", v18, v17, v8, v11];
  }
  uint64_t v14 = (void *)v19;
  uint64_t v20 = [v15 stringByAppendingString:v19];
  uint64_t v21 = *(void *)(a1[8] + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

LABEL_10:
}

void __126__NSDictionary_SUCoreDictionary__safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = *(void *)(a1[4] + 8);
      unint64_t v10 = *(void *)(v9 + 24);
      if (v10 >= a1[7])
      {
        objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
        objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
        *a4 = 1;
      }
      else
      {
        *(void *)(v9 + 24) = v10 + 1;
      }
    }
  }
}

@end