@interface SIScaler
- (BOOL)_imageConformsToOutput:(__CVBuffer *)a3;
- (BOOL)scaleImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4;
- (__CVBuffer)createScaledImage:(__CVBuffer *)a3;
- (id)initForInputResolution:(CGSize)a3 outputResolution:(CGSize)a4 outputPixelFormat:(unsigned int)a5;
- (id)initForInputResolution:(CGSize)a3 outputResolution:(CGSize)a4 outputPixelFormat:(unsigned int)a5 mode:(unint64_t)a6;
- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5;
- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5 algorithmKey:(id)a6;
- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5 bytePerRowAlignment:(unint64_t)a6 algorithmKey:(id)a7;
- (void)dealloc;
@end

@implementation SIScaler

- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5 bytePerRowAlignment:(unint64_t)a6 algorithmKey:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SIScaler;
  v14 = [(SIScaler *)&v27 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_23;
  }
  if (width == 0.0 || height == 0.0)
  {
    v16 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      __int16 v30 = 1025;
      int v31 = 43;
      __int16 v32 = 2048;
      double v33 = width;
      __int16 v34 = 2048;
      double v35 = height;
      v17 = " %{private}s:%{private}d *** Failed to initialize the scale: Unsupported Resolution (%.2f, %.2f) ***";
      v18 = v16;
      uint32_t v19 = 38;
LABEL_21:
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v14->_outputResolution.double width = width;
  v14->_outputResolution.double height = height;
  v14->_outputPixelFormat = v9;
  v14->_uint64_t outputBufferBytePerRowAlignment = a6;
  if (VTPixelTransferSessionCreate(0, &v14->_session))
  {
    v16 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      __int16 v30 = 1025;
      int v31 = 50;
      v17 = " %{private}s:%{private}d *** Failure to create vtPixelTransferSession ***";
LABEL_20:
      v18 = v16;
      uint32_t v19 = 18;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v20 = (CFTypeRef *)MEMORY[0x263F1EC70];
  v21 = (CFTypeRef *)MEMORY[0x263F1EC80];
  if (a5 != 1) {
    v21 = (CFTypeRef *)MEMORY[0x263F1EC78];
  }
  if (a5 != 2) {
    v20 = v21;
  }
  if (!VTSessionSetProperty(v15->_session, (CFStringRef)*MEMORY[0x263F1EA08], *v20))
  {
    uint64_t outputBufferBytePerRowAlignment = v15->_outputBufferBytePerRowAlignment;
    uint64_t v23 = (int)v15->_outputResolution.width;
    uint64_t v24 = (int)v15->_outputResolution.height;
    if (outputBufferBytePerRowAlignment)
    {
      if (SIPixelBufferPoolCreateWithBytePerRowAlignment(v23, v24, v9, outputBufferBytePerRowAlignment, &v15->_pool))goto LABEL_18; {
    }
      }
    else if (SIPixelBufferPoolCreate(v23, v24, v9, &v15->_pool))
    {
LABEL_18:
      v16 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
        __int16 v30 = 1025;
        int v31 = 76;
        v17 = " %{private}s:%{private}d *** Failure to create pixel buffer pool for downscaling ***";
        goto LABEL_20;
      }
      goto LABEL_22;
    }
    v15->_algorithmKey = UInt64BitsFromString(v13);
    v25 = v15;
    goto LABEL_24;
  }
  v16 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
    __int16 v30 = 1025;
    int v31 = 64;
    v17 = " %{private}s:%{private}d *** Failure to set scaling mode on pixel transfer session ***";
    goto LABEL_20;
  }
LABEL_22:

LABEL_23:
  v25 = 0;
LABEL_24:

  return v25;
}

- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5 algorithmKey:(id)a6
{
  return -[SIScaler initForOutputResolution:outputPixelFormat:mode:bytePerRowAlignment:algorithmKey:](self, "initForOutputResolution:outputPixelFormat:mode:bytePerRowAlignment:algorithmKey:", *(void *)&a4, a5, 0, a6, a3.width, a3.height);
}

- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5
{
  return [(SIScaler *)self initForOutputResolution:*(void *)&a4, a5, @"Unknown", a3.width, a3.height outputPixelFormat mode algorithmKey];
}

- (id)initForInputResolution:(CGSize)a3 outputResolution:(CGSize)a4 outputPixelFormat:(unsigned int)a5 mode:(unint64_t)a6
{
  return -[SIScaler initForOutputResolution:outputPixelFormat:mode:](self, "initForOutputResolution:outputPixelFormat:mode:", *(void *)&a5, a6, a4.width, a4.height);
}

- (id)initForInputResolution:(CGSize)a3 outputResolution:(CGSize)a4 outputPixelFormat:(unsigned int)a5
{
  return -[SIScaler initForOutputResolution:outputPixelFormat:mode:](self, "initForOutputResolution:outputPixelFormat:mode:", *(void *)&a5, 0, a4.width, a4.height);
}

- (BOOL)scaleImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  return a3 && VTPixelTransferSessionTransferImage(self->_session, a3, a4) == 0;
}

- (__CVBuffer)createScaledImage:(__CVBuffer *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      __int16 v11 = 1025;
      int v12 = 143;
      v7 = " %{private}s:%{private}d *** Error! Scaler gets nil input. ***";
LABEL_14:
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
    }
LABEL_15:

    return 0;
  }
  CVPixelBufferGetWidth(a3);
  CVPixelBufferGetHeight(a3);
  kdebug_trace();
  if (![(SIScaler *)self _imageConformsToOutput:a3])
  {
    CVPixelBufferRef pixelBufferOut = 0;
    if (CVPixelBufferPoolCreatePixelBuffer(0, self->_pool, &pixelBufferOut))
    {
      v6 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
        __int16 v11 = 1025;
        int v12 = 159;
        v7 = " %{private}s:%{private}d *** Failure to create pixel buffer for downscaling ***";
        goto LABEL_14;
      }
    }
    else
    {
      if (!VTPixelTransferSessionTransferImage(self->_session, a3, pixelBufferOut))
      {
        kdebug_trace();
        return pixelBufferOut;
      }
      v6 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
        __int16 v11 = 1025;
        int v12 = 162;
        v7 = " %{private}s:%{private}d *** Failure to perform downscaling/conversion via pixel transfer ***";
        goto LABEL_14;
      }
    }
    goto LABEL_15;
  }
  kdebug_trace();
  return CVPixelBufferRetain(a3);
}

- (BOOL)_imageConformsToOutput:(__CVBuffer *)a3
{
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    double width = self->_outputResolution.width;
    if (width == (double)CVPixelBufferGetWidth(a3)
      && (double height = self->_outputResolution.height, height == (double)CVPixelBufferGetHeight(a3))
      && (unsigned int outputPixelFormat = self->_outputPixelFormat, outputPixelFormat == CVPixelBufferGetPixelFormatType(a3)))
    {
      unint64_t outputBufferBytePerRowAlignment = self->_outputBufferBytePerRowAlignment;
      if (outputBufferBytePerRowAlignment) {
        LOBYTE(IOSurface) = outputBufferBytePerRowAlignment == CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      }
      else {
        LOBYTE(IOSurface) = 1;
      }
    }
    else
    {
      LOBYTE(IOSurface) = 0;
    }
  }
  return (char)IOSurface;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_pool);
  session = self->_session;
  if (session)
  {
    VTPixelTransferSessionInvalidate(session);
    CFRelease(self->_session);
  }
  v4.receiver = self;
  v4.super_class = (Class)SIScaler;
  [(SIScaler *)&v4 dealloc];
}

@end