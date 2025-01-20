@interface RSMetalContext
- (MTLCommandBuffer)currentCommandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLLibrary)library;
- (RSMetalContext)init;
- (RSMetalContext)initWithDevice:(id)a3 libraryURL:(id)a4 error:(id *)a5;
- (id)beginCommandBuffer;
- (id)beginCommandBufferWithError:(id *)a3;
- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newTextureByBindingIOSurface:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 usage:(unint64_t)a7 plane:(unint64_t)a8 error:(id *)a9;
- (void)commitCommandBuffer;
- (void)commitCommandBufferShouldWaitUntilCompleted:(BOOL)a3;
@end

@implementation RSMetalContext

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
  v30[1] = *MEMORY[0x263EF8340];
  v13 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, a4, a5, a6, 0);
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
        v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263EFFC48];
        v28 = @"Unable to create MTLTexture.";
        v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)&v28, &v27, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, @"com.apple.RoomScanCoreError", -2006, v24);
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
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263EFFC48];
    v30[0] = @"Unable to create MTLTextureDescriptor.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v30, &v29, 1);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v22, @"com.apple.RoomScanCoreError", -2005, v19);
    v20 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v20;
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x263EF8340];
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
      v15 = (void *)MEMORY[0x263F087E8];
      v13 = objc_msgSend_stringWithFormat_(NSString, v12, @"Unable to create MTLFunction named %@.", v8, *MEMORY[0x263EFFC48]);
      v20[0] = v13;
      v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v20, &v19, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, @"com.apple.RoomScanCoreError", -2004, v17);
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
  v15[1] = *MEMORY[0x263EF8340];
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
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263EFFC48];
    v15[0] = @"Unable to create MTLCommandBuffer.";
    v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v15, &v14, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, @"com.apple.RoomScanCoreError", -2003, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)beginCommandBuffer
{
  return (id)MEMORY[0x270F9A6D0](self, sel_beginCommandBufferWithError_, 0);
}

- (RSMetalContext)initWithDevice:(id)a3 libraryURL:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v42.receiver = self;
  v42.super_class = (Class)RSMetalContext;
  id v10 = [(RSMetalContext *)&v42 init];
  if (!v10) {
    goto LABEL_19;
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
      uint64_t v14 = objc_msgSend_newLibraryWithURL_error_(v10->_device, v13, (uint64_t)v9, a5);
      library = v10->_library;
      v10->_library = (MTLLibrary *)v14;
LABEL_17:

      if (!v10->_library)
      {
LABEL_23:
        a5 = 0;
        goto LABEL_24;
      }
      uint64_t v36 = objc_msgSend_newCommandQueue(v10->_device, v34, v35);
      commandQueue = v10->_commandQueue;
      v10->_commandQueue = (MTLCommandQueue *)v36;

      if (v10->_commandQueue)
      {
LABEL_19:
        a5 = v10;
        goto LABEL_24;
      }
      if (!a5) {
        goto LABEL_24;
      }
      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *MEMORY[0x263EFFC48];
      v44 = @"Unable to create MTLCommandQueue.";
      v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)&v44, &v43, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v39, v40, @"com.apple.RoomScanCoreError", -2002, v17);
LABEL_22:
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    uint64_t v19 = (void *)MEMORY[0x263F086E0];
    uint64_t v20 = objc_opt_class();
    v22 = objc_msgSend_bundleForClass_(v19, v21, v20);
    v23 = sub_25B5C99C8(@"default", @"metallib", v22);

    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend_length(v23, v24, v25))
    {
      objc_msgSend_fileURLWithPath_(NSURL, v26, (uint64_t)v23);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v27 = v10->_device;
    v28 = (void *)MEMORY[0x263F086E0];
    uint64_t v29 = objc_opt_class();
    library = objc_msgSend_bundleForClass_(v28, v30, v29);
    uint64_t v32 = objc_msgSend_newDefaultLibraryWithBundle_error_(v27, v31, (uint64_t)library, a5);
    v33 = v10->_library;
    v10->_library = (MTLLibrary *)v32;

    id v9 = 0;
    goto LABEL_17;
  }
  if (a5)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263EFFC48];
    v46[0] = @"Unable to create MTLDevice.";
    v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v46, &v45, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v18, @"com.apple.RoomScanCoreError", -2001, v17);
    goto LABEL_22;
  }
LABEL_24:

  return (RSMetalContext *)a5;
}

- (RSMetalContext)init
{
  result = (RSMetalContext *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

@end