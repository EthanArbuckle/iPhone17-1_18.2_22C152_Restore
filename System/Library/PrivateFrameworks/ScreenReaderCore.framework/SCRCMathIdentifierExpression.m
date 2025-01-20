@interface SCRCMathIdentifierExpression
- (BOOL)_isPrime;
- (BOOL)canFormWordStartingWithExpression:(id)a3;
- (BOOL)isNumber;
- (SCRCMathIdentifierExpression)initWithDictionary:(id)a3;
- (id)description;
- (id)mathMLString;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4 isPartOfWord:(BOOL)a5;
- (int64_t)fontStyle;
@end

@implementation SCRCMathIdentifierExpression

- (SCRCMathIdentifierExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCRCMathIdentifierExpression;
  v5 = [(SCRCMathSimpleExpression *)&v9 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMFontStyle"];
    if ([v6 isEqualToString:@"StyleItalic"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      if (![v6 isEqualToString:@"StyleBold"])
      {
        v5->_fontStyle = 0;
        goto LABEL_8;
      }
      uint64_t v7 = 2;
    }
    v5->_fontStyle = v7;
LABEL_8:
  }
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SCRCMathIdentifierExpression;
  v3 = [(SCRCMathSimpleExpression *)&v7 description];
  id v4 = [NSNumber numberWithInteger:self->_fontStyle];
  v5 = [v3 stringByAppendingFormat:@", font style %@", v4];

  return v5;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  return [(SCRCMathIdentifierExpression *)self speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:a4 isPartOfWord:0];
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4 isPartOfWord:(BOOL)a5
{
  v17.receiver = self;
  v17.super_class = (Class)SCRCMathIdentifierExpression;
  uint64_t v8 = [(SCRCMathSimpleExpression *)&v17 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:a4];
  objc_super v9 = (void *)v8;
  if (!a3 && !v8)
  {
    content = self->super._content;
    v11 = [MEMORY[0x263F08708] letterCharacterSet];
    uint64_t v12 = [(NSString *)content rangeOfCharacterFromSet:v11];

    v13 = (void *)MEMORY[0x263F086A0];
    v14 = [(SCRCMathSimpleExpression *)self content];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || a5)
    {
      uint64_t v15 = [v13 scrcStringWithString:v14];
    }
    else
    {
      uint64_t v15 = [v13 scrcStringWithLiteralString:v14];
    }
    objc_super v9 = (void *)v15;
  }
  return v9;
}

- (id)mathMLString
{
  BOOL v3 = [(SCRCMathIdentifierExpression *)self isNumber];
  id v4 = [(SCRCMathSimpleExpression *)self content];
  v5 = v4;
  if (v3) {
    v6 = @"mn";
  }
  else {
    v6 = @"mi";
  }
  objc_super v7 = [v4 stringWrappedInMathMLTag:v6];

  return v7;
}

- (BOOL)isNumber
{
  if ([(SCRCMathExpression *)self isNumberOverride]) {
    return 1;
  }
  BOOL v3 = [(SCRCMathSimpleExpression *)self content];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = 0;
  char v6 = 0;
  while (1)
  {
    objc_super v7 = [(SCRCMathSimpleExpression *)self content];
    uint64_t v8 = [v7 characterAtIndex:0];

    if (v5)
    {
      if (v8 == 45) {
        break;
      }
    }
    if (v8 == 46)
    {
      if (v6) {
        return 0;
      }
      char v6 = 1;
    }
    else
    {
      objc_super v9 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      int v10 = [v9 characterIsMember:v8];

      if (!v10) {
        return 0;
      }
    }
    if (v4 == ++v5) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)_isPrime
{
  v2 = [(SCRCMathSimpleExpression *)self content];
  if ([v2 length]) {
    BOOL v3 = [v2 characterAtIndex:0] == 8242;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)canFormWordStartingWithExpression:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(SCRCMathIdentifierExpression *)self fontStyle];
    uint64_t v7 = [v5 fontStyle];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

@end