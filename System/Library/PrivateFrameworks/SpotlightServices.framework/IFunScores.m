@interface IFunScores
- (IFunScores)initWithSFEngagementSignal:(id)a3;
- (NSDictionary)domainScores;
- (NSNumber)localScore;
- (NSNumber)serverScore;
- (void)setDomainScores:(id)a3;
- (void)setLocalScore:(id)a3;
- (void)setServerScore:(id)a3;
@end

@implementation IFunScores

- (IFunScores)initWithSFEngagementSignal:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)IFunScores;
  v5 = [(IFunScores *)&v30 init];
  if (v4)
  {
    uint64_t v6 = [v4 serverScore];
    serverScore = v5->_serverScore;
    v5->_serverScore = (NSNumber *)v6;

    uint64_t v8 = [v4 localScore];
    localScore = v5->_localScore;
    v5->_localScore = (NSNumber *)v8;

    v10 = [v4 domainEngagementScores];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v4;
      v13 = [v4 domainEngagementScores];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ([v18 domain])
            {
              v19 = [v18 score];

              if (v19)
              {
                v20 = [v18 score];
                v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v18, "domain"));
                [v12 setObject:v20 forKeyedSubscript:v21];
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v15);
      }

      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v12];
      domainScores = v5->_domainScores;
      v5->_domainScores = (NSDictionary *)v22;

      id v4 = v25;
    }
  }

  return v5;
}

- (NSNumber)serverScore
{
  return self->_serverScore;
}

- (void)setServerScore:(id)a3
{
}

- (NSNumber)localScore
{
  return self->_localScore;
}

- (void)setLocalScore:(id)a3
{
}

- (NSDictionary)domainScores
{
  return self->_domainScores;
}

- (void)setDomainScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainScores, 0);
  objc_storeStrong((id *)&self->_localScore, 0);
  objc_storeStrong((id *)&self->_serverScore, 0);
}

@end