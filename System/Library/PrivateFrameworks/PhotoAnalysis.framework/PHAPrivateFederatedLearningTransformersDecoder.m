@interface PHAPrivateFederatedLearningTransformersDecoder
- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5;
- (NSDictionary)transformerNameToClass;
- (PHAPrivateFederatedLearningTransformersDecoder)init;
- (id)instanceForTransformerConfig:(id)a3 error:(id *)a4;
- (id)instancesForTransformerConfigList:(id)a3 error:(id *)a4;
- (id)transformersForFeatureExtractorsFromDictionary:(id)a3 error:(id *)a4;
@end

@implementation PHAPrivateFederatedLearningTransformersDecoder

- (void).cxx_destruct
{
}

- (NSDictionary)transformerNameToClass
{
  return self->_transformerNameToClass;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = a5;
    v10 = [v8 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = [v7 errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningTransformersDecoder" code:a4 userInfo:v10];

    *a3 = v11;
  }
  return 0;
}

- (id)instanceForTransformerConfig:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(PHAPrivateFederatedLearningTransformersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid transformers format: transformer configuration is not dictionary."];
    v11 = 0;
    goto LABEL_13;
  }
  v7 = [v6 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(PHAPrivateFederatedLearningTransformersDecoder *)self transformerNameToClass];
    id v9 = (void *)[v8 objectForKeyedSubscript:v7];

    if (v9)
    {
      v10 = [v6 objectForKeyedSubscript:@"params"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v9 instanceWithParameters:v10 error:a4];
      }
      else
      {
        [(PHAPrivateFederatedLearningTransformersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid transformers format: transformer parameters is not an array."];
        v11 = 0;
      }

      goto LABEL_12;
    }
    v12 = [NSString stringWithFormat:@"Transformer not supported: %@", v7];
    [(PHAPrivateFederatedLearningTransformersDecoder *)self _generateError:a4 errorCode:0 errorMessage:v12];
  }
  else
  {
    [(PHAPrivateFederatedLearningTransformersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid transformers format: transformer name is not a string."];
  }
  v11 = 0;
LABEL_12:

LABEL_13:

  return v11;
}

- (id)instancesForTransformerConfigList:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = -[PHAPrivateFederatedLearningTransformersDecoder instanceForTransformerConfig:error:](self, "instanceForTransformerConfig:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4, (void)v17);
          if (!v13)
          {

            id v15 = 0;
            goto LABEL_13;
          }
          v14 = (void *)v13;
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v15 = v7;
LABEL_13:
  }
  else
  {
    [(PHAPrivateFederatedLearningTransformersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid transformers format: value for transformer name is not an array."];
    id v15 = 0;
  }

  return v15;
}

- (id)transformersForFeatureExtractorsFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F8D620]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v19);
        uint64_t v15 = [(PHAPrivateFederatedLearningTransformersDecoder *)self instancesForTransformerConfigList:v14 error:a4];
        if (!v15)
        {

          id v17 = 0;
          goto LABEL_11;
        }
        v16 = (void *)v15;
        [v7 addFeatureTransformers:v15 forFeatureExtractorName:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = v7;
LABEL_11:

  return v17;
}

- (PHAPrivateFederatedLearningTransformersDecoder)init
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningTransformersDecoder;
  v2 = [(PHAPrivateFederatedLearningTransformersDecoder *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F8D610] name];
    v13[0] = v3;
    v14[0] = objc_opt_class();
    v4 = [MEMORY[0x1E4F8D618] name];
    v13[1] = v4;
    v14[1] = objc_opt_class();
    v5 = [MEMORY[0x1E4F8D600] name];
    v13[2] = v5;
    void v14[2] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F8D5F0] name];
    v13[3] = v6;
    v14[3] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F8D5F8] name];
    v13[4] = v7;
    v14[4] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F8D608] name];
    v13[5] = v8;
    v14[5] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
    transformerNameToClass = v2->_transformerNameToClass;
    v2->_transformerNameToClass = (NSDictionary *)v9;
  }
  return v2;
}

@end