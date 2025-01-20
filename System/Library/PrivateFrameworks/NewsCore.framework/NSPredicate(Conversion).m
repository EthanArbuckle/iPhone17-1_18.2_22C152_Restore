@interface NSPredicate(Conversion)
+ (id)predicateWithFCCKPQueryFilters:()Conversion translator:;
+ (id)predicateWithSortedFCCKPQueryFilters:()Conversion translator:;
- (uint64_t)FCCKPQueryFiltersWithTranslator:()Conversion error:;
@end

@implementation NSPredicate(Conversion)

+ (id)predicateWithSortedFCCKPQueryFilters:()Conversion translator:
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 count] >= 2)
  {
    v7 = (void *)MEMORY[0x1E4F28F60];
    v8 = [v5 objectAtIndexedSubscript:0];
    v54[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    id v10 = [v7 predicateWithFCCKPQueryFilters:v9 translator:v6];

    v11 = (void *)MEMORY[0x1E4F28F60];
    v12 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
    v13 = [v11 predicateWithFCCKPQueryFilters:v12 translator:v6];

    if (v10)
    {
      if (v13)
      {
        v14 = (void *)MEMORY[0x1E4F28BA0];
        v53[0] = v10;
        v53[1] = v13;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
        v16 = [v14 andPredicateWithSubpredicates:v15];

LABEL_15:
        goto LABEL_37;
      }
      id v28 = v10;
    }
    else
    {
      id v28 = v13;
    }
    v16 = v28;
    goto LABEL_15;
  }
  uint64_t v17 = [v5 lastObject];
  uint64_t v18 = v17;
  if (v17)
  {
    if (*(unsigned char *)(v17 + 28))
    {
      v19 = 0;
      v20 = 0;
      v21 = 0;
      switch(*(_DWORD *)(v17 + 24))
      {
        case 1:
        case 2:
        case 5:
        case 6:
        case 7:
        case 8:
          break;
        case 3:
          v29 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v31 = [v30 name];
          id v32 = *(id *)(v18 + 16);
          v33 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          [v29 predicateWithFormat:@"%K IN %@", v31, v33];
          goto LABEL_30;
        case 4:
          v34 = (void *)MEMORY[0x1E4F28BA0];
          v35 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v36 = [v30 name];
          id v37 = *(id *)(v18 + 16);
          v38 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          [v35 predicateWithFormat:@"%K IN %@", v36, v38];
          goto LABEL_33;
        case 0xA:
          v39 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 16);
          v31 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          [v39 predicateWithFormat:@"ALL tokenize(%@, 'cdl') IN allTokens", v31];
          goto LABEL_20;
        case 0xB:
          v40 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 16);
          v31 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          [v40 predicateWithFormat:@"ANY tokenize(%@, 'cdl') IN allTokens", v31];
          v19 = LABEL_20:;
          goto LABEL_31;
        case 0xC:
          v41 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v31 = [v30 name];
          id v32 = *(id *)(v18 + 16);
          v33 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          [v41 predicateWithFormat:@"%K CONTAINS %@", v31, v33];
          goto LABEL_30;
        case 0xD:
          v34 = (void *)MEMORY[0x1E4F28BA0];
          v42 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v36 = [v30 name];
          id v37 = *(id *)(v18 + 16);
          v38 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          [v42 predicateWithFormat:@"%K CONTAINS %@", v36, v38];
          goto LABEL_33;
        case 0xE:
          v43 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 16);
          v31 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          id v32 = *(id *)(v18 + 8);
          v33 = [v32 name];
          [v43 predicateWithFormat:@"ANY %@ IN %K", v31, v33];
          goto LABEL_30;
        case 0xF:
          v34 = (void *)MEMORY[0x1E4F28BA0];
          v44 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 16);
          v36 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          id v37 = *(id *)(v18 + 8);
          v38 = [v37 name];
          [v44 predicateWithFormat:@"ANY %@ IN %K", v36, v38];
          goto LABEL_33;
        case 0x10:
          v45 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v31 = [v30 name];
          id v32 = *(id *)(v18 + 16);
          v33 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          [v45 predicateWithFormat:@"%K BEGINSWITH %@", v31, v33];
          goto LABEL_30;
        case 0x11:
          v34 = (void *)MEMORY[0x1E4F28BA0];
          v46 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v36 = [v30 name];
          id v37 = *(id *)(v18 + 16);
          v38 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          [v46 predicateWithFormat:@"%K BEGINSWITH %@", v36, v38];
          goto LABEL_33;
        case 0x12:
          v47 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v31 = [v30 name];
          id v32 = *(id *)(v18 + 16);
          v33 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          [v47 predicateWithFormat:@"ANY %K BEGINSWITH %@", v31, v33];
          goto LABEL_30;
        case 0x13:
          v34 = (void *)MEMORY[0x1E4F28BA0];
          v48 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 8);
          v36 = [v30 name];
          id v37 = *(id *)(v18 + 16);
          v38 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          [v48 predicateWithFormat:@"ANY %K BEGINSWITH %@", v36, v38];
          goto LABEL_33;
        case 0x14:
          v49 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 16);
          v31 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          id v32 = *(id *)(v18 + 8);
          v33 = [v32 name];
          [v49 predicateWithFormat:@"ALL %@ IN %K", v31, v33];
          v19 = LABEL_30:;

LABEL_31:
          goto LABEL_34;
        case 0x15:
          v34 = (void *)MEMORY[0x1E4F28BA0];
          v50 = (void *)MEMORY[0x1E4F28F60];
          id v30 = *(id *)(v17 + 16);
          v36 = -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          id v37 = *(id *)(v18 + 8);
          v38 = [v37 name];
          [v50 predicateWithFormat:@"ALL %@ IN %K", v36, v38];
          v51 = LABEL_33:;
          v19 = [v34 notPredicateWithSubpredicate:v51];

LABEL_34:
          goto LABEL_35;
        default:
          goto LABEL_36;
      }
    }
    v22 = (void *)MEMORY[0x1E4F28C68];
    id v23 = *(id *)(v17 + 8);
    v24 = [v23 name];
    v20 = [v22 expressionForKeyPath:v24];

    v25 = (void *)MEMORY[0x1E4F28C68];
    id v26 = *(id *)(v18 + 16);
    v21 = [v25 expressionWithFCCKPRecordFieldValue:v26 translator:v6];

    if (*(unsigned char *)(v18 + 28)) {
      int v27 = *(_DWORD *)(v18 + 24);
    }
    else {
      int v27 = 1;
    }
    v19 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v20 rightExpression:v21 modifier:0 type:CKNSPredicateOperatorTypeForFCCKPQueryFilterType(v27) options:0];
  }
  else
  {
    v19 = 0;
LABEL_35:
    v20 = 0;
    v21 = 0;
  }
LABEL_36:
  id v10 = v19;

  v16 = v10;
LABEL_37:

  return v16;
}

+ (id)predicateWithFCCKPQueryFilters:()Conversion translator:
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v7 = [v5 sortedArrayUsingComparator:&__block_literal_global_192];

    id v5 = (id)v7;
  }
  v8 = [MEMORY[0x1E4F28F60] predicateWithSortedFCCKPQueryFilters:v5 translator:v6];

  return v8;
}

- (uint64_t)FCCKPQueryFiltersWithTranslator:()Conversion error:
{
  NSClassFromString(&cfstr_Nstruepredicat.isa);
  if (objc_opt_isKindOfClass()) {
    return MEMORY[0x1E4F1CBF0];
  }
  if (a4)
  {
    id v6 = (void *)MEMORY[0x1E4F1A130];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    *a4 = [v6 errorWithCode:1017, @"Unexpected predicate type: %@", v8 format];
  }
  return 0;
}

@end