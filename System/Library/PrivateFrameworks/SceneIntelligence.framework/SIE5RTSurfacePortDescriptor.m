@interface SIE5RTSurfacePortDescriptor
- (SIE5RTSurfacePortDescriptor)initWithE5RTPort:(e5rt_io_port *)a3 portType:(int64_t)a4;
- (__IOSurface)getIOSurface;
- (const)getShape;
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
- (void)bindRawPointer:(const void *)a3;
- (void)dealloc;
- (void)getDataPtr;
@end

@implementation SIE5RTSurfacePortDescriptor

- (SIE5RTSurfacePortDescriptor)initWithE5RTPort:(e5rt_io_port *)a3 portType:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)SIE5RTSurfacePortDescriptor;
  v5 = [(SIE5RTSurfacePortDescriptor *)&v19 init];
  if (v5)
  {
    if (e5rt_io_port_retain_surface_desc())
    {
      v6 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 39);
        v7 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381187;
        v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
        __int16 v22 = 1025;
        int v23 = 39;
        __int16 v24 = 2113;
        v25 = v7;
        _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
      }
      v8 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = "YES";
        v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
        *(_DWORD *)buf = 136381187;
        if (!a3) {
          v9 = "NO";
        }
        __int16 v22 = 1025;
        int v23 = 39;
        __int16 v24 = 2081;
        v25 = v9;
        _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the descriptor for surface port. port is init: %{private}s ***", buf, 0x1Cu);
      }
    }
    else
    {
      v5->_port = a3;
      if (e5rt_surface_desc_get_width())
      {
        v10 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 44);
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          __int16 v22 = 1025;
          int v23 = 44;
          __int16 v24 = 2113;
          v25 = v11;
          _os_log_impl(&dword_21B697000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
        }
        v12 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          __int16 v22 = 1025;
          int v23 = 44;
          _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the width surface port. ***", buf, 0x12u);
        }
      }
      else if (e5rt_surface_desc_get_height())
      {
        v13 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 47);
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          __int16 v22 = 1025;
          int v23 = 47;
          __int16 v24 = 2113;
          v25 = v14;
          _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
        }
        v12 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          __int16 v22 = 1025;
          int v23 = 47;
          _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the height surface port. ***", buf, 0x12u);
        }
      }
      else
      {
        if (!e5rt_surface_desc_get_format())
        {
          v17 = v5;
          goto LABEL_29;
        }
        v15 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 50);
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          __int16 v22 = 1025;
          int v23 = 50;
          __int16 v24 = 2113;
          v25 = v16;
          _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
        }
        v12 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          __int16 v22 = 1025;
          int v23 = 50;
          _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the format surface port. ***", buf, 0x12u);
        }
      }
    }
  }
  v17 = 0;
LABEL_29:

  return v17;
}

- (int64_t)bindIOSurface:(__IOSurface *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (e5rt_surface_object_create_from_iosurface())
  {
    v4 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 65);
      *(_DWORD *)buf = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      __int16 v18 = 1025;
      int v19 = 65;
      __int16 v20 = 2113;
      *(void *)v21 = v5;
      _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
    }
    v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      IOSurfaceID ID = IOSurfaceGetID(a3);
      size_t Width = IOSurfaceGetWidth(a3);
      size_t Height = IOSurfaceGetHeight(a3);
      size_t BytesPerRow = IOSurfaceGetBytesPerRow(a3);
      OSType PixelFormat = IOSurfaceGetPixelFormat(a3);
      v12 = SIPixelFormatToStr(PixelFormat);
      *(_DWORD *)buf = 136382211;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      __int16 v18 = 1025;
      int v19 = 65;
      __int16 v20 = 1024;
      *(_DWORD *)v21 = ID;
      *(_WORD *)&v21[4] = 2049;
      *(void *)&v21[6] = Width;
      __int16 v22 = 2049;
      size_t v23 = Height;
      __int16 v24 = 2049;
      size_t v25 = BytesPerRow;
      __int16 v26 = 2113;
      v27 = v12;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the e5rt buffer from an existing iosurface: id=%d, width=%{private}lu, height=%{private}lu, stride=%{private}lu, format=%{private}@ ***", buf, 0x40u);
    }
LABEL_12:

    return 7;
  }
  if (e5rt_io_port_bind_surface_object())
  {
    v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 68);
      *(_DWORD *)buf = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      __int16 v18 = 1025;
      int v19 = 68;
      __int16 v20 = 2113;
      *(void *)v21 = v14;
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
    }
    v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      __int16 v18 = 1025;
      int v19 = 68;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to bind the internal iosurface for output port. ***", buf, 0x12u);
    }
    goto LABEL_12;
  }
  e5rt_surface_object_release();
  return 0;
}

- (unint64_t)getWidth
{
  return self->_width;
}

- (unint64_t)getHeight
{
  return self->_height;
}

- (void)bindRawPointer:(const void *)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 84;
    _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }
}

- (unint64_t)getBatchnum
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 90;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getChannels
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 96;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (void)getDataPtr
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 102;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getNumberOfElements
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 108;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getRank
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 114;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getRowElements
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 120;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (const)getShape
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 126;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getBytePerRow
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 131;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getComponentSize
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 137;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (__IOSurface)getIOSurface
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    __int16 v6 = 1025;
    int v7 = 142;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (void)dealloc
{
  if (self->_port) {
    e5rt_io_port_release();
  }
  if (self->_desc) {
    e5rt_surface_desc_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)SIE5RTSurfacePortDescriptor;
  [(SIE5RTSurfacePortDescriptor *)&v3 dealloc];
}

@end