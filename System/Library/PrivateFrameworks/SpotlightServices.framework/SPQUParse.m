@interface SPQUParse
- (NSArray)tokenArguments;
- (NSNumber)intentLabelId;
- (NSNumber)isPQA;
- (NSString)intentLabel;
- (SPQUParse)initWithIntentLabel:(id)a3 tokenArguments:(id)a4;
- (SPQUParse)initWithIntentLabel:(id)a3 tokenArguments:(id)a4 isPQA:(BOOL)a5;
- (id)getEncodedData;
- (void)setIntentLabel:(id)a3;
- (void)setIntentLabelId:(id)a3;
- (void)setIsPQA:(id)a3;
- (void)setTokenArguments:(id)a3;
@end

@implementation SPQUParse

- (SPQUParse)initWithIntentLabel:(id)a3 tokenArguments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPQUParse;
  v9 = [(SPQUParse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intentLabel, a3);
    objc_storeStrong((id *)&v10->_tokenArguments, a4);
  }

  return v10;
}

- (SPQUParse)initWithIntentLabel:(id)a3 tokenArguments:(id)a4 isPQA:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPQUParse;
  v11 = [(SPQUParse *)&v16 init];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_intentLabel, a3);
    objc_storeStrong((id *)&v12->_tokenArguments, a4);
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    isPQA = v12->_isPQA;
    v12->_isPQA = (NSNumber *)v13;
  }
  return v12;
}

- (id)getEncodedData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 setValue:self->_intentLabel forKey:@"intentLabel"];
  [v3 setValue:self->_isPQA forKey:@"isPQA"];
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_tokenArguments;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "getEncodedData", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setValue:v4 forKey:@"arguments"];
  return v3;
}

- (NSString)intentLabel
{
  return self->_intentLabel;
}

- (void)setIntentLabel:(id)a3
{
}

- (NSNumber)intentLabelId
{
  return self->_intentLabelId;
}

- (void)setIntentLabelId:(id)a3
{
}

- (NSArray)tokenArguments
{
  return self->_tokenArguments;
}

- (void)setTokenArguments:(id)a3
{
}

- (NSNumber)isPQA
{
  return self->_isPQA;
}

- (void)setIsPQA:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isPQA, 0);
  objc_storeStrong((id *)&self->_tokenArguments, 0);
  objc_storeStrong((id *)&self->_intentLabelId, 0);
  objc_storeStrong((id *)&self->_intentLabel, 0);
}

@end