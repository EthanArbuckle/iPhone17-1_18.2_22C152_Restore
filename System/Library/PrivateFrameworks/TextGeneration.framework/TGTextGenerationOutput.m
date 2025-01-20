@interface TGTextGenerationOutput
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (TGTextGenerationOutput)initWithText:(id)a3 score:(double)a4;
- (double)score;
- (id)description;
- (unint64_t)hash;
@end

@implementation TGTextGenerationOutput

- (TGTextGenerationOutput)initWithText:(id)a3 score:(double)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TGTextGenerationOutput;
  v8 = [(TGTextGenerationOutput *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_text, a3);
    v9->_score = a4;
    v16[0] = @"text";
    v16[1] = @"score";
    v17[0] = v7;
    v10 = [NSNumber numberWithDouble:a4];
    v17[1] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v12 = [v11 description];
    description = v9->_description;
    v9->_description = (NSString *)v12;
  }
  return v9;
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
    id v7 = [(TGTextGenerationOutput *)self text];
    v8 = [v6 text];
    if ([v7 isEqual:v8])
    {
      [(TGTextGenerationOutput *)self score];
      double v10 = v9;
      [v6 score];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(TGTextGenerationOutput *)self text];
  uint64_t v4 = [v3 hash];

  v5 = NSNumber;
  [(TGTextGenerationOutput *)self score];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  unint64_t v7 = [v6 hash] ^ v4;

  return v7;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end