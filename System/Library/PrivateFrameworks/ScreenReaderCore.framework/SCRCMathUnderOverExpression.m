@interface SCRCMathUnderOverExpression
- (BOOL)isRangeSubSuperscript;
- (SCRCMathExpression)base;
- (SCRCMathExpression)over;
- (SCRCMathExpression)under;
- (SCRCMathUnderOverExpression)initWithDictionary:(id)a3;
- (id)description;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexMathModeDescription;
- (id)mathMLString;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)subExpressions;
- (void)setBase:(id)a3;
- (void)setOver:(id)a3;
- (void)setUnder:(id)a3;
@end

@implementation SCRCMathUnderOverExpression

- (SCRCMathUnderOverExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRCMathUnderOverExpression;
  v5 = [(SCRCMathExpression *)&v13 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMUnderObject"];
    v7 = +[SCRCMathExpression mathExpressionWithDictionary:v6];
    [(SCRCMathUnderOverExpression *)v5 setUnder:v7];

    v8 = [v4 objectForKey:@"AXMOverObject"];
    v9 = +[SCRCMathExpression mathExpressionWithDictionary:v8];
    [(SCRCMathUnderOverExpression *)v5 setOver:v9];

    v10 = [v4 objectForKey:@"AXMBaseObject"];
    v11 = +[SCRCMathExpression mathExpressionWithDictionary:v10];
    [(SCRCMathUnderOverExpression *)v5 setBase:v11];
  }
  return v5;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)SCRCMathUnderOverExpression;
  v3 = [(SCRCMathUnderOverExpression *)&v9 description];
  id v4 = [(SCRCMathUnderOverExpression *)self under];
  v5 = [(SCRCMathUnderOverExpression *)self over];
  v6 = [(SCRCMathUnderOverExpression *)self base];
  v7 = [v3 stringByAppendingFormat:@" - under %@, over %@, base %@", v4, v5, v6];

  return v7;
}

- (id)subExpressions
{
  v3 = [(SCRCMathUnderOverExpression *)self base];
  id v4 = [(SCRCMathUnderOverExpression *)self under];
  v5 = [(SCRCMathUnderOverExpression *)self over];
  v6 = [(SCRCMathExpression *)self arrayWithoutNilsFromFirstChild:v3 secondChild:v4 thirdChild:v5];

  return v6;
}

- (BOOL)isRangeSubSuperscript
{
  v3 = [(SCRCMathUnderOverExpression *)self base];
  if (v3 && ([(SCRCMathUnderOverExpression *)self over], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = [(SCRCMathUnderOverExpression *)self under];

    if (v6) {
      LOBYTE(v6) = [v3 canBeUsedWithRange];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(SCRCMathUnderOverExpression *)self base];
  v8 = [v7 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];

  objc_super v9 = [(SCRCMathUnderOverExpression *)self under];
  v10 = [v9 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];

  v11 = [(SCRCMathUnderOverExpression *)self over];
  v12 = [v11 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];

  if (![v8 length])
  {
    uint64_t v13 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"empty.content"];

    v8 = (void *)v13;
  }
  if ([(SCRCMathUnderOverExpression *)self isRangeSubSuperscript])
  {
    v14 = (void *)MEMORY[0x263F086A0];
    v15 = [(SCRCMathExpression *)self localizedStringForKey:@"range.sub.superscript.formatter"];
    v20 = v12;
LABEL_5:
    objc_msgSend(v14, "scrcStringWithFormat:", v15, v8, v10, v20);
LABEL_17:
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if ([v12 length] && !objc_msgSend(v10, "length"))
  {
    v16 = (void *)MEMORY[0x263F086A0];
    v15 = [(SCRCMathExpression *)self localizedStringForKey:@"generic.over.formula.formatter"];
    goto LABEL_16;
  }
  if (![v12 length] && objc_msgSend(v10, "length"))
  {
    v14 = (void *)MEMORY[0x263F086A0];
    v15 = [(SCRCMathExpression *)self localizedStringForKey:@"generic.under.formula.formatter"];
    goto LABEL_5;
  }
  if ([v12 length] && objc_msgSend(v10, "length"))
  {
    v16 = (void *)MEMORY[0x263F086A0];
    v15 = [(SCRCMathExpression *)self localizedStringForKey:@"generic.over.under.formula.formatter"];
    v20 = v10;
LABEL_16:
    objc_msgSend(v16, "scrcStringWithFormat:", v15, v12, v8, v20);
    goto LABEL_17;
  }
  id v17 = v8;
LABEL_18:
  id v18 = v17;

  return v18;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v44 = a5;
  if (a4)
  {
    unint64_t v8 = a4 - 1;
    if (a4 == 1)
    {
      v53.receiver = self;
      v53.super_class = (Class)SCRCMathUnderOverExpression;
      a4 = [(SCRCMathExpression *)&v53 speakableSegmentsWithSpeakingStyle:a3 upToDepth:1 treePosition:v44];
      goto LABEL_40;
    }
    a4 = [MEMORY[0x263EFF980] array];
    if ([(SCRCMathUnderOverExpression *)self isRangeSubSuperscript])
    {
      long long v51 = 0uLL;
      long long v52 = 0uLL;
      long long v49 = 0uLL;
      long long v50 = 0uLL;
      id obj = [(SCRCMathExpression *)self localizedSegmentOrderingForKey:@"RangeSubSuperscript"];
      uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (!v9) {
        goto LABEL_39;
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v50;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ([v13 isEqualToString:@"base"])
          {
            v14 = [(SCRCMathUnderOverExpression *)self base];
            v15 = [v44 indexPathByAddingIndex:0];
            uint64_t v16 = [v14 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v8 treePosition:v15];
          }
          else
          {
            if ([v13 isEqualToString:@"subscript"])
            {
              v14 = [(SCRCMathUnderOverExpression *)self under];
              v15 = [v44 indexPathByAddingIndex:2];
              id v17 = v14;
              int64_t v18 = a3;
              unint64_t v19 = v8;
              v20 = v15;
              v21 = @"segment.range.subscript.prefix";
              v22 = @"segment.range.subscript.suffix";
            }
            else
            {
              if (![v13 isEqualToString:@"superscript"]) {
                continue;
              }
              v14 = [(SCRCMathUnderOverExpression *)self over];
              v15 = [v44 indexPathByAddingIndex:1];
              id v17 = v14;
              int64_t v18 = a3;
              unint64_t v19 = v8;
              v20 = v15;
              v21 = @"segment.range.superscript.prefix";
              v22 = @"segment.range.superscript.suffix";
            }
            uint64_t v16 = [v17 speakableSegmentsWithSpeakingStyle:v18 upToDepth:v19 treePosition:v20 localizablePrefix:v21 localizableSuffix:v22];
          }
          v23 = (void *)v16;
          [(id)a4 addObjectsFromArray:v16];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (!v10)
        {
LABEL_39:

          goto LABEL_40;
        }
      }
    }
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    id obj = [(SCRCMathExpression *)self localizedSegmentOrderingForKey:@"UnderOver"];
    uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (!v24) {
      goto LABEL_39;
    }
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v46;
LABEL_23:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v46 != v26) {
        objc_enumerationMutation(obj);
      }
      v28 = *(void **)(*((void *)&v45 + 1) + 8 * v27);
      if ([v28 isEqualToString:@"over"])
      {
        v29 = [(SCRCMathUnderOverExpression *)self over];

        if (v29) {
          break;
        }
      }
      if (![v28 isEqualToString:@"base"]
        || ([(SCRCMathUnderOverExpression *)self base],
            v38 = objc_claimAutoreleasedReturnValue(),
            v38,
            !v38))
      {
        if (![v28 isEqualToString:@"under"]) {
          goto LABEL_37;
        }
        v40 = [(SCRCMathUnderOverExpression *)self under];

        if (!v40) {
          goto LABEL_37;
        }
        v30 = [(SCRCMathUnderOverExpression *)self under];
        v31 = [v44 indexPathByAddingIndex:2];
        v32 = v30;
        int64_t v33 = a3;
        unint64_t v34 = v8;
        v35 = v31;
        v36 = @"segment.under.prefix";
        v37 = @"segment.under.suffix";
        goto LABEL_35;
      }
      v30 = [(SCRCMathUnderOverExpression *)self base];
      v31 = [v44 indexPathByAddingIndex:0];
      uint64_t v39 = [v30 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v8 treePosition:v31];
LABEL_36:
      v41 = (void *)v39;
      [(id)a4 addObjectsFromArray:v39];

LABEL_37:
      if (v25 == ++v27)
      {
        uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (!v25) {
          goto LABEL_39;
        }
        goto LABEL_23;
      }
    }
    v30 = [(SCRCMathUnderOverExpression *)self over];
    v31 = [v44 indexPathByAddingIndex:1];
    v32 = v30;
    int64_t v33 = a3;
    unint64_t v34 = v8;
    v35 = v31;
    v36 = @"segment.over.prefix";
    v37 = @"segment.over.suffix";
LABEL_35:
    uint64_t v39 = [v32 speakableSegmentsWithSpeakingStyle:v33 upToDepth:v34 treePosition:v35 localizablePrefix:v36 localizableSuffix:v37];
    goto LABEL_36;
  }
LABEL_40:

  return (id)a4;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6 = a4;
  v7 = [v6 indexPathByAddingIndex:0];
  unint64_t v8 = [(SCRCMathUnderOverExpression *)self base];

  if (v8)
  {
    uint64_t v9 = [(SCRCMathUnderOverExpression *)self base];
    uint64_t v10 = [v9 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v7];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F086A0] scrcStringWithString:&stru_26CC25790 treePosition:v7];
  }
  uint64_t v11 = [(SCRCMathUnderOverExpression *)self over];
  if (v11)
  {
  }
  else
  {
    v12 = [(SCRCMathUnderOverExpression *)self under];

    if (!v12)
    {
      id v13 = v10;
      goto LABEL_12;
    }
  }
  id v13 = [MEMORY[0x263F089B8] scrcString];
  v14 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"e" treePosition:v6];
  [v13 appendAttributedString:v14];

  [v13 appendAttributedString:v10];
  v15 = [(SCRCMathUnderOverExpression *)self under];

  if (v15)
  {
    uint64_t v16 = [v6 indexPathByAddingIndex:2];
    id v17 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"us" treePosition:v16];
    [(SCRCMathUnderOverExpression *)self under];
    int64_t v18 = v32 = v7;
    [v18 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v16];
    id v19 = v6;
    v20 = v10;
    v22 = unint64_t v21 = a3;
    v23 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"ue" treePosition:v16];
    [v13 scrcAppendFormat:@"%@%@%@", v17, v22, v23];

    a3 = v21;
    uint64_t v10 = v20;
    id v6 = v19;

    v7 = v32;
  }
  uint64_t v24 = [(SCRCMathUnderOverExpression *)self over];

  if (v24)
  {
    uint64_t v25 = [v6 indexPathByAddingIndex:1];
    uint64_t v26 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"os" treePosition:v25];
    uint64_t v27 = [(SCRCMathUnderOverExpression *)self over];
    v28 = [v27 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v25];
    v29 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"oe" treePosition:v25];
    [v13 scrcAppendFormat:@"%@%@%@", v26, v28, v29];
  }
LABEL_12:
  id v30 = v13;

  return v30;
}

- (id)mathMLString
{
  uint64_t v3 = [(SCRCMathUnderOverExpression *)self under];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    v5 = [(SCRCMathUnderOverExpression *)self over];

    if (v5)
    {
      id v6 = NSString;
      v7 = [(SCRCMathUnderOverExpression *)self base];
      unint64_t v8 = [v7 mathMLString];
      uint64_t v9 = [(SCRCMathUnderOverExpression *)self under];
      uint64_t v10 = [v9 mathMLString];
      uint64_t v11 = [(SCRCMathUnderOverExpression *)self over];
      v12 = [v11 mathMLString];
      id v13 = [v6 stringWithFormat:@"%@%@%@", v8, v10, v12];
      v14 = [v13 stringWrappedInMathMLTag:@"munderover"];

LABEL_9:
      goto LABEL_10;
    }
  }
  v15 = [(SCRCMathUnderOverExpression *)self under];

  if (v15)
  {
    uint64_t v16 = NSString;
    v7 = [(SCRCMathUnderOverExpression *)self base];
    unint64_t v8 = [v7 mathMLString];
    uint64_t v9 = [(SCRCMathUnderOverExpression *)self under];
    uint64_t v10 = [v9 mathMLString];
    id v17 = [v16 stringWithFormat:@"%@%@", v8, v10];
    uint64_t v11 = v17;
    int64_t v18 = @"munder";
LABEL_8:
    v14 = [v17 stringWrappedInMathMLTag:v18];
    goto LABEL_9;
  }
  id v19 = [(SCRCMathUnderOverExpression *)self over];

  if (v19)
  {
    v20 = NSString;
    v7 = [(SCRCMathUnderOverExpression *)self base];
    unint64_t v8 = [v7 mathMLString];
    uint64_t v9 = [(SCRCMathUnderOverExpression *)self over];
    uint64_t v10 = [v9 mathMLString];
    id v17 = [v20 stringWithFormat:@"%@%@", v8, v10];
    uint64_t v11 = v17;
    int64_t v18 = @"mover";
    goto LABEL_8;
  }
  v14 = &stru_26CC25790;
LABEL_10:
  return v14;
}

- (id)latexMathModeDescription
{
  uint64_t v3 = [(SCRCMathExpression *)self->_base latexDescriptionInMathMode:1];
  over = self->_over;
  if (self->_under)
  {
    if (over) {
      goto LABEL_8;
    }
    uint64_t v5 = [0 latexFormatStringAsUnder];
  }
  else
  {
    uint64_t v5 = [(SCRCMathExpression *)over latexFormatStringAsOver];
  }
  id v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", v5, v3);

    uint64_t v3 = (void *)v7;
  }

LABEL_8:
  return v3;
}

- (SCRCMathExpression)under
{
  return self->_under;
}

- (void)setUnder:(id)a3
{
}

- (SCRCMathExpression)over
{
  return self->_over;
}

- (void)setOver:(id)a3
{
}

- (SCRCMathExpression)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_over, 0);
  objc_storeStrong((id *)&self->_under, 0);
}

@end