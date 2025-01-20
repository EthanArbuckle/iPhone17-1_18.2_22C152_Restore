@interface SCRCMathOperatorExpression
- (BOOL)_isFactorialSign;
- (BOOL)_isIntegral;
- (BOOL)_isInvisibleCharacter;
- (BOOL)_isMinusSign;
- (BOOL)_isRingOperator;
- (BOOL)_isSummation;
- (BOOL)_isUnionOrIntersection;
- (BOOL)canBeUsedWithRange;
- (BOOL)isEllipsis;
- (BOOL)isFenceDelimiter;
- (BOOL)isOperationSymbol;
- (BOOL)isTermSeparator;
- (SCRCMathOperatorExpression)initWithDictionary:(id)a3;
- (id)description;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexFormatStringAsOver;
- (id)mathMLString;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (unsigned)operatorChar;
@end

@implementation SCRCMathOperatorExpression

- (SCRCMathOperatorExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathOperatorExpression;
  v5 = [(SCRCMathSimpleExpression *)&v10 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMUnichar"];
    *((_WORD *)&v5->super._isImplicit + 1) = [v6 unsignedShortValue];

    if (*((_WORD *)&v5->super._isImplicit + 1) == 45 && [(NSString *)v5->super._content length] == 1)
    {
      *((_WORD *)&v5->super._isImplicit + 1) = 8722;
      uint64_t v7 = [NSString stringWithCharacters:&v5->super._isImplicit + 2 length:1];
      content = v5->super._content;
      v5->super._content = (NSString *)v7;
    }
  }

  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SCRCMathOperatorExpression;
  v3 = [(SCRCMathSimpleExpression *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@", operator character %C", *((unsigned __int16 *)&self->super._isImplicit + 1)];

  return v4;
}

- (BOOL)_isIntegral
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) - 8747 < 4;
}

- (BOOL)_isUnionOrIntersection
{
  int v2 = *((unsigned __int16 *)&self->super._isImplicit + 1);
  BOOL v3 = (v2 - 8898) >= 2;
  unsigned int v4 = v2 - 8745;
  return !v3 || v4 <= 1;
}

- (BOOL)_isSummation
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 8721;
}

- (BOOL)canBeUsedWithRange
{
  if ([(SCRCMathOperatorExpression *)self _isIntegral]
    || [(SCRCMathOperatorExpression *)self _isUnionOrIntersection])
  {
    return 1;
  }
  return [(SCRCMathOperatorExpression *)self _isSummation];
}

- (BOOL)_isRingOperator
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 8728;
}

- (BOOL)_isInvisibleCharacter
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) - 8289 < 2;
}

- (BOOL)_isMinusSign
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 8722;
}

- (BOOL)_isFactorialSign
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 33;
}

- (BOOL)isEllipsis
{
  int v2 = *((unsigned __int16 *)&self->super._isImplicit + 1);
  return v2 == 8230 || v2 == 8943;
}

- (BOOL)isTermSeparator
{
  unsigned int v2 = *((unsigned __int16 *)&self->super._isImplicit + 1);
  if ((v2 & 0xFF00) == 0x2200)
  {
    LOBYTE(v3) = 1;
  }
  else if (v2 > 0x3E)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x7000280000000000uLL >> v2) & 1;
  }
  return v3;
}

- (BOOL)isOperationSymbol
{
  unsigned int v2 = [(SCRCMathSimpleExpression *)self content];
  BOOL v3 = [v2 length] == 1;

  return v3;
}

- (BOOL)isFenceDelimiter
{
  BOOL v3 = [(SCRCMathExpression *)self fenceDelimiters];
  unsigned int v4 = [(SCRCMathSimpleExpression *)self content];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (id)latexFormatStringAsOver
{
  if (latexFormatStringAsOver_onceToken != -1) {
    dispatch_once(&latexFormatStringAsOver_onceToken, &__block_literal_global_3);
  }
  BOOL v3 = (void *)latexFormatStringAsOver__OverLookupTable;
  unsigned int v4 = [(SCRCMathSimpleExpression *)self content];
  char v5 = [v3 objectForKey:v4];

  return v5;
}

void __53__SCRCMathOperatorExpression_latexFormatStringAsOver__block_invoke()
{
  v0 = (void *)latexFormatStringAsOver__OverLookupTable;
  latexFormatStringAsOver__OverLookupTable = (uint64_t)&unk_26CC2D4F8;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  v22.receiver = self;
  v22.super_class = (Class)SCRCMathOperatorExpression;
  char v5 = [(SCRCMathSimpleExpression *)&v22 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:a4];
  if (!v5)
  {
    if ([(SCRCMathOperatorExpression *)self _isRingOperator])
    {
      objc_super v6 = [(SCRCMathExpression *)self siblings];
      uint64_t v7 = [v6 indexOfObjectIdenticalTo:self];
      if (v7 == [v6 count] - 1)
      {
        char v5 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"operator.degrees"];
      }
      else
      {
        char v5 = 0;
      }
LABEL_26:

      if (v5) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    if ([(SCRCMathOperatorExpression *)self _isInvisibleCharacter])
    {
      uint64_t v8 = [MEMORY[0x263F086A0] scrcStringWithString:&stru_26CC25790];
      goto LABEL_14;
    }
    if (![(SCRCMathOperatorExpression *)self _isMinusSign])
    {
      if (![(SCRCMathOperatorExpression *)self _isFactorialSign])
      {
LABEL_27:
        v15 = (void *)MEMORY[0x263F086A0];
        v16 = [(SCRCMathSimpleExpression *)self content];
        char v5 = [v15 scrcStringWithLiteralString:v16];

        goto LABEL_28;
      }
      uint64_t v8 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"operator.factorial"];
LABEL_14:
      char v5 = (void *)v8;
      if (v8) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    objc_super v6 = [(SCRCMathExpression *)self siblings];
    uint64_t v9 = [v6 indexOfObjectIdenticalTo:self];
    uint64_t v10 = v9;
    if (v9)
    {
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = [(SCRCMathExpression *)self parent];
        NSLog(&cfstr_AxVoiceoverMat.isa, self, v11);
        goto LABEL_22;
      }
      v12 = [v6 objectAtIndex:v9 - 1];
      v11 = v12;
      if (v12 && ![v12 isFenceDelimiter]) {
        goto LABEL_22;
      }
    }
    else
    {
      v11 = 0;
    }
    unint64_t v13 = v10 + 1;
    if (v13 < [v6 count])
    {
      v14 = [v6 objectAtIndex:v13];
      if ([v14 isOperationSymbol])
      {
        char v5 = 0;
      }
      else
      {
        char v5 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"operator.negative"];
      }

      goto LABEL_25;
    }
LABEL_22:
    char v5 = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_28:
  if ([(SCRCMathSimpleExpression *)self isImplicit])
  {
    v17 = (void *)MEMORY[0x263F086A0];
    v18 = [(SCRCMathExpression *)self localizedStringForKey:@"implicit.decoration"];
    v19 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"implicit"];
    uint64_t v20 = objc_msgSend(v17, "scrcStringWithFormat:", v18, v19, v5);

    char v5 = (void *)v20;
  }
  return v5;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6 = a4;
  if ([(SCRCMathOperatorExpression *)self _isInvisibleCharacter])
  {
    uint64_t v7 = [MEMORY[0x263F086A0] scrcStringWithString:&stru_26CC25790 treePosition:v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SCRCMathOperatorExpression;
    uint64_t v7 = [(SCRCMathSimpleExpression *)&v10 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v6];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (id)mathMLString
{
  unsigned int v2 = [(SCRCMathSimpleExpression *)self content];
  BOOL v3 = [v2 stringWrappedInMathMLTag:@"mo"];

  return v3;
}

- (unsigned)operatorChar
{
  return *((_WORD *)&self->super._isImplicit + 1);
}

@end