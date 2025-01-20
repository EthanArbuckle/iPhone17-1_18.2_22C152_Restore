@interface SSDictionaryResultBuilder
+ (id)bundleId;
- (NSArray)definitions;
- (NSString)definitionString;
- (NSString)dictionaryName;
- (NSString)word;
- (NSURL)dictionaryURL;
- (SSDictionaryResultBuilder)initWithResult:(id)a3;
- (id)buildCommand;
- (id)buildCompactCardSection;
- (id)buildDescriptions;
- (id)buildInlineCardSection;
- (id)buildTitle;
- (void)setDefinitionString:(id)a3;
- (void)setDefinitions:(id)a3;
- (void)setDictionaryName:(id)a3;
- (void)setDictionaryURL:(id)a3;
- (void)setWord:(id)a3;
@end

@implementation SSDictionaryResultBuilder

+ (id)bundleId
{
  return @"com.apple.dictionary";
}

- (SSDictionaryResultBuilder)initWithResult:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSDictionaryResultBuilder;
  return [(SSResultBuilder *)&v4 initWithResult:a3];
}

- (id)buildCompactCardSection
{
  return 0;
}

- (id)buildInlineCardSection
{
  return 0;
}

- (id)buildTitle
{
  v3 = objc_opt_new();
  objc_super v4 = [(SSDictionaryResultBuilder *)self word];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F9A0E0] textWithString:v4];
    [v5 setIsEmphasized:1];
    [v3 addObject:v5];
  }
  uint64_t v6 = [(SSDictionaryResultBuilder *)self dictionaryName];
  if (v6)
  {
    v7 = (void *)v6;
    int v8 = isMacOS();

    if (v8)
    {
      v9 = [MEMORY[0x1E4F9A0E0] textWithString:@" — "];
      [v3 addObject:v9];

      v10 = (void *)MEMORY[0x1E4F9A0E0];
      v11 = [(SSDictionaryResultBuilder *)self dictionaryName];
      v12 = [v10 textWithString:v11];
      [v3 addObject:v12];
    }
  }
  v13 = objc_opt_new();
  [v13 setFormattedTextPieces:v3];

  return v13;
}

- (id)buildDescriptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F9A378];
  v3 = [(SSDictionaryResultBuilder *)self definitionString];
  objc_super v4 = [v2 textWithString:v3];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)buildCommand
{
  v3 = [(SSDictionaryResultBuilder *)self dictionaryURL];

  if (v3)
  {
    objc_super v4 = objc_opt_new();
    v5 = (void *)MEMORY[0x1E4F9A2F8];
    uint64_t v6 = [(SSDictionaryResultBuilder *)self dictionaryURL];
    v7 = [v5 punchoutWithURL:v6];
    [v4 setPunchout:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDictionaryResultBuilder;
    objc_super v4 = [(SSResultBuilder *)&v9 buildCommand];
  }
  return v4;
}

- (NSString)definitionString
{
  definitionString = self->_definitionString;
  if (!definitionString)
  {
    v25 = self;
    objc_super v4 = [(SSDictionaryResultBuilder *)self definitions];
    v5 = objc_opt_new();
    unint64_t v6 = [v4 count];
    uint64_t v7 = 2;
    if (v6 < 2) {
      uint64_t v7 = v6;
    }
    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        if (definitionString_onceToken != -1) {
          dispatch_once(&definitionString_onceToken, &__block_literal_global_7);
        }
        objc_super v9 = &stru_1F1824018;
        if ((unint64_t)[v4 count] >= 2)
        {
          v10 = NSString;
          v11 = (void *)definitionString_numberFormatter;
          v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8 + 1];
          v13 = [v11 stringFromNumber:v12];
          objc_super v9 = [v10 stringWithFormat:@"%@. ", v13];
        }
        v14 = &stru_1F1824018;
        if (v8 == 1)
        {
          unint64_t v15 = [v4 count];
          v14 = @"…";
          if (v15 <= 2) {
            v14 = &stru_1F1824018;
          }
        }
        v16 = NSString;
        v17 = v14;
        v18 = [v4 objectAtIndexedSubscript:v8];
        v19 = [v16 stringWithFormat:@"%@%@%@", v9, v18, v17];

        [v5 addObject:v19];
        ++v8;
        unint64_t v20 = [v4 count];
        unint64_t v21 = 2;
        if (v20 < 2) {
          unint64_t v21 = v20;
        }
      }
      while (v8 < v21);
    }
    uint64_t v22 = [v5 componentsJoinedByString:@" "];
    v23 = v25->_definitionString;
    v25->_definitionString = (NSString *)v22;

    definitionString = v25->_definitionString;
  }
  return definitionString;
}

uint64_t __45__SSDictionaryResultBuilder_definitionString__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)definitionString_numberFormatter;
  definitionString_numberFormatter = v0;

  v2 = (void *)definitionString_numberFormatter;
  return [v2 setNumberStyle:1];
}

- (void)setDefinitionString:(id)a3
{
}

- (NSArray)definitions
{
  return self->_definitions;
}

- (void)setDefinitions:(id)a3
{
}

- (NSString)dictionaryName
{
  return self->_dictionaryName;
}

- (void)setDictionaryName:(id)a3
{
}

- (NSString)word
{
  return self->_word;
}

- (void)setWord:(id)a3
{
}

- (NSURL)dictionaryURL
{
  return self->_dictionaryURL;
}

- (void)setDictionaryURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryURL, 0);
  objc_storeStrong((id *)&self->_word, 0);
  objc_storeStrong((id *)&self->_dictionaryName, 0);
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_definitionString, 0);
}

@end