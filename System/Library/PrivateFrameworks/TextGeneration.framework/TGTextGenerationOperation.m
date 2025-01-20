@interface TGTextGenerationOperation
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldProduceOutputStream;
- (TGTextGenerationOperation)initWithPrompt:(id)a3;
- (TGTextGenerationOutputConstraint)outputConstraint;
- (TGTextGenerationPrompt)prompt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setOutputConstraint:(id)a3;
- (void)setProduceOutputStream:(BOOL)a3;
@end

@implementation TGTextGenerationOperation

- (TGTextGenerationOperation)initWithPrompt:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TGTextGenerationOperation;
  v5 = [(TGTextGenerationOperation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    prompt = v5->_prompt;
    v5->_prompt = (TGTextGenerationPrompt *)v6;

    v14 = @"prompt";
    v8 = [(TGTextGenerationOperation *)v5 prompt];
    v15[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v9 description];
    description = v5->_description;
    v5->_description = (NSString *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TGTextGenerationOperation alloc];
  v5 = [(TGTextGenerationOperation *)self prompt];
  uint64_t v6 = [(TGTextGenerationOperation *)v4 initWithPrompt:v5];

  v7 = [(TGTextGenerationOperation *)self outputConstraint];
  [(TGTextGenerationOperation *)v6 setOutputConstraint:v7];

  [(TGTextGenerationOperation *)v6 setProduceOutputStream:[(TGTextGenerationOperation *)self shouldProduceOutputStream]];
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TGMutableTextGenerationOperation alloc];
  v5 = [(TGTextGenerationOperation *)self prompt];
  uint64_t v6 = [(TGTextGenerationOperation *)v4 initWithPrompt:v5];

  v7 = [(TGTextGenerationOperation *)self outputConstraint];
  [(TGTextGenerationOperation *)v6 setOutputConstraint:v7];

  [(TGTextGenerationOperation *)v6 setProduceOutputStream:[(TGTextGenerationOperation *)self shouldProduceOutputStream]];
  return v6;
}

- (unint64_t)hash
{
  v3 = [(TGTextGenerationOperation *)self prompt];
  uint64_t v4 = [v3 hash];

  v5 = [(TGTextGenerationOperation *)self outputConstraint];
  uint64_t v6 = [v5 hash] ^ v4;

  return v6 ^ [(TGTextGenerationOperation *)self shouldProduceOutputStream];
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
    v7 = [(TGTextGenerationOperation *)self prompt];
    v8 = [v6 prompt];
    if ([v7 isEqual:v8])
    {
      v9 = [(TGTextGenerationOperation *)self outputConstraint];
      uint64_t v10 = [v6 outputConstraint];
      if (TGTextGenerationEqualAllowingNil(v9, v10))
      {
        BOOL v11 = [(TGTextGenerationOperation *)self shouldProduceOutputStream];
        int v12 = v11 ^ [v6 shouldProduceOutputStream] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)description
{
  return objc_getProperty(self, a2, 16, 1);
}

- (TGTextGenerationPrompt)prompt
{
  return (TGTextGenerationPrompt *)objc_getProperty(self, a2, 24, 1);
}

- (TGTextGenerationOutputConstraint)outputConstraint
{
  return (TGTextGenerationOutputConstraint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutputConstraint:(id)a3
{
}

- (BOOL)shouldProduceOutputStream
{
  return self->_produceOutputStream;
}

- (void)setProduceOutputStream:(BOOL)a3
{
  self->_produceOutputStream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputConstraint, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end