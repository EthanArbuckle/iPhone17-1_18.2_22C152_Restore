@interface SCRCMathFencedExpression
- (BOOL)_isBinomialCoefficient;
- (BOOL)isClosingImplicit;
- (NSString)closeString;
- (NSString)openString;
- (SCRCMathFencedExpression)initWithDictionary:(id)a3;
- (id)_binomialCoefficientContent;
- (id)_treePositionForBinomialCoefficientContentWithOuterTreePosition:(id)a3;
- (id)description;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexDescriptionInMathMode:(BOOL)a3;
- (id)mathMLAttributes;
- (id)mathMLTag;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (unint64_t)fractionLevel;
- (void)setCloseString:(id)a3;
- (void)setOpenString:(id)a3;
@end

@implementation SCRCMathFencedExpression

- (SCRCMathFencedExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCMathFencedExpression;
  v5 = [(SCRCMathArrayExpression *)&v11 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMOpenOperator"];
    if (![(__CFString *)v6 length])
    {

      v6 = CFSTR("(");
    }
    v7 = [v4 objectForKey:@"AXMCloseOperator"];
    if (![(__CFString *)v7 length])
    {

      v7 = @"");
    }
    [(SCRCMathFencedExpression *)v5 setOpenString:v6];
    [(SCRCMathFencedExpression *)v5 setCloseString:v7];
    v8 = [v4 objectForKey:@"AXMIsImplicit"];
    v9 = v8;
    if (v8) {
      LOBYTE(v8) = [v8 BOOLValue];
    }
    v5->_isClosingImplicit = (char)v8;
  }
  return v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SCRCMathFencedExpression;
  v3 = [(SCRCMathArrayExpression *)&v8 description];
  id v4 = [(SCRCMathFencedExpression *)self openString];
  v5 = [(SCRCMathFencedExpression *)self closeString];
  v6 = [v3 stringByAppendingFormat:@", open string %@, close string %@", v4, v5];

  return v6;
}

- (BOOL)_isBinomialCoefficient
{
  v3 = [(SCRCMathArrayExpression *)self children];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(SCRCMathArrayExpression *)self children];
  v6 = [v5 lastObject];
  if ([v6 isUnlinedFraction])
  {
    v7 = [(SCRCMathFencedExpression *)self openString];
    if ([v7 isEqualToString:@"("]
    {
      objc_super v8 = [(SCRCMathFencedExpression *)self closeString];
      char v9 = [v8 isEqualToString:@""]);
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_binomialCoefficientContent
{
  v2 = [(SCRCMathArrayExpression *)self children];
  v3 = [v2 lastObject];

  return v3;
}

- (id)_treePositionForBinomialCoefficientContentWithOuterTreePosition:(id)a3
{
  return (id)[a3 indexPathByAddingIndex:0];
}

- (unint64_t)fractionLevel
{
  if ([(SCRCMathFencedExpression *)self _isBinomialCoefficient])
  {
    v3 = [(SCRCMathFencedExpression *)self _binomialCoefficientContent];
    unint64_t v4 = [v3 fractionLevel] - 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SCRCMathFencedExpression;
    return [(SCRCMathRowExpression *)&v6 fractionLevel];
  }
  return v4;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SCRCMathFencedExpression *)self _isBinomialCoefficient])
  {
    v7 = [(SCRCMathFencedExpression *)self _binomialCoefficientContent];
    objc_super v8 = [v7 speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:a3];
  }
  else
  {
    objc_super v8 = [MEMORY[0x263F089B8] scrcString];
    char v9 = (void *)MEMORY[0x263F086A0];
    v10 = [(SCRCMathFencedExpression *)self openString];
    objc_super v11 = [v9 scrcStringWithLiteralString:v10];
    [v8 appendAttributedString:v11];

    if (v4) {
      [MEMORY[0x263F086A0] scrcPauseString];
    }
    else {
    v12 = [MEMORY[0x263F086A0] scrcSpaceString];
    }
    [v8 appendAttributedString:v12];

    v23.receiver = self;
    v23.super_class = (Class)SCRCMathFencedExpression;
    v13 = [(SCRCMathRowExpression *)&v23 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];
    if ([v13 length])
    {
      [v8 appendAttributedString:v13];
      if (v4) {
        [MEMORY[0x263F086A0] scrcPauseString];
      }
      else {
      v14 = [MEMORY[0x263F086A0] scrcSpaceString];
      }
      [v8 appendAttributedString:v14];
    }
    v15 = (void *)MEMORY[0x263F086A0];
    v16 = [(SCRCMathFencedExpression *)self closeString];
    v17 = [v15 scrcStringWithLiteralString:v16];

    if ([(SCRCMathFencedExpression *)self isClosingImplicit])
    {
      v18 = (void *)MEMORY[0x263F086A0];
      v19 = [(SCRCMathExpression *)self localizedStringForKey:@"implicit.decoration"];
      v20 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"implicit"];
      uint64_t v21 = objc_msgSend(v18, "scrcStringWithFormat:", v19, v20, v17);

      v17 = (void *)v21;
    }
    [v8 appendAttributedString:v17];
  }
  return v8;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v8 = a5;
  if (a4 < 2)
  {
    v21.receiver = self;
    v21.super_class = (Class)SCRCMathFencedExpression;
    objc_super v11 = [(SCRCMathArrayExpression *)&v21 speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v8];
  }
  else
  {
    if ([(SCRCMathFencedExpression *)self _isBinomialCoefficient])
    {
      char v9 = [(SCRCMathFencedExpression *)self _binomialCoefficientContent];
      v10 = [(SCRCMathFencedExpression *)self _treePositionForBinomialCoefficientContentWithOuterTreePosition:v8];
      objc_super v11 = [v9 speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:a3 upToDepth:a4 - 1 treePosition:v10];
    }
    else
    {
      objc_super v11 = [MEMORY[0x263EFF980] array];
      char v9 = [v8 indexPathByAddingIndex:-2];
      v12 = (void *)MEMORY[0x263F086A0];
      v13 = [(SCRCMathFencedExpression *)self openString];
      v14 = [v12 scrcStringWithLiteralString:v13 treePosition:v9];
      [v11 insertObject:v14 atIndex:0];

      v22.receiver = self;
      v22.super_class = (Class)SCRCMathFencedExpression;
      v15 = [(SCRCMathArrayExpression *)&v22 speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v8];
      [v11 addObjectsFromArray:v15];

      v16 = [v8 indexPathByAddingIndex:-1];
      v17 = (void *)MEMORY[0x263F086A0];
      v18 = [(SCRCMathFencedExpression *)self closeString];
      v19 = [v17 scrcStringWithLiteralString:v18 treePosition:v16];
      [v11 addObject:v19];
    }
  }

  return v11;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x263F089B8] scrcString];
  id v8 = (void *)MEMORY[0x263F086A0];
  char v9 = [(SCRCMathFencedExpression *)self openString];
  v10 = [v6 indexPathByAddingIndex:-2];
  objc_super v11 = [v8 scrcStringWithString:v9 treePosition:v10];
  [v7 appendAttributedString:v11];

  if ([(SCRCMathFencedExpression *)self _isBinomialCoefficient])
  {
    v12 = [(SCRCMathFencedExpression *)self _binomialCoefficientContent];
    v13 = [(SCRCMathFencedExpression *)self _treePositionForBinomialCoefficientContentWithOuterTreePosition:v6];
    v14 = [v12 dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:v13 numberOfOuterRadicals:a3];
    [v7 appendAttributedString:v14];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SCRCMathFencedExpression;
    v15 = [(SCRCMathRowExpression *)&v21 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v6];
    [v7 appendAttributedString:v15];
  }
  v16 = (void *)MEMORY[0x263F086A0];
  v17 = [(SCRCMathFencedExpression *)self closeString];
  v18 = [v6 indexPathByAddingIndex:-1];
  v19 = [v16 scrcStringWithString:v17 treePosition:v18];
  [v7 appendAttributedString:v19];

  return v7;
}

- (id)mathMLTag
{
  return @"mfenced";
}

- (id)mathMLAttributes
{
  v7[6] = *MEMORY[0x263EF8340];
  v7[0] = @"open";
  v3 = [(SCRCMathFencedExpression *)self openString];
  v7[1] = v3;
  v7[2] = @"close";
  BOOL v4 = [(SCRCMathFencedExpression *)self closeString];
  v7[3] = v4;
  v7[4] = @"separators";
  v7[5] = &stru_26CC25790;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];

  return v5;
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  v5 = [MEMORY[0x263F089D8] string];
  id v6 = [(SCRCMathExpression *)self latexIdentifierForFenceOperator:self->_openString isClosingOperator:0];
  [v5 appendString:v6];
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathFencedExpression;
  v7 = [(SCRCMathRowExpression *)&v10 latexDescriptionInMathMode:1];
  if ([v7 length])
  {
    [v5 appendString:@" "];
    [v5 appendString:v7];
  }
  [v5 appendString:@" "];
  id v8 = [(SCRCMathExpression *)self latexIdentifierForFenceOperator:self->_closeString isClosingOperator:1];
  [v5 appendString:v8];
  if (!a3) {
    [v5 addMathIndicators];
  }

  return v5;
}

- (NSString)openString
{
  return self->_openString;
}

- (void)setOpenString:(id)a3
{
}

- (NSString)closeString
{
  return self->_closeString;
}

- (void)setCloseString:(id)a3
{
}

- (BOOL)isClosingImplicit
{
  return self->_isClosingImplicit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeString, 0);
  objc_storeStrong((id *)&self->_openString, 0);
}

@end