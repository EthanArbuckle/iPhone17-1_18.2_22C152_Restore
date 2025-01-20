@interface BufferFillMetal
- (BufferFillMetal)init;
- (BufferFillMetal)initWithDevice:(__CVBuffer *)a3;
- (id).cxx_construct;
- (id)compileFunction:(id)a3;
- (id)compileFunction:(id)a3 constantValues:(id)a4;
- (id)unormTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5;
- (int)ExtendEdges:(__CVBuffer *)a3 padSize:(unsigned int)a4[3];
- (int)FillBoundary:(__CVBuffer *)a3 padSize:(unsigned int)a4[3] fillValues:(int)a5[3];
- (int)FillBoundaryOrExtendEdges:(__CVBuffer *)a3 padSize:(unsigned int)a4[4] fillValues:(int)a5[3];
- (int)PreFill:(__CVBuffer *)a3 values:(int)a4[3];
- (void)CompileBufferFill;
@end

@implementation BufferFillMetal

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  sub_1BB9C4888((const void **)&self->_textureCacheChroma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheLuma.value_);
  objc_storeStrong((id *)&self->_preFillChroma, 0);
  objc_storeStrong((id *)&self->_preFillLuma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryTopBottomCornersChroma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryTopBottomCornersLuma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryLeftRightChroma, 0);
  objc_storeStrong((id *)&self->_fillBoundaryLeftRightLuma, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (int)PreFill:(__CVBuffer *)a3 values:(int)a4[3]
{
  if (*a4 < 0 || a4[1] < 0 || a4[2] < 0) {
    return -12902;
  }
  int v7 = (int)-[BufferFillMetal initWithDevice:](self, "initWithDevice:");
  if (!v7)
  {
    [(BufferFillMetal *)self CompileBufferFill];
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    BOOL v30 = sub_1BBA13A1C(PixelFormatType) == 10;
    v24 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v24 setLabel:@"Pre-fill pixel buffer"];
    int *__attribute__((__org_arrdim(0,3))) v25 = a4;
    v9 = [v24 computeCommandEncoder];
    size_t v10 = 0;
    char v11 = 1;
    while (1)
    {
      char v12 = v11;
      BOOL v13 = (v11 & 1) == 0;
      uint64_t v14 = 72;
      if (!v13) {
        uint64_t v14 = 64;
      }
      id v15 = *(id *)((char *)&self->super.isa + v14);
      if (!v15) {
        break;
      }
      v16 = v15;
      v17 = [(BufferFillMetal *)self unormTexture:a3 forPlane:v10 withAttributes:self->_readWriteAttributes];
      if (!v17)
      {

        break;
      }
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v10);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v10);
      unint64_t v20 = [v16 threadExecutionWidth];
      unint64_t v21 = [v16 maxTotalThreadsPerThreadgroup];
      if (v20 >= WidthOfPlane) {
        unint64_t v20 = WidthOfPlane;
      }
      if (v21 / v20 >= HeightOfPlane) {
        size_t v22 = HeightOfPlane;
      }
      else {
        size_t v22 = v21 / v20;
      }
      [v9 setComputePipelineState:v16];
      [v9 setTexture:v17 atIndex:0];
      [v9 setBytes:v25 length:12 atIndex:0];
      [v9 setBytes:&v30 length:1 atIndex:1];
      if (self->_supportsNonuniformThreadgroups)
      {
        v29[0] = WidthOfPlane;
        v29[1] = HeightOfPlane;
        v29[2] = 1;
        v28[0] = v20;
        v28[1] = v22;
        v28[2] = 1;
        [v9 dispatchThreads:v29 threadsPerThreadgroup:v28];
      }
      else
      {
        v27[0] = (WidthOfPlane + v20 - 1) / v20;
        v27[1] = (HeightOfPlane + v22 - 1) / v22;
        v27[2] = 1;
        v26[0] = v20;
        v26[1] = v22;
        v26[2] = 1;
        [v9 dispatchThreadgroups:v27 threadsPerThreadgroup:v26];
      }

      char v11 = 0;
      size_t v10 = 1;
      if ((v12 & 1) == 0)
      {
        [v9 endEncoding];
        [v24 commit];
        int v7 = 0;
        goto LABEL_24;
      }
    }
    int v7 = -12911;
LABEL_24:
  }
  return v7;
}

- (int)ExtendEdges:(__CVBuffer *)a3 padSize:(unsigned int)a4[3]
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v6 = -1;
  uint64_t v5 = -1;
  return [(BufferFillMetal *)self FillBoundaryOrExtendEdges:a3 padSize:a4 fillValues:&v5];
}

- (int)FillBoundary:(__CVBuffer *)a3 padSize:(unsigned int)a4[3] fillValues:(int)a5[3]
{
  if (*a5 < 0 || a5[1] < 0 || a5[2] < 0) {
    return -50;
  }
  else {
    return -[BufferFillMetal FillBoundaryOrExtendEdges:padSize:fillValues:](self, "FillBoundaryOrExtendEdges:padSize:fillValues:", a3, a4);
  }
}

- (int)FillBoundaryOrExtendEdges:(__CVBuffer *)a3 padSize:(unsigned int)a4[4] fillValues:(int)a5[3]
{
  uint64_t v7 = a3;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!*(void *)a4 && !a4[2] && !a4[3]) {
    return 0;
  }
  int v9 = (int)[(BufferFillMetal *)self initWithDevice:a3];
  if (!v9)
  {
    v54 = (uint32x4_t *)a4;
    [(BufferFillMetal *)self CompileBufferFill];
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
    BOOL v68 = sub_1BBA13A1C(PixelFormatType) == 10;
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v7, 0);
    size_t v12 = CVPixelBufferGetWidthOfPlane(v7, 1uLL);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v7, 0);
    size_t v14 = CVPixelBufferGetHeightOfPlane(v7, 1uLL);
    v56 = self;
    v53 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v53 setLabel:@"Fill frame boundaries"];
    id v15 = [v53 computeCommandEncoder];
    size_t v16 = 0;
    v17.i64[0] = WidthOfPlane;
    v17.i64[1] = HeightOfPlane;
    v18.i64[0] = v12;
    v18.i64[1] = v14;
    int8x8_t v19 = (int8x8_t)vmovn_s64((int64x2_t)vcgtq_u64(v17, v18));
    char v20 = 1;
    while (1)
    {
      char v55 = v20;
      BOOL v21 = (v20 & 1) == 0;
      uint64_t v22 = 40;
      if (!v21) {
        uint64_t v22 = 32;
      }
      v23 = *(Class *)((char *)&v56->super.isa + v22);
      uint64_t v24 = v21 ? 56 : 48;
      id v25 = v23;
      id v26 = *(id *)((char *)&v56->super.isa + v24);
      v27 = v26;
      if (!v25 || v26 == 0) {
        break;
      }
      v57 = v26;
      v58 = v25;
      uint64_t v29 = [(BufferFillMetal *)v56 unormTexture:v7 forPlane:v16 withAttributes:v56->_readWriteAttributes];
      if (!v29) {
        break;
      }
      v59 = (void *)v29;
      *(int8x8_t *)v30.i8 = vand_s8((int8x8_t)vdup_n_s32(v16), v19);
      uint32x4_t v70 = vshlq_u32(*v54, (uint32x4_t)vnegq_s32(vzip1q_s32(v30, v30)));
      int v31 = CVPixelBufferGetWidthOfPlane(v7, v16);
      v69[0] = v31 - (v70.i32[0] + v70.i32[1]);
      int v32 = CVPixelBufferGetHeightOfPlane(v7, v16);
      v33 = a5;
      v34 = v7;
      unint64_t v35 = (v32 - (v70.i32[2] + v70.i32[3]));
      v69[1] = v32 - (v70.i32[2] + v70.i32[3]);
      __int32 v36 = v70.i32[0];
      __int32 v37 = v70.i32[1];
      unint64_t v38 = [v58 threadExecutionWidth];
      unint64_t v39 = [v58 maxTotalThreadsPerThreadgroup];
      unint64_t v40 = (v37 + v36);
      if (v38 >= v40) {
        unint64_t v38 = (v37 + v36);
      }
      if (v39 / v38 >= v35) {
        unint64_t v41 = v35;
      }
      else {
        unint64_t v41 = v39 / v38;
      }
      [v15 setComputePipelineState:v58];
      [v15 setTexture:v59 atIndex:0];
      [v15 setBytes:v69 length:8 atIndex:0];
      [v15 setBytes:&v70 length:16 atIndex:1];
      [v15 setBytes:a5 length:12 atIndex:2];
      [v15 setBytes:&v68 length:1 atIndex:3];
      if (v56->_supportsNonuniformThreadgroups)
      {
        v67[0] = v40;
        v67[1] = v35;
        v67[2] = 1;
        v66[0] = v38;
        v66[1] = v41;
        v66[2] = 1;
        [v15 dispatchThreads:v67 threadsPerThreadgroup:v66];
      }
      else
      {
        v65[0] = (v40 + v38 - 1) / v38;
        v65[1] = (v35 + v41 - 1) / v41;
        v65[2] = 1;
        v64[0] = v38;
        v64[1] = v41;
        v64[2] = 1;
        [v15 dispatchThreadgroups:v65 threadsPerThreadgroup:v64];
      }
      int v42 = v69[0];
      __int32 v43 = v70.i32[0];
      __int32 v44 = v70.i32[1];
      __int32 v46 = v70.i32[2];
      __int32 v45 = v70.i32[3];
      unint64_t v47 = [v57 threadExecutionWidth];
      unint64_t v48 = [v57 maxTotalThreadsPerThreadgroup];
      unint64_t v49 = (v43 + v42 + v44);
      unint64_t v50 = (v45 + v46);
      if (v47 >= v49) {
        unint64_t v47 = v49;
      }
      if (v48 / v47 >= v50) {
        unint64_t v51 = (v45 + v46);
      }
      else {
        unint64_t v51 = v48 / v47;
      }
      [v15 setComputePipelineState:v57];
      a5 = v33;
      uint64_t v7 = v34;
      [v15 setTexture:v59 atIndex:0];
      [v15 setBytes:v69 length:8 atIndex:0];
      [v15 setBytes:&v70 length:16 atIndex:1];
      [v15 setBytes:v33 length:12 atIndex:2];
      [v15 setBytes:&v68 length:1 atIndex:3];
      if (v56->_supportsNonuniformThreadgroups)
      {
        v63[0] = v49;
        v63[1] = v50;
        v63[2] = 1;
        v62[0] = v47;
        v62[1] = v51;
        v62[2] = 1;
        [v15 dispatchThreads:v63 threadsPerThreadgroup:v62];
      }
      else
      {
        v61[0] = (v49 + v47 - 1) / v47;
        v61[1] = (v50 + v51 - 1) / v51;
        v61[2] = 1;
        v60[0] = v47;
        v60[1] = v51;
        v60[2] = 1;
        [v15 dispatchThreadgroups:v61 threadsPerThreadgroup:v60];
      }

      char v20 = 0;
      size_t v16 = 1;
      if ((v55 & 1) == 0)
      {
        [v15 endEncoding];
        [v53 commit];
        int v9 = 0;
        goto LABEL_35;
      }
    }

    int v9 = -12911;
LABEL_35:
  }
  return v9;
}

- (void)CompileBufferFill
{
  if (!self->_fillBoundaryLeftRightLuma)
  {
    if (([(MTLDevice *)self->_device supportsFamily:2002] & 1) != 0
      || ([(MTLDevice *)self->_device supportsFamily:1004] & 1) != 0)
    {
      char v3 = 1;
    }
    else
    {
      char v3 = [(MTLDevice *)self->_device supportsFamily:3003];
    }
    self->_supportsNonuniformThreadgroups = v3;
    id v16 = (id)objc_opt_new();
    [v16 setConstantValue:&self->_supportsNonuniformThreadgroups type:53 atIndex:0];
    v4 = [(BufferFillMetal *)self compileFunction:@"FillBoundaryLeftRightLuma" constantValues:v16];
    fillBoundaryLeftRightLuma = self->_fillBoundaryLeftRightLuma;
    self->_fillBoundaryLeftRightLuma = v4;

    int v6 = [(BufferFillMetal *)self compileFunction:@"FillBoundaryLeftRightChroma" constantValues:v16];
    fillBoundaryLeftRightChroma = self->_fillBoundaryLeftRightChroma;
    self->_fillBoundaryLeftRightChroma = v6;

    v8 = [(BufferFillMetal *)self compileFunction:@"FillBoundaryTopBottomCornersLuma" constantValues:v16];
    fillBoundaryTopBottomCornersLuma = self->_fillBoundaryTopBottomCornersLuma;
    self->_fillBoundaryTopBottomCornersLuma = v8;

    size_t v10 = [(BufferFillMetal *)self compileFunction:@"FillBoundaryTopBottomCornersChroma" constantValues:v16];
    fillBoundaryTopBottomCornersChroma = self->_fillBoundaryTopBottomCornersChroma;
    self->_fillBoundaryTopBottomCornersChroma = v10;

    size_t v12 = [(BufferFillMetal *)self compileFunction:@"PreFillLuma" constantValues:v16];
    preFillLuma = self->_preFillLuma;
    self->_preFillLuma = v12;

    size_t v14 = [(BufferFillMetal *)self compileFunction:@"PreFillChroma" constantValues:v16];
    preFillChroma = self->_preFillChroma;
    self->_preFillChroma = v14;
  }
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
  uint64_t v14 = 96;
  if (!a4) {
    uint64_t v14 = 88;
  }
  id v15 = *(Class *)((char *)&self->super.isa + v14);
  CFTypeRef cf = 0;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v11, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    uint64x2_t v18 = 0;
  }
  else
  {
    uint64x2_t v18 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v18;
}

- (id)compileFunction:(id)a3
{
  char v3 = [(BufferFillMetal *)self compileFunction:a3 constantValues:0];

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

- (BufferFillMetal)initWithDevice:(__CVBuffer *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
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
  uint64_t v5 = self->_device;
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
  *p_device = 0;

  int v9 = *p_device;
  if (*p_device
    || (id v10 = (MTLDevice *)MTLCreateSystemDefaultDevice(),
        MTLPixelFormat v11 = *p_device,
        *p_device = v10,
        v11,
        (int v9 = *p_device) != 0))
  {
    unsigned __int16 v12 = (MTLCommandQueue *)[(MTLDevice *)v9 newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v12;

    if (self->_commandQueue)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v15 = [v14 URLForResource:@"ProcessAccelerate" withExtension:@"metallib"];
      if (v15)
      {
        id v16 = *p_device;
        id v29 = 0;
        uint64x2_t v17 = (MTLLibrary *)[(MTLDevice *)v16 newLibraryWithURL:v15 error:&v29];
        id v18 = v29;
        library = self->_library;
        self->_library = v17;

        if (self->_library)
        {
          if (!self->_readWriteAttributes)
          {
            uint64_t v30 = *MEMORY[0x1E4F24C88];
            int v31 = &unk_1F14F44B0;
            id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
            readWriteAttributes = self->_readWriteAttributes;
            self->_readWriteAttributes = v20;
          }
          value = self->_textureCacheLuma.value_;
          v23 = self->_device;
          if (value)
          {
            CFRelease(value);
            self->_textureCacheLuma.value_ = 0;
          }
          CFDictionaryRef v8 = (BufferFillMetal *)CVMetalTextureCacheCreate(0, 0, v23, 0, &self->_textureCacheLuma.value_);
          if (!v8)
          {
            id v26 = self->_textureCacheChroma.value_;
            p_textureCacheChroma = &self->_textureCacheChroma;
            uint64_t v24 = v26;
            v27 = p_textureCacheChroma[-11].value_;
            if (v26)
            {
              CFRelease(v24);
              p_textureCacheChroma->value_ = 0;
            }
            CFDictionaryRef v8 = (BufferFillMetal *)CVMetalTextureCacheCreate(0, 0, v27, 0, &p_textureCacheChroma->value_);
          }
          goto LABEL_27;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v14;
          __int16 v34 = 2112;
          id v35 = v18;
          _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
        }
      }
      else
      {
        id v18 = 0;
      }
      CFDictionaryRef v8 = 0;
LABEL_27:

      return v8;
    }
  }
  return (BufferFillMetal *)4294954385;
}

- (BufferFillMetal)init
{
  v6.receiver = self;
  v6.super_class = (Class)BufferFillMetal;
  v2 = [(BufferFillMetal *)&v6 init];
  char v3 = v2;
  if (v2)
  {
    [(BufferFillMetal *)v2 initWithDevice:0];
    v4 = v3;
  }

  return v3;
}

@end