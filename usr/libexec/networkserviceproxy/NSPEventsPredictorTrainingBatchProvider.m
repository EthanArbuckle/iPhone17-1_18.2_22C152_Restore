@interface NSPEventsPredictorTrainingBatchProvider
- (NSArray)inputShape;
- (NSArray)targetShape;
- (NSArray)trainingData;
- (id)featuresAtIndex:(int64_t)a3;
- (id)init:(id)a3 inputShape:(id)a4 targetShape:(id)a5;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setInputShape:(id)a3;
- (void)setTargetShape:(id)a3;
- (void)setTrainingData:(id)a3;
@end

@implementation NSPEventsPredictorTrainingBatchProvider

- (id)featuresAtIndex:(int64_t)a3
{
  v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134217984;
    v17 = (const char *)a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "featureAtIndex: %ld Begin", (uint8_t *)&v16, 0xCu);
  }

  v6 = [(NSArray *)self->_inputShape objectAtIndexedSubscript:1];
  unsigned int v7 = [v6 unsignedIntValue];

  v8 = +[NSPCoreData prepareMLData:self->_trainingData startAt:a3 dataShape:self->_inputShape];
  if (v8)
  {
    +[NSPCoreData printMLMultiArray:v8];
    v9 = +[NSPCoreData normalizeData:v8];
    if (v9)
    {
      +[NSPCoreData printMLMultiArray:v9];
      v10 = +[NSPCoreData prepareMLData:self->_trainingData startAt:v7 + a3 dataShape:self->_targetShape];
      +[NSPCoreData printMLMultiArray:v10];
      v11 = +[NSPCoreData normalizeData:v10];
      if (v11)
      {
        +[NSPCoreData printMLMultiArray:v11];
        v12 = nplog_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 134217984;
          v17 = (const char *)a3;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "featureAtIndex: %ld End ", (uint8_t *)&v16, 0xCu);
        }

        v13 = [[NSPEventsPredictorTrainingInput alloc] initWithLstm_input:v9 sequential_TimeDistributedDense_dense_BiasAdd_true:v11];
      }
      else
      {
        v15 = nplog_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          int v16 = 136315138;
          v17 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null normalizedNextEvent", (uint8_t *)&v16, 0xCu);
        }

        v13 = 0;
      }
    }
    else
    {
      v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315138;
        v17 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s called with null normalizedPrevEvents", (uint8_t *)&v16, 0xCu);
      }
      v13 = 0;
    }
  }
  else
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      v17 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null prevEvents", (uint8_t *)&v16, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (id)init:(id)a3 inputShape:(id)a4 targetShape:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 count];
  if (v11 == [v10 count])
  {
    v12 = [v9 lastObject];
    v13 = [v10 lastObject];

    if (v12 != v13)
    {
      v14 = nplog_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [v9 lastObject];
        int v16 = [v10 lastObject];
        *(_DWORD *)buf = 138412546;
        id v30 = v15;
        __int16 v31 = 2112;
        id v32 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "The targetShape and inputShape not compatible (%@ vs %@)", buf, 0x16u);
      }
      goto LABEL_6;
    }
    id v19 = [v8 count];
    v20 = [v9 objectAtIndexedSubscript:1];
    uint64_t v21 = [v20 unsignedIntValue] + 1;

    if (v19 != (id)v21)
    {
      v28.receiver = self;
      v28.super_class = (Class)NSPEventsPredictorTrainingBatchProvider;
      v25 = [(NSPEventsPredictorTrainingBatchProvider *)&v28 init];
      [(NSPEventsPredictorTrainingBatchProvider *)v25 setTrainingData:v8];
      [(NSPEventsPredictorTrainingBatchProvider *)v25 setInputShape:v9];
      [(NSPEventsPredictorTrainingBatchProvider *)v25 setTargetShape:v10];
      v26 = (char *)[v8 count];
      v27 = [v9 objectAtIndexedSubscript:1];
      -[NSPEventsPredictorTrainingBatchProvider setCount:](v25, "setCount:", &v26[~(unint64_t)[v27 unsignedIntValue]]);

      self = v25;
      v17 = self;
      goto LABEL_7;
    }
    v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v30 = [v8 count];
      v22 = "Insufficient number of NSP events for training %lu";
      v23 = v14;
      uint32_t v24 = 12;
LABEL_13:
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    }
  }
  else
  {
    v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      id v30 = [v9 count];
      __int16 v31 = 2048;
      id v32 = [v10 count];
      v22 = "The targetShape dimensions not same as inputShape dimensions. (%lu vs %lu)";
      v23 = v14;
      uint32_t v24 = 22;
      goto LABEL_13;
    }
  }
LABEL_6:

  v17 = 0;
LABEL_7:

  return v17;
}

- (NSArray)trainingData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrainingData:(id)a3
{
}

- (NSArray)inputShape
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputShape:(id)a3
{
}

- (NSArray)targetShape
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetShape:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetShape, 0);
  objc_storeStrong((id *)&self->_inputShape, 0);

  objc_storeStrong((id *)&self->_trainingData, 0);
}

@end