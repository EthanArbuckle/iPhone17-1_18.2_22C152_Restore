@interface RTVisitModelControllerBatchMode
- (RTVisitModelControllerBatchMode)init;
- (RTVisitModelControllerBatchMode)initWithHyperParameter:(id)a3;
- (RTVisitTrajectorySequenceClassifierBatchMode)model;
- (const)batchProcess:(const float *)a3 featureVectorStride:(unint64_t)a4 firstSequenceIndex:(unint64_t)a5 firstSequenceLength:(unint64_t)a6 batchSize:(unint64_t)a7;
- (const)predictFromInput:(const float *)a3 featureVectorStride:(unint64_t)a4 firstSequenceIndex:(unint64_t)a5 firstSequenceLength:(unint64_t)a6 batchSize:(unint64_t)a7;
- (void)dealloc;
@end

@implementation RTVisitModelControllerBatchMode

- (RTVisitModelControllerBatchMode)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_);
}

- (RTVisitModelControllerBatchMode)initWithHyperParameter:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
    }

    goto LABEL_47;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTVisitModelControllerBatchMode;
  v6 = [(RTVisitModelControllerBatchMode *)&v21 init];
  self = v6;
  if (!v6) {
    goto LABEL_49;
  }
  objc_storeStrong((id *)&v6->_hyperParameter, a3);
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if (context
    || (v8 = (void *)espresso_create_context(), (self->_espressoContext = v8) != 0)
    || (v9 = (void *)espresso_create_context(), (self->_espressoContext = v9) != 0))
  {
    v10 = [MEMORY[0x1E4F28CB8] frameworkBundle];
    v11 = [v10 pathForResource:@"RTVisitTrajectorySequenceClassifierBatchMode" ofType:@"mlmodelc"];

    if (v11)
    {
      v12 = [v11 stringByAppendingPathComponent:@"model.batched.espresso.net"];
      if (!v12)
      {
        v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: espressoNetFile", buf, 2u);
        }
        goto LABEL_46;
      }
      v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = @"RTVisitTrajectorySequenceClassifierBatchMode";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "loading model, %@ from espresso net, %@", buf, 0x16u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      plan = (void *)espresso_create_plan();
      self->_espressoPlan = plan;
      if (!plan)
      {
        v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _espressoPlan", v22, 2u);
        }
        goto LABEL_45;
      }
      v15 = v12;
      [v15 UTF8String];
      if (espresso_plan_add_network())
      {
        v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
      if (espresso_plan_build())
      {
        v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
        goto LABEL_45;
      }
      if (espresso_network_bind_buffer())
      {
        v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
        goto LABEL_45;
      }
      if (espresso_network_bind_buffer())
      {
        v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
        goto LABEL_45;
      }
      if ([v5 onDeviceInferenceBatchSize] > self->_inputBuffer.batch_number)
      {
        v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter.onDeviceInferenceBatchSize <= _inputBuffer.batch_number", v22, 2u);
        }
        goto LABEL_45;
      }

LABEL_49:
      self = self;
      v19 = self;
      goto LABEL_50;
    }
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: modelPath", buf, 2u);
    }
  }
  else
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _espressoContext", buf, 2u);
    }
  }

LABEL_47:
  v19 = 0;
LABEL_50:

  return v19;
}

- (void)dealloc
{
  if (self->_espressoPlan && espresso_plan_destroy())
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "fail to destroy espresso plan", buf, 2u);
    }
  }
  if (self->_espressoContext && espresso_context_destroy())
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "fail to destroy espresso context", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)RTVisitModelControllerBatchMode;
  [(RTVisitModelControllerBatchMode *)&v5 dealloc];
}

- (const)batchProcess:(const float *)a3 featureVectorStride:(unint64_t)a4 firstSequenceIndex:(unint64_t)a5 firstSequenceLength:(unint64_t)a6 batchSize:(unint64_t)a7
{
  if (self->_inputBuffer.batch_number < a7)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      return 0;
    }
    __int16 v30 = 0;
    v8 = "Invalid parameter not satisfying: batchSize <= _inputBuffer.batch_number";
    v9 = (uint8_t *)&v30;
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    goto LABEL_15;
  }
  memset(self->_inputBuffer.data, [(RTVisitHyperParameter *)self->_hyperParameter featurePaddingValue], 4 * self->_inputBuffer.stride_sequence_length);
  data = (const float *)self->_inputBuffer.data;
  if (a7)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 4 * a4;
    __src = &a3[a5];
    while (1)
    {
      unint64_t v19 = a6
          + [(RTVisitHyperParameter *)self->_hyperParameter visitInferenceResolution] * v17;
      unint64_t width = self->_inputBuffer.width;
      unint64_t v21 = width - v19;
      if (width < v19) {
        break;
      }
      unint64_t stride_batch_number = self->_inputBuffer.stride_batch_number;
      if ([(RTVisitHyperParameter *)self->_hyperParameter featureDimension])
      {
        unint64_t v23 = 0;
        unint64_t v24 = v21 + stride_batch_number * v17;
        size_t v25 = 4 * v19;
        v26 = __src;
        do
        {
          memcpy((void *)&data[v24], v26, v25);
          v24 += self->_inputBuffer.stride_channels;
          ++v23;
          v26 = (const float *)((char *)v26 + v18);
        }
        while (v23 < [(RTVisitHyperParameter *)self->_hyperParameter featureDimension]);
      }
      if (++v17 == a7) {
        return data;
      }
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v8 = "Invalid parameter not satisfying: batchSequenceLength <= _inputBuffer.width";
    v9 = buf;
    goto LABEL_14;
  }
  return data;
}

- (const)predictFromInput:(const float *)a3 featureVectorStride:(unint64_t)a4 firstSequenceIndex:(unint64_t)a5 firstSequenceLength:(unint64_t)a6 batchSize:(unint64_t)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(RTVisitModelControllerBatchMode *)self batchProcess:a3 featureVectorStride:a4 firstSequenceIndex:a5 firstSequenceLength:a6 batchSize:a7])
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15[0]) = 0;
      v11 = "Invalid parameter not satisfying: inputPtr";
      v12 = v10;
      uint32_t v13 = 2;
      goto LABEL_10;
    }
LABEL_6:

    return 0;
  }
  int v8 = espresso_plan_execute_sync();
  if (v8)
  {
    int v9 = v8;
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = v9;
      v11 = "fail to predict with error, %d";
      v12 = v10;
      uint32_t v13 = 8;
LABEL_10:
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)v15, v13);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  return (const float *)self->_outputBuffer.data;
}

- (RTVisitTrajectorySequenceClassifierBatchMode)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_hyperParameter, 0);
}

@end