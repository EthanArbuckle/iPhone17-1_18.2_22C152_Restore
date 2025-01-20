@interface SCRCMathSubSuperscriptExpression
- (BOOL)isBaseSubSuperscript;
- (BOOL)isNumber;
- (BOOL)isRangeSubSuperscript;
- (SCRCMathExpression)base;
- (SCRCMathExpression)subscript;
- (SCRCMathExpression)superscript;
- (SCRCMathSubSuperscriptExpression)initWithDictionary:(id)a3;
- (id)_stringToAddForSuperscript:(id)a3 withPriorDescription:(id)a4 updatedDescription:(id *)a5;
- (id)description;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexMathModeDescription;
- (id)mathMLString;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)subExpressions;
- (unint64_t)fractionLevel;
- (void)setBase:(id)a3;
- (void)setSubscript:(id)a3;
- (void)setSuperscript:(id)a3;
@end

@implementation SCRCMathSubSuperscriptExpression

- (SCRCMathSubSuperscriptExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRCMathSubSuperscriptExpression;
  v5 = [(SCRCMathExpression *)&v13 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMBaseObject"];
    v7 = +[SCRCMathExpression mathExpressionWithDictionary:v6];
    [(SCRCMathSubSuperscriptExpression *)v5 setBase:v7];

    v8 = [v4 objectForKey:@"AXMSubscriptObject"];
    v9 = +[SCRCMathExpression mathExpressionWithDictionary:v8];
    [(SCRCMathSubSuperscriptExpression *)v5 setSubscript:v9];

    v10 = [v4 objectForKey:@"AXMSuperscriptObject"];
    v11 = +[SCRCMathExpression mathExpressionWithDictionary:v10];
    [(SCRCMathSubSuperscriptExpression *)v5 setSuperscript:v11];
  }
  return v5;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)SCRCMathSubSuperscriptExpression;
  v3 = [(SCRCMathSubSuperscriptExpression *)&v9 description];
  id v4 = [(SCRCMathSubSuperscriptExpression *)self base];
  v5 = [(SCRCMathSubSuperscriptExpression *)self subscript];
  v6 = [(SCRCMathSubSuperscriptExpression *)self superscript];
  v7 = [v3 stringByAppendingFormat:@" - base %@, subscript %@, superscript %@", v4, v5, v6];

  return v7;
}

- (BOOL)isRangeSubSuperscript
{
  v3 = [(SCRCMathSubSuperscriptExpression *)self base];
  if (v3
    && ([(SCRCMathSubSuperscriptExpression *)self subscript], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = [(SCRCMathSubSuperscriptExpression *)self superscript];

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

- (BOOL)isBaseSubSuperscript
{
  uint64_t v3 = [(SCRCMathSubSuperscriptExpression *)self base];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = [(SCRCMathSubSuperscriptExpression *)self subscript];
  if (!v5)
  {
    char v8 = 0;
LABEL_7:

    return v8;
  }
  v6 = (void *)v5;
  v7 = [(SCRCMathSubSuperscriptExpression *)self superscript];

  if (!v7)
  {
    uint64_t v4 = [(SCRCMathSubSuperscriptExpression *)self base];
    char v8 = [v4 canBeUsedWithBase];
    goto LABEL_7;
  }
  return 0;
}

- (BOOL)isNumber
{
  if ([(SCRCMathExpression *)self isNumberOverride]) {
    return 1;
  }
  uint64_t v4 = [(SCRCMathSubSuperscriptExpression *)self base];
  char v5 = [v4 isNumber];

  return v5;
}

- (unint64_t)fractionLevel
{
  v2 = [(SCRCMathSubSuperscriptExpression *)self base];
  unint64_t v3 = [v2 fractionLevel];

  return v3;
}

- (id)subExpressions
{
  unint64_t v3 = [(SCRCMathSubSuperscriptExpression *)self base];
  uint64_t v4 = [(SCRCMathSubSuperscriptExpression *)self subscript];
  char v5 = [(SCRCMathSubSuperscriptExpression *)self superscript];
  v6 = [(SCRCMathExpression *)self arrayWithoutNilsFromFirstChild:v3 secondChild:v4 thirdChild:v5];

  return v6;
}

- (id)_stringToAddForSuperscript:(id)a3 withPriorDescription:(id)a4 updatedDescription:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 length])
  {
    id v20 = 0;
    goto LABEL_21;
  }
  v10 = [(SCRCMathSubSuperscriptExpression *)self superscript];
  int v11 = [v10 isNumber];

  v12 = [(SCRCMathSubSuperscriptExpression *)self superscript];
  objc_super v13 = v12;
  if (v11)
  {
    int v14 = [v12 isInteger];

    if (v14)
    {
      v15 = [(SCRCMathSubSuperscriptExpression *)self superscript];
      uint64_t v16 = [v15 integerValue];

      if (v16 == 2)
      {
        int v17 = [v9 scrcContainsPause];
        v18 = @"superscript.squared.formatter";
        v19 = @"superscript.squared.with.long.base.formatter";
LABEL_12:
        if (v17) {
          v27 = v19;
        }
        else {
          v27 = v18;
        }
        v28 = (void *)MEMORY[0x263F086A0];
        v29 = [(SCRCMathExpression *)self localizedStringForKey:v27];
LABEL_20:
        uint64_t v31 = objc_msgSend(v28, "scrcStringWithFormat:", v29, v9, v33);

        id v20 = 0;
        id v9 = (id)v31;
        goto LABEL_21;
      }
      v25 = [(SCRCMathSubSuperscriptExpression *)self superscript];
      uint64_t v26 = [v25 integerValue];

      if (v26 == 3)
      {
        int v17 = [v9 scrcContainsPause];
        v18 = @"superscript.cubed.formatter";
        v19 = @"superscript.cubed.with.long.base.formatter";
        goto LABEL_12;
      }
    }
    if ([v9 scrcContainsPause]) {
      v30 = @"raised.to.power.with.long.base.formatter";
    }
    else {
      v30 = @"raised.to.power.formatter";
    }
    v28 = (void *)MEMORY[0x263F086A0];
    v29 = [(SCRCMathExpression *)self localizedStringForKey:v30];
    id v33 = v8;
    goto LABEL_20;
  }
  int v21 = [v12 isNaturalSuperscript];

  if (v21)
  {
    id v20 = v8;
  }
  else
  {
    v22 = (void *)MEMORY[0x263F086A0];
    v23 = [(SCRCMathExpression *)self localizedStringForKey:@"generic.superscript.formatter"];
    v24 = objc_msgSend(v22, "scrcStringWithFormat:", v23, v8);

    id v20 = [v24 scrcStringByAddingAttribute:@"kSCRCMathStringAttributeSpeakWithPitchInflection" value:&unk_26CC2D520];
  }
LABEL_21:
  if (a5) {
    *a5 = v9;
  }

  return v20;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  BOOL v7 = [(SCRCMathSubSuperscriptExpression *)self isRangeSubSuperscript];
  int v8 = v7 | [(SCRCMathSubSuperscriptExpression *)self isBaseSubSuperscript];
  BOOL v41 = v4;
  uint64_t v9 = v4 & (v8 ^ 1u);
  v10 = [(SCRCMathSubSuperscriptExpression *)self base];
  int v11 = [v10 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v9];

  if (![v11 length])
  {
    uint64_t v12 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"empty.content"];

    int v11 = (void *)v12;
  }
  objc_super v13 = [(SCRCMathSubSuperscriptExpression *)self subscript];
  int v14 = [v13 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v9];

  v15 = [(SCRCMathSubSuperscriptExpression *)self superscript];
  uint64_t v16 = [v15 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v9];

  if (v8)
  {
    if (v7) {
      int v17 = @"range.sub.superscript.formatter";
    }
    else {
      int v17 = @"base.sub.superscript.formatter";
    }
    v18 = (void *)MEMORY[0x263F086A0];
    v19 = [(SCRCMathExpression *)self localizedStringForKey:v17];
    id v20 = objc_msgSend(v18, "scrcStringWithFormat:", v19, v11, v14, v16);
  }
  else
  {
    v38 = v16;
    v39 = v14;
    int v21 = [(SCRCMathExpression *)self localizedSegmentOrderingForKey:@"SubSuperscript"];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v40 = self;
      id v20 = 0;
      uint64_t v24 = *(void *)v44;
      char v25 = 1;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v44 != v24) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v27 isEqualToString:@"base"])
          {
            id v28 = v11;
          }
          else if ([v27 isEqualToString:@"subscript"])
          {
            if ([v39 length])
            {
              v29 = (void *)MEMORY[0x263F086A0];
              v30 = [(SCRCMathExpression *)v40 localizedStringForKey:@"generic.subscript.formatter"];
              uint64_t v31 = objc_msgSend(v29, "scrcStringWithFormat:", v30, v39);

              id v28 = [v31 scrcStringByAddingAttribute:@"kSCRCMathStringAttributeSpeakWithPitchInflection" value:&unk_26CC2D538];
            }
            else
            {
              id v28 = 0;
            }
          }
          else if ([v27 isEqualToString:@"superscript"])
          {
            id v42 = v20;
            id v28 = [(SCRCMathSubSuperscriptExpression *)v40 _stringToAddForSuperscript:v38 withPriorDescription:v20 updatedDescription:&v42];
            id v32 = v42;

            id v20 = v32;
          }
          else
          {
            NSLog(&cfstr_AxVoiceoverMat_1.isa, v27);
            id v28 = 0;
          }
          if ([v28 length])
          {
            if (v25)
            {
              id v33 = v28;
            }
            else
            {
              if (v41) {
                [MEMORY[0x263F086A0] scrcPauseString];
              }
              else {
              v34 = [MEMORY[0x263F086A0] scrcSpaceString];
              }
              v35 = [v20 scrcStringByAppendingAttributedString:v34];

              id v33 = [v35 scrcStringByAppendingAttributedString:v28];
              id v20 = v35;
            }

            char v25 = 0;
            id v20 = v33;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v23);
    }
    else
    {
      id v20 = 0;
    }

    int v14 = v39;
    uint64_t v16 = v38;
  }
  id v36 = v20;

  return v36;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (a4)
  {
    unint64_t v9 = a4 - 1;
    if (a4 == 1)
    {
      v93.receiver = self;
      v93.super_class = (Class)SCRCMathSubSuperscriptExpression;
      v10 = [(SCRCMathExpression *)&v93 speakableSegmentsWithSpeakingStyle:a3 upToDepth:1 treePosition:v8];
      goto LABEL_72;
    }
    v10 = [MEMORY[0x263EFF980] array];
    BOOL v11 = [(SCRCMathSubSuperscriptExpression *)self isRangeSubSuperscript];
    BOOL v12 = [(SCRCMathSubSuperscriptExpression *)self isBaseSubSuperscript];
    objc_super v13 = @"SubSuperscript";
    if (v12) {
      objc_super v13 = @"BaseSubSuperscript";
    }
    BOOL v69 = v11;
    if (v11) {
      int v14 = @"RangeSubSuperscript";
    }
    else {
      int v14 = v13;
    }
    [(SCRCMathExpression *)self localizedSegmentOrderingForKey:v14];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v79 = [obj countByEnumeratingWithState:&v89 objects:v98 count:16];
    if (v79)
    {
      BOOL v15 = v11 || v12;
      uint64_t v16 = @"segment.subscript.prefix";
      uint64_t v78 = *(void *)v90;
      int v17 = @"segment.subscript.suffix";
      if (v12)
      {
        uint64_t v16 = @"segment.base.subscript.prefix";
        int v17 = @"segment.base.subscript.suffix";
      }
      if (v11) {
        v18 = @"segment.range.subscript.prefix";
      }
      else {
        v18 = v16;
      }
      if (v11) {
        int v17 = @"segment.range.subscript.suffix";
      }
      v70 = v17;
      v71 = v18;
      int64_t v72 = a3;
      v73 = self;
      unint64_t v74 = v9;
      id v75 = v8;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v90 != v78) {
            objc_enumerationMutation(obj);
          }
          uint64_t v80 = v19;
          id v20 = *(void **)(*((void *)&v89 + 1) + 8 * v19);
          if ([v20 isEqualToString:@"base"])
          {
            int v21 = [(SCRCMathSubSuperscriptExpression *)self base];

            if (v21)
            {
              uint64_t v22 = [(SCRCMathSubSuperscriptExpression *)self base];
              uint64_t v23 = [v8 indexPathByAddingIndex:0];
              id v24 = [v22 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v9 treePosition:v23];
              [v10 addObjectsFromArray:v24];
LABEL_68:

              goto LABEL_69;
            }
          }
          if ([v20 isEqualToString:@"subscript"])
          {
            char v25 = [(SCRCMathSubSuperscriptExpression *)self subscript];

            if (v25)
            {
              uint64_t v26 = [v8 indexPathByAddingIndex:1];
              v27 = [(SCRCMathSubSuperscriptExpression *)self subscript];
              id v28 = (void *)v26;
              v29 = [v27 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v9 treePosition:v26 localizablePrefix:v71 localizableSuffix:v70];

              long long v87 = 0u;
              long long v88 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              id v24 = v29;
              uint64_t v30 = [v24 countByEnumeratingWithState:&v85 objects:v97 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v86;
                do
                {
                  for (uint64_t i = 0; i != v31; ++i)
                  {
                    if (*(void *)v86 != v32) {
                      objc_enumerationMutation(v24);
                    }
                    id v34 = *(id *)(*((void *)&v85 + 1) + 8 * i);
                    v35 = v34;
                    if (!v15)
                    {
                      uint64_t v36 = [v34 scrcStringByAddingAttribute:@"kSCRCMathStringAttributeSpeakWithPitchInflection" value:&unk_26CC2D538];

                      v35 = (void *)v36;
                    }
                    [v10 addObject:v35];
                  }
                  uint64_t v31 = [v24 countByEnumeratingWithState:&v85 objects:v97 count:16];
                }
                while (v31);
                uint64_t v23 = v24;
                a3 = v72;
                self = v73;
                unint64_t v9 = v74;
              }
              else
              {
                uint64_t v23 = v24;
              }
              uint64_t v22 = v28;
              id v8 = v75;
              goto LABEL_68;
            }
          }
          if ([v20 isEqualToString:@"superscript"])
          {
            v37 = [(SCRCMathSubSuperscriptExpression *)self superscript];

            if (v37)
            {
              uint64_t v38 = [v8 indexPathByAddingIndex:2];
              v39 = [(SCRCMathSubSuperscriptExpression *)self superscript];
              v40 = v39;
              v76 = (void *)v38;
              if (v69)
              {
                int64_t v41 = a3;
                unint64_t v42 = v9;
                uint64_t v43 = v38;
                long long v44 = @"segment.range.superscript.prefix";
                long long v45 = @"segment.range.superscript.suffix";
                goto LABEL_54;
              }
              int v46 = [v39 isNumber];

              v47 = [(SCRCMathSubSuperscriptExpression *)self superscript];
              uint64_t v48 = v47;
              if (v46)
              {
                int v49 = [v47 isInteger];

                unint64_t v9 = v74;
                if (!v49) {
                  goto LABEL_53;
                }
                v50 = [(SCRCMathSubSuperscriptExpression *)self superscript];
                uint64_t v51 = [v50 integerValue];

                if (v51 == 2)
                {
                  v40 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"segment.superscript.squared" treePosition:v76];
                  v96 = v40;
                  v52 = (void *)MEMORY[0x263EFF8C0];
                  v53 = &v96;
                  goto LABEL_52;
                }
                v59 = [(SCRCMathSubSuperscriptExpression *)self superscript];
                uint64_t v60 = [v59 integerValue];

                if (v60 == 3)
                {
                  v40 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"segment.superscript.cubed" treePosition:v76];
                  v95 = v40;
                  v52 = (void *)MEMORY[0x263EFF8C0];
                  v53 = &v95;
LABEL_52:
                  uint64_t v56 = [v52 arrayWithObjects:v53 count:1];
                }
                else
                {
LABEL_53:
                  v39 = [(SCRCMathSubSuperscriptExpression *)self superscript];
                  v40 = v39;
                  int64_t v41 = a3;
                  unint64_t v42 = v74;
                  uint64_t v43 = (uint64_t)v76;
                  long long v44 = @"segment.raised.to.power.prefix";
                  long long v45 = @"segment.raised.to.power.suffix";
LABEL_54:
                  uint64_t v56 = [v39 speakableSegmentsWithSpeakingStyle:v41 upToDepth:v42 treePosition:v43 localizablePrefix:v44 localizableSuffix:v45];
                }
LABEL_55:
                v57 = (void *)v56;
                int v58 = 0;
              }
              else
              {
                int v54 = [v47 isNaturalSuperscript];

                v55 = [(SCRCMathSubSuperscriptExpression *)self superscript];
                v40 = v55;
                if (v54)
                {
                  unint64_t v9 = v74;
                  uint64_t v56 = [v55 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v74 treePosition:v76];
                  goto LABEL_55;
                }
                unint64_t v9 = v74;
                v57 = [v55 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v74 treePosition:v76 localizablePrefix:@"segment.superscript.prefix" localizableSuffix:@"segment.superscript.suffix"];
                int v58 = 1;
              }

              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              id v24 = v57;
              uint64_t v61 = [v24 countByEnumeratingWithState:&v81 objects:v94 count:16];
              if (v61)
              {
                uint64_t v62 = v61;
                uint64_t v63 = *(void *)v82;
                do
                {
                  for (uint64_t j = 0; j != v62; ++j)
                  {
                    if (*(void *)v82 != v63) {
                      objc_enumerationMutation(v24);
                    }
                    id v65 = *(id *)(*((void *)&v81 + 1) + 8 * j);
                    v66 = v65;
                    if (v58)
                    {
                      uint64_t v67 = [v65 scrcStringByAddingAttribute:@"kSCRCMathStringAttributeSpeakWithPitchInflection" value:&unk_26CC2D520];

                      v66 = (void *)v67;
                    }
                    [v10 addObject:v66];
                  }
                  uint64_t v62 = [v24 countByEnumeratingWithState:&v81 objects:v94 count:16];
                }
                while (v62);
                uint64_t v23 = v24;
                unint64_t v9 = v74;
                id v8 = v75;
                a3 = v72;
                self = v73;
              }
              else
              {
                uint64_t v23 = v24;
                self = v73;
              }
              uint64_t v22 = v76;
              goto LABEL_68;
            }
          }
LABEL_69:
          uint64_t v19 = v80 + 1;
        }
        while (v80 + 1 != v79);
        uint64_t v79 = [obj countByEnumeratingWithState:&v89 objects:v98 count:16];
      }
      while (v79);
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_72:

  return v10;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6 = a4;
  BOOL v7 = [MEMORY[0x263F089B8] scrcString];
  id v8 = [(SCRCMathSubSuperscriptExpression *)self base];

  if (v8)
  {
    unint64_t v9 = [(SCRCMathSubSuperscriptExpression *)self base];
    v10 = [v6 indexPathByAddingIndex:0];
    BOOL v11 = [v9 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v10];
    [v7 appendAttributedString:v11];
  }
  BOOL v12 = [(SCRCMathSubSuperscriptExpression *)self subscript];

  if (v12)
  {
    objc_super v13 = [v6 indexPathByAddingIndex:1];
    int v14 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"bs" treePosition:v13];
    [v7 appendAttributedString:v14];

    BOOL v15 = [(SCRCMathSubSuperscriptExpression *)self subscript];
    uint64_t v16 = [v15 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v13];
    [v7 appendAttributedString:v16];

    int v17 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"be" treePosition:v13];
    [v7 appendAttributedString:v17];
  }
  v18 = [(SCRCMathSubSuperscriptExpression *)self superscript];

  if (v18)
  {
    uint64_t v19 = [v6 indexPathByAddingIndex:2];
    id v20 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"ps" treePosition:v19];
    [v7 appendAttributedString:v20];

    int v21 = [(SCRCMathSubSuperscriptExpression *)self superscript];
    uint64_t v22 = [v21 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v19];
    [v7 appendAttributedString:v22];

    uint64_t v23 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"pe" treePosition:v19];
    [v7 appendAttributedString:v23];
  }
  return v7;
}

- (id)mathMLString
{
  uint64_t v3 = [(SCRCMathSubSuperscriptExpression *)self subscript];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    char v5 = [(SCRCMathSubSuperscriptExpression *)self superscript];

    if (v5)
    {
      id v6 = NSString;
      BOOL v7 = [(SCRCMathSubSuperscriptExpression *)self base];
      id v8 = [v7 mathMLString];
      unint64_t v9 = [(SCRCMathSubSuperscriptExpression *)self subscript];
      v10 = [v9 mathMLString];
      BOOL v11 = [(SCRCMathSubSuperscriptExpression *)self superscript];
      BOOL v12 = [v11 mathMLString];
      objc_super v13 = [v6 stringWithFormat:@"%@%@%@", v8, v10, v12];
      int v14 = [v13 stringWrappedInMathMLTag:@"msubsup"];

LABEL_9:
      goto LABEL_10;
    }
  }
  BOOL v15 = [(SCRCMathSubSuperscriptExpression *)self subscript];

  if (v15)
  {
    uint64_t v16 = NSString;
    BOOL v7 = [(SCRCMathSubSuperscriptExpression *)self base];
    id v8 = [v7 mathMLString];
    unint64_t v9 = [(SCRCMathSubSuperscriptExpression *)self subscript];
    v10 = [v9 mathMLString];
    int v17 = [v16 stringWithFormat:@"%@%@", v8, v10];
    BOOL v11 = v17;
    v18 = @"msub";
LABEL_8:
    int v14 = [v17 stringWrappedInMathMLTag:v18];
    goto LABEL_9;
  }
  uint64_t v19 = [(SCRCMathSubSuperscriptExpression *)self superscript];

  if (v19)
  {
    id v20 = NSString;
    BOOL v7 = [(SCRCMathSubSuperscriptExpression *)self base];
    id v8 = [v7 mathMLString];
    unint64_t v9 = [(SCRCMathSubSuperscriptExpression *)self superscript];
    v10 = [v9 mathMLString];
    int v17 = [v20 stringWithFormat:@"%@%@", v8, v10];
    BOOL v11 = v17;
    v18 = @"msup";
    goto LABEL_8;
  }
  int v14 = &stru_26CC25790;
LABEL_10:
  return v14;
}

- (id)latexMathModeDescription
{
  uint64_t v3 = [(SCRCMathExpression *)self->_base latexDescriptionInMathMode:1];
  BOOL v4 = (void *)[v3 mutableCopy];

  subscript = self->_subscript;
  if (subscript)
  {
    id v6 = [(SCRCMathExpression *)subscript latexDescriptionInMathMode:1];
    [v4 appendFormat:@"_{%@}", v6];
  }
  superscript = self->_superscript;
  if (superscript)
  {
    id v8 = [(SCRCMathExpression *)superscript latexDescriptionInMathMode:1];
    [v4 appendFormat:@"^{%@}", v8];
  }
  return v4;
}

- (SCRCMathExpression)subscript
{
  return self->_subscript;
}

- (void)setSubscript:(id)a3
{
}

- (SCRCMathExpression)superscript
{
  return self->_superscript;
}

- (void)setSuperscript:(id)a3
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
  objc_storeStrong((id *)&self->_superscript, 0);
  objc_storeStrong((id *)&self->_subscript, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end