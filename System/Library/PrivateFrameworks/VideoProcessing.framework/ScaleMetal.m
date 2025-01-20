@interface ScaleMetal
- (ScaleMetal)init;
- (ScaleMetal)initWithDevice:(__CVBuffer *)a3;
- (id).cxx_construct;
- (id)compileFunction:(id)a3;
- (id)compileFunction:(id)a3 constantValues:(id)a4;
- (id)uintTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5;
- (id)unormTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5;
- (int)scaleFrame:(__CVBuffer *)a3 dstFrame:(__CVBuffer *)a4 srcRegion:(id *)a5 dstRegion:(id *)a6 scaleMethod:(int)a7;
- (int)scaleFrameBilinear:(__CVBuffer *)a3 dstFrame:(__CVBuffer *)a4 srcRegion:(id *)a5 dstRegion:(id *)a6;
- (void)CompileBilinearScaler:(BOOL)a3;
@end

@implementation ScaleMetal

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1BB9C4888((const void **)&self->_textureCacheChroma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheLuma.value_);
  objc_storeStrong((id *)&self->_bilinearScaleChroma, 0);
  objc_storeStrong((id *)&self->_bilinearScaleLuma, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lanczosKernel, 0);
  objc_storeStrong((id *)&self->_bilinearKernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (int)scaleFrameBilinear:(__CVBuffer *)a3 dstFrame:(__CVBuffer *)a4 srcRegion:(id *)a5 dstRegion:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a4 || CVPixelBufferGetPlaneCount(a3) != 2) {
    return -12902;
  }
  int v9 = (int)[(ScaleMetal *)self initWithDevice:a3];
  if (!v9)
  {
    pixelBuffer = a3;
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    BOOL v55 = sub_1BBA13A1C(PixelFormatType) == 10;
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
    size_t v46 = CVPixelBufferGetWidthOfPlane(a4, 1uLL);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
    size_t v44 = CVPixelBufferGetHeightOfPlane(a4, 1uLL);
    [(ScaleMetal *)self CompileBilinearScaler:1];
    if (self->_bilinearScaleLuma && self->_bilinearScaleChroma)
    {
      v43 = a4;
      v38 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      [v38 setLabel:@"Bilinear frame scaler (interpolator)"];
      [v38 computeCommandEncoder];
      v12 = v11 = a4;
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      size_t v40 = CVPixelBufferGetWidth(v11);
      size_t v39 = CVPixelBufferGetHeight(v11);
      uint64_t v13 = 0;
      char v14 = 1;
      while (1)
      {
        char v15 = v14;
        BOOL v21 = (v14 & 1) == 0;
        uint64_t v16 = 56;
        if (!v21) {
          uint64_t v16 = 48;
        }
        id v17 = *(id *)((char *)&self->super.isa + v16);
        v18 = [(ScaleMetal *)self unormTexture:pixelBuffer forPlane:v13 withAttributes:self->_readAttributes];
        v19 = [(ScaleMetal *)self unormTexture:v43 forPlane:v13 withAttributes:self->_writeAttributes];
        v20 = v19;
        BOOL v21 = !v18 || v19 == 0;
        if (v21) {
          break;
        }
        if (WidthOfPlane <= v46) {
          char v22 = 0;
        }
        else {
          char v22 = v13;
        }
        unint64_t var0 = a5->var0.var0;
        unint64_t var1 = a5->var0.var1;
        if (HeightOfPlane <= v44) {
          char v25 = 0;
        }
        else {
          char v25 = v13;
        }
        v57[0] = a5->var0.var0 >> v22;
        v57[1] = var1 >> v25;
        unint64_t v26 = Width - var0;
        if (v26 >= a5->var1.var0) {
          unint64_t v26 = a5->var1.var0;
        }
        unsigned int v27 = v26 >> v22;
        unint64_t v28 = Height - var1;
        if (v28 >= a5->var1.var1) {
          unint64_t v28 = a5->var1.var1;
        }
        v57[2] = v27;
        v57[3] = v28 >> v25;
        unint64_t v29 = a6->var0.var0;
        unint64_t v30 = a6->var0.var1;
        v56[0] = a6->var0.var0 >> v22;
        v56[1] = v30 >> v25;
        unint64_t v31 = v40 - v29;
        if (v31 >= a6->var1.var0) {
          unint64_t v31 = a6->var1.var0;
        }
        uint64_t v32 = v31 >> v22;
        LODWORD(v33) = v39 - v30;
        if (v39 - v30 >= a6->var1.var1) {
          unint64_t v33 = a6->var1.var1;
        }
        uint64_t v34 = v33 >> v25;
        v56[2] = v32;
        v56[3] = v33 >> v25;
        unint64_t v35 = [v17 threadExecutionWidth];
        unint64_t v36 = [v17 maxTotalThreadsPerThreadgroup];
        [v12 setComputePipelineState:v17];
        [v12 setTexture:v18 atIndex:0];
        [v12 setTexture:v20 atIndex:1];
        [v12 setBytes:v57 length:16 atIndex:0];
        [v12 setBytes:v56 length:16 atIndex:1];
        [v12 setBytes:&v55 length:1 atIndex:2];
        if (self->_supportsNonuniformThreadgroups)
        {
          v54[0] = v32;
          v54[1] = v34;
          v54[2] = 1;
          v53[0] = v35;
          v53[1] = v36 / v35;
          v53[2] = 1;
          [v12 dispatchThreads:v54 threadsPerThreadgroup:v53];
        }
        else
        {
          v52[0] = (v32 + v35 - 1) / v35;
          v52[1] = (v34 + v36 / v35 - 1) / (v36 / v35);
          v52[2] = 1;
          v51[0] = v35;
          v51[1] = v36 / v35;
          v51[2] = 1;
          [v12 dispatchThreadgroups:v52 threadsPerThreadgroup:v51];
        }

        char v14 = 0;
        uint64_t v13 = 1;
        if ((v15 & 1) == 0)
        {
          [v12 endEncoding];
          [v38 commit];
          [v38 waitUntilCompleted];
          int v9 = 0;
          goto LABEL_36;
        }
      }

      int v9 = -12911;
LABEL_36:
    }
    else
    {
      return -12911;
    }
  }
  return v9;
}

- (void)CompileBilinearScaler:(BOOL)a3
{
  if (!self->_bilinearScaleLuma)
  {
    BOOL v3 = a3;
    if (([(MTLDevice *)self->_device supportsFamily:2002] & 1) != 0
      || ([(MTLDevice *)self->_device supportsFamily:1004] & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = [(MTLDevice *)self->_device supportsFamily:3003];
    }
    self->_supportsNonuniformThreadgroups = v5;
    id v12 = (id)objc_opt_new();
    [v12 setConstantValue:&self->_supportsNonuniformThreadgroups type:53 atIndex:0];
    if (v3)
    {
      v6 = [(ScaleMetal *)self compileFunction:@"bilinearScaleUnormLuma" constantValues:v12];
      bilinearScaleLuma = self->_bilinearScaleLuma;
      self->_bilinearScaleLuma = v6;

      [(ScaleMetal *)self compileFunction:@"bilinearScaleUnormChroma" constantValues:v12];
    }
    else
    {
      int v9 = [(ScaleMetal *)self compileFunction:@"bilinearScaleUintLuma" constantValues:v12];
      v10 = self->_bilinearScaleLuma;
      self->_bilinearScaleLuma = v9;

      [(ScaleMetal *)self compileFunction:@"bilinearScaleUintChroma" constantValues:v12];
    }
    v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    bilinearScaleChroma = self->_bilinearScaleChroma;
    self->_bilinearScaleChroma = v8;
  }
}

- (int)scaleFrame:(__CVBuffer *)a3 dstFrame:(__CVBuffer *)a4 srcRegion:(id *)a5 dstRegion:(id *)a6 scaleMethod:(int)a7
{
  if (!a4 || CVPixelBufferGetPlaneCount(a3) != 2) {
    return -12902;
  }
  int v13 = (int)[(ScaleMetal *)self initWithDevice:a3];
  if (!v13)
  {
    unint64_t v31 = a6;
    char v14 = [(ScaleMetal *)self unormTexture:a3 forPlane:0 withAttributes:self->_readAttributes];
    char v15 = [(ScaleMetal *)self unormTexture:a3 forPlane:1 withAttributes:self->_readAttributes];
    uint64_t v16 = [(ScaleMetal *)self unormTexture:a4 forPlane:0 withAttributes:self->_writeAttributes];
    uint64_t v17 = [(ScaleMetal *)self unormTexture:a4 forPlane:1 withAttributes:self->_writeAttributes];
    v18 = (void *)v17;
    uint64_t v32 = v16;
    int v13 = -12911;
    if (!v14)
    {
      v19 = (void *)v16;
      goto LABEL_19;
    }
    v19 = (void *)v16;
    if (!v15 || !v16 || !v17) {
      goto LABEL_19;
    }
    v20 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v20 setLabel:@"Frame scaler (interpolator)"];
    if (a7 == 1)
    {
      if (!self->_lanczosKernel)
      {
        unint64_t v26 = (MPSImageLanczosScale *)[objc_alloc(MEMORY[0x1E4F355C0]) initWithDevice:self->_device];
        lanczosKernel = self->_lanczosKernel;
        self->_lanczosKernel = v26;
      }
    }
    else if (!a7)
    {
      bilinearKernel = self->_bilinearKernel;
      if (!bilinearKernel)
      {
        char v22 = (MPSImageBilinearScale *)[objc_alloc(MEMORY[0x1E4F35548]) initWithDevice:self->_device];
        v23 = self->_bilinearKernel;
        self->_bilinearKernel = v22;

        bilinearKernel = self->_bilinearKernel;
      }
      v24 = bilinearKernel;
      goto LABEL_18;
    }
    v24 = self->_lanczosKernel;
    float64x2_t v28 = vdivq_f64(vcvtq_f64_u64(*(uint64x2_t *)&v31->var1.var0), vcvtq_f64_u64(*(uint64x2_t *)&a5->var1.var0));
    float64x2_t v29 = vmulq_f64(v28, vnegq_f64(vcvtq_f64_u64(*(uint64x2_t *)&a5->var0.var0)));
    v34[0] = v28;
    v34[1] = v29;
    [(MPSImageLanczosScale *)v24 setScaleTransform:v34];
    long long v30 = *(_OWORD *)&v31->var0.var2;
    v33[0] = *(_OWORD *)&v31->var0.var0;
    v33[1] = v30;
    v33[2] = *(_OWORD *)&v31->var1.var1;
    [(MPSImageLanczosScale *)v24 setClipRect:v33];
    [(MPSImageLanczosScale *)v24 setEdgeMode:1];
    [(MPSImageLanczosScale *)v24 encodeToCommandBuffer:v20 sourceTexture:v14 destinationTexture:v32];
    [(MPSImageLanczosScale *)v24 encodeToCommandBuffer:v20 sourceTexture:v15 destinationTexture:v18];
    [v20 commit];
    [v20 waitUntilCompleted];
    int v13 = 0;
LABEL_18:

LABEL_19:
  }
  return v13;
}

- (id)uintTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a5;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unsigned int v10 = sub_1BBA13A1C(PixelFormatType);
  uint64_t v11 = 33;
  if (!a4) {
    uint64_t v11 = 13;
  }
  uint64_t v12 = 63;
  if (!a4) {
    uint64_t v12 = 23;
  }
  uint64_t v13 = 80;
  if (!a4) {
    uint64_t v13 = 72;
  }
  CFTypeRef cf = 0;
  if (v10 <= 8) {
    MTLPixelFormat v14 = v11;
  }
  else {
    MTLPixelFormat v14 = v12;
  }
  char v15 = *(Class *)((char *)&self->super.isa + v13);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v14, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    v18 = 0;
  }
  else
  {
    v18 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v18;
}

- (id)unormTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a5;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int v10 = PixelFormatType;
  if (a4) {
    MTLPixelFormat v11 = MTLPixelFormatRG8Unorm;
  }
  else {
    MTLPixelFormat v11 = MTLPixelFormatR8Unorm;
  }
  if (sub_1BBA13A1C(PixelFormatType) == 10)
  {
    if (v10 > 1882468911)
    {
      if (v10 > 1885745711)
      {
        if (v10 == 1885745712) {
          goto LABEL_18;
        }
        int v13 = 1885746228;
      }
      else
      {
        if (v10 == 1882468912) {
          goto LABEL_18;
        }
        int v13 = 1882469428;
      }
    }
    else
    {
      if (v10 > 645428783)
      {
        if (v10 == 645428784) {
          goto LABEL_18;
        }
        unsigned __int16 v12 = 30260;
      }
      else
      {
        if (v10 == 645424688) {
          goto LABEL_18;
        }
        unsigned __int16 v12 = 26164;
      }
      int v13 = v12 | 0x26780000;
    }
    if (v10 == v13)
    {
LABEL_18:
      if (a4) {
        MTLPixelFormat v11 = MTLPixelFormatRGBA8Uint|0x204;
      }
      else {
        MTLPixelFormat v11 = 588;
      }
      goto LABEL_21;
    }
    if (a4) {
      MTLPixelFormat v11 = 578;
    }
    else {
      MTLPixelFormat v11 = 576;
    }
  }
LABEL_21:
  uint64_t v14 = 80;
  if (!a4) {
    uint64_t v14 = 72;
  }
  char v15 = *(Class *)((char *)&self->super.isa + v14);
  CFTypeRef cf = 0;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v11, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    v18 = 0;
  }
  else
  {
    v18 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v18;
}

- (id)compileFunction:(id)a3
{
  BOOL v3 = [(ScaleMetal *)self compileFunction:a3 constantValues:0];

  return v3;
}

- (id)compileFunction:(id)a3 constantValues:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  library = self->_library;
  if (!library)
  {
    unsigned __int16 v12 = 0;
    goto LABEL_14;
  }
  if (v7)
  {
    id v16 = 0;
    int v9 = (void *)[(MTLLibrary *)library newFunctionWithName:v6 constantValues:v7 error:&v16];
    id v10 = v16;
    if (v9) {
      goto LABEL_4;
    }
LABEL_10:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unalbe to find kernel %@ with error %@", buf, 0x16u);
    }
    unsigned __int16 v12 = 0;
    goto LABEL_13;
  }
  int v9 = (void *)[(MTLLibrary *)library newFunctionWithName:v6];
  id v10 = 0;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_4:
  device = self->_device;
  id v15 = v10;
  unsigned __int16 v12 = (void *)[(MTLDevice *)device newComputePipelineStateWithFunction:v9 error:&v15];
  id v13 = v15;

  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed compiling %@ with error %@", buf, 0x16u);
  }

  id v10 = v13;
LABEL_13:

LABEL_14:

  return v12;
}

- (ScaleMetal)initWithDevice:(__CVBuffer *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    p_device = &self->_device;
    device = self->_device;
    if (!device) {
      goto LABEL_9;
    }
    return 0;
  }
  CVPixelBufferGetIOSurface(a3);
  uint64_t RegistryID = IOSurfaceGetRegistryID();
  p_device = &self->_device;
  char v5 = self->_device;
  if (!v5)
  {
    device = 0;
    goto LABEL_9;
  }
  if (!RegistryID || [(MTLDevice *)v5 registryID] == RegistryID) {
    return 0;
  }
  device = *p_device;
LABEL_9:
  self->_device = 0;

  bilinearScaleLuma = self->_bilinearScaleLuma;
  self->_bilinearScaleLuma = 0;

  bilinearScaleChroma = self->_bilinearScaleChroma;
  self->_bilinearScaleChroma = 0;

  MTLPixelFormat v11 = self->_device;
  if (v11
    || (unsigned __int16 v12 = (MTLDevice *)MTLCreateSystemDefaultDevice(),
        id v13 = *p_device,
        *p_device = v12,
        v13,
        (MTLPixelFormat v11 = *p_device) != 0))
  {
    uint64_t v14 = (MTLCommandQueue *)[(MTLDevice *)v11 newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v14;

    if (self->_commandQueue)
    {
      id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v17 = [v16 URLForResource:@"ProcessAccelerate" withExtension:@"metallib"];
      if (v17)
      {
        id v18 = *p_device;
        id v33 = 0;
        __int16 v19 = (MTLLibrary *)[(MTLDevice *)v18 newLibraryWithURL:v17 error:&v33];
        id v20 = v33;
        library = self->_library;
        self->_library = v19;

        if (self->_library)
        {
          if (!self->_readAttributes)
          {
            uint64_t v36 = *MEMORY[0x1E4F24C88];
            v37 = &unk_1F14F4468;
            char v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            readAttributes = self->_readAttributes;
            self->_readAttributes = v22;
          }
          if (!self->_writeAttributes)
          {
            uint64_t v34 = *MEMORY[0x1E4F24C88];
            unint64_t v35 = &unk_1F14F4480;
            v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            writeAttributes = self->_writeAttributes;
            self->_writeAttributes = v24;
          }
          value = self->_textureCacheLuma.value_;
          unsigned int v27 = self->_device;
          if (value)
          {
            CFRelease(value);
            self->_textureCacheLuma.value_ = 0;
          }
          CFDictionaryRef v8 = (ScaleMetal *)CVMetalTextureCacheCreate(0, 0, v27, 0, &self->_textureCacheLuma.value_);
          if (!v8)
          {
            long long v30 = self->_textureCacheChroma.value_;
            p_textureCacheChroma = &self->_textureCacheChroma;
            float64x2_t v28 = v30;
            unint64_t v31 = p_textureCacheChroma[-9].value_;
            if (v30)
            {
              CFRelease(v28);
              p_textureCacheChroma->value_ = 0;
            }
            CFDictionaryRef v8 = (ScaleMetal *)CVMetalTextureCacheCreate(0, 0, v31, 0, &p_textureCacheChroma->value_);
          }
          goto LABEL_29;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          size_t v39 = v16;
          __int16 v40 = 2112;
          id v41 = v20;
          _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
        }
      }
      else
      {
        id v20 = 0;
      }
      CFDictionaryRef v8 = 0;
LABEL_29:

      return v8;
    }
  }
  return (ScaleMetal *)4294954385;
}

- (ScaleMetal)init
{
  v6.receiver = self;
  v6.super_class = (Class)ScaleMetal;
  v2 = [(ScaleMetal *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(ScaleMetal *)v2 initWithDevice:0];
    v4 = v3;
  }

  return v3;
}

@end