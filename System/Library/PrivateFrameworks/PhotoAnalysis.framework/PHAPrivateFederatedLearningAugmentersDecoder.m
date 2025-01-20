@interface PHAPrivateFederatedLearningAugmentersDecoder
- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5;
- (NSDictionary)augmenterNameToClass;
- (PHAPrivateFederatedLearningAugmentersDecoder)init;
- (id)augmentersFromArray:(id)a3 error:(id *)a4;
- (id)instanceForAugmenterConfig:(id)a3 error:(id *)a4;
@end

@implementation PHAPrivateFederatedLearningAugmentersDecoder

- (void).cxx_destruct
{
}

- (NSDictionary)augmenterNameToClass
{
  return self->_augmenterNameToClass;
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
    v11 = [v7 errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningAugmentersDecoder" code:a4 userInfo:v10];

    *a3 = v11;
  }
  return 0;
}

- (id)instanceForAugmenterConfig:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(PHAPrivateFederatedLearningAugmentersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid transformers format: transformer configuration is not dictionary."];
    v11 = 0;
    goto LABEL_13;
  }
  v7 = [v6 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(PHAPrivateFederatedLearningAugmentersDecoder *)self augmenterNameToClass];
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
        [(PHAPrivateFederatedLearningAugmentersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid augmenter format: augmenter parameters is not an array."];
        v11 = 0;
      }

      goto LABEL_12;
    }
    v12 = [NSString stringWithFormat:@"Augmenter not supported: %@", v7];
    [(PHAPrivateFederatedLearningAugmentersDecoder *)self _generateError:a4 errorCode:0 errorMessage:v12];
  }
  else
  {
    [(PHAPrivateFederatedLearningAugmentersDecoder *)self _generateError:a4 errorCode:1 errorMessage:@"Invalid augmenter format: augmneter name is not a string."];
  }
  v11 = 0;
LABEL_12:

LABEL_13:

  return v11;
}

- (id)augmentersFromArray:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
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
        uint64_t v13 = -[PHAPrivateFederatedLearningAugmentersDecoder instanceForAugmenterConfig:error:](self, "instanceForAugmenterConfig:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4, (void)v17);
        if (!v13)
        {

          id v15 = 0;
          goto LABEL_11;
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
LABEL_11:

  return v15;
}

- (PHAPrivateFederatedLearningAugmentersDecoder)init
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PHAPrivateFederatedLearningAugmentersDecoder;
  v2 = [(PHAPrivateFederatedLearningAugmentersDecoder *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F8D400] name];
    v9[0] = v3;
    v10[0] = objc_opt_class();
    v4 = [MEMORY[0x1E4F8D408] name];
    v9[1] = v4;
    v10[1] = objc_opt_class();
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    augmenterNameToClass = v2->_augmenterNameToClass;
    v2->_augmenterNameToClass = (NSDictionary *)v5;
  }
  return v2;
}

@end