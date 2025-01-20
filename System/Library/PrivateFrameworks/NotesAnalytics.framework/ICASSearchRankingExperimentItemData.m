@interface ICASSearchRankingExperimentItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASRankingStrategyType)rankingStrategyType;
- (ICASSearchRankingExperimentItemData)initWithRankingStrategyType:(id)a3 rank:(id)a4;
- (NSNumber)rank;
- (id)toDict;
@end

@implementation ICASSearchRankingExperimentItemData

- (ICASSearchRankingExperimentItemData)initWithRankingStrategyType:(id)a3 rank:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASSearchRankingExperimentItemData;
  v9 = [(ICASSearchRankingExperimentItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rankingStrategyType, a3);
    objc_storeStrong((id *)&v10->_rank, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"SearchRankingExperimentItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"rankingStrategyType";
  v3 = [(ICASSearchRankingExperimentItemData *)self rankingStrategyType];
  if (v3)
  {
    uint64_t v4 = [(ICASSearchRankingExperimentItemData *)self rankingStrategyType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"rank";
  v12[0] = v4;
  v6 = [(ICASSearchRankingExperimentItemData *)self rank];
  if (v6)
  {
    uint64_t v7 = [(ICASSearchRankingExperimentItemData *)self rank];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (ICASRankingStrategyType)rankingStrategyType
{
  return self->_rankingStrategyType;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_rankingStrategyType, 0);
}

@end