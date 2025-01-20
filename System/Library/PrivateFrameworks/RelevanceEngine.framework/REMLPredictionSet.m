@interface REMLPredictionSet
- (REMLPrediction)prediction;
- (REMLPredictionSet)initWithPrediction:(id)a3;
- (REMLPredictionSet)initWithPrediction:(id)a3 predictionMap:(id)a4;
- (id)predictionForKey:(id)a3;
@end

@implementation REMLPredictionSet

- (REMLPredictionSet)initWithPrediction:(id)a3
{
  return [(REMLPredictionSet *)self initWithPrediction:a3 predictionMap:MEMORY[0x263EFFA78]];
}

- (REMLPredictionSet)initWithPrediction:(id)a3 predictionMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMLPredictionSet;
  v9 = [(REMLPredictionSet *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prediction, a3);
    objc_storeStrong((id *)&v10->_predictionsByKey, a4);
  }

  return v10;
}

- (id)predictionForKey:(id)a3
{
  return [(NSDictionary *)self->_predictionsByKey objectForKeyedSubscript:a3];
}

- (REMLPrediction)prediction
{
  return self->_prediction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_predictionsByKey, 0);
}

@end