@interface NSComparisonPredicate(Conversion)
- (id)FCCKPQueryFiltersWithTranslator:()Conversion error:;
- (id)_parseBasicOperatorFiltersWithTranslator:()Conversion withError:;
- (id)_parseBeginsWithFiltersWithTranslator:()Conversion withError:;
- (id)_parseBetweenFiltersWithTranslator:()Conversion withError:;
- (id)_parseFullTextSearchFiltersWithTranslator:()Conversion withError:;
- (id)_parseFullTextSearchUsingContainsTranslator:()Conversion withError:;
- (id)_parseInFiltersWithTranslator:()Conversion withError:;
- (id)_parseListContainsAllFiltersWithTranslator:()Conversion withError:;
- (id)_parseListContainsAnyFiltersWithTranslator:()Conversion withError:;
- (id)_parseListContainsFiltersWithTranslator:()Conversion withError:;
- (uint64_t)_comparisonOptionForString:()Conversion;
@end

@implementation NSComparisonPredicate(Conversion)

- (id)_parseBasicOperatorFiltersWithTranslator:()Conversion withError:
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 leftExpression];
  v8 = [a1 rightExpression];
  if ((unint64_t)[a1 predicateOperatorType] > 5)
  {
    v11 = 0;
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  if ([v7 expressionType] == 3 || objc_msgSend(v7, "expressionType") == 1)
  {
    int v9 = 0;
    v10 = v7;
LABEL_11:
    v11 = [v10 CKExpressionValue];
    goto LABEL_12;
  }
  if ([v8 expressionType] == 3 || objc_msgSend(v8, "expressionType") == 1)
  {
    int v9 = 1;
    v10 = v8;
    goto LABEL_11;
  }
  int v9 = 0;
  v11 = 0;
LABEL_12:
  if (![v7 expressionType])
  {
    v19 = v7;
LABEL_21:
    uint64_t v18 = [v19 CKExpressionValue];
    goto LABEL_22;
  }
  if (![v8 expressionType])
  {
    v19 = v8;
    goto LABEL_21;
  }
  if ([v7 expressionType] != 4
    || ([v7 function],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isEqualToString:@"now"],
        v14,
        !v15))
  {
    if ([v8 expressionType] != 4
      || ([v8 function],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqualToString:@"now"],
          v16,
          !v17))
    {
      v12 = 0;
      if (v11) {
        goto LABEL_23;
      }
LABEL_36:
      if (a4)
      {
        id v22 = [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Expected key-path in comparison expression: %@", a1 format];
        v11 = 0;
        goto LABEL_42;
      }
      v11 = 0;
LABEL_7:
      v13 = 0;
      goto LABEL_43;
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
LABEL_22:
  v12 = (void *)v18;
  if (!v11) {
    goto LABEL_36;
  }
LABEL_23:
  int v20 = [v11 isEqualToString:*MEMORY[0x1E4F19D70]];
  int v21 = v20;
  if (!v12 && (v20 & 1) == 0)
  {
    if (a4)
    {
      id v22 = [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Expected constant value in comparison expression: %@", a1 format];
      v12 = 0;
LABEL_42:
      v13 = 0;
      *a4 = v22;
      goto LABEL_43;
    }
    goto LABEL_6;
  }
  unint64_t v23 = [a1 predicateOperatorType];
  unint64_t v24 = v23;
  if (v23 < 4) {
    int v25 = v9;
  }
  else {
    int v25 = 0;
  }
  if (v25 == 1) {
    unint64_t v24 = qword_1A4973CA8[v23];
  }
  if ([a1 comparisonPredicateModifier] == 1)
  {
    if (!a4) {
      goto LABEL_7;
    }
    [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Aggregate operator ALL not allowed for comparison expression: %@", a1 format];
LABEL_41:
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if ([a1 comparisonPredicateModifier] == 2)
  {
    if (!a4) {
      goto LABEL_7;
    }
    [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Aggregate operator ANY not allowed for comparison expression: %@", a1 format];
    goto LABEL_41;
  }
  int IsAcceptablePredicateClass = CKValueIsAcceptablePredicateClass();
  int v28 = v21 ^ 1;
  if (v12) {
    int v28 = 1;
  }
  if (!IsAcceptablePredicateClass && v28)
  {
    if (a4)
    {
      v29 = (void *)MEMORY[0x1E4F1A130];
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *a4 = [v29 errorWithCode:1009, @"Type '%@' not allowed in comparison expression: %@", v31, a1 format];
    }
    goto LABEL_7;
  }
  uint64_t v32 = objc_opt_new();
  v33 = FCCKPRecordFieldIdentifierForUserFieldName(v11);
  -[FCCKPQueryFilter setFieldName:](v32, v33);

  int v34 = FCCKPQueryFilterTypeForNSPredicateOperatorType(v24);
  if (v32)
  {
    *(unsigned char *)(v32 + 28) |= 1u;
    *(_DWORD *)(v32 + 24) = v34;
  }
  v35 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v12);
  -[FCCKPQueryFilter setFieldValue:](v32, v35);

  v36[0] = v32;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];

LABEL_43:
  return v13;
}

- (id)_parseInFiltersWithTranslator:()Conversion withError:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 leftExpression];
  id v6 = [a1 rightExpression];
  uint64_t v7 = [v5 expressionType];
  uint64_t v8 = [v6 expressionType];
  if ([a1 predicateOperatorType] == 10
    && ![a1 comparisonPredicateModifier]
    && v7 == 3
    && (v8 == 14 || !v8))
  {
    uint64_t v9 = objc_opt_new();
    v10 = [v5 CKExpressionValue];
    v11 = FCCKPRecordFieldIdentifierForUserFieldName(v10);
    -[FCCKPQueryFilter setFieldName:](v9, v11);

    if (v9)
    {
      *(unsigned char *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 3;
    }
    v12 = [v6 CKExpressionValue];
    v13 = CKNSArrayFromCollection(v12);
    v14 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v13);
    -[FCCKPQueryFilter setFieldValue:](v9, v14);

    uint64_t v32 = v9;
    int v15 = &v32;
  }
  else if ([a1 predicateOperatorType] == 4 {
         && [a1 comparisonPredicateModifier] == 2
  }
         && (v7 != 14 ? (BOOL v16 = v7 == 0) : (BOOL v16 = 1), v16 && v8 == 3))
  {
    uint64_t v9 = objc_opt_new();
    int v17 = [v6 CKExpressionValue];
    uint64_t v18 = FCCKPRecordFieldIdentifierForUserFieldName(v17);
    -[FCCKPQueryFilter setFieldName:](v9, v18);

    if (v9)
    {
      *(unsigned char *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 3;
    }
    v19 = [v5 CKExpressionValue];
    int v20 = CKNSArrayFromCollection(v19);
    int v21 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v20);
    -[FCCKPQueryFilter setFieldValue:](v9, v21);

    uint64_t v31 = v9;
    int v15 = &v31;
  }
  else
  {
    if ([a1 predicateOperatorType] != 99 || objc_msgSend(a1, "comparisonPredicateModifier"))
    {
      id v22 = 0;
      goto LABEL_33;
    }
    id v22 = 0;
    BOOL v23 = v7 == 14 || v7 == 0;
    if (!v23 || v8 != 3) {
      goto LABEL_33;
    }
    uint64_t v9 = objc_opt_new();
    unint64_t v24 = [v6 CKExpressionValue];
    int v25 = FCCKPRecordFieldIdentifierForUserFieldName(v24);
    -[FCCKPQueryFilter setFieldName:](v9, v25);

    if (v9)
    {
      *(unsigned char *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 3;
    }
    v26 = [v5 CKExpressionValue];
    v27 = CKNSArrayFromCollection(v26);
    int v28 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v27);
    -[FCCKPQueryFilter setFieldValue:](v9, v28);

    uint64_t v30 = v9;
    int v15 = &v30;
  }
  id v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 1, v30, v31, v32, v33);

LABEL_33:
  return v22;
}

- (id)FCCKPQueryFiltersWithTranslator:()Conversion error:
{
  id v6 = a3;
  id v32 = 0;
  uint64_t v7 = [a1 _parseFullTextSearchUsingContainsTranslator:v6 withError:&v32];
  id v8 = v32;
  uint64_t v9 = v8;
  if (v7)
  {
    id v10 = v7;
    goto LABEL_7;
  }
  id v31 = v8;
  v11 = [a1 _parseFullTextSearchFiltersWithTranslator:v6 withError:&v31];
  id v12 = v31;

  if (v11)
  {
    id v13 = v11;
LABEL_5:
    id v10 = v13;
LABEL_6:
    uint64_t v9 = v12;
    goto LABEL_7;
  }
  if (v12) {
    goto LABEL_13;
  }
  if ([a1 options])
  {
    id v12 = [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Predicate comparison options are not supported for expression: %@", a1 format];
    goto LABEL_13;
  }
  id v30 = 0;
  BOOL v16 = [a1 _parseListContainsFiltersWithTranslator:v6 withError:&v30];
  id v17 = v30;
  id v12 = v17;
  if (v16)
  {
LABEL_18:
    id v13 = v16;
    goto LABEL_5;
  }
  if (v17) {
    goto LABEL_13;
  }
  id v29 = 0;
  BOOL v16 = [a1 _parseInFiltersWithTranslator:v6 withError:&v29];
  id v18 = v29;
  id v12 = v18;
  if (v16) {
    goto LABEL_18;
  }
  if (v18) {
    goto LABEL_13;
  }
  id v28 = 0;
  BOOL v16 = [a1 _parseListContainsAnyFiltersWithTranslator:v6 withError:&v28];
  id v19 = v28;
  id v12 = v19;
  if (v16) {
    goto LABEL_18;
  }
  if (v19) {
    goto LABEL_13;
  }
  id v27 = 0;
  BOOL v16 = [a1 _parseListContainsAllFiltersWithTranslator:v6 withError:&v27];
  id v20 = v27;
  id v12 = v20;
  if (v16) {
    goto LABEL_18;
  }
  if (v20) {
    goto LABEL_13;
  }
  id v26 = 0;
  BOOL v16 = [a1 _parseBeginsWithFiltersWithTranslator:v6 withError:&v26];
  id v21 = v26;
  id v12 = v21;
  if (v16) {
    goto LABEL_18;
  }
  if (v21) {
    goto LABEL_13;
  }
  id v25 = 0;
  BOOL v16 = [a1 _parseBetweenFiltersWithTranslator:v6 withError:&v25];
  id v22 = v25;
  id v12 = v22;
  if (v16) {
    goto LABEL_18;
  }
  if (v22) {
    goto LABEL_13;
  }
  id v24 = 0;
  BOOL v16 = [a1 _parseBasicOperatorFiltersWithTranslator:v6 withError:&v24];
  id v23 = v24;
  id v12 = v23;
  if (v16) {
    goto LABEL_18;
  }
  if (v23)
  {
LABEL_13:
    id v10 = 0;
    if (!a4 || !v12) {
      goto LABEL_6;
    }
    id v15 = v12;
    uint64_t v9 = v15;
    id v10 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    id v15 = [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Unexpected expression: %@", a1 format];
    id v10 = 0;
    uint64_t v9 = 0;
LABEL_16:
    *a4 = v15;
    goto LABEL_7;
  }
  id v10 = 0;
  uint64_t v9 = 0;
LABEL_7:

  return v10;
}

- (id)_parseListContainsFiltersWithTranslator:()Conversion withError:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 leftExpression];
  id v6 = [a1 rightExpression];
  if ([a1 predicateOperatorType] != 10
    || [a1 comparisonPredicateModifier]
    || [v5 expressionType]
    || [v6 expressionType] != 3)
  {
    if ([a1 predicateOperatorType] == 99
      && ![a1 comparisonPredicateModifier]
      && [v5 expressionType] == 3
      && ![v6 expressionType])
    {
      uint64_t v7 = objc_opt_new();
      id v19 = [v5 CKExpressionValue];
      id v20 = FCCKPRecordFieldIdentifierForUserFieldName(v19);
      -[FCCKPQueryFilter setFieldName:](v7, v20);

      if (v7)
      {
        *(unsigned char *)(v7 + 28) |= 1u;
        *(_DWORD *)(v7 + 24) = 12;
      }
      id v21 = [v6 CKExpressionValue];
      id v22 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v21);
      -[FCCKPQueryFilter setFieldValue:](v7, v22);

      uint64_t v24 = v7;
      id v12 = &v24;
    }
    else
    {
      if ([a1 predicateOperatorType] != 4
        || [a1 comparisonPredicateModifier] != 2
        || [v5 expressionType] != 3
        || [v6 expressionType])
      {
        id v13 = 0;
        goto LABEL_17;
      }
      uint64_t v7 = objc_opt_new();
      id v15 = [v5 CKExpressionValue];
      BOOL v16 = FCCKPRecordFieldIdentifierForUserFieldName(v15);
      -[FCCKPQueryFilter setFieldName:](v7, v16);

      if (v7)
      {
        *(unsigned char *)(v7 + 28) |= 1u;
        *(_DWORD *)(v7 + 24) = 12;
      }
      id v17 = [v6 CKExpressionValue];
      id v18 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v17);
      -[FCCKPQueryFilter setFieldValue:](v7, v18);

      uint64_t v23 = v7;
      id v12 = &v23;
    }
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    id v8 = [v6 CKExpressionValue];
    uint64_t v9 = FCCKPRecordFieldIdentifierForUserFieldName(v8);
    -[FCCKPQueryFilter setFieldName:](v7, v9);

    if (v7)
    {
      *(unsigned char *)(v7 + 28) |= 1u;
      *(_DWORD *)(v7 + 24) = 12;
    }
    id v10 = [v5 CKExpressionValue];
    v11 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v10);
    -[FCCKPQueryFilter setFieldValue:](v7, v11);

    uint64_t v25 = v7;
    id v12 = &v25;
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1, v23, v24, v25, v26);

LABEL_17:
  return v13;
}

- (id)_parseFullTextSearchUsingContainsTranslator:()Conversion withError:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 leftExpression];
  id v6 = [a1 rightExpression];
  if ([a1 predicateOperatorType] == 99
    && [v5 expressionType] == 1
    && ![v6 expressionType])
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [a1 comparisonPredicateModifier];
    if (v9)
    {
      if (v10 == 1) {
        int v11 = 10;
      }
      else {
        int v11 = 11;
      }
      *(unsigned char *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = v11;
    }
    id v12 = [v6 constantValue];
    id v13 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v12);
    -[FCCKPQueryFilter setFieldValue:](v9, v13);

    v14[0] = v9;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_parseFullTextSearchFiltersWithTranslator:()Conversion withError:
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 leftExpression];
  id v8 = [a1 rightExpression];
  if ([v7 expressionType] != 3
    || ([v7 keyPath],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:@"allTokens"],
        v9,
        int v11 = v7,
        id v12 = v8,
        (v10 & 1) == 0))
  {
    if ([v8 expressionType] != 3
      || ([v8 keyPath],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isEqualToString:@"allTokens"],
          v13,
          int v11 = v8,
          id v12 = v7,
          !v14))
    {
      id v29 = 0;
      goto LABEL_63;
    }
  }
  id v15 = v11;
  id v16 = v12;
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = [v16 expressionType];
  if (!v18)
  {
    uint64_t v42 = (uint64_t)v6;
    id v27 = [v16 constantValue];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Required string or tokenize() arguments when comparing to special key-path allTokens: %@", a1 format];
      }

      id v29 = 0;
      id v6 = (id)v42;
      goto LABEL_62;
    }
    id v41 = v15;
    id v28 = [v16 constantValue];
    id v30 = -[FCCKProtocolTranslator fieldValueFromObject:](v42, v28);
    -[FCCKPQueryFilter setFieldValue:](v17, v30);

LABEL_17:
    id v15 = v41;
    if ([a1 comparisonPredicateModifier] == 1 && v41 == v7)
    {
      id v6 = (id)v42;
      if (a4)
      {
        [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Enumerating special key-path allTokens is not allowed: %@", a1 format];
        goto LABEL_14;
      }
LABEL_61:
      id v29 = 0;
      goto LABEL_62;
    }
    id v6 = (id)v42;
    if ([a1 predicateOperatorType] == 1000)
    {
      if (!v18
        && (([a1 options] & 4) != 0
         || ([a1 options] & 1) == 0
         || ([a1 options] & 2) == 0
         || ([a1 options] & 8) == 0))
      {
        if (a4)
        {
          [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption comparison predicate options: %@", a1 format];
          goto LABEL_14;
        }
        goto LABEL_61;
      }
      uint64_t v31 = [a1 comparisonPredicateModifier];
      if (v17)
      {
        if (v31 == 1) {
          int v32 = 10;
        }
        else {
          int v32 = 11;
        }
        *(unsigned char *)(v17 + 28) |= 1u;
        *(_DWORD *)(v17 + 24) = v32;
      }
      v44[0] = v17;
      uint64_t v33 = (void *)MEMORY[0x1E4F1C978];
      int v34 = v44;
    }
    else
    {
      if ([a1 predicateOperatorType] != 10)
      {
        if (a4)
        {
          [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Required comparison operators TOKENMATCHES or IN when searching special key-path allTokens: %@", a1 format];
          goto LABEL_14;
        }
        goto LABEL_61;
      }
      if ([a1 comparisonPredicateModifier] == 2)
      {
        int v35 = 11;
      }
      else
      {
        if ([a1 comparisonPredicateModifier] != 1)
        {
          if (a4)
          {
            [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Required predicate modifier ANY or ALL when searching special key-path allTokens: %@", a1 format];
            goto LABEL_14;
          }
          goto LABEL_61;
        }
        int v35 = 10;
      }
      if (v17)
      {
        *(unsigned char *)(v17 + 28) |= 1u;
        *(_DWORD *)(v17 + 24) = v35;
      }
      if (![v16 expressionType])
      {
        if (a4)
        {
          [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Required tokenize() operand when searching special key-path allTokens: %@", a1 format];
          goto LABEL_14;
        }
        goto LABEL_61;
      }
      uint64_t v43 = v17;
      uint64_t v33 = (void *)MEMORY[0x1E4F1C978];
      int v34 = &v43;
    }
    id v29 = [v33 arrayWithObjects:v34 count:1];
    goto LABEL_62;
  }
  if ([v16 expressionType] == 4)
  {
    [v16 function];
    id v19 = v41 = v15;
    int v20 = [v19 isEqualToString:@"tokenize:using:"];

    id v15 = v41;
    if (v20)
    {
      uint64_t v40 = v17;
      uint64_t v42 = (uint64_t)v6;
      id v21 = [v16 arguments];
      id v22 = [v21 objectAtIndexedSubscript:1];
      uint64_t v23 = [v22 constantValue];
      char v24 = [a1 _comparisonOptionForString:v23];

      if ((v24 & 0xF) == 0xBLL)
      {
        uint64_t v25 = [v16 arguments];
        uint64_t v26 = [v25 objectAtIndexedSubscript:0];
        id v27 = [v26 constantValue];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = -[FCCKProtocolTranslator fieldValueFromObject:](v42, v27);
          uint64_t v17 = v40;
          -[FCCKPQueryFilter setFieldValue:](v40, v28);
          goto LABEL_17;
        }
        if (a4)
        {
          v36 = (void *)MEMORY[0x1E4F1A130];
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          *a4 = [v36 errorWithCode:1009, @"Required string argument when using tokenize(), but got %@: %@", v38, a1 format];
        }
        id v29 = 0;
        id v15 = v41;
        id v6 = (id)v42;
      }
      else
      {
        id v15 = v41;
        id v6 = (id)v42;
        if (a4)
        {
          [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption tokenization options on tokenize() function: %@", a1 format];
          id v29 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v29 = 0;
        }
      }
      uint64_t v17 = v40;
      goto LABEL_62;
    }
  }
  if (!a4) {
    goto LABEL_61;
  }
  [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Required string or tokenize() arguments when searching special key-path allTokens: %@", a1 format];
LABEL_14:
  id v29 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

LABEL_63:
  return v29;
}

- (id)_parseListContainsAnyFiltersWithTranslator:()Conversion withError:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 leftExpression];
  id v6 = [a1 rightExpression];
  uint64_t v7 = [v5 expressionType];
  uint64_t v8 = [v6 expressionType];
  if ([a1 predicateOperatorType] == 10
    && [a1 comparisonPredicateModifier] == 2
    && v7 == 3
    && (v8 == 14 || !v8))
  {
    uint64_t v9 = objc_opt_new();
    char v10 = [v5 CKExpressionValue];
    int v11 = FCCKPRecordFieldIdentifierForUserFieldName(v10);
    -[FCCKPQueryFilter setFieldName:](v9, v11);

    if (v9)
    {
      *(unsigned char *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 14;
    }
    id v12 = [v6 CKExpressionValue];
    id v13 = CKNSArrayFromCollection(v12);
    int v14 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v13);
    -[FCCKPQueryFilter setFieldValue:](v9, v14);

    v25[0] = v9;
    id v15 = v25;
LABEL_20:
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    goto LABEL_22;
  }
  if ([a1 predicateOperatorType] == 10 && objc_msgSend(a1, "comparisonPredicateModifier") == 2)
  {
    id v16 = 0;
    BOOL v17 = v7 == 14 || v7 == 0;
    if (!v17 || v8 != 3) {
      goto LABEL_22;
    }
    uint64_t v9 = objc_opt_new();
    uint64_t v18 = [v6 CKExpressionValue];
    id v19 = FCCKPRecordFieldIdentifierForUserFieldName(v18);
    -[FCCKPQueryFilter setFieldName:](v9, v19);

    if (v9)
    {
      *(unsigned char *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 14;
    }
    int v20 = [v5 CKExpressionValue];
    id v21 = CKNSArrayFromCollection(v20);
    id v22 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v21);
    -[FCCKPQueryFilter setFieldValue:](v9, v22);

    uint64_t v24 = v9;
    id v15 = &v24;
    goto LABEL_20;
  }
  id v16 = 0;
LABEL_22:

  return v16;
}

- (id)_parseListContainsAllFiltersWithTranslator:()Conversion withError:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 leftExpression];
  id v6 = [a1 rightExpression];
  uint64_t v7 = [v5 expressionType];
  uint64_t v8 = [v6 expressionType];
  if ([a1 predicateOperatorType] == 10 && objc_msgSend(a1, "comparisonPredicateModifier") == 1)
  {
    uint64_t v9 = 0;
    BOOL v10 = v7 == 14 || v7 == 0;
    if (v10 && v8 == 3)
    {
      uint64_t v11 = objc_opt_new();
      id v12 = [v6 CKExpressionValue];
      id v13 = FCCKPRecordFieldIdentifierForUserFieldName(v12);
      -[FCCKPQueryFilter setFieldName:](v11, v13);

      if (v11)
      {
        *(unsigned char *)(v11 + 28) |= 1u;
        *(_DWORD *)(v11 + 24) = 20;
      }
      int v14 = [v5 CKExpressionValue];
      id v15 = CKNSArrayFromCollection(v14);
      id v16 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v15);
      -[FCCKPQueryFilter setFieldValue:](v11, v16);

      v18[0] = v11;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_parseBetweenFiltersWithTranslator:()Conversion withError:
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 leftExpression];
  uint64_t v8 = [a1 rightExpression];
  if ([a1 predicateOperatorType] == 100
    && ![a1 comparisonPredicateModifier]
    && [v7 expressionType] == 3
    && [v8 expressionType] == 14)
  {
    uint64_t v9 = [v8 constantValue];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 count] == 2)
    {
      BOOL v10 = [v9 objectAtIndexedSubscript:0];
      uint64_t v11 = [v10 CKExpressionValue];

      id v12 = [v9 objectAtIndexedSubscript:1];
      id v13 = [v12 CKExpressionValue];

      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v28 = v13;
        uint64_t v14 = objc_opt_new();
        uint64_t v15 = objc_opt_new();
        id v16 = [v7 CKExpressionValue];
        FCCKPRecordFieldIdentifierForUserFieldName(v16);
        v18 = BOOL v17 = v11;
        -[FCCKPQueryFilter setFieldName:](v14, v18);

        id v29 = v17;
        id v19 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v17);
        -[FCCKPQueryFilter setFieldValue:](v14, v19);

        if (v14)
        {
          *(unsigned char *)(v14 + 28) |= 1u;
          *(_DWORD *)(v14 + 24) = 8;
          int v20 = *(void **)(v14 + 8);
        }
        else
        {
          int v20 = 0;
        }
        id v13 = v28;
        id v21 = v20;
        -[FCCKPQueryFilter setFieldName:](v15, v21);

        id v22 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v28);
        -[FCCKPQueryFilter setFieldValue:](v15, v22);

        if (v15)
        {
          *(unsigned char *)(v15 + 28) |= 1u;
          *(_DWORD *)(v15 + 24) = 6;
        }
        v30[0] = v14;
        v30[1] = v15;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];

        uint64_t v11 = v29;
      }
      else if (a4)
      {
        [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Expected array with two number arguments on right hand side: %@", a1 format];
        uint64_t v23 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    else
    {
      if (a4)
      {
        uint64_t v25 = (void *)MEMORY[0x1E4F1A130];
        uint64_t v26 = (objc_class *)objc_opt_class();
        id v27 = NSStringFromClass(v26);
        *a4 = [v25 errorWithCode:1009, @"Expected array with two number arguments on right hand side, but got %@: %@", v27, a1 format];
      }
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)_parseBeginsWithFiltersWithTranslator:()Conversion withError:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 leftExpression];
  uint64_t v8 = [a1 rightExpression];
  if ([a1 predicateOperatorType] != 8
    || [v7 expressionType] != 3
    || [v8 expressionType])
  {
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  uint64_t v11 = [v8 CKExpressionValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Expected NSString or NSData on right hand side: %@", a1 format];
        uint64_t v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v9 = 0;
      }
      goto LABEL_21;
    }
  }
  uint64_t v12 = objc_opt_new();
  id v13 = [v7 CKExpressionValue];
  uint64_t v14 = FCCKPRecordFieldIdentifierForUserFieldName(v13);
  -[FCCKPQueryFilter setFieldName:](v12, v14);

  uint64_t v15 = -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v11);
  -[FCCKPQueryFilter setFieldValue:](v12, v15);

  if (![a1 comparisonPredicateModifier])
  {
    int v16 = 16;
    goto LABEL_14;
  }
  if ([a1 comparisonPredicateModifier] == 2)
  {
    int v16 = 18;
LABEL_14:
    if (v12)
    {
      *(unsigned char *)(v12 + 28) |= 1u;
      *(_DWORD *)(v12 + 24) = v16;
    }
    v17[0] = v12;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    goto LABEL_20;
  }
  uint64_t v9 = 0;
LABEL_20:

LABEL_21:
LABEL_5:

  return v9;
}

- (uint64_t)_comparisonOptionForString:()Conversion
{
  id v3 = a3;
  if ([v3 rangeOfString:@"n"] == 0x7FFFFFFFFFFFFFFFLL
    && [v3 rangeOfString:@"N"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v3 rangeOfString:@"c"] != 0x7FFFFFFFFFFFFFFFLL
      || [v3 rangeOfString:@"C"] != 0x7FFFFFFFFFFFFFFFLL;
    if ([v3 rangeOfString:@"d"] != 0x7FFFFFFFFFFFFFFFLL
      || [v3 rangeOfString:@"D"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 |= 2uLL;
    }
    if ([v3 rangeOfString:@"l"] != 0x7FFFFFFFFFFFFFFFLL
      || [v3 rangeOfString:@"L"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 |= 8uLL;
    }
  }
  else
  {
    uint64_t v4 = 4;
  }

  return v4;
}

@end