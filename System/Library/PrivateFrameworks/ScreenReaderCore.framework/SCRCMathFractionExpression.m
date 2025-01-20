@interface SCRCMathFractionExpression
- (BOOL)isSimpleNumericalFraction;
- (BOOL)isUnlinedFraction;
- (SCRCMathExpression)denominator;
- (SCRCMathExpression)numerator;
- (SCRCMathExpression)operator;
- (SCRCMathFractionExpression)initWithDictionary:(id)a3;
- (double)lineThickness;
- (id)_dollarCodeDescriptionAsBinomialCoefficient:(BOOL)a3 orMixedNumberFraction:(BOOL)a4 withNumberOfOuterRadicals:(unint64_t)a5 treePosition:(id)a6;
- (id)_speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4 asBinomialCoefficient:(BOOL)a5;
- (id)_speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 asBinomialCoefficient:(BOOL)a6;
- (id)description;
- (id)dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:(id)a3 numberOfOuterRadicals:(unint64_t)a4;
- (id)dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:(id)a3;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexMathModeDescription;
- (id)mathMLString;
- (id)speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)subExpressions;
- (unint64_t)fractionLevel;
- (void)setDenominator:(id)a3;
- (void)setLineThickness:(double)a3;
- (void)setNumerator:(id)a3;
- (void)setOperator:(id)a3;
@end

@implementation SCRCMathFractionExpression

- (SCRCMathFractionExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCRCMathFractionExpression;
  v5 = [(SCRCMathExpression *)&v20 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMNumeratorObject"];
    if (!v6)
    {
      v7 = [@"Term" stringByAppendingString:@"1"];
      v6 = [v4 objectForKey:v7];
    }
    v8 = [v4 objectForKey:@"AXMDenominatorObject"];
    if (!v8)
    {
      v9 = [@"Term" stringByAppendingString:@"2"];
      v8 = [v4 objectForKey:v9];
    }
    v10 = +[SCRCMathExpression mathExpressionWithDictionary:v6];
    uint64_t v11 = +[SCRCMathExpression mathExpressionWithDictionary:v8];
    v12 = (void *)v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      v14 = v5;
      v5 = 0;
    }
    else
    {
      [(SCRCMathFractionExpression *)v5 setNumerator:v10];
      [(SCRCMathFractionExpression *)v5 setDenominator:v12];
      v15 = [v4 objectForKey:@"AXMOperator"];
      v16 = +[SCRCMathExpression mathExpressionWithDictionary:v15];
      [(SCRCMathFractionExpression *)v5 setOperator:v16];

      v17 = [v4 objectForKey:@"AXMLineThickness"];
      v14 = v17;
      if (v17) {
        [(SCRCMathFractionExpression *)v17 doubleValue];
      }
      else {
        double v18 = 1.0;
      }
      [(SCRCMathFractionExpression *)v5 setLineThickness:v18];
    }
  }
  return v5;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathFractionExpression;
  v3 = [(SCRCMathFractionExpression *)&v10 description];
  id v4 = [(SCRCMathFractionExpression *)self numerator];
  v5 = [(SCRCMathFractionExpression *)self denominator];
  v6 = [(SCRCMathFractionExpression *)self operator];
  [(SCRCMathFractionExpression *)self lineThickness];
  v8 = [v3 stringByAppendingFormat:@" - numerator %@, denominator %@, operator %@, line thickness %f", v4, v5, v6, v7];

  return v8;
}

- (id)subExpressions
{
  v3 = [(SCRCMathFractionExpression *)self numerator];
  id v4 = [(SCRCMathFractionExpression *)self denominator];
  v5 = [(SCRCMathExpression *)self arrayWithoutNilsFromFirstChild:v3 secondChild:v4 thirdChild:0];

  return v5;
}

- (BOOL)isUnlinedFraction
{
  [(SCRCMathFractionExpression *)self lineThickness];
  return v2 == 0.0;
}

- (unint64_t)fractionLevel
{
  return [(SCRCMathExpression *)self maximumFractionLevelOfSubExpressions] + 1;
}

- (BOOL)isSimpleNumericalFraction
{
  v3 = [(SCRCMathFractionExpression *)self numerator];
  if ([v3 isNumber])
  {
    id v4 = [(SCRCMathFractionExpression *)self denominator];
    char v5 = [v4 isNumber];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4 asBinomialCoefficient:(BOOL)a5
{
  BOOL v6 = a4;
  v9 = [(SCRCMathFractionExpression *)self numerator];
  objc_super v10 = [v9 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v6];

  uint64_t v11 = [(SCRCMathFractionExpression *)self denominator];
  v12 = [v11 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v6];

  if (a5)
  {
    BOOL v13 = @"binomial.coefficient.formatter";
  }
  else if ([v10 scrcContainsPause])
  {
    BOOL v13 = @"math.fraction.with.long.numerator.formatter";
  }
  else
  {
    BOOL v13 = @"math.fraction.formatter";
  }
  v14 = [(SCRCMathExpression *)self localizedStringForKey:v13];
  v15 = objc_msgSend(MEMORY[0x263F086A0], "scrcStringWithFormat:", v14, v10, v12);

  return v15;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(SCRCMathFractionExpression *)self isUnlinedFraction];
  return [(SCRCMathFractionExpression *)self _speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4 asBinomialCoefficient:v7];
}

- (id)speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3
{
  return [(SCRCMathFractionExpression *)self _speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:0 asBinomialCoefficient:1];
}

- (id)_speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 asBinomialCoefficient:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a5;
  if (a4)
  {
    unint64_t v11 = a4 - 1;
    if (a4 == 1)
    {
      v41.receiver = self;
      v41.super_class = (Class)SCRCMathFractionExpression;
      v12 = [(SCRCMathExpression *)&v41 speakableSegmentsWithSpeakingStyle:a3 upToDepth:1 treePosition:v10];
    }
    else
    {
      BOOL v13 = @"segment.";
      if (v6) {
        BOOL v13 = @"segment.binomial.coefficient.";
      }
      v14 = v13;
      v15 = [(SCRCMathFractionExpression *)self numerator];
      v16 = [v10 indexPathByAddingIndex:0];
      v17 = [(__CFString *)v14 stringByAppendingString:@"numerator.prefix"];
      double v18 = [(__CFString *)v14 stringByAppendingString:@"numerator.suffix"];
      v19 = [v15 speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 - 1 treePosition:v16 localizablePrefix:v17 localizableSuffix:v18];

      objc_super v20 = [(SCRCMathFractionExpression *)self denominator];
      id v36 = v10;
      v21 = [v10 indexPathByAddingIndex:1];
      v22 = [(__CFString *)v14 stringByAppendingString:@"denominator.prefix"];
      v35 = v14;
      v23 = [(__CFString *)v14 stringByAppendingString:@"denominator.suffix"];
      v24 = [v20 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v11 treePosition:v21 localizablePrefix:v22 localizableSuffix:v23];

      v12 = [MEMORY[0x263EFF980] array];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v25 = [(SCRCMathExpression *)self localizedSegmentOrderingForKey:@"Fraction"];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v38 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            char v31 = [v30 isEqualToString:@"numerator"];
            v32 = v19;
            if ((v31 & 1) == 0)
            {
              int v33 = [v30 isEqualToString:@"denominator"];
              v32 = v24;
              if (!v33) {
                continue;
              }
            }
            [v12 addObjectsFromArray:v32];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v27);
      }

      id v10 = v36;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  return [(SCRCMathFractionExpression *)self _speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:a5 asBinomialCoefficient:0];
}

- (id)speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  return [(SCRCMathFractionExpression *)self _speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:a5 asBinomialCoefficient:1];
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  return [(SCRCMathFractionExpression *)self _dollarCodeDescriptionAsBinomialCoefficient:0 orMixedNumberFraction:0 withNumberOfOuterRadicals:a3 treePosition:a4];
}

- (id)dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:(id)a3
{
  return [(SCRCMathFractionExpression *)self _dollarCodeDescriptionAsBinomialCoefficient:0 orMixedNumberFraction:1 withNumberOfOuterRadicals:0 treePosition:a3];
}

- (id)dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:(id)a3 numberOfOuterRadicals:(unint64_t)a4
{
  return [(SCRCMathFractionExpression *)self _dollarCodeDescriptionAsBinomialCoefficient:1 orMixedNumberFraction:0 withNumberOfOuterRadicals:a4 treePosition:a3];
}

- (id)_dollarCodeDescriptionAsBinomialCoefficient:(BOOL)a3 orMixedNumberFraction:(BOOL)a4 withNumberOfOuterRadicals:(unint64_t)a5 treePosition:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  if (v8) {
    unint64_t v11 = @"nr";
  }
  else {
    unint64_t v11 = @"fl";
  }
  if (v8) {
    v12 = 0;
  }
  else {
    v12 = @"fe0";
  }
  if (v8) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = @"fs0";
  }
  if (!v8 && !a4)
  {
    unint64_t v14 = [(SCRCMathFractionExpression *)self fractionLevel];
    v12 = @"fe2";
    v15 = @"fs";
    v16 = @"fe";
    v17 = @"fl";
    if (v14 == 2)
    {
      v17 = @"fl1";
      v16 = @"fe1";
      v15 = @"fs1";
    }
    if (v14 == 3) {
      unint64_t v11 = @"fl2";
    }
    else {
      unint64_t v11 = v17;
    }
    if (v14 == 3)
    {
      BOOL v13 = @"fs2";
    }
    else
    {
      v12 = v16;
      BOOL v13 = v15;
    }
  }
  v29 = v12;
  double v18 = [MEMORY[0x263F089B8] scrcString];
  if (!v8)
  {
    v19 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:v13 treePosition:v10];
    [v18 appendAttributedString:v19];
  }
  objc_super v20 = [(SCRCMathFractionExpression *)self numerator];
  v21 = [v10 indexPathByAddingIndex:0];
  v22 = [v20 dollarCodeDescriptionWithNumberOfOuterRadicals:a5 treePosition:v21];
  [v18 appendAttributedString:v22];

  v23 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:v11 treePosition:v10];
  [v18 appendAttributedString:v23];

  v24 = [(SCRCMathFractionExpression *)self denominator];
  v25 = [v10 indexPathByAddingIndex:1];
  uint64_t v26 = [v24 dollarCodeDescriptionWithNumberOfOuterRadicals:a5 treePosition:v25];
  [v18 appendAttributedString:v26];

  if (!v8)
  {
    uint64_t v27 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:v29 treePosition:v10];
    [v18 appendAttributedString:v27];
  }
  return v18;
}

- (id)mathMLString
{
  v15[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  BOOL v4 = [(SCRCMathFractionExpression *)self numerator];
  char v5 = [v4 mathMLString];
  BOOL v6 = [(SCRCMathFractionExpression *)self denominator];
  BOOL v7 = [v6 mathMLString];
  BOOL v8 = [v3 stringWithFormat:@"%@%@", v5, v7];
  v15[0] = @"linethickness";
  v9 = NSString;
  [(SCRCMathFractionExpression *)self lineThickness];
  unint64_t v11 = objc_msgSend(v9, "stringWithFormat:", @"%g", v10);
  v15[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  BOOL v13 = [v8 stringWrappedInMathMLTag:@"mfrac" withAttributes:v12];

  return v13;
}

- (id)latexMathModeDescription
{
  v3 = NSString;
  BOOL v4 = [(SCRCMathExpression *)self->_numerator latexDescriptionInMathMode:1];
  char v5 = [(SCRCMathExpression *)self->_denominator latexDescriptionInMathMode:1];
  BOOL v6 = [v3 stringWithFormat:@"\\frac{%@}{%@}", v4, v5];

  return v6;
}

- (SCRCMathExpression)numerator
{
  return self->_numerator;
}

- (void)setNumerator:(id)a3
{
}

- (SCRCMathExpression)denominator
{
  return self->_denominator;
}

- (void)setDenominator:(id)a3
{
}

- (SCRCMathExpression)operator
{
  return self->_operator;
}

- (void)setOperator:(id)a3
{
}

- (double)lineThickness
{
  return self->_lineThickness;
}

- (void)setLineThickness:(double)a3
{
  self->_lineThickness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong((id *)&self->_denominator, 0);
  objc_storeStrong((id *)&self->_numerator, 0);
}

@end