@interface VIE5Runner
+ (int)allocatePort:(e5rt_io_port *)a3 description:(id)a4 io:(id *)a5;
+ (int)getPort:(e5rt_io_port *)a3 description:(id *)a4;
+ (int)surfaceTypeE5rtType:(int)a3 toVIType:(unint64_t *)a4;
+ (int)tensorDTypeE5rtType:(int)a3 toVIType:(unint64_t *)a4;
+ (void)releasePorts:(id)a3 descriptions:(id)a4 boundedIOs:(id)a5 wasBound:(BOOL)a6;
- (NSArray)inputNames;
- (NSArray)outputNames;
- (NSDictionary)boundInputs;
- (NSDictionary)boundOutputs;
- (NSDictionary)inputs;
- (NSDictionary)outputs;
- (NSString)mainFunctionName;
- (NSURL)bundleURL;
- (VIE5Runner)initWithBundleURL:(id)a3 mainFunctionName:(id)a4;
- (__CVBuffer)getInputImageBuffer:(id)a3;
- (id)executeAndGet:(id)a3 error:(id *)a4;
- (int)compileNetworksOnDevice;
- (int)execute;
- (int)initNetworks;
- (int)loadPrecompiledNetwork;
- (void)dealloc;
- (void)releaseNetworks;
@end

@implementation VIE5Runner

- (VIE5Runner)initWithBundleURL:(id)a3 mainFunctionName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VIE5Runner;
  v9 = [(VIE5Runner *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_bundleURL, a3);
    objc_storeStrong((id *)&v10->_mainFunctionName, a4);
    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    outputPorts = v10->_outputPorts;
    v10->_outputPorts = v11;

    *(_WORD *)&v10->_allocateInputs = 257;
    boundInputs = v10->_boundInputs;
    v10->_boundInputs = 0;

    boundOutputs = v10->_boundOutputs;
    v10->_boundOutputs = 0;

    if ([(VIE5Runner *)v10 initNetworks]) {
      v15 = 0;
    }
    else {
      v15 = v10;
    }
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  [(VIE5Runner *)self releaseNetworks];
  v3.receiver = self;
  v3.super_class = (Class)VIE5Runner;
  [(VIE5Runner *)&v3 dealloc];
}

- (__CVBuffer)getInputImageBuffer:(id)a3
{
  objc_super v3 = [(NSDictionary *)self->_boundInputs objectForKeyedSubscript:a3];
  v4 = (__CVBuffer *)[v3 pointerValue];

  return v4;
}

+ (int)surfaceTypeE5rtType:(int)a3 toVIType:(unint64_t *)a4
{
  if (a3 > 5) {
    return 5;
  }
  int result = 0;
  *a4 = a3;
  return result;
}

+ (int)tensorDTypeE5rtType:(int)a3 toVIType:(unint64_t *)a4
{
  if (a3 > 4) {
    return 5;
  }
  int result = 0;
  *a4 = a3;
  return result;
}

+ (int)getPort:(e5rt_io_port *)a3 description:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  __int16 v39 = 0;
  int is_surface = e5rt_io_port_is_surface();
  if (is_surface)
  {
    int v6 = is_surface;
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage])
    {
      id v8 = +[VILogger log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v42 = last_error_message;
LABEL_9:
        _os_log_impl(&dword_1DCCF9000, v8, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    return v6;
  }
  int is_tensor = e5rt_io_port_is_tensor();
  if (!is_tensor)
  {
    if (v39 == HIBYTE(v39))
    {
      if (+[VILogger shouldLogMessage])
      {
        v12 = +[VILogger log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCF9000, v12, OS_LOG_TYPE_ERROR, "VI5ERunner: only surface/tensor ports are supported", buf, 2u);
        }
      }
      return 5;
    }
    uint64_t v38 = 0;
    int v13 = e5rt_io_port_retain_surface_desc();
    if (v13)
    {
      int v6 = v13;
      uint64_t v14 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage]) {
        return v6;
      }
      id v8 = +[VILogger log];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v14;
      goto LABEL_9;
    }
    uint64_t v37 = 0;
    uint64_t v36 = 0;
    int width = e5rt_surface_desc_get_width();
    if (width)
    {
      int v6 = width;
      uint64_t v16 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage]) {
        return v6;
      }
      id v8 = +[VILogger log];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v16;
      goto LABEL_9;
    }
    int height = e5rt_surface_desc_get_height();
    if (height)
    {
      int v6 = height;
      uint64_t v18 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage]) {
        return v6;
      }
      id v8 = +[VILogger log];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v18;
      goto LABEL_9;
    }
    LODWORD(v33) = 0;
    int format = e5rt_surface_desc_get_format();
    if (format)
    {
      int v6 = format;
      uint64_t v20 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage]) {
        return v6;
      }
      id v8 = +[VILogger log];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v20;
      goto LABEL_9;
    }
    uint64_t v35 = 0;
    int plane_count = e5rt_surface_desc_get_plane_count();
    if (plane_count)
    {
      int v6 = plane_count;
      uint64_t v22 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage]) {
        return v6;
      }
      id v8 = +[VILogger log];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v22;
      goto LABEL_9;
    }
    v23 = [NSNumber numberWithUnsignedLong:v36];
    v40[0] = v23;
    v24 = [NSNumber numberWithUnsignedLong:v37];
    v40[1] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];

    uint64_t v34 = 0;
    int v26 = +[VIE5Runner surfaceTypeE5rtType:v33 toVIType:&v34];
    if (v26)
    {
      int v6 = v26;
      uint64_t v27 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage])
      {
LABEL_48:

        return v6;
      }
      v28 = +[VILogger log];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_47:

        goto LABEL_48;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v27;
    }
    else
    {
      uint64_t v29 = v34;
      v30 = [VIE5RunnerPortDesc alloc];
      v31 = (void *)[v25 copy];
      *a4 = [(VIE5RunnerPortDesc *)v30 initWithShape:v31 type:0 dtype:v29 csize:v35 strides:MEMORY[0x1E4F1CBF0]];

      int v6 = e5rt_surface_desc_release();
      if (!v6) {
        goto LABEL_48;
      }
      uint64_t v32 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage]) {
        goto LABEL_48;
      }
      v28 = +[VILogger log];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v32;
    }
    _os_log_impl(&dword_1DCCF9000, v28, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
    goto LABEL_47;
  }
  int v6 = is_tensor;
  uint64_t v10 = e5rt_get_last_error_message();
  if (+[VILogger shouldLogMessage])
  {
    id v8 = +[VILogger log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v10;
      goto LABEL_9;
    }
LABEL_10:
  }
  return v6;
}

+ (int)allocatePort:(e5rt_io_port *)a3 description:(id)a4 io:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 type])
  {
    if ([v6 type] == 1)
    {
      if ([v6 dtype] != 4 && objc_msgSend(v6, "csize") == 4)
      {
        if (+[VILogger shouldLogMessage])
        {
          id v7 = +[VILogger log];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            id v8 = "VI5ERunner: only float32 output tensors are supported at the moment, specify io_bind_info to add conversion ops";
LABEL_25:
            _os_log_impl(&dword_1DCCF9000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      int v21 = e5rt_io_port_retain_tensor_desc();
      if (v21)
      {
        int v17 = v21;
        uint64_t last_error_message = e5rt_get_last_error_message();
        if (+[VILogger shouldLogMessage])
        {
          v19 = +[VILogger log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v37 = last_error_message;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
      }
      else
      {
        int v23 = e5rt_tensor_desc_alloc_buffer_object();
        if (v23)
        {
          int v17 = v23;
          uint64_t v24 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage]) {
            goto LABEL_58;
          }
          v19 = +[VILogger log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v37 = v24;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        int v27 = e5rt_io_port_bind_buffer_object();
        if (v27)
        {
          int v17 = v27;
          uint64_t v28 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage]) {
            goto LABEL_58;
          }
          v19 = +[VILogger log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v37 = v28;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        int data_ptr = e5rt_buffer_object_get_data_ptr();
        if (data_ptr)
        {
          int v17 = data_ptr;
          uint64_t v31 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage]) {
            goto LABEL_58;
          }
          v19 = +[VILogger log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v37 = v31;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        *a5 = [MEMORY[0x1E4F29238] valueWithPointer:0];
        int v32 = e5rt_tensor_desc_release();
        if (v32)
        {
          int v17 = v32;
          uint64_t v33 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage]) {
            goto LABEL_58;
          }
          v19 = +[VILogger log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v37 = v33;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        int v17 = e5rt_buffer_object_release();
        if (v17)
        {
          uint64_t v34 = e5rt_get_last_error_message();
          if (+[VILogger shouldLogMessage])
          {
            v19 = +[VILogger log];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              uint64_t v37 = v34;
              goto LABEL_56;
            }
            goto LABEL_57;
          }
        }
      }
    }
    else
    {
      if (+[VILogger shouldLogMessage])
      {
        uint64_t v20 = +[VILogger log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCF9000, v20, OS_LOG_TYPE_ERROR, "unsupported port type", buf, 2u);
        }
      }
      int v17 = 5;
    }
  }
  else
  {
    if ([v6 dtype] != 2)
    {
      if (+[VILogger shouldLogMessage])
      {
        id v7 = +[VILogger log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v8 = "VI5ERunner: only 32BGRA input format is supported at the moment";
          goto LABEL_25;
        }
LABEL_26:
      }
LABEL_27:
      int v17 = 0;
      goto LABEL_58;
    }
    v9 = [v6 shape];
    uint64_t v10 = [v9 objectAtIndexedSubscript:1];
    size_t v11 = [v10 unsignedLongValue];

    v12 = [v6 shape];
    int v13 = [v12 objectAtIndexedSubscript:0];
    size_t v14 = [v13 unsignedLongValue];

    v15 = VICreateCVPixelBufferWithFormat(v11, v14, 0x42475241u);
    *a5 = [MEMORY[0x1E4F29238] valueWithPointer:v15];
    CVPixelBufferGetIOSurface(v15);
    int v16 = e5rt_surface_object_create_from_iosurface();
    if (v16)
    {
      int v17 = v16;
      uint64_t v18 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage])
      {
        v19 = +[VILogger log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v37 = v18;
LABEL_56:
          _os_log_impl(&dword_1DCCF9000, v19, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }
LABEL_57:
      }
    }
    else
    {
      int v25 = e5rt_io_port_bind_surface_object();
      if (v25)
      {
        int v17 = v25;
        uint64_t v26 = e5rt_get_last_error_message();
        if (!+[VILogger shouldLogMessage]) {
          goto LABEL_58;
        }
        v19 = +[VILogger log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v37 = v26;
          goto LABEL_56;
        }
        goto LABEL_57;
      }
      int v17 = e5rt_surface_object_release();
      if (v17)
      {
        uint64_t v29 = e5rt_get_last_error_message();
        if (+[VILogger shouldLogMessage])
        {
          v19 = +[VILogger log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v37 = v29;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
      }
    }
  }
LABEL_58:

  return v17;
}

- (int)initNetworks
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  int v3 = [(VIE5Runner *)self loadPrecompiledNetwork];
  if (!v3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v116 = 0;
    int num_inputs = e5rt_execution_stream_operation_get_num_inputs();
    if (num_inputs)
    {
      int v4 = num_inputs;
      uint64_t last_error_message = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage])
      {
        size_t v11 = +[VILogger log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v120 = last_error_message;
          _os_log_impl(&dword_1DCCF9000, v11, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }
      }
      goto LABEL_39;
    }
    v98 = &v93;
    v12 = (char *)&v93 - ((8 * v116 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (8 * v116 >= 0x200) {
      size_t v13 = 512;
    }
    else {
      size_t v13 = 8 * v116;
    }
    bzero((char *)&v93 - ((8 * v116 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    int input_names = e5rt_execution_stream_operation_get_input_names();
    if (input_names)
    {
      int v4 = input_names;
      uint64_t v15 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage])
      {
        int v16 = +[VILogger log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v120 = v15;
LABEL_17:
          _os_log_impl(&dword_1DCCF9000, v16, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }
LABEL_18:
      }
LABEL_39:

LABEL_40:
      return v4;
    }
    v100 = v6;
    id v101 = v8;
    id v99 = v7;
    if (v116)
    {
      uint64_t v17 = 0;
      while (1)
      {
        uint64_t v18 = *(void *)&v12[8 * v17];
        unint64_t v115 = 0;
        int v19 = e5rt_execution_stream_operation_retain_input_port();
        if (v19) {
          break;
        }
        id v114 = 0;
        int v4 = +[VIE5Runner getPort:v115 description:&v114];
        id v20 = v114;
        if (v4)
        {
          uint64_t v40 = e5rt_get_last_error_message();
          BOOL v41 = +[VILogger shouldLogMessage];
          id v7 = v99;
          id v6 = v100;
          if (v41)
          {
            uint64_t v42 = +[VILogger log];
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              uint64_t v120 = v40;
              _os_log_impl(&dword_1DCCF9000, v42, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
            }
          }
          id v8 = v101;
          goto LABEL_39;
        }
        int v21 = [NSString stringWithCString:v18 encoding:1];
        [v100 setObject:v20 forKeyedSubscript:v21];

        uint64_t v22 = (void *)[[NSString alloc] initWithUTF8String:v18];
        [v101 addObject:v22];
        int v23 = [MEMORY[0x1E4F29238] valueWithPointer:v115];
        [v99 setObject:v23 forKey:v22];

        if (++v17 >= v116) {
          goto LABEL_25;
        }
      }
      int v4 = v19;
      uint64_t v38 = e5rt_get_last_error_message();
      BOOL v39 = +[VILogger shouldLogMessage];
      id v7 = v99;
      id v6 = v100;
      id v8 = v101;
      if (!v39) {
        goto LABEL_39;
      }
      int v16 = +[VILogger log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v120 = v38;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
LABEL_25:
    id v6 = v100;
    uint64_t v24 = [v100 copy];
    inputs = self->_inputs;
    self->_inputs = v24;

    id v7 = v99;
    uint64_t v26 = (NSDictionary *)[v99 copy];
    inputPorts = self->_inputPorts;
    self->_inputPorts = v26;

    id v8 = v101;
    uint64_t v28 = (NSArray *)[v101 copy];
    inputNames = self->_inputNames;
    self->_inputNames = v28;

    id v97 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v96 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v115 = 0;
    int num_outputs = e5rt_execution_stream_operation_get_num_outputs();
    if (num_outputs)
    {
      int v4 = num_outputs;
      uint64_t v31 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage])
      {
        int v32 = +[VILogger log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v120 = v31;
LABEL_36:
          _os_log_impl(&dword_1DCCF9000, v32, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    uint64_t v33 = (char *)&v93 - ((8 * v115 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (8 * v115 >= 0x200) {
      size_t v34 = 512;
    }
    else {
      size_t v34 = 8 * v115;
    }
    bzero((char *)&v93 - ((8 * v115 + 15) & 0xFFFFFFFFFFFFFFF0), v34);
    int output_names = e5rt_execution_stream_operation_get_output_names();
    if (output_names)
    {
      int v4 = output_names;
      uint64_t v36 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage])
      {
        int v32 = +[VILogger log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v120 = v36;
          goto LABEL_36;
        }
LABEL_37:
      }
LABEL_38:

      goto LABEL_39;
    }
    if (v115)
    {
      uint64_t v43 = 0;
      while (1)
      {
        uint64_t v44 = *(void *)&v33[8 * v43];
        uint64_t v113 = 0;
        int v45 = e5rt_execution_stream_operation_retain_output_port();
        if (v45) {
          break;
        }
        id v112 = 0;
        int v4 = +[VIE5Runner getPort:v113 description:&v112];
        id v46 = v112;
        if (v4)
        {
          uint64_t v87 = e5rt_get_last_error_message();
          BOOL v88 = +[VILogger shouldLogMessage];
          id v7 = v99;
          id v6 = v100;
          if (v88)
          {
            v89 = +[VILogger log];
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              uint64_t v120 = v87;
              _os_log_impl(&dword_1DCCF9000, v89, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
            }
          }
          goto LABEL_38;
        }
        v47 = [NSString stringWithCString:v44 encoding:1];
        [v97 setObject:v46 forKeyedSubscript:v47];

        v48 = (void *)[[NSString alloc] initWithUTF8String:v44];
        [v95 addObject:v48];
        v49 = [MEMORY[0x1E4F29238] valueWithPointer:v113];
        [v96 setObject:v49 forKey:v48];

        id v8 = v101;
        if (++v43 >= v115) {
          goto LABEL_55;
        }
      }
      int v4 = v45;
      uint64_t v85 = e5rt_get_last_error_message();
      BOOL v86 = +[VILogger shouldLogMessage];
      id v7 = v99;
      id v6 = v100;
      if (!v86) {
        goto LABEL_38;
      }
      int v32 = +[VILogger log];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v120 = v85;
        goto LABEL_36;
      }
      goto LABEL_37;
    }
LABEL_55:
    v50 = (NSDictionary *)[v97 copy];
    outputs = self->_outputs;
    self->_outputs = v50;

    v52 = (NSDictionary *)[v96 copy];
    outputPorts = self->_outputPorts;
    self->_outputPorts = v52;

    v54 = (NSArray *)[v95 copy];
    outputNames = self->_outputNames;
    self->_outputNames = v54;

    if (self->_allocateInputs)
    {
      id v94 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      v93 = self->_inputPorts;
      uint64_t v56 = [(NSDictionary *)v93 countByEnumeratingWithState:&v108 objects:v118 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v109;
LABEL_58:
        uint64_t v59 = 0;
        while (1)
        {
          if (*(void *)v109 != v58) {
            objc_enumerationMutation(v93);
          }
          uint64_t v60 = *(void *)(*((void *)&v108 + 1) + 8 * v59);
          v61 = [(NSDictionary *)self->_inputPorts objectForKeyedSubscript:v60];
          uint64_t v62 = [v61 pointerValue];
          v63 = [(NSDictionary *)self->_inputs objectForKeyedSubscript:v60];
          id v107 = 0;
          int v4 = +[VIE5Runner allocatePort:v62 description:v63 io:&v107];
          id v64 = v107;

          if (v4) {
            break;
          }
          [v94 setValue:v64 forKey:v60];

          if (v57 == ++v59)
          {
            uint64_t v57 = [(NSDictionary *)v93 countByEnumeratingWithState:&v108 objects:v118 count:16];
            if (v57) {
              goto LABEL_58;
            }
            goto LABEL_64;
          }
        }
        uint64_t v82 = e5rt_get_last_error_message();
        BOOL v83 = +[VILogger shouldLogMessage];
        id v7 = v99;
        id v6 = v100;
        if (!v83) {
          goto LABEL_95;
        }
        v84 = +[VILogger log];
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v120 = v82;
LABEL_93:
          _os_log_impl(&dword_1DCCF9000, v84, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }
        goto LABEL_94;
      }
LABEL_64:

      id v65 = v94;
      v66 = (NSDictionary *)[v94 copy];
      boundInputs = self->_boundInputs;
      self->_boundInputs = v66;

      id v8 = v101;
    }
    if (self->_allocateOutputs)
    {
      id v94 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      v93 = self->_outputPorts;
      uint64_t v68 = [(NSDictionary *)v93 countByEnumeratingWithState:&v103 objects:v117 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v70 = *(void *)v104;
LABEL_68:
        uint64_t v71 = 0;
        while (1)
        {
          if (*(void *)v104 != v70) {
            objc_enumerationMutation(v93);
          }
          uint64_t v72 = *(void *)(*((void *)&v103 + 1) + 8 * v71);
          v73 = [(NSDictionary *)self->_outputPorts objectForKeyedSubscript:v72];
          uint64_t v74 = [v73 pointerValue];
          v75 = [(NSDictionary *)self->_outputs objectForKeyedSubscript:v72];
          id v102 = 0;
          int v4 = +[VIE5Runner allocatePort:v74 description:v75 io:&v102];
          id v64 = v102;

          if (v4) {
            break;
          }
          [v94 setValue:v64 forKey:v72];

          if (v69 == ++v71)
          {
            uint64_t v69 = [(NSDictionary *)v93 countByEnumeratingWithState:&v103 objects:v117 count:16];
            if (v69) {
              goto LABEL_68;
            }
            goto LABEL_74;
          }
        }
        uint64_t v90 = e5rt_get_last_error_message();
        BOOL v91 = +[VILogger shouldLogMessage];
        id v7 = v99;
        id v6 = v100;
        if (!v91) {
          goto LABEL_95;
        }
        v84 = +[VILogger log];
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v120 = v90;
          goto LABEL_93;
        }
LABEL_94:

LABEL_95:
        id v8 = v101;
        goto LABEL_38;
      }
LABEL_74:

      id v76 = v94;
      v77 = (NSDictionary *)[v94 copy];
      boundOutputs = self->_boundOutputs;
      self->_boundOutputs = v77;

      id v8 = v101;
    }
    int v79 = e5rt_execution_stream_create();
    if (v79)
    {
      int v4 = v79;
      uint64_t v80 = e5rt_get_last_error_message();
      BOOL v81 = +[VILogger shouldLogMessage];
      id v7 = v99;
      id v6 = v100;
      if (!v81) {
        goto LABEL_38;
      }
      int v32 = +[VILogger log];
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_37;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v120 = v80;
    }
    else
    {
      int v4 = e5rt_execution_stream_encode_operation();
      id v7 = v99;
      id v6 = v100;
      if (!v4) {
        goto LABEL_38;
      }
      uint64_t v92 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage]) {
        goto LABEL_38;
      }
      int v32 = +[VILogger log];
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_37;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v120 = v92;
    }
    goto LABEL_36;
  }
  int v4 = v3;
  uint64_t v5 = e5rt_get_last_error_message();
  if (+[VILogger shouldLogMessage])
  {
    id v6 = +[VILogger log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v120 = v5;
      _os_log_impl(&dword_1DCCF9000, v6, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
    }
    goto LABEL_40;
  }
  return v4;
}

- (int)loadPrecompiledNetwork
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSURL *)self->_bundleURL path];
  [v3 UTF8String];
  [(NSString *)self->_mainFunctionName UTF8String];
  int precompiled_compute_operation = e5rt_execution_stream_operation_create_precompiled_compute_operation();

  if (precompiled_compute_operation)
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage])
    {
      id v6 = +[VILogger log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136446210;
        uint64_t v9 = last_error_message;
        _os_log_impl(&dword_1DCCF9000, v6, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  return precompiled_compute_operation;
}

- (int)compileNetworksOnDevice
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = e5rt_e5_compiler_options_create();
  if (v3)
  {
    int precompiled_compute_operation_with_options = v3;
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage])
    {
      id v6 = +[VILogger log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v24 = last_error_message;
LABEL_13:
        _os_log_impl(&dword_1DCCF9000, v6, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else
  {
    int v7 = e5rt_e5_compiler_options_set_compute_device_types_mask();
    if (v7)
    {
      int precompiled_compute_operation_with_options = v7;
      uint64_t v8 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage])
      {
        id v6 = +[VILogger log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v24 = v8;
          goto LABEL_13;
        }
LABEL_14:
      }
    }
    else
    {
      int v9 = e5rt_e5_compiler_create();
      if (!v9)
      {
        char v12 = 0;
        BOOL v13 = 0;
        while (1)
        {
          if (v13)
          {
            int v14 = e5rt_e5_compiler_options_set_force_recompilation();
            if (v14) {
              break;
            }
          }
          id v15 = [(NSURL *)self->_bundleURL path];
          [v15 UTF8String];
          int precompiled_compute_operation_with_options = e5rt_e5_compiler_compile();

          if (precompiled_compute_operation_with_options)
          {
            uint64_t v19 = e5rt_get_last_error_message();
            if (!+[VILogger shouldLogMessage]) {
              return precompiled_compute_operation_with_options;
            }
            id v6 = +[VILogger log];
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              uint64_t v24 = v19;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          [(NSString *)self->_mainFunctionName UTF8String];
          int v16 = e5rt_program_library_retain_program_function();
          if (v16)
          {
            int precompiled_compute_operation_with_options = v16;
            uint64_t v20 = e5rt_get_last_error_message();
            if (!+[VILogger shouldLogMessage]) {
              return precompiled_compute_operation_with_options;
            }
            id v6 = +[VILogger log];
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              uint64_t v24 = v20;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          int v17 = e5rt_precompiled_compute_op_create_options_create_with_program_function();
          if (v17)
          {
            int precompiled_compute_operation_with_options = v17;
            uint64_t v21 = e5rt_get_last_error_message();
            if (!+[VILogger shouldLogMessage]) {
              return precompiled_compute_operation_with_options;
            }
            id v6 = +[VILogger log];
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              uint64_t v24 = v21;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          int precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();
          e5rt_precompiled_compute_op_create_options_release();
          e5rt_program_function_release();
          e5rt_program_library_release();
          BOOL v13 = precompiled_compute_operation_with_options == 13;
          char v18 = v12 | (precompiled_compute_operation_with_options != 13);
          char v12 = 1;
          if (v18)
          {
            e5rt_e5_compiler_release();
            e5rt_e5_compiler_options_release();
            return precompiled_compute_operation_with_options;
          }
        }
        int precompiled_compute_operation_with_options = v14;
        uint64_t v22 = e5rt_get_last_error_message();
        if (!+[VILogger shouldLogMessage]) {
          return precompiled_compute_operation_with_options;
        }
        id v6 = +[VILogger log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v24 = v22;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
      int precompiled_compute_operation_with_options = v9;
      uint64_t v10 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage])
      {
        id v6 = +[VILogger log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v24 = v10;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
  }
  return precompiled_compute_operation_with_options;
}

+ (void)releasePorts:(id)a3 descriptions:(id)a4 boundedIOs:(id)a5 wasBound:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v9);
        }
        int v16 = [v9 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        int v17 = v16;
        if (v16)
        {
          uint64_t v31 = [v16 pointerValue];
          e5rt_io_port_release();
        }
      }
      uint64_t v13 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }
  if (v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          uint64_t v24 = objc_msgSend(v18, "objectForKey:", v23, (void)v27);
          if (v24)
          {
            uint64_t v25 = [v10 objectForKeyedSubscript:v23];
            uint64_t v26 = [v25 type];

            if (!v26) {
              CVPixelBufferRelease((CVPixelBufferRef)[v24 pointerValue]);
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v20);
    }
  }
}

- (void)releaseNetworks
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  e5rt_execution_stream_operation_release();
  e5rt_execution_stream_release();
  +[VIE5Runner releasePorts:self->_inputPorts descriptions:self->_inputs boundedIOs:self->_boundInputs wasBound:self->_allocateInputs];
  +[VIE5Runner releasePorts:self->_outputPorts descriptions:self->_outputs boundedIOs:self->_boundOutputs wasBound:self->_allocateOutputs];
  os_unfair_lock_unlock(p_lock);
}

- (int)execute
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = e5rt_execution_stream_execute_sync();
  if (v2)
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage])
    {
      int v4 = +[VILogger log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446210;
        uint64_t v7 = last_error_message;
        _os_log_impl(&dword_1DCCF9000, v4, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  return v2;
}

- (id)executeAndGet:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    if ([(VIE5Runner *)self execute])
    {
      if (a4)
      {
        id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
        *a4 = (id)[v8 initWithDomain:@"com.apple.argos.e5rt" code:0 userInfo:MEMORY[0x1E4F1CC08]];
      }
      os_unfair_lock_unlock(&self->_lock);
      id v9 = v7;
      goto LABEL_16;
    }
    long long v29 = a4;
    os_unfair_lock_t lock = &self->_lock;
    id v27 = v6;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v15 = -[NSDictionary objectForKeyedSubscript:](self->_boundOutputs, "objectForKeyedSubscript:", v14, lock);
          int v16 = (const void *)[v15 pointerValue];

          id v17 = objc_alloc(MEMORY[0x1E4F1E9A8]);
          id v18 = [(NSDictionary *)self->_outputs objectForKeyedSubscript:v14];
          uint64_t v19 = [v18 shape];
          uint64_t v20 = (void *)[v17 initWithShape:v19 dataType:65568 error:v29];

          if (!v20)
          {
            if (v29)
            {
              uint64_t v24 = [*v29 localizedDescription];
            }
            else
            {
              uint64_t v24 = @"unknown";
            }
            id v6 = v27;
            if (+[VILogger shouldLogMessage])
            {
              uint64_t v25 = +[VILogger log];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                long long v35 = v24;
                _os_log_impl(&dword_1DCCF9000, v25, OS_LOG_TYPE_ERROR, "VIE5Runner: unable to allocate output array: %{public}@", buf, 0xCu);
              }
            }
            os_unfair_lock_unlock(lock);
            id v22 = v7;

            goto LABEL_17;
          }
          id v21 = v20;
          memcpy((void *)[v21 dataPointer], v16, 4 * objc_msgSend(v21, "count"));
          [v7 setValue:v21 forKey:v14];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    os_unfair_lock_unlock(lock);
    id v6 = v27;
  }
  id v9 = (id)objc_msgSend(v7, "copy", lock);
LABEL_16:
  id v22 = v9;
LABEL_17:

  return v22;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)mainFunctionName
{
  return self->_mainFunctionName;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSDictionary)inputs
{
  return self->_inputs;
}

- (NSDictionary)outputs
{
  return self->_outputs;
}

- (NSDictionary)boundInputs
{
  return self->_boundInputs;
}

- (NSDictionary)boundOutputs
{
  return self->_boundOutputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundOutputs, 0);
  objc_storeStrong((id *)&self->_boundInputs, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_mainFunctionName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_inputPorts, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
}

@end