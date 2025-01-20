@interface TGTextGenerationPrompt
- (BOOL)isEqual:(id)a3;
- (NSString)contextText;
- (NSString)instructionText;
- (TGTextGenerationPrompt)initWithInstructionText:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setContextText:(id)a3;
@end

@implementation TGTextGenerationPrompt

- (TGTextGenerationPrompt)initWithInstructionText:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TGTextGenerationPrompt;
  v5 = [(TGTextGenerationPrompt *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    instructionText = v5->_instructionText;
    v5->_instructionText = (NSString *)v6;

    v13 = @"instructionText";
    v14[0] = v4;
    v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v9 = [v8 description];
    description = v5->_description;
    v5->_description = (NSString *)v9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TGTextGenerationPrompt alloc];
  v5 = [(TGTextGenerationPrompt *)self instructionText];
  uint64_t v6 = [(TGTextGenerationPrompt *)v4 initWithInstructionText:v5];

  v7 = [(TGTextGenerationPrompt *)self contextText];
  [(TGTextGenerationPrompt *)v6 setContextText:v7];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TGMutableTextGenerationPrompt alloc];
  v5 = [(TGTextGenerationPrompt *)self instructionText];
  uint64_t v6 = [(TGTextGenerationPrompt *)v4 initWithInstructionText:v5];

  v7 = [(TGTextGenerationPrompt *)self contextText];
  [(TGTextGenerationPrompt *)v6 setContextText:v7];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(TGTextGenerationPrompt *)self instructionText];
  uint64_t v4 = [v3 hash];

  v5 = [(TGTextGenerationPrompt *)self contextText];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(TGTextGenerationPrompt *)self instructionText];
    v8 = [v6 instructionText];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(TGTextGenerationPrompt *)self contextText];
      v10 = [v6 contextText];
      char v11 = TGTextGenerationEqualAllowingNil(v9, v10);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)instructionText
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)contextText
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContextText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextText, 0);
  objc_storeStrong((id *)&self->_instructionText, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end