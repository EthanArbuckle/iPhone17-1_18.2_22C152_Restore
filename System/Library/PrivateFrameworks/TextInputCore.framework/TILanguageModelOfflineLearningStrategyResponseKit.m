@interface TILanguageModelOfflineLearningStrategyResponseKit
- (BOOL)learnMessages:(id)a3 withRecipientRecords:(id)a4;
- (TILanguageModelOfflineLearningStrategyResponseKit)initWithClientIdentifier:(id)a3 andDirectory:(id)a4;
- (TILanguageModelOfflineLearningTask)learningTask;
- (id)filterMessages:(id)a3;
- (id)messagesClusteredByRecipient:(id)a3;
- (void)didFinishLearning;
@end

@implementation TILanguageModelOfflineLearningStrategyResponseKit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learningTask, 0);
  objc_storeStrong((id *)&self->_trainer, 0);
  objc_storeStrong((id *)&self->_directory, 0);

  objc_storeStrong((id *)&self->_recipientModels, 0);
}

- (TILanguageModelOfflineLearningTask)learningTask
{
  return (TILanguageModelOfflineLearningTask *)objc_getProperty(self, a2, 32, 1);
}

- (void)didFinishLearning
{
  v3 = [(TILanguageModelOfflineLearningStrategyResponseKit *)self learningTask];
  char v4 = [v3 isCancelled];

  if ((v4 & 1) == 0)
  {
    trainer = self->_trainer;
    [(RKMessageResponseManager *)trainer flushDynamicData];
  }
}

- (id)filterMessages:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 date];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__TILanguageModelOfflineLearningStrategyResponseKit_filterMessages___block_invoke;
  v10[3] = &unk_1E6E2D9F0;
  id v11 = v5;
  id v6 = v5;
  v7 = [v4 indexesOfObjectsPassingTest:v10];
  v8 = [v4 objectsAtIndexes:v7];

  return v8;
}

BOOL __68__TILanguageModelOfflineLearningStrategyResponseKit_filterMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 body];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 dateSent];
    v7 = [v6 laterDate:*(void *)(a1 + 32)];
    BOOL v8 = v7 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)learnMessages:(id)a3 withRecipientRecords:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(TILanguageModelOfflineLearningStrategyResponseKit *)self messagesClusteredByRecipient:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v6 objectForKey:v12];
        v14 = [v13 objectForKey:@"compositeName"];
        if (v14)
        {
          v15 = [(NSMutableDictionary *)self->_recipientModels objectForKey:v14];
          if (!v15)
          {
            v15 = [[TIRecipientModel alloc] initWithCompositeName:v14 andTrainer:self->_trainer];
            [(NSMutableDictionary *)self->_recipientModels setObject:v15 forKey:v14];
          }
          v16 = [v7 objectForKey:v12];
          [(TIRecipientModel *)v15 handleMessages:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return 1;
}

- (id)messagesClusteredByRecipient:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "recipient", (void)v14);
        if (v11)
        {
          uint64_t v12 = [v4 objectForKey:v11];
          if (!v12)
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
            [v4 setObject:v12 forKey:v11];
          }
          [v12 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (TILanguageModelOfflineLearningStrategyResponseKit)initWithClientIdentifier:(id)a3 andDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TILanguageModelOfflineLearningStrategyResponseKit;
  uint64_t v8 = [(TILanguageModelOfflineLearningStrategyResponseKit *)&v16 init];
  if (v8)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recipientModels = v8->_recipientModels;
    v8->_recipientModels = v9;

    uint64_t v11 = +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:v6 oneTimeTask:0];
    learningTask = v8->_learningTask;
    v8->_learningTask = (TILanguageModelOfflineLearningTask *)v11;

    objc_storeStrong((id *)&v8->_directory, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F962A8]) initWithDynamicDataURL:v8->_directory];
    trainer = v8->_trainer;
    v8->_trainer = (RKMessageResponseManager *)v13;
  }
  return v8;
}

@end