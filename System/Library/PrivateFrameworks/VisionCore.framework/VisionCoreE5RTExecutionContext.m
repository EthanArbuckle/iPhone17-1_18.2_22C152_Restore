@interface VisionCoreE5RTExecutionContext
+ (id)newContextForFunction:(id)a3 withConfiguration:(id)a4 error:(id *)a5;
- (BOOL)executeAndReturnError:(id *)a3;
- (BOOL)isPrebound;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSString)name;
- (VisionCoreE5RTFunction)function;
- (VisionCoreMutableNamedObjects)_executePreflightBindingsWithInputObjects:(void *)a3 recordingIOPortHandlesIn:(void *)a4 error:;
- (VisionCoreNamedObjects)boundInputObjects;
- (VisionCoreNamedObjects)boundOutputObjects;
- (id)_initWithOwnedOperationHandle:(e5rt_execution_stream_operation *)a3 function:(id)a4 inputs:(id)a5 outputs:(id)a6;
- (id)_resolvedCompletionQueue;
- (id)executeWithInputObjects:(id)a3 error:(id *)a4;
- (uint64_t)_bindIOSurface:(uint64_t)a1 toBufferInputPort:(uint64_t)a2 error:(void *)a3;
- (uint64_t)_bindInput:(void *)a3 ofInputObjects:(void *)a4 recordingPortHandleIn:(void *)a5 error:;
- (uint64_t)_bindOutput:(void *)a3 ofOutputObjects:(void *)a4 recordingPortHandleIn:(void *)a5 error:;
- (uint64_t)_validateIsPreboundAndReturnError:(uint64_t)result;
- (unint64_t)_bindData:(void *)a1 toBufferInputPort:(uint64_t)a2 error:(unint64_t)a3;
- (void)_reportError:(void *)a3 toCompletionHandler:;
- (void)_reportOutput:(void *)a3 toCompletionHandler:;
- (void)dealloc;
- (void)executeWithCompletionHandler:(id)a3;
- (void)executeWithInputObjects:(id)a3 completionHandler:(id)a4;
@end

@implementation VisionCoreE5RTExecutionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvidedCompletionQueue, 0);
  objc_storeStrong((id *)&self->_boundOutputPorts, 0);
  objc_storeStrong((id *)&self->_boundInputPorts, 0);
  objc_storeStrong((id *)&self->_boundOutputObjects, 0);
  objc_storeStrong((id *)&self->_boundInputObjects, 0);
  objc_storeStrong((id *)&self->_function, 0);
}

- (VisionCoreE5RTFunction)function
{
  return self->_function;
}

- (VisionCoreNamedObjects)boundOutputObjects
{
  return self->_boundOutputObjects;
}

- (VisionCoreNamedObjects)boundInputObjects
{
  return self->_boundInputObjects;
}

- (BOOL)isPrebound
{
  return self->_isPrebound;
}

- (void)executeWithInputObjects:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
  id v20 = 0;
  v9 = -[VisionCoreE5RTExecutionContext _executePreflightBindingsWithInputObjects:recordingIOPortHandlesIn:error:]((VisionCoreMutableNamedObjects *)self, v7, v8, &v20);

  id v10 = v20;
  if (v9)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__VisionCoreE5RTExecutionContext_executeWithInputObjects_completionHandler___block_invoke;
    v15[3] = &unk_26488B468;
    v16 = v8;
    v17 = self;
    id v18 = v9;
    id v11 = v6;
    id v19 = v11;
    v12 = (void *)MEMORY[0x230F41C60](v15);
    uint64_t v13 = e5rt_execution_stream_submit_async();
    if (v13)
    {
      v14 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v13];

      -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v14, v11);
      id v10 = v14;
    }
  }
  else
  {
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v10, v6);
  }
}

- (VisionCoreMutableNamedObjects)_executePreflightBindingsWithInputObjects:(void *)a3 recordingIOPortHandlesIn:(void *)a4 error:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (LOBYTE(a1[3].super.super.isa))
    {
      if (a4)
      {
        v9 = (void *)[[NSString alloc] initWithFormat:@"%@ has pre-bound inputs and outputs", a1];
        *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v9];
      }
      goto LABEL_5;
    }
    uint64_t v11 = e5rt_execution_stream_reset();
    if (v11)
    {
      if (!a4)
      {
LABEL_5:
        a1 = 0;
        goto LABEL_6;
      }
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v11];
      a1 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = v7;
      v30 = [(VisionCoreMutableNamedObjects *)a1 function];
      v12 = [v30 outputs];
      uint64_t v13 = -[VisionCoreMutableNamedObjects initWithCapacity:]([VisionCoreMutableNamedObjects alloc], "initWithCapacity:", [v12 count]);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v20 = [v30 descriptorForOutput:v19 error:a4];
            v21 = v20;
            if (!v20
              || ![v20 E5RTExecutionContextAssignNewTensorInstanceToNamedObjects:v13 error:a4])
            {

LABEL_34:
              a1 = 0;
              goto LABEL_37;
            }
            int v22 = -[VisionCoreE5RTExecutionContext _bindOutput:ofOutputObjects:recordingPortHandleIn:error:]((uint64_t)a1, v19, v13, v8, a4);

            if (!v22) {
              goto LABEL_34;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v29;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v32;
        while (2)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v32 != v26) {
              objc_enumerationMutation(v23);
            }
            if (!-[VisionCoreE5RTExecutionContext _bindInput:ofInputObjects:recordingPortHandleIn:error:]((uint64_t)a1, *(void **)(*((void *)&v31 + 1) + 8 * j), v23, v8, a4))
            {

              goto LABEL_36;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      uint64_t v28 = e5rt_execution_stream_encode_operation();
      if (v28)
      {
        if (a4)
        {
          [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v28];
          a1 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_36:
          a1 = 0;
        }
      }
      else
      {
        a1 = v13;
      }
LABEL_37:
      id v7 = v29;
    }
  }
LABEL_6:

  return a1;
}

- (void)_reportError:(void *)a3 toCompletionHandler:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1 && v6)
  {
    id v8 = -[VisionCoreE5RTExecutionContext _resolvedCompletionQueue](a1);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__VisionCoreE5RTExecutionContext__reportError_toCompletionHandler___block_invoke;
    v9[3] = &unk_26488B418;
    id v11 = v7;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

void __76__VisionCoreE5RTExecutionContext_executeWithInputObjects_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(a1 + 32);
  id v17 = v5;
  if (a4)
  {
    id v7 = (objc_class *)NSString;
    id v8 = v5;
    id v9 = [v7 alloc];
    id v10 = [*(id *)(a1 + 40) name];
    id v11 = (void *)[v9 initWithFormat:@"%@ failed execution", v10];

    v12 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTErrorCode:a4 localizedDescription:v11];
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:](*(void *)(a1 + 40), v12, *(void **)(a1 + 56));
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = *(void **)(a1 + 48);
    uint64_t v15 = *(void **)(a1 + 56);
    id v16 = v5;
    -[VisionCoreE5RTExecutionContext _reportOutput:toCompletionHandler:](v13, v14, v15);
  }
}

- (void)_reportOutput:(void *)a3 toCompletionHandler:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1 && v6)
  {
    id v8 = -[VisionCoreE5RTExecutionContext _resolvedCompletionQueue](a1);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__VisionCoreE5RTExecutionContext__reportOutput_toCompletionHandler___block_invoke;
    v9[3] = &unk_26488B418;
    id v11 = v7;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

- (id)_resolvedCompletionQueue
{
  v1 = *(void **)(a1 + 72);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    qos_class_t v3 = qos_class_self();
    dispatch_get_global_queue(v3, 0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t __68__VisionCoreE5RTExecutionContext__reportOutput_toCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __67__VisionCoreE5RTExecutionContext__reportError_toCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (uint64_t)_bindOutput:(void *)a3 ofOutputObjects:(void *)a4 recordingPortHandleIn:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v23 = 0;
  id v11 = v8;
  [v11 UTF8String];
  uint64_t v12 = e5rt_execution_stream_operation_retain_output_port();
  if (!v12)
  {
    if (([v10 recordPort:v23 named:v11 error:a5] & 1) == 0)
    {
      e5rt_io_port_release();
      goto LABEL_16;
    }
    uint64_t v22 = 0;
    if (+[VisionCoreE5RTUtils getType:&v22 ofIOPort:v23 error:a5])
    {
      if (v22 == 2)
      {
        id v15 = v11;
        id v16 = v9;
        if (![v16 surfaceAssociatedWithName:v15 error:a5]) {
          goto LABEL_22;
        }
        uint64_t v24 = 0;
        uint64_t v17 = e5rt_surface_object_create_from_iosurface();
        if (!v17)
        {
          uint64_t v21 = e5rt_io_port_bind_surface_object();
          if (v21)
          {
            if (a5)
            {
              *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v21];
            }
            char v19 = 0;
            char v25 = 0;
          }
          else
          {
            char v19 = 1;
          }
          e5rt_surface_object_release();
          goto LABEL_33;
        }
        goto LABEL_20;
      }
      if (v22 == 1)
      {
        id v15 = v11;
        id v16 = v9;
        if (![v16 surfaceAssociatedWithName:v15 error:a5]) {
          goto LABEL_22;
        }
        uint64_t v24 = 0;
        uint64_t v17 = e5rt_buffer_object_create_from_iosurface();
        if (!v17)
        {
          uint64_t v18 = e5rt_io_port_bind_buffer_object();
          if (v18)
          {
            if (a5)
            {
              *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v18];
            }
            char v19 = 0;
            char v25 = 0;
          }
          else
          {
            char v19 = 1;
          }
          e5rt_buffer_object_release();
LABEL_33:
          char v14 = v19 | v25;
          goto LABEL_34;
        }
LABEL_20:
        if (a5)
        {
          [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v17];
          char v14 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

          goto LABEL_17;
        }
LABEL_22:
        char v14 = 0;
        goto LABEL_34;
      }
      if (a5)
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForUnsupportedE5RTIOPortType:");
        goto LABEL_4;
      }
    }
LABEL_16:
    char v14 = 0;
    goto LABEL_17;
  }
  if (!a5) {
    goto LABEL_16;
  }
  uint64_t v13 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v12];
LABEL_4:
  char v14 = 0;
  *a5 = v13;
LABEL_17:

  return v14 & 1;
}

- (uint64_t)_bindInput:(void *)a3 ofInputObjects:(void *)a4 recordingPortHandleIn:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v22 = 0;
  id v11 = v8;
  [v11 UTF8String];
  uint64_t v12 = e5rt_execution_stream_operation_retain_input_port();
  if (v12)
  {
LABEL_2:
    if (a5)
    {
      uint64_t v13 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v12];
LABEL_4:
      char v14 = 0;
      *a5 = v13;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (([v10 recordPort:v22 named:v11 error:a5] & 1) == 0)
  {
    e5rt_io_port_release();
    goto LABEL_16;
  }
  uint64_t v21 = 0;
  if (!+[VisionCoreE5RTUtils getType:&v21 ofIOPort:v22 error:a5])
  {
LABEL_16:
    char v14 = 0;
    goto LABEL_17;
  }
  if (v21 == 1)
  {
    uint64_t v18 = [v9 surfaceAssociatedWithName:v11 error:a5];
    if (v18)
    {
      char v14 = -[VisionCoreE5RTExecutionContext _bindIOSurface:toBufferInputPort:error:](v18, v22, a5);
    }
    else
    {
      char v19 = [v9 dataForName:v11 error:a5];
      id v20 = v19;
      if (v19) {
        char v14 = -[VisionCoreE5RTExecutionContext _bindData:toBufferInputPort:error:](v19, v22, (unint64_t)a5);
      }
      else {
        char v14 = 0;
      }
    }
    goto LABEL_17;
  }
  if (v21 != 2)
  {
    if (a5)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForUnsupportedE5RTIOPortType:");
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  if (![v9 surfaceAssociatedWithName:v11 error:a5]) {
    goto LABEL_16;
  }
  uint64_t v23 = 0;
  uint64_t v12 = e5rt_surface_object_create_from_iosurface();
  if (v12) {
    goto LABEL_2;
  }
  uint64_t v15 = e5rt_io_port_bind_surface_object();
  if (v15)
  {
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v15];
    }
    char v16 = 0;
    char v24 = 0;
  }
  else
  {
    char v16 = 1;
  }
  e5rt_surface_object_release();
  char v14 = v16 | v24;
LABEL_17:

  return v14 & 1;
}

- (uint64_t)_bindIOSurface:(uint64_t)a1 toBufferInputPort:(uint64_t)a2 error:(void *)a3
{
  uint64_t v4 = e5rt_buffer_object_create_from_iosurface();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v4, 0);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      char v6 = 0;
      *a3 = v5;
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = e5rt_io_port_bind_buffer_object();
    if (v7)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v7, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      char v8 = 0;
      char v10 = 0;
    }
    else
    {
      char v8 = 1;
    }
    e5rt_buffer_object_release();
    char v6 = v8 | v10;
  }
  return v6 & 1;
}

- (unint64_t)_bindData:(void *)a1 toBufferInputPort:(uint64_t)a2 error:(unint64_t)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [v5 length];
  uint64_t v18 = *MEMORY[0x263F0ED30];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
  v19[0] = v7;
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  id v9 = IOSurfaceCreate(v8);
  if (v9)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__VisionCoreE5RTExecutionContext__bindData_toBufferInputPort_error___block_invoke;
    v14[3] = &unk_26488B3F0;
    id v15 = v5;
    uint64_t v16 = v6;
    char v10 = (void *)MEMORY[0x230F41C60](v14);
    if (VisionCorePerformWithLockedIOSurface(v9, 0, v10, (void *)a3)) {
      unsigned __int8 v11 = -[VisionCoreE5RTExecutionContext _bindIOSurface:toBufferInputPort:error:]((uint64_t)v9, a2, (void *)a3);
    }
    else {
      unsigned __int8 v11 = 0;
    }
    unsigned __int8 v17 = v11;

    CFRelease(v9);
    a3 = v17;
  }
  else if (a3)
  {
    uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"Could not create IOSurfaceRef with properties %@", v8];
    *(void *)a3 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v12];

    a3 = 0;
  }

  return a3;
}

uint64_t __68__VisionCoreE5RTExecutionContext__bindData_toBufferInputPort_error___block_invoke(uint64_t a1, IOSurfaceRef buffer)
{
  BaseAddress = IOSurfaceGetBaseAddress(buffer);
  memcpy(BaseAddress, (const void *)[*(id *)(a1 + 32) bytes], *(void *)(a1 + 40));
  return 1;
}

- (id)executeWithInputObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
  CFDictionaryRef v8 = -[VisionCoreE5RTExecutionContext _executePreflightBindingsWithInputObjects:recordingIOPortHandlesIn:error:]((VisionCoreMutableNamedObjects *)self, v6, v7, a4);
  if (!v8)
  {
LABEL_5:
    id v10 = 0;
    goto LABEL_7;
  }
  uint64_t v9 = e5rt_execution_stream_execute_sync();
  if (v9)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v9];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v10 = v8;
LABEL_7:

  return v10;
}

- (void)executeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v20 = 0;
  char v5 = -[VisionCoreE5RTExecutionContext _validateIsPreboundAndReturnError:]((uint64_t)self, &v20);
  id v6 = v20;
  if (v5)
  {
    uint64_t v7 = (void *)[(VisionCoreNamedObjects *)self->_boundOutputObjects copy];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __63__VisionCoreE5RTExecutionContext_executeWithCompletionHandler___block_invoke;
    uint64_t v16 = &unk_26488B440;
    unsigned __int8 v17 = self;
    id v8 = v7;
    id v18 = v8;
    id v9 = v4;
    id v19 = v9;
    id v10 = (void *)MEMORY[0x230F41C60](&v13);
    uint64_t v11 = e5rt_execution_stream_submit_async();
    if (v11)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v11, v13, v14, v15, v16, v17, v18);

      -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v12, v9);
      id v6 = v12;
    }
  }
  else
  {
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v6, v4);
  }
}

- (uint64_t)_validateIsPreboundAndReturnError:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned char *)(result + 48))
    {
      return 1;
    }
    else
    {
      if (a2)
      {
        qos_class_t v3 = (void *)[[NSString alloc] initWithFormat:@"%@ does not have pre-bound inputs and outputs", result];
        *a2 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v3];
      }
      return 0;
    }
  }
  return result;
}

void __63__VisionCoreE5RTExecutionContext_executeWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v6 = [NSString alloc];
    uint64_t v7 = [*(id *)(a1 + 32) name];
    id v12 = (id)[v6 initWithFormat:@"%@ failed execution", v7];

    id v8 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTErrorCode:a4 localizedDescription:v12];
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:](*(void *)(a1 + 32), v8, *(void **)(a1 + 48));
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void **)(a1 + 48);
    -[VisionCoreE5RTExecutionContext _reportOutput:toCompletionHandler:](v9, v10, v11);
  }
}

- (BOOL)executeAndReturnError:(id *)a3
{
  int v4 = -[VisionCoreE5RTExecutionContext _validateIsPreboundAndReturnError:]((uint64_t)self, a3);
  if (v4)
  {
    int v5 = e5rt_execution_stream_execute_sync();
    LOBYTE(v4) = v5 == 0;
    if (a3)
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForE5RTLastErrorMessageAndCode:");
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v4) = 0;
        *a3 = v6;
      }
    }
  }
  return v4;
}

- (NSArray)outputs
{
  id v2 = [(VisionCoreE5RTExecutionContext *)self function];
  qos_class_t v3 = [v2 outputs];

  return (NSArray *)v3;
}

- (NSArray)inputs
{
  id v2 = [(VisionCoreE5RTExecutionContext *)self function];
  qos_class_t v3 = [v2 inputs];

  return (NSArray *)v3;
}

- (NSString)name
{
  id v2 = [(VisionCoreE5RTExecutionContext *)self function];
  qos_class_t v3 = [v2 programLibrary];
  id v4 = [NSString alloc];
  int v5 = [v3 URL];
  id v6 = [v5 path];
  uint64_t v7 = [v2 name];
  id v8 = (void *)[v4 initWithFormat:@"%@.%@", v6, v7];

  return (NSString *)v8;
}

- (void)dealloc
{
  if (self->_executionStreamHandle)
  {
    e5rt_execution_stream_reset();
    e5rt_execution_stream_release();
  }
  if (self->_executionStreamOperationHandle) {
    e5rt_execution_stream_operation_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreE5RTExecutionContext;
  [(VisionCoreE5RTExecutionContext *)&v3 dealloc];
}

- (id)_initWithOwnedOperationHandle:(e5rt_execution_stream_operation *)a3 function:(id)a4 inputs:(id)a5 outputs:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VisionCoreE5RTExecutionContext;
  uint64_t v14 = [(VisionCoreE5RTExecutionContext *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    boundInputObjects = v14->_boundInputObjects;
    v14->_boundInputObjects = (VisionCoreNamedObjects *)v15;

    uint64_t v17 = [v13 copy];
    boundOutputObjects = v14->_boundOutputObjects;
    v14->_boundOutputObjects = (VisionCoreNamedObjects *)v17;

    id v19 = v14->_boundInputObjects;
    if (v19) {
      LOBYTE(v19) = v14->_boundOutputObjects != 0;
    }
    v14->_isPrebound = (char)v19;
    objc_storeStrong((id *)&v14->_function, a4);
    v14->_executionStreamOperationHandle = *a3;
    *a3 = 0;
  }

  return v14;
}

+ (id)newContextForFunction:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _VisionCoreSignpostLog();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22B18B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateFunctionExecutionContext", "", buf, 2u);
  }

  id v11 = [v9 boundInputObjects];
  uint64_t v12 = [v9 boundOutputObjects];
  id v13 = (void *)v12;
  if (!v11 && v12 || v11 && !v12)
  {
    if (a5)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:@"bound input and output objects must be both defined or both nil"];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
LABEL_35:
    id v14 = 0;
    goto LABEL_51;
  }
  uint64_t v39 = 0;
  uint64_t v15 = [v9 prewarmedState];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    uint64_t v17 = [v9 prewarmedState];
    uint64_t v39 = [v17 acquireExecutionStreamOperationHandle];
  }
  if (!v39)
  {
    uint64_t v39 = [v8 createOperationExecutionStreamWithError:a5];
    if (!v39) {
      goto LABEL_35;
    }
  }
  uint64_t v18 = [objc_alloc((Class)a1) _initWithOwnedOperationHandle:&v39 function:v8 inputs:v11 outputs:v13];
  if (!v18)
  {
    if (a5)
    {
      long long v34 = (void *)[[NSString alloc] initWithFormat:@"unable to create execution context for %@", v8];
      *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:v34];
    }
    goto LABEL_45;
  }
  id v19 = v9;
  uint64_t v20 = [v19 completionQueue];
  objc_super v21 = *(void **)(v18 + 72);
  *(void *)(v18 + 72) = v20;

  if (*(unsigned char *)(v18 + 48))
  {
    uint64_t v22 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
    uint64_t v23 = *(void **)(v18 + 56);
    *(void *)(v18 + 56) = v22;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v24 = *(id *)(v18 + 32);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:buf count:16];
    id v37 = v19;
    if (v25)
    {
      uint64_t v26 = *(void *)v45;
LABEL_17:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v24);
        }
        if ((-[VisionCoreE5RTExecutionContext _bindInput:ofInputObjects:recordingPortHandleIn:error:](v18, *(void **)(*((void *)&v44 + 1) + 8 * v27), *(void **)(v18 + 32), *(void **)(v18 + 56), a5) & 1) == 0)goto LABEL_43; {
        if (v25 == ++v27)
        }
        {
          uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:buf count:16];
          if (v25) {
            goto LABEL_17;
          }
          break;
        }
      }
    }

    uint64_t v28 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
    v29 = *(void **)(v18 + 64);
    *(void *)(v18 + 64) = v28;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v24 = *(id *)(v18 + 40);
    uint64_t v30 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v41;
LABEL_25:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(v24);
        }
        if ((-[VisionCoreE5RTExecutionContext _bindOutput:ofOutputObjects:recordingPortHandleIn:error:](v18, *(void **)(*((void *)&v40 + 1) + 8 * v32), *(void **)(v18 + 40), *(void **)(v18 + 64), a5) & 1) == 0)break; {
        if (v30 == ++v32)
        }
        {
          uint64_t v30 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v30) {
            goto LABEL_25;
          }
          goto LABEL_31;
        }
      }
LABEL_43:

      id v19 = v37;
      goto LABEL_44;
    }
LABEL_31:

    id v19 = v37;
  }
  uint64_t v33 = e5rt_execution_stream_create();
  if (!v33)
  {
    if (!*(unsigned char *)(v18 + 48)) {
      goto LABEL_56;
    }
    uint64_t v33 = e5rt_execution_stream_encode_operation();
    if (v33)
    {
      if (!a5) {
        goto LABEL_44;
      }
      goto LABEL_34;
    }
    if (!objc_msgSend(v19, "prewireInUseAllocations", v33)
      || (uint64_t v33 = e5rt_execution_stream_prewire_in_use_allocations(), !v33))
    {
LABEL_56:

      id v14 = (id)v18;
      goto LABEL_46;
    }
    if (!a5) {
      goto LABEL_44;
    }
LABEL_34:
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v33];
    goto LABEL_44;
  }
  if (a5) {
    goto LABEL_34;
  }
LABEL_44:

LABEL_45:
  id v14 = 0;
LABEL_46:

  if (v39) {
    e5rt_execution_stream_operation_release();
  }
  long long v35 = _VisionCoreSignpostLog();
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)long long v38 = 0;
    _os_signpost_emit_with_name_impl(&dword_22B18B000, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateFunctionExecutionContext", "", v38, 2u);
  }

LABEL_51:
  return v14;
}

@end