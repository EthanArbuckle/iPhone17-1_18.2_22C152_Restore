@interface VisionCoreE5RTFunction
- (NSArray)inputDescriptors;
- (NSArray)inputs;
- (NSArray)outputDescriptors;
- (NSArray)outputs;
- (NSDictionary)metadata;
- (NSString)name;
- (VisionCoreE5RTFunction)initWithProgramLibrary:(id)a3 name:(id)a4 ownedFunctionHandle:(e5rt_program_function *)a5;
- (VisionCoreE5RTProgramLibrary)programLibrary;
- (e5rt_execution_stream_operation)createOperationExecutionStreamWithError:(id *)a3;
- (e5rt_program_function)functionHandle;
- (id)_tensorDescriptorOfClass:(uint64_t)a3 providedByBlock:(uint64_t)a4 error:;
- (id)description;
- (id)descriptorForInput:(id)a3 error:(id *)a4;
- (id)descriptorForOutput:(id)a3 error:(id *)a4;
- (id)descriptorOfClass:(Class)a3 forInput:(id)a4 error:(id *)a5;
- (id)descriptorOfClass:(Class)a3 forOutput:(id)a4 error:(id *)a5;
- (id)descriptorsForInputs:(id)a3 error:(id *)a4;
- (id)descriptorsForOutputs:(id)a3 error:(id *)a4;
- (id)newExecutionContextWithConfiguration:(id)a3 error:(id *)a4;
- (id)prepareForExecutionWithError:(id *)a3;
- (uint64_t)_newDescriptorForIOPort:(void *)a3 named:(void *)a4 error:;
- (void)_buildDescriptorsCaches;
- (void)dealloc;
@end

@implementation VisionCoreE5RTFunction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutputDescriptors, 0);
  objc_storeStrong((id *)&self->_cachedInputDescriptors, 0);
  objc_storeStrong((id *)&self->_lazyOutputNames, 0);
  objc_storeStrong((id *)&self->_lazyInputNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_programLibrary, 0);
}

- (NSString)name
{
  return self->_name;
}

- (e5rt_program_function)functionHandle
{
  return self->_functionHandle;
}

- (VisionCoreE5RTProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreE5RTFunction;
  v4 = [(VisionCoreE5RTFunction *)&v8 description];
  v5 = [(VisionCoreE5RTFunction *)self name];
  v6 = (void *)[v3 initWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (e5rt_execution_stream_operation)createOperationExecutionStreamWithError:(id *)a3
{
  v4 = _VisionCoreSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22B18B000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateExecutionStreamOperation", "", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v5 = e5rt_precompiled_compute_op_create_options_create_with_program_function();
  if (v5)
  {
    if (a3)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v5];
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v10 = 0;
    uint64_t precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();
    if (precompiled_compute_operation_with_options)
    {
      if (a3)
      {
        [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:precompiled_compute_operation_with_options];
        v6 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = v10;
    }
    e5rt_precompiled_compute_op_create_options_release();
    objc_super v8 = _VisionCoreSignpostLog();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_22B18B000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateExecutionStreamOperation", "", (uint8_t *)&v10, 2u);
    }
  }
  return v6;
}

- (VisionCoreE5RTFunction)initWithProgramLibrary:(id)a3 name:(id)a4 ownedFunctionHandle:(e5rt_program_function *)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VisionCoreE5RTFunction;
  v11 = [(VisionCoreE5RTFunction *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_programLibrary, a3);
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_functionHandle = *a5;
    *a5 = 0;
  }

  return v12;
}

- (id)prepareForExecutionWithError:(id *)a3
{
  id v3 = [[VisionCoreE5RTExecutionPrewarmedState alloc] initWithExecutionStreamOperation:[(VisionCoreE5RTFunction *)self createOperationExecutionStreamWithError:a3]];
  return v3;
}

- (id)newExecutionContextWithConfiguration:(id)a3 error:(id *)a4
{
  return +[VisionCoreE5RTExecutionContext newContextForFunction:self withConfiguration:a3 error:a4];
}

- (NSArray)outputDescriptors
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(VisionCoreE5RTFunction *)self outputs];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[VisionCoreE5RTFunction descriptorForOutput:error:](self, "descriptorForOutput:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)inputDescriptors
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(VisionCoreE5RTFunction *)self inputs];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[VisionCoreE5RTFunction descriptorForInput:error:](self, "descriptorForInput:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)descriptorsForOutputs:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[VisionCoreE5RTFunction descriptorForOutput:error:](self, "descriptorForOutput:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4, (void)v17);
        if (!v13)
        {

          id v15 = 0;
          goto LABEL_11;
        }
        long long v14 = (void *)v13;
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = v7;
LABEL_11:

  return v15;
}

- (id)descriptorOfClass:(Class)a3 forOutput:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__VisionCoreE5RTFunction_descriptorOfClass_forOutput_error___block_invoke;
  v13[3] = &unk_26488B680;
  v13[4] = self;
  id v14 = v8;
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x230F41C60](v13);
  uint64_t v11 = -[VisionCoreE5RTFunction _tensorDescriptorOfClass:providedByBlock:error:]((uint64_t)self, (uint64_t)a3, (uint64_t)v10, (uint64_t)a5);

  return v11;
}

uint64_t __60__VisionCoreE5RTFunction_descriptorOfClass_forOutput_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) descriptorForOutput:*(void *)(a1 + 40) error:a2];
}

- (id)_tensorDescriptorOfClass:(uint64_t)a3 providedByBlock:(uint64_t)a4 error:
{
  if (a1)
  {
    id v6 = (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a4);
    if (v6
      && +[VisionCoreValidationUtilities validateObject:v6 isKindOfClass:a2 basedOnClass:objc_opt_class() error:a4])
    {
      id v7 = v6;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)descriptorForOutput:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[VisionCoreE5RTFunction _buildDescriptorsCaches](self);
  id v7 = [(NSDictionary *)self->_cachedOutputDescriptors objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    id v10 = [NSString alloc];
    uint64_t v11 = [(VisionCoreE5RTFunction *)self name];
    long long v12 = (void *)[v10 initWithFormat:@"Could not provide a descriptor for %@ output %@", v11, v6];

    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v12];
  }
  return v8;
}

- (void)_buildDescriptorsCaches
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!v1[6])
    {
      v2 = [v1 inputs];
      id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v2, "count"));
      v4 = [v1 outputs];
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __49__VisionCoreE5RTFunction__buildDescriptorsCaches__block_invoke;
      v24[3] = &unk_26488B658;
      id v6 = v2;
      id v25 = v6;
      v26 = v1;
      id v7 = v3;
      id v27 = v7;
      id v8 = v4;
      id v28 = v8;
      id v9 = v5;
      id v29 = v9;
      id v10 = (void *)MEMORY[0x230F41C60](v24);
      NSStringFromSelector(sel__buildDescriptorsCaches);
      id v23 = 0;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      long long v12 = v10;
      uint64_t v13 = [v1 createOperationExecutionStreamWithError:&v23];
      uint64_t v30 = v13;
      if (v13)
      {
        char v14 = v12[2](v12, v13, &v23);
        e5rt_execution_stream_operation_release();
      }
      else
      {
        char v14 = 0;
      }

      id v15 = v23;
      if ((v14 & 1) == 0)
      {
        uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
        long long v20 = [v1 name];
        v21 = [v15 localizedDescription];
        [v22 handleFailureInMethod:sel__buildDescriptorsCaches, v1, @"VisionCoreE5RTFunction.m", 305, @"could not build descriptors for %@: %@", v20, v21 object file lineNumber description];
      }
      uint64_t v16 = [v7 copy];
      long long v17 = (void *)v1[6];
      v1[6] = v16;

      uint64_t v18 = [v9 copy];
      long long v19 = (void *)v1[7];
      v1[7] = v18;
    }
    objc_sync_exit(v1);
  }
}

uint64_t __49__VisionCoreE5RTFunction__buildDescriptorsCaches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v39;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v39 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
      uint64_t v37 = 0;
      id v10 = v9;
      [v10 UTF8String];
      uint64_t v11 = e5rt_execution_stream_operation_retain_input_port();
      if (v11) {
        break;
      }
      long long v12 = (void *)-[VisionCoreE5RTFunction _newDescriptorForIOPort:named:error:](*(void *)(a1 + 40), v37, v10, a3);
      if (v12)
      {
        [*(id *)(a1 + 48) setObject:v12 forKey:v10];
        int v13 = 0;
      }
      else
      {
        int v13 = 1;
      }

      e5rt_io_port_release();
      if (v13) {
        goto LABEL_34;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    if (!a3) {
      goto LABEL_34;
    }
    id v31 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v11];
  }
  else
  {
LABEL_13:

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v5 = *(id *)(a1 + 56);
    uint64_t v14 = [v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (!v14)
    {
      uint64_t v30 = 1;
      goto LABEL_35;
    }
    uint64_t v15 = *(void *)v34;
LABEL_15:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v34 != v15) {
        objc_enumerationMutation(v5);
      }
      long long v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
      uint64_t v37 = 0;
      id v18 = v17;
      [v18 UTF8String];
      uint64_t v19 = e5rt_execution_stream_operation_retain_output_port();
      if (v19) {
        break;
      }
      uint64_t v20 = -[VisionCoreE5RTFunction _newDescriptorForIOPort:named:error:](*(void *)(a1 + 40), v37, v18, a3);
      id v27 = (void *)v20;
      id v28 = @"NULL";
      if (v20) {
        id v28 = (__CFString *)v20;
      }
      VisionCoreValidatedLog(1, @"Output descriptor: %@", v21, v22, v23, v24, v25, v26, (uint64_t)v28);
      if (v27)
      {
        [*(id *)(a1 + 64) setObject:v27 forKey:v18];
        int v29 = 0;
      }
      else
      {
        int v29 = 1;
      }

      e5rt_io_port_release();
      if (v29) {
        goto LABEL_34;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
        uint64_t v30 = 1;
        if (v14) {
          goto LABEL_15;
        }
        goto LABEL_35;
      }
    }
    if (!a3) {
      goto LABEL_34;
    }
    id v31 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v19];
  }
  *a3 = v31;
LABEL_34:
  uint64_t v30 = 0;
LABEL_35:

  return v30;
}

- (uint64_t)_newDescriptorForIOPort:(void *)a3 named:(void *)a4 error:
{
  id v7 = a3;
  if (!a1)
  {
LABEL_19:
    uint64_t v8 = 0;
    goto LABEL_51;
  }
  uint64_t v27 = 0;
  uint64_t v8 = 0;
  if (+[VisionCoreE5RTUtils getType:&v27 ofIOPort:a2 error:a4])
  {
    if (v27 != 2)
    {
      if (v27 == 1)
      {
        id v9 = v7;
        uint64_t v33 = 0;
        uint64_t v10 = e5rt_io_port_retain_tensor_desc();
        if (v10)
        {
          if (a4)
          {
LABEL_7:
            uint64_t v11 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v10];
LABEL_18:
            uint64_t v8 = 0;
            *a4 = v11;
            goto LABEL_50;
          }
LABEL_10:
          uint64_t v8 = 0;
LABEL_50:

          goto LABEL_51;
        }
        uint64_t v32 = 0;
        if (!+[VisionCoreE5RTUtils getTensorDataType:&v32 forTensorDescriptor:v33 error:a4])goto LABEL_27; {
        uint64_t v30 = 0;
        }
        uint64_t v31 = 0;
        uint64_t shape = e5rt_tensor_desc_get_shape();
        if (!shape)
        {
          id v18 = [VisionCoreTensorShape alloc];
          uint64_t v19 = [(VisionCoreTensorShape *)v18 initWithSizes:v30 rank:v31];
          uint64_t v29 = 0;
          uint64_t strides = e5rt_tensor_desc_get_strides();
          if (strides)
          {
            if (a4)
            {
              [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:strides];
              uint64_t v8 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v8 = 0;
            }
          }
          else
          {
            uint64_t v21 = [VisionCoreTensorStrides alloc];
            uint64_t v22 = [(VisionCoreTensorStrides *)v21 initWithByteOffsets:v29 rank:v31];
            uint64_t v28 = 0;
            uint64_t size = e5rt_tensor_desc_get_size();
            if (size)
            {
              if (a4)
              {
                [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:size];
                uint64_t v8 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v8 = 0;
              }
            }
            else
            {
              uint64_t v25 = [VisionCoreTensorDescriptor alloc];
              uint64_t v8 = [(VisionCoreTensorDescriptor *)v25 initWithName:v9 dataType:v32 shape:v19 strides:v22 storageByteCount:v28];
            }
          }
          goto LABEL_49;
        }
        if (a4)
        {
          [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:shape];
          uint64_t v8 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_27:
          uint64_t v8 = 0;
        }
LABEL_49:
        e5rt_tensor_desc_release();
        goto LABEL_50;
      }
      if (a4)
      {
        id v12 = [NSString alloc];
        int v13 = @"VisionCoreE5RTIOPortTypeUnknown";
        if (v27 == 1) {
          int v13 = @"VisionCoreE5RTIOPortTypeTensor";
        }
        if (v27 == 2) {
          uint64_t v14 = @"VisionCoreE5RTIOPortTypeSurface";
        }
        else {
          uint64_t v14 = v13;
        }
        uint64_t v15 = v14;
        id v9 = (id)[v12 initWithFormat:@"unsupported I/O port handle type %@", v15];

        uint64_t v11 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:v9];
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    id v9 = v7;
    uint64_t v33 = 0;
    uint64_t v10 = e5rt_io_port_retain_surface_desc();
    if (v10)
    {
      if (a4) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }
    uint64_t v32 = 0;
    uint64_t width = e5rt_surface_desc_get_width();
    if (width)
    {
      if (a4) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v31 = 0;
      uint64_t width = e5rt_surface_desc_get_height();
      if (width)
      {
        if (a4) {
          goto LABEL_36;
        }
      }
      else
      {
        LODWORD(v30) = 0;
        uint64_t width = e5rt_surface_desc_get_format();
        if (width)
        {
          if (a4)
          {
LABEL_36:
            [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:width];
            uint64_t v8 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:
            e5rt_surface_desc_release();
            goto LABEL_50;
          }
        }
        else
        {
          LODWORD(v29) = 0;
          if (+[VisionCoreE5RTUtils getPixelFormatType:&v29 forSurfaceFormat:v30 error:a4])
          {
            uint64_t v24 = [VisionCoreImageTensorDescriptor alloc];
            uint64_t v8 = [(VisionCoreImageTensorDescriptor *)v24 initWithName:v9 pixelFormatType:v29 pixelWidth:v32 pixelHeight:v31];
            goto LABEL_43;
          }
        }
      }
    }
    uint64_t v8 = 0;
    goto LABEL_43;
  }
LABEL_51:

  return v8;
}

- (id)descriptorsForInputs:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[VisionCoreE5RTFunction descriptorForInput:error:](self, "descriptorForInput:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4, (void)v17);
        if (!v13)
        {

          id v15 = 0;
          goto LABEL_11;
        }
        uint64_t v14 = (void *)v13;
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = v7;
LABEL_11:

  return v15;
}

- (id)descriptorOfClass:(Class)a3 forInput:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__VisionCoreE5RTFunction_descriptorOfClass_forInput_error___block_invoke;
  v13[3] = &unk_26488B680;
  v13[4] = self;
  id v14 = v8;
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x230F41C60](v13);
  uint64_t v11 = -[VisionCoreE5RTFunction _tensorDescriptorOfClass:providedByBlock:error:]((uint64_t)self, (uint64_t)a3, (uint64_t)v10, (uint64_t)a5);

  return v11;
}

uint64_t __59__VisionCoreE5RTFunction_descriptorOfClass_forInput_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) descriptorForInput:*(void *)(a1 + 40) error:a2];
}

- (id)descriptorForInput:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[VisionCoreE5RTFunction _buildDescriptorsCaches](self);
  id v7 = [(NSDictionary *)self->_cachedInputDescriptors objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    id v10 = [NSString alloc];
    uint64_t v11 = [(VisionCoreE5RTFunction *)self name];
    id v12 = (void *)[v10 initWithFormat:@"Could not provide a descriptor for %@ input %@", v11, v6];

    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v12];
  }
  return v8;
}

- (NSArray)outputs
{
  lazyOutputNames = self->_lazyOutputNames;
  if (!lazyOutputNames)
  {
    v4 = +[VisionCoreE5RTUtils stringsForHandle:self->_functionHandle fromCountProc:MEMORY[0x263F3B830] stringsProc:MEMORY[0x263F3B820] error:0];
    id v5 = (NSArray *)[v4 copy];
    id v6 = self->_lazyOutputNames;
    self->_lazyOutputNames = v5;

    lazyOutputNames = self->_lazyOutputNames;
  }
  return lazyOutputNames;
}

- (NSArray)inputs
{
  lazyInputNames = self->_lazyInputNames;
  if (!lazyInputNames)
  {
    v4 = +[VisionCoreE5RTUtils stringsForHandle:self->_functionHandle fromCountProc:MEMORY[0x263F3B828] stringsProc:MEMORY[0x263F3B818] error:0];
    id v5 = (NSArray *)[v4 copy];
    id v6 = self->_lazyInputNames;
    self->_lazyInputNames = v5;

    lazyInputNames = self->_lazyInputNames;
  }
  return lazyInputNames;
}

- (NSDictionary)metadata
{
  id v3 = [(VisionCoreE5RTFunction *)self programLibrary];
  v4 = [(VisionCoreE5RTFunction *)self name];
  id v5 = [v3 metadataForFunctionNamed:v4 error:0];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (void *)MEMORY[0x263EFFA78];
  }
  id v7 = v6;

  return v7;
}

- (void)dealloc
{
  if (self->_functionHandle) {
    e5rt_program_function_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreE5RTFunction;
  [(VisionCoreE5RTFunction *)&v3 dealloc];
}

@end