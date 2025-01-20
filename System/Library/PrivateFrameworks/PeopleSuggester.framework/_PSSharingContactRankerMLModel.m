@interface _PSSharingContactRankerMLModel
- (MLModel)mlModel;
- (NSDictionary)metadata;
- (_PSSharingContactRankerMLModel)initWithMLModel:(id)a3 scoreThreshold:(double)a4;
- (_PSSharingContactRankerMLModel)initWithScoreThreshold:(double)a3;
- (double)scoreThreshold;
- (id)giveModelDescription;
- (id)scoresOnFeatures:(id)a3;
- (void)loadDefaultModel;
- (void)setMetadata:(id)a3;
- (void)setMlModel:(id)a3;
- (void)setScoreThreshold:(double)a3;
@end

@implementation _PSSharingContactRankerMLModel

- (_PSSharingContactRankerMLModel)initWithMLModel:(id)a3 scoreThreshold:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PSSharingContactRankerMLModel;
  v7 = [(_PSSharingContactRankerMLModel *)&v14 init];
  v8 = v7;
  if (v7)
  {
    [(_PSSharingContactRankerMLModel *)v7 setMlModel:v6];
    v9 = [(_PSSharingContactRankerMLModel *)v8 mlModel];
    v10 = [v9 modelDescription];
    v11 = [v10 metadata];
    v12 = [v11 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
    [(_PSSharingContactRankerMLModel *)v8 setMetadata:v12];

    [(_PSSharingContactRankerMLModel *)v8 setScoreThreshold:a4];
  }

  return v8;
}

- (_PSSharingContactRankerMLModel)initWithScoreThreshold:(double)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_PSSharingContactRankerMLModel;
  v4 = [(_PSSharingContactRankerMLModel *)&v12 init];
  v5 = v4;
  if (v4)
  {
    [(_PSSharingContactRankerMLModel *)v4 setMlModel:0];
    [(_PSSharingContactRankerMLModel *)v5 loadDefaultModel];
    [(_PSSharingContactRankerMLModel *)v5 setScoreThreshold:a3];
    [(_PSSharingContactRankerMLModel *)v5 setMetadata:0];
    id v6 = [(_PSSharingContactRankerMLModel *)v5 mlModel];

    if (v6)
    {
      v7 = [(_PSSharingContactRankerMLModel *)v5 mlModel];
      v8 = [v7 modelDescription];
      v9 = [v8 metadata];
      v10 = [v9 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
      [(_PSSharingContactRankerMLModel *)v5 setMetadata:v10];
    }
  }
  return v5;
}

- (void)loadDefaultModel
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "_PSSharingContactRankerMLModel - loadDefaultModel", v1, 2u);
}

- (id)giveModelDescription
{
  return [(MLModel *)self->_mlModel modelDescription];
}

- (id)scoresOnFeatures:(id)a3
{
  id v4 = a3;
  v5 = [(_PSSharingContactRankerMLModel *)self mlModel];
  id v6 = +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:v5 featureArrayDict:v4];

  return v6;
}

- (double)scoreThreshold
{
  return self->_scoreThreshold;
}

- (void)setScoreThreshold:(double)a3
{
  self->_scoreThreshold = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (MLModel)mlModel
{
  return (MLModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMlModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlModel, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end