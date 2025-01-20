@interface LKTKeypointDetector
+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4;
- (CGSize)aux_size;
- (CGSize)ref_size;
- (LKTKeypointDetector)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6 lastScale:(int)a7;
- (MTLBuffer)keypoints;
- (MTLBuffer)keypoints_confidence;
- (MTLTexture)conf_bwd;
- (MTLTexture)conf_fwd;
- (MTLTexture)uv_bwd;
- (MTLTexture)uv_fwd;
- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeOpticalFlowBidirectional;
- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4 I_idx:(int)a5;
- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11;
- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6;
- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 in_conf_fwd_tex:(id)a6 in_conf_bwd_tex:(id)a7 out_kpt_buf:(id)a8 out_kpt_conf:(id)a9 block_size:(int)a10 bidirectional_error:(float)a11 confidence_radial_weight:(float)a12 confidence_minimum:(float)a13 out_num_keypoints:(unsigned __int16 *)a14;
- (int)_setupBuffer;
- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4;
- (int)computeKeypointsFromForwardFlow:(id)a3 backwardFlow:(id)a4 forwardConfidence:(id)a5 backwardConfidence:(id)a6 bidirectionalError:(float)a7 confidenceRadialWeight:(float)a8 confidenceMinimum:(float)a9 blockSize:(int)a10 outNumKeypoints:(unsigned __int16 *)a11;
- (int)estimateFlowFromReference:(id)a3 target:(id)a4;
- (int)lastScale;
- (int)nscales;
- (int)nwarpings;
- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5 lastScale:(int)a6;
- (void)_setDefaultParameters;
- (void)_setupPipelines;
- (void)dealloc;
- (void)setNwarpings:(int)a3;
- (void)waitUntilCompleted;
@end

@implementation LKTKeypointDetector

- (LKTKeypointDetector)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6 lastScale:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v13 = a3;
  v61.receiver = self;
  v61.super_class = (Class)LKTKeypointDetector;
  v14 = [(LKTKeypointDetector *)&v61 init];
  v20 = v14;
  if (v14)
  {
    if ((v9 | v10))
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v15, @"Invalid parameter", @"Odd image dimensions are not supported", 0, v16, v17, v18, v19);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v60);
    }
    objc_storeStrong((id *)&v14->_mtlContext, a3);
    uint64_t v29 = objc_msgSend_commandQueue(v13, v21, v22, v23, v24, v25, v26, v27, v28);
    commandQueue = v20->_commandQueue;
    v20->_commandQueue = (MTLCommandQueue *)v29;

    objc_msgSend__setDefaultParameters(v20, v31, v32, v33, v34, v35, v36, v37, v38);
    objc_msgSend__initMemory_height_nscales_lastScale_(v20, v39, v10, v9, v8, v7, v40, v41, v42);
    objc_msgSend__setupPipelines(v20, v43, v44, v45, v46, v47, v48, v49, v50);
    objc_msgSend__setupBuffer(v20, v51, v52, v53, v54, v55, v56, v57, v58);
  }

  return v20;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_G0_pxbuf);
  CVPixelBufferRelease(self->_G1_pxbuf);
  CVPixelBufferRelease(self->_C0_pxbuf);
  CVPixelBufferRelease(self->_C1_pxbuf);
  CVPixelBufferRelease(self->_conf_fwd_pxbuf);
  CVPixelBufferRelease(self->_conf_bwd_pxbuf);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_bwd_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[1]);
  CVPixelBufferRelease(self->_uv_bwd_pxbuf[1]);
  v3.receiver = self;
  v3.super_class = (Class)LKTKeypointDetector;
  [(LKTKeypointDetector *)&v3 dealloc];
}

- (void)waitUntilCompleted
{
  objc_msgSend_commandBuffer(self->_commandQueue, a2, v2, v3, v4, v5, v6, v7, v8);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v32, v9, @"LKT:waitUntilCompleted", v10, v11, v12, v13, v14, v15);
  objc_msgSend_commit(v32, v16, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_waitUntilCompleted(v32, v24, v25, v26, v27, v28, v29, v30, v31);
}

- (MTLTexture)uv_fwd
{
  return self->_uv_fwd_tex_user_ref;
}

- (MTLTexture)uv_bwd
{
  return self->_uv_bwd_tex_user_ref;
}

- (MTLTexture)conf_fwd
{
  return self->_conf_fwd_tex_user_ref;
}

- (MTLTexture)conf_bwd
{
  return self->_conf_bwd_tex_user_ref;
}

- (MTLBuffer)keypoints
{
  return self->_kpt_buf;
}

- (MTLBuffer)keypoints_confidence
{
  return self->_kpt_confidence;
}

- (int)estimateFlowFromReference:(id)a3 target:(id)a4
{
  commandQueue = self->_commandQueue;
  id v7 = a4;
  id v8 = a3;
  uint64_t v17 = objc_msgSend_commandBuffer(commandQueue, v9, v10, v11, v12, v13, v14, v15, v16);
  objc_msgSend_setLabel_(v17, v18, @"LKT::Pyramid", v19, v20, v21, v22, v23, v24);
  objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v25, (uint64_t)v17, (uint64_t)self->_uv_bwd_pxbuf[self->_nscales + 1], v26, v27, v28, v29, v30);
  objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v31, (uint64_t)v17, (uint64_t)self->_uv_fwd_tex[1][self->_nscales + 9], v32, v33, v34, v35, v36);
  objc_msgSend__createImagePyramidWithCommandBuffer_in_tex_I_idx_(self, v37, (uint64_t)v17, (uint64_t)v8, 0, v38, v39, v40, v41);

  objc_msgSend__createImagePyramidWithCommandBuffer_in_tex_I_idx_(self, v42, (uint64_t)v17, (uint64_t)v7, 1, v43, v44, v45, v46);
  objc_msgSend_commit(v17, v47, v48, v49, v50, v51, v52, v53, v54);

  objc_msgSend__computeOpticalFlowBidirectional(self, v55, v56, v57, v58, v59, v60, v61, v62);
  return 0;
}

- (int)computeKeypointsFromForwardFlow:(id)a3 backwardFlow:(id)a4 forwardConfidence:(id)a5 backwardConfidence:(id)a6 bidirectionalError:(float)a7 confidenceRadialWeight:(float)a8 confidenceMinimum:(float)a9 blockSize:(int)a10 outNumKeypoints:(unsigned __int16 *)a11
{
  commandQueue = self->_commandQueue;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  uint64_t v33 = objc_msgSend_commandBuffer(commandQueue, v25, v26, v27, v28, v29, v30, v31, v32);
  objc_msgSend_setLabel_(v33, v34, @"LKT::KeypointsFromFlow", v35, v36, v37, v38, v39, v40);
  int v53 = a10;
  *(float *)&double v41 = a8;
  *(float *)&double v42 = a9;
  objc_msgSend__enqueueKeypointsFromFlowWithCommandBuffer_in_uv_fwd_tex_in_uv_bwd_tex_in_conf_fwd_tex_in_conf_bwd_tex_out_kpt_buf_out_kpt_conf_block_size_bidirectional_error_confidence_radial_weight_confidence_minimum_out_num_keypoints_(self, v43, (uint64_t)v33, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)self->_kpt_buf, a7, v41, v42, self->_kpt_confidence, v53, a11);

  objc_msgSend_commit(v33, v44, v45, v46, v47, v48, v49, v50, v51);
  return 0;
}

- (void)_setDefaultParameters
{
  self->_nwarpings = 4;
}

- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5 lastScale:(int)a6
{
  int v7 = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    int v7 = 0;
    int v8 = a4;
    int v9 = a3;
    do
    {
      int v10 = (v9 & 1) + v9;
      if (v10 >= 0) {
        int v11 = v10;
      }
      else {
        int v11 = v10 + 1;
      }
      int v12 = v11 >> 1;
      int v13 = v10 + 1;
      if (v12 >= 0) {
        int v14 = v12 & 1;
      }
      else {
        int v14 = -(v12 & 1);
      }
      int v15 = (v8 & 1) + v8;
      if (v15 >= 0) {
        int v16 = v15;
      }
      else {
        int v16 = v15 + 1;
      }
      int v17 = v16 >> 1;
      int v18 = v15 + 1;
      if (v17 >= 0) {
        int v19 = v17 & 1;
      }
      else {
        int v19 = -(v17 & 1);
      }
      int v20 = v13 + 2 * v14;
      int v9 = v20 >> 1;
      int v21 = v18 + 2 * v19;
      int v8 = v21 >> 1;
      ++v7;
    }
    while (v20 >= 16 && v21 > 15);
  }
  self->_ref_size.width = (double)a3;
  self->_ref_size.height = (double)a4;
  self->_aux_size.width = (double)a3;
  self->_aux_size.height = (double)a4;
  if (a5 >= 0) {
    int v23 = a5;
  }
  else {
    int v23 = v7;
  }
  self->_int nscales = v23;
  self->_lastScale = a6;
  self->_maxThreadExecutionWidth = 0;
  *(_OWORD *)&self->_G0_pxbuf = 0u;
  *(_OWORD *)&self->_C0_pxbuf = 0u;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = 0;

  uv_bwd_tex_user_ref = self->_uv_bwd_tex_user_ref;
  self->_uv_bwd_tex_user_ref = 0;

  conf_fwd_tex_user_ref = self->_conf_fwd_tex_user_ref;
  self->_conf_fwd_tex_user_ref = 0;

  conf_bwd_tex_user_ref = self->_conf_bwd_tex_user_ref;
  self->_conf_bwd_tex_user_ref = 0;

  *(_OWORD *)self->_uv_fwd_pxbuf = 0u;
  *(_OWORD *)self->_uv_bwd_pxbuf = 0u;
  *(_OWORD *)&self->_conf_fwd_pxbuf = 0u;
  int nscales = self->_nscales;
  if (nscales > v7 || nscales >= 10)
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v28, @"Invalid parameter", @"The number of scales specified is too large", 0, v29, v30, v31, 0.0);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
}

- (void)_setupPipelines
{
  uint64_t v3 = 0;
  id v4 = 0;
  do
  {
    uint64_t v5 = v4;
    id v6 = [NSString alloc];
    int v14 = objc_msgSend_initWithUTF8String_(v6, v7, (uint64_t)off_2655BFBC0[v3], v8, v9, v10, v11, v12, v13);
    int v23 = objc_msgSend_library(self->_mtlContext, v15, v16, v17, v18, v19, v20, v21, v22);
    id v75 = (id)objc_msgSend_newFunctionWithName_(v23, v24, (uint64_t)v14, v25, v26, v27, v28, v29, v30);

    uint64_t v39 = objc_msgSend_device(self->_mtlContext, v31, v32, v33, v34, v35, v36, v37, v38);
    uint64_t v46 = objc_msgSend_newComputePipelineStateWithFunction_error_(v39, v40, (uint64_t)v75, 0, v41, v42, v43, v44, v45);

    objc_storeStrong((id *)&self->_computePipelines[v3], v46);
    unint64_t v62 = objc_msgSend_threadExecutionWidth(v46, v47, v48, v49, v50, v51, v52, v53, v54);
    unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v62 > maxThreadExecutionWidth) {
      unint64_t maxThreadExecutionWidth = objc_msgSend_threadExecutionWidth(v46, v55, v56, v57, v58, v59, v60, v61, v63);
    }
    self->_unint64_t maxThreadExecutionWidth = maxThreadExecutionWidth;
    uint64_t v65 = objc_msgSend_threadExecutionWidth(v46, v55, v56, v57, v58, v59, v60, v61, v63);
    uint64_t v74 = objc_msgSend_maxTotalThreadsPerThreadgroup(v46, v66, v67, v68, v69, v70, v71, v72, v73);
    NSLog(&cfstr_Threadexecutio.isa, v14, v65, v74);

    ++v3;
    id v4 = v75;
  }
  while (v3 != 9);
}

- (int)_setupBuffer
{
  size_t width = (unint64_t)self->_ref_size.width;
  CGFloat height = self->_ref_size.height;
  uint64_t v10 = (const char *)height;
  double v11 = self->_aux_size.width;
  double v12 = self->_aux_size.height;
  unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  int v14 = (__CVBuffer *)sub_262EDB644(width, (const char *)height, 0x32433068u, *(float *)&height, v2, v3, v4, v5, v6);
  self->_G0_pxbuf = v14;
  if (v14)
  {
    uint64_t v21 = (__CVBuffer *)sub_262EDB644((unint64_t)v11, (const char *)v12, 0x32433068u, v20, v15, v16, v17, v18, v19);
    self->_G1_pxbuf = v21;
    if (v21)
    {
      uint64_t v28 = (__CVBuffer *)sub_262EDB644(width, v10, 0x52476841u, v27, v22, v23, v24, v25, v26);
      self->_C0_pxbuf = v28;
      if (v28)
      {
        uint64_t v35 = (__CVBuffer *)sub_262EDB644((unint64_t)v11, (const char *)v12, 0x52476841u, v34, v29, v30, v31, v32, v33);
        self->_C1_pxbuf = v35;
        if (v35)
        {
          uint64_t v42 = (__CVBuffer *)sub_262EDB644(width, v10, 0x4C303068u, v41, v36, v37, v38, v39, v40);
          self->_conf_fwd_pxbuf = v42;
          if (v42)
          {
            uint64_t v49 = (__CVBuffer *)sub_262EDB644(width, v10, 0x4C303068u, v48, v43, v44, v45, v46, v47);
            self->_conf_bwd_pxbuf = v49;
            if (v49)
            {
              uint64_t v58 = 0;
              unint64_t v59 = (width + maxThreadExecutionWidth - 1)
                  / maxThreadExecutionWidth
                  * maxThreadExecutionWidth
                  * (void)v10;
              uint64_t v439 = 8 * v59;
              Adiagb_buf = self->_Adiagb_buf;
              unint64_t v434 = v59;
              uint64_t v436 = 2 * v59;
              Ixy_buf = self->_Ixy_buf;
              uv_bwd_pxbuf = self->_uv_bwd_pxbuf;
              char v63 = 1;
              while (1)
              {
                char v64 = v63;
                uint64_t v65 = objc_msgSend_device(self->_mtlContext, v50, v51, v52, v53, v54, v55, v56, v57);
                uint64_t v72 = objc_msgSend_newBufferWithLength_options_(v65, v66, v439, 0, v67, v68, v69, v70, v71);
                float v73 = Adiagb_buf[v58];
                Adiagb_buf[v58] = (MTLBuffer *)v72;

                if (!Adiagb_buf[v58]) {
                  break;
                }
                v82 = objc_msgSend_device(self->_mtlContext, v74, v75, v76, v77, v78, v79, v80, v81);
                uint64_t v89 = objc_msgSend_newBufferWithLength_options_(v82, v83, v436, 0, v84, v85, v86, v87, v88);
                v90 = Ixy_buf[v58];
                Ixy_buf[v58] = (MTLBuffer *)v89;

                if (!Ixy_buf[v58]) {
                  break;
                }
                v97 = (__CVBuffer *)sub_262EDB644(width, v10, 0x32433068u, v96, v91, v92, v93, v94, v95);
                self->_uv_fwd_pxbuf[v58] = v97;
                if (!v97) {
                  break;
                }
                v104 = (__CVBuffer *)sub_262EDB644(width, v10, 0x32433068u, v103, v98, v99, v100, v101, v102);
                uv_bwd_pxbuf[v58] = v104;
                if (!v104) {
                  break;
                }
                char v63 = 0;
                uint64_t v58 = 1;
                if ((v64 & 1) == 0)
                {
                  v105 = objc_msgSend_device(self->_mtlContext, v50, v51, v52, v53, v54, v55, v56, v57);
                  v112 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v105, v106, 4 * v434, 0, v107, v108, v109, v110, v111);
                  idt_buf = self->_idt_buf;
                  self->_idt_buf = v112;

                  if (!self->_idt_buf) {
                    return -12786;
                  }
                  if (self->_nscales < 1)
                  {
LABEL_71:
                    v264 = objc_msgSend_device(self->_mtlContext, v114, v115, v116, v117, v118, v119, v120, *(float *)v121.i32);
                    v271 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v264, v265, 0x40000, 0, v266, v267, v268, v269, v270);
                    kpt_buf = self->_kpt_buf;
                    self->_kpt_buf = v271;

                    v281 = objc_msgSend_device(self->_mtlContext, v273, v274, v275, v276, v277, v278, v279, v280);
                    v288 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v281, v282, 0x40000, 0, v283, v284, v285, v286, v287);
                    kpt_confidence = self->_kpt_confidence;
                    self->_kpt_confidence = v288;

                    v290 = (void *)MEMORY[0x263F12A50];
                    v291 = self->_I_tex[0][self->_lastScale];
                    uint64_t v300 = objc_msgSend_width(v291, v292, v293, v294, v295, v296, v297, v298, v299);
                    uint64_t v309 = objc_msgSend_height(v291, v301, v302, v303, v304, v305, v306, v307, v308);
                    v314 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v290, v310, 65, v300, v309, 0, v311, v312, v313);
                    objc_msgSend_setUsage_(v314, v315, 19, v316, v317, v318, v319, v320, v321);
                    v330 = objc_msgSend_device(self->_mtlContext, v322, v323, v324, v325, v326, v327, v328, v329);
                    v338 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v330, v331, (uint64_t)v314, v332, v333, v334, v335, v336, v337);
                    uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
                    self->_uv_fwd_tex_user_ref = v338;

                    v348 = objc_msgSend_device(self->_mtlContext, v340, v341, v342, v343, v344, v345, v346, v347);
                    v356 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v348, v349, (uint64_t)v314, v350, v351, v352, v353, v354, v355);
                    uv_bwd_tex_user_ref = self->_uv_bwd_tex_user_ref;
                    self->_uv_bwd_tex_user_ref = v356;

                    v358 = (void *)MEMORY[0x263F12A50];
                    uint64_t v367 = objc_msgSend_width(v291, v359, v360, v361, v362, v363, v364, v365, v366);
                    uint64_t v376 = objc_msgSend_height(v291, v368, v369, v370, v371, v372, v373, v374, v375);
                    v381 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v358, v377, 25, v367, v376, 0, v378, v379, v380);
                    objc_msgSend_setUsage_(v381, v382, 19, v383, v384, v385, v386, v387, v388);
                    v397 = objc_msgSend_device(self->_mtlContext, v389, v390, v391, v392, v393, v394, v395, v396);
                    v405 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v397, v398, (uint64_t)v381, v399, v400, v401, v402, v403, v404);
                    conf_fwd_tex_user_ref = self->_conf_fwd_tex_user_ref;
                    self->_conf_fwd_tex_user_ref = v405;

                    v415 = objc_msgSend_device(self->_mtlContext, v407, v408, v409, v410, v411, v412, v413, v414);
                    v423 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v415, v416, (uint64_t)v381, v417, v418, v419, v420, v421, v422);
                    conf_bwd_tex_user_ref = self->_conf_bwd_tex_user_ref;
                    self->_conf_bwd_tex_user_ref = v423;

                    return 0;
                  }
                  uint64_t v122 = 0;
                  int32x2_t v123 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
                  G0_tex = self->_G0_tex;
                  C0_tex = self->_C0_tex;
                  G1_tex = self->_G1_tex;
                  conf_fwd_tex = self->_conf_fwd_tex;
                  C1_tex = self->_C1_tex;
                  conf_bwd_tex = self->_conf_bwd_tex;
                  int32x2_t v121 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
                  v426 = self->_I_tex[1];
                  I_tex = self->_I_tex;
LABEL_16:
                  int v437 = v121.i32[0];
                  double v125 = (double)v121.i32[0];
                  int v440 = v121.i32[1];
                  double v126 = (double)v121.i32[1];
                  int v127 = v123.i32[0];
                  double v128 = (double)v123.i32[0];
                  int v129 = v123.i32[1];
                  double v130 = (double)v123.i32[1];
                  v131 = &self->_ref_pyr_size[v122];
                  v131->size_t width = (double)v121.i32[0];
                  v131->CGFloat height = (double)v121.i32[1];
                  v132 = &self->_aux_pyr_size[v122];
                  v132->size_t width = (double)v123.i32[0];
                  v132->CGFloat height = (double)v123.i32[1];
                  uint64_t v133 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v114, (uint64_t)self->_G0_pxbuf, 65, 23, 0, v119, v120, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v121.i32[0])), (double)v121.i32[1]);
                  v134 = G0_tex[v122];
                  G0_tex[v122] = (MTLTexture *)v133;

                  if (G0_tex[v122])
                  {
                    int v435 = v127;
                    uint64_t v138 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v135, (uint64_t)self->_G1_pxbuf, 65, 23, 0, v136, v137, *(float *)&v128, v130);
                    v139 = G1_tex[v122];
                    G1_tex[v122] = (MTLTexture *)v138;

                    if (G1_tex[v122])
                    {
                      uint64_t v143 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v140, (uint64_t)self->_C0_pxbuf, 115, 23, 0, v141, v142, *(float *)&v125, v126);
                      v144 = C0_tex[v122];
                      C0_tex[v122] = (MTLTexture *)v143;

                      if (G0_tex[v122])
                      {
                        uint64_t v148 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v145, (uint64_t)self->_C1_pxbuf, 115, 23, 0, v146, v147, *(float *)&v128, v130);
                        v149 = C1_tex[v122];
                        C1_tex[v122] = (MTLTexture *)v148;

                        if (C1_tex[v122])
                        {
                          uint64_t v153 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v150, (uint64_t)self->_conf_fwd_pxbuf, 25, 23, 0, v151, v152, *(float *)&v125, v126);
                          v154 = conf_fwd_tex[v122];
                          conf_fwd_tex[v122] = (MTLTexture *)v153;

                          if (conf_fwd_tex[v122])
                          {
                            uint64_t v158 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v155, (uint64_t)self->_conf_bwd_pxbuf, 25, 23, 0, v156, v157, *(float *)&v125, v126);
                            v159 = conf_bwd_tex[v122];
                            conf_bwd_tex[v122] = (MTLTexture *)v158;

                            if (conf_bwd_tex[v122])
                            {
                              int v433 = v129;
                              uint64_t v163 = 0;
                              char v164 = 1;
                              while (1)
                              {
                                char v165 = v164;
                                uint64_t v166 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v160, (uint64_t)self->_uv_fwd_pxbuf[v163], 65, 23, 0, v161, v162, *(float *)&v125, v126);
                                v167 = self->_uv_fwd_tex[v163];
                                v168 = v167[v122];
                                v167[v122] = (MTLTexture *)v166;

                                if (!v167[v122]) {
                                  break;
                                }
                                uint64_t v172 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v169, (uint64_t)uv_bwd_pxbuf[v163], 65, 23, 0, v170, v171, *(float *)&v125, v126);
                                v173 = self->_uv_bwd_tex[v163];
                                v174 = v173[v122];
                                v173[v122] = (MTLTexture *)v172;

                                if (!v173[v122]) {
                                  break;
                                }
                                char v164 = 0;
                                uint64_t v163 = 1;
                                if ((v165 & 1) == 0)
                                {
                                  v176 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v160, 10, v437, v440, 0, v161, v162, v175);
                                  objc_msgSend_setUsage_(v176, v177, 19, v178, v179, v180, v181, v182, v183);
                                  v192 = objc_msgSend_device(self->_mtlContext, v184, v185, v186, v187, v188, v189, v190, v191);
                                  uint64_t v200 = objc_msgSend_newTextureWithDescriptor_(v192, v193, (uint64_t)v176, v194, v195, v196, v197, v198, v199);
                                  v201 = (*I_tex)[v122];
                                  (*I_tex)[v122] = (MTLTexture *)v200;

                                  int v202 = v437 & 1;
                                  if (v437 < 0) {
                                    int v202 = -v202;
                                  }
                                  int v203 = v440 & 1;
                                  if (v440 < 0) {
                                    int v203 = -v203;
                                  }
                                  int v204 = v202 + v437;
                                  if (v204 >= 0) {
                                    int v205 = v204;
                                  }
                                  else {
                                    int v205 = v204 + 1;
                                  }
                                  int v206 = v205 >> 1;
                                  if (v206 >= 0) {
                                    int v207 = v206 & 1;
                                  }
                                  else {
                                    int v207 = -(v206 & 1);
                                  }
                                  int v208 = v203 + v440;
                                  if (v208 >= 0) {
                                    int v209 = v208;
                                  }
                                  else {
                                    int v209 = v208 + 1;
                                  }
                                  int v210 = v209 >> 1;
                                  if (v210 >= 0) {
                                    int v211 = v210 & 1;
                                  }
                                  else {
                                    int v211 = -(v210 & 1);
                                  }
                                  int v212 = v204 + 2 * v207;
                                  if (v212 + 1 >= 0) {
                                    int v213 = v212 + 1;
                                  }
                                  else {
                                    int v213 = v212 + 2;
                                  }
                                  int v214 = v213 >> 1;
                                  int v215 = v208 + 2 * v211;
                                  if (v215 + 1 >= 0) {
                                    int v216 = v215 + 1;
                                  }
                                  else {
                                    int v216 = v215 + 2;
                                  }
                                  v217.i32[0] = v214;
                                  v217.i32[1] = v216 >> 1;
                                  int32x2_t v441 = v217;

                                  v222 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v218, 10, v435, v433, 0, v219, v220, v221);
                                  objc_msgSend_setUsage_(v222, v223, 19, v224, v225, v226, v227, v228, v229);
                                  v238 = objc_msgSend_device(self->_mtlContext, v230, v231, v232, v233, v234, v235, v236, v237);
                                  uint64_t v246 = objc_msgSend_newTextureWithDescriptor_(v238, v239, (uint64_t)v222, v240, v241, v242, v243, v244, v245);
                                  v247 = v426[v122];
                                  v426[v122] = (MTLTexture *)v246;

                                  int v248 = v435 & 1;
                                  if (v435 < 0) {
                                    int v248 = -v248;
                                  }
                                  int v249 = v433 & 1;
                                  if (v433 < 0) {
                                    int v249 = -v249;
                                  }
                                  int v250 = v248 + v435;
                                  if (v250 >= 0) {
                                    int v251 = v250;
                                  }
                                  else {
                                    int v251 = v250 + 1;
                                  }
                                  int v252 = v251 >> 1;
                                  if (v252 >= 0) {
                                    int v253 = v252 & 1;
                                  }
                                  else {
                                    int v253 = -(v252 & 1);
                                  }
                                  int v254 = v249 + v433;
                                  if (v254 >= 0) {
                                    int v255 = v254;
                                  }
                                  else {
                                    int v255 = v254 + 1;
                                  }
                                  int v256 = v255 >> 1;
                                  if (v256 >= 0) {
                                    int v257 = v256 & 1;
                                  }
                                  else {
                                    int v257 = -(v256 & 1);
                                  }
                                  int v258 = v250 + 2 * v253;
                                  if (v258 + 1 >= 0) {
                                    int v259 = v258 + 1;
                                  }
                                  else {
                                    int v259 = v258 + 2;
                                  }
                                  int v260 = v259 >> 1;
                                  int v261 = v254 + 2 * v257;
                                  if (v261 + 1 >= 0) {
                                    int v262 = v261 + 1;
                                  }
                                  else {
                                    int v262 = v261 + 2;
                                  }
                                  v263.i32[0] = v260;
                                  v263.i32[1] = v262 >> 1;
                                  int32x2_t v438 = v263;

                                  int32x2_t v123 = v438;
                                  int32x2_t v121 = v441;
                                  ++v122;
                                  G0_tex = self->_G0_tex;
                                  if (v122 < self->_nscales) {
                                    goto LABEL_16;
                                  }
                                  goto LABEL_71;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  return -12786;
                }
              }
            }
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_computeOpticalFlowBidirectional
{
  uint64_t v2 = self;
  uint64_t v3 = self->_nscales - 1;
  uv_fwd_tex = self->_uv_fwd_tex;
  uint64_t v4 = self->_uv_fwd_tex[0][v3];
  uv_bwd_tex = v2->_uv_bwd_tex;
  uint64_t v5 = v2->_uv_bwd_tex[0][v3];
  if (v2->_uv_bwd_tex_user_ref)
  {
    uint64_t nscales = v2->_nscales;
    if ((int)nscales <= v2->_lastScale)
    {
      int v7 = 0;
      int v90 = 0;
    }
    else
    {
      uint64_t v122 = v5;
      int32x2_t v123 = v4;
      int v7 = 0;
      uint64_t v8 = 0;
      p_uv_bwd_tex_user_ref = (void **)&v2->_uv_bwd_tex_user_ref;
      uint64_t v94 = v2->_I_tex[1];
      I_tex = v2->_I_tex;
      G1_tex = v2->_G1_tex;
      G0_tex = v2->_G0_tex;
      C1_tex = v2->_C1_tex;
      C0_tex = v2->_C0_tex;
      p_conf_fwd_tex_user_ref = &v2->_conf_fwd_tex_user_ref;
      p_uv_fwd_tex_user_ref = (void **)&v2->_uv_fwd_tex_user_ref;
      p_conf_bwd_tex_user_ref = &v2->_conf_bwd_tex_user_ref;
      uint64_t v99 = v2->_uv_bwd_tex[1];
      conf_bwd_tex = v2->_conf_bwd_tex;
      conf_fwd_tex = v2->_conf_fwd_tex;
      int v109 = v3;
      uint64_t v110 = v2;
      int v108 = v3;
      do
      {
        uint64_t v9 = v7;
        uint64_t v10 = nscales - 1;
        double v11 = (*I_tex)[v10];
        double v12 = v94[v10];
        uint64_t v21 = objc_msgSend_commandBuffer(v2->_commandQueue, v13, v14, v15, v16, v17, v18, v19, v20);

        uint64_t v29 = objc_msgSend_stringWithFormat_(NSString, v22, @"LKT:ComputeFlow level %d", v23, v24, v25, v26, v27, v28, v10);
        objc_msgSend_setLabel_(v21, v30, (uint64_t)v29, v31, v32, v33, v34, v35, v36);

        v97 = v11;
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(v2, v37, (uint64_t)v21, (uint64_t)v11, (uint64_t)G0_tex[v10], v38, v39, v40, v41);
        float v96 = v12;
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(v2, v42, (uint64_t)v21, (uint64_t)v12, (uint64_t)G1_tex[v10], v43, v44, v45, v46);
        objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(v2, v47, (uint64_t)v21, (uint64_t)G0_tex[v10], (uint64_t)C0_tex[v10], v48, v49, v50, v51);
        uint64_t v116 = v21;
        objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(v2, v52, (uint64_t)v21, (uint64_t)G1_tex[v10], (uint64_t)C1_tex[v10], v53, v54, v55, v56);
        int nwarpings = v2->_nwarpings;
        uint64_t v115 = v10;
        if (nwarpings >= 1)
        {
          int v66 = 0;
          v105 = (void **)&(*uv_bwd_tex)[v10];
          v106 = (id *)&conf_fwd_tex[v10];
          v104 = (id *)&conf_bwd_tex[v10];
          do
          {
            if (v66 + 3 <= nwarpings)
            {
              BOOL v68 = 0;
              uint64_t v67 = v115;
            }
            else
            {
              uint64_t v67 = v115;
              BOOL v68 = v2->_lastScale == v115;
            }
            int v121 = v66;
            if ((v66 + 1))
            {
              uint64_t v119 = G0_tex[v67];
              uint64_t v118 = G1_tex[v67];
              uint64_t v117 = C0_tex[v67];
              uint64_t v69 = C1_tex[v67];
              v83 = uv_fwd_tex[v8];
              uint64_t v70 = v83[v108];
              uint64_t v120 = v8 ^ 1;
              float v71 = uv_fwd_tex[v8 ^ 1][v67];
              uint64_t v84 = (void **)&v83[v67];
              if (v68) {
                uint64_t v84 = p_uv_fwd_tex_user_ref;
              }
              uint64_t v85 = *v84;
              if (v68) {
                uint64_t v86 = (id *)p_conf_fwd_tex_user_ref;
              }
              else {
                uint64_t v86 = v106;
              }
              id v87 = v85;
              id v76 = *v86;
              uint64_t v77 = v122;
              uint64_t v78 = (MTLTexture *)v87;

              int v108 = v67;
              uint64_t v122 = v77;
              int32x2_t v123 = v78;
            }
            else
            {
              uint64_t v119 = G1_tex[v67];
              uint64_t v118 = G0_tex[v67];
              uint64_t v117 = C1_tex[v67];
              uint64_t v69 = C0_tex[v67];
              uint64_t v70 = (*uv_bwd_tex)[v109];
              float v71 = v99[v67];
              uint64_t v72 = p_uv_bwd_tex_user_ref;
              if (!v68) {
                uint64_t v72 = v105;
              }
              float v73 = *v72;
              if (v68) {
                uint64_t v74 = (id *)p_conf_bwd_tex_user_ref;
              }
              else {
                uint64_t v74 = v104;
              }
              id v75 = v73;
              id v76 = *v74;
              uint64_t v77 = v123;
              uint64_t v78 = (MTLTexture *)v75;

              uint64_t v120 = v8 ^ 1;
              int v109 = v67;
              uint64_t v122 = v78;
              int32x2_t v123 = v77;
            }
            uint64_t v2 = v110;
            objc_msgSend__enqueueFlowConsistencyWithCommandBuffer_in_uv0_tex_in_uv1_tex_out_uv_tex_(v110, v79, (uint64_t)v116, (uint64_t)v77, (uint64_t)v70, (uint64_t)v71, v80, v81, v82);
            objc_msgSend__doSolverWithCommandBuffer_scale_in_uv_tex_in_G0_tex_in_G1_tex_in_C0_tex_in_C1_tex_out_uv_tex_out_w_tex_(v110, v88, (uint64_t)v116, v67, (uint64_t)v71, (uint64_t)v119, (uint64_t)v118, (uint64_t)v117, v89, v69, v78, v76);

            int nwarpings = v110->_nwarpings;
            int v66 = v121 + 1;
            uint64_t v8 = v120;
          }
          while (v121 + 1 < nwarpings);
        }
        int v7 = v116;
        objc_msgSend_commit(v116, v57, v58, v59, v60, v61, v62, v63, v64);

        uint64_t nscales = v115;
      }
      while (v115 > v2->_lastScale);
      int v90 = 0;
      uint64_t v5 = v122;
      uint64_t v4 = v123;
    }
  }
  else
  {
    int v7 = 0;
    int v90 = -12780;
  }

  return v90;
}

- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4 I_idx:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)self->_I_tex[a5], a4);
  if (self->_nscales >= 2)
  {
    uint64_t v10 = 0;
    double v11 = (char *)self + 80 * a5;
    do
    {
      double v12 = &v11[8 * v10];
      uint64_t v13 = *((void *)v12 + 54);
      id v14 = *((id *)v12 + 53);
      objc_msgSend__downscale2XWithCommandBuffer_in_tex_out_tex_(self, v15, (uint64_t)v8, (uint64_t)v14, v13, v16, v17, v18, v19);

      uint64_t v20 = v10 + 2;
      ++v10;
    }
    while (v20 < self->_nscales);
  }

  return 0;
}

- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6 = a4;
  uint64_t v15 = objc_msgSend_computeCommandEncoder(a3, v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v23 = v15;
  if (v15)
  {
    objc_msgSend_setComputePipelineState_(v15, v16, (uint64_t)self->_computePipelines[0], v17, v18, v19, v20, v21, v22);
    objc_msgSend_setTexture_atIndex_(v23, v24, (uint64_t)v6, 0, v25, v26, v27, v28, v29);
    unint64_t v38 = objc_msgSend_threadExecutionWidth(self->_computePipelines[0], v30, v31, v32, v33, v34, v35, v36, v37);
    unint64_t v47 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[0], v39, v40, v41, v42, v43, v44, v45, v46)
        / v38;
    v81[0] = (int)objc_msgSend_width(v6, v48, v49, v50, v51, v52, v53, v54, v55);
    v81[1] = (int)objc_msgSend_height(v6, v56, v57, v58, v59, v60, v61, v62, v63);
    v81[2] = 1;
    v80[0] = v38;
    v80[1] = v47;
    v80[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v23, v64, (uint64_t)v81, (uint64_t)v80, v65, v66, v67, v68, v69);
    objc_msgSend_endEncoding(v23, v70, v71, v72, v73, v74, v75, v76, v77);
    int v78 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v78 = FigSignalErrorAt();
  }

  return v78;
}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = v18;
  if (v18)
  {
    objc_msgSend_setComputePipelineState_(v18, v19, (uint64_t)self->_computePipelines[1], v20, v21, v22, v23, v24, v25);
    objc_msgSend_setTexture_atIndex_(v26, v27, (uint64_t)v8, 0, v28, v29, v30, v31, v32);
    objc_msgSend_setTexture_atIndex_(v26, v33, (uint64_t)v9, 1, v34, v35, v36, v37, v38);
    unint64_t v47 = objc_msgSend_threadExecutionWidth(self->_computePipelines[1], v39, v40, v41, v42, v43, v44, v45, v46);
    unint64_t v56 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[1], v48, v49, v50, v51, v52, v53, v54, v55)
        / v47;
    v90[0] = objc_msgSend_width(v9, v57, v58, v59, v60, v61, v62, v63, v64);
    v90[1] = objc_msgSend_height(v9, v65, v66, v67, v68, v69, v70, v71, v72);
    v90[2] = 1;
    v89[0] = v47;
    v89[1] = v56;
    v89[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v73, (uint64_t)v90, (uint64_t)v89, v74, v75, v76, v77, v78);
    objc_msgSend_endEncoding(v26, v79, v80, v81, v82, v83, v84, v85, v86);
    int v87 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
  }

  return v87;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = v18;
  if (v18)
  {
    objc_msgSend_setComputePipelineState_(v18, v19, (uint64_t)self->_computePipelines[2], v20, v21, v22, v23, v24, v25);
    objc_msgSend_setTexture_atIndex_(v26, v27, (uint64_t)v8, 0, v28, v29, v30, v31, v32);
    objc_msgSend_setTexture_atIndex_(v26, v33, (uint64_t)v9, 1, v34, v35, v36, v37, v38);
    unint64_t v47 = objc_msgSend_threadExecutionWidth(self->_computePipelines[2], v39, v40, v41, v42, v43, v44, v45, v46);
    unint64_t v56 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[2], v48, v49, v50, v51, v52, v53, v54, v55)
        / v47;
    v90[0] = objc_msgSend_width(v8, v57, v58, v59, v60, v61, v62, v63, v64);
    v90[1] = objc_msgSend_height(v8, v65, v66, v67, v68, v69, v70, v71, v72);
    v90[2] = 1;
    v89[0] = v47;
    v89[1] = v56;
    v89[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v73, (uint64_t)v90, (uint64_t)v89, v74, v75, v76, v77, v78);
    objc_msgSend_endEncoding(v26, v79, v80, v81, v82, v83, v84, v85, v86);
    int v87 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
  }

  return v87;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = objc_msgSend_computeCommandEncoder(a3, v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = v18;
  if (v18)
  {
    objc_msgSend_setComputePipelineState_(v18, v19, (uint64_t)self->_computePipelines[3], v20, v21, v22, v23, v24, v25);
    objc_msgSend_setTexture_atIndex_(v26, v27, (uint64_t)v8, 0, v28, v29, v30, v31, v32);
    objc_msgSend_setTexture_atIndex_(v26, v33, (uint64_t)v9, 1, v34, v35, v36, v37, v38);
    unint64_t v47 = objc_msgSend_threadExecutionWidth(self->_computePipelines[3], v39, v40, v41, v42, v43, v44, v45, v46);
    unint64_t v56 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[3], v48, v49, v50, v51, v52, v53, v54, v55)
        / v47;
    v90[0] = objc_msgSend_width(v8, v57, v58, v59, v60, v61, v62, v63, v64);
    v90[1] = objc_msgSend_height(v8, v65, v66, v67, v68, v69, v70, v71, v72);
    v90[2] = 1;
    v89[0] = v47;
    v89[1] = v56;
    v89[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v73, (uint64_t)v90, (uint64_t)v89, v74, v75, v76, v77, v78);
    objc_msgSend_endEncoding(v26, v79, v80, v81, v82, v83, v84, v85, v86);
    int v87 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
  }

  return v87;
}

- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v315 = a7;
  id v314 = a8;
  uint64_t v19 = v16;
  id v313 = a9;
  id v20 = a10;
  id v21 = a11;
  int v30 = objc_msgSend_width(v20, v22, v23, v24, v25, v26, v27, v28, v29);
  int v39 = objc_msgSend_height(v20, v31, v32, v33, v34, v35, v36, v37, v38);
  LODWORD(a7) = (v30 + LODWORD(self->_maxThreadExecutionWidth) - 1)
              / SLODWORD(self->_maxThreadExecutionWidth)
              * LODWORD(self->_maxThreadExecutionWidth);
  v329[0] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v328 = _D0;
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTKeypointDetector, v46, (uint64_t)v17, (uint64_t)v20, (uint64_t)&v328, (uint64_t)v329, v47, v48, *(float *)&_D0);
  v322[0] = v30;
  v322[1] = v39;
  uint64_t v323 = a7;
  uint64_t v324 = v328;
  uint64_t v325 = 0;
  uint64_t v45 = (const float *)v329;
  float32x2_t v49 = vld1_dup_f32(v45);
  float32x2_t v326 = v49;
  uint64_t v327 = 0;
  uint64_t v57 = objc_msgSend_computeCommandEncoder(v19, v50, v51, v52, v53, v54, v55, v56, v49.f32[0]);
  if (v57)
  {
    uint64_t v65 = v57;
    uint64_t v312 = (uint64_t)v21;
    objc_msgSend_setComputePipelineState_(v57, v58, (uint64_t)self->_computePipelines[4], v59, v60, v61, v62, v63, v64);
    objc_msgSend_setTexture_atIndex_(v65, v66, (uint64_t)v17, 0, v67, v68, v69, v70, v71);
    objc_msgSend_setTexture_atIndex_(v65, v72, (uint64_t)v18, 1, v73, v74, v75, v76, v77);
    objc_msgSend_setTexture_atIndex_(v65, v78, (uint64_t)v315, 2, v79, v80, v81, v82, v83);
    objc_msgSend_setTexture_atIndex_(v65, v84, (uint64_t)v314, 3, v85, v86, v87, v88, v89);
    objc_msgSend_setTexture_atIndex_(v65, v90, (uint64_t)v313, 4, v91, v92, v93, v94, v95);
    objc_msgSend_setBuffer_offset_atIndex_(v65, v96, (uint64_t)self->_Adiagb_buf[0], 0, 0, v97, v98, v99, v100);
    objc_msgSend_setBuffer_offset_atIndex_(v65, v101, (uint64_t)self->_Ixy_buf[0], 0, 1, v102, v103, v104, v105);
    objc_msgSend_setBuffer_offset_atIndex_(v65, v106, (uint64_t)self->_idt_buf, 0, 2, v107, v108, v109, v110);
    objc_msgSend_setBytes_length_atIndex_(v65, v111, (uint64_t)v322, 48, 3, v112, v113, v114, v115);
    unint64_t v124 = objc_msgSend_threadExecutionWidth(self->_computePipelines[4], v116, v117, v118, v119, v120, v121, v122, v123);
    unint64_t v133 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[4], v125, v126, v127, v128, v129, v130, v131, v132);
    uint64_t v134 = v39;
    v321[0] = v30;
    v321[1] = v39;
    v321[2] = 1;
    v320[0] = v124;
    v320[1] = v133 / v124;
    v320[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v65, v135, (uint64_t)v321, (uint64_t)v320, v136, v137, v138, v139, v140);
    objc_msgSend_endEncoding(v65, v141, v142, v143, v144, v145, v146, v147, v148);

    uint64_t v157 = objc_msgSend_computeCommandEncoder(v19, v149, v150, v151, v152, v153, v154, v155, v156);
    if (!v157) {
      goto LABEL_7;
    }
    char v165 = v157;
    objc_msgSend_setComputePipelineState_(v157, v158, (uint64_t)self->_computePipelines[5], v159, v160, v161, v162, v163, v164);
    objc_msgSend_setBuffer_offset_atIndex_(v165, v166, (uint64_t)self->_Adiagb_buf[0], 0, 0, v167, v168, v169, v170);
    objc_msgSend_setBuffer_offset_atIndex_(v165, v171, (uint64_t)self->_Ixy_buf[0], 0, 1, v172, v173, v174, v175);
    objc_msgSend_setBuffer_offset_atIndex_(v165, v176, (uint64_t)self->_Adiagb_buf[1], 0, 2, v177, v178, v179, v180);
    objc_msgSend_setBuffer_offset_atIndex_(v165, v181, (uint64_t)self->_Ixy_buf[1], 0, 3, v182, v183, v184, v185);
    objc_msgSend_setBytes_length_atIndex_(v165, v186, (uint64_t)v322, 48, 4, v187, v188, v189, v190);
    unint64_t v199 = objc_msgSend_threadExecutionWidth(self->_computePipelines[5], v191, v192, v193, v194, v195, v196, v197, v198);
    unint64_t v208 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[5], v200, v201, v202, v203, v204, v205, v206, v207);
    v319[0] = v30;
    v319[1] = v134;
    v319[2] = 1;
    v318[0] = v199;
    v318[1] = v208 / v199;
    v318[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v165, v209, (uint64_t)v319, (uint64_t)v318, v210, v211, v212, v213, v214);
    objc_msgSend_endEncoding(v165, v215, v216, v217, v218, v219, v220, v221, v222);

    uint64_t v231 = objc_msgSend_computeCommandEncoder(v19, v223, v224, v225, v226, v227, v228, v229, v230);
    if (v231)
    {
      v239 = v231;
      objc_msgSend_setComputePipelineState_(v231, v232, (uint64_t)self->_computePipelines[6], v233, v234, v235, v236, v237, v238);
      objc_msgSend_setBuffer_offset_atIndex_(v239, v240, (uint64_t)self->_Adiagb_buf[1], 0, 0, v241, v242, v243, v244);
      objc_msgSend_setBuffer_offset_atIndex_(v239, v245, (uint64_t)self->_Ixy_buf[1], 0, 1, v246, v247, v248, v249);
      objc_msgSend_setBuffer_offset_atIndex_(v239, v250, (uint64_t)self->_idt_buf, 0, 2, v251, v252, v253, v254);
      objc_msgSend_setTexture_atIndex_(v239, v255, (uint64_t)v17, 0, v256, v257, v258, v259, v260);
      objc_msgSend_setTexture_atIndex_(v239, v261, (uint64_t)v20, 1, v262, v263, v264, v265, v266);
      objc_msgSend_setTexture_atIndex_(v239, v267, v312, 2, v268, v269, v270, v271, v272);
      objc_msgSend_setBytes_length_atIndex_(v239, v273, (uint64_t)v322, 48, 3, v274, v275, v276, v277);
      unint64_t v286 = objc_msgSend_threadExecutionWidth(self->_computePipelines[6], v278, v279, v280, v281, v282, v283, v284, v285);
      unint64_t v295 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[6], v287, v288, v289, v290, v291, v292, v293, v294);
      v317[0] = v30;
      v317[1] = v134;
      id v21 = (id)v312;
      v317[2] = 1;
      v316[0] = v286;
      v316[1] = v295 / v286;
      v316[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v239, v296, (uint64_t)v317, (uint64_t)v316, v297, v298, v299, v300, v301);
      objc_msgSend_endEncoding(v239, v302, v303, v304, v305, v306, v307, v308, v309);

      int v310 = 0;
    }
    else
    {
LABEL_7:
      FigDebugAssert3();
      int v310 = FigSignalErrorAt();
      id v21 = (id)v312;
    }
  }
  else
  {
    FigDebugAssert3();
    int v310 = FigSignalErrorAt();
  }

  return v310;
}

- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  LODWORD(a3) = objc_msgSend_width(v12, v14, v15, v16, v17, v18, v19, v20, v21);
  int v30 = objc_msgSend_height(v12, v22, v23, v24, v25, v26, v27, v28, v29);
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v145 = _D0;
  uint64_t v146 = _D0;
  int v143 = 1065353216;
  int v144 = 1065353216;
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTKeypointDetector, v37, (uint64_t)v10, (uint64_t)v12, (uint64_t)&v146, (uint64_t)&v144, v38, v39, *(float *)&_D0);
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTKeypointDetector, v41, (uint64_t)v11, (uint64_t)v12, (uint64_t)&v145, (uint64_t)&v143, v42, v43, v44);
  uint64_t v138 = 0;
  v137[0] = a3;
  v137[1] = v30;
  uint64_t v139 = v146;
  uint64_t v140 = v145;
  uint64_t v36 = (const float *)&v144;
  float32x2_t v45 = vld1_dup_f32(v36);
  uint64_t v40 = (const float *)&v143;
  float32x2_t v46 = vld1_dup_f32(v40);
  float32x2_t v141 = v45;
  float32x2_t v142 = v46;
  uint64_t v54 = objc_msgSend_computeCommandEncoder(v13, v47, v48, v49, v50, v51, v52, v53, v45.f32[0]);

  if (v54)
  {
    objc_msgSend_setComputePipelineState_(v54, v55, (uint64_t)self->_computePipelines[7], v56, v57, v58, v59, v60, v61);
    objc_msgSend_setTexture_atIndex_(v54, v62, (uint64_t)v10, 0, v63, v64, v65, v66, v67);
    objc_msgSend_setTexture_atIndex_(v54, v68, (uint64_t)v11, 1, v69, v70, v71, v72, v73);
    objc_msgSend_setTexture_atIndex_(v54, v74, (uint64_t)v12, 2, v75, v76, v77, v78, v79);
    objc_msgSend_setBytes_length_atIndex_(v54, v80, (uint64_t)v137, 48, 0, v81, v82, v83, v84);
    unint64_t v93 = objc_msgSend_threadExecutionWidth(self->_computePipelines[7], v85, v86, v87, v88, v89, v90, v91, v92);
    unint64_t v102 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[7], v94, v95, v96, v97, v98, v99, v100, v101)/ v93;
    v136[0] = objc_msgSend_width(v12, v103, v104, v105, v106, v107, v108, v109, v110);
    v136[1] = objc_msgSend_height(v12, v111, v112, v113, v114, v115, v116, v117, v118);
    v136[2] = 1;
    v135[0] = v93;
    v135[1] = v102;
    v135[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v54, v119, (uint64_t)v136, (uint64_t)v135, v120, v121, v122, v123, v124);
    objc_msgSend_endEncoding(v54, v125, v126, v127, v128, v129, v130, v131, v132);
    int v133 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v133 = FigSignalErrorAt();
  }

  return v133;
}

- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 in_conf_fwd_tex:(id)a6 in_conf_bwd_tex:(id)a7 out_kpt_buf:(id)a8 out_kpt_conf:(id)a9 block_size:(int)a10 bidirectional_error:(float)a11 confidence_radial_weight:(float)a12 confidence_minimum:(float)a13 out_num_keypoints:(unsigned __int16 *)a14
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v22 = a4;
  id v143 = a5;
  id v142 = a6;
  id v23 = a7;
  id v24 = a8;
  uint64_t v25 = (uint64_t)v22;
  id v141 = a9;
  id v26 = a3;
  int v35 = (int)objc_msgSend_width(v22, v27, v28, v29, v30, v31, v32, v33, v34) / a10;
  uint64_t v152 = 0;
  int v146 = a10;
  __int16 v147 = v35;
  int v44 = (int)objc_msgSend_height(v22, v36, v37, v38, v39, v40, v41, v42, v43) / a10;
  __int16 v148 = v44;
  float v149 = a11;
  float v150 = a12;
  uint64_t v151 = LODWORD(a13);
  uint64_t v53 = objc_msgSend_computeCommandEncoder(v26, v45, v46, v47, v48, v49, v50, v51, v52);

  if (!v53)
  {
    FigDebugAssert3();
    int v137 = FigSignalErrorAt();
    uint64_t v68 = v22;
    uint64_t v69 = v143;
    float v61 = v24;
LABEL_7:
    uint64_t v94 = v141;
    uint64_t v76 = v142;
    goto LABEL_4;
  }
  float v61 = v24;
  if (v44 * v35 > 0x8000)
  {
    int v137 = -12780;
    uint64_t v68 = (void *)v25;
    uint64_t v69 = v143;
    goto LABEL_7;
  }
  unsigned __int16 v139 = v44 * v35;
  objc_msgSend_setComputePipelineState_(v53, v54, (uint64_t)self->_computePipelines[8], v55, v56, v57, v58, v59, v60);
  objc_msgSend_setTexture_atIndex_(v53, v62, v25, 0, v63, v64, v65, v66, v67);
  uint64_t v68 = (void *)v25;
  uint64_t v69 = v143;
  objc_msgSend_setTexture_atIndex_(v53, v70, (uint64_t)v143, 1, v71, v72, v73, v74, v75);
  uint64_t v76 = v142;
  objc_msgSend_setTexture_atIndex_(v53, v77, (uint64_t)v142, 2, v78, v79, v80, v81, v82);
  objc_msgSend_setTexture_atIndex_(v53, v83, (uint64_t)v23, 3, v84, v85, v86, v87, v88);
  objc_msgSend_setBuffer_offset_atIndex_(v53, v89, (uint64_t)v61, 0, 0, v90, v91, v92, v93);
  uint64_t v94 = v141;
  objc_msgSend_setBuffer_offset_atIndex_(v53, v95, (uint64_t)v141, 0, 1, v96, v97, v98, v99);
  objc_msgSend_setBytes_length_atIndex_(v53, v100, (uint64_t)&v146, 32, 2, v101, v102, v103, v104);
  unint64_t v113 = objc_msgSend_threadExecutionWidth(self->_computePipelines[8], v105, v106, v107, v108, v109, v110, v111, v112);
  unint64_t v122 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[8], v114, v115, v116, v117, v118, v119, v120, v121);
  v145[0] = v35;
  v145[1] = v44;
  v145[2] = 1;
  v144[0] = v113;
  v144[1] = v122 / v113;
  v144[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v53, v123, (uint64_t)v145, (uint64_t)v144, v124, v125, v126, v127, v128);
  objc_msgSend_endEncoding(v53, v129, v130, v131, v132, v133, v134, v135, v136);
  int v137 = 0;
  *a14 = v139;
LABEL_4:

  return v137;
}

+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4
{
  id v6 = v5;
  int v7 = v4;
  id v86 = a3;
  id v9 = a4;
  float v18 = (float)(unint64_t)objc_msgSend_width(v9, v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v27 = objc_msgSend_width(v86, v19, v20, v21, v22, v23, v24, v25, v26);
  float v28 = v18 / (float)(unint64_t)v27;
  uint64_t v36 = objc_msgSend_height(v9, v29, v30, v31, v32, v33, v34, v35, (float)(unint64_t)v27);
  *(float *)&double v52 = (float)(unint64_t)v36
                 / (float)(unint64_t)objc_msgSend_height(v86, v37, v38, v39, v40, v41, v42, v43, v44);
  if (v28 <= 1.5 || *(float *)&v52 <= 1.5)
  {
    uint64_t v54 = objc_msgSend_width(v9, v45, v46, v47, v48, v49, v50, v51, 1.5, v52);
    if (v54 != objc_msgSend_width(v86, v55, v56, v57, v58, v59, v60, v61, v62)
      || (uint64_t v71 = objc_msgSend_height(v9, v63, v64, v65, v66, v67, v68, v69, v70),
          v71 != objc_msgSend_height(v86, v72, v73, v74, v75, v76, v77, v78, v79)))
    {
      sub_262EE6E3C();
    }
    __asm { FMOV            V0.2S, #1.0 }
    float v85 = 1.0;
  }
  else
  {
    _D0 = 0x3F0000003F000000;
    float v85 = 2.0;
  }
  *id v6 = v85;
  *int v7 = _D0;
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

- (int)lastScale
{
  return self->_lastScale;
}

- (int)nwarpings
{
  return self->_nwarpings;
}

- (void)setNwarpings:(int)a3
{
  self->_int nwarpings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kpt_confidence, 0);
  objc_storeStrong((id *)&self->_kpt_buf, 0);
  objc_storeStrong((id *)&self->_conf_bwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_conf_fwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_uv_bwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_uv_fwd_tex_user_ref, 0);
  for (uint64_t i = 0; i != -10; --i)
    objc_storeStrong((id *)&self->_conf_bwd_tex[i + 9], 0);
  for (uint64_t j = 0; j != -10; --j)
    objc_storeStrong((id *)&self->_conf_fwd_tex[j + 9], 0);
  for (uint64_t k = 0; k != -20; --k)
    objc_storeStrong((id *)&self->_uv_bwd_tex[1][k + 9], 0);
  for (uint64_t m = 0; m != -20; --m)
    objc_storeStrong((id *)&self->_uv_fwd_tex[1][m + 9], 0);
  objc_storeStrong((id *)&self->_idt_buf, 0);
  for (uint64_t n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_Ixy_buf[n + 1], 0);
  for (iuint64_t i = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_Adiagb_buf[ii + 1], 0);
  for (juint64_t j = 0; jj != -10; --jj)
    objc_storeStrong((id *)&self->_C1_tex[jj + 9], 0);
  for (kuint64_t k = 0; kk != -10; --kk)
    objc_storeStrong((id *)&self->_C0_tex[kk + 9], 0);
  for (muint64_t m = 0; mm != -10; --mm)
    objc_storeStrong((id *)&self->_G1_tex[mm + 9], 0);
  for (nuint64_t n = 0; nn != -10; --nn)
    objc_storeStrong((id *)&self->_G0_tex[nn + 9], 0);
  for (uint64_t i1 = 0; i1 != -20; --i1)
    objc_storeStrong((id *)&self->_I_tex[1][i1 + 9], 0);
  for (uint64_t i2 = 88; i2 != 16; i2 -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i2), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end