@interface NSPEventsPredictorTrainingInput
- (MLMultiArray)lstm_input;
- (MLMultiArray)sequential_TimeDistributedDense_dense_BiasAdd_true;
- (NSPEventsPredictorTrainingInput)initWithLstm_input:(id)a3 sequential_TimeDistributedDense_dense_BiasAdd_true:(id)a4;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setLstm_input:(id)a3;
- (void)setSequential_TimeDistributedDense_dense_BiasAdd_true:(id)a3;
@end

@implementation NSPEventsPredictorTrainingInput

- (NSPEventsPredictorTrainingInput)initWithLstm_input:(id)a3 sequential_TimeDistributedDense_dense_BiasAdd_true:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NSPEventsPredictorTrainingInput;
  v9 = [(NSPEventsPredictorTrainingInput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lstm_input, a3);
    objc_storeStrong((id *)&v10->_sequential_TimeDistributedDense_dense_BiasAdd_true, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10010FD28];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"lstm_input"])
  {
    uint64_t v5 = [(NSPEventsPredictorTrainingInput *)self lstm_input];
LABEL_5:
    v6 = (void *)v5;
    id v7 = +[MLFeatureValue featureValueWithMultiArray:v5];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"sequential/TimeDistributedDense/dense/BiasAdd_true"])
  {
    uint64_t v5 = [(NSPEventsPredictorTrainingInput *)self sequential_TimeDistributedDense_dense_BiasAdd_true];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (MLMultiArray)lstm_input
{
  return self->_lstm_input;
}

- (void)setLstm_input:(id)a3
{
}

- (MLMultiArray)sequential_TimeDistributedDense_dense_BiasAdd_true
{
  return self->_sequential_TimeDistributedDense_dense_BiasAdd_true;
}

- (void)setSequential_TimeDistributedDense_dense_BiasAdd_true:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequential_TimeDistributedDense_dense_BiasAdd_true, 0);

  objc_storeStrong((id *)&self->_lstm_input, 0);
}

@end