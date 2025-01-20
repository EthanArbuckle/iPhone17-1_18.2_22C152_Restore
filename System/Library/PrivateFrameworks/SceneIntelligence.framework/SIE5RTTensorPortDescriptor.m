@interface SIE5RTTensorPortDescriptor
- (BOOL)isFP16_ANE;
- (BOOL)isPacked;
- (BOOL)isPackedFP32;
- (BOOL)isS8_ANE;
- (BOOL)isU8_ANE;
- (SIE5RTTensorPortDescriptor)initWithE5RTPort:(e5rt_io_port *)a3 portType:(int64_t)a4;
- (__IOSurface)getIOSurface;
- (const)getShape;
- (const)getStrides;
- (e5rt_tensor_desc)createPackedFP32TensorDescriptor;
- (int)getComponentType;
- (int64_t)bindIOSurface:(__IOSurface *)a3;
- (unint64_t)getBatchnum;
- (unint64_t)getBytePerRow;
- (unint64_t)getChannels;
- (unint64_t)getComponentSize;
- (unint64_t)getHeight;
- (unint64_t)getNumberOfElements;
- (unint64_t)getRank;
- (unint64_t)getRowElements;
- (unint64_t)getWidth;
- (unsigned)getNumComponents;
- (void)bindRawPointer:(const void *)a3;
- (void)dealloc;
- (void)getDataPtr;
@end

@implementation SIE5RTTensorPortDescriptor

- (SIE5RTTensorPortDescriptor)initWithE5RTPort:(e5rt_io_port *)a3 portType:(int64_t)a4
{
  v60[4] = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)SIE5RTTensorPortDescriptor;
  v6 = [(SIE5RTTensorPortDescriptor *)&v46 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  p_desc = &v6->_desc;
  if (!e5rt_io_port_retain_tensor_desc())
  {
    v7->_port = a3;
    if ([(SIE5RTTensorPortDescriptor *)v7 getComponentType]) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = [(SIE5RTTensorPortDescriptor *)v7 getNumComponents] == 4;
    }
    v7->_isFP32 = [(SIE5RTTensorPortDescriptor *)v7 isPackedFP32] || v16;
    v7->_isFP16_ANE = [(SIE5RTTensorPortDescriptor *)v7 isFP16_ANE];
    v7->_isS8_ANE = [(SIE5RTTensorPortDescriptor *)v7 isS8_ANE];
    v7->_isU8_ANE = [(SIE5RTTensorPortDescriptor *)v7 isU8_ANE];
    v7->_client_desc = [(SIE5RTTensorPortDescriptor *)v7 createPackedFP32TensorDescriptor];
    if (a4 == 1)
    {
      uint64_t v17 = [(SIE5RTTensorPortDescriptor *)v7 getWidth];
      uint64_t v18 = [(SIE5RTTensorPortDescriptor *)v7 getHeight];
      if ([(SIE5RTTensorPortDescriptor *)v7 getChannels] == 1)
      {
        uint64_t v19 = 1278226488;
        if (v7->_isFP32)
        {
          uint64_t v19 = 1278226534;
        }
        else if (v7->_isFP16_ANE)
        {
          uint64_t v19 = 1278226536;
        }
        else if (!v7->_isU8_ANE)
        {
          if (v7->_isS8_ANE) {
            uint64_t v19 = 1278226488;
          }
          else {
            uint64_t v19 = 1111970369;
          }
        }
        v59[0] = *MEMORY[0x263F0EF50];
        v30 = [NSNumber numberWithUnsignedLong:v17];
        v60[0] = v30;
        v59[1] = *MEMORY[0x263F0EDF8];
        v31 = [NSNumber numberWithUnsignedLong:v18];
        v60[1] = v31;
        v59[2] = *MEMORY[0x263F0ED48];
        v32 = [NSNumber numberWithUnsignedLong:SIBytesPerElementForPixelFormat(v19)];
        v60[2] = v32;
        v59[3] = *MEMORY[0x263F0EE48];
        v33 = [NSNumber numberWithUnsignedInt:v19];
        v60[3] = v33;
        v7->_memory_iosurface = IOSurfaceCreate((CFDictionaryRef)[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4]);

        if (e5rt_buffer_object_create_from_iosurface())
        {
          v34 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 120);
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 120;
            __int16 v51 = 2113;
            *(void *)v52 = v35;
            _os_log_impl(&dword_21B697000, v34, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
          }
          v11 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            IOSurfaceID ID = IOSurfaceGetID(v7->_memory_iosurface);
            size_t Width = IOSurfaceGetWidth(v7->_memory_iosurface);
            size_t Height = IOSurfaceGetHeight(v7->_memory_iosurface);
            size_t BytesPerRow = IOSurfaceGetBytesPerRow(v7->_memory_iosurface);
            OSType PixelFormat = IOSurfaceGetPixelFormat(v7->_memory_iosurface);
            v41 = SIPixelFormatToStr(PixelFormat);
            *(_DWORD *)buf = 136382211;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 120;
            __int16 v51 = 1024;
            *(_DWORD *)v52 = ID;
            *(_WORD *)&v52[4] = 2049;
            *(void *)&v52[6] = Width;
            __int16 v53 = 2049;
            size_t v54 = Height;
            __int16 v55 = 2049;
            size_t v56 = BytesPerRow;
            __int16 v57 = 2113;
            v58 = v41;
            _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the e5rt buffer from an existing iosurface: id=%d, width=%{private}lu, height=%{private}lu, stride=%{private}lu, format=%{private}@ ***", buf, 0x40u);
          }
          goto LABEL_9;
        }
        if (e5rt_io_port_bind_buffer_object())
        {
          v42 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 123);
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 123;
            __int16 v51 = 2113;
            *(void *)v52 = v43;
            _os_log_impl(&dword_21B697000, v42, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
          }
          v20 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 123;
            _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to bind the internal iosurface for output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        v7->_support_zero_copy = 1;
      }
      else
      {
        if (e5rt_tensor_desc_alloc_buffer_object())
        {
          v21 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 83);
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 83;
            __int16 v51 = 2113;
            *(void *)v52 = v22;
            _os_log_impl(&dword_21B697000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
          }
          v20 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 83;
            _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to alloc the internal iosurface for output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        if (e5rt_io_port_bind_buffer_object())
        {
          v26 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 86);
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 86;
            __int16 v51 = 2113;
            *(void *)v52 = v27;
            _os_log_impl(&dword_21B697000, v26, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
          }
          v20 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 86;
            _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to bind the internal iosurface for output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        if (e5rt_buffer_object_get_iosurface())
        {
          v44 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 90);
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 90;
            __int16 v51 = 2113;
            *(void *)v52 = v45;
            _os_log_impl(&dword_21B697000, v44, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
          }
          v20 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            __int16 v49 = 1025;
            int v50 = 90;
            _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the internal iosurface from output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        v7->_memory_iosurface = (__IOSurface *)CFRetain(0);
        v7->_support_zero_copy = 0;
      }
    }
    else
    {
      if (a4) {
        goto LABEL_19;
      }
      if (v7->_isFP32) {
        goto LABEL_18;
      }
      if (!v7->_isFP16_ANE)
      {
        if (v7->_isU8_ANE)
        {
LABEL_18:
          v7->_buffer = 0;
          goto LABEL_19;
        }
        v20 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
          __int16 v49 = 1025;
          int v50 = 72;
          _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Input tensor type not supported! ***", buf, 0x12u);
        }
LABEL_83:

        goto LABEL_10;
      }
      if (e5rt_tensor_desc_alloc_buffer_object())
      {
        v23 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 64);
          *(_DWORD *)buf = 136381187;
          v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
          __int16 v49 = 1025;
          int v50 = 64;
          __int16 v51 = 2113;
          *(void *)v52 = v24;
          _os_log_impl(&dword_21B697000, v23, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
        }
        v20 = __SceneIntelligenceLogSharedInstance();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_83;
        }
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        __int16 v49 = 1025;
        int v50 = 64;
        v25 = " %{private}s:%{private}d *** Failed to alloc the internal iosurface for FP16_ANE input port. ***";
        goto LABEL_60;
      }
      if (e5rt_io_port_bind_buffer_object())
      {
        v28 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 67);
          *(_DWORD *)buf = 136381187;
          v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
          __int16 v49 = 1025;
          int v50 = 67;
          __int16 v51 = 2113;
          *(void *)v52 = v29;
          _os_log_impl(&dword_21B697000, v28, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
        }
        v20 = __SceneIntelligenceLogSharedInstance();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_83;
        }
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        __int16 v49 = 1025;
        int v50 = 67;
        v25 = " %{private}s:%{private}d *** Failed to bind the internal iosurface for FP16_ANE input port. ***";
LABEL_60:
        _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
        goto LABEL_83;
      }
    }
    v7->_buffer = 0;
LABEL_19:
    if (*p_desc)
    {
      if (v7->_client_desc)
      {
        v14 = v7;
        goto LABEL_11;
      }
      v20 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        __int16 v49 = 1025;
        int v50 = 137;
        _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** client tensor descriptor is nil in tesnor port descriptor ***", buf, 0x12u);
      }
    }
    else
    {
      v20 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        __int16 v49 = 1025;
        int v50 = 132;
        _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** tensor descriptor is nil in tesnor port descriptor ***", buf, 0x12u);
      }
    }
    goto LABEL_83;
  }
  v9 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 45);
    *(_DWORD *)buf = 136381187;
    v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
    __int16 v49 = 1025;
    int v50 = 45;
    __int16 v51 = 2113;
    *(void *)v52 = v10;
    _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
  }
  v11 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = "YES";
    v13 = *p_desc;
    v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
    *(_DWORD *)buf = 136381187;
    if (!v13) {
      v12 = "NO";
    }
    __int16 v49 = 1025;
    int v50 = 45;
    __int16 v51 = 2081;
    *(void *)v52 = v12;
    _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to retain the tensor descriptor: desc has been init: %{private}s ***", buf, 0x1Cu);
  }
LABEL_9:

LABEL_10:
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)dealloc
{
  if (self->_port) {
    e5rt_io_port_release();
  }
  if (self->_client_desc) {
    e5rt_tensor_desc_release();
  }
  if (self->_desc) {
    e5rt_tensor_desc_release();
  }
  if (self->_buffer) {
    e5rt_buffer_object_release();
  }
  memory_iosurface = self->_memory_iosurface;
  if (memory_iosurface) {
    CFRelease(memory_iosurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)SIE5RTTensorPortDescriptor;
  [(SIE5RTTensorPortDescriptor *)&v4 dealloc];
}

- (int64_t)bindIOSurface:(__IOSurface *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (e5rt_buffer_object_create_from_iosurface())
  {
    v5 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 174);
      *(_DWORD *)buf = 136381187;
      v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
      __int16 v26 = 1025;
      int v27 = 174;
      __int16 v28 = 2113;
      *(void *)v29 = v6;
      _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
    }
    v7 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      IOSurfaceID ID = IOSurfaceGetID(a3);
      size_t Width = IOSurfaceGetWidth(a3);
      size_t Height = IOSurfaceGetHeight(a3);
      size_t BytesPerRow = IOSurfaceGetBytesPerRow(a3);
      OSType PixelFormat = IOSurfaceGetPixelFormat(a3);
      v13 = SIPixelFormatToStr(PixelFormat);
      *(_DWORD *)buf = 136382211;
      v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
      __int16 v26 = 1025;
      int v27 = 174;
      __int16 v28 = 1024;
      *(_DWORD *)v29 = ID;
      *(_WORD *)&v29[4] = 2049;
      *(void *)&v29[6] = Width;
      *(_WORD *)&v29[14] = 2049;
      *(void *)&v29[16] = Height;
      *(_WORD *)&v29[24] = 2049;
      *(void *)&v29[26] = BytesPerRow;
      *(_WORD *)&v29[34] = 2113;
      *(void *)&v29[36] = v13;
      _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the e5rt buffer from an existing iosurface: id=%d, width=%{private}lu, height=%{private}lu, stride=%{private}lu, format=%{private}@ ***", buf, 0x40u);
    }
LABEL_6:

    return 7;
  }
  OSType v15 = IOSurfaceGetPixelFormat(a3);
  if (self->_isFP16_ANE && (v15 == 1717855600 || v15 == 1278226534))
  {
    if (e5rt_tensor_utils_cast_from_fp32_to_fp16())
    {
      BOOL v16 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 184);
        *(_DWORD *)buf = 136381187;
        v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        __int16 v26 = 1025;
        int v27 = 184;
        __int16 v28 = 2113;
        *(void *)v29 = v17;
        _os_log_impl(&dword_21B697000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
      }
      v7 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        buffer = self->_buffer;
        if (self->_client_desc) {
          uint64_t v19 = "YES";
        }
        else {
          uint64_t v19 = "NO";
        }
        if (self->_desc) {
          v20 = "YES";
        }
        else {
          v20 = "NO";
        }
        v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        if (buffer) {
          v21 = "YES";
        }
        else {
          v21 = "NO";
        }
        *(_DWORD *)buf = 136381955;
        __int16 v26 = 1025;
        int v27 = 184;
        __int16 v28 = 2081;
        *(void *)v29 = v19;
        *(_WORD *)&v29[8] = 2081;
        *(void *)&v29[10] = v20;
        *(_WORD *)&v29[18] = 2081;
        *(void *)&v29[20] = v21;
        *(_WORD *)&v29[28] = 2081;
        *(void *)&v29[30] = "NO";
        _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to cast fp32 buffer to fp16. clientDescriptorInit:%{private}s descriptorInit:%{private}s srcBufferInit:%{private}s, dstBufferInit:%{private}s ***", buf, 0x3Au);
      }
      goto LABEL_6;
    }
    e5rt_buffer_object_release();
  }
  else
  {
    e5rt_io_port_bind_buffer_object();
    if (self->_buffer) {
      e5rt_buffer_object_release();
    }
    self->_buffer = 0;
  }
  memory_iosurface = self->_memory_iosurface;
  if (memory_iosurface) {
    CFRelease(memory_iosurface);
  }
  v23 = (__IOSurface *)CFRetain(a3);
  int64_t result = 0;
  self->_memory_iosurface = v23;
  return result;
}

- (void)bindRawPointer:(const void *)a3
{
  if (e5rt_tensor_desc_alloc_buffer_object())
  {
    uint64_t v4 = 204;
    goto LABEL_20;
  }
  if (e5rt_tensor_desc_get_size())
  {
    uint64_t v4 = 207;
    goto LABEL_20;
  }
  if (e5rt_buffer_object_get_data_ptr())
  {
    uint64_t v4 = 211;
    goto LABEL_20;
  }
  if (!self->_isFP16_ANE)
  {
    if (!self->_isFP32) {
      return;
    }
    if (e5rt_io_port_bind_buffer_object())
    {
      uint64_t v4 = 219;
    }
    else
    {
      buffer = self->_buffer;
      p_buffer = &self->_buffer;
      if (!buffer || !e5rt_buffer_object_release())
      {
        *p_buffer = 0;
        return;
      }
      uint64_t v4 = 221;
    }
LABEL_20:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  if (e5rt_tensor_utils_cast_from_fp32_to_fp16())
  {
    uint64_t v4 = 215;
    goto LABEL_20;
  }
  if (e5rt_buffer_object_release())
  {
    uint64_t v4 = 216;
    goto LABEL_20;
  }
}

- (void)getDataPtr
{
  if (e5rt_buffer_object_get_data_ptr())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 230);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (int)getComponentType
{
  if (e5rt_tensor_desc_retain_dtype())
  {
    uint64_t v3 = 237;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_get_component_dtype())
  {
    uint64_t v3 = 239;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    uint64_t v3 = 240;
LABEL_8:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 0;
}

- (unsigned)getNumComponents
{
  if (e5rt_tensor_desc_retain_dtype())
  {
    uint64_t v3 = 247;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_get_num_components())
  {
    uint64_t v3 = 249;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    uint64_t v3 = 250;
LABEL_8:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 0;
}

- (unint64_t)getComponentSize
{
  if (e5rt_tensor_desc_retain_dtype())
  {
    uint64_t v3 = 257;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_get_component_size())
  {
    uint64_t v3 = 259;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    uint64_t v3 = 260;
LABEL_8:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 0;
}

- (unint64_t)getRank
{
  if (e5rt_tensor_desc_get_rank())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 267);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (const)getShape
{
  if (e5rt_tensor_desc_get_shape())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 275);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (const)getStrides
{
  if (e5rt_tensor_desc_get_strides())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 283);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (unint64_t)getWidth
{
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getRank];
  return *([(SIE5RTTensorPortDescriptor *)self getShape] + 8 * v3 - 8);
}

- (unint64_t)getHeight
{
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getRank];
  return *([(SIE5RTTensorPortDescriptor *)self getShape] + 8 * v3 - 16);
}

- (unint64_t)getChannels
{
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getRank];
  return *([(SIE5RTTensorPortDescriptor *)self getShape] + 8 * v3 - 24);
}

- (unint64_t)getBatchnum
{
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getRank];
  return *([(SIE5RTTensorPortDescriptor *)self getShape] + 8 * v3 - 32);
}

- (unint64_t)getBytePerRow
{
  return [(SIE5RTTensorPortDescriptor *)self getStrides][16];
}

- (unint64_t)getRowElements
{
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getBytePerRow];
  return v3 / [(SIE5RTTensorPortDescriptor *)self getComponentSize];
}

- (__IOSurface)getIOSurface
{
  return self->_memory_iosurface;
}

- (BOOL)isPacked
{
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getStrides];
  id v4 = [(SIE5RTTensorPortDescriptor *)self getShape];
  unint64_t v5 = [(SIE5RTTensorPortDescriptor *)self getRank];
  v6 = &v3[v5 - 1];
  unint64_t v7 = v5 - 1;
  do
  {
    unint64_t v8 = v7;
    if (!v7) {
      break;
    }
    unint64_t v9 = v4[v7] * *v6;
    uint64_t v10 = *--v6;
    --v7;
  }
  while (v9 == v10);
  return v8 == 0;
}

- (BOOL)isPackedFP32
{
  if ([(SIE5RTTensorPortDescriptor *)self getComponentType] != 4
    || [(SIE5RTTensorPortDescriptor *)self getComponentSize] != 4)
  {
    return 0;
  }
  return [(SIE5RTTensorPortDescriptor *)self isPacked];
}

- (BOOL)isFP16_ANE
{
  if ([(SIE5RTTensorPortDescriptor *)self getComponentType] != 4
    || [(SIE5RTTensorPortDescriptor *)self getComponentSize] != 2)
  {
    return 0;
  }
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getRank];
  return (*([(SIE5RTTensorPortDescriptor *)self getStrides] + 8 * v3 - 16) & 0x3F) == 0;
}

- (BOOL)isS8_ANE
{
  if ([(SIE5RTTensorPortDescriptor *)self getComponentType] != 1
    || [(SIE5RTTensorPortDescriptor *)self getComponentSize] != 1)
  {
    return 0;
  }
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getRank];
  return (*([(SIE5RTTensorPortDescriptor *)self getStrides] + 8 * v3 - 16) & 0x3F) == 0;
}

- (BOOL)isU8_ANE
{
  if ([(SIE5RTTensorPortDescriptor *)self getComponentType]
    || [(SIE5RTTensorPortDescriptor *)self getComponentSize] != 1)
  {
    return 0;
  }
  unint64_t v3 = [(SIE5RTTensorPortDescriptor *)self getRank];
  return (*([(SIE5RTTensorPortDescriptor *)self getStrides] + 8 * v3 - 16) & 0x3F) == 0;
}

- (e5rt_tensor_desc)createPackedFP32TensorDescriptor
{
  if (![(SIE5RTTensorPortDescriptor *)self isPackedFP32])
  {
    [(SIE5RTTensorPortDescriptor *)self getNumComponents];
    if (e5rt_tensor_desc_dtype_create())
    {
      uint64_t v3 = 416;
    }
    else
    {
      [(SIE5RTTensorPortDescriptor *)self getShape];
      [(SIE5RTTensorPortDescriptor *)self getRank];
      if (e5rt_tensor_desc_create())
      {
        uint64_t v3 = 421;
      }
      else
      {
        if (!e5rt_tensor_desc_dtype_release()) {
          return 0;
        }
        uint64_t v3 = 422;
      }
    }
LABEL_11:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    uint64_t v3 = 399;
    goto LABEL_11;
  }
  return 0;
}

- (unint64_t)getNumberOfElements
{
  if (e5rt_tensor_desc_get_shape())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 430);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 1;
}

@end