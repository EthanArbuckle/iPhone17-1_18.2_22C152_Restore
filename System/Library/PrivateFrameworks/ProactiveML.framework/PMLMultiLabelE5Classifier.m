@interface PMLMultiLabelE5Classifier
+ (id)classifierWithE5File:(id)a3;
- (BOOL)initializeNetworkWithE5File:(id)a3;
- (PMLMultiLabelE5Classifier)initWithE5File:(id)a3;
- (id)predict:(id)a3;
- (unint64_t)outputDimension;
- (void)dealloc;
@end

@implementation PMLMultiLabelE5Classifier

- (unint64_t)outputDimension
{
  return self->_outputNumParameters;
}

- (id)predict:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [a3 sparseVectorToDense:self->_input_ids length:self->_inputNumParameters];
  uint64_t v4 = e5rt_execution_stream_execute_sync();
  if (v4)
  {
    v5 = [NSNumber numberWithUnsignedInt:v4];
    v6 = [NSString stringWithUTF8String:e5rt_get_last_error_message()];
    v7 = PML_LogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v13 = 138412546;
      v14 = v5;
      __int16 v15 = 2112;
      v16 = v6;
      _os_log_fault_impl(&dword_2212A0000, v7, OS_LOG_TYPE_FAULT, "Unable to execute E5 stream w/ error code %@: %@", (uint8_t *)&v13, 0x16u);
    }

    v8 = 0;
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_outputNumParameters];
    if (self->_outputNumParameters)
    {
      unint64_t v10 = 0;
      do
      {
        *(float *)&double v9 = self->_output_scores[v10];
        v11 = [NSNumber numberWithFloat:v9];
        [v8 setObject:v11 atIndexedSubscript:v10];

        ++v10;
      }
      while (v10 < self->_outputNumParameters);
    }
  }
  return v8;
}

- (BOOL)initializeNetworkWithE5File:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v4 = (__CFString *)a3;
  v5 = PML_LogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 138412290;
    v46 = v4;
    _os_log_impl(&dword_2212A0000, v5, OS_LOG_TYPE_DEFAULT, "Initializing E5 model using %@", (uint8_t *)&v45, 0xCu);
  }

  v6 = v4;
  [(__CFString *)v6 UTF8String];
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    v8 = PML_LogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v8, OS_LOG_TYPE_ERROR, "Failed to create execution stream operation", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)last_error_message;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  [@"inputSequence" UTF8String];
  if (e5rt_execution_stream_operation_retain_input_port())
  {
    uint64_t v11 = e5rt_get_last_error_message();
    v12 = PML_LogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412290;
      v46 = @"inputSequence";
      _os_log_error_impl(&dword_2212A0000, v12, OS_LOG_TYPE_ERROR, "Failed to retain handle to input port %@", (uint8_t *)&v45, 0xCu);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v11;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    uint64_t v13 = e5rt_get_last_error_message();
    v14 = PML_LogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v14, OS_LOG_TYPE_ERROR, "Unable to retain E5 input tensor descriptor", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v13;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_tensor_desc_retain_dtype())
  {
    uint64_t v15 = e5rt_get_last_error_message();
    v16 = PML_LogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v16, OS_LOG_TYPE_ERROR, "Unable to retain E5 input tensor dtype", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v15;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  int v21 = DescribeTensorDescriptor([@"inputSequence" UTF8String]);
  if (v21 == -1)
  {
    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    LOWORD(v45) = 0;
    unint64_t v10 = "Something went wrong while trying to introspect the E5 input tensor";
    goto LABEL_35;
  }
  self->_inputNumParameters = v21;
  if (e5rt_tensor_desc_alloc_buffer_object())
  {
    uint64_t v22 = e5rt_get_last_error_message();
    v23 = PML_LogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v23, OS_LOG_TYPE_ERROR, "Unable to allocate E5 input buffer object", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v22;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_bind_buffer_object())
  {
    uint64_t v24 = e5rt_get_last_error_message();
    v25 = PML_LogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v25, OS_LOG_TYPE_ERROR, "Unable to bind E5 input buffer to input port", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v24;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  [@"outputLabels" UTF8String];
  if (e5rt_execution_stream_operation_retain_output_port())
  {
    uint64_t v26 = e5rt_get_last_error_message();
    v27 = PML_LogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v27, OS_LOG_TYPE_ERROR, "Unable to retain E5 output port", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v26;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    uint64_t v28 = e5rt_get_last_error_message();
    v29 = PML_LogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v29, OS_LOG_TYPE_ERROR, "Unable to retain E5 output tensor descriptor", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v28;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_tensor_desc_retain_dtype())
  {
    uint64_t v30 = e5rt_get_last_error_message();
    v31 = PML_LogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v31, OS_LOG_TYPE_ERROR, "Unable to retain E5 output tensor dtype", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v30;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  int v32 = DescribeTensorDescriptor([@"outputLabels" UTF8String]);
  if (v32 == -1)
  {
    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    LOWORD(v45) = 0;
    unint64_t v10 = "Something went wrong while trying to introspect the E5 output tensor";
LABEL_35:
    uint64_t v17 = v9;
    uint32_t v18 = 2;
    goto LABEL_24;
  }
  self->_outputNumParameters = v32;
  if (e5rt_tensor_desc_alloc_buffer_object())
  {
    uint64_t v33 = e5rt_get_last_error_message();
    v34 = PML_LogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v34, OS_LOG_TYPE_ERROR, "Unable to allocate E5 output buffer object", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v33;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_bind_buffer_object())
  {
    uint64_t v35 = e5rt_get_last_error_message();
    v36 = PML_LogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v36, OS_LOG_TYPE_ERROR, "Unable to bind E5 output buffer to output port", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v35;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_execution_stream_create())
  {
    uint64_t v37 = e5rt_get_last_error_message();
    v38 = PML_LogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v38, OS_LOG_TYPE_ERROR, "Unable to create E5 execution handle", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v37;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_execution_stream_encode_operation())
  {
    uint64_t v39 = e5rt_get_last_error_message();
    v40 = PML_LogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v40, OS_LOG_TYPE_ERROR, "Unable to encode E5 execution stream", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v39;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_buffer_object_get_data_ptr())
  {
    uint64_t v41 = e5rt_get_last_error_message();
    v42 = PML_LogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2212A0000, v42, OS_LOG_TYPE_ERROR, "Unable to get data pointer to input buffer", (uint8_t *)&v45, 2u);
    }

    double v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v45 = 136315138;
    v46 = (__CFString *)v41;
    unint64_t v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (!e5rt_buffer_object_get_data_ptr())
  {
    BOOL v19 = 1;
    goto LABEL_26;
  }
  uint64_t v43 = e5rt_get_last_error_message();
  v44 = PML_LogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v45) = 0;
    _os_log_error_impl(&dword_2212A0000, v44, OS_LOG_TYPE_ERROR, "Unable to get data pointer to output buffer", (uint8_t *)&v45, 2u);
  }

  double v9 = PML_LogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    int v45 = 136315138;
    v46 = (__CFString *)v43;
    unint64_t v10 = "E5RT operation failed with message: %s";
LABEL_23:
    uint64_t v17 = v9;
    uint32_t v18 = 12;
LABEL_24:
    _os_log_fault_impl(&dword_2212A0000, v17, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v45, v18);
  }
LABEL_25:

  BOOL v19 = 0;
LABEL_26:

  return v19;
}

- (PMLMultiLabelE5Classifier)initWithE5File:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PMLMultiLabelE5Classifier;
  id v3 = a3;
  uint64_t v4 = [(PMLMultiLabelE5Classifier *)&v8 init];
  BOOL v5 = -[PMLMultiLabelE5Classifier initializeNetworkWithE5File:](v4, "initializeNetworkWithE5File:", v3, v8.receiver, v8.super_class);

  if (v5) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  if (self->_main_esop) {
    e5rt_execution_stream_operation_release();
  }
  if (self->_input_port) {
    e5rt_io_port_release();
  }
  if (self->_input_tensor) {
    e5rt_tensor_desc_release();
  }
  if (self->_input_tensor_dtype) {
    e5rt_tensor_desc_dtype_release();
  }
  if (self->_input_buffer) {
    e5rt_buffer_object_release();
  }
  if (self->_output_port) {
    e5rt_io_port_release();
  }
  if (self->_output_tensor) {
    e5rt_tensor_desc_release();
  }
  if (self->_output_tensor_dtype) {
    e5rt_tensor_desc_dtype_release();
  }
  if (self->_output_buffer) {
    e5rt_buffer_object_release();
  }
  if (self->_execution_stream) {
    e5rt_execution_stream_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)PMLMultiLabelE5Classifier;
  [(PMLMultiLabelE5Classifier *)&v3 dealloc];
}

+ (id)classifierWithE5File:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[PMLMultiLabelE5Classifier alloc] initWithE5File:v3];

  return v4;
}

@end