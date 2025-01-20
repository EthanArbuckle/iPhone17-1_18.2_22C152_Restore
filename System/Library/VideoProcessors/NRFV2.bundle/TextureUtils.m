@interface TextureUtils
+ (int)prewarmShaders:(id)a3;
- (TextureUtils)initWithMetalContext:(id)a3;
- (int)_fillTexturePaddedArea10BitPacked:(__CVBuffer *)a3 roi:(const CGRect *)a4 fullWidth:(unsigned int)a5 fullHeight:(unsigned int)a6 useSeparateCommandQueue:(BOOL)a7;
- (int)_fillTexturePaddedArea:(id)a3 roi:(const CGRect *)a4 useSeparateCommandQueue:(BOOL)a5;
- (int)copyTexture:(id)a3 outTex:(id)a4;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 cfp:(frameProperties_t *)a4 useSeparateCommandQueue:(BOOL)a5;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 roi:(const CGRect *)a4 didExtend:(BOOL *)a5 useSeparateCommandQueue:(BOOL)a6;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 useSeparateCommandQueue:(BOOL)a4;
@end

@implementation TextureUtils

- (TextureUtils)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TextureUtils;
  v6 = [(TextureUtils *)&v29 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v11 = objc_msgSend_device(v7->_metal, v8, v9, v10);
  uint64_t v15 = objc_msgSend_newCommandQueue(v11, v12, v13, v14);
  separateCommandQueue = v7->_separateCommandQueue;
  v7->_separateCommandQueue = (MTLCommandQueue *)v15;

  if (v7->_separateCommandQueue)
  {
    v20 = objc_msgSend_sharedInstance(TextureUtilsShared, v17, v18, v19);
    uint64_t v23 = objc_msgSend_getShaders_(v20, v21, (uint64_t)v7->_metal, v22);
    shaders = v7->_shaders;
    v7->_shaders = (TextureUtilsShaders *)v23;

    if (v7->_shaders) {
      goto LABEL_4;
    }
  }
  FigDebugAssert3();
  int v28 = FigSignalErrorAt();
  v25 = 0;
  if (!v28) {
LABEL_4:
  }
    v25 = v7;
  v26 = v25;

  return v26;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [TextureUtilsShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (int)_fillTexturePaddedArea:(id)a3 roi:(const CGRect *)a4 useSeparateCommandQueue:(BOOL)a5
{
  BOOL v5 = a5;
  id v86 = a3;
  if (objc_msgSend_iosurface(v86, v8, v9, v10))
  {
    uint64_t v14 = (__IOSurface *)objc_msgSend_iosurface(v86, v11, v12, v13);
    IOSurfaceID ID = IOSurfaceGetID(v14);
  }
  else
  {
    IOSurfaceID ID = 0;
  }
  v16 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (v5)
  {
    v20 = objc_msgSend_commandBuffer(self->_separateCommandQueue, v11, v12, v13);
  }
  else
  {
    v21 = objc_msgSend_commandQueue(self->_metal, v11, v12, v13);
    v20 = objc_msgSend_commandBuffer(v21, v22, v23, v24);
  }
  if (v20)
  {
    v25 = objc_msgSend_computeCommandEncoder(v20, v17, v18, v19);
    int v28 = v25;
    if (v25)
    {
      IOSurfaceID v81 = ID;
      BOOL v83 = v5;
      v84 = v20;
      objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)self->_shaders->_fillTexturePaddedArea, v27);
      objc_msgSend_setTexture_atIndex_(v28, v29, (uint64_t)v86, 0);
      unsigned int v33 = objc_msgSend_width(v86, v30, v31, v32);
      unsigned int v37 = objc_msgSend_height(v86, v34, v35, v36);
      unsigned int v39 = v37;
      v40.i64[0] = 0;
      v40.i64[1] = __PAIR64__(v37, v33);
      int32x4_t v99 = v40;
      if (a4) {
        int32x4_t v99 = vuzp1q_s32((int32x4_t)vcvtq_u64_f64((float64x2_t)a4->origin), (int32x4_t)vcvtq_u64_f64((float64x2_t)a4->size));
      }
      objc_msgSend_setBytes_length_atIndex_(v28, v38, (uint64_t)&v99, 16, 0);
      objc_msgSend_setImageblockWidth_height_(v28, v41, 32, 32);
      uint64_t v45 = v99.u32[0];
      __int32 v82 = v99.i32[2];
      int v46 = v99.i32[1] + v99.i32[3];
      unint64_t v47 = ((unint64_t)v99.u32[1] + 31) >> 5;
      unint64_t v85 = ((unint64_t)(v39 - (v99.i32[1] + v99.i32[3])) + 31) >> 5;
      if (v99.i32[1])
      {
        long long v98 = 0uLL;
        objc_msgSend_setBytes_length_atIndex_(v28, v42, (uint64_t)&v98, 16, 1);
        unint64_t v95 = ((unint64_t)v33 + 31) >> 5;
        unint64_t v96 = v47;
        uint64_t v97 = 1;
        int64x2_t v93 = vdupq_n_s64(0x20uLL);
        uint64_t v94 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v48, (uint64_t)&v95, (uint64_t)&v93);
      }
      unint64_t v49 = ((unint64_t)v39 + 31) >> 5;
      if (v39 != v46)
      {
        LODWORD(v50) = 0;
        HIDWORD(v50) = 0;
        *(void *)((char *)&v50 + 4) = (32 * (v49 - v85));
        long long v98 = v50;
        objc_msgSend_setBytes_length_atIndex_(v28, v42, (uint64_t)&v98, 16, 1);
        unint64_t v95 = ((unint64_t)v33 + 31) >> 5;
        unint64_t v96 = v85;
        uint64_t v97 = 1;
        int64x2_t v93 = vdupq_n_s64(0x20uLL);
        uint64_t v94 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v51, (uint64_t)&v95, (uint64_t)&v93);
      }
      int v52 = v45 + v82;
      if (v45)
      {
        LODWORD(v53) = 0;
        HIDWORD(v53) = 32 * v47;
        long long v98 = v53;
        objc_msgSend_setBytes_length_atIndex_(v28, v42, (uint64_t)&v98, 16, 1);
        unint64_t v95 = (unint64_t)(v45 + 31) >> 5;
        unint64_t v96 = (v49 - v47 - v85);
        uint64_t v97 = 1;
        int64x2_t v93 = vdupq_n_s64(0x20uLL);
        uint64_t v94 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v54, (uint64_t)&v95, (uint64_t)&v93);
      }
      if (v33 != v52)
      {
        unint64_t v55 = ((unint64_t)(v33 - v52) + 31) >> 5;
        LODWORD(v56) = 32 * ((((unint64_t)v33 + 31) >> 5) - v55);
        HIDWORD(v56) = 32 * v47;
        long long v98 = v56;
        objc_msgSend_setBytes_length_atIndex_(v28, v42, (uint64_t)&v98, 16, 1);
        unint64_t v95 = v55;
        unint64_t v96 = (v49 - v47 - v85);
        uint64_t v97 = 1;
        int64x2_t v93 = vdupq_n_s64(0x20uLL);
        uint64_t v94 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v57, (uint64_t)&v95, (uint64_t)&v93);
      }
      objc_msgSend_endEncoding(v28, v42, v43, v44);
      v16 = (_DWORD *)MEMORY[0x263F00E10];
      v20 = v84;
      if (*MEMORY[0x263F00E10])
      {
        v61 = objc_msgSend_commandQueue(v84, v58, v59, v60);
        v65 = objc_msgSend_commandBuffer(v61, v62, v63, v64);

        objc_msgSend_setLabel_(v65, v66, @"KTRACE_MTLCMDBUF", v67);
        v90[0] = MEMORY[0x263EF8330];
        v90[1] = 3221225472;
        v90[2] = sub_262FFBE38;
        v90[3] = &unk_2655C3920;
        id v68 = v86;
        id v91 = v68;
        IOSurfaceID v92 = v81;
        objc_msgSend_addCompletedHandler_(v65, v69, (uint64_t)v90, v70);
        objc_msgSend_commit(v65, v71, v72, v73);
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = sub_262FFBE6C;
        v87[3] = &unk_2655C3920;
        id v88 = v68;
        IOSurfaceID v89 = v81;
        objc_msgSend_addCompletedHandler_(v84, v74, (uint64_t)v87, v75);
      }
      objc_msgSend_commit(v84, v58, v59, v60);
      if (v83) {
        objc_msgSend_waitUntilScheduled(v84, v76, v77, v78);
      }
      int v79 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v79 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v79 = FigSignalErrorAt();
    int v28 = 0;
  }
  if (*v16 == 1) {
    kdebug_trace();
  }

  return v79;
}

- (int)_fillTexturePaddedArea10BitPacked:(__CVBuffer *)a3 roi:(const CGRect *)a4 fullWidth:(unsigned int)a5 fullHeight:(unsigned int)a6 useSeparateCommandQueue:(BOOL)a7
{
  BOOL v7 = a7;
  v105[0] = a5;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  uint64_t v13 = IOSurface;
  if (IOSurface) {
    IOSurfaceID ID = IOSurfaceGetID(IOSurface);
  }
  else {
    IOSurfaceID ID = 0;
  }
  uint64_t v15 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (!CVPixelBufferIsPlanar(a3)
    || !CVPixelBufferGetPlaneCount(a3)
    || (IOSurfaceID v90 = ID,
        BaseAddressOfPlane = IOSurfaceGetBaseAddressOfPlane(v13, 0),
        v17 = IOSurfaceGetBaseAddressOfPlane(v13, 1uLL),
        BaseAddressOfPlane >= v17))
  {
    FigDebugAssert3();
    int v88 = FigSignalErrorAt();
    v26 = 0;
LABEL_26:
    unint64_t v53 = 0;
    unsigned int v33 = 0;
    goto LABEL_21;
  }
  int v18 = (int)v17;
  unsigned int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  unsigned int v103 = BytesPerRowOfPlane >> 3;
  unsigned int v104 = BytesPerRowOfPlane >> 2;
  uint64_t v23 = objc_msgSend_device(self->_metal, v20, v21, v22);
  v26 = objc_msgSend_newBufferWithIOSurface_(v23, v24, (uint64_t)v13, v25);

  if (!v26)
  {
    FigDebugAssert3();
    int v88 = FigSignalErrorAt();
    goto LABEL_26;
  }
  if (v7)
  {
    unsigned int v33 = objc_msgSend_commandBuffer(self->_separateCommandQueue, v27, v28, v29);
  }
  else
  {
    v34 = objc_msgSend_commandQueue(self->_metal, v27, v28, v29);
    unsigned int v33 = objc_msgSend_commandBuffer(v34, v35, v36, v37);
  }
  if (!v33
    || (objc_msgSend_computeCommandEncoder(v33, v30, v31, v32),
        (v38 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v88 = FigSignalErrorAt();
    unint64_t v53 = 0;
LABEL_29:
    uint64_t v15 = (_DWORD *)MEMORY[0x263F00E10];
    goto LABEL_21;
  }
  v41 = v38;
  BOOL v91 = v7;
  objc_msgSend_setComputePipelineState_(v38, v39, (uint64_t)self->_shaders->_fillTexturePaddedArea10BitPacked_Luma, v40);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v42, (uint64_t)v26, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v41, v43, (uint64_t)v105, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v41, v44, (uint64_t)&v104, 4, 2);
  int32x4_t v102 = vuzp1q_s32((int32x4_t)vcvtq_u64_f64((float64x2_t)a4->origin), (int32x4_t)vcvtq_u64_f64((float64x2_t)a4->size));
  objc_msgSend_setBytes_length_atIndex_(v41, v45, (uint64_t)&v102, 16, 3);
  v101[0] = (v105[0] + 2) / 3uLL;
  v101[1] = a6;
  v101[2] = 1;
  long long v99 = xmmword_2631182A0;
  uint64_t v100 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v41, v46, (uint64_t)v101, (uint64_t)&v99);
  objc_msgSend_endEncoding(v41, v47, v48, v49);
  v105[0] >>= 1;
  unint64_t v53 = objc_msgSend_computeCommandEncoder(v33, v50, v51, v52);

  if (!v53)
  {
    FigDebugAssert3();
    int v88 = FigSignalErrorAt();
    goto LABEL_29;
  }
  objc_msgSend_setComputePipelineState_(v53, v54, (uint64_t)self->_shaders->_fillTexturePaddedArea10BitPacked_Chroma, v55);
  objc_msgSend_setBuffer_offset_atIndex_(v53, v56, (uint64_t)v26, (v18 - BaseAddressOfPlane), 0);
  objc_msgSend_setBytes_length_atIndex_(v53, v57, (uint64_t)v105, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v53, v58, (uint64_t)&v103, 4, 2);
  makeChromaROI();
  v60.f64[1] = v59;
  v62.f64[1] = v61;
  int32x4_t v102 = vuzp1q_s32((int32x4_t)vcvtq_u64_f64(v60), (int32x4_t)vcvtq_u64_f64(v62));
  objc_msgSend_setBytes_length_atIndex_(v53, v63, (uint64_t)&v102, 16, 3);
  v98[0] = (v105[0] + 2) / 3uLL;
  v98[1] = a6 >> 1;
  v98[2] = 1;
  long long v96 = xmmword_2631182A0;
  uint64_t v97 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v53, v64, (uint64_t)v98, (uint64_t)&v96);
  objc_msgSend_endEncoding(v53, v65, v66, v67);
  uint64_t v15 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10])
  {
    v71 = objc_msgSend_commandQueue(v33, v68, v69, v70);
    uint64_t v75 = objc_msgSend_commandBuffer(v71, v72, v73, v74);

    objc_msgSend_setLabel_(v75, v76, @"KTRACE_MTLCMDBUF", v77);
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = sub_262FFC6B4;
    v94[3] = &unk_2655C3940;
    v94[4] = a3;
    IOSurfaceID v95 = v90;
    objc_msgSend_addCompletedHandler_(v75, v78, (uint64_t)v94, v79);
    objc_msgSend_commit(v75, v80, v81, v82);
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = sub_262FFC6E8;
    v92[3] = &unk_2655C3940;
    v92[4] = a3;
    IOSurfaceID v93 = v90;
    objc_msgSend_addCompletedHandler_(v33, v83, (uint64_t)v92, v84);
  }
  objc_msgSend_commit(v33, v68, v69, v70);
  if (v91) {
    objc_msgSend_waitUntilScheduled(v33, v85, v86, v87);
  }
  int v88 = 0;
LABEL_21:
  if (*v15 == 1) {
    kdebug_trace();
  }

  return v88;
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 useSeparateCommandQueue:(BOOL)a4
{
  return objc_msgSend_fillPaddedAreaInFrame_roi_didExtend_useSeparateCommandQueue_(self, a2, (uint64_t)a3, 0, 0, a4);
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 roi:(const CGRect *)a4 didExtend:(BOOL *)a5 useSeparateCommandQueue:(BOOL)a6
{
  BOOL v6 = a6;
  if (!CVPixelBufferIsPlanar(a3))
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
    uint64_t v19 = 0;
    v20 = 0;
    goto LABEL_52;
  }
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  v48[0] = 0;
  v48[1] = 0;
  *(double *)&v48[2] = (double)WidthOfPlane;
  *(double *)&v48[3] = (double)HeightOfPlane;
  uint64_t v13 = (const CGRect *)v48;
  if (a4) {
    uint64_t v14 = a4;
  }
  else {
    uint64_t v14 = (const CGRect *)v48;
  }
  uint64_t v15 = (WidthOfPlane + 15) & 0xFFFFFFF0;
  uint64_t v16 = (HeightOfPlane + 15) & 0xFFFFFFF0;
  if (v14->origin.x == 0.0)
  {
    if (a4) {
      uint64_t v13 = a4;
    }
    if (v13->origin.y == 0.0)
    {
      v17 = (const CGRect *)v48;
      int v18 = a4 ? a4 : (const CGRect *)v48;
      if (v18->size.width == (double)v15)
      {
        if (a4) {
          v17 = a4;
        }
        if (v17->size.height == (double)v16)
        {
          uint64_t v19 = 0;
          v20 = 0;
LABEL_51:
          int v30 = 0;
          goto LABEL_52;
        }
      }
    }
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int v22 = 0;
  if (PixelFormatType > 792225327)
  {
    if (PixelFormatType > 2084070959)
    {
      if (PixelFormatType == 2084070960) {
        goto LABEL_29;
      }
      int v23 = 2088265264;
    }
    else
    {
      if (PixelFormatType == 792225328) {
        goto LABEL_29;
      }
      int v23 = 796419632;
    }
LABEL_28:
    if (PixelFormatType != v23) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (PixelFormatType > 758670895)
  {
    if (PixelFormatType == 758670896) {
      goto LABEL_29;
    }
    int v23 = 762865200;
    goto LABEL_28;
  }
  if (PixelFormatType != 641230384)
  {
    int v23 = 645424688;
    goto LABEL_28;
  }
LABEL_29:
  int v22 = 1;
LABEL_30:
  int v24 = 1;
  if (PixelFormatType <= 796419631)
  {
    if (PixelFormatType == 645424688)
    {
LABEL_37:
      int v24 = 0;
      goto LABEL_38;
    }
    int v25 = 762865200;
  }
  else
  {
    if (PixelFormatType == 796419632 || PixelFormatType == 2088265264) {
      goto LABEL_37;
    }
    int v25 = 1885745712;
  }
  if (PixelFormatType == v25) {
    goto LABEL_37;
  }
LABEL_38:
  size_t extraRowsOnBottom = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, 0, 0, &extraRowsOnBottom);
  if (CVPixelBufferGetBytesPerRowOfPlane(a3, 0) >= v15)
  {
    size_t v26 = CVPixelBufferGetHeightOfPlane(a3, 0);
    if (extraRowsOnBottom + v26 >= v16)
    {
      if (v6) {
        objc_msgSend_waitForSchedule(self->_metal, v27, v28, v29);
      }
      if ((v22 | v24))
      {
        uint64_t MetalLumaFormat = objc_msgSend_getMetalLumaFormat_(LumaChromaImage, v27, (uint64_t)a3, v29);
        v20 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v32, (uint64_t)a3, MetalLumaFormat, 7, 0, 16);
        if (v20)
        {
          int v34 = objc_msgSend__fillTexturePaddedArea_roi_useSeparateCommandQueue_(self, v33, (uint64_t)v20, (uint64_t)v14, v6);
          if (!v34)
          {
            makeChromaROI();
            v46[0] = v35;
            v46[1] = v36;
            v46[2] = v37;
            v46[3] = v38;
            uint64_t MetalChromaFormat = objc_msgSend_getMetalChromaFormat_(LumaChromaImage, v39, (uint64_t)a3, v40);
            uint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(self->_metal, v42, (uint64_t)a3, MetalChromaFormat, 7, 1, 8);
            if (!v19)
            {
              FigDebugAssert3();
              int v30 = FigSignalErrorAt();
              goto LABEL_52;
            }
            int v44 = objc_msgSend__fillTexturePaddedArea_roi_useSeparateCommandQueue_(self, v43, (uint64_t)v19, (uint64_t)v46, v6);
            if (v44)
            {
              int v30 = v44;
              FigDebugAssert3();
              goto LABEL_52;
            }
            if (!a5) {
              goto LABEL_51;
            }
LABEL_49:
            int v30 = 0;
            *a5 = 1;
            goto LABEL_52;
          }
          int v30 = v34;
          FigDebugAssert3();
        }
        else
        {
          FigDebugAssert3();
          int v30 = FigSignalErrorAt();
        }
        uint64_t v19 = 0;
        goto LABEL_52;
      }
      objc_msgSend__fillTexturePaddedArea10BitPacked_roi_fullWidth_fullHeight_useSeparateCommandQueue_(self, v27, (uint64_t)a3, (uint64_t)v14, v15, v16, v6);
      uint64_t v19 = 0;
      v20 = 0;
      if (!a5) {
        goto LABEL_51;
      }
      goto LABEL_49;
    }
  }
  uint64_t v19 = 0;
  v20 = 0;
  int v30 = -1;
LABEL_52:

  return v30;
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 cfp:(frameProperties_t *)a4 useSeparateCommandQueue:(BOOL)a5
{
  p_ltm_soft_gain = (char *)&a4[1].meta.exposureParams.ltm_soft_gain;
  if (LOBYTE(a4[1].meta.exposureParams.ltm_soft_gain)) {
    return 0;
  }
  unsigned __int8 v11 = 0;
  int v6 = objc_msgSend_fillPaddedAreaInFrame_roi_didExtend_useSeparateCommandQueue_(self, a2, (uint64_t)a3, (uint64_t)&a4->meta.ROI, &v11, a5);
  if (v6)
  {
    FigDebugAssert3();
  }
  else
  {
    int v8 = v11;
    char *p_ltm_soft_gain = v11;
    if (v8)
    {
      unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      *((void *)p_ltm_soft_gain + 1) = *(void *)&vadd_s32((int32x2_t)__PAIR64__(CVPixelBufferGetHeightOfPlane(a3, 0), WidthOfPlane), (int32x2_t)0xF0000000FLL) & 0xFFFFFFF0FFFFFFF0;
    }
  }
  return v6;
}

- (int)copyTexture:(id)a3 outTex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v11 = objc_msgSend_commandQueue(self->_metal, v8, v9, v10);
  uint64_t v15 = objc_msgSend_commandBuffer(v11, v12, v13, v14);

  if (!v15
    || (objc_msgSend_computeCommandEncoder(v15, v16, v17, v18), (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
    unsigned int v33 = v7;
    goto LABEL_19;
  }
  int v23 = (void *)v19;
  int isCompressed = objc_msgSend_isCompressed(v7, v20, v21, v22);
  if (isCompressed) {
    uint64_t v28 = 32;
  }
  else {
    uint64_t v28 = 4;
  }
  if (isCompressed) {
    uint64_t v29 = 32;
  }
  else {
    uint64_t v29 = 64;
  }
  if ((objc_msgSend_isCompressed(v7, v25, v26, v27) & 1) != 0 || objc_msgSend_pixelFormat(v7, v30, v31, v32) != 588)
  {
    if ((objc_msgSend_isCompressed(v7, v30, v31, v32) & 1) != 0 || objc_msgSend_pixelFormat(v7, v34, v37, v35) != 589)
    {
      uint64_t v36 = 48;
      unsigned int v33 = v7;
      goto LABEL_18;
    }
    unsigned int v33 = objc_msgSend_rebindTex_format_usage_plane_xFactor_(self->_metal, v34, (uint64_t)v7, 103, 6, 1, 3);

    if (v33)
    {
      uint64_t v36 = 40;
      goto LABEL_18;
    }
LABEL_21:
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();

    goto LABEL_19;
  }
  unsigned int v33 = objc_msgSend_rebindTex_format_usage_plane_xFactor_(self->_metal, v30, (uint64_t)v7, 53, 6, 0, 3);

  if (!v33) {
    goto LABEL_21;
  }
  uint64_t v36 = 32;
LABEL_18:
  objc_msgSend_setComputePipelineState_(v23, v34, *(uint64_t *)((char *)&self->_shaders->super.isa + v36), v35);
  objc_msgSend_setTexture_atIndex_(v23, v38, (uint64_t)v6, 0);
  objc_msgSend_setTexture_atIndex_(v23, v39, (uint64_t)v33, 1);
  v56[0] = objc_msgSend_width(v33, v40, v41, v42);
  v56[1] = objc_msgSend_height(v33, v43, v44, v45);
  v56[2] = 1;
  v55[0] = v29;
  v55[1] = v28;
  v55[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v23, v46, (uint64_t)v56, (uint64_t)v55);
  objc_msgSend_endEncoding(v23, v47, v48, v49);
  objc_msgSend_commit(v15, v50, v51, v52);

  int v53 = 0;
LABEL_19:

  return v53;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separateCommandQueue, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end