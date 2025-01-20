@interface SCRCMathSimpleExpression
- (BOOL)canBeUsedWithBase;
- (BOOL)isFunctionName;
- (BOOL)isImplicit;
- (BOOL)isInteger;
- (BOOL)isWordOrAbbreviation;
- (NSString)content;
- (SCRCMathSimpleExpression)initWithDictionary:(id)a3;
- (id)_functionNames;
- (id)description;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexMathModeDescription;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (int64_t)integerValue;
- (void)setContent:(id)a3;
@end

@implementation SCRCMathSimpleExpression

- (SCRCMathSimpleExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRCMathSimpleExpression;
  v5 = [(SCRCMathExpression *)&v13 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"AXMContent"];
    if (v6) {
      v7 = (__CFString *)v6;
    }
    else {
      v7 = &stru_26CC25790;
    }
    uint64_t v8 = [(__CFString *)v7 copy];
    content = v5->_content;
    v5->_content = (NSString *)v8;

    v10 = [v4 objectForKey:@"AXMIsImplicit"];
    v11 = v10;
    if (v10) {
      LOBYTE(v10) = [v10 BOOLValue];
    }
    v5->_isImplicit = (char)v10;
  }
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SCRCMathSimpleExpression;
  v3 = [(SCRCMathSimpleExpression *)&v7 description];
  id v4 = [(SCRCMathSimpleExpression *)self content];
  v5 = [v3 stringByAppendingFormat:@" - content %@", v4];

  return v5;
}

- (BOOL)isInteger
{
  v3 = [(SCRCMathSimpleExpression *)self content];
  uint64_t v4 = [v3 rangeOfString:@"."];

  if (![(SCRCMathExpression *)self isNumber]) {
    return 0;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  uint64_t v6 = [(SCRCMathSimpleExpression *)self content];
  BOOL v5 = v4 == [v6 length] - 1;

  return v5;
}

- (int64_t)integerValue
{
  v2 = [(SCRCMathSimpleExpression *)self content];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)isWordOrAbbreviation
{
  if ([(SCRCMathExpression *)self isNumber]) {
    return 0;
  }
  uint64_t v4 = [(SCRCMathSimpleExpression *)self content];
  BOOL v3 = (unint64_t)[v4 length] > 1;

  return v3;
}

- (id)_functionNames
{
  if (_functionNames_onceToken != -1) {
    dispatch_once(&_functionNames_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_functionNames_FunctionNames;
  return v2;
}

uint64_t __42__SCRCMathSimpleExpression__functionNames__block_invoke()
{
  _functionNames_FunctionNames = [MEMORY[0x263EFFA08] setWithArray:&unk_26CC2D4B8];
  return MEMORY[0x270F9A758]();
}

- (BOOL)isFunctionName
{
  BOOL v3 = [(SCRCMathSimpleExpression *)self _functionNames];
  uint64_t v4 = [(SCRCMathSimpleExpression *)self content];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)canBeUsedWithBase
{
  BOOL v3 = [(SCRCMathSimpleExpression *)self content];
  if ([v3 isEqualToString:@"log"])
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(SCRCMathSimpleExpression *)self content];
    char v4 = [v5 isEqualToString:@"lg"];
  }
  return v4;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  if ([(SCRCMathSimpleExpression *)self isFunctionName])
  {
    char v5 = [(SCRCMathSimpleExpression *)self content];
    uint64_t v6 = [@"function." stringByAppendingString:v5];
    objc_super v7 = [(SCRCMathExpression *)self localizedAttributedStringForKey:v6];
  }
  else
  {
    objc_super v7 = 0;
  }
  return v7;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  char v5 = (void *)MEMORY[0x263F086A0];
  id v6 = a4;
  objc_super v7 = [(SCRCMathSimpleExpression *)self content];
  uint64_t v8 = [v5 scrcStringWithString:v7 treePosition:v6];

  return v8;
}

- (id)latexMathModeDescription
{
  BOOL v3 = [(SCRCMathSimpleExpression *)self content];
  char v4 = [(SCRCMathExpression *)self latexIdentifierForIdentifier:v3];

  return v4;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (BOOL)isImplicit
{
  return self->_isImplicit;
}

- (void).cxx_destruct
{
}

@end