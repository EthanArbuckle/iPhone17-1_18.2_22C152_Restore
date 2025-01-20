@interface _MRCMetalContext
- (MTLCommandBuffer)currentCommandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLLibrary)library;
- (_MRCMetalContext)init;
- (_MRCMetalContext)initWithDevice:(id)a3 libraryURL:(id)a4 error:(id *)a5;
- (id)beginCommandBuffer;
- (id)beginCommandBufferWithError:(id *)a3;
- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newTextureByBindingIOSurface:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 usage:(unint64_t)a7 plane:(unint64_t)a8 error:(id *)a9;
- (void)commitCommandBuffer;
- (void)commitCommandBufferShouldWaitUntilCompleted:(BOOL)a3;
@end

@implementation _MRCMetalContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCommandBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (MTLCommandBuffer)currentCommandBuffer
{
  return self->_currentCommandBuffer;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)newTextureByBindingIOSurface:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 usage:(unint64_t)a7 plane:(unint64_t)a8 error:(id *)a9
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v13 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], a2, a4, a5, a6, 0);
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setUsage_(v13, v14, a7);
    v17 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v16, (uint64_t)v15, a3, a8);
    if (v17)
    {
      id v19 = v17;
      v20 = v19;
    }
    else
    {
      if (a9)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F1D140];
        v28 = @"Cannot create MTLTexture.";
        v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)&v28, &v27, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, @"MRCErrorDomain", -1, v24);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v19 = 0;
      v20 = 0;
    }
  }
  else
  {
    if (!a9)
    {
      v20 = 0;
      goto LABEL_10;
    }
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F1D140];
    v30[0] = @"Cannot create MTLTextureDescriptor.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v30, &v29, 1);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v22, @"MRCErrorDomain", -1, v19);
    v20 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v20;
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v10 = a4;
  library = self->_library;
  if (!v10)
  {
    v13 = objc_msgSend_newFunctionWithName_(library, v9, (uint64_t)v8);
    if (!v13)
    {
      if (!a5) {
        goto LABEL_7;
      }
      v15 = (void *)MEMORY[0x1E4F28C58];
      v13 = objc_msgSend_stringWithFormat_(NSString, v12, @"Cannot create MTLFunction named %@.", v8, *MEMORY[0x1E4F1D140]);
      v20[0] = v13;
      v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v20, &v19, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, @"MRCErrorDomain", -1, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
      goto LABEL_6;
    }
LABEL_5:
    a5 = (id *)objc_msgSend_newComputePipelineStateWithFunction_error_(self->_device, v12, (uint64_t)v13, a5);
LABEL_6:

    goto LABEL_7;
  }
  v13 = objc_msgSend_newFunctionWithName_constantValues_error_(library, v9, (uint64_t)v8, v10, a5);
  if (v13) {
    goto LABEL_5;
  }
  a5 = 0;
LABEL_7:

  return a5;
}

- (void)commitCommandBufferShouldWaitUntilCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_commit(self->_currentCommandBuffer, a2, a3);
  if (v3) {
    objc_msgSend_waitUntilCompleted(self->_currentCommandBuffer, v5, v6);
  }
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = 0;
}

- (void)commitCommandBuffer
{
}

- (id)beginCommandBufferWithError:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_commandBuffer(self->_commandQueue, a2, (uint64_t)a3);
  v5 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = v5;

  id v8 = self->_currentCommandBuffer;
  if (v8)
  {
    v9 = v8;
  }
  else if (a3)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F1D140];
    v15[0] = @"Cannot create MTLCommandBuffer.";
    v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v15, &v14, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, @"MRCErrorDomain", -1, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)beginCommandBuffer
{
  return (id)MEMORY[0x1F4181798](self, sel_beginCommandBufferWithError_, 0);
}

- (_MRCMetalContext)initWithDevice:(id)a3 libraryURL:(id)a4 error:(id *)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v52.receiver = self;
  v52.super_class = (Class)_MRCMetalContext;
  id v10 = [(_MRCMetalContext *)&v52 init];
  if (!v10) {
    goto LABEL_21;
  }
  if (v8) {
    v11 = (MTLDevice *)v8;
  }
  else {
    v11 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  }
  device = v10->_device;
  v10->_device = v11;

  if (v10->_device)
  {
    if (v9)
    {
LABEL_7:
      uint64_t v15 = objc_msgSend_newLibraryWithURL_error_(v10->_device, v13, (uint64_t)v9, a5);
      library = v10->_library;
      v10->_library = (MTLLibrary *)v15;
LABEL_19:

      if (!v10->_library)
      {
LABEL_25:
        a5 = 0;
        goto LABEL_26;
      }
      uint64_t v37 = objc_msgSend_newCommandQueue(v10->_device, v35, v36);
      commandQueue = v10->_commandQueue;
      v10->_commandQueue = (MTLCommandQueue *)v37;

      if (v10->_commandQueue)
      {
LABEL_21:
        a5 = v10;
        goto LABEL_26;
      }
      if (!a5) {
        goto LABEL_26;
      }
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F1D140];
      v54 = @"Cannot create MTLCommandQueue.";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)&v54, &v53, 1);
      v40 = LABEL_24:;
      objc_msgSend_errorWithDomain_code_userInfo_(v17, v41, @"MRCErrorDomain", -1, v40);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    v18 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v13, v14);
    v20 = objc_msgSend_objectForKey_(v18, v19, @"_MRCMetalContextDefaultLibraryPath");

    if ((v20
       || (id v21 = objc_alloc(MEMORY[0x1E4F1CB18]),
           v23 = objc_msgSend_initWithSuiteName_(v21, v22, @"com.apple.Quagga"),
           objc_msgSend_objectForKey_(v23, v24, @"_MRCMetalContextDefaultLibraryPath"),
           v20 = objc_claimAutoreleasedReturnValue(),
           v23,
           v20))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend_length(v20, v25, v26))
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v27, (uint64_t)v20);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v28 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_bundleForClass_(v28, v30, v29);
    if (!v31)
    {
      if (!a5)
      {
        id v9 = 0;
        goto LABEL_26;
      }
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F1D140];
      v44 = NSString;
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      v48 = objc_msgSend_stringWithFormat_(v44, v47, @"Cannot get bundle for class %@.", v46);
      v56 = v48;
      v50 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)&v56, &v55, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v43, v51, @"MRCErrorDomain", -1, v50);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      id v9 = 0;
      goto LABEL_25;
    }
    library = (void *)v31;
    uint64_t v33 = objc_msgSend_newDefaultLibraryWithBundle_error_(v10->_device, v32, v31, a5);
    v34 = v10->_library;
    v10->_library = (MTLLibrary *)v33;

    id v9 = 0;
    goto LABEL_19;
  }
  if (a5)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v57 = *MEMORY[0x1E4F1D140];
    v58[0] = @"Cannot create MTLDevice.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v58, &v57, 1);
    goto LABEL_24;
  }
LABEL_26:

  return (_MRCMetalContext *)a5;
}

- (_MRCMetalContext)init
{
  result = (_MRCMetalContext *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

@end