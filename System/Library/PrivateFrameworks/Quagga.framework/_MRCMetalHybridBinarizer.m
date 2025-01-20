@interface _MRCMetalHybridBinarizer
- (_MRCMetalHybridBinarizer)init;
- (_MRCMetalHybridBinarizer)initWithMetalContext:(id)a3 error:(id *)a4;
- (id)newTextureByBinarizingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
@end

@implementation _MRCMetalHybridBinarizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdPipelineState, 0);
  objc_storeStrong((id *)&self->_fixBlackPointsPipelineState, 0);
  objc_storeStrong((id *)&self->_calcuateBlackPointsPipelineState, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (id)newTextureByBinarizingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType != 875704422 && PixelFormatType != 1278226488 && PixelFormatType != 875704438) {
    return 0;
  }
  if (CVPixelBufferIsPlanar(a3))
  {
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  }
  else
  {
    size_t WidthOfPlane = CVPixelBufferGetWidth(a3);
    size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
  }
  size_t v9 = HeightOfPlane;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface) {
    return 0;
  }
  v13 = objc_msgSend_newTextureByBindingIOSurface_pixelFormat_width_height_usage_plane_error_(self->_metalContext, v11, (uint64_t)IOSurface, 13, WidthOfPlane, v9, 1, 0, 0);
  if (v13)
  {
    unint64_t v14 = (WidthOfPlane + 7) >> 3;
    unint64_t v15 = (v9 + 7) >> 3;
    v16 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v12, 13, v14, v15, 0);
    v18 = v16;
    if (v16)
    {
      objc_msgSend_setUsage_(v16, v17, 3);
      v21 = objc_msgSend_device(self->_metalContext, v19, v20);
      v23 = objc_msgSend_newTextureWithDescriptor_(v21, v22, (uint64_t)v18);

      if (v23)
      {
        v26 = objc_msgSend_device(self->_metalContext, v24, v25);
        v28 = objc_msgSend_newTextureWithDescriptor_(v26, v27, (uint64_t)v18);

        if (v28)
        {
          v30 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v29, 13, v14, v9, 0);
          v32 = v30;
          if (v30)
          {
            objc_msgSend_setUsage_(v30, v31, 2);
            v35 = objc_msgSend_device(self->_metalContext, v33, v34);
            v37 = objc_msgSend_newTextureWithDescriptor_(v35, v36, (uint64_t)v32);

            if (v37)
            {
              v40 = objc_msgSend_beginCommandBuffer(self->_metalContext, v38, v39);
              v43 = v40;
              if (v40)
              {
                uint64_t v44 = objc_msgSend_computeCommandEncoder(v40, v41, v42);
                v47 = v43;
                if (v44)
                {
                  v48 = (void *)v44;
                  v117 = v37;
                  v120 = v47;
                  unint64_t v118 = objc_msgSend_threadExecutionWidth(self->_calcuateBlackPointsPipelineState, v45, v46);
                  unint64_t v51 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_calcuateBlackPointsPipelineState, v49, v50);
                  unint64_t v54 = v51 / objc_msgSend_threadExecutionWidth(self->_calcuateBlackPointsPipelineState, v52, v53);
                  unint64_t v115 = v15 - 1;
                  objc_msgSend_setComputePipelineState_(v48, v55, (uint64_t)self->_calcuateBlackPointsPipelineState);
                  objc_msgSend_setTexture_atIndex_(v48, v56, (uint64_t)v13, 0);
                  objc_msgSend_setTexture_atIndex_(v48, v57, (uint64_t)v23, 1);
                  *(void *)&long long buf = (v14 - 1 + v118) / v118;
                  *((void *)&buf + 1) = (v15 - 1 + v54) / v54;
                  uint64_t v125 = 1;
                  unint64_t v121 = v118;
                  unint64_t v122 = v54;
                  uint64_t v123 = 1;
                  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v48, v58, (uint64_t)&buf, &v121);
                  objc_msgSend_endEncoding(v48, v59, v60);

                  uint64_t v63 = objc_msgSend_computeCommandEncoder(v120, v61, v62);
                  if (v63)
                  {
                    v66 = (void *)v63;
                    unint64_t v67 = objc_msgSend_threadExecutionWidth(self->_fixBlackPointsPipelineState, v64, v65);
                    unint64_t v70 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_fixBlackPointsPipelineState, v68, v69);
                    unint64_t v73 = v70 / objc_msgSend_threadExecutionWidth(self->_fixBlackPointsPipelineState, v71, v72);
                    objc_msgSend_setComputePipelineState_(v66, v74, (uint64_t)self->_fixBlackPointsPipelineState);
                    objc_msgSend_setTexture_atIndex_(v66, v75, (uint64_t)v23, 0);
                    objc_msgSend_setTexture_atIndex_(v66, v76, (uint64_t)v28, 1);
                    *(void *)&long long buf = (v14 - 1 + v67) / v67;
                    *((void *)&buf + 1) = (v115 + v73) / v73;
                    uint64_t v125 = 1;
                    unint64_t v121 = v67;
                    unint64_t v122 = v73;
                    uint64_t v123 = 1;
                    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v66, v77, (uint64_t)&buf, &v121);
                    objc_msgSend_endEncoding(v66, v78, v79);

                    v43 = v120;
                    uint64_t v82 = objc_msgSend_computeCommandEncoder(v120, v80, v81);
                    if (v82)
                    {
                      v85 = (void *)v82;
                      unint64_t v86 = objc_msgSend_threadExecutionWidth(self->_thresholdPipelineState, v83, v84);
                      unint64_t v89 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_thresholdPipelineState, v87, v88);
                      unint64_t v92 = v89 / objc_msgSend_threadExecutionWidth(self->_thresholdPipelineState, v90, v91);
                      unint64_t v119 = (v86 + objc_msgSend_width(v117, v93, v94) - 1) / v86;
                      unint64_t v116 = (v92 + objc_msgSend_height(v117, v95, v96) - 1) / v92;
                      objc_msgSend_setComputePipelineState_(v85, v97, (uint64_t)self->_thresholdPipelineState);
                      objc_msgSend_setTexture_atIndex_(v85, v98, (uint64_t)v13, 0);
                      objc_msgSend_setTexture_atIndex_(v85, v99, (uint64_t)v28, 1);
                      objc_msgSend_setTexture_atIndex_(v85, v100, (uint64_t)v117, 2);
                      *(void *)&long long buf = v119;
                      *((void *)&buf + 1) = v116;
                      uint64_t v125 = 1;
                      unint64_t v121 = v86;
                      unint64_t v122 = v92;
                      uint64_t v123 = 1;
                      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v85, v101, (uint64_t)&buf, &v121);
                      objc_msgSend_endEncoding(v85, v102, v103);

                      objc_msgSend_commitCommandBufferShouldWaitUntilCompleted_(self->_metalContext, v104, 1);
                      if (qword_1EAA94C90 != -1) {
                        dispatch_once(&qword_1EAA94C90, &unk_1F3662488);
                      }
                      v105 = (id)qword_1EAA94C88;
                      v37 = v117;
                      v43 = v120;
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend_GPUEndTime(v120, v106, v107);
                        double v111 = v110;
                        objc_msgSend_GPUStartTime(v120, v112, v113);
                        LODWORD(buf) = 134349056;
                        *(double *)((char *)&buf + 4) = v111 - v114;
                        _os_log_debug_impl(&dword_1DC2FE000, v105, OS_LOG_TYPE_DEBUG, "elapsedTime: %{public}.6f", (uint8_t *)&buf, 0xCu);
                      }

                      id v108 = v117;
                    }
                    else
                    {
                      id v108 = 0;
                      v37 = v117;
                    }
                  }
                  else
                  {
                    id v108 = 0;
                    v37 = v117;
                    v43 = v120;
                  }
                }
                else
                {
                  id v108 = 0;
                }
              }
              else
              {
                id v108 = 0;
              }
            }
            else
            {
              id v108 = 0;
            }
          }
          else
          {
            id v108 = 0;
          }
        }
        else
        {
          id v108 = 0;
        }
      }
      else
      {
        id v108 = 0;
      }
    }
    else
    {
      id v108 = 0;
    }
  }
  else
  {
    id v108 = 0;
  }

  return v108;
}

- (_MRCMetalHybridBinarizer)initWithMetalContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_MRCMetalHybridBinarizer;
  v7 = [(_MRCMetalHybridBinarizer *)&v24 init];
  if (!v7) {
    goto LABEL_9;
  }
  if (v6)
  {
    v8 = (_MRCMetalContext *)v6;
  }
  else
  {
    size_t v9 = [_MRCMetalContext alloc];
    v8 = (_MRCMetalContext *)objc_msgSend_initWithDevice_libraryURL_error_(v9, v10, 0, 0, a4);
  }
  metalContext = v7->_metalContext;
  v7->_metalContext = v8;

  v13 = v7->_metalContext;
  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_error_(v13, v12, @"_MRCMetalHybridBinarizer_calculateBlackPoints", 0, a4);
  calcuateBlackPointsPipelineState = v7->_calcuateBlackPointsPipelineState;
  v7->_calcuateBlackPointsPipelineState = (MTLComputePipelineState *)v14;

  if (!v7->_calcuateBlackPointsPipelineState) {
    goto LABEL_10;
  }
  uint64_t v17 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_error_(v7->_metalContext, v16, @"_MRCMetalHybridBinarizer_fixBlackPoints", 0, a4);
  fixBlackPointsPipelineState = v7->_fixBlackPointsPipelineState;
  v7->_fixBlackPointsPipelineState = (MTLComputePipelineState *)v17;

  if (!v7->_fixBlackPointsPipelineState) {
    goto LABEL_10;
  }
  uint64_t v20 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_error_(v7->_metalContext, v19, @"_MRCMetalHybridBinarizer_threshold", 0, a4);
  thresholdPipelineState = v7->_thresholdPipelineState;
  v7->_thresholdPipelineState = (MTLComputePipelineState *)v20;

  if (v7->_thresholdPipelineState) {
LABEL_9:
  }
    v22 = v7;
  else {
LABEL_10:
  }
    v22 = 0;

  return v22;
}

- (_MRCMetalHybridBinarizer)init
{
  result = (_MRCMetalHybridBinarizer *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

@end