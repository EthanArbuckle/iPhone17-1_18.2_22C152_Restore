@interface SignpostImageQueueSampleEvent
- (SignpostImageQueueSampleEvent)initWithImageQueueSampleEvent:(id)a3;
- (double)serverSamplingTime;
- (unsigned)frameSeed;
- (unsigned)queueGeneration;
- (unsigned)queueID;
- (unsigned)surfaceID;
@end

@implementation SignpostImageQueueSampleEvent

- (SignpostImageQueueSampleEvent)initWithImageQueueSampleEvent:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SignpostImageQueueSampleEvent;
  v5 = [(SignpostImageQueueSampleEvent *)&v45 init];
  if (!v5) {
    goto LABEL_7;
  }
  v5->_queueID = [v4 signpostId];
  v6 = [v4 _numberArgumentWithName:@"surfaceID"];
  if (!v6)
  {
    v15 = _signpost_debug_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_16;
  }
  v7 = v6;
  v5->_surfaceID = [v6 unsignedLongLongValue];

  v8 = [v4 _numberArgumentWithName:@"serverSamplingTime"];
  if (!v8)
  {
    v15 = _signpost_debug_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:](v15, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_16;
  }
  v9 = v8;
  v5->_serverSamplingTime = (double)(unint64_t)[v8 unsignedLongLongValue];

  v10 = [v4 _numberArgumentWithName:@"queueGeneration"];
  if (!v10)
  {
    v15 = _signpost_debug_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:](v15, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_16;
  }
  v11 = v10;
  v5->_queueGeneration = [v10 unsignedLongLongValue];

  v12 = [v4 _numberArgumentWithName:@"updateSeed"];
  if (!v12)
  {
    v15 = _signpost_debug_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:].cold.4(v15, v37, v38, v39, v40, v41, v42, v43);
    }
LABEL_16:

    v14 = 0;
    goto LABEL_17;
  }
  v13 = v12;
  v5->_frameSeed = [v12 unsignedLongLongValue];

LABEL_7:
  v14 = v5;
LABEL_17:

  return v14;
}

- (unsigned)queueID
{
  return self->_queueID;
}

- (unsigned)surfaceID
{
  return self->_surfaceID;
}

- (double)serverSamplingTime
{
  return self->_serverSamplingTime;
}

- (unsigned)queueGeneration
{
  return self->_queueGeneration;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithImageQueueSampleEvent:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end