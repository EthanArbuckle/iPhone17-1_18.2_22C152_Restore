@interface RangeBiasEstimatorModelDataTransformer
- (MLModel)dataTransformerModel;
- (RangeBiasEstimatorModelDataTransformer)initWithContentsOfURL:(id)a3;
- (id)applyTransformation:(id)a3;
@end

@implementation RangeBiasEstimatorModelDataTransformer

- (RangeBiasEstimatorModelDataTransformer)initWithContentsOfURL:(id)a3
{
  id v4 = a3;
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bias-est, Initializing RangeBiasEstimatorModelDataTransformer", buf, 2u);
  }
  v20.receiver = self;
  v20.super_class = (Class)RangeBiasEstimatorModelDataTransformer;
  v6 = [(RangeBiasEstimatorModelDataTransformer *)&v20 init];
  if (v6)
  {
    id v19 = 0;
    uint64_t v7 = +[MLModel modelWithContentsOfURL:v4 error:&v19];
    id v8 = v19;
    dataTransformerModel = v6->_dataTransformerModel;
    v6->_dataTransformerModel = (MLModel *)v7;

    if (v8)
    {
      v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_100434B54((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      if (v6->_dataTransformerModel)
      {
        v17 = v6;
        goto LABEL_11;
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_100434B20();
      }
    }
    v17 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)applyTransformation:(id)a3
{
  id v4 = a3;
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bias-est, Apply standardization on data", buf, 2u);
  }
  dataTransformerModel = self->_dataTransformerModel;
  id v22 = 0;
  uint64_t v7 = [(MLModel *)dataTransformerModel predictionFromFeatures:v4 error:&v22];
  id v8 = v22;
  v9 = v8;
  if (!v7 || v8)
  {
    uint64_t v14 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100434BC0((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v13 = 0;
  }
  else
  {
    v10 = [v7 featureValueForName:@"transformed_features"];
    uint64_t v11 = [RangeBiasEstimatorInput alloc];
    uint64_t v12 = [v10 multiArrayValue];
    uint64_t v13 = [(RangeBiasEstimatorInput *)v11 initWithData:v12];
  }

  return v13;
}

- (MLModel)dataTransformerModel
{
  return self->_dataTransformerModel;
}

- (void).cxx_destruct
{
}

@end