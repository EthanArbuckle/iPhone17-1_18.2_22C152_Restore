@interface SCMLAnalysisResult
+ (id)obfuscateLabelName:(id)a3;
+ (id)obfuscateLabels:(id)a3;
- (BOOL)sensitive;
- (NSDictionary)scoresForLabels;
- (NSNumber)sensitivityScore;
- (SCMLAnalysisResult)initWithSensitive:(BOOL)a3 sensitivityScore:(id)a4 scoresForLabels:(id)a5;
- (SCMLAnalysisResult)initWithSensitive:(BOOL)a3 sensitivityScore:(id)a4 scoresForObfuscatedLabels:(id)a5;
@end

@implementation SCMLAnalysisResult

- (SCMLAnalysisResult)initWithSensitive:(BOOL)a3 sensitivityScore:(id)a4 scoresForLabels:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = +[SCMLAnalysisResult obfuscateLabels:a5];
  v10 = [(SCMLAnalysisResult *)self initWithSensitive:v6 sensitivityScore:v8 scoresForObfuscatedLabels:v9];

  return v10;
}

- (SCMLAnalysisResult)initWithSensitive:(BOOL)a3 sensitivityScore:(id)a4 scoresForObfuscatedLabels:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SCMLAnalysisResult;
  v11 = [(SCMLAnalysisResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_sensitive = a3;
    objc_storeStrong((id *)&v11->_sensitivityScore, a4);
    objc_storeStrong((id *)&v12->_scoresForLabels, a5);
  }

  return v12;
}

+ (id)obfuscateLabels:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKey:@"otgx_fyqmjdju"];

  if (v4)
  {
    id v5 = v3;
  }
  else
  {
    BOOL v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v13 = +[SCMLAnalysisResult obfuscateLabelName:](SCMLAnalysisResult, "obfuscateLabelName:", v12, (void)v16);
          objc_super v14 = [v7 objectForKeyedSubscript:v12];
          [v6 setObject:v14 forKey:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v5 = (id)[v6 copy];
  }

  return v5;
}

+ (id)obfuscateLabelName:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  id v5 = [v3 lowercaseString];
  if ([v5 length])
  {
    unint64_t v6 = 0;
    do
    {
      unsigned int v7 = [v5 characterAtIndex:v6];
      if (v7 - 97 >= 0x19) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = v7 + 1;
      }
      objc_msgSend(v4, "appendFormat:", @"%c", v8);
      ++v6;
    }
    while (v6 < [v5 length]);
  }

  return v4;
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (NSNumber)sensitivityScore
{
  return self->_sensitivityScore;
}

- (NSDictionary)scoresForLabels
{
  return self->_scoresForLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoresForLabels, 0);

  objc_storeStrong((id *)&self->_sensitivityScore, 0);
}

@end