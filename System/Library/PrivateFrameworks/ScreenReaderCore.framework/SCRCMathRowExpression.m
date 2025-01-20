@interface SCRCMathRowExpression
- (BOOL)beginsWithSpace;
- (BOOL)canBeUsedWithBase;
- (BOOL)canBeUsedWithRange;
- (BOOL)endsWithSpace;
- (BOOL)isFunctionName;
- (BOOL)isInteger;
- (BOOL)isNumber;
- (BOOL)isWordOrAbbreviation;
- (id)_indexesOfCharactersInWords;
- (id)childSpeakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 parentTreePosition:(id)a5 childIndex:(unint64_t *)a6;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexDescriptionInMathMode:(BOOL)a3;
- (id)mathMLTag;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSummary;
- (int64_t)integerValue;
- (void)_addSpacingAndChild:(id)a3 toResult:(id)a4 nextChild:(id)a5 previousChild:(id)a6 numberOfOuterRadicals:(unint64_t)a7 treePosition:(id)a8;
@end

@implementation SCRCMathRowExpression

- (BOOL)isNumber
{
  if ([(SCRCMathExpression *)self isNumberOverride]) {
    return 1;
  }
  v4 = [(SCRCMathArrayExpression *)self children];
  if ([v4 count] == 1)
  {
    v5 = [v4 lastObject];
    char v3 = [v5 isNumber];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isInteger
{
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 lastObject];
  char v7 = [v6 isInteger];

  return v7;
}

- (int64_t)integerValue
{
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 lastObject];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (BOOL)isFunctionName
{
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 lastObject];
  char v7 = [v6 isFunctionName];

  return v7;
}

- (BOOL)isWordOrAbbreviation
{
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 lastObject];
  char v7 = [v6 isWordOrAbbreviation];

  return v7;
}

- (BOOL)canBeUsedWithRange
{
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 lastObject];
  char v7 = [v6 canBeUsedWithRange];

  return v7;
}

- (BOOL)canBeUsedWithBase
{
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 lastObject];
  char v7 = [v6 canBeUsedWithBase];

  return v7;
}

- (BOOL)beginsWithSpace
{
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 objectAtIndex:0];
  char v7 = [v6 beginsWithSpace];

  return v7;
}

- (BOOL)endsWithSpace
{
  v2 = [(SCRCMathArrayExpression *)self children];
  char v3 = [v2 lastObject];
  char v4 = [v3 endsWithSpace];

  return v4;
}

- (id)_indexesOfCharactersInWords
{
  char v3 = [MEMORY[0x263F089C8] indexSet];
  char v4 = [(SCRCMathArrayExpression *)self children];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 0;
    do
    {
      v8 = [v4 objectAtIndex:v7];
      if (v7 + 1 >= v6)
      {
        unint64_t v9 = 1;
      }
      else
      {
        unint64_t v9 = 1;
        while (1)
        {
          v10 = [v4 objectAtIndex:v7 + v9];
          int v11 = [v10 canFormWordStartingWithExpression:v8];

          if (!v11) {
            break;
          }
          if (v6 - v7 == ++v9)
          {
            unint64_t v9 = v6 - v7;
            break;
          }
        }
        if (v9 >= 3) {
          objc_msgSend(v3, "addIndexesInRange:", v7, v9);
        }
      }
      v7 += v9;
    }
    while (v7 < v6);
  }

  return v3;
}

- (id)childSpeakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 parentTreePosition:(id)a5 childIndex:(unint64_t *)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v10 = a5;
  unint64_t v11 = *a6;
  v12 = [(SCRCMathArrayExpression *)self children];
  uint64_t v13 = [v12 count];
  v14 = [v12 objectAtIndex:v11];
  int v15 = [v14 isRangeSubSuperscript];
  if ((v15 | [v14 isBaseSubSuperscript]) != 1 || v11 >= v13 - 1)
  {
    v52.receiver = self;
    v52.super_class = (Class)SCRCMathRowExpression;
    v17 = [(SCRCMathArrayExpression *)&v52 childSpeakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 parentTreePosition:v10 childIndex:a6];
  }
  else
  {
    v44 = self;
    v18 = v12;
    if (v15) {
      v19 = @"segment.range.firstchild.prefix";
    }
    else {
      v19 = @"segment.base.firstchild.prefix";
    }
    v20 = @"segment.base.firstchild.suffix";
    if (v15) {
      v20 = @"segment.range.firstchild.suffix";
    }
    v21 = @"segment.base.secondchild.prefix";
    if (v15) {
      v21 = @"segment.range.secondchild.prefix";
    }
    v46 = v21;
    v22 = @"segment.base.secondchild.suffix";
    if (v15) {
      v22 = @"segment.range.secondchild.suffix";
    }
    v50 = v22;
    v23 = v20;
    v24 = v14;
    v25 = v19;
    v26 = [v10 indexPathByAddingIndex:v11];
    v48 = v24;
    v27 = [v24 speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v26 localizablePrefix:v25 localizableSuffix:v23];

    unint64_t v28 = v11 + 1;
    *a6 = v11 + 1;
    v49 = v18;
    v29 = [v18 objectAtIndex:v11 + 1];
    v30 = v46;
    v31 = v50;
    id v51 = v10;
    v32 = [v10 indexPathByAddingIndex:v28];
    v47 = v30;
    v45 = v31;
    v33 = [v29 speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v32 localizablePrefix:v30 localizableSuffix:v31];

    v17 = [MEMORY[0x263EFF980] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v34 = [(SCRCMathExpression *)v44 localizedSegmentOrderingForKey:@"RangeAndExpressionAfterRange"];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v54 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          char v40 = [v39 isEqualToString:@"range"];
          v41 = v27;
          if ((v40 & 1) == 0)
          {
            int v42 = [v39 isEqualToString:@"expression after range"];
            v41 = v33;
            if (!v42) {
              continue;
            }
          }
          [v17 addObjectsFromArray:v41];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v36);
    }

    v12 = v49;
    id v10 = v51;
    v14 = v48;
  }

  return v17;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  uint64_t v4 = a4;
  unint64_t v6 = [(SCRCMathArrayExpression *)self children];
  unint64_t v7 = [v6 count];
  unint64_t v28 = self;
  v8 = [(SCRCMathRowExpression *)self _indexesOfCharactersInWords];
  id v29 = [MEMORY[0x263F089B8] scrcString];
  if (v7)
  {
    unint64_t v9 = 0;
    unint64_t v10 = v7 - 1;
    unsigned int v27 = v4;
    unint64_t v25 = v7 - 1;
    v26 = v6;
    do
    {
      unint64_t v11 = [v6 objectAtIndex:v9];
      v12 = objc_msgSend(v11, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:isPartOfWord:", a3, v4, objc_msgSend(v8, "containsIndex:", v9));
      int v13 = [v11 isRangeSubSuperscript];
      if ((v13 | [v11 isBaseSubSuperscript]) == 1 && v9 < v10)
      {
        v14 = [v6 objectAtIndex:++v9];
        objc_msgSend(v14, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:isPartOfWord:", a3, v4, objc_msgSend(v8, "containsIndex:", v9));
        int v15 = v8;
        v17 = unint64_t v16 = v7;
        v18 = (void *)MEMORY[0x263F086A0];
        if (v13) {
          v19 = @"range.sub.superscript.with.next.child.formatter";
        }
        else {
          v19 = @"base.sub.superscript.with.next.child.formatter";
        }
        v20 = [(SCRCMathExpression *)v28 localizedStringForKey:v19];
        uint64_t v21 = objc_msgSend(v18, "scrcStringWithFormat:", v20, v12, v17);

        unint64_t v7 = v16;
        v8 = v15;

        v12 = (void *)v21;
        unint64_t v10 = v25;
        unint64_t v6 = v26;
        uint64_t v4 = v27;
      }
      if ([v12 length])
      {
        [v29 appendAttributedString:v12];
        if (v9 < v10 && ([v8 containsIndex:v9] & 1) == 0)
        {
          if (v4 && [v12 scrcContainsPause])
          {
            uint64_t v22 = [MEMORY[0x263F086A0] scrcPauseString];
          }
          else
          {
            uint64_t v22 = [MEMORY[0x263F086A0] scrcSpaceString];
          }
          v23 = (void *)v22;
          [v29 appendAttributedString:v22];
        }
      }

      ++v9;
    }
    while (v9 < v7);
  }

  return v29;
}

- (void)_addSpacingAndChild:(id)a3 toResult:(id)a4 nextChild:(id)a5 previousChild:(id)a6 numberOfOuterRadicals:(unint64_t)a7 treePosition:(id)a8
{
  id v38 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  if (([v38 isFunctionName] & 1) == 0 && !objc_msgSend(v38, "isWordOrAbbreviation"))
  {
    if ([v38 isEllipsis])
    {
      char v20 = [v15 isOperationSymbol];
      int v19 = [v14 isOperationSymbol];
      if ((v20 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (!v15)
  {
    if (v14)
    {
      int v19 = [v14 beginsWithSpace] ^ 1;
      goto LABEL_15;
    }
LABEL_12:
    int v19 = 0;
    goto LABEL_15;
  }
  char v17 = [v15 endsWithSpace];
  char v18 = v17;
  if (v14)
  {
    int v19 = [v14 beginsWithSpace] ^ 1;
    if (v18) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  int v19 = 0;
  if ((v17 & 1) == 0)
  {
LABEL_14:
    uint64_t v21 = (void *)MEMORY[0x263F086A0];
    uint64_t v22 = [v16 indexPathByRemovingLastIndex];
    v23 = [v21 scrcStringWithString:@" " treePosition:v22];
    [v13 appendAttributedString:v23];
  }
LABEL_15:
  if ([v15 isNumber] && objc_msgSend(v38, "isSimpleNumericalFraction"))
  {
    uint64_t v24 = [v38 dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:v16];
    goto LABEL_37;
  }
  if ([v38 isFenceDelimiter] && (objc_msgSend(v14, "isMultiRowTable") & 1) != 0
    || [v15 isMultiRowTable] && (objc_msgSend(v38, "isFenceDelimiter") & 1) != 0)
  {
LABEL_31:
    if (!v19) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (![v38 isMultiRowTable])
  {
    uint64_t v24 = [v38 dollarCodeDescriptionWithNumberOfOuterRadicals:a7 treePosition:v16];
LABEL_37:
    v33 = (void *)v24;
    if (v24) {
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if ([v15 isFenceDelimiter]) {
    unint64_t v25 = v15;
  }
  else {
    unint64_t v25 = 0;
  }
  id v37 = v25;
  if ([v14 isFenceDelimiter]) {
    v26 = v14;
  }
  else {
    v26 = 0;
  }
  id v27 = v26;
  uint64_t v28 = objc_msgSend(v16, "indexAtPosition:", objc_msgSend(v16, "length") - 1);
  id v29 = [v16 indexPathByRemovingLastIndex];
  v30 = [v29 indexPathByAddingIndex:v28 - 1];

  v31 = [v16 indexPathByRemovingLastIndex];
  v32 = [v31 indexPathByAddingIndex:v28 + 1];

  v33 = [v38 dollarCodeDescriptionWithNumberOfOuterRadicals:a7 treePosition:v16 openOperator:v37 openOperatorTreePosition:v30 closeOperator:v27 closeOperatorTreePosition:v32];

  if (!v33)
  {
LABEL_30:
    NSLog(&cfstr_AxVoiceoverMat_0.isa, v38);
    goto LABEL_31;
  }
LABEL_38:
  [v13 appendAttributedString:v33];

  if (v19)
  {
LABEL_32:
    v34 = (void *)MEMORY[0x263F086A0];
    uint64_t v35 = [v16 indexPathByRemovingLastIndex];
    uint64_t v36 = [v34 scrcStringWithString:@" " treePosition:v35];
    [v13 appendAttributedString:v36];
  }
LABEL_33:
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  unint64_t v18 = a3;
  id v19 = a4;
  uint64_t v5 = [MEMORY[0x263F089B8] scrcString];
  unint64_t v6 = [(SCRCMathArrayExpression *)self children];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [(SCRCMathArrayExpression *)self children];
    unint64_t v9 = [v8 objectAtIndex:0];

    unint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      if (v10 >= v7 - 1)
      {
        id v14 = 0;
        unint64_t v13 = v10 + 1;
      }
      else
      {
        v12 = [(SCRCMathArrayExpression *)self children];
        unint64_t v13 = v10 + 1;
        id v14 = [v12 objectAtIndex:v10 + 1];
      }
      id v15 = objc_msgSend(v19, "indexPathByAddingIndex:", v10, v18);
      [(SCRCMathRowExpression *)self _addSpacingAndChild:v9 toResult:v5 nextChild:v14 previousChild:v11 numberOfOuterRadicals:v18 treePosition:v15];

      id v16 = v9;
      unint64_t v10 = v13;
      unint64_t v9 = v14;
      unint64_t v11 = v16;
    }
    while (v13 != v7);
  }
  return v5;
}

- (id)mathMLTag
{
  return @"mrow";
}

- (id)speakableSummary
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  char v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v4)
  {
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v22;
  int v8 = 1;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      int v10 = v8;
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(v3);
      }
      unint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      int v8 = [v11 isTermSeparator];
      if ((v8 & 1) == 0 && ((v10 ^ 1) & 1) == 0) {
        v6 += [v11 isTermSeparator] ^ 1;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v5);

  if (v6 >= 4)
  {
    v12 = NSString;
    char v3 = [(SCRCMathExpression *)self localizedStringForKey:@"row.summary.formatter"];
    unint64_t v13 = [NSNumber numberWithUnsignedInteger:v6];
    id v14 = [(SCRCMathExpression *)self localizedStringForNumber:v13];
    uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v3, v14);

LABEL_14:
    goto LABEL_16;
  }
  uint64_t v15 = 0;
LABEL_16:
  v20.receiver = self;
  v20.super_class = (Class)SCRCMathRowExpression;
  uint64_t v16 = [(SCRCMathExpression *)&v20 speakableSummary];
  if (!(v15 | v16))
  {
    unint64_t v18 = 0;
    goto LABEL_23;
  }
  char v17 = [MEMORY[0x263F089D8] string];
  unint64_t v18 = v17;
  if (v15)
  {
    [v17 appendString:v15];
    if (!v16) {
      goto LABEL_23;
    }
    [v18 appendString:@", "];
  }
  else if (!v16)
  {
    goto LABEL_23;
  }
  [v18 appendString:v16];
LABEL_23:

  return v18;
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(SCRCMathArrayExpression *)self children];
  if (![v4 count])
  {
    uint64_t v5 = 0;
    goto LABEL_25;
  }
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {

    goto LABEL_25;
  }
  uint64_t v8 = v7;
  char v17 = v4;
  int v9 = 0;
  uint64_t v10 = *(void *)v19;
  char v11 = 1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      unint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      id v14 = [v13 latexDescriptionInMathMode:1];
      if (v14)
      {
        if (!a3)
        {
          if (v9 & 1 | (([v13 canBeWrappedInLatexMathIndicators] & 1) == 0))
          {
            if ([v13 canBeWrappedInLatexMathIndicators]) {
              goto LABEL_15;
            }
            int v15 = v9 ^ 1;
            if ((v9 ^ 1)) {
              goto LABEL_15;
            }
          }
          else
          {
            int v15 = v9 ^ 1;
          }
          [v5 appendString:@"$"];
          int v9 = v15;
        }
LABEL_15:
        if ((v11 & 1) == 0) {
          [v5 appendString:@" "];
        }
        [v5 appendString:v14];
        char v11 = 0;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v8);

  if (v9) {
    [v5 appendString:@"$"];
  }
  uint64_t v4 = v17;
LABEL_25:

  return v5;
}

@end