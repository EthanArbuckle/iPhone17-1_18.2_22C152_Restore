@interface SpatialAnalysisMetal
- (SpatialAnalysisMetal)init;
- (SpatialAnalysisMetal)initWithDevice:(__CVBuffer *)a3;
- (id).cxx_construct;
- (id)compileFunction:(id)a3;
- (id)compileFunction:(id)a3 constantValues:(id)a4;
- (id)rgbaUintTextureForLuma:(__CVBuffer *)a3 withAttributes:(id)a4;
- (id)unormTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5;
- (int)SpatialDistance:(__CVBuffer *)a3 prevFrame:(__CVBuffer *)a4 distBlockArray:(unsigned int *)a5 forRegion:(id *)a6 blockStride:(unsigned int)a7 log2UnitSize:(unsigned int)a8 startLine:(unsigned int)a9 lineStep:(unsigned int)a10 method:(unsigned int)a11;
- (int)SpatialSumSadVar:(__CVBuffer *)a3 sumBlockArray:(unsigned int *)a4 sadBlockArray:(unsigned int *)a5 sumUnitArray:(unsigned int *)a6 sumSquareUnitArray:(unint64_t *)a7 sumTotal:(unint64_t *)a8 sadTotal:(unsigned int *)a9 variance:(unsigned int *)a10 forRegion:(id *)a11 blockStride:(unsigned int)a12 unitStride:(unsigned int)a13 method:(unsigned int)a14 log2UnitSize:(unsigned int)a15 calcVar:(BOOL)a16;
- (void)CompileSpatialAnalysis:(BOOL)a3;
@end

@implementation SpatialAnalysisMetal

- (id).cxx_construct
{
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1BB9C4888((const void **)&self->_textureCacheRGBAChroma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheRGBALuma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheChroma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheLuma.value_);

  objc_storeStrong((id *)&self->_spatialAnalysisDistance, 0);
  objc_storeStrong((id *)&self->_spatialAnalysisVariance, 0);
  objc_storeStrong((id *)&self->_spatialAnalysisSumSad, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (int)SpatialDistance:(__CVBuffer *)a3 prevFrame:(__CVBuffer *)a4 distBlockArray:(unsigned int *)a5 forRegion:(id *)a6 blockStride:(unsigned int)a7 log2UnitSize:(unsigned int)a8 startLine:(unsigned int)a9 lineStep:(unsigned int)a10 method:(unsigned int)a11
{
  char v11 = a8;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unsigned int v43 = a8;
  unsigned int v44 = a7;
  int v18 = (int)-[SpatialAnalysisMetal initWithDevice:](self, "initWithDevice:");
  if (!v18)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    BOOL v42 = sub_1BBA13A1C(PixelFormatType) == 10;
    OSType v20 = CVPixelBufferGetPixelFormatType(a3);
    int v21 = CVIsCompressedPixelFormatAvailable(v20);
    [(SpatialAnalysisMetal *)self CompileSpatialAnalysis:v21 != 0];
    if (self->_spatialAnalysisDistance)
    {
      if (v21)
      {
        v22 = [(SpatialAnalysisMetal *)self unormTexture:a3 forPlane:0 withAttributes:self->_readAttributes];
        [(SpatialAnalysisMetal *)self unormTexture:a4 forPlane:0 withAttributes:self->_readAttributes];
      }
      else
      {
        v22 = [(SpatialAnalysisMetal *)self rgbaUintTextureForLuma:a3 withAttributes:self->_readAttributes];
        [(SpatialAnalysisMetal *)self rgbaUintTextureForLuma:a4 withAttributes:self->_readAttributes];
      uint64_t v23 = };
      v24 = (void *)v23;
      int v18 = -12911;
      if (v22 && v23)
      {
        v38 = (void *)v23;
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        unint64_t var0 = a6->var0.var0;
        unint64_t v27 = a6->var1.var0;
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        if (WidthOfPlane - var0 >= v27) {
          unint64_t v29 = v27;
        }
        else {
          unint64_t v29 = WidthOfPlane - var0;
        }
        unint64_t var1 = a6->var0.var1;
        unint64_t v31 = HeightOfPlane - var1;
        if (HeightOfPlane - var1 >= a6->var1.var1) {
          unint64_t v31 = a6->var1.var1;
        }
        v45[0] = a6->var0.var0;
        v45[1] = var1;
        v45[2] = v29;
        v45[3] = v31;
        uint64_t v32 = ~(-1 << v11);
        unint64_t v33 = (v31 + v32) >> v11;
        v34 = (void *)[(MTLDevice *)self->_device newBufferWithBytesNoCopy:a5 length:4 * a7 * v33 options:0 deallocator:0];
        v24 = v38;
        v35 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
        [v35 setLabel:@"Spadial Distance"];
        v36 = [v35 computeCommandEncoder];
        [v36 setComputePipelineState:self->_spatialAnalysisDistance];
        [v36 setTexture:v22 atIndex:0];
        [v36 setTexture:v38 atIndex:1];
        [v36 setBuffer:v34 offset:0 atIndex:0];
        [v36 setBytes:v45 length:16 atIndex:1];
        [v36 setBytes:&v44 length:4 atIndex:2];
        [v36 setBytes:&v43 length:4 atIndex:3];
        [v36 setBytes:&v42 length:1 atIndex:4];
        [v36 setBytes:&a9 length:4 atIndex:5];
        [v36 setBytes:&a10 length:4 atIndex:6];
        [v36 setBytes:&a11 length:4 atIndex:7];
        v41[0] = (((v29 + v32) >> v11) + 15) >> 4;
        v41[1] = (v33 + 15) >> 4;
        v41[2] = 1;
        int64x2_t v39 = vdupq_n_s64(0x10uLL);
        uint64_t v40 = 1;
        [v36 dispatchThreadgroups:v41 threadsPerThreadgroup:&v39];
        [v36 endEncoding];
        [v35 commit];
        [v35 waitUntilCompleted];

        int v18 = 0;
      }
    }
    else
    {
      return -12911;
    }
  }
  return v18;
}

- (int)SpatialSumSadVar:(__CVBuffer *)a3 sumBlockArray:(unsigned int *)a4 sadBlockArray:(unsigned int *)a5 sumUnitArray:(unsigned int *)a6 sumSquareUnitArray:(unint64_t *)a7 sumTotal:(unint64_t *)a8 sadTotal:(unsigned int *)a9 variance:(unsigned int *)a10 forRegion:(id *)a11 blockStride:(unsigned int)a12 unitStride:(unsigned int)a13 method:(unsigned int)a14 log2UnitSize:(unsigned int)a15 calcVar:(BOOL)a16
{
  char v23 = a15;
  uint64_t v24 = a13;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  int v25 = (int)-[SpatialAnalysisMetal initWithDevice:](self, "initWithDevice:");
  if (!v25)
  {
    char v73 = v23;
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    BOOL v87 = sub_1BBA13A1C(PixelFormatType) == 10;
    OSType v27 = CVPixelBufferGetPixelFormatType(a3);
    int v28 = CVIsCompressedPixelFormatAvailable(v27);
    [(SpatialAnalysisMetal *)self CompileSpatialAnalysis:v28 != 0];
    if (self->_spatialAnalysisSumSad)
    {
      uint64_t v68 = v24;
      v69 = a6;
      v67 = a7;
      v70 = a8;
      if (v28) {
        [(SpatialAnalysisMetal *)self unormTexture:a3 forPlane:0 withAttributes:self->_readAttributes];
      }
      else {
      v76 = [(SpatialAnalysisMetal *)self rgbaUintTextureForLuma:a3 withAttributes:self->_readAttributes];
      }
      if (v76)
      {
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        if (WidthOfPlane - a11->var0.var0 >= a11->var1.var0) {
          unint64_t var0 = a11->var1.var0;
        }
        else {
          unint64_t var0 = WidthOfPlane - a11->var0.var0;
        }
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        unint64_t var1 = a11->var0.var1;
        unint64_t v33 = HeightOfPlane - var1;
        if (HeightOfPlane - var1 >= a11->var1.var1) {
          unint64_t v33 = a11->var1.var1;
        }
        v88[0] = a11->var0.var0;
        v88[1] = var1;
        v88[2] = var0;
        v88[3] = v33;
        v85 = 0;
        CFDataRef v86 = 0;
        int v84 = 3;
        unint64_t v59 = v33;
        unint64_t v60 = var0;
        unint64_t v34 = (v33 + 7) >> 3;
        uint64_t v35 = a12;
        unint64_t v63 = (v34 + 15) >> 4;
        unint64_t v65 = (((var0 + 7) >> 3) + 15) >> 4;
        unint64_t v36 = 4 * v63 * v65;
        unint64_t v62 = v63 * v65;
        if (self->_sumBufferPool.allocSize_ < v36)
        {
          pool = self->_sumBufferPool.pool_;
          self->_sumBufferPool.pool_ = 0;

          self->_sumBufferPool.allocSize_ = v36;
        }
        if (self->_sadBufferPool.allocSize_ < v36)
        {
          v38 = self->_sadBufferPool.pool_;
          self->_sadBufferPool.pool_ = 0;

          self->_sadBufferPool.allocSize_ = v36;
        }
        v75 = sub_1BB9CC530((uint64_t)&self->_sumBufferPool, &v86);
        if (v85)
        {
          CFRelease(v85);
          v85 = 0;
        }
        uint64_t v39 = sub_1BB9CC530((uint64_t)&self->_sadBufferPool, &v85);
        uint64_t v40 = 4 * v34 * v35;
        v41 = (void *)[(MTLDevice *)self->_device newBufferWithBytesNoCopy:a4 length:v40 options:0 deallocator:0];
        uint64_t v42 = [(MTLDevice *)self->_device newBufferWithBytesNoCopy:a5 length:v40 options:0 deallocator:0];
        unsigned int v43 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
        [v43 setLabel:@"Spadial Sum, Sad, Variance"];
        v71 = (void *)v39;
        v72 = (void *)v42;
        unsigned int v44 = [v43 computeCommandEncoder];
        [v44 setComputePipelineState:self->_spatialAnalysisSumSad];
        [v44 setTexture:v76 atIndex:0];
        [v44 setBuffer:v41 offset:0 atIndex:0];
        [v44 setBuffer:v42 offset:0 atIndex:1];
        [v44 setBuffer:v75 offset:0 atIndex:2];
        [v44 setBuffer:v39 offset:0 atIndex:3];
        [v44 setBytes:v88 length:16 atIndex:4];
        [v44 setBytes:&a12 length:4 atIndex:5];
        [v44 setBytes:&v84 length:4 atIndex:6];
        [v44 setBytes:&a14 length:4 atIndex:7];
        [v44 setBytes:&v87 length:1 atIndex:8];
        v83[0] = v65;
        v83[1] = v63;
        v83[2] = 1;
        int64x2_t v81 = vdupq_n_s64(0x10uLL);
        uint64_t v82 = 1;
        [v44 dispatchThreadgroups:v83 threadsPerThreadgroup:&v81];
        CFTypeRef cf = 0;
        BOOL v66 = a16;
        if (a16)
        {
          uint64_t v45 = ~(-1 << v73);
          unint64_t v46 = (v59 + v45) >> v73;
          unint64_t v64 = (((v60 + v45) >> v73) + 15) >> 4;
          unint64_t v61 = (v46 + 15) >> 4;
          unint64_t v74 = v64 * v61;
          if (self->_sumVarBufferPool.allocSize_ < 4 * v64 * v61)
          {
            v47 = self->_sumVarBufferPool.pool_;
            self->_sumVarBufferPool.pool_ = 0;

            self->_sumVarBufferPool.allocSize_ = 4 * v74;
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
          }
          v48 = sub_1BB9CC530((uint64_t)&self->_sumVarBufferPool, &cf);
          unint64_t v49 = v46 * v24;
          v50 = (void *)[(MTLDevice *)self->_device newBufferWithBytesNoCopy:v69 length:4 * v46 * v24 options:0 deallocator:0];
          v51 = (void *)[(MTLDevice *)self->_device newBufferWithBytesNoCopy:v67 length:8 * v46 * v68 options:0 deallocator:0];
          [v44 setComputePipelineState:self->_spatialAnalysisVariance];
          [v44 setTexture:v76 atIndex:0];
          [v44 setBuffer:v41 offset:0 atIndex:0];
          [v44 setBuffer:v50 offset:0 atIndex:1];
          [v44 setBuffer:v51 offset:0 atIndex:2];
          [v44 setBuffer:v48 offset:0 atIndex:3];
          [v44 setBytes:v88 length:16 atIndex:4];
          [v44 setBytes:&a13 length:4 atIndex:5];
          [v44 setBytes:&a15 length:4 atIndex:6];
          [v44 setBytes:&v87 length:1 atIndex:7];
          v79[0] = v64;
          v79[1] = v61;
          v79[2] = 1;
          int64x2_t v77 = vdupq_n_s64(0x10uLL);
          uint64_t v78 = 1;
          [v44 dispatchThreadgroups:v79 threadsPerThreadgroup:&v77];
        }
        else
        {
          unint64_t v49 = 0;
          unint64_t v74 = 0;
          v48 = 0;
          v50 = 0;
          v51 = 0;
        }
        [v44 endEncoding];
        [v43 commit];
        [v43 waitUntilCompleted];
        BytePtr = (uint32x4_t *)CFDataGetBytePtr(v86);
        unint64_t *v70 = sub_1BB9EFB3C(BytePtr, v62);
        v53 = (uint32x4_t *)CFDataGetBytePtr((CFDataRef)v85);
        unint64_t v54 = sub_1BB9EFB3C(v53, v62);
        int v55 = -1;
        if (v54 < 0xFFFFFFFF) {
          int v55 = v54;
        }
        if (v87) {
          unsigned int v56 = v55;
        }
        else {
          unsigned int v56 = v54;
        }
        *a9 = v56;
        if (v66)
        {
          v57 = (uint32x4_t *)CFDataGetBytePtr((CFDataRef)cf);
          *a10 = (sub_1BB9EFB3C(v57, v74) + (v49 >> 1)) / v49;
        }

        sub_1BB9BE124(&cf);
        sub_1BB9BE124(&v85);
        sub_1BB9BE124((const void **)&v86);
        int v25 = 0;
      }
      else
      {
        int v25 = -12911;
      }
    }
    else
    {
      return -12911;
    }
  }
  return v25;
}

- (void)CompileSpatialAnalysis:(BOOL)a3
{
  if (self->_spatialAnalysisSumSad) {
    return;
  }
  if (!self->_supportsSIMDPermute)
  {
    if (self->_supportsQuadPermute)
    {
      v9 = [(SpatialAnalysisMetal *)self compileFunction:@"SpatialSumSadQuad"];
      spatialAnalysisSumSad = self->_spatialAnalysisSumSad;
      self->_spatialAnalysisSumSad = v9;

      char v11 = [(SpatialAnalysisMetal *)self compileFunction:@"SpatialVarianceQuad"];
      spatialAnalysisVariance = self->_spatialAnalysisVariance;
      self->_spatialAnalysisVariance = v11;
    }
    if (a3) {
      goto LABEL_8;
    }
LABEL_10:
    v13 = @"SpatialDistance";
    goto LABEL_11;
  }
  if (!a3)
  {
    v14 = [(SpatialAnalysisMetal *)self compileFunction:@"SpatialSumSadSIMD"];
    v15 = self->_spatialAnalysisSumSad;
    self->_spatialAnalysisSumSad = v14;

    v16 = [(SpatialAnalysisMetal *)self compileFunction:@"SpatialVarianceSIMD"];
    v17 = self->_spatialAnalysisVariance;
    self->_spatialAnalysisVariance = v16;

    goto LABEL_10;
  }
  v5 = [(SpatialAnalysisMetal *)self compileFunction:@"SpatialSumSadUnorm"];
  v6 = self->_spatialAnalysisSumSad;
  self->_spatialAnalysisSumSad = v5;

  v7 = [(SpatialAnalysisMetal *)self compileFunction:@"SpatialVarianceUnorm"];
  v8 = self->_spatialAnalysisVariance;
  self->_spatialAnalysisVariance = v7;

LABEL_8:
  v13 = @"SpatialDistanceUnorm";
LABEL_11:
  self->_spatialAnalysisDistance = [(SpatialAnalysisMetal *)self compileFunction:v13];

  MEMORY[0x1F41817F8]();
}

- (id)rgbaUintTextureForLuma:(__CVBuffer *)a3 withAttributes:(id)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a4;
  CFTypeRef cf = 0;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (sub_1BBA13A1C(PixelFormatType) == 10) {
    MTLPixelFormat v8 = MTLPixelFormatRGBA16Uint;
  }
  else {
    MTLPixelFormat v8 = MTLPixelFormatRGBA8Uint;
  }
  value = self->_textureCacheRGBALuma.value_;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v6, v8, WidthOfPlane >> 2, HeightOfPlane, 0, (CVMetalTextureRef *)&cf))
  {
    v12 = 0;
  }
  else
  {
    v12 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v12;
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
  uint64_t v14 = 168;
  if (!a4) {
    uint64_t v14 = 160;
  }
  v15 = *(Class *)((char *)&self->super.isa + v14);
  CFTypeRef cf = 0;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v11, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    int v18 = 0;
  }
  else
  {
    int v18 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v18;
}

- (id)compileFunction:(id)a3
{
  v3 = [(SpatialAnalysisMetal *)self compileFunction:a3 constantValues:0];

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
    v9 = (void *)[(MTLLibrary *)library newFunctionWithName:v6 constantValues:v7 error:&v16];
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
  v9 = (void *)[(MTLLibrary *)library newFunctionWithName:v6];
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

- (SpatialAnalysisMetal)initWithDevice:(__CVBuffer *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    p_device = (id *)&self->_device;
    device = self->_device;
    if (!device) {
      goto LABEL_9;
    }
    return 0;
  }
  CVPixelBufferGetIOSurface(a3);
  uint64_t RegistryID = IOSurfaceGetRegistryID();
  p_device = (id *)&self->_device;
  v5 = self->_device;
  if (!v5)
  {
    device = 0;
    goto LABEL_9;
  }
  if (!RegistryID || [(MTLDevice *)v5 registryID] == RegistryID) {
    return 0;
  }
  device = (MTLDevice *)*p_device;
LABEL_9:
  self->_device = 0;

  spatialAnalysisSumSad = self->_spatialAnalysisSumSad;
  self->_spatialAnalysisSumSad = 0;

  spatialAnalysisVariance = self->_spatialAnalysisVariance;
  self->_spatialAnalysisVariance = 0;

  spatialAnalysisDistance = self->_spatialAnalysisDistance;
  self->_spatialAnalysisDistance = 0;

  unsigned __int16 v12 = self->_device;
  if (v12
    || (id v13 = MTLCreateSystemDefaultDevice(),
        id v14 = *p_device,
        id *p_device = v13,
        v14,
        (unsigned __int16 v12 = (MTLDevice *)*p_device) != 0))
  {
    id v15 = (MTLCommandQueue *)[(MTLDevice *)v12 newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v15;

    if (self->_commandQueue)
    {
      if ([*p_device supportsFamily:2001]) {
        char v17 = 1;
      }
      else {
        char v17 = [*p_device supportsFamily:1006];
      }
      self->_supportsSIMDPermute = v17;
      if (([(MTLDevice *)self->_device supportsFamily:2002] & 1) != 0
        || ([*p_device supportsFamily:1004] & 1) != 0)
      {
        char v18 = 1;
      }
      else
      {
        char v18 = [*p_device supportsFamily:3003];
      }
      self->_supportsQuadPermute = v18;
      __int16 v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v20 = [v19 URLForResource:@"ProcessAccelerate" withExtension:@"metallib"];
      if (v20)
      {
        id v21 = *p_device;
        id v40 = 0;
        v22 = (MTLLibrary *)[v21 newLibraryWithURL:v20 error:&v40];
        id v23 = v40;
        library = self->_library;
        self->_library = v22;

        if (self->_library)
        {
          sub_1BB9CFDC8((uint64_t)&self->_sumBufferPool, self->_device);
          sub_1BB9CFDC8((uint64_t)&self->_sadBufferPool, self->_device);
          sub_1BB9CFDC8((uint64_t)&self->_sumVarBufferPool, self->_device);
          if (!self->_readAttributes)
          {
            uint64_t v43 = *MEMORY[0x1E4F24C88];
            unsigned int v44 = &unk_1F14F44C8;
            int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
            readAttributes = self->_readAttributes;
            self->_readAttributes = v25;
          }
          if (!self->_writeAttributes)
          {
            uint64_t v41 = *MEMORY[0x1E4F24C88];
            uint64_t v42 = &unk_1F14F44E0;
            OSType v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            writeAttributes = self->_writeAttributes;
            self->_writeAttributes = v27;
          }
          value = self->_textureCacheLuma.value_;
          v30 = self->_device;
          if (value)
          {
            CFRelease(value);
            self->_textureCacheLuma.value_ = 0;
          }
          CFDictionaryRef v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v30, 0, &self->_textureCacheLuma.value_);
          if (!v8)
          {
            unint64_t v31 = self->_textureCacheChroma.value_;
            uint64_t v32 = self->_device;
            if (v31)
            {
              CFRelease(v31);
              self->_textureCacheChroma.value_ = 0;
            }
            CFDictionaryRef v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v32, 0, &self->_textureCacheChroma.value_);
            if (!v8)
            {
              unint64_t v33 = self->_textureCacheRGBALuma.value_;
              unint64_t v34 = self->_device;
              if (v33)
              {
                CFRelease(v33);
                self->_textureCacheRGBALuma.value_ = 0;
              }
              CFDictionaryRef v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v34, 0, &self->_textureCacheRGBALuma.value_);
              if (!v8)
              {
                v37 = self->_textureCacheRGBAChroma.value_;
                p_textureCacheRGBAChroma = &self->_textureCacheRGBAChroma;
                uint64_t v35 = v37;
                v38 = p_textureCacheRGBAChroma[-22].value_;
                if (v37)
                {
                  CFRelease(v35);
                  p_textureCacheRGBAChroma->value_ = 0;
                }
                CFDictionaryRef v8 = (SpatialAnalysisMetal *)CVMetalTextureCacheCreate(0, 0, v38, 0, &p_textureCacheRGBAChroma->value_);
              }
            }
          }
          goto LABEL_42;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v46 = v19;
          __int16 v47 = 2112;
          id v48 = v23;
          _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
        }
      }
      else
      {
        id v23 = 0;
      }
      CFDictionaryRef v8 = 0;
LABEL_42:

      return v8;
    }
  }
  return (SpatialAnalysisMetal *)4294954385;
}

- (SpatialAnalysisMetal)init
{
  v6.receiver = self;
  v6.super_class = (Class)SpatialAnalysisMetal;
  v2 = [(SpatialAnalysisMetal *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SpatialAnalysisMetal *)v2 initWithDevice:0];
    v4 = v3;
  }

  return v3;
}

@end