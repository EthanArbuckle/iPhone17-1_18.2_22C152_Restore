@interface SIE5RTPort
- (__IOSurface)getIOSurface;
- (const)getShape;
- (e5rt_io_port)port;
- (id)initPortWithE5RTStreamOperation:(e5rt_execution_stream_operation *)a3 blobName:(id)a4 portType:(int64_t)a5;
- (int64_t)bindIOSurface:(__IOSurface *)a3;
- (int64_t)bindPixelBuffer:(__CVBuffer *)a3;
- (int64_t)bindRawPointer:(const void *)a3;
- (unint64_t)getBatchnum;
- (unint64_t)getBytePerRow;
- (unint64_t)getChannels;
- (unint64_t)getComponentSize;
- (unint64_t)getHeight;
- (unint64_t)getNumberOfElements;
- (unint64_t)getRowElements;
- (unint64_t)getWidth;
- (void)getDataPtr;
@end

@implementation SIE5RTPort

- (id)initPortWithE5RTStreamOperation:(e5rt_execution_stream_operation *)a3 blobName:(id)a4 portType:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SIE5RTPort;
  v9 = [(SIE5RTPort *)&v25 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_27;
  }
  objc_storeStrong((id *)&v9->_name, a4);
  v10->_portType = a5;
  id v11 = v8;
  [v11 UTF8String];
  if (a5)
  {
    if (e5rt_execution_stream_operation_retain_output_port())
    {
      v12 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 47);
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        __int16 v28 = 1025;
        int v29 = 47;
        __int16 v30 = 2113;
        id v31 = v13;
        _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
      }
      v14 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        __int16 v28 = 1025;
        int v29 = 47;
        __int16 v30 = 2113;
        id v31 = v11;
        _os_log_impl(&dword_21B697000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to retain the output port for blob: %{private}@ ***", buf, 0x1Cu);
      }

      goto LABEL_27;
    }
LABEL_15:
    if (e5rt_io_port_is_tensor())
    {
      v18 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 54);
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        __int16 v28 = 1025;
        int v29 = 54;
        __int16 v30 = 2113;
        id v31 = v19;
        _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
      }
      v20 = __SceneIntelligenceLogSharedInstance();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136380931;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
      __int16 v28 = 1025;
      int v29 = 54;
      v21 = " %{private}s:%{private}d *** Failed to check the port type - tensor ***";
    }
    else if (e5rt_io_port_is_surface())
    {
      v22 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 57);
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        __int16 v28 = 1025;
        int v29 = 57;
        __int16 v30 = 2113;
        id v31 = v23;
        _os_log_impl(&dword_21B697000, v22, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
      }
      v20 = __SceneIntelligenceLogSharedInstance();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136380931;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
      __int16 v28 = 1025;
      int v29 = 57;
      v21 = " %{private}s:%{private}d *** Failed to check the port type - surface ***";
    }
    else
    {
      v20 = __SceneIntelligenceLogSharedInstance();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136380931;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
      __int16 v28 = 1025;
      int v29 = 66;
      v21 = " %{private}s:%{private}d *** Failed to initialize io port: Unknown port descriptor ***";
    }
    _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
LABEL_26:

    goto LABEL_27;
  }
  if (!e5rt_execution_stream_operation_retain_input_port()) {
    goto LABEL_15;
  }
  v15 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 43);
    *(_DWORD *)buf = 136381187;
    v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
    __int16 v28 = 1025;
    int v29 = 43;
    __int16 v30 = 2113;
    id v31 = v16;
    _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
  }
  v17 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136381187;
    v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
    __int16 v28 = 1025;
    int v29 = 43;
    __int16 v30 = 2113;
    id v31 = v11;
    _os_log_impl(&dword_21B697000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to retain the input port for blob: %{private}@ ***", buf, 0x1Cu);
  }

LABEL_27:
  return 0;
}

- (int64_t)bindIOSurface:(__IOSurface *)a3
{
  return [(SIE5RTPortDescriptor *)self->_desc bindIOSurface:a3];
}

- (int64_t)bindPixelBuffer:(__CVBuffer *)a3
{
  desc = self->_desc;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  return [(SIE5RTPortDescriptor *)desc bindIOSurface:IOSurface];
}

- (int64_t)bindRawPointer:(const void *)a3
{
  return 0;
}

- (unint64_t)getWidth
{
  return [(SIE5RTPortDescriptor *)self->_desc getWidth];
}

- (unint64_t)getHeight
{
  return [(SIE5RTPortDescriptor *)self->_desc getHeight];
}

- (unint64_t)getChannels
{
  return [(SIE5RTPortDescriptor *)self->_desc getChannels];
}

- (unint64_t)getNumberOfElements
{
  return [(SIE5RTPortDescriptor *)self->_desc getNumberOfElements];
}

- (unint64_t)getRowElements
{
  return [(SIE5RTPortDescriptor *)self->_desc getRowElements];
}

- (unint64_t)getBatchnum
{
  return [(SIE5RTPortDescriptor *)self->_desc getBatchnum];
}

- (const)getShape
{
  return (const unint64_t *)[(SIE5RTPortDescriptor *)self->_desc getShape];
}

- (void)getDataPtr
{
  return (void *)[(SIE5RTPortDescriptor *)self->_desc getDataPtr];
}

- (unint64_t)getBytePerRow
{
  return [(SIE5RTPortDescriptor *)self->_desc getBytePerRow];
}

- (unint64_t)getComponentSize
{
  return [(SIE5RTPortDescriptor *)self->_desc getComponentSize];
}

- (__IOSurface)getIOSurface
{
  return (__IOSurface *)[(SIE5RTPortDescriptor *)self->_desc getIOSurface];
}

- (e5rt_io_port)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_desc, 0);
}

@end