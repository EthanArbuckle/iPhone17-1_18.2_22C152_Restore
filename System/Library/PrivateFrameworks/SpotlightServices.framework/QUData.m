@interface QUData
- (NSSet)intentBundleIds;
- (NSString)intentLabel;
- (QUData)initWithQueryContext:(id)a3;
- (float)intentScore;
@end

@implementation QUData

- (QUData)initWithQueryContext:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)QUData;
  v5 = [(QUData *)&v24 init];
  if (v5)
  {
    int v6 = _os_feature_enabled_impl();
    if (v4)
    {
      if (v6)
      {
        v7 = [v4 queryUnderstandingOutput];
        unint64_t v8 = [v7 count];

        if (v8 >= 2)
        {
          v9 = [v4 queryUnderstandingOutput];
          v10 = [v9 objectForKeyedSubscript:@"kQPQUIntentIds"];

          v11 = [v4 queryUnderstandingOutput];
          v12 = [v11 objectForKeyedSubscript:@"kQPQUIntentLabels"];

          v13 = [v4 queryUnderstandingOutput];
          v14 = [v13 objectForKeyedSubscript:@"kQPQUIntentScores"];

          v15 = [v10 firstObject];
          int v16 = [v15 intValue];

          if (v16 >= 1)
          {
            uint64_t v17 = [v12 firstObject];
            intentLabel = v5->_intentLabel;
            v5->_intentLabel = (NSString *)v17;

            v19 = [v14 firstObject];
            [v19 floatValue];
            v5->_intentScore = v20;

            if (v5->_intentLabel)
            {
              uint64_t v21 = +[SSRankingManager bundleIDSetsForQUIntent:](SSRankingManager, "bundleIDSetsForQUIntent:");
              intentBundleIds = v5->_intentBundleIds;
              v5->_intentBundleIds = (NSSet *)v21;
            }
          }
        }
      }
    }
  }

  return v5;
}

- (NSString)intentLabel
{
  return self->_intentLabel;
}

- (float)intentScore
{
  return self->_intentScore;
}

- (NSSet)intentBundleIds
{
  return self->_intentBundleIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentBundleIds, 0);
  objc_storeStrong((id *)&self->_intentLabel, 0);
}

@end