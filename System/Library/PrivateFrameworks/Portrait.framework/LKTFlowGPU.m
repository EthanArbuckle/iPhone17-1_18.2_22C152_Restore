@interface LKTFlowGPU
+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4;
- (BOOL)isBidirectional;
- (BOOL)isInverse;
- (BOOL)isValid;
- (BOOL)needConversionBGRA2YUVA;
- (BOOL)useNonLocalRegularization;
- (CGSize)aux_size;
- (CGSize)ref_size;
- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6;
- (MTLBuffer)keypoints;
- (float)nlreg_sigma_c;
- (float)nlreg_sigma_l;
- (float)nlreg_sigma_w;
- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5;
- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeOpticalFlow:(id)a3 computeFeatureI0:(BOOL)a4 computeFeatureI1:(BOOL)a5;
- (int)_computeOpticalFlowBidirectional:(id)a3;
- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4 I_idx:(int)a5;
- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7;
- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11;
- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6;
- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9;
- (int)_setupBuffer;
- (int)_setupPipelines;
- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4;
- (int)computeKeypointsFromTexForwardFlow:(id)a3 backwardFlow:(id)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7 commandBuffer:(id)a8;
- (int)estimateFlowFromTexReference:(id)a3 target:(id)a4 commandBuffer:(id)a5;
- (int)estimateFlowStreamTex:(id)a3 commandBuffer:(id)a4;
- (int)estimateFlowStreamTex:(id)a3 index:(int)a4 doOpticalFlow:(BOOL)a5 commandBuffer:(id)a6;
- (int)nlreg_padding;
- (int)nlreg_radius;
- (int)nscales;
- (int)nwarpings;
- (int)setOutputTexUV:(id)a3;
- (int)setOutputTexUVForward:(id)a3 backward:(id)a4;
- (int)streamFrameCount;
- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5;
- (void)_setDefaultParameters;
- (void)_setupBuffer;
- (void)_setupPipelines;
- (void)reset;
- (void)setIsBidirectional:(BOOL)a3;
- (void)setIsInverse:(BOOL)a3;
- (void)setNeedConversionBGRA2YUVA:(BOOL)a3;
- (void)setNlreg_padding:(int)a3;
- (void)setNlreg_radius:(int)a3;
- (void)setNlreg_sigma_c:(float)a3;
- (void)setNlreg_sigma_l:(float)a3;
- (void)setNlreg_sigma_w:(float)a3;
- (void)setNwarpings:(int)a3;
- (void)setPreset:(int64_t)a3;
- (void)setUseNonLocalRegularization:(BOOL)a3;
@end

@implementation LKTFlowGPU

- (void)setUseNonLocalRegularization:(BOOL)a3
{
  self->_useNonLocalRegularization = a3;
}

- (void)setPreset:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(LKTFlowGPU *)self _setDefaultParameters];
      return;
    case 1:
      int v3 = 1;
      goto LABEL_8;
    case 2:
      int v3 = 3;
      goto LABEL_8;
    case 3:
      int v3 = 5;
LABEL_8:
      self->_nwarpings = v3;
      self->_useNonLocalRegularization = 0;
      break;
    case 4:
      self->_nwarpings = 6;
      self->_useNonLocalRegularization = 1;
      *(void *)&self->_nlreg_radius = 0x200000004;
      *(void *)&self->_nlreg_sigma_l = 0x4040000040C00000;
      self->_nlreg_sigma_w = 0.25;
      break;
    default:
      id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Invalid parameter" reason:@"Unknown preset" userInfo:0];
      objc_exception_throw(v4);
  }
}

- (void)setNeedConversionBGRA2YUVA:(BOOL)a3
{
  self->_needConversionBGRA2YUVA = a3;
}

- (void)setIsInverse:(BOOL)a3
{
  self->_isInverse = a3;
}

- (void)setIsBidirectional:(BOOL)a3
{
  self->_isBidirectional = a3;
}

- (int)setOutputTexUVForward:(id)a3 backward:(id)a4
{
  v6 = (MTLTexture *)a3;
  v7 = (MTLTexture *)a4;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = v6;
  v9 = v6;

  uv_bwd_tex_user_ref = self->_uv_bwd_tex_user_ref;
  self->_uv_bwd_tex_user_ref = v7;

  self->_isValid = v9 != 0;
  return 0;
}

- (int)setOutputTexUV:(id)a3
{
  return [(LKTFlowGPU *)self setOutputTexUVForward:a3 backward:0];
}

- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LKTFlowGPU;
  v12 = [(LKTFlowGPU *)&v20 init];
  v13 = v12;
  if (!v12)
  {
LABEL_7:
    v13 = v13;
    v17 = v13;
    goto LABEL_11;
  }
  if (((v7 | v8) & 1) == 0)
  {
    objc_storeStrong((id *)&v12->_metalContext, a3);
    [(LKTFlowGPU *)v13 _setDefaultParameters];
    [(LKTFlowGPU *)v13 _initMemory:v8 height:v7 nscales:v6];
    int v14 = [(LKTFlowGPU *)v13 _setupPipelines];
    int v15 = [(LKTFlowGPU *)v13 _setupBuffer] | v14;
    [(LKTFlowGPU *)v13 reset];
    if (v15)
    {
      v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[LKTFlowGPU initWithMetalContext:width:height:nscales:]();
      }

      v13 = 0;
    }
    goto LABEL_7;
  }
  v18 = _PTLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[LKTFlowGPU initWithMetalContext:width:height:nscales:]();
  }

  v17 = 0;
LABEL_11:

  return v17;
}

- (void)reset
{
  *(_WORD *)self->_indexUpdated = 0;
  *(void *)&self->_current_frame_index = 0;
}

- (void)_setDefaultParameters
{
  self->_nwarpings = 3;
  self->_useNonLocalRegularization = 0;
  *(void *)&self->_nlreg_radius = 0x200000004;
  *(void *)&self->_nlreg_sigma_l = 0x4040000040C00000;
  self->_nlreg_sigma_w = 0.25;
}

- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5
{
  int v6 = 0;
  self->_isValid = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    int v6 = 0;
    int v7 = a4;
    int v8 = a3;
    do
    {
      int v9 = (v8 & 1) + v8;
      if (v9 >= 0) {
        int v10 = v9;
      }
      else {
        int v10 = v9 + 1;
      }
      int v11 = v10 >> 1;
      int v12 = v9 + 1;
      if (v11 >= 0) {
        int v13 = v11 & 1;
      }
      else {
        int v13 = -(v11 & 1);
      }
      int v14 = (v7 & 1) + v7;
      if (v14 >= 0) {
        int v15 = v14;
      }
      else {
        int v15 = v14 + 1;
      }
      int v16 = v15 >> 1;
      int v17 = v14 + 1;
      if (v16 >= 0) {
        int v18 = v16 & 1;
      }
      else {
        int v18 = -(v16 & 1);
      }
      int v19 = v12 + 2 * v13;
      int v8 = v19 >> 1;
      int v20 = v17 + 2 * v18;
      int v7 = v20 >> 1;
      ++v6;
    }
    while (v19 >= 16 && v20 > 15);
  }
  self->_ref_size.width = (double)a3;
  self->_ref_size.height = (double)a4;
  self->_aux_size.width = (double)a3;
  self->_aux_size.height = (double)a4;
  if (a5 >= 0) {
    int v22 = a5;
  }
  else {
    int v22 = v6;
  }
  self->_int nscales = v22;
  self->_maxThreadExecutionWidth = 0;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = 0;

  *(void *)&self->_current_frame_index = 0;
  int nscales = self->_nscales;
  if (nscales > v6 || nscales >= 10)
  {
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Invalid parameter" reason:@"The number of scales specified is too large" userInfo:0];
    objc_exception_throw(v25);
  }
}

- (int)_setupBuffer
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  int height = (int)self->_ref_size.height;
  int v4 = ((int)self->_ref_size.width + LODWORD(self->_maxThreadExecutionWidth) - 1)
     / SLODWORD(self->_maxThreadExecutionWidth)
     * LODWORD(self->_maxThreadExecutionWidth);
  v137 = objc_opt_new();
  uint64_t v5 = 0;
  int v6 = v4 * height;
  Adiagb_buf = self->_Adiagb_buf;
  Ixy_buf = self->_Ixy_buf;
  char v9 = 1;
  while (1)
  {
    char v10 = v9;
    int v11 = [(PTMetalContext *)self->_metalContext device];
    uint64_t v12 = [v11 newBufferWithLength:8 * v6 options:0];
    int v13 = Adiagb_buf[v5];
    Adiagb_buf[v5] = (MTLBuffer *)v12;

    if (!Adiagb_buf[v5]) {
      break;
    }
    int v14 = [(PTMetalContext *)self->_metalContext device];
    uint64_t v15 = [v14 newBufferWithLength:2 * v6 options:0];
    int v16 = Ixy_buf[v5];
    Ixy_buf[v5] = (MTLBuffer *)v15;

    if (!Ixy_buf[v5])
    {
      kpt_buf = _PTLogSystem();
      if (os_log_type_enabled(kpt_buf, OS_LOG_TYPE_ERROR)) {
        -[LKTFlowGPU _setupBuffer]();
      }
      int v21 = -2;
      goto LABEL_117;
    }
    char v9 = 0;
    uint64_t v5 = 1;
    if ((v10 & 1) == 0)
    {
      int v17 = [(PTMetalContext *)self->_metalContext device];
      int v18 = (MTLBuffer *)[v17 newBufferWithLength:4 * v6 options:0];
      idt_buf = self->_idt_buf;
      self->_idt_buf = v18;

      if (self->_idt_buf)
      {
        if (self->_nscales < 1)
        {
          int v21 = 0;
        }
        else
        {
          uint64_t v20 = 0;
          int v21 = 0;
          G0_tex = self->_G0_tex;
          G1_tex = self->_G1_tex;
          int32x2_t v24 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
          C0_tex = self->_C0_tex;
          w_tex = self->_w_tex;
          C1_tex = self->_C1_tex;
          int64x2_t v26 = vcvtq_s64_f64((float64x2_t)self->_ref_size);
          int32x2_t v27 = vmovn_s64(v26);
          I_u32_alias_tex = self->_I_u32_alias_tex;
          I_tex = self->_I_tex;
          v124 = self->_I_u32_alias_tex[1];
          v125 = self->_I_tex[1];
          unint64_t v28 = 0x1E4F35000uLL;
          v26.i64[0] = 67109120;
          int64x2_t v123 = v26;
          do
          {
            int32x2_t v131 = v24;
            v29.i64[0] = v27.i32[0];
            v29.i64[1] = v27.i32[1];
            self->_ref_pyr_size[v20] = (CGSize)vcvtq_f64_s64(v29);
            v29.i64[0] = v24.i32[0];
            v29.i64[1] = v24.i32[1];
            self->_aux_pyr_size[v20] = (CGSize)vcvtq_f64_s64(v29);
            uint64_t v134 = v27.u32[0];
            uint64_t v135 = v27.u32[1];
            v30 = objc_msgSend(*(id *)(v28 + 816), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, *(_OWORD *)&v123);
            v31 = [(PTMetalContext *)self->_metalContext device];
            if ([v31 supportsFamily:1007]) {
              uint64_t v32 = 0;
            }
            else {
              uint64_t v32 = 32;
            }
            [v30 setResourceOptions:v32];

            [v30 setUsage:3];
            v33 = [(PTMetalContext *)self->_metalContext device];
            uint64_t v34 = [v33 newTextureWithDescriptor:v30];
            v35 = G0_tex[v20];
            G0_tex[v20] = (MTLTexture *)v34;

            if (!G0_tex[v20])
            {
              v36 = _PTLogSystem();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                int v139 = v20;
                _os_log_error_impl(&dword_1D0778000, v36, OS_LOG_TYPE_ERROR, "_G0_tex[%i] is nil", buf, 8u);
              }

              int v21 = -1;
            }
            uint64_t v130 = v131.u32[0];
            objc_msgSend(v30, "setWidth:");
            uint64_t v132 = v131.u32[1];
            objc_msgSend(v30, "setHeight:");
            v37 = [(PTMetalContext *)self->_metalContext device];
            uint64_t v38 = [v37 newTextureWithDescriptor:v30];
            v39 = G1_tex[v20];
            G1_tex[v20] = (MTLTexture *)v38;

            if (!G1_tex[v20])
            {
              v40 = _PTLogSystem();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                int v139 = v20;
                _os_log_error_impl(&dword_1D0778000, v40, OS_LOG_TYPE_ERROR, "_G1_tex[%i] is nil", buf, 8u);
              }

              int v21 = -1;
            }
            if (G0_tex[v20]) {
              objc_msgSend(v137, "addObject:");
            }
            if (G1_tex[v20]) {
              objc_msgSend(v137, "addObject:");
            }
            [v30 setPixelFormat:115];
            [v30 setWidth:v134];
            [v30 setHeight:v135];
            v41 = [(PTMetalContext *)self->_metalContext device];
            uint64_t v42 = [v41 newTextureWithDescriptor:v30];
            v43 = C0_tex[v20];
            C0_tex[v20] = (MTLTexture *)v42;

            if (!C0_tex[v20])
            {
              v44 = _PTLogSystem();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                int v139 = v20;
                _os_log_error_impl(&dword_1D0778000, v44, OS_LOG_TYPE_ERROR, "_C0_tex[%i] is nil", buf, 8u);
              }

              int v21 = -1;
            }
            [v30 setWidth:v130];
            [v30 setHeight:v132];
            v45 = [(PTMetalContext *)self->_metalContext device];
            uint64_t v46 = [v45 newTextureWithDescriptor:v30];
            v47 = C1_tex[v20];
            C1_tex[v20] = (MTLTexture *)v46;

            if (!C1_tex[v20])
            {
              v48 = _PTLogSystem();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                int v139 = v20;
                _os_log_error_impl(&dword_1D0778000, v48, OS_LOG_TYPE_ERROR, "_C1_tex[%i] is nil", buf, 8u);
              }

              int v21 = -1;
            }
            if (C0_tex[v20]) {
              objc_msgSend(v137, "addObject:");
            }
            if (C1_tex[v20]) {
              objc_msgSend(v137, "addObject:");
            }
            [v30 setWidth:v134];
            [v30 setHeight:v135];
            [v30 setPixelFormat:25];
            v49 = [(PTMetalContext *)self->_metalContext device];
            uint64_t v50 = [v49 newTextureWithDescriptor:v30];
            v51 = w_tex[v20];
            w_tex[v20] = (MTLTexture *)v50;

            if (w_tex[v20])
            {
              objc_msgSend(v137, "addObject:");
            }
            else
            {
              v52 = _PTLogSystem();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                int v139 = v20;
                _os_log_error_impl(&dword_1D0778000, v52, OS_LOG_TYPE_ERROR, "_w_tex[%i] is nil", buf, 8u);
              }

              int v21 = -1;
            }
            [v30 setPixelFormat:65];
            [v30 setWidth:v134];
            [v30 setHeight:v135];
            [v30 setUsage:19];
            uint64_t v53 = 0;
            char v54 = 1;
            do
            {
              char v55 = v54;
              v56 = [(PTMetalContext *)self->_metalContext device];
              uint64_t v57 = [v56 newTextureWithDescriptor:v30];
              v58 = (id *)&self->_uv_fwd_tex[v53][v20];
              id v59 = *v58;
              id *v58 = (id)v57;

              if (!*v58)
              {
                v60 = _PTLogSystem();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109376;
                  int v139 = v53;
                  __int16 v140 = 1024;
                  int v141 = v20;
                  _os_log_error_impl(&dword_1D0778000, v60, OS_LOG_TYPE_ERROR, "_uv_fwd_tex[%i][%i] is nil", buf, 0xEu);
                }

                int v21 = -1;
              }
              v61 = [(PTMetalContext *)self->_metalContext device];
              uint64_t v62 = [v61 newTextureWithDescriptor:v30];
              v63 = (id *)&self->_uv_bwd_tex[v53][v20];
              id v64 = *v63;
              id *v63 = (id)v62;

              if (!*v63)
              {
                v65 = _PTLogSystem();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109376;
                  int v139 = v53;
                  __int16 v140 = 1024;
                  int v141 = v20;
                  _os_log_error_impl(&dword_1D0778000, v65, OS_LOG_TYPE_ERROR, "_uv_bwd_tex[%i][%i] is nil", buf, 0xEu);
                }

                int v21 = -1;
              }
              uint64_t v66 = [*v58 newTextureViewWithPixelFormat:53];
              v67 = self->_uv_fwd_u32_alias_tex[v53];
              v68 = v67[v20];
              v67[v20] = (MTLTexture *)v66;

              uint64_t v69 = [*v63 newTextureViewWithPixelFormat:53];
              v70 = self->_uv_bwd_u32_alias_tex[v53];
              v71 = v70[v20];
              v70[v20] = (MTLTexture *)v69;

              if (v20 && *v58 && *v63)
              {
                objc_msgSend(v137, "addObject:");
                [v137 addObject:*v63];
              }
              char v54 = 0;
              uint64_t v53 = 1;
            }
            while ((v55 & 1) != 0);
            v72 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:(int)v134 height:(int)v135 mipmapped:0];
            [v72 setUsage:19];
            v73 = [(PTMetalContext *)self->_metalContext device];
            if ([v73 supportsFamily:1007]) {
              uint64_t v74 = 0;
            }
            else {
              uint64_t v74 = 32;
            }
            [v72 setResourceOptions:v74];

            v75 = [(PTMetalContext *)self->_metalContext device];
            uint64_t v76 = [v75 newTextureWithDescriptor:v72];
            v77 = (*I_tex)[v20];
            (*I_tex)[v20] = (MTLTexture *)v76;

            uint64_t v78 = [(MTLTexture *)(*I_tex)[v20] newTextureViewWithPixelFormat:53];
            v79 = (*I_u32_alias_tex)[v20];
            (*I_u32_alias_tex)[v20] = (MTLTexture *)v78;

            int v80 = v134 & 1;
            if ((int)v134 < 0) {
              int v80 = -v80;
            }
            int v81 = v135 & 1;
            if ((int)v135 < 0) {
              int v81 = -v81;
            }
            int v82 = v80 + v134;
            if (v82 >= 0) {
              int v83 = v82;
            }
            else {
              int v83 = v82 + 1;
            }
            int v84 = v83 >> 1;
            if (v84 >= 0) {
              int v85 = v84 & 1;
            }
            else {
              int v85 = -(v84 & 1);
            }
            int v86 = v81 + v135;
            if (v86 >= 0) {
              int v87 = v86;
            }
            else {
              int v87 = v86 + 1;
            }
            int v88 = v87 >> 1;
            if (v88 >= 0) {
              int v89 = v88 & 1;
            }
            else {
              int v89 = -(v88 & 1);
            }
            int v90 = v82 + 2 * v85;
            if (v90 + 1 >= 0) {
              int v91 = v90 + 1;
            }
            else {
              int v91 = v90 + 2;
            }
            int v92 = v91 >> 1;
            int v93 = v86 + 2 * v89;
            if (v93 + 1 >= 0) {
              int v94 = v93 + 1;
            }
            else {
              int v94 = v93 + 2;
            }
            v95.i32[0] = v92;
            v95.i32[1] = v94 >> 1;
            int32x2_t v136 = v95;

            v96 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:(int)v130 height:(int)v132 mipmapped:0];
            [v96 setUsage:19];
            v97 = [(PTMetalContext *)self->_metalContext device];
            if ([v97 supportsFamily:1007]) {
              uint64_t v98 = 0;
            }
            else {
              uint64_t v98 = 32;
            }
            [v96 setResourceOptions:v98];

            v99 = [(PTMetalContext *)self->_metalContext device];
            uint64_t v100 = [v99 newTextureWithDescriptor:v96];
            v101 = v125[v20];
            v125[v20] = (MTLTexture *)v100;

            uint64_t v102 = [(MTLTexture *)v125[v20] newTextureViewWithPixelFormat:53];
            v103 = v124[v20];
            v124[v20] = (MTLTexture *)v102;

            int v104 = v130 & 1;
            if ((int)v130 < 0) {
              int v104 = -v104;
            }
            int v105 = v132 & 1;
            if ((int)v132 < 0) {
              int v105 = -v105;
            }
            int v106 = v104 + v130;
            if (v106 >= 0) {
              int v107 = v106;
            }
            else {
              int v107 = v106 + 1;
            }
            int v108 = v107 >> 1;
            if (v108 >= 0) {
              int v109 = v108 & 1;
            }
            else {
              int v109 = -(v108 & 1);
            }
            int v110 = v105 + v132;
            if (v110 >= 0) {
              int v111 = v110;
            }
            else {
              int v111 = v110 + 1;
            }
            int v112 = v111 >> 1;
            if (v112 >= 0) {
              int v113 = v112 & 1;
            }
            else {
              int v113 = -(v112 & 1);
            }
            int v114 = v106 + 2 * v109;
            if (v114 + 1 >= 0) {
              int v115 = v114 + 1;
            }
            else {
              int v115 = v114 + 2;
            }
            int v116 = v115 >> 1;
            int v117 = v110 + 2 * v113;
            if (v117 + 1 >= 0) {
              int v118 = v117 + 1;
            }
            else {
              int v118 = v117 + 2;
            }
            v119.i32[0] = v116;
            v119.i32[1] = v118 >> 1;
            int32x2_t v133 = v119;

            int32x2_t v27 = v136;
            int32x2_t v24 = v133;
            unint64_t v28 = 0x1E4F35000;
            ++v20;
            G1_tex = self->_G1_tex;
            G0_tex = self->_G0_tex;
            C0_tex = self->_C0_tex;
          }
          while (v20 < self->_nscales);
        }
        v121 = [(LKTFlowGPU *)self newBufferWithPixelFormat:115 width:0x8000 data:0];
        kpt_buf = self->_kpt_buf;
        self->_kpt_buf = v121;
      }
      else
      {
        kpt_buf = _PTLogSystem();
        if (os_log_type_enabled(kpt_buf, OS_LOG_TYPE_ERROR)) {
          -[LKTFlowGPU _setupBuffer]();
        }
        int v21 = -3;
      }
      goto LABEL_117;
    }
  }
  kpt_buf = _PTLogSystem();
  if (os_log_type_enabled(kpt_buf, OS_LOG_TYPE_ERROR)) {
    -[LKTFlowGPU _setupBuffer]();
  }
  int v21 = -1;
LABEL_117:

  return v21;
}

- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5
{
  int v8 = 1;
  switch(a3)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      goto LABEL_8;
    case 0xBuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
      goto LABEL_15;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x2BuLL:
      int v8 = 2;
      goto LABEL_8;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
      goto LABEL_7;
    default:
      char v9 = a3 - 90;
      if (a3 - 90 > 0x23) {
        goto LABEL_14;
      }
      if (((1 << v9) & 0x3D0E000) != 0)
      {
        int v8 = 8;
      }
      else if (((1 << v9) & 0xF) != 0)
      {
LABEL_7:
        int v8 = 4;
      }
      else if (((1 << v9) & 0xE00000000) != 0)
      {
        int v8 = 16;
      }
      else
      {
LABEL_14:
        if (a3 != 1)
        {
LABEL_15:
          int v16 = _PTLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[LKTFlowGPU newBufferWithPixelFormat:width:data:]();
          }

          int v8 = 0;
        }
      }
LABEL_8:
      uint64_t v10 = v8 * (uint64_t)a4;
      int v11 = [(PTMetalContext *)self->_metalContext device];
      uint64_t v12 = v11;
      if (a5) {
        uint64_t v13 = [v11 newBufferWithBytes:a5 length:v10 options:0];
      }
      else {
        uint64_t v13 = [v11 newBufferWithLength:v10 options:0];
      }
      int v14 = (void *)v13;

      return v14;
  }
}

- (int)_setupPipelines
{
  uint64_t v3 = 0;
  int v4 = 0;
  *(void *)&v13[5] = *MEMORY[0x1E4F143B8];
  computePipelines = self->_computePipelines;
  do
  {
    int v6 = (void *)[[NSString alloc] initWithUTF8String:kKernelNames[v3]];
    int v7 = [(PTMetalContext *)self->_metalContext computePipelineStateFor:v6 withConstants:0];
    if (!v7)
    {
      int v8 = _PTLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(LKTFlowGPU *)v12 _setupPipelines];
      }

      int v4 = -1;
    }
    objc_storeStrong((id *)&computePipelines[v3], v7);
    unint64_t v9 = [v7 threadExecutionWidth];
    unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v9 > maxThreadExecutionWidth) {
      unint64_t maxThreadExecutionWidth = [v7 threadExecutionWidth];
    }
    self->_unint64_t maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v3;
  }
  while (v3 != 12);
  return v4;
}

- (BOOL)isBidirectional
{
  return self->_uv_bwd_tex_user_ref != 0;
}

- (MTLBuffer)keypoints
{
  return self->_kpt_buf;
}

- (int)estimateFlowFromTexReference:(id)a3 target:(id)a4 commandBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isValid && !self->_streamFrameCount)
  {
    [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v10 uv_tex:self->_w_tex[self->_nscales + 9]];
    if ([(LKTFlowGPU *)self isBidirectional]) {
      [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v10 uv_tex:self->_uv_fwd_tex[1][self->_nscales + 9]];
    }
    [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v10 in_tex:v8 I_idx:0];
    [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v10 in_tex:v9 I_idx:1];
    *(void *)&self->_current_frame_index = 0;
    if ([(LKTFlowGPU *)self isBidirectional]) {
      [(LKTFlowGPU *)self _computeOpticalFlowBidirectional:v10];
    }
    else {
      [(LKTFlowGPU *)self _computeOpticalFlow:v10 computeFeatureI0:1 computeFeatureI1:1];
    }
    int v11 = 0;
  }
  else
  {
    int v11 = -12782;
  }

  return v11;
}

- (int)estimateFlowStreamTex:(id)a3 index:(int)a4 doOpticalFlow:(BOOL)a5 commandBuffer:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if (self->_isValid)
  {
    [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v11 in_tex:v10 I_idx:self->_isInverse ^ a4];
    *(void *)&self->_current_frame_index = a4 ^ 1u;
    if (v7)
    {
      [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v11 uv_tex:self->_w_tex[self->_nscales + 9]];
      if ([(LKTFlowGPU *)self isBidirectional])
      {
        [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v11 uv_tex:self->_uv_fwd_tex[1][self->_nscales + 9]];
        [(LKTFlowGPU *)self _computeOpticalFlowBidirectional:v11];
      }
      else
      {
        [(LKTFlowGPU *)self _computeOpticalFlow:v11 computeFeatureI0:1 computeFeatureI1:1];
      }
      int v7 = 0;
    }
    else
    {
      self->_indexUpdated[a4] = 0;
    }
  }
  else
  {
    int v7 = -12782;
  }

  return v7;
}

- (int)estimateFlowStreamTex:(id)a3 commandBuffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isValid)
  {
    unsigned int v8 = self->_streamFrameCount & 1;
    if (self->_streamFrameCount >= 0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = -v8;
    }
    [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v7 in_tex:v6 I_idx:v9];
    int streamFrameCount = self->_streamFrameCount;
    self->_int streamFrameCount = streamFrameCount + 1;
    int v11 = (streamFrameCount + 1) & 1;
    if (streamFrameCount < -1) {
      int v11 = -v11;
    }
    self->_current_frame_index = v11;
    if (streamFrameCount >= 1)
    {
      [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v7 uv_tex:self->_w_tex[self->_nscales + 9]];
      if ([(LKTFlowGPU *)self isBidirectional])
      {
        [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v7 uv_tex:self->_uv_fwd_tex[1][self->_nscales + 9]];
        [(LKTFlowGPU *)self _computeOpticalFlowBidirectional:v7];
      }
      else
      {
        [(LKTFlowGPU *)self _computeOpticalFlow:v7 computeFeatureI0:1 computeFeatureI1:1];
      }
    }
    int v12 = 0;
  }
  else
  {
    int v12 = -12782;
  }

  return v12;
}

- (int)computeKeypointsFromTexForwardFlow:(id)a3 backwardFlow:(id)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7 commandBuffer:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  [v14 setLabel:@"LKT::KeypointsFromFlow"];
  *(float *)&double v17 = a5;
  [(LKTFlowGPU *)self _enqueueKeypointsFromFlowWithCommandBuffer:v14 in_uv_fwd_tex:v16 in_uv_bwd_tex:v15 out_kpt_buf:self->_kpt_buf block_size:v9 bidirectional_error:a7 out_num_keypoints:v17];

  return 0;
}

- (int)_computeOpticalFlow:(id)a3 computeFeatureI0:(BOOL)a4 computeFeatureI1:(BOOL)a5
{
  BOOL v23 = a4;
  BOOL v24 = a5;
  id v31 = a3;
  int nscales = self->_nscales;
  uint64_t v7 = (nscales - 1);
  if (nscales >= 1)
  {
    uint64_t v8 = 0;
    I_tex = self->_I_tex;
    G0_tex = self->_G0_tex;
    G1_tex = self->_G1_tex;
    C0_tex = self->_C0_tex;
    uv_fwd_tex = self->_uv_fwd_tex;
    C1_tex = self->_C1_tex;
    int v10 = nscales - 1;
    do
    {
      int v11 = I_tex[self->_current_frame_index][v7];
      int64x2_t v26 = I_tex[self->_current_frame_index ^ 1][v7];
      if (v23)
      {
        [(LKTFlowGPU *)self _computeFeaturesWithCommandBuffer:v31 in_tex:v11 out_tex:G0_tex[v7]];
        [(LKTFlowGPU *)self _computeFeaturesDerivativesWithCommandBuffer:v31 in_tex:G0_tex[v7] out_tex:C0_tex[v7]];
      }
      if (v24)
      {
        [(LKTFlowGPU *)self _computeFeaturesWithCommandBuffer:v31 in_tex:v26 out_tex:G1_tex[v7]];
        [(LKTFlowGPU *)self _computeFeaturesDerivativesWithCommandBuffer:v31 in_tex:G1_tex[v7] out_tex:C1_tex[v7]];
      }
      int nwarpings = self->_nwarpings;
      if (nwarpings < 1)
      {
        id v14 = 0;
      }
      else
      {
        id v25 = v11;
        int v13 = 0;
        id v14 = 0;
        do
        {
          int v15 = v13 + 1;
          if (v7
            || v15 != nwarpings
            || (p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref, self->_useNonLocalRegularization))
          {
            p_uv_fwd_tex_user_ref = &uv_fwd_tex[v8 ^ 1][v7];
          }
          double v17 = *p_uv_fwd_tex_user_ref;
          if (self->_useNonLocalRegularization && v15 == self->_nwarpings)
          {
            int v18 = self->_w_tex[v7];

            id v14 = v18;
          }
          [(LKTFlowGPU *)self _doSolverWithCommandBuffer:v31 scale:v7 in_uv_tex:uv_fwd_tex[v8][v10] in_G0_tex:G0_tex[v7] in_G1_tex:G1_tex[v7] in_C0_tex:C0_tex[v7] in_C1_tex:C1_tex[v7] out_uv_tex:v17 out_w_tex:v14];
          v8 ^= 1uLL;

          int nwarpings = self->_nwarpings;
          ++v13;
          int v10 = v7;
        }
        while (v13 < nwarpings);
        int v10 = v7;
        int v11 = v25;
      }
      if (self->_useNonLocalRegularization)
      {
        int v19 = &uv_fwd_tex[v8 ^ 1][v7];
        if (!v7) {
          int v19 = &self->_uv_fwd_tex_user_ref;
        }
        [(LKTFlowGPU *)self _doNLRegularizationWithCommandBuffer:v31 in_uv_tex:self->_uv_fwd_u32_alias_tex[v8][v7] join_tex:self->_I_u32_alias_tex[self->_current_frame_index][v7] w_tex:v14 out_uv_tex:*v19];
        v8 ^= 1uLL;
      }
    }
    while (v7-- > 0);
  }

  return 0;
}

- (int)_computeOpticalFlowBidirectional:(id)a3
{
  id v40 = a3;
  uint64_t v4 = self->_nscales - 1;
  uv_fwd_tex = self->_uv_fwd_tex;
  uint64_t v5 = self->_uv_fwd_tex[0][v4];
  uv_bwd_tex = self->_uv_bwd_tex;
  id v6 = self->_uv_bwd_tex[0][v4];
  uint64_t nscales = self->_nscales;
  if ((int)nscales >= 1)
  {
    uint64_t v8 = 0;
    I_tex = self->_I_tex;
    G1_tex = self->_G1_tex;
    G0_tex = self->_G0_tex;
    C1_tex = self->_C1_tex;
    C0_tex = self->_C0_tex;
    int v34 = v4;
    int v33 = v4;
    do
    {
      int v9 = nscales - 1;
      int v10 = I_tex[self->_current_frame_index][(nscales - 1)];
      int v11 = I_tex[self->_current_frame_index ^ 1][(nscales - 1)];
      int64x2_t v29 = v10;
      [(LKTFlowGPU *)self _computeFeaturesWithCommandBuffer:v40 in_tex:v10 out_tex:G0_tex[(nscales - 1)]];
      unint64_t v28 = v11;
      [(LKTFlowGPU *)self _computeFeaturesWithCommandBuffer:v40 in_tex:v11 out_tex:G1_tex[(nscales - 1)]];
      [(LKTFlowGPU *)self _computeFeaturesDerivativesWithCommandBuffer:v40 in_tex:G0_tex[v9] out_tex:C0_tex[v9]];
      [(LKTFlowGPU *)self _computeFeaturesDerivativesWithCommandBuffer:v40 in_tex:G1_tex[v9] out_tex:C1_tex[v9]];
      uint64_t v30 = nscales;
      if (self->_nwarpings >= 1)
      {
        int v12 = 0;
        uint64_t v35 = (nscales - 1);
        do
        {
          if ((v12 + 1))
          {
            v45 = G0_tex[v35];
            v44 = G1_tex[v35];
            v43 = C0_tex[v35];
            v41 = C1_tex[v35];
            int v21 = uv_fwd_tex[v8];
            int v13 = v21[v34];
            uint64_t v47 = v8 ^ 1;
            id v14 = uv_fwd_tex[v8 ^ 1][v35];
            uint64_t v15 = nscales - 1;
            BOOL v22 = nscales != 1 || v12 + 3 <= self->_nwarpings;
            p_uv_fwd_tex_user_ref = &v21[v35];
            if (!v22) {
              p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref;
            }
            BOOL v24 = *p_uv_fwd_tex_user_ref;
            id v25 = v6;
            uint64_t v20 = v24;

            uint64_t v46 = v20;
            int v34 = nscales - 1;
            uint64_t v42 = v25;
            int v19 = v25;
          }
          else
          {
            v45 = G1_tex[v35];
            v44 = G0_tex[v35];
            v43 = C1_tex[v35];
            v41 = C0_tex[v35];
            int v13 = (*uv_bwd_tex)[v33];
            id v14 = self->_uv_bwd_tex[1][v35];
            uint64_t v15 = nscales - 1;
            BOOL v16 = nscales != 1 || v12 + 3 <= self->_nwarpings;
            p_uv_bwd_tex_user_ref = &self->_uv_bwd_tex_user_ref;
            if (v16) {
              p_uv_bwd_tex_user_ref = &(*uv_bwd_tex)[(nscales - 1)];
            }
            int v18 = *p_uv_bwd_tex_user_ref;
            int v19 = v5;
            uint64_t v20 = v18;

            uint64_t v47 = v8 ^ 1;
            uint64_t v42 = v20;
            int v33 = nscales - 1;
            uint64_t v46 = v19;
          }
          [(LKTFlowGPU *)self _enqueueFlowConsistencyWithCommandBuffer:v40 in_uv0_tex:v19 in_uv1_tex:v13 out_uv_tex:v14];
          [(LKTFlowGPU *)self _doSolverWithCommandBuffer:v40 scale:v15 in_uv_tex:v14 in_G0_tex:v45 in_G1_tex:v44 in_C0_tex:v43 in_C1_tex:v41 out_uv_tex:v20 out_w_tex:0];

          ++v12;
          uint64_t v5 = v46;
          uint64_t v8 = v47;
          id v6 = v42;
        }
        while (v12 < self->_nwarpings);
      }

      --nscales;
    }
    while (v30 > 1);
  }

  return 0;
}

- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4 I_idx:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL needConversionBGRA2YUVA = self->_needConversionBGRA2YUVA;
  int v11 = [v8 computeCommandEncoder];
  int v12 = v11;
  int v13 = (id *)self->_I_tex[a5];
  if (needConversionBGRA2YUVA)
  {
    [v11 setComputePipelineState:self->_computePipelines[0]];
    [v12 setTexture:v9 atIndex:0];
    [v12 setTexture:*v13 atIndex:1];
    v27[0] = (int)[v9 width];
    v27[1] = (int)[v9 height];
    v27[2] = 1;
    long long v25 = xmmword_1D081F8F0;
    uint64_t v26 = 1;
    id v14 = v27;
  }
  else
  {
    [v11 setComputePipelineState:self->_computePipelines[11]];
    [v12 setTexture:v9 atIndex:0];
    [v12 setTexture:*v13 atIndex:1];
    uint64_t v15 = (int)[*v13 width];
    int v16 = [*v13 height];
    v24[0] = v15;
    v24[1] = v16;
    v24[2] = 1;
    long long v25 = xmmword_1D081F8F0;
    uint64_t v26 = 1;
    id v14 = v24;
  }
  [v12 dispatchThreads:v14 threadsPerThreadgroup:&v25];
  [v12 endEncoding];

  if (self->_nscales >= 2)
  {
    uint64_t v17 = 0;
    int v18 = (char *)self + 80 * a5;
    do
    {
      int v19 = &v18[8 * v17];
      uint64_t v20 = *((void *)v19 + 56);
      id v21 = *((id *)v19 + 55);
      [(LKTFlowGPU *)self _downscale2XWithCommandBuffer:v8 in_tex:v21 out_tex:v20];

      uint64_t v22 = v17 + 2;
      ++v17;
    }
    while (v22 < self->_nscales);
  }

  return 0;
}

- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 computeCommandEncoder];
  [v7 setComputePipelineState:self->_computePipelines[1]];
  [v7 setTexture:v6 atIndex:0];
  uint64_t v8 = (int)[v6 width];
  LODWORD(self) = [v6 height];

  v12[0] = v8;
  v12[1] = (int)self;
  v12[2] = 1;
  long long v10 = xmmword_1D081F8F0;
  uint64_t v11 = 1;
  [v7 dispatchThreads:v12 threadsPerThreadgroup:&v10];
  [v7 endEncoding];

  return 0;
}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  long long v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[2]];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  uint64_t v11 = (int)[v8 width];
  LODWORD(a3) = [v8 height];

  v15[0] = v11;
  v15[1] = (int)a3;
  v15[2] = 1;
  long long v13 = xmmword_1D081F8F0;
  uint64_t v14 = 1;
  [v10 dispatchThreads:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];

  return 0;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  long long v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[3]];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  uint64_t v11 = (int)[v9 width];
  LODWORD(a3) = [v9 height];

  v15[0] = v11;
  v15[1] = (int)a3;
  v15[2] = 1;
  long long v13 = xmmword_1D081F8F0;
  uint64_t v14 = 1;
  [v10 dispatchThreads:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];

  return 0;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  long long v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[4]];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  uint64_t v11 = (int)[v9 width];
  LODWORD(a3) = [v9 height];

  v15[0] = v11;
  v15[1] = (int)a3;
  v15[2] = 1;
  long long v13 = xmmword_1D081F8F0;
  uint64_t v14 = 1;
  [v10 dispatchThreads:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];

  return 0;
}

- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11
{
  id v35 = a11;
  id v17 = a10;
  id v36 = a9;
  id v34 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  LODWORD(a5) = [v17 width];
  LODWORD(a3) = [v17 height];
  unsigned int v22 = ((int)a5 + LODWORD(self->_maxThreadExecutionWidth) - 1)
      / SLODWORD(self->_maxThreadExecutionWidth)
      * LODWORD(self->_maxThreadExecutionWidth);
  v49[0] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v48 = _D0;
  +[LKTFlowGPU _computeScalingFactor:v20 dst_tex:v17 scale_xy_inv:&v48 coeff:v49];
  v42[0] = a5;
  v42[1] = a3;
  uint64_t v43 = v22;
  uint64_t v44 = v48;
  uint64_t v45 = 0;
  unint64_t v28 = (const float *)v49;
  float32x2_t v29 = vld1_dup_f32(v28);
  float32x2_t v46 = v29;
  uint64_t v47 = 0;
  uint64_t v30 = [v21 computeCommandEncoder];
  [v30 setComputePipelineState:self->_computePipelines[5]];
  [v30 setTexture:v20 atIndex:0];
  [v30 setTexture:v19 atIndex:1];

  [v30 setTexture:v18 atIndex:2];
  [v30 setTexture:v34 atIndex:3];

  [v30 setTexture:v36 atIndex:4];
  [v30 setBuffer:self->_Adiagb_buf[0] offset:0 atIndex:0];
  [v30 setBuffer:self->_Ixy_buf[0] offset:0 atIndex:1];
  [v30 setBuffer:self->_idt_buf offset:0 atIndex:2];
  [v30 setBytes:v42 length:48 atIndex:3];
  v41[0] = (int)a5;
  v41[1] = (int)a3;
  v41[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v30 dispatchThreads:v41 threadsPerThreadgroup:&v39];
  [v30 endEncoding];

  id v31 = [v21 computeCommandEncoder];
  [v31 setComputePipelineState:self->_computePipelines[6]];
  [v31 setBuffer:self->_Adiagb_buf[0] offset:0 atIndex:0];
  [v31 setBuffer:self->_Ixy_buf[0] offset:0 atIndex:1];
  [v31 setBuffer:self->_Adiagb_buf[1] offset:0 atIndex:2];
  [v31 setBuffer:self->_Ixy_buf[1] offset:0 atIndex:3];
  [v31 setBytes:v42 length:48 atIndex:4];
  v38[0] = (int)a5;
  v38[1] = (int)a3;
  v38[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v31 dispatchThreads:v38 threadsPerThreadgroup:&v39];
  [v31 endEncoding];

  uint64_t v32 = [v21 computeCommandEncoder];

  [v32 setComputePipelineState:self->_computePipelines[7]];
  [v32 setBuffer:self->_Adiagb_buf[1] offset:0 atIndex:0];
  [v32 setBuffer:self->_Ixy_buf[1] offset:0 atIndex:1];
  [v32 setBuffer:self->_idt_buf offset:0 atIndex:2];
  [v32 setTexture:v20 atIndex:0];

  [v32 setTexture:v17 atIndex:1];
  [v32 setTexture:v35 atIndex:2];

  [v32 setBytes:v42 length:48 atIndex:3];
  v37[0] = (int)a5;
  v37[1] = (int)a3;
  v37[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v32 dispatchThreads:v37 threadsPerThreadgroup:&v39];
  [v32 endEncoding];

  return 0;
}

- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  LODWORD(a4) = [v10 width];
  int v14 = [v10 height];
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v37 = _D0;
  uint64_t v38 = _D0;
  int v36 = 1065353216;
  int v35 = 1065353216;
  +[LKTFlowGPU _computeScalingFactor:v12 dst_tex:v10 scale_xy_inv:&v38 coeff:&v36];
  +[LKTFlowGPU _computeScalingFactor:v11 dst_tex:v10 scale_xy_inv:&v37 coeff:&v35];
  uint64_t v30 = 0;
  v29[0] = a4;
  v29[1] = v14;
  uint64_t v31 = v38;
  uint64_t v32 = v37;
  id v20 = (const float *)&v36;
  float32x2_t v21 = vld1_dup_f32(v20);
  float32x2_t v22 = vld1_dup_f32((const float *)&v35);
  float32x2_t v33 = v21;
  float32x2_t v34 = v22;
  BOOL v23 = [v13 computeCommandEncoder];

  [v23 setComputePipelineState:self->_computePipelines[8]];
  [v23 setTexture:v12 atIndex:0];

  [v23 setTexture:v11 atIndex:1];
  [v23 setTexture:v10 atIndex:2];
  [v23 setBytes:v29 length:48 atIndex:0];
  uint64_t v24 = (int)[v10 width];
  LODWORD(v11) = [v10 height];

  v28[0] = v24;
  v28[1] = (int)v11;
  v28[2] = 1;
  long long v26 = xmmword_1D081F8F0;
  uint64_t v27 = 1;
  [v23 dispatchThreads:v28 threadsPerThreadgroup:&v26];
  [v23 endEncoding];

  return 0;
}

- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9
{
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  int v20 = (int)[v18 width] / a7;
  int v21 = (int)[v18 height] / a7;
  int v27 = a7;
  __int16 v29 = v21;
  __int16 v28 = v20;
  uint64_t v30 = LODWORD(a8);
  float32x2_t v22 = [v19 computeCommandEncoder];

  [v22 setComputePipelineState:self->_computePipelines[9]];
  [v22 setTexture:v18 atIndex:0];

  [v22 setTexture:v17 atIndex:1];
  [v22 setBuffer:v16 offset:0 atIndex:0];

  [v22 setBytes:&v27 length:16 atIndex:1];
  v26[0] = v20;
  v26[1] = v21;
  v26[2] = 1;
  long long v24 = xmmword_1D081F8F0;
  uint64_t v25 = 1;
  [v22 dispatchThreads:v26 threadsPerThreadgroup:&v24];
  [v22 endEncoding];
  *a9 = v21 * v20;

  return 0;
}

- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  v32[1] = 0;
  v32[0] = *(void *)&self->_nlreg_radius;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&long long v17 = vdiv_f32(_D1, vadd_f32(*(float32x2_t *)&self->_nlreg_sigma_l, *(float32x2_t *)&self->_nlreg_sigma_l));
  DWORD2(v17) = DWORD1(v17);
  *((float *)&v17 + 3) = 1.0 / (float)(self->_nlreg_sigma_w + self->_nlreg_sigma_w);
  long long v33 = v17;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  float32x2_t v22 = [a3 computeCommandEncoder];
  [v22 setComputePipelineState:self->_computePipelines[10]];
  [v22 setTexture:v21 atIndex:0];
  [v22 setTexture:v20 atIndex:1];

  [v22 setTexture:v19 atIndex:2];
  [v22 setTexture:v18 atIndex:3];

  [v22 setBytes:v32 length:32 atIndex:0];
  int v23 = [v21 width];
  if (v23 >= 0) {
    int v24 = v23;
  }
  else {
    int v24 = v23 + 1;
  }
  uint64_t v25 = (uint64_t)v24 >> 1;
  int v26 = [v21 height];

  if (v26 >= 0) {
    int v27 = v26;
  }
  else {
    int v27 = v26 + 1;
  }
  v31[0] = v25;
  v31[1] = (uint64_t)v27 >> 1;
  v31[2] = 1;
  long long v29 = xmmword_1D081F8F0;
  uint64_t v30 = 1;
  [v22 dispatchThreads:v31 threadsPerThreadgroup:&v29];
  [v22 endEncoding];

  return 0;
}

+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4
{
  id v6 = v5;
  uint64_t v7 = v4;
  id v25 = a3;
  id v9 = a4;
  float v10 = (float)(unint64_t)[v9 width];
  float v11 = v10 / (float)(unint64_t)[v25 width];
  unint64_t v12 = [v9 height];
  unint64_t v13 = [v25 height];
  LODWORD(v14) = 1.5;
  *(float *)&double v15 = (float)v12 / (float)v13;
  if (v11 <= 1.5 || *(float *)&v15 <= 1.5)
  {
    uint64_t v17 = objc_msgSend(v9, "width", v14, v15);
    if (v17 != [v25 width] || (uint64_t v18 = objc_msgSend(v9, "height"), v18 != objc_msgSend(v25, "height"))) {
      +[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:]();
    }
    __asm { FMOV            V0.2S, #1.0 }
    float v24 = 1.0;
  }
  else
  {
    _D0 = 0x3F0000003F000000;
    float v24 = 2.0;
  }
  float *v6 = v24;
  uint64_t *v7 = _D0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)needConversionBGRA2YUVA
{
  return self->_needConversionBGRA2YUVA;
}

- (CGSize)ref_size
{
  double width = self->_ref_size.width;
  double height = self->_ref_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)aux_size
{
  double width = self->_aux_size.width;
  double height = self->_aux_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)nscales
{
  return self->_nscales;
}

- (int)streamFrameCount
{
  return self->_streamFrameCount;
}

- (int)nwarpings
{
  return self->_nwarpings;
}

- (void)setNwarpings:(int)a3
{
  self->_int nwarpings = a3;
}

- (BOOL)useNonLocalRegularization
{
  return self->_useNonLocalRegularization;
}

- (int)nlreg_radius
{
  return self->_nlreg_radius;
}

- (void)setNlreg_radius:(int)a3
{
  self->_nlreg_radius = a3;
}

- (int)nlreg_padding
{
  return self->_nlreg_padding;
}

- (void)setNlreg_padding:(int)a3
{
  self->_nlreg_padding = a3;
}

- (float)nlreg_sigma_l
{
  return self->_nlreg_sigma_l;
}

- (void)setNlreg_sigma_l:(float)a3
{
  self->_nlreg_sigma_l = a3;
}

- (float)nlreg_sigma_c
{
  return self->_nlreg_sigma_c;
}

- (void)setNlreg_sigma_c:(float)a3
{
  self->_nlreg_sigma_c = a3;
}

- (float)nlreg_sigma_w
{
  return self->_nlreg_sigma_w;
}

- (void)setNlreg_sigma_w:(float)a3
{
  self->_nlreg_sigma_w = a3;
}

- (BOOL)isInverse
{
  return self->_isInverse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kpt_buf, 0);
  objc_storeStrong((id *)&self->_uv_bwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_uv_fwd_tex_user_ref, 0);
  for (uint64_t i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->_uv_bwd_u32_alias_tex[1][i + 9], 0);
  for (uint64_t j = 0; j != -20; --j)
    objc_storeStrong((id *)&self->_uv_fwd_u32_alias_tex[1][j + 9], 0);
  for (uint64_t k = 0; k != -20; --k)
    objc_storeStrong((id *)&self->_uv_bwd_tex[1][k + 9], 0);
  for (uint64_t m = 0; m != -20; --m)
    objc_storeStrong((id *)&self->_uv_fwd_tex[1][m + 9], 0);
  for (uint64_t n = 0; n != -10; --n)
    objc_storeStrong((id *)&self->_w_tex[n + 9], 0);
  objc_storeStrong((id *)&self->_idt_buf, 0);
  for (iuint64_t i = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_Ixy_buf[ii + 1], 0);
  for (juint64_t j = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_Adiagb_buf[jj + 1], 0);
  for (kuint64_t k = 0; kk != -10; --kk)
    objc_storeStrong((id *)&self->_C1_tex[kk + 9], 0);
  for (muint64_t m = 0; mm != -10; --mm)
    objc_storeStrong((id *)&self->_C0_tex[mm + 9], 0);
  for (nuint64_t n = 0; nn != -10; --nn)
    objc_storeStrong((id *)&self->_G1_tex[nn + 9], 0);
  for (uint64_t i1 = 0; i1 != -10; --i1)
    objc_storeStrong((id *)&self->_G0_tex[i1 + 9], 0);
  for (uint64_t i2 = 0; i2 != -20; --i2)
    objc_storeStrong((id *)&self->_I_u32_alias_tex[1][i2 + 9], 0);
  for (uint64_t i3 = 0; i3 != -20; --i3)
    objc_storeStrong((id *)&self->_I_tex[1][i3 + 9], 0);
  for (uint64_t i4 = 104; i4 != 8; i4 -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i4), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:width:height:nscales:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "LKTFlowGPU Init failed", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:width:height:nscales:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Odd image dimensions are not supported", v2, v3, v4, v5, v6);
}

- (void)newBufferWithPixelFormat:width:data:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Unidentified Metal format", v2, v3, v4, v5, v6);
}

- (void)_setupPipelines
{
  *(_DWORD *)buf = 136315138;
  *a2 = "computePipeline";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", buf, 0xCu);
}

- (void)_setupBuffer
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "newBufferWithLength failed", v2, v3, v4, v5, v6);
}

+ (void)_computeScalingFactor:dst_tex:scale_xy_inv:coeff:.cold.1()
{
  __assert_rtn("+[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:]", "LKTFlowGPU.m", 1304, "(dst_tex.width == src_tex.width) && (dst_tex.height == src_tex.height)");
}

@end