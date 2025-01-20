@interface VCPSideCarMetal
- (future<CF<const)createEncodePacket:(__CVBuffer *)a3 forRegion:(id *)a4 instance:(unsigned int)a5 sequenceNumber:(unsigned int)a6 frameIndex:(unsigned int)a7 pts:(id *)a8 duration:(id *)a9 frameProperties:(__CFDictionary *)cf;
- (future<unsigned)temporalTransitionScore:(__CVBuffer *)a3 previousFrame:(__CVBuffer *)a4 forRegion:(id *)a5;
- (id).cxx_construct;
- (id)compileFunction:(id)a3;
- (id)compileFunction:(id)a3 constantValues:(id)a4;
- (id)rgbaUintTextureForChroma:(__CVBuffer *)a3 withAttributes:(id)a4;
- (id)rgbaUintTextureForLuma:(__CVBuffer *)a3 withAttributes:(id)a4;
- (id)rgbaUnormTextureForLuma:(__CVBuffer *)a3 withAttributes:(id)a4;
- (id)uintTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5;
- (id)unormTexture:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5;
- (int)copyFromFrame:(__CVBuffer *)a3 toTile:(__CVBuffer *)a4 origin:(id *)a5 size:(id *)a6 withFence:(void *)a7;
- (int)copySubframe:(__CVBuffer *)a3 toFrame:(__CVBuffer *)a4 atOffset:(id *)a5;
- (int)selectGPUForFrame:(__CVBuffer *)a3;
- (int)subframeDeblock:(__CVBuffer *)a3 withOffsetsY:(unsigned int *)a4 numEdges:(int)a5;
- (void)compileDeblockForFrame:(__CVBuffer *)a3;
- (void)compileTransitionDetection;
- (void)setPacketLayout:(id)a3;
@end

@implementation VCPSideCarMetal

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);

  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1BB9C4888((const void **)&self->_textureCacheRGBAChroma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheRGBALuma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheChroma.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheLuma.value_);
  objc_storeStrong((id *)&self->_deblockChromaH, 0);
  objc_storeStrong((id *)&self->_deblockLumaH, 0);
  objc_storeStrong((id *)&self->_blitKernel, 0);
  objc_storeStrong((id *)&self->_transitionDetectionUnorm, 0);
  objc_storeStrong((id *)&self->_transitionDetection, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (future<CF<const)createEncodePacket:(__CVBuffer *)a3 forRegion:(id *)a4 instance:(unsigned int)a5 sequenceNumber:(unsigned int)a6 frameIndex:(unsigned int)a7 pts:(id *)a8 duration:(id *)a9 frameProperties:(__CFDictionary *)cf
{
  v18 = v10;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  v19.size_t var0 = (void *)-[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (!LODWORD(v19.var0))
  {
    unsigned int v57 = a5;
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
    if (PlaneCount < 3)
    {
      size_t var0 = a4->var0.var0;
      if (var0 <= CVPixelBufferGetWidth(a3))
      {
        size_t var1 = a4->var0.var1;
        if (var1 <= CVPixelBufferGetHeight(a3))
        {
          unsigned int v49 = a7;
          size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
          size_t v52 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
          size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
          char v51 = HeightOfPlane > CVPixelBufferGetHeightOfPlane(a3, 1uLL);
          p_packetPool = &self->_packetPool;
          unint64_t v28 = self->_planeOffset[1] + (a4->var1.var1 >> v51) * self->_planeBytesPerRow[1];
          if (self->_packetPool.allocSize_ != v28)
          {
            pool = p_packetPool->pool_;
            p_packetPool->pool_ = 0;
          }
          self->_packetPool.allocSize_ = v28;
          v74[0] = 0;
          uint64_t v56 = sub_1BB9CC530((uint64_t)&self->_packetPool, v74);
          unsigned int v55 = a6;
          unint64_t v30 = CVPixelBufferGetWidth(a3) - a4->var0.var0;
          if (v30 >= a4->var1.var0) {
            unint64_t v30 = a4->var1.var0;
          }
          unint64_t v54 = v30;
          unint64_t v31 = CVPixelBufferGetHeight(a3) - a4->var0.var1;
          if (v31 >= a4->var1.var1) {
            unint64_t v31 = a4->var1.var1;
          }
          unint64_t v50 = v31;
          if (PlaneCount)
          {
            size_t v32 = 0;
            int v33 = 1024;
            do
            {
              v34 = (char *)self + 4 * v32;
              int BytesPerRowOfPlane = *((_DWORD *)v34 + 60);
              if (!BytesPerRowOfPlane)
              {
                int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, v32);
                *((_DWORD *)v34 + 60) = BytesPerRowOfPlane;
              }
              if (!*((_DWORD *)v34 + 56)) {
                *((_DWORD *)v34 + 56) = v33;
              }
              v33 += BytesPerRowOfPlane * CVPixelBufferGetHeightOfPlane(a3, v32++);
            }
            while (PlaneCount != v32);
          }
          v86 = 0;
          v85 = 0;
          uint64_t v36 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:0 withAttributes:self->_readAttributes];
          v37 = v85;
          v85 = (void *)v36;

          uint64_t v38 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:1 withAttributes:self->_readAttributes];
          v39 = v86;
          v86 = (void *)v38;

          v40 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
          v41 = [v40 blitCommandEncoder];
          long long v72 = *(_OWORD *)&a4->var0.var0;
          unint64_t var2 = a4->var0.var2;
          v71[0] = v54;
          v71[1] = v50;
          v71[2] = 1;
          [v41 copyFromTexture:v85 sourceSlice:0 sourceLevel:0 sourceOrigin:&v72 sourceSize:v71 toBuffer:v56 destinationOffset:self->_planeOffset[0] destinationBytesPerRow:self->_planeBytesPerRow[0] destinationBytesPerImage:0];
          unint64_t v42 = a4->var0.var1 >> v51;
          v70[0] = a4->var0.var0 >> (WidthOfPlane > v52);
          v70[1] = v42;
          v70[2] = 0;
          v69[0] = v54 >> (WidthOfPlane > v52);
          v69[1] = v50 >> v51;
          v69[2] = 1;
          [v41 copyFromTexture:v86 sourceSlice:0 sourceLevel:0 sourceOrigin:v70 sourceSize:v69 toBuffer:v56 destinationOffset:self->_planeOffset[1] destinationBytesPerRow:self->_planeBytesPerRow[1] destinationBytesPerImage:0];
          [v41 endEncoding];
          [v40 commit];
          CVPixelBufferRef v68 = CVPixelBufferRetain(a3);
          CFTypeRef v43 = CFRetain(cf);
          id v44 = v40;
          long long v61 = *(_OWORD *)&a4->var0.var0;
          id v59 = v44;
          *(void *)&long long v60 = __PAIR64__(v55, v57);
          DWORD2(v60) = v49;
          long long v62 = *(_OWORD *)&a4->var0.var2;
          long long v63 = *(_OWORD *)&a4->var1.var1;
          long long v64 = *(_OWORD *)&a8->var0;
          *(void *)v65 = a8->var3;
          *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v65[8] = *a9;
          *(void *)&long long v66 = v43;
          if (v43) {
            CFRetain(v43);
          }
          *((void *)&v66 + 1) = v68;
          if (v68) {
            CFRetain(v68);
          }
          v45 = self;
          *(void *)&long long v67 = v45;
          *((CFTypeRef *)&v67 + 1) = v74[0];
          if (v74[0])
          {
            CFRetain(v74[0]);
            long long v46 = v67;
          }
          else
          {
            long long v46 = (unint64_t)v45;
          }
          long long v58 = v46;
          long long v78 = v63;
          long long v79 = v64;
          long long v80 = *(_OWORD *)v65;
          long long v81 = *(_OWORD *)&v65[16];
          long long v75 = v60;
          long long v76 = v61;
          long long v77 = v62;
          id v47 = (id)v46;
          long long v90 = v63;
          long long v91 = v64;
          long long v92 = *(_OWORD *)v65;
          long long v93 = *(_OWORD *)&v65[16];
          *(_OWORD *)&buf[1] = v60;
          long long v88 = v61;
          id v83 = v47;
          v74[1] = 0;
          buf[0] = v59;
          long long v89 = v62;
          long long v94 = v66;
          long long v82 = 0u;
          id v48 = v47;
          long long v95 = v58;
          uint64_t v84 = 0;
          operator new();
        }
      }
      v19.size_t var0 = (void *)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (LODWORD(v19.var0))
      {
        LOWORD(buf[0]) = 0;
        v21 = MEMORY[0x1E4F14500];
        v22 = "Offset is outside frame dimensions";
        uint32_t v23 = 2;
        goto LABEL_31;
      }
    }
    else
    {
      v19.size_t var0 = (void *)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (LODWORD(v19.var0))
      {
        LODWORD(buf[0]) = 134217984;
        *(void *)((char *)buf + 4) = PlaneCount;
        v21 = MEMORY[0x1E4F14500];
        v22 = "%zu planes not supported";
        uint32_t v23 = 12;
LABEL_31:
        _os_log_error_impl(&dword_1BB9B9000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)buf, v23);
      }
    }
  }
  void *v18 = 0;
  return v19;
}

- (int)copySubframe:(__CVBuffer *)a3 toFrame:(__CVBuffer *)a4 atOffset:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  int result = [(VCPSideCarMetal *)self selectGPUForFrame:a4];
  if (!result)
  {
    if (self->_supportsQuadPermute)
    {
      v41 = (int64x2_t *)a5;
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      OSType v11 = CVPixelBufferGetPixelFormatType(a4);
      size_t v12 = 0;
      BOOL v14 = ((v11 - 641230384) & 0xFFBFEFFB) != 0 && PixelFormatType == v11;
      BOOL v40 = v14;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      char v15 = 1;
      do
      {
        char v16 = v15;
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v12);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v12);
        future<CF<const __CFData *>> v19 = (size_t *)&v60 + 3 * v12;
        *future<CF<const __CFData *>> v19 = WidthOfPlane;
        v19[1] = HeightOfPlane;
        v19[2] = 1;
        uint64_t v20 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:v12 withAttributes:self->_readAttributes];
        v21 = (void *)*(&v66 + v12);
        *(&v66 + v12) = v20;

        uint64_t v22 = [(VCPSideCarMetal *)self unormTexture:a4 forPlane:v12 withAttributes:self->_writeAttributes];
        uint32_t v23 = (void *)*(&v64 + v12);
        *(&v64 + v12) = v22;

        char v15 = 0;
        size_t v12 = 1;
      }
      while ((v16 & 1) != 0);
      unint64_t var0 = a5->var0;
      unint64_t v24 = v41->u64[1];
      uint64_t v26 = v41[1].i64[0];
      char v27 = (unint64_t)v60 > (unint64_t)v62;
      char v28 = *((void *)&v60 + 1) > *((void *)&v62 + 1);
      v29 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      unint64_t v30 = v29;
      unint64_t v31 = var0 >> v27;
      unint64_t v32 = v24 >> v28;
      if (v40)
      {
        int v33 = [v29 blitCommandEncoder];
        memset(v55, 0, sizeof(v55));
        long long v53 = v60;
        uint64_t v54 = v61;
        int64x2_t v51 = *v41;
        uint64_t v52 = v41[1].i64[0];
        [v33 copyFromTexture:v66 sourceSlice:0 sourceLevel:0 sourceOrigin:v55 sourceSize:&v53 toTexture:v64 destinationSlice:0 destinationLevel:0 destinationOrigin:&v51];
        long long v48 = v62;
        uint64_t v49 = v63;
        memset(v50, 0, sizeof(v50));
        v47[0] = v31;
        v47[1] = v32;
        v47[2] = v26;
        [v33 copyFromTexture:v67 sourceSlice:0 sourceLevel:0 sourceOrigin:v50 sourceSize:&v48 toTexture:v65 destinationSlice:0 destinationLevel:0 destinationOrigin:v47];
        [v33 endEncoding];
      }
      else
      {
        int v33 = [v29 computeCommandEncoder];
        int32x2_t v57 = vmovn_s64(*v41);
        int v58 = v31;
        int v59 = v32;
        uint64_t v56 = 0;
        [v33 setComputePipelineState:self->_blitKernel];
        uint64_t v34 = 0;
        int64x2_t v42 = vdupq_n_s64(0x10uLL);
        char v35 = 1;
        do
        {
          char v36 = v35;
          [v33 setTexture:*(&v66 + v34) atIndex:0];
          [v33 setTexture:*(&v64 + v34) atIndex:1];
          [v33 setBytes:&v56 length:8 atIndex:0];
          [v33 setBytes:&v57 + v34 length:8 atIndex:1];
          v37 = (char *)&v60 + 24 * v34;
          long long v45 = *(_OWORD *)v37;
          uint64_t v46 = *((void *)v37 + 2);
          int64x2_t v43 = v42;
          uint64_t v44 = 1;
          [v33 dispatchThreads:&v45 threadsPerThreadgroup:&v43];
          char v35 = 0;
          uint64_t v34 = 1;
        }
        while ((v36 & 1) != 0);
        [v33 endEncoding];
      }

      if (([v30 commitAndWaitUntilSubmitted] & 1) == 0) {
        [v30 waitUntilScheduled];
      }

      for (uint64_t i = 8; i != -8; i -= 8)
      for (uint64_t j = 8; j != -8; j -= 8)

      return 0;
    }
    else
    {
      return -12910;
    }
  }
  return result;
}

- (int)copyFromFrame:(__CVBuffer *)a3 toTile:(__CVBuffer *)a4 origin:(id *)a5 size:(id *)a6 withFence:(void *)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  int v12 = -[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (v12) {
    return v12;
  }
  size_t var0 = a5->var0;
  if (var0 <= CVPixelBufferGetWidth(a3))
  {
    size_t var1 = a5->var1;
    if (var1 <= CVPixelBufferGetHeight(a3))
    {
      unint64_t v15 = (int)CVPixelBufferGetWidth(a3) - a5->var0;
      if (v15 >= a6->var0) {
        unint64_t v15 = a6->var0;
      }
      a6->size_t var0 = v15;
      unint64_t v16 = (int)CVPixelBufferGetHeight(a3) - a5->var1;
      if (v16 >= a6->var1) {
        unint64_t v16 = a6->var1;
      }
      a6->size_t var1 = v16;
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      char v18 = WidthOfPlane > CVPixelBufferGetWidthOfPlane(a3, 1uLL);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      char v20 = HeightOfPlane > CVPixelBufferGetHeightOfPlane(a3, 1uLL);
      unint64_t v21 = a6->var0;
      unint64_t v36 = a5->var0;
      unint64_t v37 = a6->var1;
      unint64_t v35 = a5->var1;
      *(void *)buf = 0;
      uint64_t v60 = 0;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      *(void *)buf = [(VCPSideCarMetal *)self unormTexture:a4 forPlane:0 withAttributes:self->_writeAttributes];

      uint64_t v57 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:0 withAttributes:self->_readAttributes];

      uint64_t v60 = [(VCPSideCarMetal *)self unormTexture:a4 forPlane:1 withAttributes:self->_writeAttributes];

      uint64_t v22 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:1 withAttributes:self->_readAttributes];
      uint64_t v58 = v22;

      if (!*(void *)buf || !v57 || !v60 || !v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          LOWORD(v55.__state_) = 0;
          _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get textures\n", (uint8_t *)&v55, 2u);
        }
        int v12 = -26525;
        goto LABEL_34;
      }
      uint64_t v34 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      OSType v24 = CVPixelBufferGetPixelFormatType(a4);
      unint64_t v33 = v21 >> v18;
      unint64_t v25 = v37 >> v20;
      unint64_t v26 = v36 >> v18;
      unint64_t v27 = v35 >> v20;
      if (((PixelFormatType - 645424688) & 0xFFFFEFFB) != 0 && ((v24 - 645424688) & 0xFFFFEFFB) != 0)
      {
        char v28 = [v34 blitCommandEncoder];
        long long v45 = *(_OWORD *)&a5->var0;
        unint64_t var2 = a5->var2;
        long long v43 = *(_OWORD *)&a6->var0;
        unint64_t v44 = a6->var2;
        memset(v42, 0, sizeof(v42));
        [v28 copyFromTexture:v57 sourceSlice:0 sourceLevel:0 sourceOrigin:&v45 sourceSize:&v43 toTexture:*(void *)buf destinationSlice:0 destinationLevel:0 destinationOrigin:v42];
        v41[0] = v26;
        v41[1] = v27;
        v41[2] = 0;
        v40[0] = v33;
        v40[1] = v25;
        v40[2] = 1;
        memset(v39, 0, sizeof(v39));
        [v28 copyFromTexture:v58 sourceSlice:0 sourceLevel:0 sourceOrigin:v41 sourceSize:v40 toTexture:v60 destinationSlice:0 destinationLevel:0 destinationOrigin:v39];
        [v28 endEncoding];
        v29 = v34;
      }
      else
      {
        if (PixelFormatType != v24)
        {
          v29 = v34;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            LOWORD(v55.__state_) = 0;
            _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Compressed Blit needs same src and dst pixfmt", (uint8_t *)&v55, 2u);
          }
          int v12 = -50;
          goto LABEL_33;
        }
        v29 = v34;
        char v28 = [v34 computeCommandEncoder];
        v55.__state_ = (std::__assoc_sub_state *)vmovn_s64(*(int64x2_t *)&a5->var0);
        v56[0] = v26;
        v56[1] = v27;
        v54.__state_ = 0;
        [v28 setComputePipelineState:self->_blitKernel];
        [v28 setTexture:v57 atIndex:0];
        [v28 setTexture:*(void *)buf atIndex:1];
        [v28 setBytes:&v55 length:8 atIndex:0];
        [v28 setBytes:&v54 length:8 atIndex:1];
        long long v52 = *(_OWORD *)&a6->var0;
        unint64_t v53 = a6->var2;
        int64x2_t v50 = vdupq_n_s64(0x10uLL);
        uint64_t v51 = 1;
        [v28 dispatchThreads:&v52 threadsPerThreadgroup:&v50];
        [v28 setTexture:v58 atIndex:0];
        [v28 setTexture:v60 atIndex:1];
        [v28 setBytes:v56 length:8 atIndex:0];
        [v28 setBytes:&v54 length:8 atIndex:1];
        v49[0] = v33;
        v49[1] = v25;
        v49[2] = 1;
        int64x2_t v47 = vdupq_n_s64(0x10uLL);
        uint64_t v48 = 1;
        [v28 dispatchThreads:v49 threadsPerThreadgroup:&v47];
        [v28 endEncoding];
      }

      if (qword_1EC027190 != -1) {
        dispatch_once_f(&qword_1EC027190, 0, (dispatch_function_t)sub_1BBA3F73C);
      }
      if (dword_1EC02719C == 255)
      {
        [v29 commit];
        [v29 waitUntilCompleted];
      }
      else if (([v29 commitAndWaitUntilSubmitted] & 1) == 0)
      {
        id v38 = v29;
        sub_1BB9CDD0C((uint64_t)&v54, &v38);
      }
      int v12 = 0;
LABEL_33:

LABEL_34:
      for (uint64_t i = 8; i != -8; i -= 8)

      for (uint64_t j = 8; j != -8; j -= 8)
      return v12;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Offset is outside frame dimensions", buf, 2u);
  }
  return -50;
}

- (int)subframeDeblock:(__CVBuffer *)a3 withOffsetsY:(unsigned int *)a4 numEdges:(int)a5
{
  int result = -[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (!result)
  {
    if (a5)
    {
      int v29 = 13;
      v30[0] = 52;
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      size_t v22 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
      size_t v12 = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      [(VCPSideCarMetal *)self compileDeblockForFrame:a3];
      if (!self->_deblockLumaH || !self->_deblockChromaH) {
        return -12910;
      }
      int v14 = sub_1BBA13A1C(PixelFormatType);
      readWriteAttributes = self->_readWriteAttributes;
      if (v14 == 8)
      {
        unint64_t v21 = [(VCPSideCarMetal *)self uintTexture:a3 forPlane:0 withAttributes:readWriteAttributes];
        [(VCPSideCarMetal *)self uintTexture:a3 forPlane:1 withAttributes:self->_readWriteAttributes];
      }
      else
      {
        unint64_t v21 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:0 withAttributes:readWriteAttributes];
        [(VCPSideCarMetal *)self unormTexture:a3 forPlane:1 withAttributes:self->_readWriteAttributes];
      char v20 = };
      unint64_t v16 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      v17 = [v16 computeCommandEncoder];
      [v16 setLabel:@"Subframe deblock"];
      [v17 setComputePipelineState:self->_deblockLumaH];
      [v17 setTexture:v21 atIndex:0];
      [v17 setBytes:v30 length:4 atIndex:0];
      [v17 setBytes:&v29 length:4 atIndex:1];
      [v17 setBytes:a4 length:4 * a5 atIndex:2];
      v28[0] = (WidthOfPlane + 31) >> 5;
      v28[1] = a5;
      v28[2] = 1;
      long long v26 = xmmword_1BBB6F4D0;
      uint64_t v27 = 1;
      [v17 dispatchThreadgroups:v28 threadsPerThreadgroup:&v26];
      if (v12 < HeightOfPlane && a5 >= 1)
      {
        uint64_t v18 = a5;
        future<CF<const __CFData *>> v19 = a4;
        do
        {
          *v19++ >>= 1;
          --v18;
        }
        while (v18);
      }
      [v17 setComputePipelineState:self->_deblockChromaH];
      [v17 setTexture:v20 atIndex:0];
      [v17 setBytes:v30 length:4 atIndex:0];
      [v17 setBytes:&v29 length:4 atIndex:1];
      [v17 setBytes:a4 length:4 * a5 atIndex:2];
      v25[0] = (v22 + 31) >> 5;
      v25[1] = a5;
      v25[2] = 1;
      long long v23 = xmmword_1BBB6F4D0;
      uint64_t v24 = 1;
      [v17 dispatchThreadgroups:v25 threadsPerThreadgroup:&v23];
      [v17 endEncoding];
      [v16 commit];
      [v16 waitUntilCompleted];
    }
    return 0;
  }
  return result;
}

- (future<unsigned)temporalTransitionScore:(__CVBuffer *)a3 previousFrame:(__CVBuffer *)a4 forRegion:(id *)a5
{
  v10 = v5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v11.unint64_t var0 = (void *)-[VCPSideCarMetal selectGPUForFrame:](self, "selectGPUForFrame:");
  if (!LODWORD(v11.var0))
  {
    [(VCPSideCarMetal *)self compileTransitionDetection];
    unint64_t var0 = a5->var1.var0;
    unint64_t var1 = a5->var1.var1;
    v11.unint64_t var0 = (void *)CVPixelBufferGetPixelFormatType(a3);
    if (self->_transitionDetection)
    {
      unsigned int v14 = (LODWORD(v11.var0) - 645424688) & 0xFFFFEFFB;
      if (v14)
      {
        uint64_t v15 = 16;
        goto LABEL_8;
      }
      if (self->_transitionDetectionUnorm)
      {
        uint64_t v15 = 32;
LABEL_8:
        uint64_t v33 = v15;
        CVPixelBufferGetWidthOfPlane(a3, 0);
        CVPixelBufferGetWidthOfPlane(a3, 1uLL);
        CVPixelBufferGetHeightOfPlane(a3, 0);
        CVPixelBufferGetHeightOfPlane(a3, 1uLL);
        unint64_t v16 = (((var0 + 127) >> 5) & 0x7FFFFFFFFFFFFFCLL) * ((var1 + 127) >> 7);
        if (self->_blockDist.allocSize_ < v16)
        {
          pool = self->_blockDist.pool_;
          self->_blockDist.pool_ = 0;

          self->_blockDist.allocSize_ = v16;
        }
        size_t Width = CVPixelBufferGetWidth(a3);
        if (Width - a5->var0.var0 < var0) {
          unint64_t var0 = Width - a5->var0.var0;
        }
        size_t Height = CVPixelBufferGetHeight(a3);
        unint64_t v20 = a5->var0.var1;
        unint64_t v21 = Height - v20;
        if (Height - v20 >= var1) {
          unint64_t v21 = var1;
        }
        v51[0] = a5->var0.var0;
        v51[1] = v20;
        unint64_t v34 = v21;
        unint64_t v35 = var0;
        v51[2] = var0;
        v51[3] = v21;
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        int v42 = sub_1BBA13A1C(PixelFormatType);
        CFTypeRef cf = 0;
        uint64_t v36 = sub_1BB9CC530((uint64_t)&self->_blockDist, &cf);
        if (v14)
        {
          uint64_t v23 = [(VCPSideCarMetal *)self rgbaUintTextureForLuma:a3 withAttributes:self->_readAttributes];
          uint64_t v24 = [(VCPSideCarMetal *)self rgbaUintTextureForLuma:a4 withAttributes:self->_readAttributes];
          uint64_t v25 = [(VCPSideCarMetal *)self rgbaUintTextureForChroma:a3 withAttributes:self->_readAttributes];
          [(VCPSideCarMetal *)self rgbaUintTextureForChroma:a4 withAttributes:self->_readAttributes];
        }
        else
        {
          uint64_t v23 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:0 withAttributes:self->_readAttributes];
          uint64_t v24 = [(VCPSideCarMetal *)self unormTexture:a4 forPlane:0 withAttributes:self->_readAttributes];
          uint64_t v25 = [(VCPSideCarMetal *)self unormTexture:a3 forPlane:1 withAttributes:self->_readAttributes];
          [(VCPSideCarMetal *)self unormTexture:a4 forPlane:1 withAttributes:self->_readAttributes];
        uint64_t v26 = };
        uint64_t v27 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
        [v27 setLabel:@"SideCar transition detection"];
        char v28 = [v27 computeCommandEncoder];
        int v29 = v28;
        uint64_t v30 = 40;
        if (!v14) {
          uint64_t v30 = 48;
        }
        [v28 setComputePipelineState:*(Class *)((char *)&self->super.isa + v30)];
        [v29 setTexture:v23 atIndex:0];
        [v29 setTexture:v24 atIndex:1];
        [v29 setTexture:v25 atIndex:2];
        [v29 setTexture:v26 atIndex:3];
        [v29 setBuffer:v36 offset:0 atIndex:0];
        [v29 setBytes:v51 length:16 atIndex:1];
        [v29 setBytes:&v42 length:4 atIndex:2];
        v40[0] = (v35 + 127) >> 7;
        v40[1] = (v34 + 127) >> 7;
        v40[2] = 1;
        uint64_t v38 = v33;
        long long v39 = xmmword_1BBB6F4D0;
        [v29 dispatchThreadgroups:v40 threadsPerThreadgroup:&v38];
        [v29 endEncoding];
        [v27 commit];
        id v31 = v27;
        CFTypeRef v32 = cf;
        if (cf) {
          CFRetain(cf);
        }
        *(void *)&long long v37 = (v35 + 127) >> 7;
        *((void *)&v37 + 1) = (v34 + 127) >> 7;
        long long v45 = v37;
        uint64_t v46 = 1;
        id v47 = v31;
        CFTypeRef v48 = v32;
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        long long v49 = v37;
        uint64_t v50 = 1;
        operator new();
      }
    }
  }
  void *v10 = 0;
  return v11;
}

- (id)rgbaUintTextureForChroma:(__CVBuffer *)a3 withAttributes:(id)a4
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
  value = self->_textureCacheRGBAChroma.value_;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v6, v8, (WidthOfPlane >> 1) & 0x3FFFFFFFFFFFFFFFLL, HeightOfPlane, 1uLL, (CVMetalTextureRef *)&cf))
  {
    size_t v12 = 0;
  }
  else
  {
    size_t v12 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v12;
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
    size_t v12 = 0;
  }
  else
  {
    size_t v12 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v12;
}

- (id)rgbaUnormTextureForLuma:(__CVBuffer *)a3 withAttributes:(id)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a4;
  CFTypeRef cf = 0;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (sub_1BBA13A1C(PixelFormatType) == 10) {
    MTLPixelFormat v8 = MTLPixelFormatRGBA16Unorm;
  }
  else {
    MTLPixelFormat v8 = MTLPixelFormatRGBA8Unorm;
  }
  value = self->_textureCacheRGBALuma.value_;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v6, v8, WidthOfPlane >> 2, HeightOfPlane, 0, (CVMetalTextureRef *)&cf))
  {
    size_t v12 = 0;
  }
  else
  {
    size_t v12 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v12;
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
  uint64_t v13 = 96;
  if (!a4) {
    uint64_t v13 = 88;
  }
  CFTypeRef cf = 0;
  if (v10 <= 8) {
    MTLPixelFormat v14 = v11;
  }
  else {
    MTLPixelFormat v14 = v12;
  }
  uint64_t v15 = *(Class *)((char *)&self->super.isa + v13);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v14, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
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
  uint64_t v14 = 96;
  if (!a4) {
    uint64_t v14 = 88;
  }
  uint64_t v15 = *(Class *)((char *)&self->super.isa + v14);
  CFTypeRef cf = 0;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, v15, a3, v8, v11, WidthOfPlane, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v18;
}

- (void)compileDeblockForFrame:(__CVBuffer *)a3
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int v5 = sub_1BBA13A1C(PixelFormatType);
  int v13 = v5;
  if ((!self->_deblockLumaH || !self->_deblockChromaH || self->_deblockBitdepth != v5) && self->_supportsQuadPermute)
  {
    CFDictionaryRef v6 = objc_opt_new();
    [v6 setConstantValue:&v13 type:33 atIndex:0];
    if (v13 == 8)
    {
      v7 = [(VCPSideCarMetal *)self compileFunction:@"SubframeDeblockLumaH_Uint" constantValues:v6];
      deblockLumaH = self->_deblockLumaH;
      self->_deblockLumaH = v7;

      [(VCPSideCarMetal *)self compileFunction:@"SubframeDeblockChromaH_Uint" constantValues:v6];
    }
    else
    {
      int v10 = [(VCPSideCarMetal *)self compileFunction:@"SubframeDeblockLumaH_Unorm" constantValues:v6];
      MTLPixelFormat v11 = self->_deblockLumaH;
      self->_deblockLumaH = v10;

      [(VCPSideCarMetal *)self compileFunction:@"SubframeDeblockChromaH_Unorm" constantValues:v6];
    }
    v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    deblockChromaH = self->_deblockChromaH;
    self->_deblockChromaH = v9;

    self->_deblockBitdepth = v13;
  }
}

- (void)compileTransitionDetection
{
  if (!self->_transitionDetection)
  {
    if (self->_supportsSIMDPermute)
    {
      v3 = [(VCPSideCarMetal *)self compileFunction:@"TransitionDetectionSIMD"];
      transitionDetection = self->_transitionDetection;
      self->_transitionDetection = v3;

      self->_transitionDetectionUnorm = [(VCPSideCarMetal *)self compileFunction:@"TransitionDetectionUnorm"];
    }
    else
    {
      if (!self->_supportsQuadPermute) {
        return;
      }
      self->_transitionDetection = [(VCPSideCarMetal *)self compileFunction:@"TransitionDetectionQuad"];
    }
    MEMORY[0x1F41817F8]();
  }
}

- (id)compileFunction:(id)a3
{
  v3 = [(VCPSideCarMetal *)self compileFunction:a3 constantValues:0];

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
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unalbe to find kernel %@", buf, 0xCu);
    }
    unsigned __int16 v12 = 0;
    id v13 = v10;
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

LABEL_13:
LABEL_14:

  return v12;
}

- (int)selectGPUForFrame:(__CVBuffer *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
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
  int v5 = self->_device;
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

  transitionDetection = self->_transitionDetection;
  self->_transitionDetection = 0;

  transitionDetectionUnorm = self->_transitionDetectionUnorm;
  self->_transitionDetectionUnorm = 0;

  blitKernel = self->_blitKernel;
  self->_blitKernel = 0;

  deblockLumaH = self->_deblockLumaH;
  self->_deblockLumaH = 0;

  deblockChromaH = self->_deblockChromaH;
  self->_deblockChromaH = 0;

  uint64_t v14 = self->_device;
  if (!v14)
  {
    id v15 = MTLCreateSystemDefaultDevice();
    id v16 = *p_device;
    id *p_device = v15;

    uint64_t v14 = (MTLDevice *)*p_device;
    if (!*p_device)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v27 = MEMORY[0x1E4F14500];
        char v28 = "Unable to get metal device\n";
        goto LABEL_50;
      }
      return -26525;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v65 = [(MTLDevice *)v14 registryID];
    _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Initializing for GPU %llx", buf, 0xCu);
    uint64_t v14 = (MTLDevice *)*p_device;
  }
  v17 = (MTLCommandQueue *)[(MTLDevice *)v14 newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v17;

  __int16 v19 = self->_commandQueue;
  if (!v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v27 = MEMORY[0x1E4F14500];
      char v28 = "Unable to get command queue\n";
LABEL_50:
      _os_log_error_impl(&dword_1BB9B9000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
      return -26525;
    }
    return -26525;
  }
  id v20 = v19;
  [(MTLCommandQueue *)v20 setGPUPriority:4];
  uint64_t v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  size_t v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VideoProcessing.VCPSideCarMetal.submission", v21);
  submissionQueue = self->_submissionQueue;
  self->_submissionQueue = v22;

  uint64_t v24 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VideoProcessing.VCPSideCarMetal.completion", v21);
  completionQueue = self->_completionQueue;
  self->_completionQueue = v24;

  [(MTLCommandQueue *)v20 setSubmissionQueue:self->_submissionQueue];
  [(MTLCommandQueue *)v20 setCompletionQueue:self->_completionQueue];
  if ([*p_device supportsFamily:2001]) {
    char v26 = 1;
  }
  else {
    char v26 = [*p_device supportsFamily:1006];
  }
  self->_supportsSIMDPermute = v26;
  if (([(MTLDevice *)self->_device supportsFamily:2002] & 1) != 0
    || ([*p_device supportsFamily:1004] & 1) != 0)
  {
    char v29 = 1;
  }
  else
  {
    char v29 = [*p_device supportsFamily:3003];
  }
  self->_supportsQuadPermute = v29;
  uint64_t v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v31 = *p_device;
  id v55 = 0;
  CFTypeRef v32 = (MTLLibrary *)[v31 newDefaultLibraryWithBundle:v30 error:&v55];
  id v33 = v55;
  library = self->_library;
  self->_library = v32;

  if (self->_library)
  {
    unint64_t v35 = [(VCPSideCarMetal *)self compileFunction:@"BlitKernel"];
    uint64_t v36 = self->_blitKernel;
    self->_blitKernel = v35;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v65 = (uint64_t)v30;
    __int16 v66 = 2112;
    id v67 = v33;
    _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
  }
  sub_1BB9CFDC8((uint64_t)&self->_packetPool, self->_device);
  sub_1BB9CFDC8((uint64_t)&self->_blockDist, self->_device);
  if (!self->_readAttributes)
  {
    uint64_t v62 = *MEMORY[0x1E4F24C88];
    uint64_t v63 = &unk_1F14F4408;
    long long v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    readAttributes = self->_readAttributes;
    self->_readAttributes = v37;
  }
  if (!self->_writeAttributes)
  {
    uint64_t v60 = *MEMORY[0x1E4F24C88];
    uint64_t v61 = &unk_1F14F4420;
    long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    writeAttributes = self->_writeAttributes;
    self->_writeAttributes = v39;
  }
  if (!self->_readWriteAttributes)
  {
    uint64_t v58 = *MEMORY[0x1E4F24C88];
    int v59 = &unk_1F14F4438;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    readWriteAttributes = self->_readWriteAttributes;
    self->_readWriteAttributes = v41;
  }
  uint64_t v56 = *MEMORY[0x1E4F24C78];
  uint64_t v57 = &unk_1F14F4450;
  CFDictionaryRef v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  value = self->_textureCacheLuma.value_;
  long long v45 = self->_device;
  if (value)
  {
    CFRelease(value);
    self->_textureCacheLuma.value_ = 0;
  }
  CVReturn v8 = CVMetalTextureCacheCreate(0, v43, v45, 0, &self->_textureCacheLuma.value_);
  if (!v8)
  {
    uint64_t v46 = self->_textureCacheChroma.value_;
    id v47 = self->_device;
    if (v46)
    {
      CFRelease(v46);
      self->_textureCacheChroma.value_ = 0;
    }
    CVReturn v8 = CVMetalTextureCacheCreate(0, v43, v47, 0, &self->_textureCacheChroma.value_);
    if (!v8)
    {
      CFTypeRef v48 = self->_textureCacheRGBALuma.value_;
      long long v49 = self->_device;
      if (v48)
      {
        CFRelease(v48);
        self->_textureCacheRGBALuma.value_ = 0;
      }
      CVReturn v8 = CVMetalTextureCacheCreate(0, v43, v49, 0, &self->_textureCacheRGBALuma.value_);
      if (!v8)
      {
        uint64_t v52 = self->_textureCacheRGBAChroma.value_;
        p_textureCacheRGBAChroma = &self->_textureCacheRGBAChroma;
        uint64_t v50 = v52;
        unint64_t v53 = p_textureCacheRGBAChroma[-13].value_;
        if (v52)
        {
          CFRelease(v50);
          p_textureCacheRGBAChroma->value_ = 0;
        }
        CVReturn v8 = CVMetalTextureCacheCreate(0, v43, v53, 0, &p_textureCacheRGBAChroma->value_);
      }
    }
  }

  return v8;
}

- (void)setPacketLayout:(id)a3
{
  id v8 = a3;
  for (unint64_t i = 0; [v8 count] > i; ++i)
  {
    int v5 = [v8 objectAtIndexedSubscript:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 objectForKeyedSubscript:@"ByteOffset"];
      id v7 = [v5 objectForKeyedSubscript:@"BytesPerRow"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        self->_planeOffset[i] = [v6 unsignedIntValue];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        self->_planeBytesPerRow[i] = [v7 unsignedIntValue];
      }
    }
  }
}

@end