@interface FCNewsPersonalizationTrainingBiases
+ (id)identifiersForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5;
- (FCNewsPersonalizationTrainingBiases)initWithBiases:(id)a3;
- (NSDictionary)biases;
- (double)biasForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5;
- (id)description;
- (void)setBiases:(id)a3;
@end

@implementation FCNewsPersonalizationTrainingBiases

void __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke_2;
  v6[3] = &unk_1E5B56B28;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

- (FCNewsPersonalizationTrainingBiases)initWithBiases:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCNewsPersonalizationTrainingBiases;
  id v5 = [(FCNewsPersonalizationTrainingBiases *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke;
    v10[3] = &unk_1E5B4BF78;
    id v11 = v4;
    uint64_t v7 = objc_msgSend(v6, "fc_dictionary:", v10);
    biases = v5->_biases;
    v5->_biases = (NSDictionary *)v7;
  }
  return v5;
}

- (void).cxx_destruct
{
}

void __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = [[FCNewsPersonalizationTrainingBias alloc] initWithDictionary:v3];

  if (v6)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [(FCNewsPersonalizationTrainingBias *)v6 identifier];
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
}

+ (id)identifiersForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5
{
  v20[7] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[FCNewsPersonalizationTrainingBias identifierForEventType:v9 feedType:v8 groupType:v7];
  id v11 = +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", v9, 0, v7, v10);
  v20[1] = v11;
  objc_super v12 = +[FCNewsPersonalizationTrainingBias identifierForEventType:v9 feedType:v8 groupType:0];
  v20[2] = v12;
  v13 = +[FCNewsPersonalizationTrainingBias identifierForEventType:0 feedType:v8 groupType:v7];
  v20[3] = v13;
  v14 = +[FCNewsPersonalizationTrainingBias identifierForEventType:v9 feedType:0 groupType:0];

  v20[4] = v14;
  v15 = +[FCNewsPersonalizationTrainingBias identifierForEventType:0 feedType:v8 groupType:0];

  v20[5] = v15;
  v16 = +[FCNewsPersonalizationTrainingBias identifierForEventType:0 feedType:0 groupType:v7];

  v20[6] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:7];
  v18 = objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", &__block_literal_global_104);

  return v18;
}

id __82__FCNewsPersonalizationTrainingBiases_identifiersForEventType_feedType_groupType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (double)biasForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FCNewsPersonalizationTrainingBiases *)self biases];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v13 = +[FCNewsPersonalizationTrainingBiases identifiersForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBiases, "identifiersForEventType:feedType:groupType:", v8, v9, v10, 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    double v15 = 1.0;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v20 = [(FCNewsPersonalizationTrainingBiases *)self biases];
          v21 = [v20 objectForKeyedSubscript:v19];

          if (v21)
          {
            [v21 bias];
            double v15 = v22;

            goto LABEL_12;
          }
        }
        uint64_t v16 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    double v15 = 1.0;
  }

  return v15;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationTrainingBiases *)self biases];
  [v3 appendFormat:@"; biases: %@", v4];

  [v3 appendString:@">"];
  return v3;
}

- (NSDictionary)biases
{
  return self->_biases;
}

- (void)setBiases:(id)a3
{
}

@end